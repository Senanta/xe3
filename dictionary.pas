unit dictionary;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DataDriverEh, ADODataDriverEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, MemTableDataEh, Data.DB, Data.Win.ADODB, MemTableEh
  , EhLibMTE;

type
  TfmDictionary = class(TForm)
    PanelTop: TPanel;
    PanelMiddle: TPanel;
    PanelBottom: TPanel;
    btOK: TButton;
    DBGridEh: TDBGridEh;
    ADOConnectionProviderEh: TADOConnectionProviderEh;
    ADODataDriverEh: TADODataDriverEh;
    MemTableEh1: TMemTableEh;
    DataSource1: TDataSource;
    procedure btOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDictionary: TfmDictionary;

implementation
uses data_module_sql;
{$R *.dfm}

procedure TfmDictionary.btOKClick(Sender: TObject);
begin
  if (MemTableEh1.State = dsEdit) or (MemTableEh1.State = dsInsert) then
     MemTableEh1.Post;
  Close;
end;

procedure TfmDictionary.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MemTableEh1.Active :=false;
end;

procedure TfmDictionary.FormCreate(Sender: TObject);
begin
// ADOConnectionProviderEh.Connection := DataModuleSql.ADOConnection1;
end;

procedure TfmDictionary.FormShow(Sender: TObject);
begin
 MemTableEh1.Active :=true;
end;

end.
