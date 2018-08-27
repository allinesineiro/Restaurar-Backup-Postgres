program RestaurarBackup;

uses
  Forms,
  RestauraBackup in 'RestauraBackup.pas' {Backup};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TBackup, Backup);
  Application.Run;
end.
