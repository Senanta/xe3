unit element;

interface

uses Winapi.Windows, System.Classes, System.UITypes, System.SysUtils, Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, EhLibVCL, GridsEh, DBAxisGridsEh,
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
    ActionClose: TAction;
    ActionOk: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionSaveUpdate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SetIsChange(const Value: Boolean);
    procedure SetNameElement(const Value: String);
    procedure MemTableEhAfterEdit(DataSet: TDataSet);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
  private
    { Private declarations }
    FID         :Int64;
    FName       :String;
    FIsChange   :Boolean;
    FIsCopied     :Boolean;
    FNameTableView :String; // ��� ����� ��� ������� ��� ������ ������ � ID = FID
  public
    { Public declarations }
    property ID         :Int64 read FID write FID default 0;
    property Name       :String read FName write SetNameElement;
    property NameTableView         :string read FNameTableView write FNameTableView;
    property IsChange   :Boolean read FIsChange write SetIsChange default false;
    property IsCopied   :Boolean read FIsCopied write FIsCopied default false;
    procedure cmdInsert;
    procedure cmdUpdate;
    procedure Save();
    procedure DataInit(); virtual;
  end;

implementation
uses data_module_sql;
{$R *.dfm}

procedure TFormElement.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormElement.ActionOkExecute(Sender: TObject);
begin
  Save;
  Close;
end;

procedure TFormElement.ActionSaveExecute(Sender: TObject);
begin
  Save;
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
var
  idMsg : integer;
  Msg   : string;
begin
 if IsChange then
  begin
//    BringToFront;
    Msg := '��������� ���������: ' + FName + ' ?';
    idMsg := MessageBox(Handle, PChar(Msg), PChar('����������'),
                MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON1);
    Case idMsg of
       IDYES :
        begin
         CanClose := true;
        end;
       IDNO :
        begin
         CanClose := true;
        end;
       IDCancel :
        begin
         CanClose := false;
        end;
    End;
  end
 else
  CanClose := true;
end;

procedure TFormElement.cmdInsert;
begin
    if      NameTableView = v_Objects then
    begin
      DataModuleSql.Ins_Obj.Parameters.ParamByName('Name').Value := MemTableEh.FieldByName('Name').AsString;
      DataModuleSql.Ins_Obj.ExecSQL;
      FID := DataModuleSql.GetId;
    end
   else if NameTableView = v_Subjects then
    begin
      DataModuleSql.Ins_Subj.Parameters.ParamByName('Name').Value := MemTableEh.FieldByName('Name').AsString;
      DataModuleSql.Ins_Subj.ExecSQL;
      FID := DataModuleSql.GetId;
    end
   else
    begin

    end;
end;

procedure TFormElement.cmdUpdate;
begin
    if      NameTableView = v_Objects then
    begin
      DataModuleSql.Upd_Obj.Parameters.ParamByName('id').Value := FID;
      DataModuleSql.Upd_Obj.Parameters.ParamByName('Name').Value := MemTableEh.FieldByName('Name').AsString;
      DataModuleSql.Upd_Obj.ExecSQL;
    end
   else if NameTableView = v_Subjects then
    begin
      DataModuleSql.Upd_Subj.Parameters.ParamByName('id').Value := FID;
      DataModuleSql.Upd_Subj.Parameters.ParamByName('Name').Value := MemTableEh.FieldByName('Name').AsString;
      DataModuleSql.Upd_Subj.ExecSQL;
    end
   else
    begin

    end;
end;

procedure TFormElement.DataInit;
begin
 quElement.Close;
 quElement.SQL.Clear;
 quElement.SQL.Add('Select * From dbo.' + NameTableView + ' Where id = :id');
 quElement.Parameters.ParamByName('ID').Value := FID;
 quElement.Open;
 if IsCopied then FID :=-1; //���� ��� ������ �� �����������
 Name := NameTableView + ': ' + quElement.FieldByName('Name').AsString;

 MemTableEh.LoadFromDataSet(quElement, -1, lmCopy, false);
 if (not IsCopied) and (FID =-1) then //���� ����� � �� �������� ������������
    begin
     MemTableEh.Append;
     MemTableEh.Post;
    end;
 quElement.Close;
 DataModuleSql.DefFields_TDBVertGridEh(NameTableView, DBVertGridEh1);
 PropertyPages.Visible := true;
end;

procedure TFormElement.MemTableEhAfterEdit(DataSet: TDataSet);
begin
  IsChange :=true;
end;

procedure TFormElement.Save;
begin
 DataModuleSql.ADOConnection1.BeginTrans;
 try
    if FID = -1 then //����� - ����� ������ Insert
      begin
       cmdInsert;
       MemTableEh.FieldByName('ID').AsLargeInt:=FID;
      end
    else
      begin
       cmdUpdate;
      end;
    DataModuleSql.ADOConnection1.CommitTrans;
    if MemTableEh.State = dsEdit then
          MemTableEh.Post;
    IsChange :=false;
    Name := NameTableView + ': ' + MemTableEh.FieldByName('Name').AsString;
 except
      on E :EDatabaseError do
        begin
         DataModuleSql.ADOConnection1.RollbackTrans;
         ShowMessage(E.ClassName+' : ������� ���������� ����������� �������� '+E.Message);
        end;
      on E : Exception do
        begin
         DataModuleSql.ADOConnection1.RollbackTrans;
         ShowMessage(E.ClassName+' ������� ������, � ���������� : '+E.Message);
        end;
 end;
end;

procedure TFormElement.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := false;
 DataInit;
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


procedure TFormElement.SetNameElement(const Value: String);
begin
  FName := Value;
  Caption := FName;
end;

end.
