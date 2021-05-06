unit TAD_Estacionamiento;

interface

Uses SysUtils, DateUtils;

Const
  Min = 1;
  Max = 100000; // Capacidad máxima de vehiculos para los Parking.

Type
  RegVehiculo = Record
    Patente: String;
    Hora_E: TDateTime;
    Hora_S: TDateTime;
    Importe: Double;
  End;

  Estacionamiento = Object
  Private
    Items: Array of RegVehiculo;
    nSize: LongInt;
    nPos: LongInt; // Siguiente posición disponible
    pEstCompleta: Double;
    PEstMedia: Double;
    pHora: Double;
    function CalcularEstadia(Hora_E, Hora_S: TDateTime): String;
  Public
    Procedure Crear(aSize: LongInt);
    Procedure Ingresar(Vehiculo: RegVehiculo);
    Procedure EstablecerTarifas(completa, media, porhora: Double);
    // Function Sacar(Patente: String): String;
    Function MostarRegistro(): String;
    Function CalcularTarifa(Veh: RegVehiculo): Double;
  End;

implementation

Procedure Estacionamiento.Crear(aSize: LongInt);
Begin
  if (aSize >= Min) and (aSize <= Max) then
  Begin
    SetLength(Items, aSize);
    nSize := aSize; // Guarda el tamaño del array.
    nPos := 0; // Indice de los registros;
  end;
End;

Procedure Estacionamiento.Ingresar(Vehiculo: RegVehiculo);
Begin
  nPos := nPos + 1; // Posición donde se guarda el vehiculo
  if (nPos >= Min) And (nPos <= nSize) then
  Begin
    Items[nPos] := Vehiculo;
    Items[nPos].Importe := CalcularTarifa(Vehiculo)
  End;
End;

Procedure Estacionamiento.EstablecerTarifas(completa, media, porhora: Double);
Begin
  pEstCompleta := completa;
  PEstMedia := media;
  pHora := porhora;
End;

Function Estacionamiento.CalcularEstadia(Hora_E, Hora_S: TDateTime): String;
Var
  Estadia: String;
  i, Minutos: Integer;
Begin
  Minutos := MinutesBetween(Hora_E, Hora_S);
  if Minutos > (6 * 60) then
    Estadia := 'Completa'
  else if Minutos > (3 * 60) then
    Estadia := 'Media'
  else
  Begin
    Estadia := (Minutos Div 60).ToString + ' hs ' + (Minutos Mod 60).ToString +
      ' minutos';
  End;
  CalcularEstadia := Estadia;
End;

Function Estacionamiento.CalcularTarifa(Veh: RegVehiculo): Double;
Var
  E: String;
  Tarifa: Double;
Begin
  Tarifa := 0;
  E := CalcularEstadia(Veh.Hora_E, Veh.Hora_S);
  if E = 'Completa' then
    Tarifa := pEstCompleta
  else if E = 'Media' then
    Tarifa := PEstMedia
  else
  begin
    if pHora > 0 then
      Tarifa := (pHora / 60) * MinutesBetween(Veh.Hora_E, Veh.Hora_S);
    Veh.Importe := Tarifa;
  end;
  Result := Tarifa;
End;

Function Estacionamiento.MostarRegistro(): String;
Var
  S, Estadia: String;
  i: Integer;
begin
  S := '';
  for i := Min to nPos do
  Begin
    Estadia := CalcularEstadia(Items[i].Hora_E, Items[i].Hora_S);
    S := S + 'Patente: ' + Items[i].Patente + #13#10 + 'H.Entrada: ' +
      DateTimeToStr(Items[i].Hora_E) + #13#10 + 'H.Salida: ' +
      DateTimeToStr(Items[i].Hora_S) + #13#10 + 'Importe: $' +
      Items[i].Importe.ToString + #13#10 + 'Estadia: ' + Estadia + #13#10#13#10;
    MostarRegistro := S;
  End;
end;

// Procedure Estacionamiento.Sacar(Vehiculo: RegVehiculo);
// Begin
//
// End;
end.
