object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Ejercicio 9 (Entregable): Caja registradora'
  ClientHeight = 352
  ClientWidth = 740
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
  object LabelTitulo: TLabel
    Left = 264
    Top = 16
    Width = 184
    Height = 25
    Caption = 'Caja registradora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 48
    Top = 56
    Width = 80
    Height = 19
    Caption = 'Cargar caja'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 101
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Label3: TLabel
    Left = 10
    Top = 129
    Width = 47
    Height = 13
    Caption = 'Cantidad:'
  end
  object Label4: TLabel
    Left = 597
    Top = 56
    Width = 73
    Height = 19
    Caption = 'Dar vuelto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 559
    Top = 125
    Width = 31
    Height = 13
    Caption = 'Paga: '
  end
  object Label6: TLabel
    Left = 543
    Top = 100
    Width = 47
    Height = 13
    Caption = 'A Cobrar:'
  end
  object Label7: TLabel
    Left = 559
    Top = 155
    Width = 26
    Height = 13
    Caption = 'Con: '
  end
  object btnCargarCaja: TButton
    Left = 63
    Top = 148
    Width = 114
    Height = 25
    Caption = 'Agregar'
    TabOrder = 0
    OnClick = btnCargarCajaClick
  end
  object EditCantidad: TEdit
    Left = 63
    Top = 125
    Width = 114
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object ComboBoxValor: TComboBox
    Left = 63
    Top = 97
    Width = 114
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'Seleccionar valor'
    Items.Strings = (
      'Seleccionar valor'
      '1 Ctvo'
      '5 Ctvos'
      '10 Ctvos'
      '25 Ctvos'
      '50 Ctvos'
      '1 Peso'
      '2 Pesos'
      '5 Pesos'
      '10 Pesos'
      '20 Pesos'
      '50 Pesos'
      '100 Pesos'
      '200 Pesos'
      '500 Pesos'
      '1000 Pesos')
  end
  object Memo1: TMemo
    Left = 208
    Top = 47
    Width = 321
    Height = 263
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object btnMostrarTotal: TButton
    Left = 20
    Top = 188
    Width = 182
    Height = 25
    Caption = 'Mostrar saldo total'
    TabOrder = 4
    OnClick = btnMostrarTotalClick
  end
  object btnCalcularVuelto: TButton
    Left = 591
    Top = 205
    Width = 113
    Height = 30
    Caption = 'Calcular vuelto'
    TabOrder = 5
    OnClick = btnCalcularVueltoClick
  end
  object EditPagaCon: TEdit
    Left = 591
    Top = 122
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object EditCobrar: TEdit
    Left = 592
    Top = 98
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object ComboBoxPagaCon: TComboBox
    Left = 591
    Top = 152
    Width = 114
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 8
    Text = 'Seleccionar valor'
    OnChange = ComboBoxPagaConChange
    Items.Strings = (
      'Seleccionar valor'
      '1 Ctvo'
      '5 Ctvos'
      '10 Ctvos'
      '25 Ctvos'
      '50 Ctvos'
      '1 Peso'
      '2 Pesos'
      '5 Pesos'
      '10 Pesos'
      '20 Pesos'
      '50 Pesos'
      '100 Pesos'
      '200 Pesos'
      '500 Pesos'
      '1000 Pesos')
  end
end
