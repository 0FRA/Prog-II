object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 3'
  ClientHeight = 334
  ClientWidth = 652
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
  object Memo1: TMemo
    Left = 176
    Top = 32
    Width = 433
    Height = 257
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object btnLeerArchivo: TButton
    Left = 8
    Top = 32
    Width = 145
    Height = 33
    Caption = 'Leer archivo'
    TabOrder = 1
    OnClick = btnLeerArchivoClick
  end
  object btnParsear: TButton
    Left = 8
    Top = 88
    Width = 145
    Height = 25
    Caption = 'Parsear'
    TabOrder = 2
    OnClick = btnParsearClick
  end
end
