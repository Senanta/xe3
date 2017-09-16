unit set_price;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DBCtrlsEh, Vcl.Mask, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, MemTableDataEh, Data.DB, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, ComObj,
  Data.Win.ADODB, MemTableEh, DateUtils, RxToolEdit, RxDBCtrl, RxDBComb, RxLookup, RxCtrls,
  EhLibMTE, DBLookupEh, Vcl.ComCtrls;

type
  TfmSetPrice = class(TForm)
    PanelBottom: TPanel;
    btClose: TButton;
    btOK: TButton;
    btSave: TButton;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionClose: TAction;
    ActionOk: TAction;
    PanelTop: TPanel;
    PanelMiddle: TPanel;
    Label1: TLabel;
    Timer1: TTimer;
    DataSource1: TDataSource;
    MemTableEh: TMemTableEh;
    quPrices: TADOQuery;
    DBGridEh1: TDBGridEh;
    quPriceTypes: TADOQuery;
    DataSource2: TDataSource;
    Label2: TLabel;
    quDel: TADOQuery;
    quIns: TADOQuery;
    DateEdit1: TDBDateTimeEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetIsChange(const Value: Boolean);
    procedure SetNameElement(const Value: String);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionSaveUpdate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGridEh1Columns1EditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure MemTableEhAfterEdit(DataSet: TDataSet);
    procedure DateEdit1Change(Sender: TObject);
    procedure MemTableEhAfterInsert(DataSet: TDataSet);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    FID         :Int64;
//    FID_Type         :Int64;
    FData :TDateTime;
    FName       :String;
    FPriceName       :String;
    FIsChange   :Boolean;
    FIsCopied     :Boolean;
    FNameTableView :String; // Имя вьюва или таблицы для выбора записи с ID = FID
    FTabSheet :TTabSheet; //Закладка на bottom_panel
  public
    { Public declarations }
    property ID         :Int64 read FID write FID default 0;
    property TabSheet: TTabSheet read FTabSheet write FTabSheet;
//    property ID_Type         :Int64 read FID_Type write FID_Type;
    property Data :TDateTime read FData write FData;
    property PriceName       :String read FPriceName write FPriceName;
    property Name       :String read FName write SetNameElement;
    property NameTableView         :string read FNameTableView write FNameTableView;
    property IsChange   :Boolean read FIsChange write SetIsChange default false;
    property IsCopied   :Boolean read FIsCopied write FIsCopied default false;
    procedure Save();
    procedure DataInit(); virtual;
  end;

var
  fmSetPrice: TfmSetPrice;

implementation

{$R *.dfm}

uses data_module_sql, element_list_sprav,refresh,bottom_panel;
 Var
 fmElementListSprav :TFormElementListSprav;
procedure TfmSetPrice.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmSetPrice.ActionOkExecute(Sender: TObject);
begin
 if IsChange then
                Save;
  Close;
end;

procedure TfmSetPrice.ActionSaveExecute(Sender: TObject);
begin
  Save;
end;

procedure TfmSetPrice.ActionSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FIsChange;
end;

procedure TfmSetPrice.FormActivate(Sender: TObject);
begin
 ActivateTab(FTabSheet);
end;

procedure TfmSetPrice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=caFree;
end;

procedure TfmSetPrice.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
  idMsg : integer;
  Msg   : string;
begin
 if IsChange then
  begin
    Msg := 'Сохранить изменения: ' + FName + ' ?';
    idMsg := MessageBox(Handle, PChar(Msg), PChar('Сохранение'),
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

procedure TfmSetPrice.FormCreate(Sender: TObject);
begin
   FTabSheet :=AddTab(Self);
end;

procedure TfmSetPrice.MemTableEhAfterEdit(DataSet: TDataSet);
begin
  IsChange :=true;
end;

procedure TfmSetPrice.MemTableEhAfterInsert(DataSet: TDataSet);
begin
   IsChange :=true;
end;

procedure TfmSetPrice.Save;
Var
  bookmark :TBookmark;
begin
if FID <=0 then
 begin
  MessageBox(Handle, PChar('Не выбран тип цены!'), PChar('Сохранение'),
                MB_OK + MB_ICONError + MB_DEFBUTTON1);
  exit;
 end;
DataModuleSql.ADOConnection1.BeginTrans;
 try
     quDel.Parameters.ParamByName('ID_Type').Value := FID;
     quDel.Parameters.ParamByName('d').Value := FData;
     quDel.Parameters.ParamByName('id_subj').Value := DataModuleSql.Headquarters;
     quDel.execSQL;
     bookmark:=MemTableEh.GetBookmark;
     MemTableEh.DisableControls;
     MemTableEh.First;
     while not MemTableEh.Eof do
      begin
        quIns.Parameters.ParamByName('ID_Type').Value := FID;
        quIns.Parameters.ParamByName('data').Value := FData;
        quIns.Parameters.ParamByName('id_subj').Value := DataModuleSql.Headquarters;
        quIns.Parameters.ParamByName('id_obj').Value := MemTableEh.FieldByName('id_obj').AsLargeInt;
        quIns.Parameters.ParamByName('price').Value := MemTableEh.FieldByName('price').AsFloat;
        quIns.execSQL;
        MemTableEh.Next;
      end;
     MemTableEh.GotoBookmark(bookmark);
     MemTableEh.EnableControls;

    DataModuleSql.ADOConnection1.CommitTrans;
    if MemTableEh.State = dsEdit then
          MemTableEh.Post;
    RefreshSetPricesFromServer(v_SetPrices, DateToStr(FData), FID);
    IsChange :=false;
 except
      on E :EDatabaseError do
        begin
         DataModuleSql.ADOConnection1.RollbackTrans;
         ShowMessage(E.ClassName+' : Попытка выполнения завершилась неудачно '+E.Message);
        end;
      on E :EOleException do
        begin
         DataModuleSql.ADOConnection1.RollbackTrans;
         ShowMessage(E.ClassName+' : Попытка выполнения завершилась неудачно '+E.Message);
        end;
      on E : Exception do
        begin
         DataModuleSql.ADOConnection1.RollbackTrans;
         ShowMessage(E.ClassName+' произошла ошибка, с сообщением : '+E.Message);
        end;
 end;
end;

procedure TfmSetPrice.SetISChange(const Value: Boolean);
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


procedure TfmSetPrice.SetNameElement(const Value: String);
begin
  FName := Value;
  Caption := FName;
end;

procedure TfmSetPrice.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled :=false;
 DataInit;
end;

procedure TfmSetPrice.DataInit;
begin
 DBGridEh1.Visible:=false;
 quPrices.Close;
 quPrices.Parameters.ParamByName('ID_Type').Value := FID;
 quPrices.Parameters.ParamByName('d').Value := FData;
 quPrices.Parameters.ParamByName('id_subj').Value := DataModuleSql.Headquarters;
 quPrices.Open;

 if IsCopied then FID :=-1; //Если был запрос на копирование
 Name := 'Установка цен' + ': ' + ' ' + FPriceName + ' на Дату ' + DateToStr(FData);
 ShowTab(TabSheet, 'Установка цен' + ': ' + ' ' + FPriceName);
 MemTableEh.LoadFromDataSet(quPrices, -1, lmCopy, false);
 if (not IsCopied) and (FID =-1) then //Если новый и не добавлен копированием
    begin
//     MemTableEh.Append;
//     MemTableEh.Post;
    end;
  if (IsCopied) and (FID =-1) then //Если добавлен копированием
    begin
//      MemTableEh.Edit;
//      MemTableEh.FieldByName('ID').ReadOnly := false;
//      MemTableEh.FieldByName('ID').AsLargeInt :=FID;
//      MemTableEh.FieldByName('ID').ReadOnly := true;
    end;

 quPrices.Close;
 quPriceTypes.Close;
 quPriceTypes.Open;
 DBLookupComboboxEh1.KeyValue:=FID;
 DateEdit1.Value :=FData;
 IsChange :=false;
 DataModuleSql.DefFields_TDBGridEh(v_SetPrice, DBGridEh1);
  DBGridEh1.Visible:=true;
end;
procedure TfmSetPrice.DateEdit1Change(Sender: TObject);
begin
   IsChange :=true;
   FData :=DateEdit1.Value;
   Name := 'Установка цен' + ': ' + ' ' + FPriceName + ' на Дату ' + DateToStr(FData);
end;

procedure TfmSetPrice.DBGridEh1Columns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
   fmElementListSprav := TFormElementListSprav.Create(Self);
   fmElementListSprav.NameTableView := v_Objects;
end;

procedure TfmSetPrice.DBLookupComboboxEh1Change(Sender: TObject);
Var
  vkey :Variant;
begin
   vkey := DBLookupComboboxEh1.KeyValue;
   FID := StrToInt64(VarToStr(vkey));
   Name := 'Установка цен' + ': ' + ' ' + DBLookupComboboxEh1.Text + ' на Дату ' + DateToStr(FData);
   IsChange :=true;

end;

end.
