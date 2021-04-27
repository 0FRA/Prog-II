unit UnitEje6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitMatematica, UnitConversion,
  Vcl.CheckLst, Vcl.Menus;

type
  TForm1 = class(TForm)
    EditNumero: TEdit;
    EditDecimal: TEdit;
    EditBinario: TEdit;
    EditHexadecimal: TEdit;
    EditOctal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioButtonDecimal: TRadioButton;
    Label5: TLabel;
    RadioButtonBinario: TRadioButton;
    RadioButtonHexadecimal: TRadioButton;
    RadioButtonOctal: TRadioButton;
    Label6: TLabel;
    LabelTipoNumero: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure RadioButtonDecimalClick(Sender: TObject);
    procedure RadioButtonHexadecimalClick(Sender: TObject);
    procedure RadioButtonBinarioClick(Sender: TObject);
    procedure RadioButtonOctalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.RadioButtonBinarioClick(Sender: TObject);
var binario: String;
 i: Integer;
begin
binario := EditNumero.Text;
  for i := 1 to Length(binario) do Begin
    if NOT (binario[i] in ['0','1']) then begin
      showmessage('ERROR: No has ingresado un número binario');
    end;
  End;
LabelTipoNumero.Caption := 'BINARIO';
EditBinario.Text := binario;
EditDecimal.Text := BinToBaseN(binario, 2).toString;
EditHexadecimal.Text := IntToHex(StrToInt(EditDecimal.Text));
EditOctal.Text := IntToBaseN(StrToInt(EditDecimal.Text), 8);

end;


procedure TForm1.RadioButtonDecimalClick(Sender: TObject);
var decimal: Integer;
begin
LabelTipoNumero.Caption := 'DECIMAL';
decimal := StrToInt(EditNumero.Text);
EditBinario.Text := IntToBaseN(decimal, 2);
EditHexadecimal.Text := IntToHex(decimal);
EditOctal.Text := IntToBaseN(decimal, 8);
EditDecimal.Text := decimal.ToString;
end;

procedure TForm1.RadioButtonHexadecimalClick(Sender: TObject);

begin
  LabelTipoNumero.Caption := 'HEXADECIMAL';
  EditHexadecimal.Text := EditNumero.Text;
  EditDecimal.Text := StrToInt('$'+EditNumero.Text).ToString;
  EditOctal.Text := IntToBaseN(StrToInt(EditDecimal.Text), 8);
  EditBinario.Text := IntToBaseN(StrToInt(EditDecimal.Text), 2);
end;

procedure TForm1.RadioButtonOctalClick(Sender: TObject);
var Octal: String;
  I: Integer;
begin
  LabelTipoNumero.Caption := 'OCTAL';
  Octal := EditNumero.Text;
  for i := 1 to Length(Octal) do Begin
    if NOT (Octal[i] in ['0','1','2','3','4','5','6','7']) then begin
      showmessage('ERROR: No has ingresado un número octal');
    end;
  End;
  EditDecimal.Text := OctalToDecimal(Octal).ToString;
  EditBinario.Text := IntToBaseN(StrToInt(EditDecimal.Text), 2);
  EditHexadecimal.Text := (IntToHex(StrToInt(EditDecimal.Text),8));
  EditOctal.Text := octal;
end;

end.
