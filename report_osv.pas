unit report_osv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, Vcl.Buttons,
  Vcl.ExtCtrls, DateUtils, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  MemTableDataEh, Data.DB, MemTableEh, Data.Win.ADODB, comObj, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, DBCtrlsEh;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataInit;
  end;

var
  fmReport_Osv: TfmReport_Osv;

implementation
uses report_osv_acc;
{$R *.dfm}
var
fmReportOsv_Acc :TfmReportOsv_Acc;
procedure TfmReport_Osv.DataInit;
begin
  DBGridEh1.Visible := false;
  Screen.Cursor:=crSQLWait;
  Application.ProcessMessages;
  MemTableEh.ReadOnly :=false;
  quSaldo.Close;
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

  quSaldo.Close;
end;

procedure TfmReport_Osv.DateEdit1Change(Sender: TObject);
begin
  DataInit;
end;

procedure TfmReport_Osv.DBGridEh1DblClick(Sender: TObject);
begin
    fmReportOsv_Acc := TfmReportOsv_Acc.Create(Self);
end;

procedure TfmReport_Osv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmReport_Osv.FormCreate(Sender: TObject);
begin
  DateEdit1.OnChange := nil;
  DateEdit2.OnChange := nil;
  DateEdit1.Value:=StartOfTheMonth(Now);
  DateEdit2.Value:=EndOfTheMonth(Now);
  DateEdit1.OnChange := DateEdit1Change;
  DateEdit2.OnChange := DateEdit1Change;
end;

procedure TfmReport_Osv.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled :=false;
   DataInit;
end;

end.
