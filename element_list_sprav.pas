unit element_list_sprav;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, element_list, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh;

type
  TFormElementListSprav = class(TFormElementList)
    procedure ActionAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
{$R *.dfm}
uses element_sprav_obj;

var
  fmElementSpravObj :TFormElementSpravObj;

procedure TFormElementListSprav.ActionAddExecute(Sender: TObject);
begin
  inherited;
  fmElementSpravObj := TFormElementSpravObj.Create(Application);
  fmElementSpravObj.ID := -1; //новый
  fmElementSpravObj.NameTableView := NameTableView; // Присвоили имя view из формы списка
end;

end.
