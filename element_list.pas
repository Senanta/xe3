unit element_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.Buttons, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, element;

type
  TBaseActionElement = (Add, Copy, Edit, Delete);

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
    Timer1: TTimer;
    panelMiddle: TPanel;
    panelBottom: TPanel;
    DBGridEh1: TDBGridEh;
    quList: TADOQuery;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure ActionEditUpdate(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionAddCopyExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FNameTableView :String; // Имя вьюва или таблицы для выбора
  public
    { Public declarations }
    property NameTableView         :string read FNameTableView write FNameTableView;
    procedure DataInit();
    procedure BaseActionElement(const Action: TBaseActionElement);
    procedure InitFormElement(const fmElementSprav: TFormElement; const Action: TBaseActionElement);

  end;



implementation
uses data_module_sql, element_sprav_obj, element_sprav_subj;
{$R *.dfm}
var
 fmElementSpravObj :TFormElementSpravObj;
 fmElementSpravSubj :TFormElementSpravSubj;
procedure TFormElementList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 quList.Close;
 Action := caFree;
end;


procedure TFormElementList.ActionAddCopyExecute(Sender: TObject);
begin
 BaseActionElement(Copy);
end;

procedure TFormElementList.ActionAddExecute(Sender: TObject);
begin
 BaseActionElement(Add);
end;

procedure TFormElementList.ActionDeleteExecute(Sender: TObject);
begin
// BaseActionElement(Delete);
end;

procedure TFormElementList.ActionEditExecute(Sender: TObject);
begin
 BaseActionElement(Edit);
end;

procedure TFormElementList.ActionEditUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not qulist.IsEmpty);
end;

procedure TFormElementList.BaseActionElement(const Action: TBaseActionElement);
begin
   if      NameTableView = v_Objects then
    begin
       fmElementSpravObj := TFormElementSpravObj.Create(Application);
       InitFormElement(fmElementSpravObj, Action);
    end
   else if NameTableView = v_Subjects then
    begin
       fmElementSpravSubj := TFormElementSpravSubj.Create(Application);
       InitFormElement(fmElementSpravSubj, Action);
    end
   else
    begin

    end;

end;

procedure TFormElementList.InitFormElement(const fmElementSprav: TFormElement; const Action: TBaseActionElement);
begin
     fmElementSprav.NameTableView := NameTableView; // Присвоили имя view из формы списка
     if Action = Add then  //новый
            fmElementSprav.ID := -1;
     if Action = Edit then   //редактируем существующий
            fmElementSprav.ID := quList.FieldByName('id').AsLargeInt;
     if Action = Copy then
      begin //копируем существующий в новый меняя ID на -1
        fmElementSprav.ID := quList.FieldByName('id').AsLargeInt;
        fmElementSprav.IsCopied :=true; // FID  в родителе переключится в -1;
      end;
     if Action = Delete then
      begin
      end;
end;

procedure TFormElementList.DataInit;
begin
  quList.Close;
  quList.SQL.Clear;
  quList.SQL.Add('Select * From dbo.' + NameTableView);
  quList.Open;
  quList.Last;
  DataModuleSql.DefFields_TDBGridEh(NameTableView, DBGridEh1);
  DBGridEh1.Visible := true;
end;

procedure TFormElementList.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled :=false;
  DataInit();
end;

end.
