unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
    procedure btnCargarVehiculosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGenerarVehClick(Sender: TObject);
    procedure btnIngresarVehClick(Sender: TObject);
    procedure btnMostrarVehiculosClick(Sender: TObject);
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
Var  Car: RegVehiculo;
begin
  //Car := Parking1.CrearVehiculo();
  Parking1.Ingresar(Car);
  Memo1.Lines.Add(Parking1.MostarRegistro());

end;

procedure TForm1.btnGenerarVehClick(Sender: TObject);
Var RandHoraS, RandMinS: Integer;
begin
  Randomize;
  RandHoraS := Random(23);
  RandMinS := Random(59);
  EditPatente.Text := Chr(ord('A') + Random(26)) + Chr(ord('A') + Random(26)) +
    '-' + IntToStr(Random(899) + 100);
  TimePickerEntrada.Time := StrToTime(Random(RandHoraS).ToString+':'+Random(RandMinS).ToString);
  TimePickerSalida.Time := StrToTime(RandHoraS.toString+':'+RandMinS.ToString);


end;

procedure TForm1.btnIngresarVehClick(Sender: TObject);
Var Car : RegVehiculo;
begin
  Car.Patente := Trim(EditPatente.Text);
  Car.Hora_E  := DatePickerEntrada.Date+TimePickerEntrada.Time;
  Car.Hora_S  := DatePickerSalida.Date+TimePickerSalida.Time;
  Parking1.Ingresar(Car);
  Memo1.Lines.Add('Vehiculo con patente #'+Car.Patente+' ingresado.');
end;

procedure TForm1.btnMostrarVehiculosClick(Sender: TObject);
begin
Memo1.Lines.Add(Parking1.MostarRegistro());
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {Crea un estacionamiento con
  capacidad para 400 Vehiculos}
  Parking1.Crear(CapacidadParking);
  // Establecer el precio por estadias
  Parking1.EstablecerTarifas(TarifaCompleta, TarifaMedia, TarifaHora)
end;

end.
