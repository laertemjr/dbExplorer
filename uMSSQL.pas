unit uMSSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,


  Data.DB,


  Vcl.Grids, Vcl.DBGrids,

  Data.Win.ADODB, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmMSSQL = class(TForm)
    StatusBar1: TStatusBar;
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
    procedure FormActivate(Sender: TObject);
    procedure cbbTablesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbDBChange(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMSSQL: TfrmMSSQL;
  PCname:string;

implementation

uses
   uDBexplorer, uGlobal;

{$R *.dfm}

procedure TfrmMSSQL.FormActivate(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := sVerInfo;
   lbledtUser.Text := 'sa';
   ADOConnection1.LoginPrompt := False;
   ADOConnection1.ConnectionTimeout := 60;
   PCname := GetComputerNameFunc;
   lbledtPassword.SetFocus;
end;

procedure TfrmMSSQL.cbbDBChange(Sender: TObject);
begin
   ADOConnection1.Connected := False;
   ADOConnection1.ConnectionString := 'Provider=SQLOLEDB.1;Password=' + Trim(lbledtPassword.Text) + ';Persist Security Info=True;User ID=' +
                                       Trim(lbledtUser.Text) + ';Initial Catalog=' + cbbDB.Text + ';Data Source=' + PCname; //     DESKTOP-FO3D8OA';
   Screen.Cursor := crSQLWait;
   ADOConnection1.Connected := True;
   Screen.Cursor := crDefault;
   ADOConnection1.GetTableNames(cbbTables.Items);
end;

procedure TfrmMSSQL.cbbTablesChange(Sender: TObject);
begin
   ADOTable1.Close;
   ADOTable1.TableName := cbbTables.Text;
   ADOTable1.Open;
   DataSource1.DataSet := ADOTable1;
   DBGrid1.DataSource := DataSource1;
end;

procedure TfrmMSSQL.btnConnectClick(Sender: TObject);
begin
   ADOConnection1.ConnectionString := 'Provider=SQLOLEDB.1;Password=' + Trim(lbledtPassword.Text) + ';Persist Security Info=True;User ID=' +
                                       Trim(lbledtUser.Text) + ';Initial Catalog=' + cbbDB.Text + ';Data Source=' + PCname;
   try
      Screen.Cursor := crSQLWait;
      ADOConnection1.Connected := True;
      Screen.Cursor := crDefault;
      ShowMessage('Connected to MS-SQL Server.');
      btnConnect.Enabled := False;
      lbledtUser.Enabled := False;
      lbledtPassword.Enabled := False;
   except
      ShowMessage('Could not connect to MS-SQL Server.');
      Screen.Cursor := crDefault;
      lbledtPassword.SetFocus;
      Exit;
   end;
   ADOQuery1.SQL.Text := 'SELECT name FROM sys.databases WHERE name NOT IN (' + QuotedStr('master') + ', ' +
                          QuotedStr('model') + ', ' + QuotedStr('msdb') + ', '+ QuotedStr('tempdb') + ') ORDER BY name';
   ADOQuery1.Open;
   ADOQuery1.First;
   cbbDB.Items.Clear;
   while not ADOQuery1.EOF do
   begin
      cbbDB.Items.Add(ADOQuery1.FieldByName('name').AsString);
      ADOQuery1.Next;
   end;
   ADOQuery1.Close;
end;

procedure TfrmMSSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ADOConnection1.Connected := False;
   lbledtUser.Enabled := True;
   lbledtPassword.Enabled := True;
   btnConnect.Enabled := True;
   cbbDB.Clear;
   cbbTables.Clear;
   lbledtUser.Clear;
   lbledtPassword.Clear;
end;

end.

