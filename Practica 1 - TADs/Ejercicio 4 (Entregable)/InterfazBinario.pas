unit InterfazBinario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TDA_Binario;

type
  TForm1 = class(TForm)
    btnSumar: TButton;
    EditBinario1: TEdit;
    EditBinario2: TEdit;
    btnRestar: TButton;
    btnOR: TButton;
    btnXOR: TButton;
    btnAND: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EditResultado: TEdit;
    Label3: TLabel;
    btnConvertirBinario: TButton;
    btnConvertirDecimal: TButton;
    EditResultBin: TEdit;
    EditResultDecimal: TEdit;
    procedure btnSumarClick(Sender: TObject);
    procedure EditBinario1KeyPress(Sender: TObject; var Key: Char);
    procedure EditBinario2KeyPress(Sender: TObject; var Key: Char);
    procedure btnConvertirBinarioClick(Sender: TObject);
    procedure btnConvertirDecimalClick(Sender: TObject);
    procedure EditResultDecimalKeyPress(Sender: TObject; var Key: Char);
    procedure btnRestarClick(Sender: TObject);
    procedure btnANDClick(Sender: TObject);
    procedure btnORClick(Sender: TObject);
    procedure btnXORClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  B1: Binario;
implementation

{$R *.dfm}

procedure TForm1.btnRestarClick(Sender: TObject);
Var B1, B2, Resultado: Binario;
S: String;
begin
B1.SetSize(32);
B2.SetSize(32);
B1.SetValue(EditBinario1.Text);
B2.SetValue(EditBinario2.Text);
EditResultado.Text := B1.Restar(B2).BinToString;
end;

procedure TForm1.btnSumarClick(Sender: TObject);
Var B1, B2, Resultado: Binario;
S: String;
begin
B1.SetSize(32);
B2.SetSize(32);
B1.SetValue(EditBinario1.Text);
B2.SetValue(EditBinario2.Text);
//Memo1.Lines.Add(B1.MostrarValor());
//Memo1.Lines.Add(B1.IsBinario('1010001').ToString);
EditResultado.Text := B1.Sumar(B2).BinToString;

end;

procedure TForm1.btnANDClick(Sender: TObject);
Var B1, B2: Binario;
begin
B1.SetSize(32);
B2.SetSize(32);
B1.SetValue(EditBinario1.Text);
B2.SetValue(EditBinario2.Text);
EditResultado.Text := B1.Operador(B2, bAND).BinToString;
end;

procedure TForm1.btnORClick(Sender: TObject);
Var B1, B2: Binario;
begin
B1.SetSize(32);
B2.SetSize(32);
B1.SetValue(EditBinario1.Text);
B2.SetValue(EditBinario2.Text);
EditResultado.Text := B1.Operador(B2, bOR).BinToString;
end;

procedure TForm1.btnXORClick(Sender: TObject);
Var B1, B2: Binario;
begin
B1.SetSize(32);
B2.SetSize(32);
B1.SetValue(EditBinario1.Text);
B2.SetValue(EditBinario2.Text);
EditResultado.Text := B1.Operador(B2, bXOR).BinToString;
end;

procedure TForm1.btnConvertirBinarioClick(Sender: TObject);
Var B1: Binario;
begin
B1.SetSize(32);
EditResultDecimal.Text := B1.ConvertirBinario(StrToInt(EditResultBin.Text)).BinToString;
end;

procedure TForm1.btnConvertirDecimalClick(Sender: TObject);
Var B1: Binario;
begin
B1.SetSize(32);
B1.SetValue(Trim(EditResultDecimal.Text));
EditResultBin.Text := B1.ConvertirDecimal().ToString;
end;

procedure TForm1.EditBinario1KeyPress(Sender: TObject; var Key: Char);
Var IsBinary: Boolean;
begin
IsBinary := ((Key = '1') OR (Key = '0') OR (Key = Chr(13)) OR (Key = Chr(127)));
If NOT (IsBinary) then
  Key := #0;    // Devuelvo NULL
end;

procedure TForm1.EditBinario2KeyPress(Sender: TObject; var Key: Char);
Var IsBinary: Boolean;
begin
IsBinary := ((Key = '1') OR (Key = '0') OR (Key = Chr(13)) OR (Key = Chr(127)));
If NOT (IsBinary) then
  Key := #0;    // Devuelvo NULL
end;

procedure TForm1.EditResultDecimalKeyPress(Sender: TObject; var Key: Char);
Var IsBinary: Boolean;
begin
IsBinary := ((Key = '1') OR (Key = '0') OR (Key = Chr(13)) OR (Key = Chr(127)));
If NOT (IsBinary) then
  Key := #0;    // Devuelvo NULL
end;

end.
