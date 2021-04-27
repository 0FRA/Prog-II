unit UnitParsing;
interface
uses SysUtils;
type
  Vector = Array of String;
  Function Parsing(aSS: String; aSep: String): Vector;

implementation
Function Parsing(aSS: String; aSep: String): Vector;
Var
  I: Integer;
  P: Integer;
  V: Vector;
Begin
  I := 0;
  // Controlo que el ultimo caracter sea el separador, sino lo agrega
  if aSS.Substring(aSS.Length, 1) <> aSep then
    aSS := aSS + aSep;

  // Hacemos el split
  P := Pos(aSep, aSS);
  while P > 0 do
  Begin
    Inc(I);
    SetLength(V, I); // Se redimensiona el array y no se pierden los datos
    V[I - 1] := Copy(aSS, 1, P - 1);
    aSS := Copy(aSS, P + 1, Length(aSS));
    P := Pos(aSep, aSS);
  End;

  // Retorno el array
  Parsing := V;
End;
end.
