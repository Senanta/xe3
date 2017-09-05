unit refresh;

interface
uses
  System.SysUtils, System.Classes, Vcl.Dialogs, Data.DB, Data.Win.ADODB,System.Variants,
  //--------------------------------------------------------------------------------------
  main, element_list;

 procedure AssignRecord(Source, Destination: TDataSet);
 procedure RefreshElementList_AIL(const NameTableView: string; const DataSet :TDataSet);
 procedure RefreshElementList_AUL(const NameTableView :string; const DataSet :TDataSet);
 procedure RefreshElementList_ADL(const NameTableView: string;  const ID :Largeint);
 procedure RefreshSetPricesFromServer(const NameTableView: string; const Data: string; const id_type: Int64);
implementation

procedure RefreshSetPricesFromServer(const NameTableView: string; const Data: string; const id_type: Int64);
Var
  i:Integer;
begin
  i := MainForm.MDIChildCount - 1;
 while i >= 0 do
   begin
    if MainForm.MDIChildren[i] is TFormElementList then
     begin
         if TFormElementList(MainForm.MDIChildren[i]).NameTableView = NameTableView then
          begin
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.DisableControls; //������������ �� LargeInt
               TFormElementList(MainForm.MDIChildren[i]).DataInit;
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Locate('data;id_type', VarArrayOf([Data, id_type]), [loPartialKey]);
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.EnableControls;
          end;

     end;
    i := i - 1;
   end;
end;
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

procedure RefreshElementList_AIL(const NameTableView: string;
  const DataSet: TDataSet);
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
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.DisableControls; //������������ �� LargeInt
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.ReadOnly := false;

                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('ID').ReadOnly := false;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Append;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('ID').AsLargeInt :=DataSet.FieldByName('ID').AsLargeInt;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('ID').ReadOnly := true;
                  try
                      AssignRecord(DataSet, TFormElementList(MainForm.MDIChildren[i]).MemTableEh);
                      MainForm.StatusBar.Panels[1].Text :=DateTimeToStr(Now()) + ' ������� �������� ' + NameTableView + ': ' + DataSet.FieldByName('Name').AsString;
                   except
                    on E :EDatabaseError do
                      begin
                       ShowMessage(E.ClassName+' : ������� AssignRecord ���������� ����������� �������� '+E.Message);
                      end;
                    on E : Exception do
                      begin
                       ShowMessage(E.ClassName+' ��������� ������, � ���������� : '+E.Message);
                      end;
                  end;

               if (TFormElementList(MainForm.MDIChildren[i]).MemTableEh.State = dsEdit) or
                  (TFormElementList(MainForm.MDIChildren[i]).MemTableEh.State = dsInsert) then
                                TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Post;
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.ReadOnly := true;
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.EnableControls;
          end;

     end;
    i := i - 1;
   end;
end;

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
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Edit; //������ IsDeleted = 1 ��� 0
                  if TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('IsDeleted').AsBoolean
                    = true then
                   begin
                    s := '������������ ';
                    TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('IsDeleted').AsBoolean := False;
                   end
                  else
                   begin
                    s := '����� ';
                    TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('IsDeleted').AsBoolean := true;
                   end;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Post;
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.ReadOnly := true;
                  MainForm.StatusBar.Panels[1].Text :=DateTimeToStr(Now()) +
                  ' ������� ' + s + NameTableView + ': ' + TFormElementList(MainForm.MDIChildren[i]).MemTableEh.FieldByName('Name').AsString;
                end;
       end;
     end;
    i := i - 1;
   end;
end;

procedure RefreshElementList_AUL(const NameTableView: string;
  const DataSet: TDataSet);
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
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.DisableControls; //������������ �� LargeInt
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.ReadOnly := false;

               if TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Locate('ID', DataSet.FieldByName('ID').AsLargeInt, [loCaseInsensitive]) then
                begin
                  TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Edit; //������ �������� ����� �������� ������ �� �����
                  try
                      AssignRecord(DataSet, TFormElementList(MainForm.MDIChildren[i]).MemTableEh);
                      MainForm.StatusBar.Panels[1].Text :=DateTimeToStr(Now()) + ' ������� �������� ' + NameTableView + ': ' + DataSet.FieldByName('Name').AsString;
                  except
                    on E :EDatabaseError do
                      begin
                       ShowMessage(E.ClassName+' : ������� AssignRecord ���������� ����������� �������� '+E.Message);
                      end;
                    on E : Exception do
                      begin
                       ShowMessage(E.ClassName+' ��������� ������, � ���������� : '+E.Message);
                      end;
                  end;
                end;
               if (TFormElementList(MainForm.MDIChildren[i]).MemTableEh.State = dsEdit) or
                  (TFormElementList(MainForm.MDIChildren[i]).MemTableEh.State = dsInsert) then
                                TFormElementList(MainForm.MDIChildren[i]).MemTableEh.Post;
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.ReadOnly := true;
               TFormElementList(MainForm.MDIChildren[i]).MemTableEh.EnableControls;
          end;

     end;
    i := i - 1;
   end;
end;


end.
