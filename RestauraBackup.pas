unit RestauraBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TBackup = class(TForm)
    edthost: TEdit;
    lblhost: TLabel;
    edtporta: TEdit;
    lblporta: TLabel;
    lbldatabase: TLabel;
    edtdatabase: TEdit;
    edtcaminhobackup: TEdit;
    lblcaminhobackup: TLabel;
    btnrestaurar: TBitBtn;
    procedure btnrestaurarClick(Sender: TObject);
    procedure salvarComando();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Backup: TBackup;

implementation

{$R *.dfm}

procedure tbackup.salvarComando();
var
  arquivo: TextFile;
  comando: string;
begin
   comando := ('"C:/Program Files/PostgreSQL/9.3/bin\pg_restore.exe" ' + '--host ' + edthost.text + ' --port ' + edtporta.text + ' --username "postgres" ' +
 '--dbname ' + '"' + edtdatabase.text + '"' + ' --no-password  --clean --verbose ' + '"' + edtcaminhobackup.text + '"');

  AssignFile(arquivo,'C:\Program Files\PostgreSQL\9.3\bin\restore.bat');

  Rewrite(arquivo); //abre o arquivo para escrita

  Writeln(arquivo,'set PGPASSWORD=abc123!'); //escreve no arquivo e desce uma linha

  Write(arquivo,comando);// escreve no arquivo e não desce uma linha

  Closefile(arquivo); //fecha o handle de arquivo

end;

procedure TBackup.btnrestaurarClick(Sender: TObject);
begin
    salvarComando();
    WinExec('C:\Program Files\PostgreSQL\9.3\bin\restore.bat', SW_RESTORE);
end;

end.
