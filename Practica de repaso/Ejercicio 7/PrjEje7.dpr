program PrjEje7;

uses
  Vcl.Forms,
  UnitEje7 in 'UnitEje7.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
