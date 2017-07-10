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
  object Panel1: TPanel
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
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 264
    Top = 120
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N2: TMenuItem
        Action = ActionAdd
      end
      object N3: TMenuItem
        Action = ActionEdit
      end
      object N4: TMenuItem
        Action = ActionAddCopy
      end
      object N5: TMenuItem
        Action = ActionDelete
      end
    end
  end
  object ActionList1: TActionList
    Images = MainForm.ImageList1
    Left = 296
    Top = 120
    object ActionAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 26
    end
    object ActionAddCopy: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077#1084
      ImageIndex = 27
    end
    object ActionEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 24
    end
    object ActionDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 28
    end
  end
end
