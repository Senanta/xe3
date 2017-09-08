unit element_list_doc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, element_list, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, MemTableDataEh, Data.DB, MemTableEh,
  Data.Win.ADODB, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  data_module_sql, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, ComObj, DBCtrlsEh;

type
  TFormElementListDoc = class(TFormElementList)
    ToolButton8: TToolButton;
    lbTime: TLabel;
    DateEdit1: TDBDateTimeEditEh;
    DateEdit2: TDBDateTimeEditEh;
    procedure FormCreate(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
  private
    { Private declarations }
   Fdoc_type :TDocType;
   Fd1 :TDateTime;
   Fd2 :TDateTime;
  public
    { Public declarations }
        property doc_type :TDocType read Fdoc_type write Fdoc_type;
        property d1 :TDateTime read Fd1 write Fd1;
        property d2 :TDateTime read Fd2 write Fd2;
        procedure DataInit; override;
  end;

  var
    RTimeSQL :double;

implementation
uses element_sprav_obj, element_sprav_subj, refresh;
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
{ TFormElementListDoc }

procedure TFormElementListDoc.DataInit;
begin
//  inherited;
  DBGridEh1.Visible := false;
  quList.Close;
  Screen.Cursor:=crSQLWait;
  TimeSql(true);
  Application.ProcessMessages;
  quList.SQL.Clear;
  quList.SQL.Add('Select * From dbo.' + NameTableView +
  ' Where data Between :d1 and :d2 and doc_type =' + IntToStr(Ord(Fdoc_type)) + ' Order by Data');
  quList.Parameters.ParamByName('d1').DataType := ftDateTime;
  quList.Parameters.ParamByName('d2').DataType := ftDateTime;
  quList.Parameters.ParamByName('d1').Value := fd1;
  quList.Parameters.ParamByName('d2').Value := fd2;
  Caption := TypeDocToStr(Fdoc_type) + '(' + DateToStr(fd1) + '-' + DateToStr(fd2)+')';
  try
        try
          quList.Open;
//          lbTime.Caption :='данные получены:' + FloatToStr(TimeSql(false)/1000) + ' сек.';
          MemTableEh.LoadFromDataSet(quList, -1, lmCopy, false);
          MemTableEh.ReadOnly :=true;
          DataModuleSql.DefFields_TDBGridEh(NameTableView, DBGridEh1);
          Delable := SetDelable;
          lbTime.Caption :='данные получены:' + FloatToStr(TimeSql(false)/1000) + ' сек.';
          lbTime.Visible := True;
           except
         on E :EOleException do
           begin
            ShowMessage(E.ClassName+' : ѕопытка получить данные из quList завершилась неудачно '+E.Message);
           end;
         on E : Exception do
           begin
            ShowMessage(E.ClassName+' произошла ошибка, с сообщением : '+E.Message);
           end;
         end;
  finally
    Screen.Cursor:=crDefault;
    DBGridEh1.Visible := true;
    quList.Close;
    TimeSql(false);
 end;

 end;

procedure TFormElementListDoc.DateEdit1Change(Sender: TObject);
begin
  inherited;
  Fd1 :=DateEdit1.Value;
  Fd2 := DateEdit2.Value;
  DataInit;
end;

procedure TFormElementListDoc.FormCreate(Sender: TObject);
begin
  inherited;
  DateEdit1.OnChange :=nil;
  DateEdit2.OnChange :=nil;
  DateEdit1.Value:=StartOfTheMonth(Now);
  DateEdit2.Value:=EndOfTheMonth(Now);
  Fd1 := DateEdit1.Value;
  Fd2 := DateEdit2.Value;
  DateEdit1.OnChange :=DateEdit1Change;
  DateEdit2.OnChange :=DateEdit1Change;
end;

end.
