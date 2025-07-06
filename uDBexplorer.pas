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

  public
    { Public declarations }
  end;

var
  frmDBexplorer: TfrmDBexplorer;
  sVerInfo : string;

implementation

uses
   uAccess, uFirebird, uMSSQL, uMySQL, uPostgreSQL, uGlobal;

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

      0: // Firebird
      begin
         frmFirebird.ShowModal;
      end;

      1: // MS-Access
      begin
         frmAccess.ShowModal;
      end;

      2: // MS-SQL Server
      begin
         frmMSSQL.ShowModal;
      end;

      3: // MySQL Server
      begin
         frmMySQL.ShowModal;
      end;

      4: // MySQL Server
      begin
         frmPostgreSQL.ShowModal;
      end;

   end;
end;

end.
