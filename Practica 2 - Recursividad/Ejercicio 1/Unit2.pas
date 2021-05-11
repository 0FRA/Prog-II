unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    EditPalindromo: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

Function isPalindromo(cadena: string): Boolean;
var i: Integer;
Begin
  isPalindromo := True;
  // Caso base 1
{  If length(cadena) <= 1 then
    isPalindromo := True;  }

  // Caso base 2
  if cadena[1] <> cadena[length(cadena)] then
    isPalindromo := False;
  // Caso recursivo
  i := 1;
  while (i <= length(cadena)) do begin
    if cadena[i] <> cadena[length(cadena) - i + 1] then
      isPalindromo := False;
    i := i + 1;
  end;



End;

procedure TForm2.Button1Click(Sender: TObject);
begin
if isPalindromo(EditPalindromo.Text) then
  Application.MessageBox('Es Palindromo','OK',MB_OK)
else begin
   Application.MessageBox('NO es Palindromo','OK',MB_OK)
end;

end;
end.
