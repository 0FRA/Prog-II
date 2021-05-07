program Project1;

uses
  Vcl.Forms,
  InterfazEstacionamiento in 'InterfazEstacionamiento.pas' {Form1},
  TAD_Estacionamiento in 'TAD_Estacionamiento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
