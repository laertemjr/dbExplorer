unit uFirebird;

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
  FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TfrmFirebird = class(TForm)
    StatusBar1: TStatusBar;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Label1: TLabel;
    FDConnection1: TFDConnection;
    ComboBox1: TComboBox;
    Label2: TLabel;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    Label3: TLabel;
    Edit2: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Change(Sender: TObject);
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
   OpenDialog1.Filter := 'Firebird database (*.fdb)|*.fdb';
end;

procedure TfrmFirebird.Button1Click(Sender: TObject);
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
   FDConnection1.Params.Add('Database=' + OpenDialog1.FileName);
   FDConnection1.Params.Add('User_Name=SYSDBA');
   FDConnection1.Params.Add('Password=masterkey');
   FDConnection1.Params.Add('Protocol=TCPIP');
   //FDConnection1.Params.Add('Server=127.0.0.1');
   FDConnection1.Params.Add('Port=' + Edit2.Text);
   //FDConnection1.Params.Add('CharacterSet=WIN1252');
   //FDConnection1.Params.Add('SQLDialect=3');
end;

procedure TfrmFirebird.Edit2Change(Sender: TObject);
begin
   if Edit2.Text <> EmptyStr then
      Button1.Enabled := True
   else
      Button1.Enabled := False;
end;

procedure TfrmFirebird.clean;
begin
   Edit1.Clear;
   Edit2.Clear;
   ComboBox1.Clear;
   FDTable1.Close;
   Edit2.SetFocus;
end;

procedure TfrmFirebird.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   clean;
   FDConnection1.Connected := False;
end;

end.
