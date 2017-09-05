unit data_module_sql;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBVertGridsEh, MemTableDataEh, MemTableEh, DBGridEh, ComObj, System.Variants;

const
    v_Objects = 'v_Objects';
    v_Subjects = 'v_Subjects';
    v_Headers = 'v_Headers';
    v_Elements = 'v_Elements';
    v_Entries = 'v_Entries';
    v_SetPrices = 'v_SetPrices';
    v_SetPrice = 'v_SetPrice';
    sntSpravCurrency = 'v_Currency';
    sntSpravVehicle = 'v_Vehicle';

//Типы документов
type
   TDocType = (dtRealization=1, dtReturnClient=2, dtIntake=3, dtReturnSupplier =4, dtPosting=5,
                dtDiscarding=6, dtReceiptCash=7, dtExpenseCash=8, dtPaymentOrderIn=9,
                dtPaymentOrderOut=10, dtCorrectionRealization=20, dtRelocation=30);



type
  TDataModuleSql = class(TDataModule)
    ADOConnection1: TADOConnection;
    quTmp: TADOQuery;
    Ins_Obj: TADOQuery;
    Upd_Obj: TADOQuery;
    Del_Obj: TADOQuery;
    quIdentity: TADOQuery;
    Ins_Subj: TADOQuery;
    Upd_Subj: TADOQuery;
    Del_Subj: TADOQuery;
    Ins_Wh: TADOQuery;
    Upd_Wh: TADOQuery;
    Del_Wh: TADOQuery;
    Ins_Agr: TADOQuery;
    Upd_Agr: TADOQuery;
    Del_Agr: TADOQuery;
    conLog: TADOConnection;
    Ins_Log: TADOQuery;
    ADOCommand1: TADOCommand;
    quUpdate_fldCode: TADOQuery;
    conImport: TADOConnection;
    procedure ADOConnection1ExecuteComplete(Connection: TADOConnection;
        RecordsAffected: Integer; const Error: Error; var EventStatus:
        TEventStatus; const Command: _Command; const Recordset: _Recordset);
  private
    { Private declarations }
    FHeadquarters  :Int64;
  public
    { Public declarations }
    property  Headquarters  :Int64 read FHeadquarters write FHeadquarters;
    procedure ExpositionFields(const NameTableView :string; const Query :TDataSet);
    procedure DefFields_TDBVertGridEh(const NameTableView :string; const DBVertGridEh :TDBVertGridEh);
    /// <summary>TDataModuleSql.DefFields_TDBGridEh
    /// свойства столбцов TDBGridEh берем из базы таблицу dbFields
    /// </summary>
    /// <param name="NameTableView"> (string) </param>
    /// <param name="DBGridEh"> (TDBGridEh) </param>
    /// <seealso cref="TDataModuleSql.DefFields_TDBVertGridEh"/>
    procedure DefFields_TDBGridEh(const NameTableView :string; const DBGridEh
        :TDBGridEh);
    function GetId :LargeInt;
    procedure ModifyDataSet(ADataSet: TDataSet);
  end;

function FindRelations(const NameTableView: string; const ID: LargeInt): Boolean;
function TypeDocToStr( const curTDoc : TDocType) : string;
function VarToInt(var AVariant: variant; DefaultValue: integer = 0): int64;

/// <summary>
/// ShortID(20000000045) вернет 2-45
/// ShortID(21000000077) вернет 21-77
/// Работа проверялась в диапазоне 10000000000 - 99000000000
/// </summary>
function ShortID(ID :Currency): String;

var
  DataModuleSql: TDataModuleSql;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleSql }
function VarToInt(var AVariant: variant; DefaultValue: integer = 0): int64;
begin
  //*** Если NULL или не числовое, то вернем значение по умолчанию
  Result := DefaultValue;
  if VarIsNull(AVariant) then
    Result := 0
  else
//    {//*** Если числовое, то вернем значение} if VarIsOrdinal(AVariant) then
      Result := StrToInt(VarToStr(AVariant));
end;

function TypeDocToStr( const curTDoc : TDocType) : string;
begin
 case curTDoc of
    dtRealization: Result := 'РеализацияТоваровУслуг';
    dtReturnClient: Result := 'ВозвратТоваровОтКлиента';
    dtIntake: Result := 'ПоступлениеТоваровУслуг';
    dtReturnSupplier: Result := 'ВозвратТоваровПоставщику';
    dtPosting: Result := 'ОприходованиеТоваров';
    dtDiscarding: Result := 'СписаниеТоваров';
    dtReceiptCash: Result := 'ПриходныйКассовыйОрдер';
    dtExpenseCash: Result := 'РасходныйКассовыйОрдер';
    dtPaymentOrderIn: Result := 'ПлатежноеПоручениеВходящее';
    dtPaymentOrderOut: Result := 'ПлатежноеПоручениеИсходящее';
    dtCorrectionRealization: Result := 'КорректировкаРеализаций';
    dtRelocation: Result := 'ПеремещениеТоваров';
  end;
end;


function ShortID(ID :Currency): String;
Var
  sid :String;
begin
  sid :=FloatToStr(ID);
    if POS('000000000', Copy(sid, 1, 10)) > 0 then
      sid := '        ' + StringReplace(Copy(sid, 1, 10), '000000000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 11)
          else if Pos('00000000', Copy(sid, 1, 9)) > 0 then
            sid := '       ' + StringReplace(Copy(sid, 1, 9), '00000000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 10)
              else if Pos('0000000', Copy(sid, 1, 8)) > 0 then
                sid := '      ' + StringReplace(Copy(sid, 1, 8), '0000000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 9)
                  else if Pos('000000', Copy(sid, 1, 7)) > 0 then
                    sid := '     ' + StringReplace(Copy(sid, 1, 7), '000000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 8)
                      else if Pos('00000', Copy(sid, 1, 6)) > 0 then
                        sid := '    ' + StringReplace(Copy(sid, 1, 6), '00000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 7)
                          else if Pos('0000', Copy(sid, 1, 5)) > 0 then
                            sid := '   ' + StringReplace(Copy(sid, 1, 5), '0000', '-',[rfReplaceAll, rfIgnoreCase]) + Copy(sid, 6)
                              else if Pos('000', Copy(sid, 1, 4)) > 0 then
                                sid := '  ' + StringReplace(Copy(sid, 1, 4), '000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 5)
                                  else if Pos('00', Copy(sid, 1, 3)) > 0 then
                                    sid := ' ' + StringReplace(Copy(sid, 1, 3), '00', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 4)
                                      else if Pos('0', Copy(sid, 1, 2)) > 0 then
                                        sid := '' + StringReplace(Copy(sid, 1, 2), '0', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 3);
    if POS('00000000', Copy(sid, 1, 10)) > 0 then
      sid := '       ' + StringReplace(Copy(sid, 1, 10), '00000000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 11)
          else if Pos('0000000', Copy(sid, 1, 9)) > 0 then
            sid := '      ' + StringReplace(Copy(sid, 1, 9), '0000000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 10)
              else if Pos('000000', Copy(sid, 1, 8)) > 0 then
                sid := '     ' + StringReplace(Copy(sid, 1, 8), '000000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 9)
                  else if Pos('00000', Copy(sid, 1, 7)) > 0 then
                    sid := '    ' + StringReplace(Copy(sid, 1, 7), '00000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 8)
                      else if Pos('0000', Copy(sid, 1, 6)) > 0 then
                        sid := '   ' + StringReplace(Copy(sid, 1, 6), '0000', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 7)
                          else if Pos('000', Copy(sid, 1, 5)) > 0 then
                            sid := '  ' + StringReplace(Copy(sid, 1, 5), '000', '-',[rfReplaceAll, rfIgnoreCase]) + Copy(sid, 6)
                              else if Pos('00', Copy(sid, 1, 4)) > 0 then
                                sid := ' ' + StringReplace(Copy(sid, 1, 4), '00', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 5)
                                  else if Pos('0', Copy(sid, 1, 3)) > 0 then
                                    sid := '' + StringReplace(Copy(sid, 1, 3), '0', '-', [rfReplaceAll, rfIgnoreCase]) + Copy(sid, 4);

  result :=sid;
end;

procedure AssignRecord(Source, Destination: TDataSet);
var
  i: Integer;
  Field: TField;
begin
  for i := 0 to Destination.FieldCount-1 do
    if Destination.Fields[i].FieldNo > 0 then
    begin
      Field := Source.FindField(Destination.Fields[i].FieldName);
      if Field <> nil then
        Destination.Fields[i].Value := Field.Value;
    end;
end;

procedure AppendCurrent(Dataset:Tdataset);
var
  aField: Variant ;
  i: Integer ;
begin
  // Создаём массив
  aField := VarArrayCreate([0,DataSet.Fieldcount-1],VarVariant);

  // считываем значения в массив
  for i := 0 to (DataSet.Fieldcount-1) do
    aField[i] := DataSet.fields[i].Value ;

  DataSet.Append ;

  // помещаем значения массива в новую запись
  for i := 0 to (DataSet.Fieldcount-1) do
    DataSet.fields[i].Value := aField[i] ;
end;

function FindRelations(const NameTableView: string; const ID: LargeInt): Boolean;
begin
  // TODO -cMM: FindRelations default body inserted
  Result := false;
end;

procedure TDataModuleSql.ADOConnection1ExecuteComplete(Connection:
    TADOConnection; RecordsAffected: Integer; const Error: Error; var
    EventStatus: TEventStatus; const Command: _Command; const Recordset:
    _Recordset);
var
  i :Integer;
  s :string;
begin
  if EventStatus = esOK   then  //Пишем в Log
   begin
     s := Command.CommandText;
     for i := 0 to Command.Parameters.Count - 1 do
      begin
       s := s + ' :' + Command.Parameters[i].Name;
       s := s + '=' + VarToStr(Command.Parameters[i].Value);
      end;
     if (Pos('INSERT', UpperCase(s)) > 0) or (Pos('UPDATE', UpperCase(s)) > 0) then  //Остальные команды игнорируем,
      begin                                                    // Delete не используем в клиенте
       Ins_Log.Parameters.ParamByName('CommandText').Value := s;
       Ins_Log.ExecSQL; //ипользуем другое TADOConnection conLog
      end;
   end;
end;

procedure TDataModuleSql.DefFields_TDBGridEh(const NameTableView :string; const
    DBGridEh :TDBGridEh);
var
    i :integer;
begin
    quTmp.Close;
    quTmp.SQL.Clear;
    quTmp.Sql.Add('Select * From dbo.dbFields Where tableName =' + ''''+NameTableView+'''');
    quTmp.Open;
    quTmp.First;
    for i := 0 to DBGridEh.Columns.Count - 1 do
        begin
         if DBGridEh.Columns[i].FieldName = 'Img' then
              DBGridEh.Columns[i].TextEditing :=False;
         if quTmp.Locate('fieldName', DBGridEh.Columns[i].FieldName, [loCaseInsensitive]) then
            begin
             if quTmp.FieldByName('DisplayWidth').AsInteger > 0 then
                DBGridEh.Columns[i].Width := quTmp.FieldByName('DisplayWidth').AsInteger;
             if quTmp.FieldByName('Filter').AsBoolean and not DBGridEh.STFilter.Visible then
                DBGridEh.STFilter.Visible :=true; //Включим фильтр
             DBGridEh.Columns[i].STFilter.Visible :=quTmp.FieldByName('Filter').AsBoolean;
             DBGridEh.Columns[i].Title.TitleButton :=quTmp.FieldByName('Sort').AsBoolean; //Сортировка
             DBGridEh.Columns[i].DisplayFormat := quTmp.FieldByName('DisplayFormat').AsString;
             DBGridEh.Columns[i].EditMask := quTmp.FieldByName('EditMask').AsString;
             DBGridEh.Columns[i].Title.Caption := quTmp.FieldByName('DisplayLabel').AsString;
             DBGridEh.Columns[i].ReadOnly := quTmp.FieldByName('ReadOnly').AsBoolean;
             DBGridEh.Columns[i].Visible := quTmp.FieldByName('Visible').AsBoolean;

            end;
        end;
end;

procedure TDataModuleSql.DefFields_TDBVertGridEh(const NameTableView: string;
  const DBVertGridEh: TDBVertGridEh);
var
    i :integer;
begin
    quTmp.Close;
    quTmp.SQL.Clear;
    quTmp.Sql.Add('Select * From dbo.dbFields Where tableName =' + ''''+NameTableView+'''');
    quTmp.Open;
    quTmp.First;
    for i := 0 to DBVertGridEh.Rows.Count - 1 do
        begin
         if quTmp.Locate('fieldName', DBVertGridEh.Rows[i].FieldName, [loCaseInsensitive]) then
            begin
             DBVertGridEh.Rows[i].CategoryName := quTmp.FieldByName('Category').AsString;
             DBVertGridEh.Rows[i].EditMask := quTmp.FieldByName('EditMask').AsString;
             DBVertGridEh.Rows[i].DisplayFormat := quTmp.FieldByName('DisplayFormat').AsString;
             DBVertGridEh.Rows[i].RowLabel.Caption := quTmp.FieldByName('DisplayLabel').AsString;
             DBVertGridEh.Rows[i].ReadOnly := quTmp.FieldByName('ReadOnly').AsBoolean;
             DBVertGridEh.Rows[i].Visible := quTmp.FieldByName('Visible').AsBoolean;
            end;
        end;
end;

procedure TDataModuleSql.ExpositionFields(const NameTableView :string; const Query: TDataSet);
var
    i :integer;
begin
    quTmp.Close;
    quTmp.SQL.Clear;
    quTmp.Sql.Add('Select * From dbo.dbFields Where tableName =' + ''''+NameTableView+'''');
    quTmp.Open;
    quTmp.First;
    for i := 0 to Query.Fields.Count - 1 do
        begin
         if quTmp.Locate('fieldName', Query.Fields[i].FieldName, [loCaseInsensitive]) then
            begin
             Query.Fields[i].DisplayLabel := quTmp.FieldByName('DisplayLabel').AsString;
            end;
        end;
end;

function TDataModuleSql.GetId: LargeInt;
begin
  quIdentity.Close;
  quIdentity.Open;
  result := quIdentity.FieldByName('Identity').AsLargeInt;
  quIdentity.Close;
end;

procedure TDataModuleSql.ModifyDataSet(ADataSet: TDataSet);
{var
 i: Integer;
  Field: TStringField;
  FieldName: string;
  //LookupEnt: TEntity;
  FldCnt: Integer;
  IsLookup: Boolean;
  BM: TBookMark;}
begin

{BM := ADataSet.GetBookMark;
  ADataSet.Close;
  FldCnt := 0;
  ADataSet.Fields.Clear;
  for i := 0 to ADataSet.FieldDefs.Count - 1 do
  begin
    if not ADataSet.FieldDefs.Updated then
      ADataSet.FieldDefs.Update;
    if ADataSet.FindField(ADataSet.FieldDefs[i].Name) = nil then
      ADataSet.FieldDefs[i].CreateField(ADataSet);
    // если это ссылочное поле
    IsLookup := (Pos('ID_', ADataSet.FieldDefs[i].Name) <> 0); // дополнительные условия отрезаны
    if IsLookup then
    try
      FieldName := ADataSet.FieldDefs[i].Name;
      Delete(FieldName, 1, 3); // delete 'ID_'
      Field := TWideStringField.Create(nil);
      Field.Size := 128;
      Field.FieldName := FieldName;
      Field.FieldKind := fkLookup;
      Field.KeyFields := ADataSet.FieldDefs[i].Name;
      // определим на что ссылается, у меня в проекте это Сущность/Entity
      //LookupEnt := TEntity(EnumValue(EntP, FieldName, 'xe'));
      // спец. менеджер выдаёт нужный датасет для данной энтити
      //Field.LookupDataSet := Manager.GetData(LookupEnt);
      // биндим поле которое будет источником инфы по ссылке
      //FLookupField := 'Caption';
      //if not Assigned(Field.LookupDataSet.FindField(FLookupField)) then
        //FLookupField := 'Name';
      //Field.LookupResultField := FLookupField;
      Field.DisplayWidth := //MinWd + 1;
//      Field.LookupKeyFields := 'ID';
      Field.DataSet := ADataSet;
    except
      raise;
    end;
    // дообработка в наследниках формы
    //SpecModifying(FldCnt, ADataSet.Fielddefs[i].Name, IsLookup);
    // учёт "системных" полей таблицы
    if not (AnsiSameText('ID', ADataSet.FieldDefs[i].Name) or
      AnsiSameText('IsDeleted', ADataSet.FieldDefs[i].Name)) then
      Inc(FldCnt);
  end;
  ADataSet.Open;
  //GotoBookMark(ADataSet, BM);}
end;
end.
