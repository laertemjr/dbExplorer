object frmAccess: TfrmAccess
  Left = 0
  Top = 0
  Caption = 'Microsoft Access config form'
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
    Width = 243
    Height = 17
    Caption = 'Select MS-Access database to explorer :'
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
  object Button1: TButton
    Left = 8
    Top = 31
    Width = 75
    Height = 25
    Caption = '&Browse'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 62
    Width = 585
    Height = 23
    ReadOnly = True
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 118
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 2
    OnChange = ComboBox1Change
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 147
    Width = 624
    Height = 275
    Align = alBottom
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object OpenDialog1: TOpenDialog
    Left = 560
    Top = 16
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    Left = 560
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 464
    Top = 96
  end
  object FDConnection1: TFDConnection
    Left = 464
    Top = 16
  end
  object FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink
    Left = 320
    Top = 8
  end
end
