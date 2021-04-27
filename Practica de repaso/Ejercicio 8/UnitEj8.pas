unit UnitEj8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DateUtils , UnitParsing;

type
  RegistroFactura = Record
    nro_factura: Integer;
    fecha: Tdate;
    importe: Double;
  End;

  ArchivoFacturas = File of RegistroFactura;

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

function ArmaFactura(Linea: string): RegistroFactura;
Var
  V: Vector;
begin
  V := Parsing(Linea, ';');
  Result.nro_factura := StrToInt(V[0]);
  Result.fecha := StrToDate(V[1]);
  Result.importe := V[2].ToDouble;
end;

procedure TForm1.Button1Click(Sender: TObject);
Var
  ArFacturas: TextFile;
  S: String;
  V: Vector;
  I: Integer;
  RegFacturas: RegistroFactura;
  nombre_archivo: String;
  Mes: Integer;
  Anio: Integer;
  Sumas: Double;
begin
  nombre_archivo := '.\facturas.txt';
  Memo1.Clear;
  AssignFile(ArFacturas, nombre_archivo);
  Reset(ArFacturas);
  Mes := 0;
  Anio := 0;
  sumas := 0;
  while Not Eof(ArFacturas) do
  Begin
    Readln(ArFacturas, S);
    RegFacturas := ArmaFactura(S);
    if (Mes = 0) and (Anio = 0) then
    Begin
      Mes := MonthOf(RegFacturas.fecha);
      Anio := YearOf(RegFacturas.fecha);
    End
    else if (Mes <> MonthOf(RegFacturas.fecha)) or
      (Anio <> YearOf(RegFacturas.fecha)) then
    Begin
      Memo1.Lines.Add('Mes: ' + Mes.toString + ' - año:' + Anio.toString + ' - Importe: '+ sumas.ToString);
      Mes := MonthOf(RegFacturas.fecha);
      Anio := YearOf(RegFacturas.fecha);
      sumas := 0;
    End;

    sumas := sumas + RegFacturas.importe;
  end;
  CloseFile(ArFacturas);
end;

end.
