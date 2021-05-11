unit Unit2;

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

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ Dados dos números enteros m y n, construir una función recursiva
 que devuelva el producto de ambos, calculando el mismo como sumas
 sucesivas. Esto es: m*n=m+m+…+m, n veces.}
function productosuma(m, n: Integer): Integer;
Begin
  // caso base 1
  if n = 1 then
    productosuma := m
  else
    productosuma := m + productosuma(m, n-1);

 {productosuma(10, 5)
  m = 10
  n = 5
  productosuma = 0;
  productosuma := 10 + productosuma(10, 5-1)
  m =  20
  n = 4
  productosuma = 20
  productosuma := 20 + productosuma(20, 4-1)
  m = 30
  n = 3
  productosuma = 30
  productosuma := 30 + productosuma(30, 3-1);
  m = 40
  n = 2
  productosuma = 40
  productosuma := 40 + productuma(40, 2-1)
  m = 50
  n = 1
  como n es 1 entonces productosuma = 50

 }

End;

procedure TForm2.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add(productosuma(10, 5).toString);
end;

end.
