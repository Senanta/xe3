unit set_prices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, element_list, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, MemTableDataEh, Data.DB, MemTableEh, Data.Win.ADODB,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.Menus, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.ComCtrls, Vcl.ToolWin;

type
  TFormElementListSetPrices = class(TFormElementList)
    quDel: TADOQuery;
    procedure ActionDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public


  end;

implementation
uses data_module_sql;
{$R *.dfm}

{ TFormElementListSetPrices }

procedure TFormElementListSetPrices.ActionDeleteExecute(Sender: TObject);

var
  idMsg : integer;
  Msg, NameForDelete   : string;
begin
  //inherited;

       NameForDelete := MemTableEh.FieldByName('Data').AsString + ' ' +MemTableEh.FieldByName('Name').AsString;
       Msg := 'Удалить элемент: ' + NameForDelete + ' ?';

    idMsg := MessageBox(Handle, PChar(Msg), PChar('Удаление'),
                MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2);
    Case idMsg of
       IDYES :
        begin
         quDel.Parameters.ParamByName('ID_Type').Value := MemTableEh.FieldByName('id_type').AsLargeInt;
         quDel.Parameters.ParamByName('d').Value := MemTableEh.FieldByName('Data').AsDateTime;
         quDel.Parameters.ParamByName('id_subj').Value := DataModuleSql.Headquarters;
         quDel.execSQL;
         DataInit;
        end;
       IDNO :
        begin

        end;
    End;
end;

end.
