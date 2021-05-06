object Form1: TForm1
  Left = 0
  Top = 0
  Caption = '.'
  ClientHeight = 340
  ClientWidth = 744
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
    Left = 16
    Top = 46
    Width = 45
    Height = 13
    Caption = 'Patente: '
  end
  object Label2: TLabel
    Left = 16
    Top = 70
    Width = 38
    Height = 26
    Caption = 'Horario entrada'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 16
    Top = 110
    Width = 38
    Height = 26
    Caption = 'Horario salida'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 162
    Top = 115
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
    Left = 162
    Top = 70
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
  object Memo1: TMemo
    Left = 264
    Top = 19
    Width = 417
    Height = 313
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object btnGenerarVeh: TButton
    Left = 16
    Top = 156
    Width = 105
    Height = 41
    Caption = 'Generar aleatoriamente'
    TabOrder = 1
    WordWrap = True
    OnClick = btnGenerarVehClick
  end
  object EditPatente: TEdit
    Left = 67
    Top = 43
    Width = 171
    Height = 21
    TabOrder = 2
  end
  object btnIngresarVeh: TButton
    Left = 136
    Top = 156
    Width = 105
    Height = 41
    Caption = 'Ingresar vehiculo'
    TabOrder = 3
    OnClick = btnIngresarVehClick
  end
  object DatePickerEntrada: TDatePicker
    Left = 67
    Top = 70
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
    Left = 173
    Top = 70
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
    Left = 67
    Top = 115
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
    Left = 173
    Top = 115
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
    Left = 16
    Top = 216
    Width = 225
    Height = 33
    Caption = 'Mostrar vehiculos guardados'
    TabOrder = 8
    OnClick = btnMostrarVehiculosClick
  end
end
