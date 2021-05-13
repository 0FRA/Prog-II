unit Eje14;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitParsing;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

function ExplosionAux(Numero, Bomba: Integer): String;
begin
  if Numero <= Bomba then
  begin
    Result := Numero.ToString;
  end
  else
  begin
    Result := ExplosionAux(Numero DIV Bomba, Bomba) + ' ' +
      ExplosionAux(Numero - (Numero DIV Bomba), Bomba);
  end;
end;

function Explosion(Numero, Bomba: Integer): Vector;
begin
  Result := Parsing(ExplosionAux(Numero,Bomba),' ');
end;

procedure TForm1.Button1Click(Sender: TObject);
var Numeros: Vector;
  i: Integer;
  Jose: Vector;
  Mariano: Array [1..20] of string;
begin
  Numeros := Explosion(strtoint(Edit1.Text),strtoint(Edit2.Text));
  SetLength(Jose, 20);
  for i := 1 to Length(Numeros) - 1 do
  begin
    memo1.Lines.Add(Numeros[i]);
  end;
end;

end.
