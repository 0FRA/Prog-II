program PrjEje3;

uses
  Vcl.Forms,
  UnitEje3 in 'UnitEje3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
