unit refresh;

interface
uses
  System.SysUtils, System.Classes, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  //--------------------------------------------------------------------------------------
  main, element_list;

 procedure RefreshElementList_AUIL(const NameTableView :string; const DataSet :TDataSet; Insert :Boolean);
 procedure RefreshElementList_ADL(const NameTableView: string;  const ID :Largeint);

implementation

procedure RefreshElementList_ADL(const NameTableView: string;  const ID :Largeint);
var
    i :integer;
    s :string;
begin
i := MainForm.MDIChildCount - 1;
 while i >= 0 do
   begin
    if MainForm.MDIChildren[i] is TFormElementList then
     begin
      if TFormElementList(MainForm.MDIChildren[i]).NameTableView = NameTableView then
       begin
               if TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Locate('ID', ID, [loCaseInsensitive]) then
                begin
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.ReadOnly := False;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Edit; //Меняем IsDeleted = 1 или 0
                  if TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('IsDeleted').AsBoolean
                    = true then
                   begin
                    s := 'восстановлен ';
                    TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('IsDeleted').AsBoolean := False;
                   end
                  else
                   begin
                    s := 'удалён ';
                    TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('IsDeleted').AsBoolean := true;
                   end;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Post;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.ReadOnly := true;
                  MainForm.StatusBar.Panels[1].Text :=DateTimeToStr(Now()) +
                  ' Элемент ' + s + NameTableView + ': ' + TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('Name').AsString;
                end;
       end;
     end;
    i := i - 1;
   end;
end;

procedure RefreshElementList_AUIL(const NameTableView: string;
  const DataSet: TDataSet; Insert :Boolean);

  procedure AssignRecord(Source, Destination: TDataSet);
  var
    i: Integer;
    Field: TField;
  begin
    for i := 0 to Destination.FieldCount-1 do
      if Destination.Fields[i].FieldNo > 0 then
      begin
        Field := Source.FindField(Destination.Fields[i].FieldName);
        if (Field <> nil) and (not Field.ReadOnly) then
          Destination.Fields[i].Value := Field.Value;
      end;
  end;
var
    i :integer;
begin
i := MainForm.MDIChildCount - 1;
 while i >= 0 do
   begin
    if MainForm.MDIChildren[i] is TFormElementList then
     begin
         if TFormElementList(MainForm.MDIChildren[i]).NameTableView = NameTableView then
          begin
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.DisableControls; //Внимательней на LargeInt
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.ReadOnly := false;

               if insert then
                begin
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('ID').ReadOnly := false;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Append;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('ID').AsLargeInt :=DataSet.FieldByName('ID').AsLargeInt;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('ID').ReadOnly := true;
                end;

               if TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Locate('ID', DataSet.FieldByName('ID').AsLargeInt, [loCaseInsensitive]) then
                begin
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Edit; //Меняем значения полей найденой записи на новые
                  try
                      AssignRecord(DataSet, TFormElementList(MainForm.MDIChildren[i]).MemTableEh);
                      MainForm.StatusBar.Panels[1].Text :=DateTimeToStr(Now()) + ' Успешно сохранен ' + NameTableView + ': ' + DataSet.FieldByName('Name').AsString;
                  except
                    on E :EDatabaseError do
                      begin
                       ShowMessage(E.ClassName+' : Попытка AssignRecord выполнения завершилась неудачно '+E.Message);
                      end;
                    on E : Exception do
                      begin
                       ShowMessage(E.ClassName+' произошла ошибка, с сообщением : '+E.Message);
                      end;
                  end;
                end;
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Post;
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.ReadOnly := true;
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.EnableControls;
          end;

     end;
    i := i - 1;
   end;
end;


end.
