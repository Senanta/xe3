unit element_list_sprav;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, element_list, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, MemDS,
  DBAccess, IBC, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

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
uses element_sprav;

var
  fmElementSprav :TFormElementSprav;

procedure TFormElementListSprav.ActionAddExecute(Sender: TObject);
begin
  inherited;
  fmElementSprav := TFormElementSprav.Create(Application);
  fmElementSprav.ID := -1;
end;

end.
