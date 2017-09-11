inherited FormElementDoc: TFormElementDoc
  Caption = 'FormElementDoc'
  ClientHeight = 376
  ClientWidth = 788
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000080000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000008000
    00FF0000000000000000000000FF000000FF000000FF000000FF000000000000
    00FF000000FF000000FF00000000000000FF000000FF000000FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000008000
    00FF0000000000000000000000FF000000FF000000FF000000FF000000000000
    00FF000000FF000000FF00000000000000FF000000FF000000FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000008000
    00FF0000000000000000000000FF000000FF000000FF000000FF000000000000
    00FF000000FF000000FF00000000000000FF000000FF000000FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000008000
    00FF0000000000000000000000FF000000FF000000FF000000FF000000000000
    00FF000000FF000000FF00000000000000FF000000FF000000FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000008000
    00FF0000000000000000000000FF000000FF000000FF000000FF000000000000
    00FF000000FF000000FF00000000000000FF000000FF000000FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000008000
    00FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF8000
    00FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000FF000000FF000000FF000000FF000000000000
    00FF000000FF000000FF00000000000000FF000000FF000000FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    000061110000FFFF000061110000FFFF000061110000FFFF000061110000FFFF
    000061110000FFFF000000000000FFFF0000E1110000FFFF0000FFFF0000}
  ExplicitWidth = 804
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelTop: TPanel
    Width = 788
    ExplicitWidth = 788
  end
  inherited PanelMiddle: TPanel
    Width = 788
    Height = 314
    ExplicitWidth = 788
    ExplicitHeight = 314
    inherited PropertyPages: TPageControl
      Width = 784
      Height = 310
      ExplicitWidth = 784
      ExplicitHeight = 310
      inherited TabSheetGeneral: TTabSheet
        ExplicitWidth = 776
        ExplicitHeight = 282
        object spl1: TSplitter [0]
          Left = 193
          Top = 0
          Height = 282
          Beveled = True
          ExplicitLeft = 328
          ExplicitTop = 96
          ExplicitHeight = 100
        end
        inherited DBVertGridEh1: TDBVertGridEh
          Width = 193
          Height = 282
          Align = alLeft
        end
        object RowPages: TPageControl
          Left = 196
          Top = 0
          Width = 580
          Height = 282
          ActivePage = TabSheetRows
          Align = alClient
          TabOrder = 1
          Visible = False
          object TabSheetRows: TTabSheet
            Caption = #1057#1090#1088#1086#1082#1080
            object DBGridEhRowSet: TDBGridEh
              Left = 0
              Top = 0
              Width = 572
              Height = 254
              Align = alClient
              DataSource = DataSource2
              DynProps = <>
              FooterRowCount = 1
              HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh, nbRefreshEh]
              HorzScrollBar.ExtraPanel.Visible = True
              IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
              SumList.Active = True
              TabOrder = 0
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
          object TabSheetEntriesF1: TTabSheet
            Caption = #1055#1088#1086#1074#1086#1076#1082#1080' '#1041#1059
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 375
            ExplicitHeight = 201
          end
          object TabSheetEntriesF2: TTabSheet
            Caption = #1055#1088#1086#1074#1086#1076#1082#1080' '#1059#1059
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 375
            ExplicitHeight = 201
            object DBGridEhEntries: TDBGridEh
              Left = 0
              Top = 0
              Width = 572
              Height = 254
              Align = alClient
              DataSource = DataSource3
              DynProps = <>
              FrozenCols = 2
              TabOrder = 0
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
      end
    end
  end
  inherited PanelBottom: TPanel
    Top = 345
    Width = 788
    ExplicitTop = 345
    ExplicitWidth = 788
    inherited btClose: TButton
      Left = 711
      ExplicitLeft = 711
    end
    inherited btOK: TButton
      Left = 561
      ExplicitLeft = 561
    end
    inherited btSave: TButton
      Left = 636
      ExplicitLeft = 636
    end
  end
  inherited quElement: TADOQuery
    Left = 44
    Top = 189
  end
  inherited MemTableEh: TMemTableEh
    Left = 76
    Top = 189
  end
  inherited DataSource1: TDataSource
    Left = 116
    Top = 189
  end
  object quRowSet: TADOQuery
    Connection = DataModuleSql.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 45
    Parameters = <
      item
        Name = 'id_head'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Select * From v_Elements Where id_head = :id_head')
    Left = 108
    Top = 125
  end
  object MemTableEhRowSet: TMemTableEh
    Params = <>
    Left = 142
    Top = 129
  end
  object DataSource2: TDataSource
    DataSet = MemTableEhRowSet
    Left = 182
    Top = 129
  end
  object quEntries: TADOQuery
    Connection = DataModuleSql.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 45
    Parameters = <
      item
        Name = 'id_head'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Select * From v_Entries Where id_head = :id_head')
    Left = 244
    Top = 125
  end
  object MemTableEhEntries: TMemTableEh
    Params = <>
    Left = 278
    Top = 129
  end
  object DataSource3: TDataSource
    DataSet = MemTableEhEntries
    Left = 318
    Top = 129
  end
end
