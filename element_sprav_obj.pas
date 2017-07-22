unit element_sprav_obj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, element, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh,
  Vcl.ComCtrls, Data.DB, Data.Win.ADODB, MemTableDataEh, MemTableEh;

///<summary>
/// Дочерняя форма элемента справочника Номенклатура - наследуем от TFormElement
///</summary>
type
  TFormElementSpravObj = class(TFormElement)
  private
    { Private declarations }
  public
    { Public declarations }
  end;
implementation

{$R *.dfm}

end.
