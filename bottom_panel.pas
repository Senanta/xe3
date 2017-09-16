unit bottom_panel;

interface
uses Winapi.Windows, System.SysUtils, System.Classes, System.Contnrs, System.UITypes,
  Vcl.Graphics, Vcl.Forms,  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons,
  Winapi.Messages, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.Actions, ComObj, System.ImageList, Main, element_list;
  var
    tabSheet: TTabSheet;
 function AddTab(Owner :TForm) : TTabSheet;
 procedure ShowTab(tabSheet: TTabSheet; Caption :String);
 procedure ActivateTab(tabSheet: TTabSheet);
implementation

function AddTab(Owner :TForm) : TTabSheet;
begin
  tabSheet := TTabSheet.Create(Owner);
  tabSheet.PageControl := MainForm.PageControl1;
  //tabSheet.Caption := Owner.Caption;
 //tabSheet.ShowHint := false;
 //tabSheet.ParentShowHint := false;
 //tabSheet.ParentCustomHint := false;
   if MainForm.PageControl1.Visible = False then
    begin
       MainForm.PageControl1.Visible := True;
    end;
   MainForm.PageControl1.ActivePageIndex := tabSheet.PageIndex;
   result := tabSheet;
end;

procedure ShowTab(tabSheet: TTabSheet; Caption :String);
begin
  tabSheet.Caption := Caption;

end;

procedure ActivateTab(tabSheet: TTabSheet);
begin
 MainForm.PageControl1.ActivePageIndex := tabSheet.PageIndex;
end;

end.
