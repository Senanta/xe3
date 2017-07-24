object DataModuleSql: TDataModuleSql
  OldCreateOrder = False
  Height = 305
  Width = 701
  object ADOConnection1: TADOConnection
    CommandTimeout = 0
    ConnectionTimeout = 17
    CursorLocation = clUseServer
    IsolationLevel = ilReadCommitted
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB'
    Left = 35
    Top = 8
  end
  object quTmp: TADOQuery
    CacheSize = 256
    Connection = ADOConnection1
    CursorLocation = clUseServer
    LockType = ltReadOnly
    CommandTimeout = 3600
    Parameters = <>
    Prepared = True
    Left = 96
    Top = 56
  end
  object Ins_Obj: TADOQuery
    Connection = ADOConnection1
    CursorLocation = clUseServer
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Insert Into dbo.Objects (Name) Values (:Name)')
    Left = 208
    Top = 8
  end
  object Upd_Obj: TADOQuery
    Connection = ADOConnection1
    CursorLocation = clUseServer
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
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
    SQL.Strings = (
      'Update dbo.Objects Set Name=:Name '
      'Where id = :id')
    Left = 256
    Top = 8
  end
  object Del_Obj: TADOQuery
    Connection = ADOConnection1
    CursorLocation = clUseServer
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Update dbo.Objects Set IsDeleted = 1'
      'Where id = :id')
    Left = 304
    Top = 8
  end
  object quIdentity: TADOQuery
    Connection = ADOConnection1
    CursorLocation = clUseServer
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT @@IDENTITY AS [IDENTITY]')
    Left = 128
    Top = 8
  end
  object Ins_Subj: TADOQuery
    Connection = ADOConnection1
    CursorLocation = clUseServer
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Insert Into dbo.Subjects (Name) Values (:Name)')
    Left = 208
    Top = 56
  end
  object Upd_Subj: TADOQuery
    Connection = ADOConnection1
    CursorLocation = clUseServer
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Name'
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
    SQL.Strings = (
      'Update dbo.Subjects Set Name=:Name '
      'Where id = :id')
    Left = 256
    Top = 56
  end
  object Del_Subj: TADOQuery
    Connection = ADOConnection1
    CursorLocation = clUseServer
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'id'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Update dbo.Subjects Set IsDeleted = 1'
      'Where id = :id')
    Left = 304
    Top = 56
  end
end
