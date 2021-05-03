unit UnitMatematica;

interface
function Potencia(base: Integer; exponente: Integer): Integer;
implementation
  function Potencia(base: Integer; exponente: Integer): Integer;
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
