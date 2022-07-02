unit Ext_Disp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls;

type
  TfrmExt = class(TForm)
    clbrMain: TCoolBar;
    tlbMain: TToolBar;
    statMain: TStatusBar;
    redOut: TRichEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExt: TfrmExt;

implementation

uses
  Main, Settings;

{$R *.dfm}

procedure TfrmExt.FormActivate(Sender: TObject);
  // Read settings
  var
  txtFile : TextFile;
  sFontName: string;
  iBackCol, iFontCol: Integer;
  iFontSize: Integer;
  iPos : Integer;
  sLine : string;
  iTextSize : Integer;
  iTextCol : Integer;
  sDup : string;
begin
  // Apply Saved File Settings to GUI
  // Read the text file
  // FONTNAME#FONTSIZE#BACKCOL#FONTCOL
  if not FileExists('Settings.txt') then
    begin
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





  // Apply values to for
  if sDup = 'True' then
    begin
      with redOut do
        begin
          // Apply settings from file
          Color := iBackCol;
          Font.Name := sFontName;
          Font.Size := iTextSize;
          Font.Color := iTextCol;
        end;
    end
  else
  if sDup = 'False' then
    begin
      // Apply Default settings
      with redOut do
        begin
          Color := clWhite;
          Font.Color := clBlack;
          Font.Size := 14;
          Font.Name := 'Consolas';
        end;
    end;
end;


end.
