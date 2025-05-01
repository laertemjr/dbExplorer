object frmSQLServer: TfrmSQLServer
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 270
    Height = 17
    Caption = 'Select MS-SQL Server database to explorer :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 97
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
    Left = 301
    Top = 24
    Width = 30
    Height = 15
    Caption = 'Port :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 299
    Top = 53
    Width = 32
    Height = 15
    Caption = 'User: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 299
    Top = 82
    Width = 55
    Height = 15
    Caption = 'Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 438
    Top = 24
    Width = 51
    Height = 15
    Caption = 'Servidor:'
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
  object btnConnect: TButton
    Left = 342
    Top = 113
    Width = 75
    Height = 25
    Caption = '&Connect'
    Enabled = False
    TabOrder = 5
    OnClick = btnConnectClick
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 118
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 8
    OnChange = ComboBox1Change
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 147
    Width = 624
    Height = 275
    Align = alBottom
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object edtUser: TEdit
    Left = 360
    Top = 50
    Width = 57
    Height = 23
    Alignment = taCenter
    TabOrder = 1
  end
  object edtPort: TEdit
    Left = 360
    Top = 21
    Width = 57
    Height = 23
    Alignment = taCenter
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 0
  end
  object edtPassword: TEdit
    Left = 360
    Top = 79
    Width = 57
    Height = 23
    Alignment = taCenter
    PasswordChar = '*'
    TabOrder = 2
  end
  object edtServerName: TEdit
    Left = 495
    Top = 21
    Width = 121
    Height = 23
    Alignment = taCenter
    TabOrder = 3
  end
  object btnBrowse: TButton
    Left = 8
    Top = 37
    Width = 75
    Height = 25
    Caption = '&Browse'
    TabOrder = 4
    OnClick = btnBrowseClick
  end
  object edtPath: TEdit
    Left = 8
    Top = 68
    Width = 270
    Height = 23
    ReadOnly = True
    TabOrder = 7
    OnChange = edtPathChange
  end
  object btnDefault: TButton
    Left = 438
    Top = 113
    Width = 75
    Height = 25
    Caption = '&Default'
    TabOrder = 6
    OnClick = btnDefaultClick
  end
  object OpenDialog1: TOpenDialog
    Left = 248
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ZTable1
    Left = 440
    Top = 168
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'timeout=60')
    SQLHourGlass = True
    DisableSavepoints = False
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = ''
    Left = 360
    Top = 168
  end
  object ZTable1: TZTable
    Connection = ZConnection1
    Left = 536
    Top = 168
  end
  object SaveDialog1: TSaveDialog
    Left = 256
    Top = 264
  end
end
