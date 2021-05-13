object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 259
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 216
    Top = 40
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Probar: TButton
    Left = 71
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Probar'
    TabOrder = 1
    OnClick = ProbarClick
  end
  object EditNum: TEdit
    Left = 57
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'EditNum'
  end
end
