unit uMySQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,


  FireDAC.Phys, Data.DB,


  Vcl.Grids, Vcl.DBGrids,

  Data.Win.ADODB, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmMySQL = class(TForm)
    StatusBar1: TStatusBar;
    Label1: TLabel;
    cbbTables: TComboBox;
    Label2: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    cbbDB: TComboBox;
    ADOQuery1: TADOQuery;
    lbledtUser: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    btnConnect: TButton;
    Label3: TLabel;
    cbbDSN: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure cbbTablesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbDBChange(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure cbbDSNChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMySQL: TfrmMySQL;

implementation

uses
   uDBexplorer, uGlobal;

{$R *.dfm}

procedure TfrmMySQL.FormActivate(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := sVerInfo;
   lbledtUser.Text := 'root';
   ADOConnection1.LoginPrompt := False;
   ADOConnection1.ConnectionTimeout := 60;
   GetRegKeys;
   for var i : Integer := 0 to valueNames.Count -1 do
      cbbDSN.Items.Add(valueNames[i]);
   valueNames.Free;
   cbbDSN.SetFocus;
end;

procedure TfrmMySQL.cbbDSNChange(Sender: TObject);
begin
   if cbbDSN.Text <> EmptyStr then
   begin
      lbledtUser.Enabled := True;
      lbledtPassword.Enabled := True;
      btnConnect.Enabled := True;
      lbledtPassword.SetFocus;
   end;
end;

procedure TfrmMySQL.cbbDBChange(Sender: TObject);
begin
   ADOConnection1.Connected := False;
   ADOConnection1.ConnectionString := 'DSN=' + cbbDSN.Text + ';Database=' + cbbDB.Text + ';UID=' + Trim(lbledtUser.Text) + ';PWD=' + Trim(lbledtPassword.Text);
   Screen.Cursor := crSQLWait;
   ADOConnection1.Connected := True;
   Screen.Cursor := crDefault;
   ADOConnection1.GetTableNames(cbbTables.Items);
end;

procedure TfrmMySQL.cbbTablesChange(Sender: TObject);
begin
   ADOTable1.Close;
   ADOTable1.TableName := cbbTables.Text;
   ADOTable1.Open;
   DataSource1.DataSet := ADOTable1;
   DBGrid1.DataSource := DataSource1;
end;

procedure TfrmMySQL.btnConnectClick(Sender: TObject);
begin
   ADOConnection1.ConnectionString := 'DSN=' + cbbDSN.Text + ';Database=;UID=' + Trim(lbledtUser.Text) + ';PWD=' + Trim(lbledtPassword.Text);
   try
      Screen.Cursor := crSQLWait;
      ADOConnection1.Connected := True;
      Screen.Cursor := crDefault;
      ShowMessage('Connected to MySQL Server.');
      cbbDSN.Enabled := False;
      btnConnect.Enabled := False;
      lbledtUser.Enabled := False;
      lbledtPassword.Enabled := False;
   except
      ShowMessage('Could not connect to MySQL Server.');
      Screen.Cursor := crDefault;
      lbledtPassword.SetFocus;
      Exit;
   end;
   //ADOQuery1.SQL.Text := 'SHOW DATABASES';
   ADOQuery1.SQL.Text := 'SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME NOT IN (' + QuotedStr('mysql') + ', ' +
                          QuotedStr('information_schema') + ', ' + QuotedStr('performance_schema') + ', ' + QuotedStr('sys')+ ')';
   ADOQuery1.Open;
   ADOQuery1.First;
   cbbDB.Items.Clear;
   while not ADOQuery1.EOF do
   begin
      cbbDB.Items.Add(ADOQuery1.FieldByName('SCHEMA_NAME').AsString);
      ADOQuery1.Next;
   end;
   ADOQuery1.Close;
end;

procedure TfrmMySQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ADOConnection1.Connected := False;
   cbbDSN.Enabled := True;
   cbbDSN.Clear;
   cbbDB.Clear;
   cbbTables.Clear;
   lbledtUser.Clear;
   lbledtPassword.Clear;
end;

end.
