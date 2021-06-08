unit UnitEje1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos,
  ListArray, Vcl.StdCtrls;

// ListCursor;
// ListPointer;
Const
  sizeLista = 10; // Tamaño de la lista
  sizeMinRand = 1;
  sizeMaxRand = 20;

type
  TForm2 = class(TForm)
    btnCrearList: TButton;
    Memo1: TMemo;
    btnMostrarLista: TButton;
    btnCalcularMayor: TButton;
    btnCalcularMenor: TButton;
    btnCalcularPromedio: TButton;
    Label1: TLabel;
    btnRandomUnico: TButton;
    procedure btnCrearListClick(Sender: TObject);
    procedure btnMostrarListaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCalcularMayorClick(Sender: TObject);
    procedure btnCalcularMenorClick(Sender: TObject);
    procedure btnCalcularPromedioClick(Sender: TObject);
    procedure btnRandomUnicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  rLista: Lista;

implementation

procedure Carga_de_Random_Unicos(Var aL: Lista);
Var
  PosL: PosicionLista;
  X: TipoElemento;
  aValue, Count: Integer;
begin
    PosL := aL.Comienzo;
   // if aL.Crear(Numero, sizeLista) = OK then begin
     //X.Inicializar(Numero, 0);
     Randomize;
     While Not aL.EsLLena Do Begin
        X.Clave := sizeMinRand + Random(sizeMaxRand);
        if aL.Buscar(X) = Nulo then
          aL.Agregar(X);
     End;
 // end;

end;

{$R *.dfm}

// Dada una lista cargada con valores al azar
procedure TForm2.btnCrearListClick(Sender: TObject);
begin
  // Crea la lista númerica
  rLista.Crear(Numero, sizeLista);
  // Carga la lista con valores númericos aleatorios (en un rango)
  rLista.LlenarClavesRandom(sizeLista, sizeMinRand, sizeMaxRand);
  Memo1.Clear;
  Memo1.Lines.Add('Lista con valores al azar fue creada con éxito.');
end;

// Mostrar una lista desde el último elemento al primero.
procedure TForm2.btnMostrarListaClick(Sender: TObject);
Var
  X: TipoElemento;
  PosL: PosicionLista;
  S, SS: String;
begin
  PosL := rLista.Fin;
  While PosL <> Nulo Do
  Begin
    X := rLista.Recuperar(PosL);
    S := X.ArmarString;
    SS := SS + S + cCRLF;
    PosL := rLista.Anterior(PosL);
  End;
  Memo1.Clear;
  Memo1.Lines.Add('Mostrando lista desde el último elemento al primero:');
  Memo1.Lines.Add(SS);
end;

// Genera números al azar únicos dentro de la lista.
procedure TForm2.btnRandomUnicoClick(Sender: TObject);
Var
  X: TipoElemento;
  PosL: PosicionLista;
begin
  rLista.Crear(Numero, sizeLista);
  Carga_de_Random_Unicos(rLista);
  Memo1.Lines.Add('Generada lista de números al azar unicos.');
end;

// Calcula el mayor de los datos e indica la posición ordinal.
procedure TForm2.btnCalcularMayorClick(Sender: TObject);
Var
  X, dMayor: TipoElemento;
  PosL, PosDM: PosicionLista;

begin
  PosL := rLista.Comienzo;
  // Toma al primer elemento como el mayor
  PosDM := PosL; // Posición dato mayor
  dMayor := rLista.Recuperar(PosL);
  While PosL < rLista.Fin do
  Begin
    X := rLista.Recuperar(PosL);
    if X.Clave > dMayor.Clave then
    Begin
      dMayor := X;
      PosDM := PosL;
    End;
    PosL := rLista.Siguiente(PosL);
  End;
  Memo1.Lines.Add('Mayor dato: ' + dMayor.ArmarString + 'En la posición: ' +
    IntToStr(PosDM));
end;

// Calcula el dato mínimo y cuente la cantidad de veces que se repite.
procedure TForm2.btnCalcularMenorClick(Sender: TObject);
Var
  X, dMenor: TipoElemento;
  PosL: PosicionLista;
  nRepe: Integer; // Número de repeticiones
begin
  PosL := rLista.Comienzo;
  // Toma al primer elemento como el menor
  dMenor := rLista.Recuperar(PosL);
  nRepe := 0; // Inicializo el nro de repeticiones
  While PosL < rLista.Fin do
  Begin
    X := rLista.Recuperar(PosL);
    if X.Clave < dMenor.Clave then
    Begin
      dMenor := X;
      nRepe := 0;
    End;
    // Si son iguales incremento el nro de repe...
    if X.Clave = dMenor.Clave then
    Begin
      nRepe := nRepe + 1;
    End;
    PosL := rLista.Siguiente(PosL);
  End;
  Memo1.Lines.Add('Menor dato: ' + dMenor.ArmarString + 'Se repite: ' +
    IntToStr(nRepe) + ' veces');
end;

// Obtiene el promedio de los datos de una lista, mediante proceso recursivo.
Function PromedioListaAUX(aL: Lista; Comienzo, Fin: PosicionLista): Extended;
begin
  if Comienzo = Fin then
    Result := aL.Recuperar(Fin).Clave
  else
  begin
    Result := aL.Recuperar(Comienzo).Clave + PromedioListaAUX(aL,
      Comienzo + 1, Fin);
  end;
end;

Function PromedioLista(aL: Lista): Extended;
begin
  Result := PromedioListaAUX(aL, aL.Comienzo, aL.Fin) /
    ((aL.Fin - aL.Comienzo) + 1);
end;

procedure TForm2.btnCalcularPromedioClick(Sender: TObject);
begin
  Memo1.Lines.Add('El promedio es: ' + PromedioLista(rLista).ToString);
end;

// Limpia el Memo cuando se crea el formulario.
procedure TForm2.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
