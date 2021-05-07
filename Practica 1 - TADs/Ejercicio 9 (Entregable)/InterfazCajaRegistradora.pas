unit InterfazCajaRegistradora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TAD_CajaRegistradora;

type
  TForm2 = class(TForm)
    LabelTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnCargarCaja: TButton;
    Label3: TLabel;
    EditCantidad: TEdit;
    ComboBoxValor: TComboBox;
    Memo1: TMemo;
    btnMostrarTotal: TButton;
    Label4: TLabel;
    btnCalcularVuelto: TButton;
    Label5: TLabel;
    EditPagaCon: TEdit;
    EditCobrar: TEdit;
    Label6: TLabel;
    procedure btnCargarCajaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMostrarTotalClick(Sender: TObject);
    procedure btnCalcularVueltoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  CajaR: CajaRegistradora;

implementation

{$R *.dfm}

procedure TForm2.btnCalcularVueltoClick(Sender: TObject);
Var aCobrar, Paga: Real;
begin
  aCobrar := StrToFloat(EditCobrar.Text);
  Paga := StrToFloat(EditPagaCon.Text);
  CajaR.DarVuelto(aCobrar, Paga);
end;

procedure TForm2.btnCargarCajaClick(Sender: TObject);
Var
  Denominacion, Cantidad: Integer;
begin
  { El indice del combobox es [0-15]
    Correspondiendo el 0 al texto 'Seleccionar valor'
    y del 1 a 15 a las denominaciones.
  }
  Denominacion := ComboBoxValor.ItemIndex;
  Cantidad := StrToInt(EditCantidad.Text);

  If CajaR.Cargar(Denominacion, Cantidad) then
    Memo1.Lines.Add('Cantidad agregada!')
  Else
    Memo1.Lines.Add('Error: debes seleccionar un valor.');
end;

procedure TForm2.btnMostrarTotalClick(Sender: TObject);
Var
  SaldoTotal: Real;
  Disponibilidad: ArrayDisponibilidad;
  I: Integer;
begin
  CajaR.EstadoYSaldo(SaldoTotal, Disponibilidad);
  Memo1.Clear;
  Memo1.Lines.Add('Disponibilidad');
  for I := 1 to Length(Disponibilidad) do
  Begin
     Memo1.Lines.Add(FloatToStr(Denominaciones[I]) + ' = ' + Disponibilidad[i].ToString)
  End;
  Memo1.Lines.Add('El saldo total es $' + FloatToStr(SaldoTotal));

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  // Crea una caja registradora
  CajaR.Crear();
end;

end.
