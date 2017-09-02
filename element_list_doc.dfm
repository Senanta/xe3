inherited FormElementListDoc: TFormElementListDoc
  Caption = 'FormElementListDoc'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelTop: TPanel
    inherited ControlBar1: TControlBar
      inherited ToolBar2: TToolBar
        Width = 315
        ExplicitWidth = 315
        object ToolButton8: TToolButton
          Left = 92
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 29
          Style = tbsSeparator
        end
        object DateEdit1: TDateEdit
          Left = 100
          Top = 0
          Width = 90
          Height = 22
          NumGlyphs = 2
          TabOrder = 0
          OnAcceptDate = DateEdit1AcceptDate
        end
        object DateEdit2: TDateEdit
          Left = 190
          Top = 0
          Width = 90
          Height = 22
          NumGlyphs = 2
          TabOrder = 1
          OnAcceptDate = DateEdit2AcceptDate
        end
      end
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
