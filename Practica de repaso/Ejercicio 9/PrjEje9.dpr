program PrjEje9;

uses
  Vcl.Forms,
  TDA_ArreglosDinamicos in 'TDA_ArreglosDinamicos.pas' {Form1},
  ArreglosDinamicos in 'ArreglosDinamicos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
