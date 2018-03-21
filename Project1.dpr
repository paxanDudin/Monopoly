program Project1;

uses
  Vcl.Forms,
  Unit1 in 'ui\Unit1.pas' {Form1},
  UPiece in 'domain\UPiece.pas',
  UPlayer in 'domain\UPlayer.pas',
  UBoard in 'domain\UBoard.pas',
  UMGame in 'domain\UMGame.pas',
  UDie in 'domain\UDie.pas',
  USquare in 'domain\USquare.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
