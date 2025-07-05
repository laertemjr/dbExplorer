unit uFirebird;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf,

  FireDAC.Phys, Data.DB, FireDAC.Comp.Client,


  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.FBDef;

type
  TfrmFirebird = class(TForm)
    StatusBar1: TStatusBar;
    btnPathDB: TButton;
    OpenDialog1: TOpenDialog;
    edtPathDB: TEdit;
    Label1: TLabel;
    FDConnection1: TFDConnection;
    ComboBox1: TComboBox;
    Label2: TLabel;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    Label3: TLabel;
    edtPort: TEdit;
    edtPathLib: TEdit;
    btnPathLib: TButton;
    btnConnect: TButton;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnPathDBClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConnectClick(Sender: TObject);
    procedure btnPathLibClick(Sender: TObject);
  private
    { Private declarations }
    procedure connectParams();
    procedure clean();
  public
    { Public declarations }
  end;

var
  frmFirebird: TfrmFirebird;

implementation

uses
   uDBexplorer;

{$R *.dfm}

procedure TfrmFirebird.FormActivate(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := sVerInfo;
   edtPort.Text := '3050';
   btnPathDB.SetFocus;
end;

procedure TfrmFirebird.ComboBox1Change(Sender: TObject);
begin
   FDTable1.Close;
   FDTable1.TableName := ComboBox1.Text;
   FDTable1.Open;
   DataSource1.DataSet := FDTable1;
   DBGrid1.DataSource := DataSource1;
end;

procedure TfrmFirebird.connectParams;
begin
   FDConnection1.Params.Clear;
   FDConnection1.DriverName := 'FB';
   FDConnection1.LoginPrompt := False;
   FDConnection1.Params.Add('Database=' + edtPathDB.Text);
   FDConnection1.Params.Add('User_Name=SYSDBA');
   FDConnection1.Params.Add('Password=masterkey');
   FDConnection1.Params.Add('Protocol=TCPIP');
   FDConnection1.Params.Add('Server=127.0.0.1');
   FDConnection1.Params.Add('Port=' + edtPort.Text);
   //FDConnection1.Params.Add('CharacterSet=WIN1252');
   //FDConnection1.Params.Add('SQLDialect=3');
end;

procedure TfrmFirebird.btnPathDBClick(Sender: TObject);
begin
   OpenDialog1.FileName := EmptyStr;
   OpenDialog1.Filter := 'Firebird database (*.fdb)|*.fdb';
   if OpenDialog1.Execute then
      edtPathDB.Text := OpenDialog1.FileName
   else
      edtPathDB.Clear;
end;

procedure TfrmFirebird.btnPathLibClick(Sender: TObject);
begin
   OpenDialog1.FileName := EmptyStr;
   OpenDialog1.Filter := 'Firebird database library (*.dll)|*.dll';
   if OpenDialog1.Execute then
   begin
      FDPhysFBDriverLink1.VendorLib := OpenDialog1.FileName;
      edtPathLib.Text := OpenDialog1.FileName;
   end
   else
   begin
      FDPhysFBDriverLink1.VendorLib := EmptyStr;
      edtPathLib.Clear;
   end;
end;

procedure TfrmFirebird.btnConnectClick(Sender: TObject);
begin
   FDConnection1.Connected := False;
   connectParams;
   try
      Screen.Cursor := crSQLWait;
      FDConnection1.Connected := True;
      Screen.Cursor := crDefault;
      ShowMessage('Database is connected.');
      FDConnection1.GetTableNames('', '', '', ComboBox1.Items);
   except
      ShowMessage('Could not connect to database.');
      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmFirebird.clean;
begin
   edtPathDB.Clear;
   edtPathLib.Clear;
   ComboBox1.Clear;
   FDTable1.Close;
end;

procedure TfrmFirebird.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   clean;
   FDConnection1.Connected := False;
end;

end.
