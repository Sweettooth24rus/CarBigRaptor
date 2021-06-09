object Form3: TForm3
  Left = 0
  Top = 0
  Caption = #1055#1072#1085#1077#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
  ClientHeight = 726
  ClientWidth = 1370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 1353
    Height = 710
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1052#1072#1096#1080#1085#1099
      object Label1: TLabel
        Left = 3
        Top = 370
        Width = 56
        Height = 16
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object Label2: TLabel
        Left = 130
        Top = 370
        Width = 33
        Height = 16
        Caption = #1050#1091#1079#1086#1074
      end
      object Label3: TLabel
        Left = 281
        Top = 370
        Width = 62
        Height = 16
        Caption = #1044#1074#1080#1075#1072#1090#1077#1083#1100
      end
      object Label4: TLabel
        Left = 432
        Top = 370
        Width = 38
        Height = 16
        Caption = #1054#1073#1098#1105#1084
      end
      object Label5: TLabel
        Left = 559
        Top = 370
        Width = 61
        Height = 16
        Caption = #1052#1086#1097#1085#1086#1089#1090#1100
      end
      object Label6: TLabel
        Left = 3
        Top = 433
        Width = 101
        Height = 16
        Caption = #1050#1086#1088#1086#1073#1082#1072' '#1087#1077#1088#1077#1076#1072#1095
      end
      object Label7: TLabel
        Left = 197
        Top = 433
        Width = 43
        Height = 16
        Caption = #1055#1088#1080#1074#1086#1076
      end
      object Label8: TLabel
        Left = 388
        Top = 433
        Width = 57
        Height = 16
        Caption = #1055#1088#1086#1076#1072#1074#1077#1094
      end
      object Label9: TLabel
        Left = 385
        Top = 514
        Width = 62
        Height = 16
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      end
      object Label11: TLabel
        Left = 533
        Top = 514
        Width = 106
        Height = 16
        Caption = #1043#1086#1076' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
      end
      object Label10: TLabel
        Left = 536
        Top = 433
        Width = 62
        Height = 16
        Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      end
      object CarImage: TImage
        Left = 1024
        Top = 359
        Width = 318
        Height = 317
        Center = True
        Proportional = True
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 3
        Width = 1059
        Height = 350
        DataSource = DataModule2.DS_Cars
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CarCost'
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CarName'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CarBirth'
            Title.Alignment = taCenter
            Title.Caption = #1043#1086#1076
            Width = 40
            Visible = True
          end>
      end
      object CarName: TEdit
        Left = 3
        Top = 392
        Width = 121
        Height = 24
        TabOrder = 1
      end
      object CarEngineVolume: TEdit
        Left = 432
        Top = 392
        Width = 121
        Height = 24
        TabOrder = 2
      end
      object CarEnginePower: TEdit
        Left = 559
        Top = 392
        Width = 121
        Height = 24
        TabOrder = 3
      end
      object CarGear: TRadioGroup
        Left = 3
        Top = 455
        Width = 185
        Height = 105
        Items.Strings = (
          #1052#1077#1093#1072#1085#1080#1082#1072
          #1040#1074#1090#1086#1084#1072#1090)
        TabOrder = 4
      end
      object CarDrive: TRadioGroup
        Left = 194
        Top = 455
        Width = 185
        Height = 105
        Items.Strings = (
          #1055#1077#1088#1077#1076#1085#1080#1081
          #1047#1072#1076#1085#1080#1081
          #1055#1086#1083#1085#1099#1081)
        TabOrder = 5
      end
      object CarCost: TEdit
        Left = 385
        Top = 536
        Width = 142
        Height = 24
        TabOrder = 6
      end
      object CarBirth: TEdit
        Left = 533
        Top = 536
        Width = 121
        Height = 24
        TabOrder = 7
      end
      object Priority: TEdit
        Left = 536
        Top = 455
        Width = 121
        Height = 24
        TabOrder = 8
      end
      object CarAdd: TButton
        Left = 902
        Top = 386
        Width = 102
        Height = 37
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 9
        OnClick = CarAddClick
      end
      object CarUpdate: TButton
        Left = 794
        Top = 386
        Width = 102
        Height = 37
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 10
        OnClick = CarUpdateClick
      end
      object CarSell: TButton
        Left = 686
        Top = 386
        Width = 102
        Height = 37
        Caption = #1055#1088#1086#1076#1072#1090#1100
        TabOrder = 11
        OnClick = CarSellClick
      end
      object CarBody: TComboBox
        Left = 136
        Top = 392
        Width = 139
        Height = 24
        TabOrder = 12
        Text = 'CarBody'
      end
      object CarEngine: TComboBox
        Left = 281
        Top = 392
        Width = 145
        Height = 24
        TabOrder = 13
        Text = 'CarEngine'
      end
      object CarInfo: TRichEdit
        Left = 1068
        Top = 0
        Width = 274
        Height = 350
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'CarInfo')
        ParentFont = False
        TabOrder = 14
        Zoom = 100
      end
      object CarSeller: TComboBox
        Left = 385
        Top = 455
        Width = 145
        Height = 24
        TabOrder = 15
        Text = 'CarSeller'
      end
      object ImageButton: TButton
        Left = 794
        Top = 449
        Width = 210
        Height = 37
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        TabOrder = 16
        OnClick = ImageButtonClick
      end
      object CarImageDelete: TButton
        Left = 794
        Top = 492
        Width = 210
        Height = 37
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        TabOrder = 17
        OnClick = CarImageDeleteClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1086#1076#1072#1074#1094#1099
      ImageIndex = 1
      object Label12: TLabel
        Left = 3
        Top = 223
        Width = 83
        Height = 16
        Caption = #1048#1084#1103' '#1087#1088#1086#1076#1072#1074#1094#1072
      end
      object Label13: TLabel
        Left = 178
        Top = 223
        Width = 113
        Height = 16
        Caption = #1058#1077#1083#1077#1092#1086#1085' '#1087#1088#1086#1076#1072#1074#1094#1072
      end
      object Label14: TLabel
        Left = 351
        Top = 223
        Width = 95
        Height = 16
        Caption = #1040#1076#1088#1077#1089' '#1087#1088#1086#1076#1072#1074#1094#1072
      end
      object SellerImage: TImage
        Left = 503
        Top = 3
        Width = 326
        Height = 326
        Center = True
        Proportional = True
      end
      object Label15: TLabel
        Left = 3
        Top = 338
        Width = 155
        Height = 16
        Caption = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      end
      object DBGrid2: TDBGrid
        Left = 3
        Top = 3
        Width = 494
        Height = 214
        DataSource = DataModule2.DS_Sellers
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'UserID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UserName'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UserPhone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UserImage'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUM(sc.SoldCarCost)'
            Visible = True
          end>
      end
      object SellerPhone: TEdit
        Left = 178
        Top = 245
        Width = 167
        Height = 24
        TabOrder = 1
      end
      object SellerAdd: TButton
        Left = 3
        Top = 288
        Width = 102
        Height = 41
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 2
        OnClick = SellerAddClick
      end
      object SellerUpdate: TButton
        Left = 111
        Top = 288
        Width = 103
        Height = 41
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 3
        OnClick = SellerUpdateClick
      end
      object SellerDelete: TButton
        Left = 220
        Top = 288
        Width = 106
        Height = 41
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 4
        OnClick = SellerDeleteClick
      end
      object SellerButton: TButton
        Left = 332
        Top = 288
        Width = 165
        Height = 41
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        TabOrder = 5
        OnClick = SellerButtonClick
      end
      object SellerFilter: TComboBox
        Left = 3
        Top = 360
        Width = 155
        Height = 24
        TabOrder = 6
        Text = #1060#1080#1083#1100#1090#1088
      end
      object SellerAddress: TComboBox
        Left = 351
        Top = 245
        Width = 146
        Height = 24
        TabOrder = 7
        Text = 'SellerAddress'
      end
      object SellerCheckFilter: TCheckBox
        Left = 164
        Top = 364
        Width = 118
        Height = 17
        Caption = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100
        TabOrder = 8
        OnClick = SellerCheckFilterClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1055#1088#1086#1076#1072#1085#1085#1099#1077' '#1084#1072#1096#1080#1085#1099
      ImageIndex = 2
      object SoldCarImage: TImage
        Left = 1084
        Top = 416
        Width = 258
        Height = 260
        Center = True
        Proportional = True
      end
      object DBGrid3: TDBGrid
        Left = 3
        Top = 3
        Width = 1075
        Height = 474
        DataSource = DataModule2.DS_SoldCars
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object SoldCarInfo: TRichEdit
        Left = 1084
        Top = 136
        Width = 258
        Height = 274
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'SoldCarInfo')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Zoom = 100
      end
      object DBChart2: TDBChart
        Left = 3
        Top = 483
        Width = 1075
        Height = 193
        Title.Text.Strings = (
          #1055#1088#1086#1076#1072#1085#1085#1099#1077' '#1084#1072#1096#1080#1085#1099)
        TabOrder = 2
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series2: TBarSeries
          ColorEachPoint = True
          DataSource = DataModule2.Q_SumSoldCars
          XLabelsSource = 'SoldCarDate'
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'SoldCarDate'
          YValues.Name = 'Bar'
          YValues.Order = loNone
          YValues.ValueSource = 'SUM(1)'
        end
      end
      object SoldCarSeller: TRichEdit
        Left = 1084
        Top = 41
        Width = 258
        Height = 89
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'SoldCarSeller')
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Zoom = 100
      end
    end
  end
  object OpenCar: TOpenPictureDialog
    Left = 1308
    Top = 3
  end
  object OpenSeller: TOpenPictureDialog
    Left = 1340
    Top = 3
  end
end
