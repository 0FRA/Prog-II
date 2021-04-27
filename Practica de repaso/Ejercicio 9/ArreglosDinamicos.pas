unit ArreglosDinamicos;

interface

Uses
  SysUtils, Math;

Const
  Min = 1;
  Max = 100000;

Type
  RetornoComparacion = (MAYOR, MENOR, IGUAL); // Enumerado

  Vector = Object
    Private
      Items: Array Of LongInt;
      nSize: LongInt;
    Public
      Procedure SetSize(aSize: LongInt);
      Procedure LoadRandom(aFrom, aTo: LongInt);
      Procedure SetValue(aPos, aValue: LongInt);
      Procedure Sort(aAsc: Boolean);
      Procedure QSort(aAsc: Boolean);
      Function GetValue(aPos: LongInt): LongInt;
      Function ReturnAsString(): String;
      Function Size(): LongInt;
      Function IsOrder(aAsc: Boolean): Boolean;
      Function Sumar(): Double;
      Function Maximo(Var Pos:LongInt): LongInt;
      // Function MutiplicarEscalar(Esc: Integer): Vector;
      // Function SumarVector(Var aV: Vector): Vector;
  End;

implementation

Procedure Vector.SetSize(aSize: LongInt);
Begin
  if (aSize >= Min) and (aSize <= Max) then Begin
    SetLength(Items, aSize);
    nSize := aSize;
  end;
End;

Procedure Vector.LoadRandom(aFrom, aTo: LongInt);
Var I: LongInt;
Begin
  Randomize;
  for I := Min To nSize do Begin
    Items[I] := aFrom + Random(aTo - aFrom);
  End;
End;

Procedure Vector.SetValue(aPos, aValue: LongInt);
Begin
  if (aPos >= Min) And (aPos <= nSize) then Begin
    Items[aPos] := aValue;
  End;
End;

//---------------------------------------------------------------------
// Peor forma de ordenarlo. La mas lenta posible, pero funciona
//---------------------------------------------------------------------
Procedure Vector.Sort(aAsc: Boolean);
Var I, J: LongInt;
    Temp: LongInt;
Begin
  if nSize > min then Begin
    for I := min to nSize do
      for J := min to nSize do begin
        if aAsc then Begin  // Orden Ascendente
          if Items[I] < Items[J] then Begin
            Temp := Items[J];
            Items[J] := Items[I];
            Items[I] := Temp;
          End
        End;
        if Not aAsc then Begin   // Orden Descendente
          if Items[I] > Items[J] then Begin
            Temp := Items[J];
            Items[J] := Items[I];
            Items[I] := Temp;
          End
        End;
      end;
  End;
End;

//---------------------------------------------------------------------
// Ordenamiento RAPIDO, uno de los mas eficientes
//---------------------------------------------------------------------
Procedure Vector.QSort(aAsc: Boolean);
  // Proceso que resuelve el orden Ascendente
  Procedure IntAsc(al_Firts, al_Last: LongInt);
  Var ll_i, ll_j: LongInt;
      ll_centro: LongInt;
      ll_temp: LongInt;
  Begin
    ll_i := al_Firts;
    ll_j := al_Last;
    ll_centro := Items[(al_Firts + al_Last) div 2];
    Repeat
        While Items[ll_i] < ll_centro Do Begin
            ll_i := ll_i + 1;
        End;
        While Items[ll_j] > ll_centro Do Begin
            ll_j := ll_j - 1;
        End;
        If ll_i <= ll_j Then Begin
            ll_temp := Items[ll_i];
            Items[ll_i] := Items[ll_j];
            Items[ll_j] := ll_temp;
            ll_i := ll_i + 1;
            ll_j := ll_j - 1;
        End;
    Until ll_i > ll_j;
      If al_Firts < ll_j Then Begin
        IntAsc(al_Firts, ll_j);
    End;
    If ll_i < al_Last Then Begin
        IntAsc(ll_i, al_Last);
    End;
  End;
  // Proceso que resuelve el orden Descendente
  Procedure IntDesc(al_Firts, al_Last: LongInt);
  Var ll_i, ll_j: LongInt;
      ll_centro: LongInt;
      ll_temp: LongInt;
  Begin
    ll_i := al_Firts;
    ll_j := al_Last;
    ll_centro := Items[(al_Firts + al_Last) div 2];
    Repeat
        While Items[ll_i] > ll_centro Do Begin
            ll_i := ll_i + 1;
        End;
        While Items[ll_j] < ll_centro Do Begin
            ll_j := ll_j - 1;
        End;
        If ll_i <= ll_j Then Begin
            ll_temp := Items[ll_i];
            Items[ll_i] := Items[ll_j];
            Items[ll_j] := ll_temp;
            ll_i := ll_i + 1;
            ll_j := ll_j - 1;
        End;
    Until ll_i > ll_j;
      If al_Firts < ll_j Then Begin
        IntDesc(al_Firts, ll_j);
    End;
    If ll_i < al_Last Then Begin
        IntDesc(ll_i, al_Last);
    End;
  End;

  // Llama al Proceso interno
Begin
  if nSize > min then Begin
    if aASC then IntAsc(min,nSize)
    Else IntDesc(min,nSize);
  End;
End;


Function Vector.GetValue(aPos: LongInt): LongInt;
Var Base, Elevar: Extended;
Begin
  GetValue := (StrToInt(Power(2, 31).ToString) * -1);
  if (aPos >= Min) And (aPos <= nSize) then Begin
    GetValue := Items[aPos];
  End;
End;

Function Vector.ReturnAsString(): String;
Var I: LongInt;
    S: String;
Begin
  S := '';
  if nSize >= min then Begin
    for I := Min To nSize do Begin
      S := S + 'Items[' + I.ToString + '] = ' + Items[I].ToString;
      S := S + Char(13) + Char(10);   // retorno de Carro
    End;
  End;
  ReturnAsString := S;
End;

Function Vector.Size(): LongInt;
begin
  Size := nSize;
end;

Function Vector.IsOrder(aAsc: Boolean): Boolean;
Var I: LongInt;
    VA: LongInt;
Begin
  VA := Items[min];
  for I := min + 1 to nSize do Begin
    // Es ASC
    if aAsc then Begin
      if Items[I] < VA then Begin
        IsOrder := False;
        Exit;
      end;
      VA := Items[I];
    End;
    // Es DESC
    if Not aAsc then Begin
      if Items[I] > VA then Begin
        IsOrder := False;
        Exit;
      end;
      VA := Items[I];
    End;
  End;
  IsOrder := True;
End;

// Sumatorio de los elementos del vector
Function Vector.Sumar(): Double;
Var I: LongInt;
    Acum: Double;
begin
  Acum := 0;
  for I := min to nSize do Begin
    Acum := Acum + Items[I];
  End;
  Sumar := Acum;
end;

Function Vector.Maximo(Var Pos:LongInt): LongInt;
Var I: LongInt;
    mx: LongInt;
Begin
  mx := Items[min];
  Pos := Min;
  for I := (min + 1) to nSize do Begin
    if Items[I] > mx then Begin
      mx := Items[I];
      Pos := I;
    End;
  End;
  Maximo := mx;
End;

end.

