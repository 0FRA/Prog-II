unit Eje12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Vector = Array of Integer;
  Lista = Array of Vector;

var
  Form2: TForm2;
  A: Vector = [10, 3, 1, 7, 4, 2];
  N: Integer = 7;
  Subconjunto: Lista;

implementation

{$R *.dfm}

//procedure Ordenar(var aV: Vector);
//var
//  i, j, aux: Integer;
//Begin
//  for j := 1 to Length(aV) - 1 do
//    for i := 1 to Length(aV) - 1 do
//    begin
//      if aV[i] > aV[i + 1] then
//      begin
//        aux := aV[i + 1];
//        aV[i + 1] := aV[i];
//        aV[i] := aux;
//      end;
//    end;
//End;

procedure agregar(cadena: string);
Begin
// falta implementar al array Subconjuntos
  showmessage(cadena);
End;

Procedure subconj_rec(Conjunto: Vector; i, tmpSuma, n: Integer; s: string);
Var
  j: Integer;
begin
  for j := i + 1 to Length(Conjunto) do
  begin
    if tmpSuma + Conjunto[j] = n then
      agregar(s + Conjunto[j].ToString)
    else
    begin
      subconj_rec(Conjunto, j, tmpSuma + Conjunto[j], n, s + Conjunto[j].ToString)
    end;
  end;
end;

Procedure subconj(Conjunto: Vector; n: Integer);
var
  i: Integer;
Begin
  for i := 1 to Length(Conjunto) do
    subconj_rec(Conjunto, i, Conjunto[i], n, Conjunto[i].ToString)
End;

procedure TForm2.Button1Click(Sender: TObject);
begin
   subconj(A, N);
end;

end.
