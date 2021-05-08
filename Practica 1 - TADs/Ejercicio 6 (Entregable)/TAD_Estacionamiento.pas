unit TAD_Estacionamiento;

interface

Uses SysUtils, DateUtils;

Const
  Min = 1;
  Max = 100000; // Capacidad máxima de vehiculos para los Parking.
  Nombre_Archivo = 'Vehiculos.Dat';

Type
  RegVehiculo = Record
    Patente: String[20];
    Hora_E: TDateTime;
    Hora_S: TDateTime;
    Importe: Double;
    Estadia: String[40];
  End;

  // Defino el Archivo del registro (Binario)
  ArchivoVehiculos = File Of RegVehiculo;
  ArrayVeh = Array Of RegVehiculo;
  Estacionamiento = Object
  Private
    Items: ArrayVeh;
    nSize: LongInt;
    nPos: LongInt; // Siguiente posición disponible
    pEstCompleta: Double;
    PEstMedia: Double;
    pHora: Double;
    procedure GuardarVehiculos(RV: RegVehiculo; Nombre_Archivo: String);
    Procedure CalcularEstadia(Var Vehiculo: RegVehiculo);
    Procedure CalcularTarifa(Var Vehiculo: RegVehiculo);
  Public
    Procedure Crear(aSize: LongInt);
    Procedure Ingresar(Vehiculo: RegVehiculo);
    Procedure EstablecerTarifas(completa, media, porhora: Double);
    Procedure MostrarRegistro(Var aVeh: RegVehiculo; vPos: LongInt);
    Function RecaudadoEnFecha(Fecha: TDate): String;
    Function TotalDesdeHasta(Desde, Hasta: TDate): Double;
    Function TotalDeVehiculos(): Integer;
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
    CalcularTarifa(Vehiculo);
    Items[nPos] := Vehiculo;
    // CalcularEstadia(Vehiculo);
    GuardarVehiculos(Vehiculo, Nombre_Archivo);
  End;
End;

Procedure Estacionamiento.EstablecerTarifas(completa, media, porhora: Double);
Begin
  pEstCompleta := completa;
  PEstMedia := media;
  pHora := porhora;
End;

Procedure Estacionamiento.GuardarVehiculos(RV: RegVehiculo;
  Nombre_Archivo: string);
Var
  AV: ArchivoVehiculos;
begin
  AssignFile(AV, Nombre_Archivo);

  if Not FileExists(Nombre_Archivo) then Begin
    Rewrite(AV);
    CloseFile(AV);
  End;

  // Abrirlo con reset (Modo/Lectura Escritura) y queda en el BOF
  Reset(AV);
  // Posiciona el puntero de registro en la ultima posición (Sino se pisan los registros)
  Seek(AV, FileSize(AV));
  Write(AV, RV);
  CloseFile(AV);
end;

Procedure Estacionamiento.CalcularEstadia(Var Vehiculo: RegVehiculo);
Var
  Estadia: String;
  Minutos: Integer;
Begin
  Minutos := MinutesBetween(Vehiculo.Hora_E, Vehiculo.Hora_S);
  if Minutos > (6 * 60) then
    Estadia := 'Completa'
  else if Minutos > (3 * 60) then
    Estadia := 'Media'
  else
  Begin
    Estadia := (Minutos Div 60).ToString + ' hs ' + (Minutos Mod 60).ToString +
      ' minutos';
  End;
  Vehiculo.Estadia := Estadia;
End;

Procedure Estacionamiento.CalcularTarifa(Var Vehiculo: RegVehiculo);
Var
  E: String;
  Tarifa: Double;
Begin
  Tarifa := 0;
  // Vehiculo.Importe := 0;
  CalcularEstadia(Vehiculo);
  E := Vehiculo.Estadia;
  if E = 'Completa' then
    Tarifa := pEstCompleta
  else if E = 'Media' then
    Tarifa := PEstMedia
  else
  begin
    if pHora > 0 then
      Tarifa := (pHora / 60) * MinutesBetween(Vehiculo.Hora_E, Vehiculo.Hora_S);
  end;
  Vehiculo.Importe := Tarifa;
End;

Procedure Estacionamiento.MostrarRegistro(Var aVeh: RegVehiculo; vPos: LongInt);
Begin
   aVeh := Items[vPos];
End;

Function Estacionamiento.RecaudadoEnFecha(Fecha: TDate): String;
Var
  RV: RegVehiculo;
  AV: ArchivoVehiculos;
  SumaEstCompleta, SumaEstMedia, SumaPorHora: Double;
  EncontroFecha, Existe: Boolean;
Begin
  // En que lugar del disco va a residir el archivo. Usamos el path relativo
  AssignFile(AV, Nombre_Archivo);
  // Vamos a controlar que el archivo NO exista para crearlo
  Existe := FileExists(Nombre_Archivo);
  if Not Existe then
  Begin
    Rewrite(AV);
    CloseFile(AV);
  End;

  // Abrirlo con reset (Modo/Lectura Escritura) y queda en el BOF
  Reset(AV);

  // Inicializo los acumuladores
  SumaEstCompleta := 0;
  SumaEstMedia := 0;
  SumaPorHora := 0;
  // Recorrido secuencial del archivo
  while Not EOF(AV) do
  Begin
    Read(AV, RV);
    // lee el registro del archivo y lo pasa a la variable <RV>, y se para en el proximo registro
    EncontroFecha := False;
    if DateUtils.DateOf(RV.Hora_S) = Fecha then
    Begin
      EncontroFecha := True;
      if RV.Estadia = 'Completa' then
        SumaEstCompleta := SumaEstCompleta + RV.Importe;
      if RV.Estadia = 'Media' then
        SumaEstMedia := SumaEstMedia + RV.Importe;
      if ((RV.Estadia <> 'Completa') And (RV.Estadia <> 'Media')) then
        SumaPorHora := SumaPorHora + RV.Importe
    End;
  end;
  CloseFile(AV);
  if EncontroFecha then
    RecaudadoEnFecha := 'Completa: $' + SumaEstCompleta.ToString + ' Media: $' +
      SumaEstMedia.ToString + ' Por hora: $' + SumaPorHora.ToString
  else
    RecaudadoEnFecha := 'No se han registrado vehiculos en ésta fecha.';
End;

Function Estacionamiento.TotalDesdeHasta(Desde, Hasta: TDate): Double;
Var
  RV: RegVehiculo;
  AV: ArchivoVehiculos;
  Total: Double;
  EncontroFecha, RangoFechas: Boolean;
Begin
  AssignFile(AV, Nombre_Archivo);
  if Not FileExists(Nombre_Archivo) then
  Begin
    Rewrite(AV);
    CloseFile(AV);
  End;
  Reset(AV);

  // Inicializo acumulador
  Total := 0;
  // Recorrido secuencial del archivo
  while Not EOF(AV) do
  Begin
    Read(AV, RV);
    // lee el registro del archivo y lo pasa a la variable <RV>, y se para en el proximo registro
    EncontroFecha := False;
    RangoFechas := ((DateUtils.DateOf(RV.Hora_S) >= Desde) AND (DateUtils.DateOf(RV.Hora_S) <= Hasta));
    if RangoFechas then Begin
      EncontroFecha := True;
      Total := Total + RV.Importe;
    End;
  end;
  TotalDesdeHasta := Total;
  CloseFile(AV);
End;
Function Estacionamiento.TotalDeVehiculos(): Integer;
Begin
  TotalDeVehiculos := nPos;
End;

end.
