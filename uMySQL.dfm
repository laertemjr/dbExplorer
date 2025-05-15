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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 136
    Height = 15
    Caption = 'Select ODBC connection'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 121
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
    Left = 8
    Top = 65
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
  object cbbTables: TComboBox
    Left = 8
    Top = 142
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 5
    OnChange = cbbTablesChange
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 171
    Width = 624
    Height = 251
    Align = alBottom
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object cbbDB: TComboBox
    Left = 8
    Top = 86
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 4
    OnChange = cbbDBChange
  end
  object lbledtUser: TLabeledEdit
    Left = 304
    Top = 29
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
    Enabled = False
    TabOrder = 1
    Text = ''
  end
  object lbledtPassword: TLabeledEdit
    Left = 304
    Top = 78
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
    Enabled = False
    PasswordChar = '*'
    TabOrder = 2
    Text = ''
  end
  object btnConnect: TButton
    Left = 304
    Top = 117
    Width = 75
    Height = 25
    Caption = '&Connect'
    Enabled = False
    TabOrder = 3
    OnClick = btnConnectClick
  end
  object cbbDSN: TComboBox
    Left = 8
    Top = 29
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbbDSNChange
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 256
    Top = 344
  end
  object ADOConnection1: TADOConnection
    Left = 48
    Top = 344
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    Left = 152
    Top = 344
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 360
    Top = 344
  end
end
