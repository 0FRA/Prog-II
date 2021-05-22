object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object d1: TEdit
    Left = 56
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object d2: TEdit
    Left = 56
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object Button1: TButton
    Left = 72
    Top = 160
    Width = 75
    Height = 25
    Caption = 'calcular'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 240
    Top = 48
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
