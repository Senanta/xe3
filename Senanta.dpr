program Senanta;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  element in 'element.pas' {FormElement},
  about in 'about.pas' {AboutBox},
  element_list in 'element_list.pas' {FormElementList},
  element_sprav_obj in 'element_sprav_obj.pas' {FormElementSpravObj},
  element_doc in 'element_doc.pas' {FormElementDoc},
  element_list_doc in 'element_list_doc.pas' {FormElementListDoc},
  element_list_sprav in 'element_list_sprav.pas' {FormElementListSprav},
  data_module_sql in 'data_module_sql.pas' {DataModuleSql: TDataModule},
  element_sprav_subj in 'element_sprav_subj.pas' {FormElementSpravSubj},
  set_prices in 'set_prices.pas' {FormElementListSetPrices},
  refresh in 'refresh.pas',
  dictionary in 'dictionary.pas' {fmDictionary},
  import_dbase_iii in 'import_dbase_iii.pas' {fmImport},
  report_osv in 'report_osv.pas' {fmReport_Osv},
  set_price in 'set_price.pas' {fmSetPrice},
  report_osv_acc in 'report_osv_acc.pas' {fmReportOsv_Acc},
  bottom_panel in 'bottom_panel.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TDataModuleSql, DataModuleSql);
  Application.CreateForm(TfmDictionary, fmDictionary);
  Application.CreateForm(TfmImport, fmImport);
  Application.Run;
end.
