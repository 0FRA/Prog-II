unit ArreglosDinamicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ArreglosDinamicos;

type
  TForm1 = class(TForm)
    memo1: TMemo;
    btnGenerarVector: TButton;
    btnCalcularOrdenamiento: TButton;
    procedure btnGenerarVectorClick(Sender: TObject);
    procedure btnCalcularOrdenamientoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  V: Vector;

implementation

{$R *.dfm}

procedure TForm1.btnCalcularOrdenamientoClick(Sender: TObject);
Var E: RetornoComparacion;
begin
  E := MAYOR;
  memo1.Clear;
  V.SetSize(1000);
  V.LoadRandom(1,100000);
  memo1.Lines.Add('----------------------------------------------------');
  memo1.Lines.Add('Comparando Metodos de Ordenamiento Burbuja VS Qsort');
  memo1.Lines.Add('Tamaño del Vector a Ordenar: ' + V.Size.ToString + ' elementos');
  memo1.Lines.Add('Generado con Numeros Aleatorios entre 1 y 100000');
  memo1.Lines.Add('----------------------------------------------------');
  if V.IsOrder(True) then Begin
    memo1.Lines.Add('Vector por casualidad Ordenado ... ');
    memo1.Lines.Add('Se lo crea de nuevo aleatoreamente ... ');
    V.LoadRandom(1, 100000);
  End;
  memo1.Lines.Add('Inicio ... ' + DateTimeToStr(Now));
  memo1.Lines.Add('----------------------------------------------------');
  V.Sort(True);
  if V.IsOrder(True) then Begin
    memo1.Lines.Add('Fin Ordenar Burbuja ASC ... ' + DateTimeToStr(Now));
  End;
  memo1.Lines.Add('----------------------------------------------------');
  V.LoadRandom(1,10000);
  V.Sort(False);
  if V.IsOrder(False) then Begin
    memo1.Lines.Add('Fin Ordenar Burbuja DESC ... ' + DateTimeToStr(Now));
  End;
  memo1.Lines.Add('----------------------------------------------------');
  V.LoadRandom(1,10000);
  V.QSort(True);
  if V.IsOrder(True) then Begin
    memo1.Lines.Add('Fin QSORT ASC ... ' + DateTimeToStr(Now));
  End;
  memo1.Lines.Add('----------------------------------------------------');
  V.LoadRandom(1,10000);
  V.QSort(False);
  if V.IsOrder(False) then Begin
    memo1.Lines.Add('Fin QSORT DESC ... ' + DateTimeToStr(Now));
  End;
  memo1.Lines.Add('----------------------------------------------------');
  memo1.Lines.Add('Fin ... ' + DateTimeToStr(Now));
end;

procedure TForm1.btnGenerarVectorClick(Sender: TObject);
begin
  V.SetSize(1000); // Tamaño del vector
  V.LoadRandom(1,10000);
  memo1.Lines.Add('--- Vector Desordenado ---');
  memo1.Lines.Add(V.ReturnAsString);
  memo1.Lines.Add('-- Vector generador aleatoriamente con 1000 elementos --')
end;

end.
