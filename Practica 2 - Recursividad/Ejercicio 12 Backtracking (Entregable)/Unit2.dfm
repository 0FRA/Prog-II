object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 186
  ClientWidth = 418
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
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 97
    Height = 13
    Caption = 'Ingrese el conjunto:'
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 80
    Height = 13
    Caption = 'Ingrese la suma:'
  end
  object Label3: TLabel
    Left = 247
    Top = 32
    Width = 93
    Height = 13
    Caption = 'Ej: 10, 3, 1, 7, 4, 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 247
    Top = 75
    Width = 22
    Height = 13
    Caption = 'Ej: 7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Calcular: TButton
    Left = 136
    Top = 99
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 0
    OnClick = CalcularClick
  end
  object EditConjunto: TEdit
    Left = 120
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '10,3,1,7,4,2'
  end
  object EditSuma: TEdit
    Left = 120
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '7'
  end
  object Memo1: TMemo
    Left = 224
    Top = 99
    Width = 193
    Height = 84
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
