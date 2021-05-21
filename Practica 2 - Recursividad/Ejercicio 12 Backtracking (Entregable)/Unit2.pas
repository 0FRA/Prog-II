unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitParsing;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    EditConjunto: TEdit;
    EditSuma: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  VectorINT = Array [1..100] of Integer;
var
  Form2: TForm2;

implementation

{$R *.dfm}

Function SubConjuntos_SumaAUX(i: Integer; Conjunto, SubConjunto: VectorSTR; sizeCon, Suma, totalSuma: Integer; S: String ): VectorSTR;
Begin
  if Suma = totalSuma  then begin
   showmessage(i.ToString+'-'+S);
   SetLength(SubConjunto, i + 1);
   SubConjunto[i] := S;
  end;
  if (sizeCon > 0) and (Suma <> totalSuma) then begin
    SubConjuntos_SumaAUX(i, Conjunto, SubConjunto, sizeCon - 1, Suma, totalSuma, S);
    //S := S + Conjunto[sizeCon - 1];
    SubConjuntos_SumaAUX(i + 1, Conjunto, SubConjunto, sizeCon -1, Suma, totalSuma + StrToInt(Conjunto[sizeCon -  1]), S  + Conjunto[sizeCon - 1] + ',')
  end;

  Result := SubConjunto;
End;
function Subconjuntos_Suma(Conjunto: VectorSTR; Suma: Integer): String;
Var V: VectorINT;
S: String;
SubConjunto, Resultado: VectorSTR;
I:Integer;
begin
     Resultado := SubConjuntos_SumaAUX(0, Conjunto, SubConjunto, 6, Suma, 0, S);
end;



procedure TForm2.Button1Click(Sender: TObject);
Var //Conjunto: VectorINT;
    Conjunto2: VectorSTR;
  i: Integer;
begin
  Conjunto2 := Parsing(EditConjunto.Text,',');
  Memo1.Lines.Add(Subconjuntos_Suma(Conjunto2, StrToInt(EditSuma.Text)));
//  for i := 0 to Length(Conjunto2) - 1 do
//  begin
//    Memo1.Lines.Add(Conjunto2[i])
//  end;
end;

end.
