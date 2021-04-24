program PrjEjercicio2;

uses
  Vcl.Forms,
  UnitEjercicio2 in 'UnitEjercicio2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
