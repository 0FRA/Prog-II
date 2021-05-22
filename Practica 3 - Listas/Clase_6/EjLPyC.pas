unit EjLPyC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos,
  //ListArray,
  ListPointer,
  //ListCursor,
  Vcl.StdCtrls ;

type
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


Function MayorClave(Var aL: Lista): TipoElemento;
Var X: TipoElemento;
    Q: PosicionLista;
    XM:TipoElemento;
Begin
  XM.Inicializar(aL.DatoDeLaClave,0);
  // Tomo el Inicio
  Q := aL.Comienzo;
  // Recorro mientras los siguientes sean validos
  while Q <> Nulo do Begin
    X := aL.Recuperar(Q);
    if X.Clave > XM.Clave then XM := X;
    Q := aL.Siguiente(Q);
  End;
  // Retorno el mayor
  MayorClave := XM;
End;

procedure TForm1.Button1Click(Sender: TObject);
Var L: Lista;
begin
  memo1.Clear;
  L.LlenarClavesRandom(10, 1, 100);
  memo1.Lines.Add(L.RetornarClaves);
  memo1.Lines.Add('---------------- MAYOR ELEMENTO -----------------');
  memo1.Lines.Add(MayorClave(L).ArmarString);
end;

end.
