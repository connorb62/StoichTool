// Stoich Tool
// (C) 2022 Connor Bell ALL RIGHTS RESERVED
unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Spin, pngimage, DateUtils;

type
  TfrmSettings = class(TForm)
    pgcMain: TPageControl;
    tsOutput: TTabSheet;
    tsActivation: TTabSheet;
    grpCustom: TGroupBox;
    grpBackground: TGroupBox;
    clrbxBackground: TColorBox;
    grpTextColour: TGroupBox;
    clrbxTextColor: TColorBox;
    grpFont: TGroupBox;
    cbbFont: TComboBox;
    seSize: TSpinEdit;
    pnlMain: TPanel;
    btnSave: TButton;
    btnClose: TButton;
    btnDefault: TButton;
    grpActStat: TGroupBox;
    pnlAct: TPanel;
    btn2: TButton;
    btnActivate: TButton;
    grpExtSet: TGroupBox;
    chkDuplicate: TCheckBox;
    imgActStat: TImage;
    edtActStat: TEdit;
    grpActDet: TGroupBox;
    lbledtDROL: TLabeledEdit;
    lblActCode: TLabel;
    edtActCode1: TEdit;
    edtActCode2: TEdit;
    edtActCode3: TEdit;
    edtActCode4: TEdit;
    grpActTools: TGroupBox;
    btnRenew: TButton;
    btnBuy: TButton;
    procedure btnDefaultClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure clrbxBackgroundChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chkDuplicateClick(Sender: TObject);
    procedure cbbFontChange(Sender: TObject);
    procedure seSizeChange(Sender: TObject);
    procedure clrbxTextColorChange(Sender: TObject);
    procedure btnShowMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnShowMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnActivateClick(Sender: TObject);
    procedure btnRenewClick(Sender: TObject);
    procedure btnBuyClick(Sender: TObject);
  private    { Private declarations }
  public    { Public declarations }
    bValid: Boolean;
    procedure Activation;

  end;

var
  frmSettings: TfrmSettings;


implementation

uses
  Main, Ext_Displ, Act;

{$R *.dfm}

procedure TfrmSettings.Activation;
var
  sActStat: string;
  dDROL: TDate;
  sActCode: string;
  sLine: string;
  iPos: Integer;
  txtFile: TextFile;
  arrLC: array[1..10] of string;
  iCount: Integer;
  iDays: Integer;
  I: Integer;

  sTemp: string;
begin
  // Check License
  //ACT#2023/06/30#1DIVD-PTY126-V2XD4-BT54J
  // ActStat#ExpDate#ActCode
  // Get License Code and Compare from Manifest

  bValid := False;

  if not FileExists('Act_Manifest.txt') then
    begin
        // Unactivated Product
      bValid := False;
      frmMain.statMain.Panels[2].Text := 'Cannot Locate License File Manifest';
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
    end;
  CloseFile(txtFile);

  // Read the License Information from File
  if not FileExists('License.txt') then
    begin
        // Unlicensed Product
      edtActStat.Font.Color := clRed;
      edtActStat.Text := 'Unlicensed Product';
      bValid := False;
      frmMain.statMain.Panels[2].Text := 'Cannot Locate License File';
    end
  else
    begin
      AssignFile(txtFile, 'License.txt');
      Reset(txtFile);
      Readln(txtFile, sLine);

      // Exp Date
      iPos := Pos('#', sLine);
      dDROL := StrToDate(Copy(sLine, 1, iPos - 1));
      Delete(sLine, 1, iPos);

      // License Code
      sActCode := sLine;
    end;
  CloseFile(txtFile);

  for I := 1 to iCount do
    begin
      if sActCode = arrLC[I] then
        begin
          bValid := True;
        end;
    end;

  sActCode := StringReplace(sActCode, '-', '', [rfReplaceAll, rfIgnoreCase]);

  // Validate License
  if (dDROL > Now)  and (Length(sActCode) = 20) and (bValid = True) then
    begin
        // The product is still activated
        // Show All Activation Information
      edtActStat.Font.Color := clGreen;
      edtActStat.Text := 'Licensed Product';
      imgActStat.Picture.LoadFromFile('accept.png');
      btnActivate.Enabled := False;
      btnBuy.Enabled := False;
        // Show Days DROL
      iDays := DaysBetween(Now, dDROL);
      lbledtDROL.Text := IntToStr(iDays) + ' days';

      edtActCode1.Text := Copy(sActCode, 1, 5);
      edtActCode2.Text := Copy(sActCode, 6, 5);
      edtActCode3.Text := Copy(sActCode, 11, 5);
      edtActCode4.Text := Copy(sActCode, 16, 5);

    end
  else
    begin
      // The product is not activated
      edtActStat.Font.Color := clRed;
      edtActStat.Text := 'Unlicensed Product';
      imgActStat.Picture.LoadFromFile('cross.png');
    end;

  if edtActStat.Text = 'Unlicensed Product' then
    begin
      btnActivate.Enabled := True;
    end
  else
    begin
      btnActivate.Enabled := False;
    end;
end;

procedure TfrmSettings.btnActivateClick(Sender: TObject);
begin
  // Activate the Product
  frmAct.Show;
end;

procedure TfrmSettings.btnCloseClick(Sender: TObject);
begin
  // Close the Form
  frmSettings.Close;
  frmMain.ReadSettings;
end;

procedure TfrmSettings.btnDefaultClick(Sender: TObject);
var
  txtFile: TextFile;
  sFontName: string;
  iBackCol, iFontCol: Integer;
  iFontSize: Integer;
  sDup: string;
begin
   // Restore Default Settings
  iFontSize := 8;
  iBackCol := clWhite;
  iFontCol := clBlack;
  sFontName := 'Consolas';
  chkDuplicate.Checked := False;
  sDup := 'False';
  // ITEMS MUST BE WRITTEN IN THE FOLLOWING ORDER
  // FONTNAME#FONTSIZE#BACKCOL#FONTCOL
  // Write To File
  if not FileExists('Settings.txt') then
    begin
      MessageDlg('Cannot Save Settings: "settings.txt" is either missing or corrupted.' + #13 + 'Fix the application file and try again', mtError, [mbOK], 0);
      Exit;
    end
  else
    begin
      // Write To File
      AssignFile(txtFile, 'Settings.txt');
      Rewrite(txtFile);
      Writeln(txtFile, sFontName + '#' + IntToStr(iFontSize) + '#' + IntToStr(iBackCol) + '#' + IntToStr(iFontCol) + '#' + sDup);
      MessageDlg('Saved', mtInformation, [mbOK], 0);
    end;
  CloseFile(txtFile);

  // Disable Save Button
  btnSave.Enabled := False;
end;

procedure TfrmSettings.btnRenewClick(Sender: TObject);
begin
  // Show Act Screen
  frmAct.Show;
end;

procedure TfrmSettings.btnSaveClick(Sender: TObject);
var
  txtFile: TextFile;
  sFontName: string;
  iBackCol, iFontCol: Integer;
  iFontSize: Integer;
  sDup: string;

begin
  // Get User Settings
  iFontSize := seSize.Value;
  iBackCol := clrbxBackground.Selected;
  iFontCol := clrbxTextColor.Selected;
  sFontName := cbbFont.Text;

  if chkDuplicate.Checked then
    begin
      sDup := 'True';
    end
  else
    begin
      sDup := 'False';
    end;
  // ITEMS MUST BE WRITTEN IN THE FOLLOWING ORDER
  // FONTNAME#FONTSIZE#BACKCOL#FONTCOL
  // Write To File
  if not FileExists('Settings.txt') then
    begin
      MessageDlg('Cannot Save Settings: "settings.txt" is either missing or corrupted.' + #13 + 'Fix the application file and try again', mtError, [mbOK], 0);
      Exit;
    end
  else
    begin
        // Write To File
      AssignFile(txtFile, 'Settings.txt');
      Rewrite(txtFile);
      Writeln(txtFile, sFontName + '#' + IntToStr(iFontSize) + '#' + IntToStr(iBackCol) + '#' + IntToStr(iFontCol) + '#' + sDup);
      MessageDlg('Saved', mtInformation, [mbOK], 0);
    end;
  CloseFile(txtFile);

  // Disable the save button
  btnSave.Enabled := False;

  // Proc
  frmMain.ReadSettings;
end;

procedure TfrmSettings.btnShowMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Show License Key
  edtActCode1.PasswordChar := #0;
  edtActCode2.PasswordChar := #0;
  edtActCode3.PasswordChar := #0;
  edtActCode4.PasswordChar := #0;
end;

procedure TfrmSettings.btnShowMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Hide Act Code
   // Show License Key
  edtActCode1.PasswordChar := '*';
  edtActCode2.PasswordChar := '*';
  edtActCode3.PasswordChar := '*';
  edtActCode4.PasswordChar := '*';
end;

procedure TfrmSettings.cbbFontChange(Sender: TObject);
begin
   // Enable Save Button
  btnSave.Enabled := True;
end;

procedure TfrmSettings.chkDuplicateClick(Sender: TObject);
begin
  // Enable Save Button
  btnSave.Enabled := True;
end;

procedure TfrmSettings.clrbxBackgroundChange(Sender: TObject);
begin
  // Enable the save button
  btnSave.Enabled := True;
end;

procedure TfrmSettings.clrbxTextColorChange(Sender: TObject);
begin
   // Enable Save Button
  btnSave.Enabled := True;
end;

procedure TfrmSettings.FormActivate(Sender: TObject);
var
  txtFile: TextFile;
  sFontName: string;
  iBackCol, iFontCol: Integer;
  iFontSize: Integer;
  iPos: Integer;
  sLine: string;
  iTextSize : Integer;
  iTextCol : Integer;
  sDup: string;
begin
  // Activation
  Activation;
   // Enable Save Button
  btnSave.Enabled := True;
  // Apply Saved File Settings to GUI
  // Read the text file
  // FONTNAME#FONTSIZE#BACKCOL#FONTCOL
  if not FileExists('Settings.txt') then
    begin
      clrbxTextColor.Selected := clBlack;
      clrbxBackground.Selected := clWhite;
      cbbFont.Text := 'Consolas';
      seSize.Value := 8;
      Exit;
    end
  else
    begin
        // Read from File
      AssignFile(txtFile, 'Settings.txt');
      Reset(txtFile);

      while not Eof(txtFile) do
        begin
          Readln(txtFile, sLine);

              // Font Name
          iPos := Pos('#', sLine);
          sFontName := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

              // Font Size
          iPos := Pos('#', sLine);
          iTextSize := StrToInt(Copy(sLine, 1, iPos - 1));
          Delete(sLine, 1, iPos);

              // Background Colour
          iPos := Pos('#', sLine);
          iBackCol := StrToInt(Copy(sLine, 1, iPos - 1));
          Delete(sLine, 1, iPos);

              // Text Colour
          iPos := Pos('#', sLine);
          iTextCol := StrToInt(Copy(sLine, 1, iPos - 1));
          Delete(sLine, 1, iPos);

              // Duplicate Settings
          sDup := sLine;
        end;
    end;
  CloseFile(txtFile);

  // Apply values to form
  cbbFont.Text := sFontName;
  seSize.Value := iTextSize;
  clrbxTextColor.Selected := iTextCol;
  clrbxBackground.Selected := iBackCol;

  if sDup = 'False' then
    begin
      chkDuplicate.Checked := False;
    end
  else
  if sDup = 'True' then
    begin
      chkDuplicate.Checked := True;
    end;
end;

procedure TfrmSettings.FormCreate(Sender: TObject);
{var
  sActStat: string;
  dDROL: TDate;
  sActCode: string;
  sLine: string;
  iPos: Integer;
  txtFile: TextFile;
  arrLC: array[1..10] of string;
  iCount: Integer;
  iDays: Integer;
  I: Integer;

  sTemp: string;}
begin
  // Check License
  //ACT#2023/06/30#1DIVD-PTY126-V2XD4-BT54J
  // ActStat#ExpDate#ActCode
  // Get License Code and Compare from Manifest

  {bValid := False;

  if not FileExists('Act_Manifest.txt') then
    begin
        // Unactivated Product
      bValid := False;
      frmMain.statMain.Panels[2].Text := 'Cannot Locate License File Manifest';
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
    end;
  CloseFile(txtFile);

  // Read the License Information from File
  if not FileExists('License.txt') then
    begin
        // Unlicensed Product
      edtActStat.Font.Color := clRed;
      edtActStat.Text := 'Unlicensed Product';
      bValid := False;
      frmMain.statMain.Panels[2].Text := 'Cannot Locate License File';
    end
  else
    begin
      AssignFile(txtFile, 'License.txt');
      Reset(txtFile);
      Readln(txtFile, sLine);

      // Exp Date
      iPos := Pos('#', sLine);
      dDROL := StrToDate(Copy(sLine, 1, iPos - 1));
      Delete(sLine, 1, iPos);

      // License Code
      sActCode := sLine;
    end;
  CloseFile(txtFile);

  for I := 1 to iCount do
    begin
      if sActCode = arrLC[I] then
        begin
          bValid := True;
        end;
    end;

  sActCode := StringReplace(sActCode, '-', '', [rfReplaceAll, rfIgnoreCase]);

  // Validate License
  if (dDROL > Now)  and (Length(sActCode) = 20) and (bValid = True) then
    begin
        // The product is still activated
        // Show All Activation Information
      edtActStat.Font.Color := clGreen;
      edtActStat.Text := 'Licensed Product';
      imgActStat.Picture.LoadFromFile('accept.png');
      btnActivate.Enabled := False;
      btnBuy.Enabled := False;
        // Show Days DROL
      iDays := DaysBetween(Now, dDROL);
      lbledtDROL.Text := IntToStr(iDays) + ' days';

      edtActCode1.Text := Copy(sActCode, 1, 5);
      edtActCode2.Text := Copy(sActCode, 6, 5);
      edtActCode3.Text := Copy(sActCode, 11, 5);
      edtActCode4.Text := Copy(sActCode, 16, 5);

    end
  else
    begin
      // The product is not activated
      edtActStat.Font.Color := clRed;
      edtActStat.Text := 'Unlicensed Product';
      imgActStat.Picture.LoadFromFile('cross.png');
    end;

  if edtActStat.Text = 'Unlicensed Product' then
    begin
      btnActivate.Enabled := True;
    end
  else
    begin
      btnActivate.Enabled := False;
    end; }
end;

procedure TfrmSettings.seSizeChange(Sender: TObject);
begin
   // Enable Save Button
  btnSave.Enabled := True;
end;

procedure TfrmSettings.btnBuyClick(Sender: TObject);
begin
  // Buy
  MessageDlg('Purchase StoichTool License: ' + #13 +
  '1 Year - $6.07 (R100.00)' + #13 + '2 Year - $12.14 (R200.00)' + #13 +
  'Contact: connorbell27@icloud.com | +27 66 202 1724 to purchase a license',
  mtInformation, [mbClose], 0);
end;

end.

