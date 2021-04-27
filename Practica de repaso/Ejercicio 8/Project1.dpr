program Project1;

uses
  Vcl.Forms,
  UnitEj8 in 'UnitEj8.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
