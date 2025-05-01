unit uSQLServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.MSAccDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, ZAbstractConnection, ZConnection;

type
  TfrmSQLServer = class(TForm)
    StatusBar1: TStatusBar;
    btnConnect: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    edtUser: TEdit;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    Label4: TLabel;
    edtPort: TEdit;
    Label5: TLabel;
    edtPassword: TEdit;
    edtServerName: TEdit;
    Label6: TLabel;
    btnBrowse: TButton;
    edtPath: TEdit;
    SaveDialog1: TSaveDialog;
    btnDefault: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure edtPathChange(Sender: TObject);
  private
    { Private declarations }
    procedure connectParams();
    procedure clean();
    function GetComputerNameFunc : string;
  public
    { Public declarations }
  end;

var
  frmSQLServer: TfrmSQLServer;

implementation

uses
   Registry, uDBexplorer;

{$R *.dfm}

procedure TfrmSQLServer.FormActivate(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := sVerInfo;
   SaveDialog1.Filter := 'SQL Server Database Primary Data File (*.mdf)|*.mdf';
   SaveDialog1.InitialDir := 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA';
   btnDefault.Click;
end;

procedure TfrmSQLServer.btnBrowseClick(Sender: TObject);
var s:string;
begin
   if SaveDialog1.Execute then
   begin
      s := ExtractFileName(SaveDialog1.FileName);
      s := Copy (s, 1, Length(s) - Length(ExtractFileExt(s)));
      edtPath.Text := s;
   end
   else
      clean;
// also exists: ExtractFilePath()
end;

procedure TfrmSQLServer.btnConnectClick(Sender: TObject);
begin
   connectParams;
   try
      ZConnection1.Connected := True;
      ShowMessage('Database is connected.');
      ZConnection1.GetTableNames('dbo', '', ComboBox1.Items);
   except
      ShowMessage('Could not connect to database.');
      clean;
   end;
end;

procedure TfrmSQLServer.btnDefaultClick(Sender: TObject);
begin
   clean;
   edtPort.Text := '1433';
   edtUser.Text := 'sa';
   edtServerName.Text := GetComputerNameFunc;
   edtPassword.SetFocus;
end;

procedure TfrmSQLServer.ComboBox1Change(Sender: TObject);
begin
   ZTable1.Close;
   ZTable1.TableName := ComboBox1.Text;
   ZTable1.Open;
   DataSource1.DataSet := ZTable1;
   DBGrid1.DataSource := DataSource1;
end;

procedure TfrmSQLServer.connectParams;
var ConnData:string;
begin
   ZConnection1.Protocol := 'ado';
   ZConnection1.Port := StrToInt(edtPort.Text);
   // Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User ID=sa;Initial Catalog=dbMultiUserSystem;Data Source=DESKTOP-FO3D8OA
   ConnData := 'Provider=SQLOLEDB.1;Password=' + edtPassword.Text + ';Persist Security Info=True;User ID=' + edtUser.Text +
               ';Initial Catalog=' + edtPath.Text + ';Data Source=' + edtServerName.Text;
   ZConnection1.Database := ConnData;
end;

procedure TfrmSQLServer.edtPathChange(Sender: TObject);
begin
   if edtPath.Text = EmptyStr then
      btnConnect.Enabled := False
   else
      btnConnect.Enabled := True;
end;

function TfrmSQLServer.GetComputerNameFunc : string;
var ipbuffer : string;
      nsize : dword;
begin
   nsize := 255;
   SetLength(ipbuffer,nsize);
   if GetComputerName(pchar(ipbuffer),nsize) then
      result := ipbuffer;
end;

procedure TfrmSQLServer.clean;
begin
   edtPort.Clear;
   edtUser.Clear;
   edtPassword.Clear;
   edtServerName.Clear;
   edtPath.Clear;
   ComboBox1.Clear;
   ZTable1.Close;
   edtPort.SetFocus;
end;

procedure TfrmSQLServer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   clean;
   ZConnection1.Connected := False;
end;

end.
