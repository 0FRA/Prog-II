unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Poblacion;

type
  TForm1 = class(TForm)
    d1: TEdit;
    d2: TEdit;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  v: vector;
  i: integer;
begin
  v := calcularcantidad(StrToInt(d1.Text), StrToInt(d2.Text));
  for i := 1 to 100 do
    Memo1.Lines.Add('cantidad:' + IntToStr(v[i]));
end;

end.
