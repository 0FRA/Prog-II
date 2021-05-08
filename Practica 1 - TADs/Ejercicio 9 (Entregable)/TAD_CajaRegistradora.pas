unit TAD_CajaRegistradora;

interface

Uses SysUtils, Math;

Const
  // Constante de monedas y billetes de circulación legal
  Denominaciones: Array [1 .. 15] of Real = (0.01, 0.05, 0.10, 0.25, 0.50, 1, 2,
    5, 10, 20, 50, 100, 200, 500, 1000);

Type
  ArrayDisponibilidad = Array [1 .. 15] of Integer;

  CajaRegistradora = Object
  Private
    // Acumulador de cantidad de billetes/monedas
    Cantidades: ArrayDisponibilidad;
  Public
    Procedure Crear();
    Procedure EstadoYSaldo(Var aTotal: Real;
      Var aDisponibilidad: ArrayDisponibilidad);
    Function Cargar(Denominacion, Cantidad: LongInt): Boolean;
    Procedure DarVuelto(aCobrar: Real; PagaCon: ArrayDisponibilidad; Var ArrayVuelto: ArrayDisponibilidad);


  End;

implementation

// Inicializa el array de cantidades en 0;
Procedure CajaRegistradora.Crear();
Var
  I: Integer;
Begin
  for I := 1 to Length(Cantidades) do
    Cantidades[I] := 0;
End;

Procedure CajaRegistradora.EstadoYSaldo(Var aTotal: Real;
  Var aDisponibilidad: ArrayDisponibilidad);
Var
  I: Integer;
Begin
  aTotal := 0;
  for I := 1 to Length(Cantidades) do
  Begin
    aTotal := aTotal + Denominaciones[I] * Cantidades[I];
    aDisponibilidad[I] := Cantidades[I];
  End;

End;

Function CajaRegistradora.Cargar(Denominacion, Cantidad: LongInt): Boolean;
Var
  ExisteDenominacion: Boolean;
Begin
  ExisteDenominacion := (Denominacion >= 1) and (Denominacion <= 15);
  if ExisteDenominacion then
  Begin
    Cantidades[Denominacion] := Cantidades[Denominacion] + Cantidad;
    Cargar := True;
  End
  Else
    Cargar := False;
End;

Procedure CajaRegistradora.DarVuelto(aCobrar: Real; PagaCon: ArrayDisponibilidad; Var ArrayVuelto: ArrayDisponibilidad);
Var
  Vuelto: Real;
  I: Integer;
  Total_Paga: Real;
  //ArrayVuelto: ArrayDisponibilidad;
Begin
  Total_Paga := 0;
  for I := 1 to Length(Cantidades) do
  Begin
    if PagaCon[I] > 0 then
    Begin
      Total_Paga := PagaCon[I] * Denominaciones[I];
      // Aumento la cantidad en la caja
      Cantidades[I] := Cantidades[I] + 1;
    End;
    ArrayVuelto[I] := 0;
  End;
  Vuelto := Total_Paga - aCobrar;

  for I := Length(Cantidades) downto 1 do
  Begin
    if Vuelto > 0 then
    Begin
      if ((Vuelto - Denominaciones[I]) >= 0) AND (Cantidades[I] > 0) then
      Begin
        Vuelto := Vuelto - Denominaciones[I];
        // Quito dinero de la caja
        Cantidades[I] := Cantidades[I] - 1;
        // Incremento la cantidad correspondiente para el vuelto
        ArrayVuelto[I] := ArrayVuelto[I] + 1;
      End;

    End;
  End;
End;

end.
