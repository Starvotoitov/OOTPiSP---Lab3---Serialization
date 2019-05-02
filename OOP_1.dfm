object fMain: TfMain
  Left = 220
  Top = 239
  Caption = 'fMain'
  ClientHeight = 501
  ClientWidth = 1028
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cbCreate: TComboBox
    Left = 24
    Top = 16
    Width = 185
    Height = 21
    Style = csDropDownList
    TabOrder = 0
  end
  object bCreate: TButton
    Left = 24
    Top = 43
    Width = 185
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 1
    OnClick = bCreateClick
  end
  object lbProducts: TListBox
    Left = 24
    Top = 74
    Width = 185
    Height = 295
    ItemHeight = 13
    TabOrder = 2
    OnClick = lbProductsClick
  end
  object Сериализовать: TButton
    Left = 24
    Top = 424
    Width = 185
    Height = 25
    Caption = #1057#1077#1088#1080#1072#1083#1080#1079#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = СериализоватьClick
  end
  object Десериализовать: TButton
    Left = 24
    Top = 455
    Width = 185
    Height = 25
    Caption = #1044#1077#1089#1077#1088#1080#1072#1083#1080#1079#1086#1074#1072#1090#1100
    TabOrder = 4
    OnClick = ДесериализоватьClick
  end
  object dDeserialize: TOpenDialog
    Filter = 
      #1058#1077#1082#1089#1090#1074#1086#1103' '#1089#1077#1088#1080#1072#1083#1080#1079#1072#1094#1080#1103'|*.txt|'#1041#1080#1085#1072#1088#1085#1072#1103' '#1089#1077#1088#1080#1072#1083#1080#1079#1072#1094#1080#1103' .bin|*.bin|JSO' +
      'N-'#1089#1077#1088#1080#1072#1083#1080#1079#1072#1094#1080#1103'|*.json'
    Left = 80
    Top = 376
  end
  object dSerialize: TSaveDialog
    Filter = 
      #1058#1077#1082#1089#1090#1086#1074#1072#1103' '#1089#1077#1088#1080#1072#1083#1080#1079#1072#1094#1080#1103'|*txt|'#1041#1080#1085#1072#1088#1085#1072#1103' '#1089#1077#1088#1080#1072#1083#1080#1079#1072#1094#1080#1103' .bin|*.bin|JSO' +
      'N-'#1089#1077#1088#1080#1072#1083#1080#1079#1072#1094#1080#1103'|*.json'
    Left = 112
    Top = 376
  end
end
