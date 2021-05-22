program prjELPyC;

uses
  Vcl.Forms,
  EjLPyC in 'EjLPyC.pas' {Form1},
  Tipos in '..\..\TADS\00_Tipos\Tipos.pas',
  ListPointer in '..\..\TADS\01_Listas\ListPointer.pas',
  ListCursor in '..\..\TADS\01_Listas\ListCursor.pas',
  ListArray in '..\..\TADS\01_Listas\ListArray.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
