unit UnitEje3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnLeerArchivo: TButton;
    btnParsear: TButton;
    procedure btnLeerArchivoClick(Sender: TObject);
    procedure btnParsearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // Declaro arreglo dinamico de string
  Vector = Array Of String;
var
  Form1: TForm1;

implementation

{$R *.dfm}
// Funcion Interna a la implementacion
Function Parsing(aSS: String; aSep: String): Vector;
Var I: Integer;
    P: Integer;
    V: Vector;
Begin
  I := 0;
  // Controlo que el ultimo caracter sea el separador, sino lo agrega
  if aSS.Substring(aSS.Length,1) <> aSep then aSS := aSS + aSep;

  // Hacemos el split
  P := Pos(aSep, aSS);
  while P > 0 do Begin
    Inc(I);
    SetLength(V, I);  // Se redimensiona el array y no se pierden los datos
    V[I-1] := Copy(aSS, 1, P-1);
    aSS := Copy(aSS, P+1, Length(aSS));
    P := Pos(aSep, aSS);
  End;

  // Retorno el array
  Parsing := V;
End;

procedure TForm1.btnLeerArchivoClick(Sender: TObject);
Var T: TextFile;
    S: String;
    I: Integer;
    nombre_archivo: String;
begin
  nombre_archivo := '.\Archivo.txt';

  AssignFile(T, nombre_archivo);
  if Not FileExists(nombre_archivo) then Begin
    Memo1.Clear;
    Memo1.Lines.Add('El archivo ' + nombre_archivo + ' no existe.');
  End;

  // Abrir en solo lectura
  Reset(T);

  // Recorrido secuencial de archivo
  while Not Eof(T) do Begin
    Readln(T, S);
    Memo1.Lines.Add(S);
  end;

  CloseFile(T);
end;
procedure TForm1.btnParsearClick(Sender: TObject);
Var T: TextFile;
    S: String;
    V: Vector;
    I: Integer;
    nombre_archivo: String;
begin
  nombre_archivo := '.\Archivo.txt';
  memo1.Clear;
  AssignFile(T, nombre_archivo);
  Reset(T);
  while Not Eof(T) do Begin
    Readln(T, S);
    memo1.Lines.Add(S);
    V := Parsing(S, ' ');
  end;
  CloseFile(T);
  // recorro el array dinamico
  for I := 0 to Length(V) -1 do Begin
    memo1.Lines.Add('V[' + I.ToString + '] = ' + V[I]);
  End;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
