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
    DBGridEhRowSet: TDBGridEh;
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
begin
  inherited;
 quRowSet.Close;
 quRowSet.Parameters.ParamByName('ID_head').Value := ID;
 quRowSet.Open;
 MemTableEhRowSet.LoadFromDataSet(quRowSet, -1, lmCopy, false);
 quRowSet.Close;
 DataModuleSql.DefFields_TDBGridEh(v_Elements, DBGridEhRowSet);

end;

end.
