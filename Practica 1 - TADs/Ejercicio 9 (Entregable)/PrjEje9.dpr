program PrjEje9;

uses
  Vcl.Forms,
  InterfazCajaRegistradora in 'InterfazCajaRegistradora.pas' {Form2},
  TAD_CajaRegistradora in 'TAD_CajaRegistradora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
