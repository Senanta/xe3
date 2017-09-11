object fmSetPrice: TfmSetPrice
  Left = 0
  Top = 0
  Caption = 'fmSetPrice'
  ClientHeight = 271
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000080000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000FF00000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000FF00000000000000FF0000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00FF00000000000000FF00000000000000FF000000FF000000FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00FF000000FF000000FF00000000000000FF0000000000000000000000FF0000
    0000000000FF0000000000000000000000000000000000000000000000000000
    00FF00000000000000FF000000FF00000000000000FF00000000000000000000
    0000000000FF000000FF00000000000000000000000000000000000000000000
    00FF00000000000000FF0000000000000000000000FF00000000000000000000
    0000000000FF000000FF000000FF000000000000000000000000000000000000
    0000000000FF00000000000000000000000000000000000000FF000000000000
    0000000000FF00FFFFFF00FFFFFF000000FF0000000000000000000000000000
    0000000000FF00000000000000FF0000000000000000000000FF000000000000
    0000000000FF00FFFFFF00FFFFFF000000FF0000000000000000000000000000
    0000000000FF00000000000000FF0000000000000000000000FF000000000000
    000000000000000000FF00FFFFFF00FFFFFF000000FF00000000000000000000
    0000000000000000000000000000000000FF000000FF00000000000000000000
    000000000000000000FF00FFFFFF00FFFFFF000000FF00000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000FF00FFFFFF00FFFFFF000000FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000FF00FFFFFF00FFFFFF000000FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000FF000000FF000000FF000000FF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000FF6E00FFFF6E00FFFF000000FF0000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000FF000000FF00000000FFFF
    0000DFFF0000D7FF000051FF000016BF00004B9F00005B8F0000BD870000AD87
    0000ADC30000F3C30000FFE10000FFE10000FFF00000FFF00000FFF90000}
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TPanel
    Left = 0
    Top = 240
    Width = 595
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object btClose: TButton
      Left = 518
      Top = 2
      Width = 75
      Height = 27
      Action = ActionClose
      Align = alRight
      TabOrder = 2
    end
    object btOK: TButton
      Left = 368
      Top = 2
      Width = 75
      Height = 27
      Action = ActionOk
      Align = alRight
      TabOrder = 0
    end
    object btSave: TButton
      Left = 443
      Top = 2
      Width = 75
      Height = 27
      Action = ActionSave
      Align = alRight
      TabOrder = 1
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 31
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 136
      Top = 8
      Width = 51
      Height = 13
      Caption = #1058#1080#1087' '#1094#1077#1085#1099':'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object DateEdit1: TDBDateTimeEditEh
      Left = 44
      Top = 5
      Width = 86
      Height = 21
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
      OnChange = DateEdit1Change
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 193
      Top = 5
      Width = 161
      Height = 21
      DynProps = <>
      DataField = ''
      EditButtons = <>
      KeyField = 'id'
      ListField = 'Name'
      ListSource = DataSource2
      TabOrder = 1
      Visible = True
      OnChange = DBLookupComboboxEh1Change
    end
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 31
    Width = 595
    Height = 209
    Align = alClient
    BevelInner = bvLowered
    Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 591
      Height = 205
      Align = alClient
      ColumnDefValues.Title.TitleButton = True
      DataSource = DataSource1
      DynProps = <>
      HorzScrollBar.ExtraPanel.Visible = True
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
      IndicatorParams.RecNoShowStep = 5
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SearchPanel.Enabled = True
      SearchPanel.Location = splHorzScrollBarExtraPanelEh
      SortLocal = True
      TabOrder = 0
      Visible = False
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Code'
          Footers = <>
        end
        item
          ButtonStyle = cbsEllipsis
          CellButtons = <>
          DynProps = <>
          EditButton.Style = ebsEllipsisEh
          EditButton.Visible = True
          EditButton.OnClick = DBGridEh1Columns1EditButtonClick
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Width = 308
          OnEditButtonClick = DBGridEh1Columns1EditButtonClick
        end
        item
          ButtonStyle = cbsDropDown
          CellButtons = <>
          DynProps = <>
          EditButton.Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
            DADAADADADADADADADADD000000000000000A088888888888880D08708708708
            7080A08F08F08F08F080D088888888888880A087087087087080D08F08F08F08
            F080A088888888888880D080000000008880A080FFFFFFF08880D08000000000
            8880A088888888888880DA0000000000000AADADADADADADADAD}
          EditButton.Visible = True
          EditButtons = <>
          FieldName = 'Price'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ActionList1: TActionList
    Images = MainForm.ImageList1
    Left = 544
    Top = 120
    object ActionSave: TAction
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      ImageIndex = 8
      OnExecute = ActionSaveExecute
      OnUpdate = ActionSaveUpdate
    end
    object ActionClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = ActionCloseExecute
    end
    object ActionOk: TAction
      Caption = 'OK'
      OnExecute = ActionOkExecute
    end
  end
  object Timer1: TTimer
    Interval = 300
    OnTimer = Timer1Timer
    Left = 20
    Top = 141
  end
  object DataSource1: TDataSource
    DataSet = MemTableEh
    Left = 180
    Top = 93
  end
  object MemTableEh: TMemTableEh
    Params = <>
    AfterInsert = MemTableEhAfterInsert
    AfterEdit = MemTableEhAfterEdit
    Left = 140
    Top = 93
  end
  object quPrices: TADOQuery
    Connection = DataModuleSql.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 45
    Parameters = <
      item
        Name = 'd'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'id_type'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'id_subj'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select * From dbo.v_SetPrice '
      ' Where data = :d and id_type = :id_type'
      'and id_subj = :id_subj')
    Left = 108
    Top = 93
  end
  object quPriceTypes: TADOQuery
    Connection = DataModuleSql.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 45
    Parameters = <
      item
        Name = 'd'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'id_type'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'id_subj'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select id,Name From dbo.PriceTypes Order by Name')
    Left = 236
    Top = 37
  end
  object DataSource2: TDataSource
    DataSet = quPriceTypes
    Left = 272
    Top = 39
  end
  object quDel: TADOQuery
    Connection = DataModuleSql.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 45
    Parameters = <
      item
        Name = 'd'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'id_type'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'id_subj'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Delete From dbo.Prices'
      ' Where data = :d and id_type = :id_type'
      'and id_subj = :id_subj')
    Left = 284
    Top = 101
  end
  object quIns: TADOQuery
    Connection = DataModuleSql.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 45
    Parameters = <
      item
        Name = 'id_obj'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'id_type'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'data'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'id_subj'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'price'
        DataType = ftFloat
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Insert Into dbo.Prices (id_obj, id_type, data, id_subj, price)'
      'Values(:id_obj, :id_type, :data, :id_subj, :price)')
    Left = 316
    Top = 101
  end
end
