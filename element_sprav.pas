unit element_sprav;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, element, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh,
  Data.DB, MemDS, DBAccess, IBC;

///<summary>
/// Дочерняя форма элемента справочников - наследуем от TFormElement
///</summary>
type
  TFormElementSprav = class(TFormElement)
    DBVertGridEh1: TDBVertGridEh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
