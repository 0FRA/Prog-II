object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 6 y 7 (Entregables): TDA Estacionamiento'
  ClientHeight = 460
  ClientWidth = 864
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
    Left = 24
    Top = 86
    Width = 45
    Height = 13
    Caption = 'Patente: '
  end
  object Label2: TLabel
    Left = 24
    Top = 110
    Width = 38
    Height = 26
    Caption = 'Horario entrada'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 24
    Top = 150
    Width = 38
    Height = 26
    Caption = 'Horario salida'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 170
    Top = 155
    Width = 5
    Height = 16
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 170
    Top = 110
    Width = 5
    Height = 16
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelTitulo: TLabel
    Left = 304
    Top = 8
    Width = 267
    Height = 39
    Caption = 'Estacionamineto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelTituloIngreso: TLabel
    Left = 41
    Top = 51
    Width = 193
    Height = 25
    Caption = 'Ingreso de veh'#237'culos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 649
    Top = 51
    Width = 199
    Height = 25
    Caption = 'Recaudado por fecha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 665
    Top = 167
    Width = 158
    Height = 50
    Caption = 'Total recaudado entre dos fecha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object LabelDesde: TLabel
    Left = 728
    Top = 235
    Width = 34
    Height = 13
    Caption = 'Desde:'
  end
  object LabelHasta: TLabel
    Left = 728
    Top = 287
    Width = 32
    Height = 13
    Caption = 'Hasta:'
  end
  object Memo1: TMemo
    Left = 280
    Top = 83
    Width = 329
    Height = 350
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnGenerarVeh: TButton
    Left = 24
    Top = 196
    Width = 105
    Height = 41
    Caption = 'Generar aleatoriamente'
    TabOrder = 1
    WordWrap = True
    OnClick = btnGenerarVehClick
  end
  object EditPatente: TEdit
    Left = 75
    Top = 83
    Width = 171
    Height = 21
    TabOrder = 2
  end
  object btnIngresarVeh: TButton
    Left = 144
    Top = 196
    Width = 105
    Height = 41
    Caption = 'Ingresar vehiculo'
    TabOrder = 3
    OnClick = btnIngresarVehClick
  end
  object DatePickerEntrada: TDatePicker
    Left = 75
    Top = 110
    Width = 89
    Height = 21
    Date = 44321.000000000000000000
    DateFormat = 'd/M/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
  end
  object TimePickerEntrada: TTimePicker
    Left = 181
    Top = 110
    Width = 65
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 5
    Time = 44321.864420914360000000
    TimeFormat = 'hh:mm'
  end
  object DatePickerSalida: TDatePicker
    Left = 75
    Top = 155
    Width = 89
    Height = 21
    Date = 44321.000000000000000000
    DateFormat = 'd/M/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 6
  end
  object TimePickerSalida: TTimePicker
    Left = 181
    Top = 155
    Width = 65
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 7
    Time = 44321.864420914360000000
    TimeFormat = 'hh:mm'
  end
  object btnMostrarVehiculos: TButton
    Left = 24
    Top = 256
    Width = 225
    Height = 33
    Caption = 'Mostrar vehiculos guardados'
    TabOrder = 8
    OnClick = btnMostrarVehiculosClick
  end
  object DatePickerRecaudado: TDatePicker
    Left = 657
    Top = 82
    Width = 174
    Height = 27
    Date = 44321.000000000000000000
    DateFormat = 'd/M/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 9
  end
  object btnMostrarRecaudado: TButton
    Left = 665
    Top = 123
    Width = 152
    Height = 26
    Caption = 'Mostrar recaudado'
    TabOrder = 10
    OnClick = btnMostrarRecaudadoClick
  end
  object DatePickerRecaudadoDesde: TDatePicker
    Left = 659
    Top = 254
    Width = 174
    Height = 27
    Date = 44321.000000000000000000
    DateFormat = 'd/M/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 11
  end
  object DatePickerRecaudadoHasta: TDatePicker
    Left = 659
    Top = 311
    Width = 174
    Height = 27
    Date = 44321.000000000000000000
    DateFormat = 'd/M/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 12
  end
  object btnMostrarTotal: TButton
    Left = 685
    Top = 360
    Width = 124
    Height = 25
    Caption = 'Mostrar total recaudado'
    TabOrder = 13
    OnClick = btnMostrarTotalClick
  end
end
