object frmMSSQL: TfrmMSSQL
  Left = 0
  Top = 0
  Caption = 'MS-SQL Server config form'
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
    Left = 223
    Top = 58
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
    Left = 223
    Top = 8
    Width = 159
    Height = 15
    Caption = 'Select SQL Server database :'
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
    Left = 223
    Top = 78
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 4
    OnChange = cbbTablesChange
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 148
    Width = 624
    Height = 274
    Align = alBottom
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object cbbDB: TComboBox
    Left = 223
    Top = 29
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 3
    OnChange = cbbDBChange
  end
  object lbledtUser: TLabeledEdit
    Left = 16
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
    TabOrder = 0
    Text = ''
  end
  object lbledtPassword: TLabeledEdit
    Left = 16
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
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
  end
  object btnConnect: TButton
    Left = 16
    Top = 117
    Width = 75
    Height = 25
    Caption = '&Connect'
    TabOrder = 2
    OnClick = btnConnectClick
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 256
    Top = 344
  end
  object ADOConnection1: TADOConnection
    Provider = 'SQLOLEDB.1'
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
