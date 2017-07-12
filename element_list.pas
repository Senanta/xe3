unit element_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.Buttons, main, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, MemDS, DBAccess, IBC,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

 ///<summary>
 ///  Форма для отображения списка элементов
 ///  </summary>
 type
  TFormElementList = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    ActionAdd: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    panelTop: TPanel;
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
    IBCQuery1: TIBCQuery;
    DataSource1: TDataSource;
    Timer1: TTimer;
    panelMiddle: TPanel;
    panelBottom: TPanel;
    DBGridEh1: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FNameTableView :String; // Имя вьюва или таблицы для выбора
  public
    { Public declarations }
    property NameTableView         :string read FNameTableView write FNameTableView;
    procedure Open();
  end;

implementation

{$R *.dfm}

procedure TFormElementList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 IBCQuery1.Close;
 Action := caFree;
end;

procedure TFormElementList.Open;
begin
  IBCQuery1.Close;
  IBCQuery1.SQL.Add('Select * From ' + NameTableView);
  IBCQuery1.Open;
  DBGridEh1.Visible := true;
end;

procedure TFormElementList.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled :=false;
  Open();
end;

end.
