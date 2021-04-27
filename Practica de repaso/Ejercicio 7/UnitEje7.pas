unit UnitEje7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnCrearBinario: TButton;
    btnGenerarClientes: TButton;
    Memo1: TMemo;
    btnMostrarClientes: TButton;
    btnModificar: TButton;
    procedure btnCrearBinarioClick(Sender: TObject);
    procedure btnGenerarClientesClick(Sender: TObject);
    procedure btnMostrarClientesClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  // Defino el registro (FIJO) = 4 + 50 + 50 + 100 + 15 = 219 bytes
  Cliente = Record
    Codigo : LongInt;
    Razon_Social: String[50];
    Domicilio : String[50];
    Localidad : String[30];
    TE: LongInt; // BigInt no lo reconoce
    Mail: String[100];
  End;
  // Defino el Archivo del registro cliente  (Binario)
  Clientes = File Of Cliente;
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCrearBinarioClick(Sender: TObject);
Var RegistroCliente: Cliente;
    ArchivoClientes: Clientes;
begin
  // En que lugar del disco va a residir el archivo. Usamos el path relativo
  AssignFile(ArchivoClientes,'.\Clientes.Dat');
  // Vamos a controlar que el archivo NO exista para crearlo
  if Not FileExists('.\Clientes.Dat') then Begin
    Memo1.Lines.Add('Archivo creado con 0 registros.');
    Rewrite(ArchivoClientes);
    CloseFile(ArchivoClientes);
  End else begin
    Memo1.Lines.Add('ERROR: El archivo binario ya existe');
  end;
end;

procedure TForm1.btnGenerarClientesClick(Sender: TObject);
Var RegistroCliente: Cliente;
    ArchivoClientes: Clientes;
    I: Integer;
begin
  AssignFile(ArchivoClientes,'.\Clientes.Dat');
    if FileExists('.\Clientes.Dat') then Begin
    // Abrirlo con reset (Modo/Lectura Escritura) y queda en el BOF
    Reset(ArchivoClientes);
    Memo1.Lines.Add('Cargando el Archivo....' + DateTimeToStr(Now));
    // Vamos a escribir 5000 registros
    for I := 0 to 10 do Begin
      RegistroCliente.Codigo := I;
      RegistroCliente.Razon_Social := 'Razon Social de <' + RegistroCliente.Codigo.ToString + ' >';
      RegistroCliente.Domicilio := 'Domicilio de <' + RegistroCliente.Codigo.ToString + '>';
      RegistroCliente.Localidad := 'Localidad de <' + RegistroCliente.Codigo.ToString + '>';
      RegistroCliente.TE := I + 100000;
      RegistroCliente.Mail := 'direccion' + RegistroCliente.Codigo.ToString + '@email.com';
      Write(ArchivoClientes, RegistroCliente);
    End;
    // Cerrar el archivo para que puedo bajar el buffer al mismo
    CloseFile(ArchivoClientes);
    memo1.Lines.Add('Fin de la carga de Archivo ...' + DateTimeToStr(Now));
  End else begin
    Memo1.Lines.Add('ERROR: Primero debes generar el archivo binario.');
  end;
end;

procedure TForm1.btnModificarClick(Sender: TObject);
Var RegistroCliente: Cliente;
    ArchivoClientes: Clientes;
begin

  // En que lugar del disco va a residir el archivo. Usamos el path relativo
  AssignFile(ArchivoClientes,'.\Clientes.Dat');
  // Vamos a controlar que el archivo NO exista para crearlo
  if Not FileExists('.\Clientes.Dat') then Begin
    Rewrite(ArchivoClientes);
    CloseFile(ArchivoClientes);
  End;

  // Abrirlo con reset (Modo/Lectura Escritura) y queda en el BOF
  Reset(ArchivoClientes);

  // Vamos a leer el registro 5 y a modificarlo
  Seek(ArchivoClientes, 5);   // Posiciona el puntero de registro en la posición 5
  Read(ArchivoClientes, RegistroCliente);  // Leo el registro 5
  RegistroCliente.Domicilio := 'NUEVO DOMICILIO *******';
  Seek(ArchivoClientes, 5);   // Vuelvo a posicionarme en la posicion 5 porque el Read me adelanto el puntero de reigstro
  Write(ArchivoClientes, RegistroCliente);  // Escribo de nuevo la posicion 5

  // Cerrar el archivo
  CloseFile(ArchivoClientes);

end;

procedure TForm1.btnMostrarClientesClick(Sender: TObject);
Var RegistroCliente: Cliente;
    ArchivoClientes: Clientes;
begin
  // En que lugar del disco va a residir el archivo. Usamos el path relativo
  AssignFile(ArchivoClientes,'.\Clientes.Dat');
  // Vamos a controlar que el archivo NO exista para crearlo
  if Not FileExists('.\Clientes.Dat') then Begin
    Rewrite(ArchivoClientes);
    CloseFile(ArchivoClientes);
  End;

  // Abrirlo con reset (Modo/Lectura Escritura) y queda en el BOF
  Reset(ArchivoClientes);

  // Recorrido secuencial del archivo
  while Not EOF(ArchivoClientes) do Begin
    Read(ArchivoClientes, RegistroCliente);  // lee el registro del archivo y lo pasa a la variable <RA>, y se para en el proximo registro
    memo1.Lines.Add('Codigo: ' + RegistroCliente.Codigo.ToString);
    memo1.Lines.Add('Razón Social: ' + RegistroCliente.Razon_Social);
    memo1.Lines.Add('Domicilio: ' + RegistroCliente.Domicilio);
    memo1.Lines.Add('Localidad: ' + RegistroCliente.Localidad);
    memo1.Lines.Add('Te: ' + RegistroCliente.TE.ToString);
    memo1.Lines.Add('E-Mail: ' + RegistroCliente.Mail);
    memo1.Lines.Add('--------------------------------------------------------------');
  end;

  // Cierro el archivo
  CloseFile(ArchivoClientes);
end;
end.
