unit MAIN;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, System.Contnrs, System.UITypes,
  Vcl.Graphics, Vcl.Forms,  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons,
  Winapi.Messages, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.Actions, ComObj, System.ImageList, Data.DB, dbf, rxCalc;

type
  TCalc = class(TRxCalculator)
end;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileCloseItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    FileNew1: TAction;
    FileSave1: TAction;
    FileExit1: TAction;
    FileOpen1: TAction;
    FileSaveAs1: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    HelpAbout1: TAction;
    FileClose1: TWindowClose;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileItem2: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ImageList1: TImageList;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    FileCloseAll: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    v_Objects: TAction;
    N8: TMenuItem;
    Timer1: TTimer;
    v_Subjects: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    FileSaveAll: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    actDictionary: TAction;
    actImport: TAction;
    N14: TMenuItem;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    actOSV: TAction;
    actOSV_ACC: TAction;
    actCardAcc: TAction;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    v_Headers_t1: TAction;
    v_Headers_t2: TAction;
    vHeaderst11: TMenuItem;
    vHeaderst21: TMenuItem;
    v_Headers_t3: TAction;
    v_Headers_t4: TAction;
    v_Headers_t5: TAction;
    v_Headers_t6: TAction;
    v_Headers_t7: TAction;
    v_Headers_t8: TAction;
    v_Headers_t9: TAction;
    v_Headers_t10: TAction;
    vHeaderst31: TMenuItem;
    vHeaderst41: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    v_SetPrices: TAction;
    v_PriceTypes: TAction;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    v_Headers_t20: TAction;
    N35: TMenuItem;
    v_Headers_t30: TAction;
    N36: TMenuItem;
    v_Headers_t51: TAction;
    v_Headers_t61: TAction;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actDictionaryExecute(Sender: TObject);
    procedure actImportExecute(Sender: TObject);
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure FileCloseAllExecute(Sender: TObject);
    procedure FileCloseAllUpdate(Sender: TObject);
    procedure ActionExecute(Sender: TObject);
    procedure actOSVExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure v_Headers_Execute(Sender: TObject);
    procedure v_SetPricesExecute(Sender: TObject);
    procedure actOSV_ACCExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Calculator :TCalc;


implementation
{$R *.dfm}
// Для теста CommandTimeout
//DECLARE    @intLoop int
//    SET @intLoop = 10
//    WHILE @intLoop > 1
//    BEGIN
//     SELECT  @intLoop, GetDate()
//     WAITFOR DELAY '00:00:01'
//     SELECT  @intLoop = @intLoop -1
//    END
//TADODataSet(qryReport).CommandTimeout := ADOConnection.CommandTimeout;

uses data_module_sql, element_list, element_list_sprav, About, dictionary, import_dbase_iii,
  report_osv, element_list_doc, set_prices,report_osv_acc;

var
  fmElementListSprav :TFormElementListSprav;
  fmElementListDoc :TFormElementListDoc;
  fmElementListSetPrices :TFormElementListSetPrices;
  fmReportOsv_Acc :TfmReportOsv_Acc;
procedure TMainForm.FormCreate(Sender: TObject);
begin
  Calculator := TCalc.Create(Self);
  Calculator.Title := 'Калькулятор';
 end;

procedure TMainForm.actDictionaryExecute(Sender: TObject);
begin
  fmDictionary.ShowModal;
end;

procedure TMainForm.actImportExecute(Sender: TObject);
begin
  fmImport.ShowModal;
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
 // fmElement := TFormElement.Create(Application);
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
  if OpenDialog.Execute then   ;
end;

procedure TMainForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.ActionExecute(Sender: TObject);
begin
   fmElementListSprav := TFormElementListSprav.Create(Application);
   fmElementListSprav.NameTableView := (Sender as TAction).Name; //Имя view из имени Action
end;

procedure TMainForm.actOSVExecute(Sender: TObject);
begin
   fmReport_Osv := TfmReport_Osv.Create(Application);
end;

procedure TMainForm.actOSV_ACCExecute(Sender: TObject);
begin
  fmReportOsv_Acc := TfmReportOsv_Acc.Create(Application);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
var
  f: TextFile;
  fName: string;
  buf: string;
begin
  TTimer(Sender).Enabled :=false;
  fName := 'snt_conn.udl';
  AssignFile(f, fName);
try
   try
    Reset(f);
    readln(f, buf);
    DataModuleSql.AdoConnection1.ConnectionString :='FILE NAME='+fName;
    DataModuleSql.AdoConnection1.Connected :=true;
    DataModuleSql.conLog.ConnectionString :='FILE NAME='+fName;
    DataModuleSql.conLog.Connected :=true;
    // Подключаемся к базе Initial Catalog=base_import должна быть на сервере!
    DataModuleSql.conImport.ConnectionString :=DataModuleSql.AdoConnection1.ConnectionString;
    DataModuleSql.conImport.ConnectionString := StringReplace(DataModuleSql.conImport.ConnectionString,
       'Initial Catalog=base', 'Initial Catalog=base_import', [rfReplaceAll, rfIgnoreCase]);
    DataModuleSql.conImport.Connected :=true;
    DataModuleSql.quTmp.Close;
    DataModuleSql.quTmp.SQL.Clear;
    DataModuleSql.quTmp.Sql.Add('Select Headquarters From dbo.dbProperties');
    DataModuleSql.quTmp.Open;
    DataModuleSql.Headquarters :=DataModuleSql.quTmp.Fields[0].AsLargeInt;
    DataModuleSql.quTmp.Close;

    StatusBar.Panels[1].Text :='Подключение..Ок!';
   except
        on E :EInOutError do
          begin
           ShowMessage(E.ClassName+' : не найден файл с параметрами подключения '+E.Message + ' ' + fName);
           Application.Terminate;
          end;
        on E :EOleException do
          begin
           ShowMessage(E.ClassName+' : файл или алиас в строке подключения указан неверно '+E.Message);
           Application.Terminate;
          end;
        on E :EDatabaseError do
          begin
           ShowMessage(E.ClassName+' : попытка подключения закончилась неудачно '+E.Message);
           Application.Terminate;
          end;
        on E : Exception do
          begin
           ShowMessage(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
           StatusBar.Panels[1].Text :=E.Message;
           Application.Terminate;
          end;
   end;
finally
  CloseFile(f);
end;
end;

procedure TMainForm.FileCloseAllExecute(Sender: TObject);
var
  i :integer;
  canClose : boolean;
begin
  //while MainForm.MDIChildCount > 0 do
  //  begin
  //    if assigned(MainForm.MDIChildren[0])then
  //      MainForm.MDIChildren[0].Close;
  //      Application.ProcessMessages;
  //  end;
 i := MDIChildCount - 1;
 while i >= 0 do
   begin
      canClose :=true;
      if assigned(MDIChildren[i]) then //Пытаемся закрыть
        begin
          if Assigned(MDIChildren[i].OnCloseQuery) //Присвоена ли процедура этому событию
                then MDIChildren[i].OnCloseQuery(MDIChildren[i], canClose);
          if canClose then  //если можем закрыть - закрываем, нет - разбираемся
            begin
                MDIChildren[i].Free;
            end
          else
            begin
                MDIChildren[i].BringToFront;
                break;
            end;
        end;


      Application.ProcessMessages;
      i := i - 1;
   end;

end;

procedure TMainForm.FileCloseAllUpdate(Sender: TObject);
begin
 (Sender as TAction).Enabled := (ActiveMDIChild <> nil);
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
      Close;
end;

procedure TMainForm.ToolButton13Click(Sender: TObject);
begin
 Calculator.Execute;
 end;

procedure TMainForm.v_Headers_Execute(Sender: TObject);
begin
   fmElementListDoc := TFormElementListDoc.Create(Application);
   fmElementListDoc.NameTableView := v_Headers;
   fmElementListDoc.doc_type := TDocType(StrToInt(StringReplace((Sender as TAction).Name, 'v_Headers_t', '', [rfReplaceAll, rfIgnoreCase])));
end;


procedure TMainForm.v_SetPricesExecute(Sender: TObject);
begin
   fmElementListSetPrices := TFormElementListSetPrices.Create(Application);
   fmElementListSetPrices.NameTableView := (Sender as TAction).Name;
end;

end.
