object Form4: TForm4
  Left = 0
  Top = 0
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 224
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 145
    Height = 209
    Caption = #1042#1086#1081#1090#1080
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 53
      Height = 16
      Caption = #1058#1077#1083#1077#1092#1086#1085
    end
    object Label2: TLabel
      Left = 16
      Top = 76
      Width = 43
      Height = 16
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object JoinButton: TButton
      Left = 21
      Top = 128
      Width = 121
      Height = 25
      Caption = #1042#1086#1081#1090#1080
      TabOrder = 0
      OnClick = JoinButtonClick
    end
    object PhoneJoin: TEdit
      Left = 16
      Top = 46
      Width = 121
      Height = 24
      TabOrder = 1
    end
    object PasswordJoin: TEdit
      Left = 16
      Top = 98
      Width = 121
      Height = 24
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 161
    Top = 8
    Width = 145
    Height = 209
    Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100#1089#1103
    TabOrder = 1
    object Label3: TLabel
      Left = 3
      Top = 76
      Width = 53
      Height = 16
      Caption = #1058#1077#1083#1077#1092#1086#1085
    end
    object Label4: TLabel
      Left = 3
      Top = 128
      Width = 43
      Height = 16
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object Label5: TLabel
      Left = 3
      Top = 24
      Width = 91
      Height = 16
      Caption = #1048#1084#1103' '#1080' '#1092#1072#1084#1080#1083#1080#1103
    end
    object RegisterButton: TButton
      Left = 0
      Top = 180
      Width = 129
      Height = 25
      Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100#1089#1103
      TabOrder = 0
      OnClick = RegisterButtonClick
    end
    object PhoneRegister: TEdit
      Left = 3
      Top = 98
      Width = 126
      Height = 24
      TabOrder = 1
    end
    object PasswordRegister: TEdit
      Left = 3
      Top = 150
      Width = 126
      Height = 24
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 2
    end
    object NameRegister: TEdit
      Left = 3
      Top = 46
      Width = 126
      Height = 24
      TabOrder = 3
    end
  end
end
