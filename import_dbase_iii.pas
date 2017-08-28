unit import_dbase_iii;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, dbf, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls, Vcl.Buttons, Data.Win.ADODB, comObj, Vcl.ComCtrls;


function ShowTypeField( const curTField : TFieldType) : string;
function StrToOem(const AnsiStr: AnsiString): AnsiString;
function StrToAnsi(const OemStr: AnsiString): AnsiString;
function TimeSql(start :Boolean) :Double;
procedure ShowSuccess(Show :Boolean);

type
  TfmImport = class(TForm)
    OpenDialog: TOpenDialog;
    Dbf1: TDbf;
    DataSource1: TDataSource;
    PanelTop: TPanel;
    PanelMiddle: TPanel;
    PanelBottom: TPanel;
    btOK: TButton;
    btSave: TButton;
    DBGridEh1: TDBGridEh;
    SpeedButton1: TSpeedButton;
    Memo1: TMemo;
    quCreate: TADOQuery;
    quInsert: TADOQuery;
    quDrop: TADOQuery;
    ProgressBar1: TProgressBar;
    lbSuccess: TLabel;
    LabelTime: TLabel;
    SpeedButtonSuccess: TSpeedButton;
    procedure btOKClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmImport: TfmImport;
  RTimeSQL :double;
implementation
uses data_module_sql;
{$R *.dfm}

function StrToOem(const AnsiStr: AnsiString): AnsiString;
begin
  Result := AnsiStr;
  if Length(Result) > 0 then
    CharToOemA(PAnsiChar(Result), PAnsiChar(Result));
end;

function StrToAnsi(const OemStr: AnsiString): AnsiString;
begin
  Result := OemStr;
  if Length(Result) > 0 then
    OemToCharA(PAnsiChar(Result), PAnsiChar(Result));
end;

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


function ShowTypeField( const curTField : TFieldType) : string;
begin
 case curTField of
    ftUnknown: Result := 'ftUnknown';
    ftString: Result := 'ftString';
    ftSmallint: Result := 'ftSmallint';
    ftInteger: Result := 'ftInteger';
    ftWord: Result := 'ftWord';
    ftBoolean: Result := 'ftBoolean';
    ftFloat: Result := 'ftFloat';
    ftCurrency: Result := 'ftCurrency';
    ftBCD: Result := 'ftBCD';
    ftDate: Result := 'ftDate';
    ftTime: Result := 'ftTime';
    ftDateTime: Result := 'ftDateTime';
    ftBytes: Result := 'ftBytes';
    ftVarBytes: Result := 'ftVarBytes';
    ftAutoInc: Result := 'ftAutoInc';
    ftBlob: Result := 'ftBlob';
    ftMemo: Result := 'ftMemo';
    ftGraphic: Result := 'ftGraphic';
    ftFmtMemo: Result := 'ftFmtMemo';
    ftParadoxOle: Result := 'ftParadoxOle';
    ftDBaseOle: Result := 'ftDBaseOle';
    ftTypedBinary: Result := 'ftTypedBinary';
    ftCursor: Result := 'ftCursor';
    ftFixedChar: Result := 'ftFixedChar';
    ftWideString: Result := 'ftWideString';
    ftLargeInt: Result := 'ftLargeInt';
    ftADT: Result := 'ftADT';
    ftArray: Result := 'ftArray';
    ftReference: Result := 'ftReference';
    ftDataSet: Result := 'ftDataSet';
    ftOraBlob: Result := 'ftOraBlob';
    ftOraClob: Result := 'ftOraClob';
    ftVariant: Result := 'ftVariant';
    ftInterface: Result := 'ftInterface';
    ftIDispatch: Result := 'ftIDispatch';
    ftGuid: Result := 'ftGuid';
  end;
end;

procedure ShowSuccess(Show :Boolean);
begin
      fmImport.lbSuccess.Visible :=Show;
      fmImport.LabelTime.Visible :=Show;
      fmImport.SpeedButtonSuccess.Visible :=Show;
end;

procedure TfmImport.btOKClick(Sender: TObject);
Var
  i, k, rc, percent10, idMsg :Integer;
  s, tbName, insert_fields, insert_values, Msg :String;
begin
  if not Dbf1.Active then
   begin
    ShowMessage(' Необходимо открыть файл для импорта dBase(*.dbf)! ');
    Exit;
   end;

  Msg := 'Выполнить импорт ' + Dbf1.TableName + ' в кол-ве строк: '+IntToStr(Dbf1.RecordCount) + ' ?';
  idMsg := MessageBox(Handle, PChar(Msg), PChar('Импорт данных dBase'),
              MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2);
    Case idMsg of
       IDYES :
        begin
         //
        end;
       IDNO :
        begin
         Exit;
        end;
    End;


  ProgressBar1.Visible :=True;
  tbName :=StringReplace(Dbf1.TableName, '.dbf', '', [rfReplaceAll, rfIgnoreCase]);
  quInsert.SQL.Clear;
  quInsert.SQL.Add('Insert Into ' + tbName + ' (');
  Memo1.Lines.Clear;
  Memo1.Lines.Add('  if exists (select 1 ');
  Memo1.Lines.Add('          from  sysobjects');
  Memo1.Lines.Add('         where  id = object_id('+''''+'dbo.'+tbName+''''+')');
  Memo1.Lines.Add('          and   type = '+''''+'U' +''''+')');
  Memo1.Lines.Add(' drop table dbo.'+tbName);
  quDrop.SQL.Clear;
  quDrop.SQL :=Memo1.Lines;
  Memo1.Lines.Clear;
//  Memo1.Lines.Add('go');
  Memo1.Lines.Add('create table dbo.'+tbName + '(');
  for i := 0 to Dbf1.FieldCount - 1 do
   begin
    if Dbf1.Fields[i].DataType = ftString then
     begin
      s :=Dbf1.Fields[i].FieldName + ' nvarchar(250) null,';
      Memo1.Lines.Add(s);
      quInsert.Parameters.CreateParameter(Dbf1.Fields[i].FieldName, ftString, pdInput, -1, '');
     end
    else if Dbf1.Fields[i].DataType = ftFloat then
     begin
      s :=Dbf1.Fields[i].FieldName + ' numeric(19,5) null,';
      Memo1.Lines.Add(s);
      quInsert.Parameters.CreateParameter(Dbf1.Fields[i].FieldName, ftCurrency, pdInput, -1, 0.0);
     end
    else if Dbf1.Fields[i].DataType = ftBoolean then
     begin
      s :=Dbf1.Fields[i].FieldName + ' bit null,';
      Memo1.Lines.Add(s);
      quInsert.Parameters.CreateParameter(Dbf1.Fields[i].FieldName, ftBoolean, pdInput, -1, false);
     end
    else if Dbf1.Fields[i].DataType = ftSmallInt then
     begin
      s :=Dbf1.Fields[i].FieldName + ' smallint null,';
      Memo1.Lines.Add(s);
      quInsert.Parameters.CreateParameter(Dbf1.Fields[i].FieldName, ftSmallInt, pdInput, -1, 1);
     end
     else if Dbf1.Fields[i].DataType = ftLargeInt then
     begin
      s :=Dbf1.Fields[i].FieldName + ' bigint null,';
      Memo1.Lines.Add(s);
      quInsert.Parameters.CreateParameter(Dbf1.Fields[i].FieldName, ftLargeInt, pdInput, -1, 1);
     end
    else
     begin
      ShowMessage(' Неопределен тип данных для генерации полей '+ShowTypeField(Dbf1.Fields[i].DataType));
      Exit;
     end;
   end;
  Memo1.Lines[Memo1.Lines.Count-1] :=StringReplace(Memo1.Lines[Memo1.Lines.Count-1], ',', ' ', [rfReplaceAll, rfIgnoreCase]);
  Memo1.Lines.Add(')');
//  Memo1.Lines.Add('go');
  quCreate.SQL.Clear;
  quCreate.SQL :=Memo1.Lines;
  DataModuleSql.conImport.BeginTrans;
     try
      quDrop.ExecSQL;
      quCreate.ExecSQL;
      DataModuleSql.conImport.CommitTrans;
       except
          on E :EOleException do
            begin
             DataModuleSql.conImport.RollbackTrans;
             ShowMessage(E.ClassName+' : Попытка создания таблицы завершилась неудачно '+E.Message);
            end;
          on E : Exception do
            begin
             DataModuleSql.conImport.RollbackTrans;
             ShowMessage(E.ClassName+' произошла ошибка, с сообщением : '+E.Message);
            end;
     end;
       //Пробежимся по полям для генерации Insert'a
       for i := 0 to Dbf1.FieldCount - 1 do
        begin
          insert_fields :=insert_fields + Dbf1.Fields[i].FieldName + ', ';
        end;
       //генерация Values Insert'a
       insert_values :=' Values(';
       for i := 0 to Dbf1.FieldCount - 1 do
        begin
          insert_values :=insert_values + ':' + Dbf1.Fields[i].FieldName + ', ';
        end;
  Delete(insert_fields, length(insert_fields)-1, 1);
  Delete(insert_values, length(insert_values)-1, 1);
  quInsert.SQL.Add(insert_fields + ')');
  quInsert.SQL.Add(insert_values + ')');
  Memo1.Lines := quInsert.SQL;
  Dbf1.DisableControls;
  Dbf1.First;
  ProgressBar1.Position :=0;
  rc :=Dbf1.RecordCount;
  percent10 := Round(Int((rc/100)*10));
  k :=percent10;
  //Начинаем вставку
  DBGridEh1.Visible :=False;
  TimeSql(true);
  Screen.Cursor:=crSQLWait;
 DataModuleSql.conImport.BeginTrans;
  try
      try
       while Dbf1.Eof <> True do
        begin
          //Заполняем параметры
            for i := 0 to Dbf1.FieldCount - 1 do
             begin
               quInsert.Parameters.ParamByName(Dbf1.Fields[i].FieldName).Value :=Dbf1.FieldByName(Dbf1.Fields[i].FieldName).AsVariant;
             end;
             quInsert.ExecSQL;
              if Dbf1.RecNo > k then
               begin
                 k := k + percent10;
                 ProgressBar1.Position := ProgressBar1.Position + 10;
                Application.ProcessMessages;
               end;
          Dbf1.Next;
        end;
      DataModuleSql.conImport.CommitTrans;
      ShowSuccess(true);
      LabelTime.Caption := FloatToStr(TimeSql(false)/1000) + ' сек.' ;
      ProgressBar1.Position :=100;
      except
         on E :EOleException do
           begin
            DataModuleSql.conImport.RollbackTrans;
            ShowMessage(E.ClassName+' : Попытка Insert завершилась неудачно '+E.Message);
           end;
         on E : Exception do
           begin
            DataModuleSql.conImport.RollbackTrans;
            ShowMessage(E.ClassName+' произошла ошибка, с сообщением : '+E.Message);
           end;
     end;
   finally
     Dbf1.EnableControls;
     Screen.Cursor:=crDefault;
     ProgressBar1.Visible :=False;
     DBGridEh1.Visible :=True;
     TimeSql(false);
  end;

end;

procedure TfmImport.btSaveClick(Sender: TObject);
begin
  Dbf1.Close;
  Caption :='Импорт dBaseIII ';
  ShowSuccess(false);
  Close;
end;

procedure TfmImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dbf1.Close;
  Caption :='Импорт dBaseIII ';
  ShowSuccess(false);
end;

procedure TfmImport.SpeedButton1Click(Sender: TObject);
Var
  cp :Variant;
begin
  if OpenDialog.Execute then
    begin
      Dbf1.Close;
      Dbf1.TableName := opendialog.FileName;
      cp :=Dbf1.CodePage;
      Dbf1.Open;
      Caption :='Импорт dBaseIII '+opendialog.FileName;
      ShowSuccess(false);
    end;
 end;

end.
