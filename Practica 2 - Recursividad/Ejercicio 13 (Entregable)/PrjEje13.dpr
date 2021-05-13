program PrjEje13;

uses
  Vcl.Forms,
  Eje13 in 'Eje13.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
