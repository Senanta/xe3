object fmReportOsv_Acc: TfmReportOsv_Acc
  Left = 0
  Top = 0
  Caption = #1054#1073#1086#1088#1086#1090#1085#1086'-'#1089#1072#1083#1100#1076#1086#1074#1072#1103' '#1087#1086' '#1089#1095#1077#1090#1091
  ClientHeight = 323
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 30
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitWidth = 613
    object bvl1: TBevel
      Left = 188
      Top = 8
      Width = 22
      Height = 8
      Shape = bsBottomLine
    end
    object lbAcc: TLabel
      Left = 352
      Top = 8
      Width = 49
      Height = 13
      Caption = #1055#1086' '#1089#1095#1077#1090#1091':'
    end
    object lblBetween: TLabel
      Left = 8
      Top = 8
      Width = 42
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076':'
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 408
      Top = 5
      Width = 161
      Height = 21
      DynProps = <>
      DataField = ''
      EditButtons = <>
      KeyField = 'acc'
      ListField = 'acc'
      ListSource = DataSource1
      TabOrder = 0
      Visible = True
      OnChange = DBLookupComboboxEh1Change
    end
    object DateEdit1: TDBDateTimeEditEh
      Left = 61
      Top = 5
      Width = 121
      Height = 21
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
      OnChange = DateEdit1Change
    end
    object DateEdit2: TDBDateTimeEditEh
      Left = 216
      Top = 5
      Width = 121
      Height = 21
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
      OnChange = DateEdit1Change
    end
  end
  object pnlMiddle: TPanel
    Left = 0
    Top = 30
    Width = 698
    Height = 263
    Align = alClient
    BevelInner = bvLowered
    Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093'...'
    TabOrder = 1
    ExplicitWidth = 613
    ExplicitHeight = 268
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 694
      Height = 259
      Align = alClient
      DataSource = ds1
      DynProps = <>
      FooterRowCount = 1
      FrozenCols = 2
      HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh]
      HorzScrollBar.ExtraPanel.Visible = True
      SumList.Active = True
      TabOrder = 0
      Visible = False
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'dt'
          Footers = <>
          Title.Caption = #1044#1090
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'kt'
          Footers = <>
          Title.Caption = #1050#1090
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'amount_dt'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1082#1086#1083'-'#1074#1086#1044#1090
          Width = 61
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'summa_dt'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072#1044#1090
          Width = 95
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'amount_kt'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1082#1086#1083'-'#1074#1086#1050#1090
          Width = 61
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'summa_kt'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072#1050#1090
          Width = 95
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Data'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'name_doc'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 85
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Code_Doc'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082'.'
          Width = 63
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Code_Obj'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Width = 72
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 126
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'amount'
          Footers = <>
          Title.Caption = #1082#1086#1083'-'#1074#1086
          Width = 55
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'price'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
          Width = 60
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'price_uchet'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072' '#1091#1095#1077#1090'.'
          Width = 64
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Subj_From'
          Footers = <>
          Title.Caption = #1054#1090' '#1082#1086#1075#1086
          Width = 110
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Subj_To'
          Footers = <>
          Title.Caption = #1050#1086#1084#1091
          Width = 98
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Wh_From'
          Footers = <>
          Title.Caption = #1057#1082#1083#1072#1076' '#1086#1090#1082#1091#1076#1072
          Width = 106
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Wh_To'
          Footers = <>
          Title.Caption = #1057#1082#1083#1072#1076' '#1082#1091#1076#1072
          Width = 98
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Cash_from'
          Footers = <>
          Title.Caption = #1048#1079' '#1082#1072#1089#1089#1099
          Width = 88
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Cash_To'
          Footers = <>
          Title.Caption = #1042' '#1082#1072#1089#1089#1091
          Width = 88
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Account_From'
          Footers = <>
          Title.Caption = #1057#1086' '#1089#1095#1077#1090#1072
          Width = 89
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Account_To'
          Footers = <>
          Title.Caption = #1053#1072' '#1089#1095#1077#1090
          Width = 88
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Comment'
          Footers = <>
          Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 150
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 293
    Width = 698
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitTop = 298
    ExplicitWidth = 613
  end
  object quSaldo: TADOQuery
    CacheSize = 1024
    Connection = DataModuleSql.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 3600
    Parameters = <
      item
        Name = 'acc3'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'acc4'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'acc5'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'acc6'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'acc1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'acc2'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'd1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Select dt,kt,'
      
        '(case dt When :acc3 Then IsNull(Cast(amount as NUMERIC(15,3)),0.' +
        '000) Else 0.000 End) as amount_dt,'
      
        '(case dt When :acc4 Then IsNull(Cast(summa as  NUMERIC(15,3)),0.' +
        '000) Else 0.000 End) as summa_dt,'
      
        '(case kt When :acc5 Then IsNull(Cast(amount as NUMERIC(15,3)),0.' +
        '000) Else 0.000 End) as amount_kt,'
      
        '(case kt When :acc6 Then IsNull(Cast(summa as NUMERIC(15,3)),0.0' +
        '00) Else 0.000 End) as summa_kt,'
      
        'Data,name_doc,Code_Doc,Code_Obj,Name,amount,price,price_uchet,Su' +
        'bj_From,Subj_To,'
      'Wh_From,Wh_To,Cash_from,Cash_To,Account_From,Account_To,Comment'
      ''
      'From dbo.v_Entries'
      'Where (dt=:acc1 or kt=:acc2) and Data Between :d1 and :d2'
      '')
    Left = 416
    Top = 126
  end
  object MemTableEh: TMemTableEh
    Filtered = True
    FetchAllOnOpen = True
    Params = <>
    Left = 448
    Top = 126
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object acc: TMTStringDataFieldEh
          FieldName = 'acc'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object dt_ost1: TMTNumericDataFieldEh
          FieldName = 'dt_ost1'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object kt_ost1: TMTNumericDataFieldEh
          FieldName = 'kt_ost1'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object dt: TMTNumericDataFieldEh
          FieldName = 'dt'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object kt: TMTNumericDataFieldEh
          FieldName = 'kt'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object dt_ost2: TMTNumericDataFieldEh
          FieldName = 'dt_ost2'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object kt_ost2: TMTNumericDataFieldEh
          FieldName = 'kt_ost2'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object ds1: TDataSource
    DataSet = MemTableEh
    Left = 480
    Top = 126
  end
  object quAcc: TADOQuery
    CacheSize = 1024
    Connection = DataModuleSql.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 3600
    Parameters = <
      item
        Name = 'd1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd3'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd4'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd5'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd6'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Select Distinct dt as acc From dbo.v_Entries'
      #9'Union'
      'Select Distinct kt as acc From dbo.v_Entries')
    Left = 528
    Top = 14
  end
  object DataSource1: TDataSource
    DataSet = quAcc
    Left = 528
    Top = 46
  end
  object Timer1: TTimer
    Interval = 300
    OnTimer = Timer1Timer
    Left = 20
    Top = 141
  end
end
