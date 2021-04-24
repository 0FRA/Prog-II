program Project1;

uses
  Vcl.Forms,
  UnitEjercicio4 in 'UnitEjercicio4.pas' {Form1},
  unitMatematica in 'unitMatematica.pas',
  Ordenamiento in 'Ordenamiento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
