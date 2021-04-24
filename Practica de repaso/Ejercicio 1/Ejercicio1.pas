unit Ejercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
const
Min = 1;
Max = 10;
type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditMedia: TEdit;
    EditMediana: TEdit;
    EditModa: TEdit;
    GenerarNumeros: TButton;
    ObtenerMedia: TButton;
    obtenerMediana: TButton;
    mostrarOrdenado: TButton;
    obtenerModa: TButton;
    procedure GenerarNumerosClick(Sender: TObject);
    procedure ObtenerMediaClick(Sender: TObject);
    procedure obtenerMedianaClick(Sender: TObject);
    procedure mostrarOrdenadoClick(Sender: TObject);
    procedure obtenerModaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  // Definir un tipo definido por el usuario = Vector
    Vector = Array[Min..Max] Of Integer;
// Variables usables en toda la implementacion = Variables de Instancia
var
  Form1: TForm1;
  I: Integer;
  V: Vector;
// Scripts, codigos propios, ej una función

implementation

{$R *.dfm}
procedure GenerarVector(Var aV: Vector);
begin
  Randomize;
  for I := Min to Max do Begin
    aV[I] := 1 + Random(100);
  End;

end;

function Promedio(aV: Vector): Double;
Var Suma: LongInt;
  I: Integer;
begin
  Suma := 0;
  For I := Min to Max do Begin
    Suma := Suma + aV[I];
  End;
  Result := (Suma / (Max - Min + 1));
end;

procedure OrdenarVector(Var aV: Vector; longitud: Integer);
Var I: Integer;
  J: Integer;
  Ordenado: Boolean;
  aux: Integer;
begin
  Ordenado := True;
  While (I <= Longitud - 1) and Ordenado do Begin
    Ordenado := False;
    for J := 1 to Longitud -1 do
      if aV[J] > aV[J + 1] then Begin
        Ordenado := True;
        aux := aV[J];
        aV[J] := aV[J + 1];
        aV[J + 1] := aux;
      End;
    inc(I);
  End;

end;

function Mediana(Var aV: Vector; longitud: Integer): Integer;
begin
  OrdenarVector(aV, longitud);
  Result := aV[(longitud div 2)]
end;

function ObtenerModas(aV: Vector): Integer;
Var I, J, M, Cont1, Cont2: Integer;
begin
  Cont1 := 0;
  Cont2 := 0;
  M := -1;
  for I := Min to Max do begin
     for J := Min to Max do begin
       if (aV[I] = aV[J]) and (I <> J) then begin
          Cont1 :=  Cont1 + 1;
       end;
     end;
     if (Cont1 > Cont2) then begin
        M := aV[I];
        Cont2 := Cont1;
     end;
    Cont1 := 0;
  end;
  Result := M;
end;

procedure TForm1.ObtenerMediaClick(Sender: TObject);
begin
  EditMedia.Text := Promedio(V).ToString;
end;

procedure TForm1.obtenerMedianaClick(Sender: TObject);
begin
 EditMediana.Text := Mediana(V, Max).ToString;
end;

procedure TForm1.obtenerModaClick(Sender: TObject);
Var Mo: Integer;
begin
  Mo := ObtenerModas(V);
  if Mo = -1 then
    EditModa.Text := 'No hay moda'
     else
     begin
       EditModa.Text := Mo.ToString;
     end;
end;

procedure TForm1.mostrarOrdenadoClick(Sender: TObject);
begin
  OrdenarVector(V, Max);
  Memo1.Clear;
  for I := Min to Max do Begin
    Memo1.Lines.add(I.ToString + '. ' + V[I].ToString);
  End;
end;

procedure TForm1.GenerarNumerosClick(Sender: TObject);
begin
  Memo1.Clear;
  GenerarVector(V);
  for I := Min to Max do Begin
    Memo1.Lines.add(I.ToString + '. ' + V[I].ToString);
  End;
  EditMediana.Text := '-';
  EditMedia.Text := '-';
  EditModa.Text := '-';
end;


end.
