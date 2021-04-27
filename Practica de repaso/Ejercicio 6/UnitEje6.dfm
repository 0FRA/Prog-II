object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 6 - Conversor'
  ClientHeight = 467
  ClientWidth = 608
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
    Left = 112
    Top = 190
    Width = 56
    Height = 19
    Caption = 'Decimal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 112
    Top = 230
    Width = 49
    Height = 19
    Caption = 'Binario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 112
    Top = 334
    Width = 36
    Height = 19
    Caption = 'Octal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 112
    Top = 278
    Width = 89
    Height = 19
    Caption = 'Hexadecimal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 200
    Top = 130
    Width = 190
    Height = 13
    Caption = 'Seleccione el tipo de n'#250'mero ingresado:'
  end
  object Label6: TLabel
    Left = 112
    Top = 23
    Width = 361
    Height = 29
    Caption = 'Conversor de sistema numeraci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelTipoNumero: TLabel
    Left = 396
    Top = 130
    Width = 84
    Height = 13
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 446
    Top = 149
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 405
    Top = 82
    Width = 1
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 63
    Top = 77
    Width = 142
    Height = 19
    Caption = 'Ingresa un n'#250'mero:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EditNumero: TEdit
    Left = 211
    Top = 79
    Width = 179
    Height = 31
    TabOrder = 0
    Text = '0'
  end
  object EditDecimal: TEdit
    Left = 255
    Top = 192
    Width = 177
    Height = 25
    TabOrder = 1
    Text = '0'
  end
  object EditBinario: TEdit
    Left = 255
    Top = 232
    Width = 177
    Height = 25
    TabOrder = 2
    Text = '0'
  end
  object EditHexadecimal: TEdit
    Left = 255
    Top = 280
    Width = 177
    Height = 26
    TabOrder = 3
    Text = '0'
  end
  object EditOctal: TEdit
    Left = 255
    Top = 336
    Width = 177
    Height = 25
    TabOrder = 4
    Text = '0'
  end
  object RadioButtonDecimal: TRadioButton
    Left = 158
    Top = 149
    Width = 59
    Height = 17
    Caption = 'Decimal'
    TabOrder = 5
    OnClick = RadioButtonDecimalClick
  end
  object RadioButtonBinario: TRadioButton
    Left = 359
    Top = 149
    Width = 81
    Height = 17
    Caption = 'Binario'
    TabOrder = 6
    OnClick = RadioButtonBinarioClick
  end
  object RadioButtonHexadecimal: TRadioButton
    Left = 255
    Top = 149
    Width = 81
    Height = 17
    Caption = 'Hexadecimal'
    TabOrder = 7
    OnClick = RadioButtonHexadecimalClick
  end
  object RadioButtonOctal: TRadioButton
    Left = 430
    Top = 149
    Width = 59
    Height = 17
    Caption = 'Octal'
    TabOrder = 8
    OnClick = RadioButtonOctalClick
  end
end
