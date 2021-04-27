unit UnitConversion;

interface
uses UnitMatematica, SysUtils;
function IntToBaseN(decimal: Integer; base: Integer): String;
function BinToBaseN(binario: String; base: Integer): Integer;
function OctalToDecimal(Octal: String): Integer;

implementation
function IntToBaseN(decimal: Integer; base: Integer): String;
// Base 2 -> Binario
// Base 8 -> Hexadecimal
Var toBase: String;
begin
  toBase := '';
  while (decimal div base) <> 0 do Begin
     toBase := (decimal mod base).toString + toBase;
     decimal := decimal div base;
  End;
  Result := IntToStr(decimal) + toBase;
end;
//
//function IntToOct(decimal: Integer): String;
//Var Octal: String;
//begin
//  Octal := '';
//  while (decimal div 8) <> 0 do Begin
//     Octal := (decimal mod 8).toString + Octal;
//     decimal := decimal div 8;
//  End;
//  Result := decimal.ToString + Octal;
//end;

function OctalToDecimal(Octal: String): Integer;
var i: Integer;
begin
result := 0;
for i := 1 to Length(Octal) do
  inc(result, StrToInt(Octal[i]) * Potencia(8, Length(Octal) - i));
end;


function BinToBaseN(binario: String; base: Integer): Integer;
var i, Count: Integer;
Suma : Integer;
begin
  Count := 0;
  Suma := 0;
  for i := Length(binario) Downto 1 do Begin
    Suma := Suma + StrToInt(binario[i]) * Potencia(base, Count);
    Count := Count + 1;
  end;
  Result := Suma;
end;
end.
