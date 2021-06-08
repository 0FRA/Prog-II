object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 317
  ClientWidth = 802
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
    Left = 64
    Top = 96
    Width = 56
    Height = 16
    Caption = 'Calcular:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCrearList: TButton
    Left = 8
    Top = 16
    Width = 177
    Height = 33
    Caption = 'Crear Lista  -  Valores Random'
    TabOrder = 0
    OnClick = btnCrearListClick
  end
  object Memo1: TMemo
    Left = 191
    Top = 16
    Width = 562
    Height = 285
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object btnMostrarLista: TButton
    Left = 8
    Top = 55
    Width = 177
    Height = 33
    Caption = 'Mostrar Lista'
    TabOrder = 2
    OnClick = btnMostrarListaClick
  end
  object btnCalcularMayor: TButton
    Left = 8
    Top = 118
    Width = 177
    Height = 33
    Caption = 'Mayor'
    TabOrder = 3
    OnClick = btnCalcularMayorClick
  end
  object btnCalcularMenor: TButton
    Left = 8
    Top = 157
    Width = 177
    Height = 34
    Caption = 'Menor'
    TabOrder = 4
    OnClick = btnCalcularMenorClick
  end
  object btnCalcularPromedio: TButton
    Left = 8
    Top = 197
    Width = 177
    Height = 36
    Caption = 'Promedio'
    TabOrder = 5
    OnClick = btnCalcularPromedioClick
  end
  object btnRandomUnico: TButton
    Left = 8
    Top = 264
    Width = 177
    Height = 37
    Caption = 'Crear Lista - Valores Rand '#218'nicos'
    TabOrder = 6
    OnClick = btnRandomUnicoClick
  end
end
