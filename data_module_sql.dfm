object DataModuleSql: TDataModuleSql
  OldCreateOrder = False
  Height = 194
  Width = 267
  object ADOConnection1: TADOConnection
    CommandTimeout = 0
    ConnectionString = 'ttt'
    ConnectionTimeout = 180
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
end
