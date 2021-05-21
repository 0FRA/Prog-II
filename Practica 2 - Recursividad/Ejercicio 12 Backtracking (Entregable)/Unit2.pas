unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitParsing;

type
  TForm2 = class(TForm)
    Calcular: TButton;
    Label1: TLabel;
    EditConjunto: TEdit;
    EditSuma: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    procedure CalcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //VectorINT = Array [1..100] of Integer;
var
  Form2: TForm2;

implementation

{$R *.dfm}
//

Function SubConjuntos_SumaAUX(i: Integer; Conjunto: VectorSTR; Var SubConjunto: VectorSTR; sizeCon, Suma, totalSuma: Integer; S: String ): VectorSTR;
Begin
  if Suma = totalSuma  then begin
   SetLength(SubConjunto, i + 1);
   SubConjunto[i] := S;
    {No logro guardar bien el subconjunto,
    Cuando ingreso 5, el valor se pisa (No se incrementa I)}
   //Con showmessage se muestra bien
   //showmessage(i.ToString+'-'+S);
  end;
  if (sizeCon > 0) and (Suma <> totalSuma) then begin
    SubConjuntos_SumaAUX(i, Conjunto, SubConjunto, sizeCon - 1, Suma, totalSuma, S);
    SubConjuntos_SumaAUX(i + 1, Conjunto, SubConjunto, sizeCon -1, Suma, totalSuma + StrToInt(Conjunto[sizeCon -  1]), S  + Conjunto[sizeCon - 1] + ',') ;
  end;
  Result := SubConjunto;
End;


function Subconjuntos_Suma(Conjunto: VectorSTR; Suma: Integer): String;
Var S: String;
SubConjunto: VectorSTR;
I:Integer;
begin
     SubConjunto := SubConjuntos_SumaAUX(0, Conjunto, SubConjunto, Length(Conjunto), Suma, 0, S);
     s := '';
     for I := Length(SubConjunto) - 1 downto 1  do begin
      S := S +'{' + SubConjunto[I] + '}';
     end;
     result := S;
end;



procedure TForm2.CalcularClick(Sender: TObject);
Var Conjunto: VectorSTR;
  i: Integer;
begin
  Conjunto := Parsing(EditConjunto.Text,',');
  Memo1.Lines.Add(Subconjuntos_Suma(Conjunto, StrToInt(EditSuma.Text)));
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
Memo1.Clear;
end;

end.
