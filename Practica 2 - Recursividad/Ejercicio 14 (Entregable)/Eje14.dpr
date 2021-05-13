program PrjEje14;

uses
  Vcl.Forms,
  Eje14 in 'Eje14.pas' {Form1},
  UnitParsing in 'UnitParsing.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
