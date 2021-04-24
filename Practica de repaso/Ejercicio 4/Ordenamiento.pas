unit Ordenamiento;

interface
const
  Min = 1;
  Max = 4;
Type
  Matriz = Array [Min..Max,Min..Max] of Integer;
  procedure SwapAleatorio(Var aM: Matriz);

implementation
  procedure SwapAleatorio(Var aM: Matriz);
  Var i, j, aux, randPosI, randPosJ: Integer;
  begin
  Randomize;
    for i := Min to Max do
      for j := Min to Max do begin
        randPosI := Random(Max - 1) + 1;
        randPosJ := Random(Max - 1) + 1;
        aux := aM[i,j];
        aM[i,j] := aM[randPosI,randPosJ];
        aM[randPosI,randPosJ] := aux;
      end;
  end;
end.
