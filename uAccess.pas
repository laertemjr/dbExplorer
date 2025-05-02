unit uAccess;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.MSAccDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  TfrmAccess = class(TForm)
    StatusBar1: TStatusBar;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDConnection1: TFDConnection;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure connectParams();
    procedure clean();
  public
    { Public declarations }
  end;

var
  frmAccess: TfrmAccess;

implementation

uses
   uDBexplorer;

{$R *.dfm}

procedure TfrmAccess.FormActivate(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := sVerInfo;
   OpenDialog1.Filter := 'Microsoft Access database|*.mdb;*.accdb';
end;

procedure TfrmAccess.Button1Click(Sender: TObject);
begin
   OpenDialog1.FileName := EmptyStr;
   if OpenDialog1.Execute then
   begin
      Edit1.Text := OpenDialog1.FileName;
      connectParams;
      try
         FDConnection1.Connected := True;
         ShowMessage('Database is connected.');
         FDConnection1.GetTableNames('', '', '', ComboBox1.Items);
      except
         ShowMessage('Could not connect to database.');
         clean;
      end;
   end
   else
      clean;
end;

procedure TfrmAccess.ComboBox1Change(Sender: TObject);
begin
   FDTable1.Close;
   FDTable1.TableName := ComboBox1.Text;
   FDTable1.Open;
   DataSource1.DataSet := FDTable1;
   DBGrid1.DataSource := DataSource1;
end;

procedure TfrmAccess.connectParams;
begin
   FDConnection1.Params.Clear;
   FDConnection1.DriverName := 'MSAcc';
   FDConnection1.Params.Add('Database=' + OpenDialog1.FileName);
end;

procedure TfrmAccess.clean;
begin
   Edit1.Clear;
   ComboBox1.Clear;
   FDTable1.Close;
end;

procedure TfrmAccess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   clean;
   FDConnection1.Connected := False;
end;

end.
