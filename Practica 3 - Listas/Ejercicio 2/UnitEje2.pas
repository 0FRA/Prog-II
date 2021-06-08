unit UnitEje2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ListArray, ListCursor,
  ListPointer;

type
  TForm2 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure CargarEjemplo(Var aL1, aL2: Lista);
Var
  X: TipoElemento;
begin
  aL1.Crear(Numero, 4);
  aL2.Crear(Numero, 4);
  // L1 = (2, 5, 7, 3)
  X.Clave = 2;
  aL1.Agregar(X);
  X.Clave = 5;
  aL1.Agregar(X);
  X.Clave = 7;
  aL1.Agregar(X);
  X.Clave = 3;
  aL1.Agregar(X);
  // L2 = (8, 20, 28, 12)
  X.Clave = 8;
  aL2.Agregar(X);
  X.Clave = 20;
  aL2.Agregar(X);
  X.Clave = 28;
  aL2.Agregar(X);
  X.Clave = 12;
  aL2.Agregar(X);
end;

function IsDiv(aL1, aL2: Lista): Boolean;
Var
  PosL1, PosL2: PosicionLista;
  X1, X2: TipoElemento;
  isDivisible: Boolean; // Flag
Begin
  PosL1 := aL1.Comienzo;
  PosL2 := aL2.Comienzo;
  X1 := aL1.Recuperar(PosL1);
  X2 := aL2.Recuperar(PosL2);
  isDivisible := True;
  While (isDivisible) and (PosL1 < aL1.Fin) and (PosL2 < aL2.Fin) do
  begin
    if X1.Clave MOD X2.Clave = 0 then
    begin
      PosL1 := aL1.Siguiente(PosL1);
      X1 := aL1.Recuperar(PosL1);
      PosL2 := aL2.Siguiente(PosL1);
      X2 := aL2.Recuperar(PosL2)
    end
    else
      isDivisible := False;
  end;
  IsDiv := IsDivisible;
End;

end.
