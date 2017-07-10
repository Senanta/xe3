program Senanta;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  element in 'element.pas' {FormElement},
  about in 'about.pas' {AboutBox},
  element_list in 'element_list.pas' {FormElementList},
  element_sprav in 'element_sprav.pas' {FormElementSprav},
  element_doc in 'element_doc.pas' {FormElementDoc},
  element_list_doc in 'element_list_doc.pas' {FormElementListDoc},
  element_list_sprav in 'element_list_sprav.pas' {FormElementListSprav};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
