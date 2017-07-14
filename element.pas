unit element;

interface

uses Winapi.Windows, System.Classes, System.UITypes, Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, main;

type
  TFormElement = class(TForm)
    PanelTop: TPanel;
    PanelMiddle: TPanel;
    PanelBottom: TPanel;
    btClose: TButton;
    btOK: TButton;
    btSave: TButton;
    ActionList1: TActionList;
    ActionSave: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionSaveUpdate(Sender: TObject);
  private
    { Private declarations }
    FID         :Int64;
    FIsChange   :Boolean;
    FNameTableView :String; // Имя вьюва или таблицы для выбора записи с ID = FID
  public
    { Public declarations }
    property ID         :Int64 read FID write FID default 0;
    property NameTableView         :string read FNameTableView write FNameTableView;
    property IsChange   :Boolean read FIsChange write FIsChange default false;
    procedure Save();
  end;

implementation

{$R *.dfm}

procedure TFormElement.ActionSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FIsChange;
end;

procedure TFormElement.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormElement.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //CanClose := MessageDlg('Вы хотите закрыть форму?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TFormElement.Save;
begin

end;

end.
