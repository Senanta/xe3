unit element_list_sprav;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, element_list, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TFormElementListSprav = class(TFormElementList)
    procedure ActionAddCopyEditExecute(Sender: TObject);


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



procedure TFormElementListSprav.ActionAddCopyEditExecute(Sender: TObject);
begin
   if      NameTableView = 'v_Objects' then
    begin
     fmElementSpravObj := TFormElementSpravObj.Create(Application);
     fmElementSpravObj.NameTableView := NameTableView; // ѕрисвоили им€ view из формы списка
     if TAction(Sender).Name = 'ActionAdd' then fmElementSpravObj.ID := -1; //новый
     if TAction(Sender).Name = 'ActionEdit' then fmElementSpravObj.ID := quList.FieldByName('id').AsLargeInt; //существующий
     if TAction(Sender).Name = 'ActionAddCopy' then
      begin
        fmElementSpravObj.ID := quList.FieldByName('id').AsLargeInt;
        fmElementSpravObj.IsCopied :=true; // FID  в родителе переключитс€ в -1;
      end;
    end
   else if NameTableView = 'v_Subjects' then
    begin

    end
   else
    begin

    end;

end;



end.
