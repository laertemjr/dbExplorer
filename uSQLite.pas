unit uSQLite;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf,

  FireDAC.Phys, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc,

  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MSAccDef, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TfrmSQLite = class(TForm)
    StatusBar1: TStatusBar;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Label1: TLabel;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    ComboBox1: TComboBox;
    Label2: TLabel;
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
  frmSQLite: TfrmSQLite;

implementation

uses
   uDBexplorer;

{$R *.dfm}

procedure TfrmSQLite.FormActivate(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := sVerInfo;
   OpenDialog1.Filter := 'SQL database |*.db;*.db';
end;

procedure TfrmSQLite.Button1Click(Sender: TObject);
begin
   OpenDialog1.FileName := EmptyStr;
   if OpenDialog1.Execute then
   begin
      Edit1.Text := OpenDialog1.FileName;
      connectParams;
      try
         Screen.Cursor := crSQLWait;
         FDConnection1.Connected := True;
         Screen.Cursor := crDefault;
         ShowMessage('SQLite is connected.');
         FDConnection1.GetTableNames('', '', '', ComboBox1.Items);
      except
         ShowMessage('Could not connect to SQLite.');
         Screen.Cursor := crDefault;
         clean;
      end;
   end
   else
      clean;
end;

procedure TfrmSQLite.ComboBox1Change(Sender: TObject);
begin
   FDTable1.Close;
   FDTable1.TableName := ComboBox1.Text;
   FDTable1.Open;
   DataSource1.DataSet := FDTable1;
   DBGrid1.DataSource := DataSource1;
end;

procedure TfrmSQLite.connectParams;
begin
   FDConnection1.Params.Clear;
   FDConnection1.DriverName := 'SQLite';
   FDConnection1.Params.Add('Database=' + OpenDialog1.FileName);
end;

procedure TfrmSQLite.clean;
begin
   Edit1.Clear;
   ComboBox1.Clear;
   FDTable1.Close;
end;

procedure TfrmSQLite.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   clean;
   FDConnection1.Connected := False;
end;

end.
