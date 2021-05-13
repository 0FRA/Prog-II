object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 272
  ClientWidth = 520
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
    Left = 16
    Top = 51
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object Label2: TLabel
    Left = 16
    Top = 102
    Width = 36
    Height = 13
    Caption = 'Bomba:'
  end
  object Memo1: TMemo
    Left = 240
    Top = 48
    Width = 240
    Height = 169
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 73
    Top = 48
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 73
    Top = 99
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 88
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Probar'
    TabOrder = 3
    OnClick = Button1Click
  end
end
