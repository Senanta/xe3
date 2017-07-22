unit data_module_sql;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

const
    v_Objects = 'v_Objects';
    v_Subjects = 'v_Subjects';
    sntSpravCurrency = 'v_Currency';
    sntSpravVehicle = 'v_Vehicle';

type
  TDataModuleSql = class(TDataModule)
    ADOConnection1: TADOConnection;
    quTmp: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExpositionFields(const NameTableView :string; const Query :TDataSet);
  end;

var
  DataModuleSql: TDataModuleSql;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleSql }

procedure TDataModuleSql.ExpositionFields(const NameTableView :string; const Query: TDataSet);
var
    i :integer;
begin
    quTmp.Close;
    quTmp.SQL.Clear;
    quTmp.Sql.Add('Select * From dbo.dbFields Where tableName =' + NameTableView);
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

end.
