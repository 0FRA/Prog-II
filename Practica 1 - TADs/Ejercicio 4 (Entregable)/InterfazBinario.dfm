object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 4: TAD Binario (Entregable)'
  ClientHeight = 416
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 114
    Top = 83
    Width = 41
    Height = 13
    Caption = 'Binario 1'
  end
  object Label2: TLabel
    Left = 114
    Top = 131
    Width = 41
    Height = 13
    Caption = 'Binario 2'
  end
  object Label3: TLabel
    Left = 114
    Top = 187
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object btnSumar: TButton
    Left = 24
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Sumar'
    TabOrder = 0
    OnClick = btnSumarClick
  end
  object EditBinario1: TEdit
    Left = 186
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
    OnKeyPress = EditBinario1KeyPress
  end
  object EditBinario2: TEdit
    Left = 186
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    OnKeyPress = EditBinario2KeyPress
  end
  object btnRestar: TButton
    Left = 105
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Restar'
    TabOrder = 3
    OnClick = btnRestarClick
  end
  object btnOR: TButton
    Left = 267
    Top = 22
    Width = 75
    Height = 25
    Caption = 'OR'
    TabOrder = 4
    OnClick = btnORClick
  end
  object btnXOR: TButton
    Left = 348
    Top = 22
    Width = 75
    Height = 25
    Caption = 'XOR'
    TabOrder = 5
    OnClick = btnXORClick
  end
  object btnAND: TButton
    Left = 186
    Top = 22
    Width = 75
    Height = 25
    Caption = 'AND'
    TabOrder = 6
    OnClick = btnANDClick
  end
  object EditResultado: TEdit
    Left = 186
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object btnConvertirBinario: TButton
    Left = 105
    Top = 264
    Width = 115
    Height = 25
    Caption = 'Convertir a binario'
    TabOrder = 8
    OnClick = btnConvertirBinarioClick
  end
  object btnConvertirDecimal: TButton
    Left = 105
    Top = 320
    Width = 115
    Height = 25
    Caption = 'Convertir a decimal'
    TabOrder = 9
    OnClick = btnConvertirDecimalClick
  end
  object EditResultBin: TEdit
    Left = 226
    Top = 266
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '0'
  end
  object EditResultDecimal: TEdit
    Left = 226
    Top = 322
    Width = 121
    Height = 21
    TabOrder = 11
    Text = '0'
    OnKeyPress = EditResultDecimalKeyPress
  end
end
