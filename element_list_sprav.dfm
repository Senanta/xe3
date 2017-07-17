inherited FormElementListSprav: TFormElementListSprav
  Caption = 'FormElementListSprav'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ActionList1: TActionList
    inherited ActionAdd: TAction
      OnExecute = ActionAddCopyEditExecute
    end
    inherited ActionAddCopy: TAction
      OnExecute = ActionAddCopyEditExecute
    end
    inherited ActionEdit: TAction
      OnExecute = ActionAddCopyEditExecute
    end
  end
end
