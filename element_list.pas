unit element_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.Buttons, main;

 ///<summary>
 ///  ����� ��� ����������� ������ ���������
 ///  </summary>
 type
  TFormElementList = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    ActionAdd: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ActionAddCopy: TAction;
    ActionEdit: TAction;
    ActionDelete: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormElementList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

end.
