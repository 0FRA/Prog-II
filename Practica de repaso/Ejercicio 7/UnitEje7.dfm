object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 320
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCrearBinario: TButton
    Left = 16
    Top = 16
    Width = 153
    Height = 33
    Caption = 'Crear archivo binario'
    TabOrder = 0
    OnClick = btnCrearBinarioClick
  end
  object btnGenerarClientes: TButton
    Left = 16
    Top = 72
    Width = 153
    Height = 33
    Caption = 'Generar clientes'
    TabOrder = 1
    OnClick = btnGenerarClientesClick
  end
  object Memo1: TMemo
    Left = 175
    Top = 8
    Width = 431
    Height = 304
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object btnMostrarClientes: TButton
    Left = 16
    Top = 128
    Width = 153
    Height = 33
    Caption = 'Mostrar clientes'
    TabOrder = 3
    OnClick = btnMostrarClientesClick
  end
  object btnModificar: TButton
    Left = 16
    Top = 184
    Width = 153
    Height = 33
    Caption = 'Modificar registro'
    TabOrder = 4
    OnClick = btnModificarClick
  end
end
