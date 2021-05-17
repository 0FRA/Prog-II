unit UnitMatematica;

interface
function Potencia(base: Double; exponente: Integer): Double;
implementation
  function Potencia(base: Double; exponente: Integer): Double;
  begin
    if exponente = 0 then
      begin
        Potencia := 1;
      end
    else
      begin
      if base = 0 then
        Potencia := 0;
      Potencia := base * Potencia(base, exponente - 1);
      end;
  end;
end.
