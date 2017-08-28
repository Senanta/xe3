unit report_osv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, Vcl.Buttons,
  Vcl.ExtCtrls, DateUtils, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  MemTableDataEh, Data.DB, MemTableEh, Data.Win.ADODB, comObj, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh;

type
  TfmReport_Osv = class(TForm)
    panelTop: TPanel;
    panelMiddle: TPanel;
    panelBottom: TPanel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    DBGridEh1: TDBGridEh;
    quSaldo: TADOQuery;
    MemTableEh: TMemTableEh;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataInit;
  end;

var
  fmReport_Osv: TfmReport_Osv;

implementation

{$R *.dfm}

procedure TfmReport_Osv.BitBtn1Click(Sender: TObject);
begin
 DataInit;
end;

procedure TfmReport_Osv.DataInit;
begin
  DBGridEh1.Visible := false;
  Screen.Cursor:=crSQLWait;
  Application.ProcessMessages;
  MemTableEh.ReadOnly :=false;
  quSaldo.Close;
  //Обороты Дебет Кредит
  quSaldo.Parameters.ParamByName('d1').Value := DateEdit1.Date;
  quSaldo.Parameters.ParamByName('d2').Value := DateEdit2.Date;
  quSaldo.Parameters.ParamByName('d3').Value := DateEdit1.Date;
  quSaldo.Parameters.ParamByName('d4').Value := DateEdit2.Date;
  //Остаток на первую дату
  quSaldo.Parameters.ParamByName('d5').Value := DateEdit1.Date;
  quSaldo.Parameters.ParamByName('d6').Value := DateEdit1.Date;
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
  Caption := 'Оборотно-сальдовая ведомость(' + DateToStr(DateEdit1.Date) + '-' + DateToStr(DateEdit2.Date)+')';

  quSaldo.Close;
end;

procedure TfmReport_Osv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmReport_Osv.FormShow(Sender: TObject);
begin
  DateEdit1.Date:=StartOfTheMonth(Now);
  DateEdit2.Date:=EndOfTheMonth(Now);
end;

end.
