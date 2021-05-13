unit Eje13;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Probar: TButton;
    EditNum: TEdit;
    procedure ProbarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function isdiv7(Numero: Integer): Integer;
Begin
  // Caso base
  if (Numero <= 70) AND (Numero >= 0) then
  begin
      Result := Numero;
  end
  else
  begin
    isdiv7(Numero - ((Numero MOD 10) * 2));
    Result := Numero;
  end;
end;

procedure TForm2.ProbarClick(Sender: TObject);
begin
  if isdiv7(StrToInt(EditNum.Text)) MOD 7 = 0 then
    Memo1.Lines.Add('Es divisible por 7');
end;

end.
