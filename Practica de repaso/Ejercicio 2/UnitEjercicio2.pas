unit UnitEjercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    EditCadena: TEdit;
    btnMostrarResultados: TButton;
    Memo1: TMemo;
    btnGenerarCadena: TButton;
    procedure btnMostrarResultadosClick(Sender: TObject);
    procedure btnGenerarCadenaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
    // Definir un tipo definido por el usuario = Vector
    Vector = Array[0..25] Of Integer; // Ascii Z(90) - A(65) = 25, I + 65 = Ascii
var
  Form1: TForm1;

implementation

{$R *.dfm}
function GenerarCadena(longitud: Integer): String;
Const
  L = 'aA';
var
  I: Integer;
  Cont: Integer;
begin
  Randomize;
  Result := '';
  Cont := 0;
  for I := 0 to longitud do Begin
     Result := Result + Chr(ord(L[Random(2) + 1]) + Random(22));
     Cont := Cont + 1;
     if Cont >= 4 then Begin
       Result := Result + Chr(ord(' '));
       Cont := 0;
     End;
  End;
end;

function EsMinuscula(caracter: Char): Boolean;
begin
  Result := Ord(caracter) >= Ord('a') and Ord(caracter) <= Ord('z');
end;


function DevolverMinusculas(cadena: String): String;
Var I: Integer;
  EsLetra, EsEspacio: Boolean;

begin
     Result := '';
     for I := 0 to Length(cadena) do Begin
      EsEspacio := Ord(cadena[I]) = Ord(' ');
      if (EsMinuscula(cadena[I])) OR (EsEspacio) then Begin
        Result := Result + cadena[I];
      End;
     End;

end;

function DevolverMayusculas(cadena: String): String;
Var I: Integer;
begin
     Result := '';
     for I := 0 to Length(cadena) do Begin
      if (Ord(cadena[I]) > Ord('A')) and (Ord(cadena[I]) < Ord('Z')) then Begin
        Result := Result + cadena[I] + ' ';
      End;
     End;

end;

function DevolverSinEspacios(cadena: String): String;
Var I: Integer;
begin
     Result := '';
     for I := 0 to Length(cadena) do Begin
      if NOT (Ord(cadena[I]) = Ord(' ')) and (Ord(cadena[I]) > Ord('A')) then Begin
        Result := Result + cadena[I];
      End;
     End;

end;

function DevolverInvertida(cadena: String): String;
Var I: Integer;
begin
     Result := '';
     for I := Length(cadena) Downto 0 do Begin
      if (Ord(cadena[I]) > Ord('A')) then Begin
        Result := Result + cadena[I];
      End;
     End;
end;

function OcurrenciasConsantes(cadena: String): String;
Const
consonantes = 'BCDFGHJKLMNÑPQRSTVWXYZ';
Var I: Integer;
  Ocurrencias: Vector;
  Indice: Integer;
begin
     // Inicializo el vector de ocurrencias;
     for I := 0 to 25 do begin
      Ocurrencias[I] := 0;
     end;


     for I := 0 to Length(cadena) do Begin
      Indice := Ord(Uppercase(cadena[I])[1]) - 65; // I(0-25) + 65 = Ascii de A-Z
      if Indice <= 25 then Begin
        Ocurrencias[Indice] := Ocurrencias[Indice] + 1;
      End;
     End;
  Result := '';
  for I := 0 to 25 do Begin
    if (Ocurrencias[I] > 0) and (Pos(Char(65 + I) , consonantes) > 0) then Begin
      Result := Result + Char(65 + I) + '=' + Ocurrencias[I].ToString + ' ';
    End;
  End;

end;

procedure TForm1.btnMostrarResultadosClick(Sender: TObject);
Var cadena: String;
begin
  cadena := EditCadena.Text;
  Memo1.Clear;
  Memo1.Lines.Add('MAYÚSCULAS: ' + DevolverMayusculas(cadena));
  Memo1.Lines.Add('MINÚSCULAS: ' + DevolverMinusculas(cadena));
  Memo1.Lines.Add('SIN ESPACIOS: ' + DevolverSinEspacios(cadena));
  Memo1.Lines.Add('INVERTIDA: ' + DevolverInvertida(cadena));
  Memo1.Lines.Add('SIN ESPACIOS: ' + DevolverSinEspacios(cadena));
  Memo1.Lines.Add(' TU FRASE TIENE ' +  IntToStr(Length(cadena)) + '  caracteres');
  Memo1.Lines.Add(OcurrenciasConsantes(cadena));
end;

procedure TForm1.btnGenerarCadenaClick(Sender: TObject);
begin
EditCadena.Text := GenerarCadena(40);
Memo1.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
