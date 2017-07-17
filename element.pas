unit element;

interface

uses Winapi.Windows, System.Classes, System.UITypes, System.SysUtils, Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, main, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBVertGridsEh, Data.DB, Data.Win.ADODB, MemTableDataEh, MemTableEh;

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
    PropertyPages: TPageControl;
    TabSheetGeneral: TTabSheet;
    Timer1: TTimer;
    quElement: TADOQuery;
    DBVertGridEh1: TDBVertGridEh;
    MemTableEh: TMemTableEh;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionSaveUpdate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SetIsChange(const Value: Boolean);
    procedure MemTableEhAfterEdit(DataSet: TDataSet);
    procedure ActionSaveExecute(Sender: TObject);
  private
    { Private declarations }
    FID         :Int64;
    FIsChange   :Boolean;
    FIsCopied     :Boolean;
    FNameTableView :String; // Имя вьюва или таблицы для выбора записи с ID = FID
  public
    { Public declarations }
    property ID         :Int64 read FID write FID default 0;
    property NameTableView         :string read FNameTableView write FNameTableView;
    property IsChange   :Boolean read FIsChange write SetIsChange default false;
    property IsCopied   :Boolean read FIsCopied write FIsCopied default false;
    procedure Save();
    procedure DataInit(); virtual;
  end;

implementation

{$R *.dfm}

procedure TFormElement.ActionSaveExecute(Sender: TObject);
begin
  Save();
end;

procedure TFormElement.ActionSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FIsChange;
end;

procedure TFormElement.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  quElement.Close;
  Action := caFree;
end;

procedure TFormElement.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //CanClose := MessageDlg('Вы хотите закрыть форму?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TFormElement.DataInit;
begin
 quElement.Close;
 quElement.SQL.Clear;
 quElement.SQL.Add('Select * From ' + NameTableView + ' Where id = :id');
 quElement.Parameters.ParamByName('ID').Value := FID;
 quElement.Open;
 if IsCopied then FID :=-1; //Если был запрос на копирование

 MemTableEh.LoadFromDataSet(quElement, -1, lmCopy, false);
end;

procedure TFormElement.MemTableEhAfterEdit(DataSet: TDataSet);
begin
  IsChange :=true;
end;

procedure TFormElement.Save;
begin
  if MemTableEh.State = dsEdit then MemTableEh.Post;

  IsChange :=false;
end;

procedure TFormElement.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := false;
 DataInit;
 PropertyPages.Visible := true;
end;

procedure TFormElement.SetISChange(const Value: Boolean);
begin
  FISChange := Value;
  if FISChange {and not isDataInit} then
    begin
      Caption := StringReplace(Caption, '*', '', [rfReplaceAll, rfIgnoreCase]);
      Caption := '*' + Caption;
    end
  else
    begin
          Caption := StringReplace(Caption, '*', '', [rfReplaceAll, rfIgnoreCase]);
    end;
end;


end.
