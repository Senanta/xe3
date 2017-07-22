unit element_sprav_subj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, element, MemTableDataEh, Data.DB, MemTableEh,
  Data.Win.ADODB, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.StdCtrls, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBVertGridsEh, Vcl.ComCtrls;

///<summary>
/// Дочерняя форма элемента справочника Клиенты - наследуем от TFormElement
///</summary>
  type
  TFormElementSpravSubj = class(TFormElement)
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

end.
