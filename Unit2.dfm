object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 648
  Width = 1025
  object Connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=12345;Persist Security Info=True;Use' +
      'r ID=root;Extended Properties="DRIVER={MySQL ODBC 8.0 Unicode Dr' +
      'iver};UID=root;PWD=12345;SERVER=localhost;DATABASE=carbigraptor;' +
      'PORT=3306;COLUMN_SIZE_S32=1;"'
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object Q_Cars: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    AfterScroll = Q_CarsAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CarTableForUser ORDER BY CarDate ASC')
    Left = 32
    Top = 64
  end
  object DS_Cars: TDataSource
    AutoEdit = False
    DataSet = Q_Cars
    Left = 112
    Top = 64
  end
  object Q_SoldCars: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    AfterScroll = Q_SoldCarsAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SoldCarTableForUser ORDER BY CarDate ASC')
    Left = 32
    Top = 120
  end
  object Q_Sellers: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    AfterScroll = Q_SellersAfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT UserID, UserName, UserPhone, UserImage FROM user WHERE Us' +
        'erType = 1  ORDER BY UserName ASC')
    Left = 32
    Top = 176
  end
  object DS_SoldCars: TDataSource
    AutoEdit = False
    DataSet = Q_SoldCars
    Left = 112
    Top = 120
  end
  object DS_Sellers: TDataSource
    AutoEdit = False
    DataSet = Q_Sellers
    Left = 112
    Top = 176
  end
  object Q_Body: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT CarBodyName FROM carbody')
    Left = 272
    Top = 176
  end
  object Q_Engine: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT EngineTypeName FROM enginetype')
    Left = 272
    Top = 232
  end
  object Q_Act: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM gear')
    Left = 32
    Top = 400
  end
  object Q_SumSoldCars: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '
      'SUM(1), '
      'soldcar.SoldCarDate'
      'FROM soldcar'
      'GROUP BY soldcar.SoldCarDate')
    Left = 32
    Top = 344
  end
  object Q_SellersBlock: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '
      'SUM(1), '
      'address.AdressName'
      'FROM seller, address'
      'WHERE seller.AddressID = address.AddressID'
      'GROUP BY seller.AddressID')
    Left = 32
    Top = 512
  end
  object Q_Brand: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT BrandName FROM CarTechBrand')
    Left = 272
    Top = 8
  end
  object Q_Model: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ModelName FROM CarTechModel')
    Left = 272
    Top = 64
  end
  object Q_Gear: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT GearType FROM Gear')
    Left = 272
    Top = 120
  end
  object Q_Drive: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT DriveType FROM Drive')
    Left = 272
    Top = 288
  end
  object Q_CarsUser: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    AfterScroll = Q_CarsUserAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CarTableForUser ORDER BY CarDate ASC')
    Left = 32
    Top = 232
  end
  object DS_CarsUser: TDataSource
    DataSet = Q_CarsUser
    Left = 112
    Top = 232
  end
  object Q_Chat: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    AfterScroll = Q_ChatAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Chat WHERE Getter = 1')
    Left = 32
    Top = 288
  end
  object DS_Chat: TDataSource
    DataSet = Q_Chat
    Left = 112
    Top = 288
  end
end
