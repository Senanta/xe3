unit data_module_sql;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBVertGridsEh, MemTableDataEh, MemTableEh, DBGridEh;

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
