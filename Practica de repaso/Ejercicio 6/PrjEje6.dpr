program PrjEje6;

uses
  Vcl.Forms,
  UnitEje6 in 'UnitEje6.pas' {Form1},
  UnitConversion in 'UnitConversion.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
