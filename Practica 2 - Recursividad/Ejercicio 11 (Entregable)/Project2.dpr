program Project2;

uses
  Vcl.Forms,
  UnitEje11 in 'UnitEje11.pas' {Form2},
  UnitMatematica in 'UnitMatematica.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
