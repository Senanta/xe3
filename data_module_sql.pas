unit data_module_sql;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBVertGridsEh, MemTableDataEh, MemTableEh, DBGridEh, ComObj, System.Variants;

const
    v_Objects = 'v_Objects';
    v_Subjects = 'v_Subjects';
    sntSpravCurrency = 'v_Currency';
    sntSpravVehicle = 'v_Vehicle';

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
    procedure ADOConnection1ExecuteComplete(Connection: TADOConnection;
        RecordsAffected: Integer; const Error: Error; var EventStatus:
        TEventStatus; const Command: _Command; const Recordset: _Recordset);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExpositionFields(const NameTableView :string; const Query :TDataSet);
    procedure DefFields_TDBVertGridEh(const NameTableView :string; const DBVertGridEh :TDBVertGridEh);
    procedure DefFields_TDBGridEh(const NameTableView :string; const DBGridEh :TDBGridEh);
    function GetId :LargeInt;
    procedure ModifyDataSet(ADataSet: TDataSet);
  end;

var
  DataModuleSql: TDataModuleSql;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleSql }
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
     if (Pos('Insert', s) > 0) or (Pos('Update', s) > 0) then
      begin
       Ins_Log.Parameters.ParamByName('CommandText').Value := s;
       Ins_Log.ExecSQL;
      end;
   end;
end;

procedure TDataModuleSql.DefFields_TDBGridEh(const NameTableView: string;
  const DBGridEh: TDBGridEh);
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
