program dbExplorer;

uses
  Vcl.Forms,
  uDBexplorer in 'uDBexplorer.pas' {frmDBexplorer},
  uAccess in 'uAccess.pas' {frmAccess},
  uFirebird in 'uFirebird.pas' {frmFirebird},
  uMySQL in 'uMySQL.pas' {frmMySQL},
  uGlobal in 'uGlobal.pas',
  uMSSQL in 'uMSSQL.pas' {frmMSSQL},
  uPostgreSQL in 'uPostgreSQL.pas' {frmPostgreSQL},
  uSQLite in 'uSQLite.pas' {frmSQLite};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDBexplorer, frmDBexplorer);
  Application.CreateForm(TfrmAccess, frmAccess);
  Application.CreateForm(TfrmFirebird, frmFirebird);
  Application.CreateForm(TfrmMySQL, frmMySQL);
  Application.CreateForm(TfrmMSSQL, frmMSSQL);
  Application.CreateForm(TfrmPostgreSQL, frmPostgreSQL);
  Application.CreateForm(TfrmSQLite, frmSQLite);
  Application.Run;
end.
