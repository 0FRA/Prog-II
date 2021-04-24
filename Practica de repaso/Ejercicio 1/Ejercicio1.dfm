object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 1'
  ClientHeight = 387
  ClientWidth = 548
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 161
    Top = 279
    Width = 97
    Height = 18
    Caption = 'Resultados'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 162
    Top = 303
    Width = 41
    Height = 19
    Caption = 'Media'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 162
    Top = 330
    Width = 58
    Height = 19
    Caption = 'Mediana'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 161
    Top = 355
    Width = 38
    Height = 19
    Caption = 'Moda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 161
    Top = 19
    Width = 360
    Height = 254
    Color = 13434879
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object EditMedia: TEdit
    Left = 227
    Top = 301
    Width = 121
    Height = 21
    Color = 13434879
    TabOrder = 1
    Text = '-'
  end
  object EditMediana: TEdit
    Left = 227
    Top = 328
    Width = 121
    Height = 21
    Color = 13434879
    TabOrder = 2
    Text = '-'
  end
  object EditModa: TEdit
    Left = 227
    Top = 355
    Width = 121
    Height = 21
    Color = 13434879
    TabOrder = 3
    Text = '-'
  end
  object GenerarNumeros: TButton
    Left = 8
    Top = 19
    Width = 137
    Height = 39
    Caption = 'Generar n'#250'meros'
    TabOrder = 4
    OnClick = GenerarNumerosClick
  end
  object ObtenerMedia: TButton
    Left = 8
    Top = 81
    Width = 137
    Height = 25
    Caption = 'Obtener media'
    TabOrder = 5
    OnClick = ObtenerMediaClick
  end
  object obtenerMediana: TButton
    Left = 8
    Top = 112
    Width = 137
    Height = 25
    Caption = 'Obtener mediana'
    TabOrder = 6
    OnClick = obtenerMedianaClick
  end
  object mostrarOrdenado: TButton
    Left = 8
    Top = 199
    Width = 137
    Height = 25
    Caption = 'Mostrar Ordenado'
    TabOrder = 7
    OnClick = mostrarOrdenadoClick
  end
  object obtenerModa: TButton
    Left = 8
    Top = 143
    Width = 137
    Height = 25
    Caption = 'Obterner moda'
    TabOrder = 8
    OnClick = obtenerModaClick
  end
end
