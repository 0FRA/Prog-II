unit TDA_Matriz;

interface

Uses
  SysUtils, Math, System.Variants;

Const
  Min = 1;
  Max = 10;

Type
  // Enumerado
  ResultadoDeComparacion = (MAYOR, MENOR, IGUAL);

  // Objeto con Atributos privados y comportamiento publico
  Matriz = Object
    Private
      Items: Array[min..Max,min..Max] Of Variant;  // Atributo
    Public
      Procedure CargarAleatorio(RangoHasta: LongInt); // Operaciones
      Procedure SetValue(I,J: Integer; Valor: Variant);
      Function RetornarDiagonalPrincipal(): String;
      Function Sumar(Var aM: Matriz): Matriz;
      Function RetornarAsString(): String;
      Function GetValue(I,J: Integer): Variant;
      Function Comparar(Var aM: Matriz):ResultadoDeComparacion;
  End;


implementation

Procedure Matriz.CargarAleatorio(RangoHasta: LongInt);
Var I, J: Integer;
begin
  Randomize;
  for I := min to max do
    for J:= min to max do
      Items[I,J] := Random(RangoHasta);
End;

Procedure Matriz.SetValue(I,J: Integer; Valor: Variant);
Begin
  Items[I,J] := Valor;
End;

Function Matriz.RetornarDiagonalPrincipal(): String;
Var I: Integer;
    D1: String;
    D2: String;
    J: Integer;
begin
  D1 := '';
  J := max + 1;
  for I := min to max do Begin
    J := J - 1;
    D1 := D1 + VarToStr(Items[I,I]) + '   ';
    D2 := D2 + VarToStr(Items[I,J]) + '   ';
  RetornarDiagonalPrincipal := D1 + ' / ' + D2;
  End;
End;

Function Matriz.Sumar(Var aM: Matriz): Matriz;
Var I, J: Integer;
    MS: Matriz;
Begin
  for I := min to max do
    for J:= min to max do
      MS.Items[I,J] :=  Items[I,J] + aM.Items[I,J];
  Sumar := MS;
End;

Function Matriz.RetornarAsString(): String;
Var I,J: Integer;
    S: String;
begin
  S := '';
  for I := min to max do Begin
    for J:= min to max do
      S := S + VarToStr(Items[I,J]) + '   ';
    S := S + Chr(13) + Chr(10);
  End;
  RetornarAsString := S;
End;

Function Matriz.GetValue(I: Integer; J: Integer): Variant;
begin
  GetValue := Items[I, J];
end;

Function Matriz.Comparar(Var aM: Matriz):ResultadoDeComparacion;
Begin
  Comparar := IGUAL;
End;

end.
