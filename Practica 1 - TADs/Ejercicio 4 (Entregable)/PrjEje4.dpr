program PrjEje4;

uses
  Vcl.Forms,
  InterfazBinario in 'InterfazBinario.pas' {Form1},
  TDA_Binario in 'TDA_Binario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
