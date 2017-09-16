unit report_osv_acc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, RxToolEdit,
  Vcl.ExtCtrls, RxCtrls, RxLookup, MemTableDataEh, Data.DB, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, MemTableEh,
  Data.Win.ADODB,comObj,DateUtils, DBCtrlsEh, DBLookupEh, report_osv, Vcl.ComCtrls,
  Vcl.Menus, DBGridEhImpExp,EhLibMTE;

type
  TfmReportOsv_Acc = class(TForm)
    pnlTop: TPanel;
    bvl1: TBevel;
    pnlMiddle: TPanel;
    pnlBottom: TPanel;
    quSaldo: TADOQuery;
    MemTableEh: TMemTableEh;
    ds1: TDataSource;
    DBGridEh1: TDBGridEh;
    quAcc: TADOQuery;
    DataSource1: TDataSource;
    Timer1: TTimer;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    lbAcc: TLabel;
    DateEdit1: TDBDateTimeEditEh;
    DateEdit2: TDBDateTimeEditEh;
    lblBetween: TLabel;
    lbTime: TLabel;
    pm1: TPopupMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
  private
    { Private declarations }
        FTabSheet :TTabSheet; //Закладка на bottom_panel
  public
    { Public declarations }
    property TabSheet: TTabSheet read FTabSheet write FTabSheet;
    procedure DataInit;
  end;

var
  fmReportOsv_Acc: TfmReportOsv_Acc;
  RTimeSQL :double;
implementation
uses bottom_panel;
{$R *.dfm}
function TimeSql(start :Boolean) :Double;
begin
  if start then
  begin
    RTimeSql :=GetTickCount;
  end
  else
  begin
    RTimeSql :=GetTickCount - RTimeSql;
  end;
  result :=RTimeSql;
end;

procedure TfmReportOsv_Acc.FormActivate(Sender: TObject);
begin
  ActivateTab(FTabSheet);
end;

procedure TfmReportOsv_Acc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=caFree;
end;

procedure TfmReportOsv_Acc.FormCreate(Sender: TObject);
begin
  quAcc.Close;
  quAcc.Open;

  FTabSheet :=AddTab(Self);
  DateEdit1.OnChange := nil;
  DateEdit2.OnChange := nil;
  DBLookupComboboxEh1.OnChange :=nil;
  DBLookupComboboxEh1.KeyValue:='       281';
  if Owner is TfmReport_Osv then
    begin
      DateEdit1.Value:=(Owner as TfmReport_Osv).DateEdit1.Value;
      DateEdit2.Value:=(Owner as TfmReport_Osv).DateEdit2.Value;
      DBLookupComboboxEh1.KeyValue:=(Owner as TfmReport_Osv).MemTableEh.FieldByName('Acc').AsString;
    end
  else
   begin
    DateEdit1.Value:=IncMonth(StartOfTheMonth(Now),-1);
    DateEdit2.Value:=EndOfTheMonth(DateEdit1.Value);
   end;
  DateEdit1.OnChange := DateEdit1Change;
  DateEdit2.OnChange := DateEdit1Change;
  DBLookupComboboxEh1.OnChange :=DBLookupComboboxEh1Change;
end;

procedure TfmReportOsv_Acc.N1Click(Sender: TObject);
begin
  ExportDBGridEhToOleExcel(DBGridEh1, [], False);
end;

procedure TfmReportOsv_Acc.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled :=false;
 DataInit;
end;

procedure TfmReportOsv_Acc.DataInit;
begin
   DBGridEh1.Visible := false;
  Screen.Cursor:=crSQLWait;
  Application.ProcessMessages;
  MemTableEh.ReadOnly :=false;
  TimeSql(true);
  quSaldo.Close;
  quSaldo.Parameters.ParamByName('acc1').Value :=  DBLookupComboboxEh1.KeyValue;
  quSaldo.Parameters.ParamByName('acc2').Value :=  DBLookupComboboxEh1.KeyValue;
  quSaldo.Parameters.ParamByName('acc3').Value :=  DBLookupComboboxEh1.KeyValue;
  quSaldo.Parameters.ParamByName('acc4').Value :=  DBLookupComboboxEh1.KeyValue;
  quSaldo.Parameters.ParamByName('acc5').Value :=  DBLookupComboboxEh1.KeyValue;
  quSaldo.Parameters.ParamByName('acc6').Value :=  DBLookupComboboxEh1.KeyValue;
  quSaldo.Parameters.ParamByName('d1').Value := DateEdit1.Value;
  quSaldo.Parameters.ParamByName('d2').Value := DateEdit2.Value;

 try
        try
         quSaldo.Open;
         Application.ProcessMessages;
         MemTableEh.LoadFromDataSet(quSaldo, -1, lmCopy, false);

         lbTime.Caption :='данные получены:' + FloatToStr(TimeSql(false)/1000) + ' сек.';
         lbTime.Visible := True;
            except
         on E :EOleException do
           begin
            ShowMessage(E.ClassName+' : Попытка открыть запрос quSaldo завершилась неудачно '+E.Message);
           end;
         on E : Exception do
           begin
            ShowMessage(E.ClassName+' произошла ошибка, с сообщением : '+E.Message);
           end;
         end;
  finally
    Screen.Cursor:=crDefault;
    TimeSql(false);
 end;
  MemTableEh.First;
  MemTableEh.ReadOnly :=true;
  DBGridEh1.Visible := true;
  Caption := 'Оборотно-сальдовая ведомость по счету:' +DBLookupComboboxEh1.KeyValue+'(' + DateToStr(DateEdit1.Value) + '-' + DateToStr(DateEdit2.Value)+')';
  ShowTab(TabSheet, 'ОСВ: счет'+DBLookupComboboxEh1.KeyValue);
  quSaldo.Close;
end;
procedure TfmReportOsv_Acc.DateEdit1Change(Sender: TObject);
begin
  DataInit;
end;

procedure TfmReportOsv_Acc.DBGridEh1SortMarkingChanged(Sender: TObject);
var
  i:Integer;
  s:String;
begin
  s := '';
  for i := 0 to DBGridEh1.SortMarkedColumns.Count-1 do
   if DBGridEh1.SortMarkedColumns[i].Title.SortMarker = smUpEh then
    begin
     s := s + DBGridEh1.SortMarkedColumns[i].FieldName + ' DESC, ';
    end
   else
    begin
     s := s + DBGridEh1.SortMarkedColumns[i].FieldName + ', ';
    end;
  if s <> '' then s := Copy(s,1,Length(s)-2); // Отсекаем последние ', '
  MemTableEh.SortByFields(s);
end;

procedure TfmReportOsv_Acc.DBLookupComboboxEh1Change(Sender: TObject);
begin
  DataInit;
end;

end.
