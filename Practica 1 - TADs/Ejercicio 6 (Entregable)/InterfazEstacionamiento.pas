unit InterfazEstacionamiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TAD_Estacionamiento,
  Vcl.ComCtrls, Vcl.WinXPickers;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnGenerarVeh: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EditPatente: TEdit;
    Label3: TLabel;
    btnIngresarVeh: TButton;
    DatePickerEntrada: TDatePicker;
    TimePickerEntrada: TTimePicker;
    DatePickerSalida: TDatePicker;
    TimePickerSalida: TTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    btnMostrarVehiculos: TButton;
    LabelTitulo: TLabel;
    LabelTituloIngreso: TLabel;
    Label6: TLabel;
    DatePickerRecaudado: TDatePicker;
    btnMostrarRecaudado: TButton;
    Label7: TLabel;
    DatePickerRecaudadoDesde: TDatePicker;
    DatePickerRecaudadoHasta: TDatePicker;
    LabelDesde: TLabel;
    LabelHasta: TLabel;
    btnMostrarTotal: TButton;
    procedure btnCargarVehiculosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGenerarVehClick(Sender: TObject);
    procedure btnIngresarVehClick(Sender: TObject);
    procedure btnMostrarVehiculosClick(Sender: TObject);
    procedure btnMostrarRecaudadoClick(Sender: TObject);
    procedure btnMostrarTotalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
  TarifaCompleta = 600;
  TarifaMedia = 300;
  TarifaHora = 120;
  CapacidadParking = 500;

var
  Form1: TForm1;
  Parking1: Estacionamiento;

implementation

{$R *.dfm}

procedure TForm1.btnCargarVehiculosClick(Sender: TObject);
Var
  Car: RegVehiculo;
begin
  // Car := Parking1.CrearVehiculo();
  Parking1.Ingresar(Car);
  // Parking1.MostarRegistro()
  // Memo1.Lines.Add();

end;

procedure TForm1.btnGenerarVehClick(Sender: TObject);
Var
  RandHoraS, RandMinS: Integer;
begin
  Randomize;
  RandHoraS := Random(23);
  RandMinS := Random(59);
  EditPatente.Text := Chr(ord('A') + Random(26)) + Chr(ord('A') + Random(26)) +
    '-' + IntToStr(Random(899) + 100);
  TimePickerEntrada.Time := StrToTime(Random(RandHoraS).ToString + ':' +
    Random(RandMinS).ToString);
  TimePickerSalida.Time := StrToTime(RandHoraS.ToString + ':' +
    RandMinS.ToString);

end;

procedure TForm1.btnIngresarVehClick(Sender: TObject);
Var
  Car: RegVehiculo;
begin
  Car.Patente := EditPatente.Text;
  Car.Hora_E := DatePickerEntrada.Date + TimePickerEntrada.Time;
  Car.Hora_S := DatePickerSalida.Date + TimePickerSalida.Time;
  Parking1.Ingresar(Car);
  Memo1.Lines.Add('Vehiculo con patente #' + String(Car.Patente) +
    ' ingresado.');
end;

procedure TForm1.btnMostrarRecaudadoClick(Sender: TObject);
begin
  Memo1.Lines.Add(Parking1.RecaudadoEnFecha(DatePickerRecaudado.Date));
end;

procedure TForm1.btnMostrarTotalClick(Sender: TObject);
Var
  Total: Double;
  Desde, Hasta: TDate;
begin
  Desde := DatePickerRecaudadoDesde.Date;
  Hasta := DatePickerRecaudadoHasta.Date;
  Total := Parking1.TotalDesdeHasta(Desde, Hasta);
  if Total > 0 then
    Memo1.Lines.Add('El total recaudado desde ' + DateToStr(Desde) + ' hasta ' +
      DateToStr(Hasta) + ' es: $' + Total.ToString)
  else
    Memo1.Lines.Add('No se han registrado vehiculos en éste rango de fechas.');
end;

procedure TForm1.btnMostrarVehiculosClick(Sender: TObject);
Var
  aCar: RegVehiculo;
  vPos, TotalVeh: Integer;
  S: String;
begin
  S := '';
  TotalVeh := Parking1.TotalDeVehiculos();
  for vPos := 1 to TotalVeh do
  Begin
    Parking1.MostrarRegistro(aCar, vPos);
    Memo1.Lines.Add(#13#10'--------------------');
    Memo1.Lines.Add('Patente:' + aCar.Patente);
    Memo1.Lines.Add('H.Entrada:' + DateTimeToStr(aCar.Hora_E));
    Memo1.Lines.Add('H.Salida:' + DateTimeToStr(aCar.Hora_S));
    Memo1.Lines.Add('Importe: $' + aCar.Importe.ToString);
    Memo1.Lines.Add('Estadia: ' + aCar.Estadia)
  End;
  Memo1.Lines.Add('Total de vehículos guardados: '+TotalVeh.ToString);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  { Crea un estacionamiento con
    capacidad para 400 Vehiculos }
  Parking1.Crear(CapacidadParking);
  // Establecer el precio por estadias
  Parking1.EstablecerTarifas(TarifaCompleta, TarifaMedia, TarifaHora)
end;

end.
