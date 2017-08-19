object DataModuleSql: TDataModuleSql
  OldCreateOrder = False
  Height = 305
  Width = 701
  object ADOConnection1: TADOConnection
    CommandTimeout = 0
    ConnectionTimeout = 17
    IsolationLevel = ilReadCommitted
    LoginPrompt = False
    Provider = 'SQLOLEDB'
    OnExecuteComplete = ADOConnection1ExecuteComplete
    Left = 35
    Top = 8
  end
  object quTmp: TADOQuery
    CacheSize = 256
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 3600
    ParamCheck = False
    Parameters = <>
    Left = 128
    Top = 56
  end
  object Ins_Obj: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Insert Into dbo.Objects (Name) Values (:Name)')
    Left = 208
    Top = 8
  end
  object Upd_Obj: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Code'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update dbo.Objects Set Name=:Name, Code=:Code '
      'Where id = :id')
    Left = 256
    Top = 8
  end
  object Del_Obj: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'IsDeleted'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update dbo.Objects Set IsDeleted = :IsDeleted'
      'Where id = :id')
    Left = 304
    Top = 8
  end
  object quIdentity: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT @@IDENTITY AS [IDENTITY]')
    Left = 128
    Top = 8
  end
  object Ins_Subj: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Insert Into dbo.Subjects (Name) Values (:Name)')
    Left = 208
    Top = 56
  end
  object Upd_Subj: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Code'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update dbo.Subjects Set Name=:Name,Code=:Code '
      'Where id = :id')
    Left = 256
    Top = 56
  end
  object Del_Subj: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'IsDeleted'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update dbo.Subjects Set IsDeleted = :IsDeleted'
      'Where id = :id')
    Left = 304
    Top = 56
  end
  object Ins_Wh: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'id_subj'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Insert Into dbo.Warehouses (id_subj, Name) '
      'Values (:id_subj, Left(:Name,150))')
    Left = 208
    Top = 104
  end
  object Upd_Wh: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Code'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update dbo.Warehouses Set Name=Left(:Name,150),Code=:Code '
      'Where id = :id')
    Left = 256
    Top = 104
  end
  object Del_Wh: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'IsDeleted'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update dbo.Warehouses Set IsDeleted = :IsDeleted'
      'Where id = :id')
    Left = 304
    Top = 104
  end
  object Ins_Agr: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'id_subj'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Insert Into dbo.Agreements (id_subj, Name) '
      'Values (:id_subj, Left(:Name,175))')
    Left = 208
    Top = 152
  end
  object Upd_Agr: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Code'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update dbo.Agreements Set Name=Left(:Name,175),Code=:Code '
      'Where id = :id')
    Left = 256
    Top = 152
  end
  object Del_Agr: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'IsDeleted'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update dbo.Agreements Set IsDeleted = :IsDeleted'
      'Where id = :id')
    Left = 304
    Top = 152
  end
  object conLog: TADOConnection
    CommandTimeout = 0
    ConnectionTimeout = 17
    IsolationLevel = ilReadCommitted
    LoginPrompt = False
    Provider = 'SQLOLEDB'
    Left = 35
    Top = 56
  end
  object Ins_Log: TADOQuery
    Connection = conLog
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'CommandText'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Insert Into dbo.dbLog (CommandText) Values (:CommandText)')
    Left = 72
    Top = 56
  end
  object ADOCommand1: TADOCommand
    Parameters = <>
    Left = 408
    Top = 96
  end
  object quUpdate_fldCode: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    ExecuteOptions = [eoExecuteNoRecords]
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Code'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update dbo.Objects Set Code=:Code'
      'Where id=:id')
    Left = 128
    Top = 112
  end
  object conImport: TADOConnection
    CommandTimeout = 0
    ConnectionTimeout = 17
    IsolationLevel = ilReadCommitted
    LoginPrompt = False
    Provider = 'SQLOLEDB'
    Left = 35
    Top = 104
  end
end
