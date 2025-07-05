object frmFirebird: TfrmFirebird
  Left = 0
  Top = 0
  Caption = 'Firebird config form'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 227
    Height = 17
    Caption = 'Select Firebird database to explorer :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 144
    Top = 182
    Width = 138
    Height = 15
    Caption = 'Select table to explorer :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 256
    Top = 35
    Width = 98
    Height = 15
    Caption = 'Set Firebird Port :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 91
    Width = 203
    Height = 17
    Caption = 'Select Firebird database Library :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 624
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 640
      end>
  end
  object btnPathDB: TButton
    Left = 8
    Top = 31
    Width = 75
    Height = 25
    Caption = '&Browse'
    TabOrder = 0
    OnClick = btnPathDBClick
  end
  object edtPathDB: TEdit
    Left = 8
    Top = 62
    Width = 585
    Height = 23
    ReadOnly = True
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 203
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 3
    OnChange = ComboBox1Change
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 232
    Width = 624
    Height = 190
    Align = alBottom
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object edtPort: TEdit
    Left = 360
    Top = 33
    Width = 57
    Height = 23
    Alignment = taCenter
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 1
  end
  object edtPathLib: TEdit
    Left = 8
    Top = 148
    Width = 585
    Height = 23
    ReadOnly = True
    TabOrder = 6
  end
  object btnPathLib: TButton
    Left = 8
    Top = 114
    Width = 75
    Height = 25
    Caption = '&Browse'
    TabOrder = 7
    OnClick = btnPathLibClick
  end
  object btnConnect: TButton
    Left = 8
    Top = 182
    Width = 75
    Height = 25
    Caption = '&Connect'
    TabOrder = 8
    OnClick = btnConnectClick
  end
  object OpenDialog1: TOpenDialog
    Left = 560
    Top = 16
  end
  object FDConnection1: TFDConnection
    Left = 336
    Top = 248
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    Left = 560
    Top = 248
  end
  object DataSource1: TDataSource
    Left = 456
    Top = 248
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 200
    Top = 248
  end
end
