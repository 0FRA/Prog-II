object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 9'
  ClientHeight = 433
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memo1: TMemo
    Left = 160
    Top = 8
    Width = 444
    Height = 417
    Lines.Strings = (
      'memo1')
    TabOrder = 0
  end
  object btnGenerarVector: TButton
    Left = 8
    Top = 8
    Width = 137
    Height = 33
    Caption = 'Generar vector'
    TabOrder = 1
    OnClick = btnGenerarVectorClick
  end
  object btnCalcularOrdenamiento: TButton
    Left = 8
    Top = 72
    Width = 137
    Height = 33
    Caption = 'Calcular Ordenamiento'
    TabOrder = 2
    OnClick = btnCalcularOrdenamientoClick
  end
end
