object fmDictionary: TfmDictionary
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1057#1083#1086#1074#1072#1088#1100' '#1076#1072#1085#1085#1099#1093'(dbFields)'
  ClientHeight = 348
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 31
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 31
    Width = 702
    Height = 286
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object DBGridEh: TDBGridEh
      Left = 2
      Top = 2
      Width = 698
      Height = 282
      Align = alClient
      DataSource = DataSource1
      DynProps = <>
      HorzScrollBar.ExtraPanel.Visible = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      STFilter.Local = True
      STFilter.Location = stflInTitleFilterEh
      STFilter.Visible = True
      TabOrder = 0
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'TableName'
          Footers = <>
          Title.TitleButton = True
          Width = 78
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FieldName'
          Footers = <>
          STFilter.Visible = False
          Width = 83
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Category'
          Footers = <>
          STFilter.Visible = False
          Width = 54
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DisplayLabel'
          Footers = <>
          STFilter.Visible = False
          Width = 73
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DisplayWidth'
          Footers = <>
          STFilter.Visible = False
          Width = 68
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DisplayFormat'
          Footers = <>
          STFilter.Visible = False
          Width = 91
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EditMask'
          Footers = <>
          STFilter.Visible = False
          Width = 53
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Index'
          Footers = <>
          STFilter.Visible = False
          Width = 32
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Readonly'
          Footers = <>
          STFilter.Visible = False
          Width = 51
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Required'
          Footers = <>
          STFilter.Visible = False
          Width = 48
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Visible'
          Footers = <>
          STFilter.Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Filter'
          Footers = <>
          STFilter.Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Sort'
          Footers = <>
          STFilter.Visible = False
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 317
    Width = 702
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object btOK: TButton
      Left = 625
      Top = 2
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btOKClick
    end
  end
  object ADOConnectionProviderEh: TADOConnectionProviderEh
    Connection = DataModuleSql.ADOConnection1
    InlineConnection.Provider = 'SQLOLEDB.1'
    ServerType = 'MSSQL'
    Left = 24
    Top = 151
  end
  object ADODataDriverEh: TADODataDriverEh
    ConnectionProvider = ADOConnectionProviderEh
    DynaSQLParams.SkipUnchangedFields = True
    DynaSQLParams.Options = []
    MacroVars.Macros = <>
    SpecParams.Strings = (
      'AUTO_INCREMENT_FIELD=id')
    SelectCommand.CommandText.Strings = (
      'Select * From dbFields')
    SelectCommand.Parameters = <>
    UpdateCommand.CommandText.Strings = (
      'update dbFields'
      'set'
      '  TableName = :TableName,'
      '  FieldName = :FieldName,'
      '  Category = :Category,'
      '  DisplayLabel = :DisplayLabel,'
      '  DisplayWidth = :DisplayWidth,'
      'DisplayFormat =:DisplayFormat,'
      '  EditMask = :EditMask,'
      '  [Index] = :Index,'
      '  Readonly = :Readonly,'
      '  Required = :Required,'
      '  Visible = :Visible,'
      '  Filter = :Filter,'
      '  Sort = :Sort'
      'where'
      '  id = :OLD_id')
    UpdateCommand.Parameters = <
      item
        Name = 'TableName'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'FieldName'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'Category'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end
      item
        Name = 'DisplayLabel'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'DisplayWidth'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DisplayFormat'
        Size = -1
        Value = Null
      end
      item
        Name = 'EditMask'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'Index'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Readonly'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'Required'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'Visible'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'Filter'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'Sort'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'OLD_id'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    InsertCommand.CommandText.Strings = (
      'insert into dbFields'
      
        '  (TableName, FieldName, Category, DisplayLabel, DisplayWidth, D' +
        'isplayFormat, EditMask, '
      '   [Index], Readonly, Required, Visible, Filter, Sort)'
      'values'
      
        '  (:TableName, :FieldName, :Category, :DisplayLabel, :DisplayWid' +
        'th, :DisplayFormat,:EditMask, '
      '   :Index, :Readonly, :Required, :Visible, :Filter, :Sort)')
    InsertCommand.Parameters = <
      item
        Name = 'TableName'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'FieldName'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Category'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DisplayLabel'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DisplayWidth'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'DisplayFormat'
        Size = -1
        Value = Null
      end
      item
        Name = 'EditMask'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Index'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Readonly'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'Required'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'Visible'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'Filter'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'Sort'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end>
    DeleteCommand.CommandText.Strings = (
      'delete from dbFields'
      'where'
      '  id = :OLD_id')
    DeleteCommand.Parameters = <
      item
        Name = 'OLD_id'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    GetrecCommand.Parameters = <>
    Left = 24
    Top = 119
  end
  object MemTableEh1: TMemTableEh
    Filtered = True
    FetchAllOnOpen = True
    Params = <>
    DataDriver = ADODataDriverEh
    Left = 24
    Top = 87
  end
  object DataSource1: TDataSource
    DataSet = MemTableEh1
    Left = 56
    Top = 87
  end
end
