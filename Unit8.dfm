object Form8: TForm8
  Left = 0
  Top = 0
  Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
  ClientHeight = 158
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 162
    Height = 13
    Caption = #1053#1072#1087#1080#1096#1080#1090#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1087#1088#1086#1076#1072#1074#1094#1091
  end
  object RichEditMessage: TRichEdit
    Left = 8
    Top = 27
    Width = 305
    Height = 89
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEditMessage')
    ParentFont = False
    TabOrder = 0
    Zoom = 100
  end
  object ButtonSend: TButton
    Left = 8
    Top = 122
    Width = 305
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = ButtonSendClick
  end
end
