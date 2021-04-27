unit InterfazMatriz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TDA_Matriz, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    memo1: TMemo;
    btnMatriz: TButton;
    procedure btnMatrizClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMatrizClick(Sender: TObject);
Var M: Matriz;
    M2: Matriz;
begin
  M.CargarAleatorio(100);
  memo1.Clear;
  memo1.Lines.Add(M.RetornarAsString);
  memo1.Lines.Add('');
  memo1.Lines.Add(M.RetornarDiagonalPrincipal());

end;

end.

