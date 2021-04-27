object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 10: Matriz y Diagonales'
  ClientHeight = 370
  ClientWidth = 667
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
    Left = 167
    Top = 22
    Width = 466
    Height = 321
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object btnMatriz: TButton
    Left = 8
    Top = 22
    Width = 153
    Height = 35
    Caption = 'Prueba matriz / Diagonales'
    TabOrder = 1
    OnClick = btnMatrizClick
  end
end
