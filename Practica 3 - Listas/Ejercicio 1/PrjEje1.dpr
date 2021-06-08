program PrjEje1;

uses
  Vcl.Forms,
  UnitEje1 in 'UnitEje1.pas' {Form2},
  ListArray in '..\ListArray.pas',
  Tipos in '..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
