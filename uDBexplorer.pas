unit uDBexplorer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmDBexplorer = class(TForm)
    StatusBar1: TStatusBar;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    function GetVersionInfo(const app:string):string;
  public
    { Public declarations }
  end;

var
  frmDBexplorer: TfrmDBexplorer;
  sVerInfo : string;

implementation

uses
   uAccess, uFirebird;

{$R *.dfm}

{ TfrmDBexplorer }

procedure TfrmDBexplorer.FormActivate(Sender: TObject);
begin
   sVerInfo := 'Versão ' + GetVersionInfo(Application.ExeName) + ' (2025) Delphi 12.1';
   StatusBar1.Panels[0].Text := sVerInfo;
end;

procedure TfrmDBexplorer.ComboBox1Change(Sender: TObject);
begin
   case ComboBox1.ItemIndex of

      0: // Microsoft Access (*.mdb)
      begin
         frmAccess.ShowModal;
      end;

      1: // Firebird (*.fdb)
      begin
         frmFirebird.ShowModal;
      end;

   end;
end;

function TfrmDBexplorer.GetVersionInfo(const app: string): string;
type
  TVersionInfo = packed record
    Dummy: array[0..7] of Byte;
    V2, V1, V4, V3: Word;
  end;
var
  Zero, Size: Cardinal;
  Data: Pointer;
  VersionInfo: ^TVersionInfo;
begin
  Size := GetFileVersionInfoSize(Pointer(app), Zero);
  if Size = 0 then
    Result := ''
  else
  begin
    GetMem(Data, Size);
    try
      GetFileVersionInfo(Pointer(app), 0, Size, Data);
      VerQueryValue(Data, '\', Pointer(VersionInfo), Size);
      Result := VersionInfo.V1.ToString + '.' + VersionInfo.V2.ToString + '.' + VersionInfo.V3.ToString + '.' + VersionInfo.V4.ToString;
    finally
      FreeMem(Data);
    end;
  end;
end;

end.
