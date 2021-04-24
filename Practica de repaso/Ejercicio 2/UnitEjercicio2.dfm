object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 2'
  ClientHeight = 294
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EditCadena: TEdit
    Left = 32
    Top = 24
    Width = 414
    Height = 21
    TabOrder = 0
    Text = 'Hola Mundo Cruel y Despiadado'
  end
  object btnMostrarResultados: TButton
    Left = 32
    Top = 61
    Width = 97
    Height = 25
    Caption = 'Mostrar resultados'
    TabOrder = 1
    OnClick = btnMostrarResultadosClick
  end
  object Memo1: TMemo
    Left = 32
    Top = 92
    Width = 537
    Height = 178
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object btnGenerarCadena: TButton
    Left = 452
    Top = 22
    Width = 117
    Height = 25
    Caption = 'Generar otra cadena'
    TabOrder = 3
    OnClick = btnGenerarCadenaClick
  end
end
