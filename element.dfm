object FormElement: TFormElement
  Left = 197
  Top = 117
  Caption = 'MDI Element'
  ClientHeight = 314
  ClientWidth = 322
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 31
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 31
    Width = 322
    Height = 252
    Align = alClient
    BevelInner = bvLowered
    Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093'...'
    TabOrder = 1
    object PropertyPages: TPageControl
      Left = 8
      Top = 6
      Width = 305
      Height = 240
      ActivePage = TabSheetGeneral
      TabOrder = 0
      Visible = False
      object TabSheetGeneral: TTabSheet
        Caption = #1054#1073#1097#1080#1077
        object DBVertGridEh1: TDBVertGridEh
          Left = 3
          Top = 3
          Width = 231
          Height = 174
          AllowedSelections = []
          RowCategories.CategoryProps = <>
          PrintService.ColorSchema = pcsFullColorEh
          DataSource = DataSource1
          DrawGraphicData = True
          DrawMemoText = True
          TabOrder = 0
        end
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 283
    Width = 322
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object btClose: TButton
      Left = 245
      Top = 2
      Width = 75
      Height = 27
      Align = alRight
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
    end
    object btOK: TButton
      Left = 95
      Top = 2
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'OK'
      TabOrder = 0
    end
    object btSave: TButton
      Left = 170
      Top = 2
      Width = 75
      Height = 27
      Action = ActionSave
      Align = alRight
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Images = MainForm.ImageList1
    Left = 208
    Top = 184
    object ActionSave: TAction
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      ImageIndex = 8
      OnExecute = ActionSaveExecute
      OnUpdate = ActionSaveUpdate
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 20
    Top = 141
  end
  object quElement: TADOQuery
    CacheSize = 256
    Connection = DataModuleSql.ADOConnection1
    CursorLocation = clUseServer
    LockType = ltReadOnly
    CommandTimeout = 3600
    Parameters = <
      item
        Name = 'ID'
        DataType = ftLargeint
        Value = '-1'
      end>
    Left = 108
    Top = 93
  end
  object MemTableEh: TMemTableEh
    Params = <>
    AfterEdit = MemTableEhAfterEdit
    Left = 140
    Top = 93
  end
  object DataSource1: TDataSource
    DataSet = MemTableEh
    Left = 180
    Top = 93
  end
end
