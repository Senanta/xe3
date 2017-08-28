object fmImport: TfmImport
  Left = 0
  Top = 0
  Caption = #1048#1084#1087#1086#1088#1090' dBaseIII'
  ClientHeight = 365
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 31
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 5
      Top = 5
      Width = 116
      Height = 22
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333330000003333333333333333330000003333333333333333330000003800
        000000000003330000003007B7B7B7B7B7B03300000030F07B7B7B7B7B703300
        000030B0B7B7B7B7B7B70300000030FB0B7B7B7B7B7B0300000030BF07B7B7B7
        B7B7B000000030FBF000007B7B7B7000000030BFBFBFBF0000000300000030FB
        FBFBFBFBFB033300000030BFBFBFBFBFBF033300000030FBFBF0000000333300
        0000330000033333333333000000333333333333333333000000333333333333
        333333000000333333333333333333000000}
      OnClick = SpeedButton1Click
    end
    object lbSuccess: TLabel
      Left = 168
      Top = 12
      Width = 89
      Height = 13
      Caption = #1048#1084#1087#1086#1088#1090' '#1079#1072#1074#1077#1088#1096#1077#1085
      Visible = False
    end
    object LabelTime: TLabel
      Left = 312
      Top = 12
      Width = 46
      Height = 13
      Caption = '0.00 '#1089#1077#1082'.'
      Visible = False
    end
    object SpeedButtonSuccess: TSpeedButton
      Left = 267
      Top = 5
      Width = 39
      Height = 22
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000016000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888008888888888888888888888008888888777788888888888008888
        8877777788888888880088888744444778888888880088888422224477888888
        88008888A2222224477888888800888A22222222447788888800888A222AAA22
        244788888800888A22477AA2224778888800888A224788AA224477888800888A
        2248888AA22447788800888AAA288888AA22447788008888888888888AA22447
        780088888888888888AA22447800888888888888888AA2247800888888888888
        8888AA24880088888888888888888AA288008888888888888888888888008888
        88888888888888888800}
      Visible = False
    end
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 31
    Width = 736
    Height = 303
    Align = alClient
    BevelInner = bvLowered
    Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077'...'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 732
      Height = 299
      Align = alClient
      DataSource = DataSource1
      DynProps = <>
      HorzScrollBar.ExtraPanel.Visible = True
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
      TabOrder = 0
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Memo1: TMemo
      Left = 344
      Top = 160
      Width = 137
      Height = 33
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
      Visible = False
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 334
    Width = 736
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object btOK: TButton
      Left = 584
      Top = 2
      Width = 75
      Height = 27
      Align = alRight
      Caption = #1048#1084#1087#1086#1088#1090
      TabOrder = 0
      OnClick = btOKClick
    end
    object btSave: TButton
      Left = 659
      Top = 2
      Width = 75
      Height = 27
      Align = alRight
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = btSaveClick
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 8
      Width = 570
      Height = 17
      TabOrder = 2
      Visible = False
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'dBase files (*.dbf)|*.dbf'
    Left = 48
    Top = 224
  end
  object Dbf1: TDbf
    Exclusive = True
    IndexDefs = <>
    TableLevel = 3
    Left = 80
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = Dbf1
    Left = 112
    Top = 224
  end
  object quCreate: TADOQuery
    Connection = DataModuleSql.conImport
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'id_subj'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Insert Into dbo.Warehouses (id_subj, Name) '
      'Values (:id_subj, Left(:Name,150))')
    Left = 208
    Top = 104
  end
  object quInsert: TADOQuery
    Connection = DataModuleSql.conImport
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    Left = 240
    Top = 104
  end
  object quDrop: TADOQuery
    Connection = DataModuleSql.conImport
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'id_subj'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Insert Into dbo.Warehouses (id_subj, Name) '
      'Values (:id_subj, Left(:Name,150))')
    Left = 208
    Top = 136
  end
end
