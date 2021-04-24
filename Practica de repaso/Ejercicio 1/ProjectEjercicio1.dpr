program ProjectEjercicio1;

uses
  Vcl.Forms,
  Ejercicio1 in 'Ejercicio1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
