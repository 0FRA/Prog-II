unit UnitEjercicio4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Ordenamiento;

type
  TForm1 = class(TForm)
    btnCuadroLatino: TButton;
    Grilla: TStringGrid;
    procedure btnCuadroLatinoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure CuadradoLatino(Var aM: Matriz; nGrado: Integer);
Var i,j,n: Integer;
begin
  n := 0;
  for i := Min to Max do
    for j := Min to Max do begin
        n := n + 1;
        aM[i,j] := n;
    end;
  Ordenamiento.SwapAleatorio(aM);
end;

procedure TForm1.btnCuadroLatinoClick(Sender: TObject);
Var cuadrado: Matriz;
  i,j: Integer;
begin
  CuadradoLatino(cuadrado, 4);
  for i := Min to Max do Begin
    for j := Min to Max do Begin
      Grilla.ColCount := 4;
      Grilla.RowCount := 4;
//      Grilla.FixedCols := 1;
//      Grilla.FixedRows := 1;
      Grilla.Cells[i - 1, j - 1] := cuadrado[i,j].ToString;
    End;
  End;

end;



end.
