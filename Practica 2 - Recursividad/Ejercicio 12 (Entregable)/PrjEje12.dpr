program PrjEje12;

uses
  Vcl.Forms,
  Eje12 in 'Eje12.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
