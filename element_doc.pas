unit element_doc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, element, MemTableDataEh, Data.DB, MemTableEh,
  Data.Win.ADODB, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh, Vcl.ComCtrls;

///<summary>
/// Дочерняя форма элемента документов - наследуем от TFormElement
///</summary>
type
  TFormElementDoc = class(TFormElement)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
