object FormElementList: TFormElementList
  Left = 200
  Top = 117
  Caption = 'MDI ElementList'
  ClientHeight = 288
  ClientWidth = 625
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 30
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object ControlBar1: TControlBar
      Left = 2
      Top = 2
      Width = 621
      Height = 26
      Align = alClient
      AutoSize = True
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 11
        Top = 2
        Width = 78
        Height = 22
        Align = alClient
        AutoSize = True
        ButtonHeight = 21
        ButtonWidth = 56
        Caption = 'ToolBar1'
        ShowCaptions = True
        TabOrder = 0
        object ToolButton3: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton1: TToolButton
          Left = 8
          Top = 0
          AutoSize = True
          Caption = #1044#1077#1081#1089#1090#1074#1080#1103
          Grouped = True
          MenuItem = N1
          Style = tbsTextButton
        end
        object ToolButton2: TToolButton
          Left = 68
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 0
          Style = tbsSeparator
        end
      end
      object ToolBar2: TToolBar
        Left = 102
        Top = 2
        Width = 150
        Height = 22
        Caption = 'ToolBar2'
        Images = MainForm.ImageList1
        TabOrder = 1
        object ToolButton4: TToolButton
          Left = 0
          Top = 0
          Action = ActionAdd
        end
        object ToolButton5: TToolButton
          Left = 23
          Top = 0
          Action = ActionAddCopy
        end
        object ToolButton6: TToolButton
          Left = 46
          Top = 0
          Action = ActionEdit
        end
        object ToolButton7: TToolButton
          Left = 69
          Top = 0
          Action = ActionDelete
        end
      end
    end
  end
  object panelMiddle: TPanel
    Left = 0
    Top = 30
    Width = 625
    Height = 228
    Align = alClient
    BevelInner = bvLowered
    Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093'...'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 621
      Height = 224
      Align = alClient
      DataSource = DataSource1
      DynProps = <>
      HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh]
      HorzScrollBar.ExtraPanel.Visible = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SearchPanel.Enabled = True
      SearchPanel.Location = splHorzScrollBarExtraPanelEh
      STFilter.Local = True
      STFilter.Location = stflInTitleFilterEh
      TabOrder = 0
      Visible = False
      OnDrawColumnCell = DBGridEh1DrawColumnCell
      OnSortMarkingChanged = DBGridEh1SortMarkingChanged
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object panelBottom: TPanel
    Left = 0
    Top = 258
    Width = 625
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 544
    Top = 32
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N2: TMenuItem
        Action = ActionAdd
      end
      object N4: TMenuItem
        Action = ActionAddCopy
      end
      object N3: TMenuItem
        Action = ActionEdit
      end
      object N5: TMenuItem
        Action = ActionDelete
      end
    end
  end
  object ActionList1: TActionList
    Images = MainForm.ImageList1
    Left = 576
    Top = 32
    object ActionAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 26
      OnExecute = ActionAddExecute
    end
    object ActionAddCopy: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077#1084
      ImageIndex = 27
      OnExecute = ActionAddCopyExecute
      OnUpdate = ActionEditUpdate
    end
    object ActionEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 24
      OnExecute = ActionEditExecute
      OnUpdate = ActionEditUpdate
    end
    object ActionDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 28
      OnExecute = ActionDeleteExecute
      OnUpdate = ActionDeleteUpdate
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 512
    Top = 32
  end
  object quList: TADOQuery
    CacheSize = 1024
    Connection = DataModuleSql.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 3600
    Parameters = <>
    Prepared = True
    Left = 416
    Top = 126
  end
  object DataSource1: TDataSource
    DataSet = MemTableEh
    Left = 480
    Top = 126
  end
  object MemTableEh: TMemTableEh
    Filtered = True
    FetchAllOnOpen = True
    Params = <>
    Left = 448
    Top = 126
  end
end
