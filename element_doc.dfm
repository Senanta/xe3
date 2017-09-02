inherited FormElementDoc: TFormElementDoc
  Caption = 'FormElementDoc'
  ClientHeight = 323
  ClientWidth = 591
  ExplicitWidth = 599
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelTop: TPanel
    Width = 591
  end
  inherited PanelMiddle: TPanel
    Width = 591
    Height = 261
    inherited PropertyPages: TPageControl
      Width = 587
      Height = 257
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 587
      ExplicitHeight = 257
      inherited TabSheetGeneral: TTabSheet
        object spl1: TSplitter [0]
          Left = 193
          Top = 0
          Height = 229
          Beveled = True
          ExplicitLeft = 328
          ExplicitTop = 96
          ExplicitHeight = 100
        end
        inherited DBVertGridEh1: TDBVertGridEh
          Width = 193
          Height = 229
          Align = alLeft
        end
        object DBGridEhRowSet: TDBGridEh
          Left = 196
          Top = 0
          Width = 383
          Height = 229
          Align = alClient
          DataSource = DataSource2
          DynProps = <>
          TabOrder = 1
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  inherited PanelBottom: TPanel
    Top = 292
    Width = 591
    inherited btClose: TButton
      Left = 514
    end
    inherited btOK: TButton
      Left = 364
    end
    inherited btSave: TButton
      Left = 439
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
end
