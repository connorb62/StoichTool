program StoichTool;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Settings in 'Settings.pas' {frmSettings},
  Ext_Displ in 'Ext_Displ.pas' {frmExtMain},
  Act in 'Act.pas' {frmAct};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'StoichTool';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmExtMain, frmExtMain);
  Application.CreateForm(TfrmAct, frmAct);
  Application.Run;
end.
