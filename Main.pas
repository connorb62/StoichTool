// Stoich Tool
{ (C) 2022 Connor Bell ALL RIGHTS RESERVED
  Date: 28 June 2022
}
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, ImgList, ToolWin, StdCtrls, Printers,
  ExtDlgs, Spin;

type
  TfrmMain = class(TForm)
    mmMain: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Edit2: TMenuItem;
    mmmView: TMenuItem;
    Helo1: TMenuItem;
    clbrMain: TCoolBar;
    tlbMain: TToolBar;
    ilMain: TImageList;
    statMain: TStatusBar;
    tmrMain: TTimer;
    pgcMain: TPageControl;
    tsMole: TTabSheet;
    rgCalcM: TRadioGroup;
    redOut: TRichEdit;
    pgcMethod: TPageControl;
    tsMass: TTabSheet;
    tsConc: TTabSheet;
    pnlCalcApply: TPanel;
    btnCalc: TButton;
    lbledtMass: TLabeledEdit;
    lbledtMolarMass: TLabeledEdit;
    lbledtConc: TLabeledEdit;
    lbledtVolume: TLabeledEdit;
    tsMassMain: TTabSheet;
    tsConcMain: TTabSheet;
    tsMolarMass: TTabSheet;
    tsDensity: TTabSheet;
    tsLR: TTabSheet;
    btnCalc1: TToolButton;
    btn2: TToolButton;
    btnBack: TToolButton;
    btnForward: TToolButton;
    btn3: TToolButton;
    btnSaveResults: TToolButton;
    btnPrintResults: TToolButton;
    btn4: TToolButton;
    btnClose: TToolButton;
    btnSettings: TToolButton;
    btnHelp: TToolButton;
    btnAbout: TToolButton;
    Print1: TMenuItem;
    Close1: TMenuItem;
    ClearOutput1: TMenuItem;
    ClearEdits1: TMenuItem;
    ReturnHome1: TMenuItem;
    Settings1: TMenuItem;
    About1: TMenuItem;
    ContactSupport1: TMenuItem;
    rgCM1: TRadioGroup;
    pgcQuan: TPageControl;
    tsMass2: TTabSheet;
    tsVol1: TTabSheet;
    lbledtMole1: TLabeledEdit;
    lbledtConc1: TLabeledEdit;
    lbledtMole2: TLabeledEdit;
    lbledtMolarMass1: TLabeledEdit;
    dlgPntMain: TPrintDialog;
    rgConc: TRadioGroup;
    pgcConc: TPageControl;
    tsConcConc: TTabSheet;
    lbledtMoleConc: TLabeledEdit;
    lbledtVolConc: TLabeledEdit;
    dlgSave1: TSaveDialog;
    mmBack: TMenuItem;
    Forward1: TMenuItem;
    tsYield: TTabSheet;
    grpCompounds: TGroupBox;
    lbledtC1: TLabeledEdit;
    lbledtC2: TLabeledEdit;
    seRadtio1: TSpinEdit;
    seRatio2: TSpinEdit;
    lbledtLRMole1: TLabeledEdit;
    lbledtLRMole2: TLabeledEdit;
    rgCalcMLR: TRadioGroup;
    btnScreenPopOut: TToolButton;
    rgCMMolar: TRadioGroup;
    pgcMolarMass: TPageControl;
    tsMolarMass3: TTabSheet;
    lbledtMolarMassMole: TLabeledEdit;
    lbledtMassMolarMass: TLabeledEdit;
    mmiExtDisp: TMenuItem;
    rgCMDens: TRadioGroup;
    pgcDensity: TPageControl;
    tsDensity2: TTabSheet;
    lbledtMassDen: TLabeledEdit;
    lbledtVolDens: TLabeledEdit;
    rgCMYield: TRadioGroup;
    pgcYield: TPageControl;
    tsYield1: TTabSheet;
    lbledtActual: TLabeledEdit;
    lbledtTheor: TLabeledEdit;
    procedure tmrMainTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure rgCalcMClick(Sender: TObject);
    procedure lbledtMolarMassChange(Sender: TObject);
    procedure lbledtVolumeChange(Sender: TObject);
    procedure rgCM1Click(Sender: TObject);
    procedure lbledtMolarMass1Change(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnApply1Click(Sender: TObject);
    procedure btnPrintResultsClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure lbledtVolConcChange(Sender: TObject);
    procedure btnSaveResultsClick(Sender: TObject);
    procedure statMainMouseEnter(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure ClearOutput1Click(Sender: TObject);
    procedure mmBackClick(Sender: TObject);
    procedure ReturnHome1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ContactSupport1Click(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure Forward1Click(Sender: TObject);
    procedure lbledtLRMole2Change(Sender: TObject);
    procedure btnScreenPopOutClick(Sender: TObject);
    procedure redOutChange(Sender: TObject);
    procedure mmiExtDispClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgCalcMLRClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     // Selection
    sSel: string;
    // Text File Var
    sBackgroundCol, sTextCol, sFontName, sLine: string;
    iTextSize, iPos: Integer;
    txtFile: TextFile;
    iTextCol, iBackCol: Integer;
    sDup: string;
    // Save Var
    sFileName: string;
    procedure ReadSettings;
  end;

var
  frmMain: TfrmMain;


implementation

uses
  Settings, Ext_Disp, Ext_Displ, Act;
{$R *.dfm}

procedure TfrmMain.About1Click(Sender: TObject);
begin
  // About 
  MessageDlg('About: Stoich Tool®' + #13 + 'Version 20220628' + #13 +
      '© 2022 Connor Bell ALL RIGHTS RESERVED', mtInformation, [mbClose], 0);
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
  // About 
  MessageDlg('About: Stoich Tool®' + #13 + 'Version 20220628' + #13 +
      '© 2022 Connor Bell ALL RIGHTS RESERVED', mtInformation, [mbClose], 0);
end;

procedure TfrmMain.btnApply1Click(Sender: TObject);
begin
  if tsMole.Showing = True then
  begin
    // Apply Calculation Method from Radiogroup 
    sSel := rgCalcM.Items[rgCalcM.ItemIndex];
    pgcMethod.Enabled := True;

    if sSel = 'Mass + Molar Mass' then
    begin
      tsMass.Show;
    end
    else if sSel = 'Concentration + Volume' then
    begin
      tsConc.Show;
    end;
  end
  else if tsMassMain.Showing = True then
  begin
    // Apply Radiogroup Selection 
    sSel := rgCM1.Items[rgCM1.ItemIndex];
    pgcQuan.Enabled := True;

    if (sSel = 'Mass (n = m / M)') or (sSel = 'Volume (n = v / V) (1)') then
    begin
      tsMass2.Show;
    end
    else if (sSel = 'Volume (c = n / V) (2)') then
    begin
      tsVol1.Show;
    end;
  end;
end;

procedure TfrmMain.btnBackClick(Sender: TObject);
begin
  // Back Button 
  if tsMole.Showing then
  begin
    Beep;
  end
  else if tsMassMain.Showing then
  begin
    tsMole.Show;
  end
  else if tsConcMain.Showing then
  begin
    tsMassMain.Show;
  end
  else if tsMolarMass.Showing then
  begin
    tsConcMain.Show;
  end
  else if tsDensity.Showing then
  begin
    tsMolarMass.Show;
  end
  else if tsLR.Showing then
  begin
    tsDensity.Show;
  end;

end;

procedure TfrmMain.btnCalcClick(Sender: TObject);
var
  rMole: Real;
  rMass, rMolar, rConc, rVol: Real;
  // Limiting Reagent Var
  sCompound: string;
  rMole1, rMole2: Real;
  iRatio1, iRatio2: Integer;
  rMultRat1, rMultRat2: Real;
  sComp1, sComp2: string;
  // Calc Var for LR
  rMoleA, rMoleB: Real;
  rDens : Real;
  // Yield
  rAct, rTheo : Real;
  rYield : Real;
begin
  // Calculations
  rMass := 0;
  rMolar := 0;
  rConc := 0;
  rVol := 0;
  rMole := 0;

  if tsMole.Showing = True then
    begin
      // Calculate Mole
      if (tsMass.Showing = True) and (sSel = '(n = m / M) / (n = v / V) ') then
      begin
        // Calculate Mole using the Mass formula
        redOut.Clear;
        redOut.Lines.Add('Calculate: Mole');
        redOut.Lines.Add('Calculation Method: n = m / M');
        statMain.Panels[2].Text := '';
        statMain.Panels[2].Text := 'CM: n = m / M';

        // Calculation
        rMass := StrToFloat(lbledtMass.Text);
        rMolar := StrToFloat(lbledtMolarMass.Text);
        rMole := rMass / rMolar;

        // Variable Output
        redOut.Lines.Add(#13 + 'Variables: ' + #13 + 'Mass: ' + FloatToStrF
            (rMass, ffNumber, 10, 2) + ' g' + #13 + 'Molar Mass: ' + FloatToStrF
            (rMolar, ffNumber, 10, 2) + ' g/mol');

        // Output
        redOut.Lines.Add(#13 + 'n = ' + FloatToStrF(rMole, ffNumber, 10, 2)
            + ' mol');
        redOut.Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now));

        // Clear Outputs
        lbledtMass.Clear;
        lbledtMolarMass.Clear;
      end
      else if (tsConc.Showing = True) and (sSel = '(c = n / V)') then
      begin
        // Calculate Mole using the Concentration formula
        redOut.Clear;
        redOut.Lines.Add('Calculate: Mole');
        redOut.Lines.Add('Calculation Method: c = n / v');
        statMain.Panels[2].Text := '';
        statMain.Panels[2].Text := 'CM: c = n / V';

        // Calculation
        rConc := StrToFloat(lbledtConc.Text);
        rVol := StrToFloat(lbledtVolume.Text);
        rMole := rVol * rConc;

        // Variable Output
        redOut.Lines.Add(#13 + 'Variables: ' + #13 + 'Concentration: ' +
            FloatToStrF(rConc, ffNumber, 10, 2) + ' mol/dm³' + #13 + 'Volume: ' +
            FloatToStrF(rVol, ffNumber, 10, 2) + ' dm³');

        // Output
        redOut.Lines.Add(#13 + 'n = ' + FloatToStrF(rMole, ffNumber, 10, 2)
            + ' mol');
        redOut.Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now));

        // Clear Inputs
        lbledtConc.Clear;
        lbledtVolume.Clear;
      end;
    end
  else if tsMassMain.Showing = True then
    begin
      // Calculate Quantity
      if (tsMass2.Showing) and (sSel = 'Mass (n = m / M)') then
      begin
        // Calculate Mass using the n = m / M formula
        statMain.Panels[2].Text := 'CM: n = m / M';
        redOut.Clear;
        redOut.Lines.Add('Calculate: Mass');
        redOut.Lines.Add('Calculation Method: n = m / M');
        rMole := StrToFloat(lbledtMole2.Text);
        rMolar := StrToFloat(lbledtMolarMass1.Text);

        // Calculation
        rMass := rMolar * rMole;

        // Variable Output
        redOut.Lines.Add(#13 + 'Variables: ' + #13 + 'Mole: ' + FloatToStrF
            (rMole, ffNumber, 10, 2) + ' mol' + #13 + 'Molar Mass: ' + FloatToStrF
            (rMolar, ffNumber, 10, 2) + ' g/mol');

        // Output
        redOut.Lines.Add(#13 + 'm = ' + FloatToStrF(rMass, ffNumber, 10, 2)
            + ' g');
        redOut.Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now));

        // Clear Inputs
        lbledtMolarMass1.Clear;
        lbledtMole2.Clear;
      end;
    end
  else
  if tsConcMain.Showing = True then
    begin
      // Calculate Concentration
      rMole := StrToFloat(lbledtMoleConc.Text);
      rVol := StrToFloat(lbledtVolConc.Text);

      // Calculation
      statMain.Panels[2].Text := 'CM: c = n / V';
      redOut.Clear;
      redOut.Lines.Add('Calculate: Concentration');
      redOut.Lines.Add('Calculation Method: c = n / V');

      redOut.Lines.Add(#13 + 'Variables: ' + #13 + 'Mole: ' + FloatToStrF
          (rMole, ffNumber, 10, 2) + ' mol' + #13 + 'Volume: ' + FloatToStrF
          (rVol, ffNumber, 10, 2) + ' dm³');

      rConc := rMole / rVol;
      // Output
      redOut.Lines.Add(#13 + 'c = ' + FloatToStrF(rConc, ffNumber, 10, 2)
          + ' mol/dm³');
      redOut.Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now));

      // Clear Edits
      lbledtVolConc.Clear;
      lbledtMoleConc.Clear;
    end
  else if tsLR.Showing = True then
    begin
      // Calculate the Limiting Reagent
      sCompound := rgCalcMLR.Items[rgCalcMLR.ItemIndex];
      // sCompound indicates which compound will be used for the calculation
      // and thus which compound will multipled by the ratio.

      // 1st Compound
      sComp1 := lbledtC1.Text;
      rMole1 := StrToFloat(lbledtLRMole1.Text);
      iRatio1 := seRadtio1.Value;

      // 2nd Compound
      sComp2 := lbledtC2.Text;
      rMole2 := StrToFloat(lbledtLRMole2.Text);
      iRatio2 := seRatio2.Value;

      /// Set Tab Stops
      redOut.TabStop := True;
      redOut.Paragraph.TabCount := 2;
      redOut.Paragraph.Tab[0] := 80;
      redOut.Paragraph.Tab[1] := 160;

      // Display Information
      { redOut.Lines.Add(sComp1 + #9 + sComp2);
        redOut.Lines.Add(IntToStr(iRatio1) + #9 + IntToStr(iRatio2));
        redOut.Lines.Add(FloatToStrF(rMole1, ffNumber, 10, 2) + #9 +
        FloatToStrF(rMole2, ffNumber, 10, 2)); }

      if sCompound = '1st Compound' then
      begin
        // Calculate using the first compound
        redOut.Clear;
        redOut.Lines.Add('Calculate: Limiting Reagent');
        redOut.Lines.Add('Calculation Method: 1st Compound' + #13);
        redOut.Lines.Add(sComp1 + #9 + sComp2);
        redOut.Lines.Add(IntToStr(iRatio1) + #9 + IntToStr(iRatio2));
        redOut.Lines.Add(FloatToStrF(rMole1, ffNumber, 10, 2) + #9 + FloatToStrF
            (rMole2, ffNumber, 10, 2));

        // Calculation
        rMoleA := rMole1 / iRatio1;
        rMoleB := rMoleA * iRatio2;

        // Display
        redOut.Lines.Add(FloatToStrF(rMoleA, ffNumber, 10, 2) + #9 + FloatToStrF
            (rMoleB, ffNumber, 10, 2));

        if rMoleB > rMole2 then
        begin
          // Show Limiting LR
          redOut.Lines.Add(#13 + sComp2 + ' is the limiting reagent');
          redOut.Lines.Add(sComp1 + ' is the excess reagent');
        end
        else if rMoleB < rMole2 then
        begin
          // Showing LR
          redOut.Lines.Add(#13 + sComp1 + ' is the limiting reagent');
          redOut.Lines.Add(sComp2 + ' is the excess reagent');
        end;
        redOut.Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now));
      end
      else if sCompound = '2nd Compound' then
      begin
        // Calculate using the second compound
        // Calculate using the first compound
        redOut.Clear;
        redOut.Lines.Add('Calculate: Limiting Reagent');
        redOut.Lines.Add('Calculation Method: 2nd Compound' + #13);
        redOut.Lines.Add(sComp1 + #9 + sComp2);
        redOut.Lines.Add(IntToStr(iRatio1) + #9 + IntToStr(iRatio2));
        redOut.Lines.Add(FloatToStrF(rMole1, ffNumber, 10, 2) + #9 + FloatToStrF
            (rMole2, ffNumber, 10, 2));

        // Calculation
        rMoleA := rMole2 / iRatio2;
        rMoleB := rMoleA * iRatio1;

        // Display
        redOut.Lines.Add(FloatToStrF(rMoleA, ffNumber, 10, 2) + #9 + FloatToStrF
            (rMoleB, ffNumber, 10, 2));

        if rMoleB > rMole1 then
        begin
          // Show LR
          redOut.Lines.Add(#13 + sComp1 + ' is the limiting reagent');
          redOut.Lines.Add(sComp2 + ' is the excess reagent');
        end
        else if rMoleB < rMole1 then
        begin
          // Show LR
          redOut.Lines.Add(#13 + sComp2 + ' is the limiting reagent');
          redOut.Lines.Add(sComp1 + ' is the excess reagent');
        end;
         redOut.Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now));
      end;

    end
  else if tsMolarMass.Showing = True then
    begin
      // Calculate Molar Mass
      statMain.Panels[2].Text := 'CM: n = m / M';
      with redOut do
      begin
        Clear;
        Lines.Add('Calculate: Molar Mass');
        Lines.Add('Calculation Method: n = m / M');

        rMole := StrToFloat(lbledtMolarMassMole.Text);
        rMass := StrToFloat(lbledtMassMolarMass.Text);

        Lines.Add(#13 + 'Variables: ' + #13 + 'Mole: ' + FloatToStrF
            (rMole, ffNumber, 10, 2) + ' mol' + #13 + 'Mass: ' + FloatToStrF
            (rMass, ffNumber, 10, 2) + ' g');
      end;

      rMolar := rMass / rMole;
      redOut.Lines.Add(#13 + 'M = ' + FloatToStrF(rMolar, ffNumber, 10, 2));
       redOut.Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now));
    end
  else
  if tsDensity.Showing = True then
    begin
      // Calculate Density
      rMass := StrToFloat(lbledtMassDen.Text);
      rVol := StrToFloat(lbledtVolDens.Text); // cm^3

      // Information
      with redOut do
        begin
          Lines.Clear;
          Lines.Add('Calculate: Density');
          Lines.Add('Calculation Method: p = m / v');
          statMain.Panels[2].Text := 'CM: p = m / v';


          // List Var
          Lines.Add(#13 + 'Variables: ' + #13 + 'Mass: ' +
          FloatToStrF(rMass, ffNumber, 10, 2) + ' g' + #13 +
          'Volume: ' + FloatToStrF(rVol, ffNumber, 10, 2) +
          ' cm³');

          // Calc
          rDens := rMass / rVol;
          Lines.Add(#13 + 'p = ' + FloatToStrF(rDens, ffNumber, 10, 2) +
          ' g/cm³');

          // Show Date

          Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now))

        end;
    end
  else
  if tsYield.Showing = True then
    begin
      with redOut do
        begin
          Clear;
          Lines.Add('Calculate: Percentage Yield');
          Lines.Add('Calculation Method: Actual / Theoretical * 100');
          statMain.Panels[2].Text := 'CM: A/T * 100';

          rAct := StrToFloat(lbledtActual.Text);
          rTheo := StrToFloat(lbledtTheor.Text);

          Lines.Add(#13 + 'Variables: ' + #13 +
          'Actual: ' + FloatToStrF(rAct, ffNumber, 10, 2) + ' g' +
          #13 + 'Theoretical: ' + FloatToStrF(rTheo, ffNumber, 10, 2) + ' g');

          // Calculation
          rYield := (rAct / rTheo) * 100;

          // Display
          Lines.Add(#13 + FloatToStrF(rYield, ffNumber, 10, 2) + ' % yield');
          Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now));
        end;
    end;
  // redOut.Lines.Add(#13 + DateToStr(Now) + #9 + TimeToStr(Now)); 
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
var
  iMessage: Integer;
begin
  // Terminate the Application 
  iMessage := MessageDlg('Exit the application now?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0);
  if iMessage = mrYes then
  begin
    // Term9inate the Application 
    Application.Terminate;
  end
  else if (iMessage = mrNo) or (iMessage = mrCancel) then
  begin
    // Cancel 
    Exit;
  end;
end;

procedure TfrmMain.btnForwardClick(Sender: TObject);
begin
  // Forward Button 
  if tsMole.Showing then
  begin
    tsMassMain.Show;
  end
  else if tsMassMain.Showing then
  begin
    tsConcMain.Show;
  end
  else if tsConcMain.Showing then
  begin
    tsMolarMass.Show;
  end
  else if tsMolarMass.Showing then
  begin
    tsDensity.Show;
  end
  else if tsDensity.Showing then
  begin
    tsLR.Show;
  end
  else if tsLR.Showing then
  begin
    Beep;
  end;
end;

procedure TfrmMain.btnHelpClick(Sender: TObject);
begin
  // Help Information 
  MessageDlg('Help:' + #13 + 'Help Website: www.github.com/connorb62' + #13 +
      'Email: connorbell27@icloud.com' + #13 + 'Cellphone: +27 66 202 1724',
    mtInformation, [mbClose], 0);
end;

procedure TfrmMain.btnPrintResultsClick(Sender: TObject);
var
  iPresX, iPresY: Integer;
begin
  // Print RichEdit Contents 
  // Set RichEdit to Default 
  with redOut do
  begin
    Font.Name := 'Consolas';
    //Font.Size := 8;
    Font.Color := clBlack;
    Color := clWhite;
  end;
  if dlgPntMain.Execute then
  begin
    redOut.Print(DateToStr(Now) + ' ' + TimeToStr(Now) + ' Calculation');
  end;
  // Set RichEdit Back to Previous 
  with redOut do
  begin
    Font.Name := sFontName;
    Font.Size := iTextSize;
    Font.Color := iTextCol;
    Color := iBackCol;
  end;

end;

procedure TfrmMain.btnSaveResultsClick(Sender: TObject);
begin
  // Save Rich Edit Contents to File 
  dlgSave1.FileName := 'Calculation_' + FormatDateTime(LongDateFormat, Now)
    + '.txt';
  if dlgSave1.Execute then
  begin
    redOut.Lines.SaveToFile(dlgSave1.FileName);
    statMain.Panels[2].Text := 'Saved: ' + dlgSave1.FileName;
    sFileName := dlgSave1.FileName;
  end;

end;

procedure TfrmMain.btnScreenPopOutClick(Sender: TObject);
begin
  // Pop Screen Out
  frmExtMain.Show;
  frmExtMain.redOut.Clear;
  frmExtMain.redOut.Lines.Add(redOut.Text);
end;

procedure TfrmMain.btnSettingsClick(Sender: TObject);
begin
  // Show Settings Form 
  frmSettings.Show;
end;

procedure TfrmMain.ClearOutput1Click(Sender: TObject);
begin
  // Clear Output 
  redOut.Lines.Clear;
end;

procedure TfrmMain.Close1Click(Sender: TObject);
var
  iMessage: Integer;
begin
  // Terminate the Application 
  iMessage := MessageDlg('Exit the application now?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0);
  if iMessage = mrYes then
  begin
    // Term9inate the Application 
    Application.Terminate;
  end
  else if (iMessage = mrNo) or (iMessage = mrCancel) then
  begin
    // Cancel 
    Exit;
  end;
end;

procedure TfrmMain.ContactSupport1Click(Sender: TObject);
begin
  // Help Information 
  MessageDlg('Help:' + #13 + 'Help Website: www.github.com/connorb62' + #13 +
      'Email: connorbell27@icloud.com' + #13 + 'Cellphone: +27 66 202 1724',
    mtInformation, [mbClose], 0);
end;

procedure TfrmMain.Edit1Click(Sender: TObject);
begin
  // Save Rich Edit Contents to File 
  dlgSave1.FileName := 'Calculation_' + FormatDateTime(LongDateFormat, Now)
    + '.txt';
  if dlgSave1.Execute then
  begin
    redOut.Lines.SaveToFile(dlgSave1.FileName);
    statMain.Panels[2].Text := 'Saved: ' + dlgSave1.FileName;
    sFileName := dlgSave1.FileName;
  end;
end;

procedure TfrmMain.mmiExtDispClick(Sender: TObject);
begin
    // Pop Screen Out
  frmExtMain.Show;
  frmExtMain.redOut.Clear;
  frmExtMain.redOut.Lines.Add(redOut.Text);
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
    // bValid Checker
    frmSettings.Activation;
    statMain.Panels[0].Text := DateToStr(Now);
   if frmSettings.bValid then
    begin
      // Product is Activated and no restrictions should apply
      frmMain.Caption := 'StoichTool';

      // Enable the extended display
      btnScreenPopOut.Enabled := True;
      mmMain.Items[2].Items[3].Enabled := True;

      // Enable Personalisation Ability
      frmSettings.tsOutput.Enabled := True;

      // Enable Print and Save Buttons
      btnSaveResults.Enabled := True;
      btnPrintResults.Enabled := True;
      Exit;
    end
   else
    begin
      statMain.Panels[2].Text := 'Unlicensed Product';
      frmMain.Caption := 'StoichTool (Unlicensed)';

      // Disable the extended display
      btnScreenPopOut.Enabled := False;
      mmMain.Items[2].Items[3].Enabled := False;

      // Disable Personalisation Ability
      frmSettings.tsOutput.Enabled := False;

      // Disable Print and Save Buttons
      btnSaveResults.Enabled := False;
      btnPrintResults.Enabled := False;
    end;

   // Set Date for Status Bar
  statMain.Panels[0].Text := DateToStr(Now);
  // Read Settings from Text File 
  if not FileExists('Settings.txt') then
  begin
    statMain.Panels[2].Text := 'Could not load Settings File';
    with redOut do
    begin
      Font.Color := clBlack;
      Font.Size := 8;
      Color := clWhite;
      Font.Name := 'Consolas';
    end;
    Exit;
  end
  else
  begin
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

      // Rich Edit Background Colour 
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
    // Apply Format Settings 
    with redOut do
    begin
      Font.Name := sFontName;
      Font.Size := iTextSize;
      Font.Color := iTextCol;
      Color := iBackCol;
    end;
    { ShowMessage(sFontName);
      ShowMessage(IntToStr(iTextSize));
      ShowMessage(IntToStr(iBackCol));
      ShowMessage(IntToStr(iTextCol)); }
    // Message 
    statMain.Panels[2].Text := '"Settings" module loaded';
  end;
  CloseFile(txtFile);

  // Save to Text File 
  dlgSave1.Filter := 'Text file (*.txt)|*.txt|Any file (*.*|*.*';
  sFileName := '';
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ReadSettings;
end;

procedure TfrmMain.Forward1Click(Sender: TObject);
begin
  // Forward Button 
  if tsMole.Showing then
  begin
    tsMassMain.Show;
  end
  else if tsMassMain.Showing then
  begin
    tsConcMain.Show;
  end
  else if tsConcMain.Showing then
  begin
    tsMolarMass.Show;
  end
  else if tsMolarMass.Showing then
  begin
    tsDensity.Show;
  end
  else if tsDensity.Showing then
  begin
    tsLR.Show;
  end
  else if tsLR.Showing then
  begin
    Beep;
  end;
end;

procedure TfrmMain.lbledtLRMole2Change(Sender: TObject);
begin
  // Enable the Calc Button 
  btnCalc.Enabled := True;
end;

procedure TfrmMain.lbledtMolarMass1Change(Sender: TObject);
begin
  // Enable Calc Button 
  btnCalc.Enabled := True;
end;

procedure TfrmMain.lbledtMolarMassChange(Sender: TObject);
begin
  // Enable Calc Button 
  btnCalc.Enabled := True;
end;

procedure TfrmMain.lbledtVolConcChange(Sender: TObject);
begin
  // Enable Calc Button 
  btnCalc.Enabled := True;
end;

procedure TfrmMain.lbledtVolumeChange(Sender: TObject);
begin
  // Enable Calc Button 
  btnCalc.Enabled := True;
end;

procedure TfrmMain.mmBackClick(Sender: TObject);
begin
  // Back Button 
  if tsMole.Showing then
  begin
    Beep;
  end
  else if tsMassMain.Showing then
  begin
    tsMole.Show;
  end
  else if tsConcMain.Showing then
  begin
    tsMassMain.Show;
  end
  else if tsMolarMass.Showing then
  begin
    tsConcMain.Show;
  end
  else if tsDensity.Showing then
  begin
    tsMolarMass.Show;
  end
  else if tsLR.Showing then
  begin
    tsDensity.Show;
  end;

end;

procedure TfrmMain.Print1Click(Sender: TObject);
begin
  // Print RichEdit Contents 
  // Set RichEdit to Default 
  with redOut do
  begin
    Font.Name := 'Consolas';
    Font.Size := 8;
    Font.Color := clBlack;
    Color := clWhite;
  end;
  if dlgPntMain.Execute then
  begin
    redOut.Print(DateToStr(Now) + ' ' + TimeToStr(Now) + ' Calculation');
  end;
  // Set RichEdit Back to Previous 
  with redOut do
  begin
    Font.Name := sFontName;
    Font.Size := iTextSize;
    Font.Color := iTextCol;
    Color := iBackCol;
  end;
end;

procedure TfrmMain.ReadSettings;
begin
   // Read Settings from Text File
  if not FileExists('Settings.txt') then
  begin
    statMain.Panels[2].Text := 'Could not load Settings File';
    with redOut do
    begin
      Font.Color := clBlack;
      Font.Size := 8;
      Color := clWhite;
      Font.Name := 'Consolas';
    end;
    Exit;
  end
  else
  begin
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

      // Rich Edit Background Colour
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
    // Apply Format Settings
    with redOut do
    begin
      Font.Name := sFontName;
      Font.Size := iTextSize;
      Font.Color := iTextCol;
      Color := iBackCol;
    end;
    { ShowMessage(sFontName);
      ShowMessage(IntToStr(iTextSize));
      ShowMessage(IntToStr(iBackCol));
      ShowMessage(IntToStr(iTextCol)); }
    // Message
    statMain.Panels[2].Text := '"Settings" module loaded';
  end;
  CloseFile(txtFile);
end;

procedure TfrmMain.redOutChange(Sender: TObject);
begin
  // Duplicate to extended display
  if frmExtMain.Showing = True then
    begin
      frmExtMain.redOut.Clear;
      frmExtMain.redOut.Lines.Add(redOut.Text);
    end
  else
  if frmExtMain.Showing = False then
    begin
      Exit;
    end;

end;

procedure TfrmMain.ReturnHome1Click(Sender: TObject);
begin
  // Home 
  tsMole.Show;
end;

procedure TfrmMain.rgCalcMClick(Sender: TObject);
begin
  // Enable Apply Button
  pgcMethod.Enabled := True;
  // Apply Calculation Method from Radiogroup
  sSel := rgCalcM.Items[rgCalcM.ItemIndex];
  pgcMethod.Enabled := True;

  if sSel = '(n = m / M) / (n = v / V)' then
    begin
      tsMass.Show;
      statMain.Panels[2].Text := 'CM: n = m / M';
    end
  else
  if sSel = '(c = n / V)' then
    begin
      tsConc.Show;
      statMain.Panels[2].Text := 'CM: c = n / V';
    end;
end;

procedure TfrmMain.rgCalcMLRClick(Sender: TObject);
begin
  // Enable Editing
  grpCompounds.Enabled := True;

    // Apply LR Calc Method
  if rgCalcMLR.Items[rgCalcMLR.ItemIndex] = '1st Compound' then
    begin
      // Use the First Compound for calculation
      lbledtC1.SetFocus;
      statMain.Panels[2].Text := 'CM: 1st Compound';
    end
  else
  if rgCalcMLR.Items[rgCalcMLR.ItemIndex] = '2nd Compound' then
    begin
      // Use the Second Compound for the calculation
      lbledtC1.SetFocus;
      statMain.Panels[2].Text := 'CM: 2nd Compound';
    end;

end;

procedure TfrmMain.rgCM1Click(Sender: TObject);
begin
  // Enable Editing Button
   pgcQuan.Enabled := True;
    // Apply Radiogroup Selection
  sSel := rgCM1.Items[rgCM1.ItemIndex];
  pgcQuan.Enabled := True;

  if (sSel = 'Mass (n = m / M)') or (sSel = 'Volume (n = v / V) (1)') then
    begin
      tsMass2.Show;
    end
  else
  if (sSel = 'Volume (c = n / V) (2)') then
    begin
      tsVol1.Show;
    end;
end;

procedure TfrmMain.Settings1Click(Sender: TObject);
begin
  // Show Settings Form 
  frmSettings.Show;
end;

procedure TfrmMain.statMainMouseEnter(Sender: TObject);
begin
  // Show Hint 
  if sFileName <> '' then
  begin
    statMain.Hint := 'Saved: ' + sFileName;
    statMain.ShowHint := True;
  end
  else
  begin
    statMain.ShowHint := False;
  end;
end;

procedure TfrmMain.tmrMainTimer(Sender: TObject);
begin
  // Set Time for Status Bar 
  statMain.Panels[1].Text := TimeToStr(Now);
end;

end.
