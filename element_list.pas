unit element_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.Buttons, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, MemTableDataEh, MemTableEh, System.ImageList,
  Vcl.ImgList, EhLibMTE,System.UITypes,
  //--------------------------------------------------------------------------------------
  element;

type
  TBaseActionElement = (AddElement, CopyElement, EditElement);
function NameTableViewToStr( const NameTableView : String) : string;
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
    MemTableEh: TMemTableEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure ActionEditUpdate(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionAddCopyExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionDeleteUpdate(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
        Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField;
      State: TGridDrawState);
  private
    { Private declarations }
    FNameTableView :String; // Имя вьюва или таблицы для выбора
    FDelable :Boolean;
    FDestination :TForm;//Если не nil - указывает на форму которой нужно вернуть значение
  public
    property Delable: Boolean read FDelable write FDelable;
    property Destination :TForm read FDestination write FDestination;
    property NameTableView         :string read FNameTableView write FNameTableView;
    procedure DataInit; virtual;
    procedure BaseActionElement(const Action: TBaseActionElement);
    procedure Delete;
    procedure InitFormElement(const fmElement: TFormElement; const Action: TBaseActionElement);
    function SetDelable: Boolean;
  end;



implementation
uses data_module_sql, element_sprav_obj, element_sprav_subj, refresh, element_doc, set_price;
{$R *.dfm}
var
 fmElementSpravObj :TFormElementSpravObj;
 fmElementSpravSubj :TFormElementSpravSubj;
 fmElementDoc      :TFormElementDoc;
 fmSetPrice :TfmSetPrice;

 function NameTableViewToStr( const NameTableView : String) : string;
begin
 if NameTableView = v_Objects then
  begin
     Result := 'Номенклатура';
  end
 else if NameTableView = v_Subjects then
  begin
     Result := 'Контрагенты';
  end
 else if NameTableView = v_SetPrices then
  begin
     Result := 'Установки цен номенклатуры';
  end;
 end;

procedure TFormElementList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
// ReportMemoryLeaksOnShutdown := True;
end;

procedure TFormElementList.ActionAddCopyExecute(Sender: TObject);
begin
 BaseActionElement(CopyElement);
end;

procedure TFormElementList.ActionAddExecute(Sender: TObject);
begin
 BaseActionElement(AddElement);
end;

procedure TFormElementList.ActionDeleteExecute(Sender: TObject);
begin
  Delete;
end;

procedure TFormElementList.ActionDeleteUpdate(Sender: TObject);
begin
 (Sender as TAction).Enabled :=(not MemTableEh.IsEmpty) and Delable;
end;

procedure TFormElementList.ActionEditExecute(Sender: TObject);
begin
 BaseActionElement(EditElement);
end;

procedure TFormElementList.ActionEditUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not MemTableEh.IsEmpty);
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
   else if NameTableView = v_Headers then
    begin
       fmElementDoc := TFormElementDoc.Create(Application);
       InitFormElement(fmElementDoc, Action);
    end
    else if NameTableView = v_SetPrices then
    begin
       fmSetPrice := TfmSetPrice.Create(Application);
       fmSetPrice.NameTableView := NameTableView;
       fmSetPrice.Data := MemTableEh.FieldByName('data').AsDateTime;
       fmSetPrice.PriceName := MemTableEh.FieldByName('name').AsString;
            if Action = AddElement then  //новый
              begin
                fmSetPrice.ID := -1;
                fmSetPrice.Data := Now;
              end;
     if Action = EditElement then   //редактируем существующий
            fmSetPrice.ID := MemTableEh.FieldByName('id_type').AsLargeInt;
     if Action = CopyElement then
      begin
        fmSetPrice.ID := MemTableEh.FieldByName('id_type').AsLargeInt;
       // fmSetPrice.IsCopied :=true;
      end;

    end

   else
    begin

    end;

end;

procedure TFormElementList.InitFormElement(const fmElement: TFormElement; const Action: TBaseActionElement);
begin
     fmElement.NameTableView := NameTableView; // Присвоили имя view из формы списка
     if Action = AddElement then  //новый
            fmElement.ID := -1;
     if Action = EditElement then   //редактируем существующий
            fmElement.ID := MemTableEh.FieldByName('id').AsLargeInt;
     if Action = CopyElement then
      begin //копируем существующий в новый меняя ID на -1
        fmElement.ID := MemTableEh.FieldByName('id').AsLargeInt;
        fmElement.IsCopied :=true; // FID  в родителе переключится в -1;
      end;
 end;

procedure TFormElementList.DataInit();
begin
  DBGridEh1.Visible := false;
  quList.Close;
  quList.SQL.Clear;
  if NameTableView = v_SetPrices then
   begin
      quList.SQL.Add('Select * From dbo.' + NameTableView + ' Order by data_real');
   end
  else
    quList.SQL.Add('Select * From dbo.' + NameTableView);
  quList.Open;
  MemTableEh.LoadFromDataSet(quList, -1, lmCopy, false);
  MemTableEh.ReadOnly :=true;
  DataModuleSql.DefFields_TDBGridEh(NameTableView, DBGridEh1);
  Delable := SetDelable;
      if Owner is TfmSetPrice then
       begin
        MemTableEh.Locate('id', (Owner as TfmSetPrice).MemTableEh.FieldByName('id_obj').AsLargeInt, [loCaseInsensitive]);
       end;
  Caption := NameTableViewToStr(NameTableView);
  DBGridEh1.Visible := true;
  quList.Close;
end;

procedure TFormElementList.DBGridEh1DblClick(Sender: TObject);
begin
      if Owner is TfmSetPrice then
       begin
        if (Owner as TfmSetPrice).MemTableEh.State <> dsEdit then
        (Owner as TfmSetPrice).MemTableEh.Edit;
        (Owner as TfmSetPrice).MemTableEh.FieldByName('id_obj').AsLargeInt :=MemTableEh.FieldByName('id').AsLargeInt;
        (Owner as TfmSetPrice).MemTableEh.FieldByName('code').AsString :=MemTableEh.FieldByName('code').AsString;
        (Owner as TfmSetPrice).MemTableEh.FieldByName('name').AsString :=MemTableEh.FieldByName('name').AsString;
        Close;
       end;
end;

procedure TFormElementList.DBGridEh1DrawColumnCell(Sender: TObject; const Rect:
    TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if Column.FieldName = 'Img' then
  begin
    if TDBGridEh(Sender).DataSource.DataSet.FieldByName('IsDeleted').AsBoolean = True then
     begin
       TDBGridEh(Sender).Canvas.FillRect(Rect);
       ActionList1.Images.Draw(TDBGridEh(Sender).Canvas,Rect.Left+1,Rect.Top+1, 29);
     end
    else
     begin
       TDBGridEh(Sender).Canvas.FillRect(Rect);
       ActionList1.Images.Draw(TDBGridEh(Sender).Canvas,Rect.Left+1,Rect.Top+1, 30);
     end;
  end;
end;

procedure TFormElementList.DBGridEh1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  // If the record's CustNo is 4711 draw the entire row with a
  // line through it. (set the font style to strike out)
  if (Sender as TDBGridEh).DataSource.DataSet.FieldByName('IsDeleted').AsBoolean = true then
    with (Sender as TDBGridEh).Canvas do
    begin
      FillRect(Rect);
      // Set the font style to StrikeOut
      Font.Style := Font.Style + [fsStrikeOut];
      Font.Color := clMaroon;
      // Draw the cell right aligned for floats + offset
      if (Field.DataType = ftFloat) then
        TextOut(Rect.Right-TextWidth(Field.AsString)-3, Rect.Top+3, Field.AsString)
      // Otherwise draw the cell left aligned + offset
      else
        TextOut(Rect.Left+2,Rect.Top+3,Field.AsString);
    end;
end;

procedure TFormElementList.DBGridEh1SortMarkingChanged(Sender: TObject);
var
  i:Integer;
  s:String;
begin
  s := '';
  for i := 0 to DBGridEh1.SortMarkedColumns.Count-1 do
   if DBGridEh1.SortMarkedColumns[i].Title.SortMarker = smUpEh then
    begin
     s := s + DBGridEh1.SortMarkedColumns[i].FieldName + ' DESC, ';
    end
   else
    begin
     s := s + DBGridEh1.SortMarkedColumns[i].FieldName + ', ';
    end;
  if s <> '' then s := Copy(s,1,Length(s)-2); // Отсекаем последние ', '
  MemTableEh.SortByFields(s);
end;



procedure TFormElementList.Delete;
var
  idMsg : integer;
  Msg, NameForDelete   : string;
begin
       NameForDelete := MemTableEh.FieldByName('Code').AsString + ' ' +MemTableEh.FieldByName('Name').AsString;
    if MemTableEh.FieldByName('IsDeleted').AsBoolean then
      Msg := 'Отменить удаление элемента: ' + NameForDelete + ' ?'
    else
      Msg := 'Удалить элемент: ' + NameForDelete + ' ?';

    idMsg := MessageBox(Handle, PChar(Msg), PChar('Удаление'),
                MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2);
    Case idMsg of
       IDYES :
        begin
          if      (NameTableView = v_Objects) and (not FindRelations(v_Objects, MemTableEh.FieldByName('ID').AsLargeInt))  then
          begin
              DataModuleSql.Del_Obj.Parameters.ParamByName('id').Value := MemTableEh.FieldByName('ID').AsLargeInt;
            if MemTableEh.FieldByName('IsDeleted').AsBoolean then
              DataModuleSql.Del_Obj.Parameters.ParamByName('IsDeleted').Value := False
              else
               DataModuleSql.Del_Obj.Parameters.ParamByName('IsDeleted').Value := True;
            DataModuleSql.Del_Obj.ExecSQL;
            RefreshElementList_ADL(NameTableView, MemTableEh.FieldByName('ID').AsLargeInt);
          end
         else if (NameTableView = v_Subjects) and  (not FindRelations(v_Subjects, MemTableEh.FieldByName('ID').AsLargeInt)) then
          begin
            DataModuleSql.Del_Subj.Parameters.ParamByName('id').Value := MemTableEh.FieldByName('ID').AsLargeInt;
            if MemTableEh.FieldByName('IsDeleted').AsBoolean then
              DataModuleSql.Del_Subj.Parameters.ParamByName('IsDeleted').Value := False
              else
               DataModuleSql.Del_Subj.Parameters.ParamByName('IsDeleted').Value := True;
            DataModuleSql.Del_Subj.ExecSQL;
            RefreshElementList_ADL(NameTableView, MemTableEh.FieldByName('ID').AsLargeInt);
          end
         else
          begin
           MessageBox(Handle, PChar('У элемента есть зависимости!'), PChar('Удаление'),
                MB_OK + MB_ICONError);
          end;

        end;
       IDNO :
        begin

        end;
    End;
end;

function TFormElementList.SetDelable :Boolean;
begin
  if MemTableEh.FindField('IsDeleted') = nil then
   begin
     SetDelable := False;
   end
  else
     SetDelable := True;
end;

procedure TFormElementList.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled :=false;
  DataInit;
end;

end.
