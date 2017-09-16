unit report_osv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, Vcl.Buttons,
  Vcl.ExtCtrls, DateUtils, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  MemTableDataEh, Data.DB, MemTableEh, Data.Win.ADODB, comObj, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, DBCtrlsEh, Vcl.ComCtrls, Vcl.Menus;

type
  TfmReport_Osv = class(TForm)
    panelTop: TPanel;
    panelMiddle: TPanel;
    panelBottom: TPanel;
    DBGridEh1: TDBGridEh;
    quSaldo: TADOQuery;
    MemTableEh: TMemTableEh;
    DataSource1: TDataSource;
    lblBetween: TLabel;
    DateEdit1: TDBDateTimeEditEh;
    bvl1: TBevel;
    DateEdit2: TDBDateTimeEditEh;
    Timer1: TTimer;
    lbTime: TLabel;
    pm1: TPopupMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
  private
    { Private declarations }
    FTabSheet :TTabSheet; //Закладка на bottom_panel
  public
    { Public declarations }
        property TabSheet: TTabSheet read FTabSheet write FTabSheet;
    procedure DataInit;
  end;

var
  fmReport_Osv: TfmReport_Osv;
  RTimeSQL :double;
implementation
uses report_osv_acc, bottom_panel,data_module_sql;
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

var
fmReportOsv_Acc :TfmReportOsv_Acc;

procedure TfmReport_Osv.DataInit;
begin
  DBGridEh1.Visible := false;
  Screen.Cursor:=crSQLWait;
  Application.ProcessMessages;
  MemTableEh.ReadOnly :=false;
  quSaldo.Close;
  TimeSql(true);
  //Обороты Дебет Кредит
  quSaldo.Parameters.ParamByName('d1').Value := DateEdit1.Value;
  quSaldo.Parameters.ParamByName('d2').Value := DateEdit2.Value;
  quSaldo.Parameters.ParamByName('d3').Value := DateEdit1.Value;
  quSaldo.Parameters.ParamByName('d4').Value := DateEdit2.Value;
  //Остаток на первую дату
  quSaldo.Parameters.ParamByName('d5').Value := DateEdit1.Value;
  quSaldo.Parameters.ParamByName('d6').Value := DateEdit1.Value;
 try
        try
         quSaldo.Open;
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
  Application.ProcessMessages;
  MemTableEh.LoadFromDataSet(quSaldo, -1, lmCopy, false);

  while not MemTableEh.Eof do
   begin
     if MemTableEh.FieldByName('dt_ost1').AsCurrency < 0 then
      begin
       MemTableEh.Edit;
       MemTableEh.FieldByName('kt_ost1').AsCurrency := MemTableEh.FieldByName('dt_ost1').AsCurrency*-1;
       MemTableEh.FieldByName('dt_ost1').AsCurrency := 0.0;
       MemTableEh.Post;
      end;
     if MemTableEh.FieldByName('dt_ost2').AsCurrency < 0 then
      begin
       MemTableEh.Edit;
       MemTableEh.FieldByName('kt_ost2').AsCurrency := MemTableEh.FieldByName('dt_ost2').AsCurrency*-1;
       MemTableEh.FieldByName('dt_ost2').AsCurrency := 0.0;
       MemTableEh.Post;
      end;

     MemTableEh.Next;
   end;
  MemTableEh.First;
  MemTableEh.ReadOnly :=true;
  DBGridEh1.Visible := true;
  Caption := 'Оборотно-сальдовая ведомость(' + DateToStr(DateEdit1.Value) + '-' + DateToStr(DateEdit2.Value)+')';
  ShowTab(TabSheet, 'ОСВ:(' + DateToStr(DateEdit1.Value) + '-' + DateToStr(DateEdit2.Value)+')');
  quSaldo.Close;
end;

procedure TfmReport_Osv.DateEdit1Change(Sender: TObject);
begin
  DataInit;
end;

procedure TfmReport_Osv.FormActivate(Sender: TObject);
begin
 ActivateTab(FTabSheet);
end;

procedure TfmReport_Osv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmReport_Osv.FormCreate(Sender: TObject);
begin
  DateEdit1.OnChange := nil;
  DateEdit2.OnChange := nil;
  DateEdit1.Value:=IncMonth(StartOfTheMonth(Now),-1);
  DateEdit2.Value:=EndOfTheMonth(DateEdit1.Value);
  DateEdit1.OnChange := DateEdit1Change;
  DateEdit2.OnChange := DateEdit1Change;
  FTabSheet :=AddTab(Self);
end;

procedure TfmReport_Osv.N1Click(Sender: TObject);
begin
 fmReportOsv_Acc := TfmReportOsv_Acc.Create(Self);
 Application.ProcessMessages;
end;

procedure TfmReport_Osv.pm1Popup(Sender: TObject);
begin
 N1.Enabled := not MemTableEh.IsEmpty;
end;

procedure TfmReport_Osv.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled :=false;
   DataInit;
end;

end.
