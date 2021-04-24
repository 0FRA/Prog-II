object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 4: Cuadrado Latino '
  ClientHeight = 156
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCuadroLatino: TButton
    Left = 8
    Top = 21
    Width = 121
    Height = 41
    Caption = 'Generar Cuadro Latino'
    TabOrder = 0
    OnClick = btnCuadroLatinoClick
  end
  object Grilla: TStringGrid
    Left = 160
    Top = 21
    Width = 264
    Height = 104
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 1
  end
end
