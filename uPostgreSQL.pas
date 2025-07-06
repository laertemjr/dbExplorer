unit uPostgreSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,


  FireDAC.Phys, Data.DB,


  Vcl.Grids, Vcl.DBGrids,

  Data.Win.ADODB, Vcl.Mask, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TfrmPostgreSQL = class(TForm)
    StatusBar1: TStatusBar;
    Label2: TLabel;
    DataSource1: TDataSource;
    cbbDB: TComboBox;
    lbledtUser: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    btnConnect: TButton;
    Label3: TLabel;
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    FDQuery1: TFDQuery;
    DBGrid1: TDBGrid;
    cbbTables: TComboBox;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    Label1: TLabel;
    btnBrowse: TButton;
    edtLib: TEdit;
    OpenDialog1: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbDBChange(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure conectParams();
    procedure cbbTablesChange(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPostgreSQL: TfrmPostgreSQL;

implementation

uses
   uDBexplorer, uGlobal, System.Types;

{$R *.dfm}

procedure TfrmPostgreSQL.FormActivate(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := sVerInfo;
   lbledtUser.Text := 'postgres';
   FDConnection1.LoginPrompt := False;
end;

procedure TfrmPostgreSQL.btnBrowseClick(Sender: TObject);
begin
   OpenDialog1.FileName := EmptyStr;
   OpenDialog1.Filter   := 'postgreSQL server library (*.dll)|*.dll';
   if OpenDialog1.Execute then
      edtLib.Text := OpenDialog1.FileName
   else
      edtLib.Text := EmptyStr;
end;

procedure TfrmPostgreSQL.cbbDBChange(Sender: TObject);
begin
   cbbTables.Clear;
   conectParams();
   FDConnection1.Params.Add('Database='+cbbDB.Text);
   Screen.Cursor := crSQLWait;
   FDConnection1.Connected := True;
   Screen.Cursor := crDefault;
   FDConnection1.GetTableNames(cbbDB.Text,'public','', cbbTables.Items);
end;

procedure TfrmPostgreSQL.cbbTablesChange(Sender: TObject);
begin
   FDTable1.Close;
   FDTable1.TableName := cbbTables.Text;
   FDTable1.Open;
   DataSource1.DataSet := FDTable1;
   DBGrid1.DataSource := DataSource1;
end;

procedure TfrmPostgreSQL.conectParams;
begin
   FDConnection1.Connected := False;
   FDConnection1.Params.Clear;
   FDConnection1.DriverName := 'PG';
   FDPhysPgDriverLink1.VendorLib := edtLib.Text;
   FDConnection1.Params.Add('User_Name='+lbledtUser.Text);
   FDConnection1.Params.Add('Password='+lbledtPassword.Text);
end;

procedure TfrmPostgreSQL.btnConnectClick(Sender: TObject);
begin
   conectParams();
   try
      Screen.Cursor := crSQLWait;
      FDConnection1.Connected := True;
      Screen.Cursor := crDefault;
      ShowMessage('Connected to postgreSQL Server.');
      btnConnect.Enabled := False;
      lbledtUser.Enabled := False;
      lbledtPassword.Enabled := False;
      btnBrowse.Enabled := False;
   except
      ShowMessage('Could not connect to postgreSQL Server.');
      Screen.Cursor := crDefault;
      lbledtPassword.SetFocus;
      Exit;
   end;
   FDQuery1.SQL.Text := 'SELECT datname FROM pg_database WHERE datistemplate = false AND datallowconn = true';
   FDQuery1.Open;
   FDQuery1.First;
   cbbDB.Items.Clear;
   while not FDQuery1.EOF do
   begin
      cbbDB.Items.Add(FDQuery1.FieldByName('datname').AsString);
      FDQuery1.Next;
   end;
   FDQuery1.Close;
end;

procedure TfrmPostgreSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FDConnection1.Connected := False;
   cbbDB.Clear;
   cbbTables.Clear;
   lbledtUser.Enabled := True;
   lbledtUser.Clear;
   lbledtPassword.Enabled := True;
   lbledtPassword.Clear;
   edtLib.Clear;
   btnBrowse.Enabled := True;
   btnConnect.Enabled := True;
end;

end.
