unit UnitSubConjunto;

interface

uses UnitParsing, SysUtils;
function Subconjuntos_Suma(Conjunto: VectorSTR; Suma: Integer): String;

implementation

Function SubConjuntos_SumaAUX(Conjunto: VectorSTR; Var SubConjunto: VectorSTR;
  sizeCon, Suma, totalSuma: Integer; S: String): VectorSTR;
Begin
  // Verifico que la suma sea la requerida.
  if Suma = totalSuma then
  begin
    // Incrementa la posicion del vector
    SetLength(SubConjunto, Length(SubConjunto) + 1);
    // Asigno el subconjunto al vector
    SubConjunto[Length(SubConjunto) - 1] := S;
    // showmessage(i.ToString+'-'+S);
  end;
  // Salgo a buscar mas subconjuntos
  if (sizeCon > 0) and (Suma <> totalSuma) then
  begin
    SubConjuntos_SumaAUX(Conjunto, SubConjunto, sizeCon - 1, Suma,
      totalSuma, S);
    SubConjuntos_SumaAUX(Conjunto, SubConjunto, sizeCon - 1, Suma,
      totalSuma + StrToInt(Conjunto[sizeCon - 1]),
      S + Conjunto[sizeCon - 1] + ',');
  end;
  Result := SubConjunto;
End;

function Subconjuntos_Suma(Conjunto: VectorSTR; Suma: Integer): String;
Var
  S: String;
  SubConjunto: VectorSTR;
  I: Integer;
begin

  SubConjunto := SubConjuntos_SumaAUX(Conjunto, SubConjunto, Length(Conjunto),
    Suma, 0, S);
  // For para concatenar los resultados.
  S := '';
  for I := Length(SubConjunto) - 1 downto 0 do
  begin
    S := S + '{' + SubConjunto[I] + '}';
  end;
  Result := S;
end;

end.
