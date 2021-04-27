Unit TAD_NumeroRacional;

Interface
Uses SysUtils, Math, System.Variants;

Type
  // Enumerado
  ResultadoDeComparacion = (MAYOR, MENOR, IGUAL);
  // Objeto con Atributos privados y comportamiento publico
 NumeroRacional = Object
   Private
   Public
   function Sumar(numero_1: Integer; numero_2: Integer): Integer;
   function Restar(numero_1: Integer; numero_2: Integer): Integer;
   function Multiplicar(numero_1: Integer; numero_2: Integer): Integer;
   function Dividir(dividiendo: Integer; divisor: Integer): Double;
   function Potencia(base: Integer; exponente: Integer): Double;
   function Comparar(numero_1: Integer; numero_2: Integer): ResultadoDeComparacion;

 End;

Implementation
  function NumeroRacional.Sumar(numero_1: Integer; numero_2: Integer): Integer;
  begin
    Result := numero_1 + numero_2;
  end;

  function NumeroRacional.Restar(numero_1: Integer; numero_2: Integer): Integer;
  begin
    Result := numero_1 - numero_2;
  end;

  function NumeroRacional.Multiplicar(numero_1: Integer; numero_2: Integer): Integer;
  begin
    Result := numero_1 * numero_2;
  end;

  function NumeroRacional.Potencia(base: Integer; exponente: Integer): Double;
  begin
    Result :=  Math.Power(base, exponente);
  end;

  function NumeroRacional.Dividir(dividiendo: Integer; divisor: Integer): Double;
  begin
   If (dividiendo <> 0) then Result := dividiendo div divisor else Result := -1;
  end;
  function NumeroRacional.Comparar(numero_1: Integer; numero_2: Integer): ResultadoDeComparacion;
  begin
   if numero_1 = numero_2 then Result := IGUAL else if numero_1 > numero_2 then Result := MAYOR else Result := MENOR

  end;

end.
