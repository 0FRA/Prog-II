unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitParsing,
  UnitSubConjunto;

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

  // VectorINT = Array [1..100] of Integer;
var
  Form2: TForm2;

implementation

{$R *.dfm}
//

procedure TForm2.CalcularClick(Sender: TObject);
Var
  Conjunto: VectorSTR;
  i: Integer;
begin
  Conjunto := Parsing(EditConjunto.Text, ',');
  Memo1.Lines.Add(Subconjuntos_Suma(Conjunto, StrToInt(EditSuma.Text)));
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
