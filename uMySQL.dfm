object frmMySQL: TfrmMySQL
  Left = 0
  Top = 0
  Caption = 'MySQL Server config form'
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
  object Label2: TLabel
    Left = 184
    Top = 59
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
    Left = 184
    Top = 3
    Width = 176
    Height = 15
    Caption = 'Select MySQL Server database :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
  object cbbDB: TComboBox
    Left = 184
    Top = 24
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 3
    OnChange = cbbDBChange
  end
  object lbledtUser: TLabeledEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 23
    EditLabel.Width = 57
    EditLabel.Height = 15
    EditLabel.Caption = 'Username'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 0
    Text = ''
  end
  object lbledtPassword: TLabeledEdit
    Left = 8
    Top = 83
    Width = 121
    Height = 23
    EditLabel.Width = 52
    EditLabel.Height = 15
    EditLabel.Caption = 'Password'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
  end
  object btnConnect: TButton
    Left = 8
    Top = 129
    Width = 75
    Height = 25
    Caption = '&Connect'
    TabOrder = 2
    OnClick = btnConnectClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 160
    Width = 624
    Height = 262
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object cbbTables: TComboBox
    Left = 184
    Top = 80
    Width = 145
    Height = 23
    TabOrder = 6
    OnChange = cbbTablesChange
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 432
    Top = 336
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    Left = 216
    Top = 336
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    Left = 536
    Top = 336
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 320
    Top = 336
  end
end
