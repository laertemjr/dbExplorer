object frmDBexplorer: TfrmDBexplorer
  Left = 0
  Top = 0
  Caption = 'dbExplorer - Database Explorer'
  ClientHeight = 121
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 232
    Height = 20
    Caption = 'Select database type to explorer :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 102
    Width = 334
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 640
      end>
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 50
    Width = 161
    Height = 23
    Style = csDropDownList
    TabOrder = 0
    OnChange = ComboBox1Change
    Items.Strings = (
      'Firebird Server'
      'Microsoft Access'
      'Microsoft SQL Server'
      'MySQL Server'
      'postgreSQL Server'
      'SQLite')
  end
end
