inherited FormElementListDoc: TFormElementListDoc
  Caption = 'FormElementListDoc'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelTop: TPanel
    inherited ControlBar1: TControlBar
      inherited ToolBar2: TToolBar
        Width = 411
        ExplicitWidth = 411
        object ToolButton8: TToolButton
          Left = 92
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 29
          Style = tbsSeparator
        end
        object DateEdit1: TDBDateTimeEditEh
          Left = 100
          Top = 0
          Width = 121
          Height = 22
          DynProps = <>
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 0
          Visible = True
          OnChange = DateEdit1Change
        end
        object DateEdit2: TDBDateTimeEditEh
          Left = 221
          Top = 0
          Width = 121
          Height = 22
          DynProps = <>
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 1
          Visible = True
          OnChange = DateEdit1Change
        end
      end
    end
  end
  inherited panelMiddle: TPanel
    inherited DBGridEh1: TDBGridEh
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
      IndicatorParams.RecNoShowStep = 10
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    end
  end
  inherited panelBottom: TPanel
    object lbTime: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 13
      Caption = 'lbTime'
      Visible = False
    end
  end
end
