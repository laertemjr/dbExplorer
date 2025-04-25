program dbExplorer;

uses
  Vcl.Forms,
  uDBexplorer in 'uDBexplorer.pas' {frmDBexplorer},
  uAccess in 'uAccess.pas' {frmAccess},
  uFirebird in 'uFirebird.pas' {frmFirebird};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDBexplorer, frmDBexplorer);
  Application.CreateForm(TfrmAccess, frmAccess);
  Application.CreateForm(TfrmFirebird, frmFirebird);
  Application.Run;
end.
