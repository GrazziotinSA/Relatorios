object frmConfiguracaoINI: TfrmConfiguracaoINI
  Left = 270
  Top = 80
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o Arquivo .INI...'
  ClientHeight = 218
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 190
    Width = 537
    Height = 28
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object btnGravar: TBitBtn
      Left = 2
      Top = 2
      Width = 75
      Height = 24
      Align = alLeft
      Caption = 'Gravar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnAlterar: TBitBtn
      Left = 77
      Top = 2
      Width = 75
      Height = 24
      Align = alLeft
      Caption = 'Alterar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 152
      Top = 2
      Width = 79
      Height = 24
      Align = alLeft
      Caption = 'Cancelar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnSair: TBitBtn
      Left = 460
      Top = 2
      Width = 75
      Height = 24
      Align = alRight
      Caption = 'Sair'
      Glyph.Data = {
        9E050000424D9E05000000000000360400002800000012000000120000000100
        0800000000006801000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
        07070707070707070707070700000707FFFFFFFFFFFFFFFF0000FFFFFF070707
        00000707FFFFFFFFFFFFFFFF00FE00FFFFFF0707000007FFFFFFFFFFFFFFFFFF
        00FE0600FFFFFF07000007000000000000FFFFFF00FE06060000000700000707
        070707070700000000FE060600070707000007070707070007A4A4A400FE0606
        00070707000007070707070000A4A4A400FE0606000707070000070707070700
        FE00A4A400FE0006000707070000070700000000FEFE00A400FE000600070707
        00000707FEFEFEFEFEFEFE0000FE0606000707070000070706060606FEFE00A4
        00FE0606000707070000070707070700FE00A4A400FE06060007070700000707
        0707070000A4A4A400FE060600070707000007070707070007A4A4A4A400FE06
        00070707000007070707070707A4A4A4A4A400FE000707070000070707070707
        07A4A4A4A4A4A400000707070000070707070707070707070707070707070707
        0000}
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
  object pnlConexao: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 32
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  Conex'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnlUsuario: TPanel
    Left = 0
    Top = 121
    Width = 537
    Height = 32
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  Usu'#225'rio: XXXXXXX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object pnlFundoConexao: TPanel
    Left = 0
    Top = 32
    Width = 537
    Height = 89
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    object lblBase: TLabel
      Left = 19
      Top = 11
      Width = 27
      Height = 13
      Caption = 'Base:'
    end
    object Label2: TLabel
      Left = 6
      Top = 38
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object lblSenha: TLabel
      Left = 12
      Top = 65
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object edtBase: TMaskEdit
      Left = 52
      Top = 8
      Width = 478
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      Text = ''
    end
    object edtUsuario: TMaskEdit
      Left = 52
      Top = 35
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Text = ''
    end
    object edtSenha: TMaskEdit
      Left = 52
      Top = 62
      Width = 121
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 2
      Text = ''
    end
  end
  object pnlFundoUsuario: TPanel
    Left = 0
    Top = 153
    Width = 537
    Height = 37
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 4
    object lblAparencia: TLabel
      Left = 6
      Top = 11
      Width = 52
      Height = 13
      Caption = 'Apar'#234'ncia:'
    end
    object cbxEstilos: TComboBox
      Left = 64
      Top = 8
      Width = 220
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbxEstilosChange
      OnEnter = cbxEstilosEnter
      OnExit = cbxEstilosExit
    end
  end
end
