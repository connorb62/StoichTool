unit Act;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DateUtils;

type
  TfrmAct = class(TForm)
    pnlAct: TPanel;
    btnActivate: TButton;
    btnCancel: TButton;
    edtActCode1: TEdit;
    edtActCode2: TEdit;
    edtActCode3: TEdit;
    edtActCode4: TEdit;
    lblEnter: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnActivateClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAct: TfrmAct;

implementation

uses
  Settings, Main;

{$R *.dfm}

procedure TfrmAct.btnActivateClick(Sender: TObject);
var
  txtFile : TextFile;
  arrLC : array[1..10] of string;
  sLine : string;
  iPos : Integer;
  iCount : Integer;
  I : Integer;
  sActCode : string;
  bValid : Boolean;
  iMessage : Integer;
  txtWrite : TextFile;
  dDate : TDate;
begin
  // Check the activation manifest
   sActCode := edtActCode1.Text + '-' + edtActCode2.Text + '-' +
   edtActCode3.Text + '-' + edtActCode4.Text;
   bValid := False;

  if not FileExists('Act_Manifest.txt') then
    begin
      // Act Manifest File Cannot be Loaded
      MessageDlg('Activation Failed: A specific system file "Act_Manifest" could not be located',
      mtError, [mbOK], 0);
      edtActCode1.Clear;
       edtActCode2.Clear;
       edtActCode3.Clear;
       edtActCode4.Clear;
       edtActCode1.SetFocus;
      frmAct.Close;
      Exit;
    end
  else
    begin
      AssignFile(txtFile, 'Act_Manifest.txt');
      Reset(txtFile);
      iCount := 0;
      while not Eof(txtFile) do
        begin
          Inc(iCount);
          Readln(txtFile, sLine);
          arrLC[iCount] := sLine;
        end;
      CloseFile(txtFile);
    end;


  for I := 1 to iCount do
    begin
      if sActCode = arrLC[I] then
        begin
          // The code is valid
          bValid := True;
        end;
    end;
  dDate := IncYear(Now, 1);
  // if the code was correct, tje write it to the file
   if bValid = True then
    begin
      if not FileExists('License.txt') then
        begin
          MessageDlg('Error: Cannot Issue License. "License" file does not exist',
          mtError, [mbOK], 0);
          Exit;
        end
      else
        begin
          // Write to File
          AssignFile(txtWrite, 'License.txt');
          Rewrite(txtWrite);
          Writeln(txtWrite, DateToStr(dDate) + '#' + sActCode);
          CloseFile(txtWrite);


          // Remove Restrictions
          with frmMain do
            begin
              frmMain.Caption := 'StoichTool';

              // Disable the extended display
              btnScreenPopOut.Enabled := True;

              // Disable Personalisation Ability
              frmSettings.tsOutput.Enabled := True;

              // Disable Print and Save Buttons
              btnSaveResults.Enabled := True;
              btnPrintResults.Enabled := True;
            end;
            edtActCode1.Clear;
           edtActCode2.Clear;
           edtActCode3.Clear;
           edtActCode4.Clear;
           edtActCode1.SetFocus;
          frmAct.Close;
        end;
    end
   else
    begin
      // The code was not successful
      iMessage := MessageDlg('Activation Failed: The license key provided is not valid',
      mtError, [mbRetry, mbCancel], 0);

      if iMessage = mrRetry then
        begin
          edtActCode1.Clear;
          edtActCode2.Clear;
          edtActCode3.Clear;
          edtActCode4.Clear;
          edtActCode1.SetFocus;
        end
      else
      if iMessage = mrCancel then
        begin
          edtActCode1.Clear;
           edtActCode2.Clear;
           edtActCode3.Clear;
           edtActCode4.Clear;
           edtActCode1.SetFocus;
          frmAct.Close;
        end;
        Exit;
    end;


end;

procedure TfrmAct.btnCancelClick(Sender: TObject);
begin
  // Close Act Screen


  edtActCode1.Clear;
  edtActCode2.Clear;
  edtActCode3.Clear;
  edtActCode4.Clear;
  edtActCode1.SetFocus;
  frmAct.Close;
end;

procedure TfrmAct.FormActivate(Sender: TObject);
begin
  edtActCode1.Clear;
  edtActCode2.Clear;
  edtActCode3.Clear;
  edtActCode4.Clear;
  edtActCode1.SetFocus;
end;

end.
