unit element_doc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, element, MemTableDataEh, Data.DB, MemTableEh,
  Data.Win.ADODB, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh, Vcl.ComCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, Vcl.Mask,
  DBCtrlsEh, RxToolEdit, RxDBCtrl;

///<summary>
/// Дочерняя форма элемента документов - наследуем от TFormElement
///</summary>
type
  TFormElementDoc = class(TFormElement)
    quRowSet: TADOQuery;
    MemTableEhRowSet: TMemTableEh;
    DataSource2: TDataSource;
    spl1: TSplitter;
    RowPages: TPageControl;
    TabSheetRows: TTabSheet;
    TabSheetEntriesF1: TTabSheet;
    TabSheetEntriesF2: TTabSheet;
    DBGridEhRowSet: TDBGridEh;
    quEntries: TADOQuery;
    MemTableEhEntries: TMemTableEh;
    DataSource3: TDataSource;
    DBGridEhEntries: TDBGridEh;
  private
    { Private declarations }
  public
    { Public declarations }
        procedure DataInit(); override;
  end;

implementation
uses data_module_sql;
{$R *.dfm}

{ TFormElementDoc }

procedure TFormElementDoc.DataInit;
var
  i :Integer;
begin
  inherited;
 quRowSet.Close;
 quRowSet.Parameters.ParamByName('ID_head').Value := ID;
 quRowSet.Open;
 MemTableEhRowSet.LoadFromDataSet(quRowSet, -1, lmCopy, false);
 quRowSet.Close;
 DataModuleSql.DefFields_TDBGridEh(v_Elements, DBGridEhRowSet);
     for i := 0 to DBGridEhRowSet.Columns.Count - 1 do
        begin
         if DBGridEhRowSet.Columns[i].FieldName = 'summa' then
          begin
           DBGridEhRowSet.Columns[i].Footer.DisplayFormat :=',#0.00';
           DBGridEhRowSet.Columns[i].Footer.ValueType :=fvtSum;
          end;
         if DBGridEhRowSet.Columns[i].FieldName = 'amount' then
          begin
           DBGridEhRowSet.Columns[i].Footer.DisplayFormat :=',#0.00';
           DBGridEhRowSet.Columns[i].Footer.ValueType :=fvtSum;
          end;

        end;
 quEntries.Close;
 quEntries.Parameters.ParamByName('ID_head').Value := ID;
 quEntries.Open;
 MemTableEhEntries.LoadFromDataSet(quEntries, -1, lmCopy, false);
 quEntries.Close;
 DataModuleSql.DefFields_TDBGridEh(v_Entries, DBGridEhEntries);
 RowPages.Visible :=true;
end;

end.
