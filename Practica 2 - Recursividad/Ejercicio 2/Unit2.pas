unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function mcd(n1, n2: integer): integer;
begin
  if n2 = 0 then
    mcd := n1
  else
    mcd := mcd(n2, n1 mod n2)

end;

procedure TForm2.Button1Click(Sender: TObject);
var s : string;
int: integer;
begin
s := IntToStr(mcd(79, 59));
Memo1.Lines.Add(s);

//int := 79 mod 59;
//ShowMessage('79 mod 59 = '+IntToStr(int));

end;

end.
