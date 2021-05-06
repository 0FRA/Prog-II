unit TDA_Binario;

interface
Uses System.SysUtils, UnitMatematica;

Const
  Min = 1;
  Max = 32;

Type
  // Enumerado
  OperadorLogico = (bAND, bOR, bXOR);
  // Objeto
  Binario = Object
  Private
    Items: String;
    nSize: LongInt;
    //Function Comparar(B2: Binario): LongInt;  // Calcula el binario con mayor cantidad de bits.
  Public
    Procedure SetSize(aSize: LongInt);  
    Procedure SetValue(aValue: String);
    Function ToString(): String;
    Function BinToString(): String;
    //Function MostrarValor(): String;
    Function Sumar(B2: Binario): Binario;
    Function Restar(B2: Binario): Binario;
    function ConvertirBinario(decimal: Integer): Binario;
    function ConvertirDecimal(): Integer;
    Function Operador(B2: Binario; Nombre_Operador: OperadorLogico): Binario;
  End;

implementation
//Function Binario.Comparar(B2: Binario): LongInt;
//Begin
//  if Length(Items) >= Length(B2.Items) then  Result := Length(Items)
//  else Result := Length(B2.Items);
//End;
 
Procedure Binario.SetSize(aSize: LongInt);
Begin
  if (aSize >= Min) and (aSize <= Max) then
  Begin
    SetLength(Items, aSize);
    nSize := aSize;
  end;
End;

Procedure Binario.SetValue(aValue: String);
Var
  i, Count: Integer;
Begin
  if (Length(aValue) >= Min) And (Length(aValue) <= nSize) then
  Begin
    Count := Length(aValue);
    for i := nSize downto 1 do
    Begin
    if Count > 0 then     // Completo el binario con ceros
      Items[i] := aValue[Count]
    else Items[i] := '0';
    Count := Count -1;
    End;
  End;
End;

Function Binario.ToString(): String;
Begin
  ToString := Binario.ToString;
End;


Function Binario.BinToString(): String;
Var I, aPos: Integer;
    S: String;
Begin
  S := '';
  aPos := Pos('1', Items);
  if aPos <> 0 then
    for I := aPos to nSize do Begin
      S := S + (Ord(Items[I]) - Ord('0')).ToString;
    End
  Else
    S := '0';
  BinToString := S;
End;

//Function Binario.MostrarValor(): String;
//var
//  I: Integer;
//  S: String;
//Begin
//  S := '';
//  for I := Min to nSize do Begin
//    S := S + Items[I];
//  End;
//  MostrarValor := S;
//End;

Function Binario.Sumar(B2: Binario): Binario;
var
  i, Carry, k: Integer;
  S: String;
Begin

  S := '';
  Carry := 0;
  for i := nSize Downto 1 do
  Begin
    // Operación que habria que hacer si no existiera la funcion StrToInt
    //k :=  (Ord(Items[i]) - Ord('0')) + (Ord(B2.Items[i]) - Ord('0')) + Carry;
    k := StrToInt(Items[i]) + StrToInt(B2.Items[i])  + Carry;
    Carry := 0;
    if k = 2 then
    Begin
      Carry := 1;
      k := 0;
    End;
    if k = 3 then Begin
      Carry := 1;
      k := 1
    End;
    S := k.ToString + S;
  End;
  //Sumar := S;
   Sumar.SetSize(32);
   Sumar.SetValue(S);
End;
Function Binario.Restar(B2: Binario): Binario;
var I, Minuendo, Sustraendo, Carry, K: Integer;
    S: String;
Begin
  Restar.SetSize(32);
  Carry := 0;
  S := '';
  for I := nSize downto 1 do Begin
    Minuendo := StrToInt(Items[I]);
    Sustraendo := StrToInt(B2.Items[I]);
    K := (Minuendo - Sustraendo) - Carry;
    if K = -1 then Begin
      Carry := 1;
      K := 1;
    End;
    if K = 0 then Begin
      Carry := 0;
      K := 0;
    End;
    if K = 1 then Begin
      Carry:= 0;
      K := 1;
    End;

    S := k.ToString + S;
  End;
  Restar.SetValue(S);
End;


Function Binario.Operador(B2: Binario; Nombre_Operador: OperadorLogico): Binario;
var
  I: Integer;
  K, S: String;
Begin
Operador.SetSize(32);
S := '';
for I := nSize downto Min do Begin
  case Nombre_Operador of
    bAND: if (Items[I] = '1') AND (B2.Items[I] = '1') then K := '1' else K := '0';
    bOR: if (Items[I] = '1') OR (B2.Items[I] = '1') then K := '1' else K := '0';
    bXOR: if (Items[I]  <> B2.Items[I]) then K := '1' else K := '0';
  end;
  S := K + S;
End;
Operador.SetValue(S);
End;

//Function Binario.Operador(B2: Binario; Nombre_Operador: OperadorLogico): Binario;
//Var I, K: Integer;
//    S: String;
//Begin
//  Operador.SetSize(32);
//  S := '';
//  for I := nSize Downto 1 do Begin
//  case Nombre_Operador of
//   bAND : K := StrToInt(Items[I]) AND StrToInt(B2.Items[I]);
//   bOR : K := StrToInt(Items[I]) OR StrToInt(B2.Items[I]);
//   bXOR : K := StrToInt(Items[I]) XOR StrToInt(B2.Items[I]);
//  end;
//    S := K.ToString + S;
//  End;
//  Operador.SetValue(S);
//End;
//



function Binario.ConvertirBinario(decimal: Integer): Binario;
// Base 2 -> Binario
// Base 8 -> Octal
Const base = 2;
Var toBase: String;
    ResultConvert: Binario;
begin
  toBase := '';
  ResultConvert.SetSize(32);
  while (decimal div base) <> 0 do Begin
     toBase := (decimal mod base).toString + toBase;
     decimal := decimal div base;
  End;
  ResultConvert.SetValue(IntToStr(decimal) + toBase);
  Result := ResultConvert;
end;

function Binario.ConvertirDecimal(): Integer;
Const base = 2;
Var i, Count: Integer;
Suma : Integer;
Begin
  Count := 0;
  Suma := 0;
  for i := Length(Items) Downto 1 do Begin
    Suma := Suma + StrToInt(Items[i]) * Potencia(base, Count);
    Count := Count + 1;
  end;
  Result := Suma;
End;

end.
