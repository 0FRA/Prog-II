unit UnitFechas;

interface
Uses SysUtils;
Function CrearDiaJuliano(Fecha: String): Extended;
implementation
// Formato de la fecha tiene que ser DD/MM/YYYY

Function CrearDiaJuliano(Fecha: String): Extended;
Var Mes, Dia, Year, AP, MP: Integer;
Begin
  if Length(Fecha) = 10 then Begin
    Dia := StrToInt(Fecha[1] + Fecha[2]);
    Mes := StrToInt(Fecha[4] + Fecha[5]);
    Year := StrToInt(Fecha[7] + Fecha[8] + Fecha[9] + Fecha[10]);
  End;

  if (Mes = 1) OR (Mes = 2) then Begin
    AP := Year - 1;
    MP := Mes + 13;
  End;
  if Mes > 2 then Begin
    AP := Year;
    MP := Mes + 1;
  End;
  Result :=  (Int(365.25 * AP) + Int(30.6001 * MP) + DIA + 1720982);
End;
end.
