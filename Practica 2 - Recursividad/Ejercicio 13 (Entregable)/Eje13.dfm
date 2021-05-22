object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 171
  ClientWidth = 491
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
    Top = 48
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object Memo1: TMemo
    Left = 200
    Top = 24
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Probar: TButton
    Left = 87
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Comprobar'
    TabOrder = 1
    OnClick = ProbarClick
  end
  object EditNum: TEdit
    Left = 73
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '32291  '
  end
end
