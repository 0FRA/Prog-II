program ProjEje2;

uses
  Vcl.Forms,
  UnitEje2 in 'UnitEje2.pas' {Form2},
  ListArray in '..\ListArray.pas',
  ListCursor in '..\ListCursor.pas',
  ListPointer in '..\ListPointer.pas',
  Tipos in '..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
