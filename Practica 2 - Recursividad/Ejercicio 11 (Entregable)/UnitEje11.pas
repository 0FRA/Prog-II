unit UnitEje11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitMatematica, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    btnCalcular: TButton;
    Memo1: TMemo;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Vector = Array of Double;

Const
  // Población inicial contagiada
  P0 = 1000;

var
  Form2: TForm2;

  // Contagios: Vector;
implementation

{$R *.dfm}

function CalcularR(nDia, Cn, CnAnt: Integer): Double;
begin
  // Formula Pn = P0.(cn/cn-1)^n
  CalcularR := P0 * Potencia((Cn / CnAnt), nDia)
end;

function covichoAux(nDia, Cn, CnAnt: Integer; Var Contagios: Vector): Integer;
Var
  PCont_nDia: Double;
begin
  PCont_nDia := CalcularR(nDia, Cn, CnAnt);
  SetLength(Contagios, nDia + 1);
  Contagios[nDia] := PCont_nDia;
  // Caso base
  if PCont_nDia >= (P0 * 2) then
    covichoAux := nDia
  else
  begin
    Randomize;
    CnAnt := Cn;
    covichoAux := covichoAux(nDia + 1, Cn + (Random(80) + 1), CnAnt, Contagios);
  end;

end;

function Covicho(Cn, CnAnt: Integer): String;
Var
  Contagios: Vector;
  S: String;
  I, Dia: Integer;
begin
  Dia := covichoAux(1, Cn, CnAnt, Contagios);
  S := '';
  for I := 1 to Length(Contagios) - 1 do
  Begin
    S := S + 'Dia: #' + I.ToString + ' Cantidad: ' + trunc(Contagios[I]).ToString +
      #13#10;
  End;
  Result := 'El dia que se duplico la cantidad de contagio fue el #' + Dia.ToString +#13#10+S;

end;

procedure TForm2.btnCalcularClick(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add(Covicho(40, 30));
end;

end.
