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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExpositionFields(const NameTableView :string; const Query :TDataSet);
    procedure DefFields_TDBVertGridEh(const NameTableView :string; const DBVertGridEh :TDBVertGridEh);
    procedure DefFields_TDBGridEh(const NameTableView :string; const DBGridEh :TDBGridEh);
    function GetId :LargeInt;
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

end.
