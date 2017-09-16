object fmReport_Osv: TfmReport_Osv
  Left = 0
  Top = 0
  Caption = #1054#1073#1086#1088#1086#1090#1085#1086'-'#1089#1072#1083#1100#1076#1086#1074#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
  ClientHeight = 281
  ClientWidth = 534
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
    0000800000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
    00FF000000FF000000FF000000FF000000FF000000FF00000000000000000000
    0000800000FF00FFFFFF808000FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
    FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000FF00000000000000000000
    0000800000FFFFFFFFFF808000FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFF
    FFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF000000FF00000000000000000000
    0000800000FF808000FF808000FF808000FFFFFFFFFF808000FFFFFFFFFF8080
    00FFFFFFFFFF808000FFFFFFFFFF808000FF000000FF00000000000000000000
    0000800000FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFF
    FFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF000000FF00000000000000000000
    0000800000FF00FFFFFF808000FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
    FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000FF00000000000000000000
    0000800000FFFFFFFFFF808000FFFFFFFFFF808000FFFFFFFFFF808000FFFFFF
    FFFF808000FFFFFFFFFF808000FFFFFFFFFF000000FF00000000000000000000
    0000800000FF00FFFFFF808000FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
    FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000FF00000000000000000000
    0000800000FFFFFFFFFF808000FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFF
    FFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF000000FF00000000000000000000
    0000800000FF808000FFFFFFFFFF808000FFFFFFFFFF808000FFFFFFFFFF8080
    00FFFFFFFFFF808000FFFFFFFFFF808000FF000000FF00000000000000000000
    0000800000FFFFFFFFFF808000FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFF
    FFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF000000FF00000000000000000000
    0000800000FF00FFFFFF808000FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
    FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000FF00000000000000000000
    0000800000FFFFFFFFFF808000FFFFFFFFFF808000FFFFFFFFFF808000FFFFFF
    FFFF808000FFFFFFFFFF808000FFFFFFFFFF000000FF00000000000000000000
    0000800000FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
    FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000FF00000000000000000000
    0000800000FF808080FF808080FF808080FF808080FF808080FF808080FF8080
    80FF808080FF808080FF808080FF808080FF000000FF0000000000000000FFFF
    0000800300008003000080030000800300008003000080030000800300008003
    000080030000800300008003000080030000800300008003000080030000}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 30
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object lblBetween: TLabel
      Left = 8
      Top = 8
      Width = 42
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076':'
    end
    object bvl1: TBevel
      Left = 188
      Top = 8
      Width = 22
      Height = 8
      Shape = bsBottomLine
    end
    object DateEdit1: TDBDateTimeEditEh
      Left = 61
      Top = 5
      Width = 121
      Height = 21
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
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
      TabOrder = 1
      Visible = True
    end
  end
  object panelMiddle: TPanel
    Left = 0
    Top = 30
    Width = 534
    Height = 221
    Align = alClient
    BevelInner = bvLowered
    Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093'...'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 530
      Height = 217
      Align = alClient
      DataSource = DataSource1
      DynProps = <>
      FooterRowCount = 1
      FrozenCols = 1
      EmptyDataInfo.Active = True
      PopupMenu = pm1
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Visible = False
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'acc'
          Footer.Value = #1048#1090#1086#1075#1086':'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #1057#1095#1077#1090
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'dt_ost1'
          Footer.DisplayFormat = ',#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1085#1072#1095#1072#1083#1086'|'#1044#1077#1073#1077#1090
          Width = 110
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'kt_ost1'
          Footer.DisplayFormat = ',#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1085#1072#1095#1072#1083#1086'|'#1050#1088#1077#1076#1080#1090
          Width = 110
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'dt'
          Footer.DisplayFormat = ',#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1054#1073#1086#1088#1086#1090#1099'|'#1044#1077#1073#1077#1090
          Width = 110
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'kt'
          Footer.DisplayFormat = ',#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1054#1073#1086#1088#1086#1090#1099'|'#1050#1088#1077#1076#1080#1090
          Width = 110
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'dt_ost2'
          Footer.DisplayFormat = ',#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1086#1085#1077#1094'|'#1044#1077#1073#1077#1090
          Width = 110
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'kt_ost2'
          Footer.DisplayFormat = ',#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1086#1085#1077#1094'|'#1050#1088#1077#1076#1080#1090
          Width = 110
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object panelBottom: TPanel
    Left = 0
    Top = 251
    Width = 534
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object lbTime: TLabel
      Left = 8
      Top = 6
      Width = 30
      Height = 13
      Caption = 'lbTime'
      Visible = False
    end
  end
  object quSaldo: TADOQuery
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
      
        'Select acc.acc, Cast(IsNull(dt1.summa_dt,0.00)-IsNull(kt1.summa_' +
        'kt,0.00) as NUMERIC(15,3)) as dt_ost1,'
      '    Cast(0.00 as NUMERIC(15,3)) as kt_ost1,'
      
        #9#9'IsNull(dt.summa_dt,0.00) as dt, IsNull(kt.summa_kt,0.00) as kt' +
        ','
      
        #9#9' Cast((IsNull(dt1.summa_dt,0.00)-IsNull(kt1.summa_kt,0.00))+(I' +
        'sNull(dt.summa_dt,0.00)'
      
        '     - IsNull(kt.summa_kt,0.00)) as NUMERIC(15,3)) as dt_ost2,Ca' +
        'st(0.00 as NUMERIC(15,3)) as kt_ost2 From'
      '(Select Distinct dt as acc From dbo.v_Entries'
      #9'Union'
      'Select Distinct kt as acc From dbo.v_Entries)  as acc'
      '                           '
      #9#9#9#9#9#9#9'LEFT OUTER JOIN'
      '                          (SELECT     dt, SUM(summa) AS summa_dt'
      '                            FROM          dbo.v_Entries'
      #9#9#9#9#9#9#9#9'Where Data Between :d1 and :d2'
      
        '                            GROUP BY dt) AS dt ON acc.acc = dt.d' +
        't'
      '                             LEFT OUTER JOIN'
      '                          (SELECT     kt, SUM(summa) AS summa_kt'
      '                            FROM          dbo.v_Entries'
      #9#9#9#9#9#9#9#9'Where Data Between :d3 and :d4'
      
        '                            GROUP BY kt) AS kt ON acc.acc = kt.k' +
        't'
      '                            '
      '                           '#9'LEFT OUTER JOIN'
      '                          (SELECT     dt, SUM(summa) AS summa_dt'
      '                            FROM          dbo.v_Entries'
      #9#9#9#9#9#9#9#9'Where Data < :d5'
      
        '                            GROUP BY dt) AS dt1 ON acc.acc = dt1' +
        '.dt'
      '                            LEFT OUTER JOIN'
      '                          (SELECT     kt, SUM(summa) AS summa_kt'
      '                            FROM          dbo.v_Entries'
      #9#9#9#9#9#9#9#9'Where Data < :d6'
      
        '                            GROUP BY kt) AS kt1 ON acc.acc = kt1' +
        '.kt'
      'Order by acc.acc')
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
  object DataSource1: TDataSource
    DataSet = MemTableEh
    Left = 480
    Top = 126
  end
  object Timer1: TTimer
    Interval = 300
    OnTimer = Timer1Timer
    Left = 20
    Top = 141
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 216
    Top = 150
    object N1: TMenuItem
      Caption = #1054#1073#1086#1088#1086#1090#1085#1086'-'#1089#1072#1083#1100#1076#1086#1074#1072#1103' '#1087#1086' '#1089#1095#1077#1090#1091'...'
      OnClick = N1Click
    end
  end
end
