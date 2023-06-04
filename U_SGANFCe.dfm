object frm_SGA_Principal: Tfrm_SGA_Principal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gerenciador v0.5.0'
  ClientHeight = 469
  ClientWidth = 597
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 13
  object frmSGA: TPageControl
    Left = 0
    Top = 0
    Width = 597
    Height = 469
    ActivePage = frmGerenciadorNFCe
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 593
    ExplicitHeight = 468
    object frmGerenciadorNFCe: TTabSheet
      Caption = 'Gerenciador de NFC-e'
      object Label1: TLabel
        Left = 144
        Top = 19
        Width = 292
        Height = 23
        Align = alCustom
        Alignment = taCenter
        Caption = 'Insira aqui os n'#250'meros das NFC-es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 256
        Top = 251
        Width = 82
        Height = 23
        Align = alCustom
        Alignment = taCenter
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btn_Gerar: TButton
        Left = 120
        Top = 192
        Width = 105
        Height = 41
        Caption = 'Gerar'
        TabOrder = 0
        OnClick = btn_GerarClick
      end
      object btn_Limpar: TButton
        Left = 368
        Top = 192
        Width = 105
        Height = 41
        Caption = 'Limpar'
        TabOrder = 1
        OnClick = btn_LimparClick
      end
      object btn_Copiar: TButton
        Left = 256
        Top = 398
        Width = 89
        Height = 36
        Caption = 'Copiar'
        TabOrder = 2
        OnClick = btn_CopiarClick
      end
      object txtNFCe: TMemo
        Left = 120
        Top = 64
        Width = 353
        Height = 89
        Color = 16776176
        TabOrder = 3
      end
      object txtNFCeOutput: TMemo
        Left = 120
        Top = 280
        Width = 353
        Height = 105
        Color = clScrollBar
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object checkBoxExibirScript: TCheckBox
        Left = 496
        Top = 320
        Width = 97
        Height = 17
        Caption = 'Exibir script'
        TabOrder = 5
        OnClick = checkBoxExibirScriptClick
      end
    end
    object frmScripts: TTabSheet
      Caption = 'Scripts'
      ImageIndex = 1
      object Label2: TLabel
        Left = 240
        Top = 19
        Width = 56
        Height = 23
        Align = alCustom
        Alignment = taCenter
        Caption = 'Scripts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object opcoesScript: TComboBox
        Left = 131
        Top = 88
        Width = 305
        Height = 21
        TabOrder = 0
        Text = '- Selecione uma op'#231#227'o -'
        OnChange = opcoesScriptChange
        Items.Strings = (
          '- Selecione uma op'#231#227'o -'
          'NFC-es pendentes'
          'Exportar movimenta'#231#227'o'
          'Enviar NFC-es com status de "Envie na frente do caixa"'
          'Corrigir diferen'#231'a de centavos entre VENDAS e NFMASTER')
      end
      object txtScripts: TMemo
        Left = 88
        Top = 136
        Width = 393
        Height = 105
        Color = clSilver
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object btnCopiarScript: TButton
        Left = 240
        Top = 286
        Width = 89
        Height = 36
        Caption = 'Copiar'
        TabOrder = 2
        OnClick = btnCopiarScriptClick
      end
    end
    object frmUteis: TTabSheet
      Caption = #218'teis'
      ImageIndex = 2
      object Label3: TLabel
        Left = 248
        Top = 19
        Width = 40
        Height = 23
        Align = alCustom
        Alignment = taCenter
        Caption = #218'teis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb_aviso: TLabel
        Left = 127
        Top = 48
        Width = 317
        Height = 16
        Caption = 'Obs: Lembrar de renomear a base para SAC4WIN2.fdb'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object opcoesUteis: TComboBox
        Left = 139
        Top = 85
        Width = 305
        Height = 21
        TabOrder = 0
        Text = 'Portas do Firewall'
        OnChange = opcoesUteisChange
        Items.Strings = (
          'Portas do Firewall'
          'Reparar base corrompida'
          'Delet'#227'o'
          'Configurar CPU e RAM para Firebird')
      end
      object txtUteis: TMemo
        Left = 64
        Top = 144
        Width = 425
        Height = 48
        Color = clMenu
        Lines.Strings = (
          
            '65123, 65100, 64123, 9092, 4899, 4096, 3050,992, 993, 995, 587, ' +
            '465, 445, '
          '80, 21')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object btnCopiarUteis: TButton
        Left = 240
        Top = 198
        Width = 89
        Height = 36
        Caption = 'Copiar'
        TabOrder = 2
        OnClick = btnCopiarUteisClick
      end
      object pn_base: TPanel
        Left = 0
        Top = 224
        Width = 589
        Height = 217
        TabOrder = 3
        Visible = False
        object lb_primeiroPasso: TLabel
          Left = 16
          Top = 8
          Width = 220
          Height = 16
          Caption = '1'#186' passo - Verificar erros na base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 57
          Width = 213
          Height = 16
          Caption = '2'#186' passo - Corrigir erros na base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 16
          Top = 105
          Width = 156
          Height = 16
          Caption = '3'#186' passo - Fazer backup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 16
          Top = 154
          Width = 159
          Height = 16
          Caption = '4'#186' passo - Fazer restore'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txt_primeiroPasso: TEdit
          Left = 16
          Top = 30
          Width = 529
          Height = 21
          Color = clCream
          ReadOnly = True
          TabOrder = 0
          Text = 'gfix -v -f SAC4WIN2.fdb -user SYSDBA -pass masterkey'
        end
        object txt_segundoPasso: TEdit
          Left = 16
          Top = 78
          Width = 529
          Height = 21
          Color = clCream
          ReadOnly = True
          TabOrder = 1
          Text = 'gfix -m -i SAC4WIN2.fdb -user SYSDBA -pass masterkey'
        end
        object txt_terceiroPasso: TEdit
          Left = 16
          Top = 127
          Width = 529
          Height = 21
          Color = clCream
          ReadOnly = True
          TabOrder = 2
          Text = 
            'gbak -g -b -z -l -v SAC4WIN2.fdb SAC4WINbkp.fbk -user SYSDBA -pa' +
            'ss masterkey'
        end
        object txt_quartoPasso: TEdit
          Left = 16
          Top = 176
          Width = 529
          Height = 21
          Color = clCream
          ReadOnly = True
          TabOrder = 3
          Text = 
            'gbak -g -c -z -v SAC4WINbkp.fbk  SAC4WINnewbkp.fdb -user SYSDBA ' +
            '-pass masterkey'
        end
        object btn_copiarPrimeiroPasso: TButton
          Left = 470
          Top = 30
          Width = 75
          Height = 21
          Caption = 'Copiar'
          TabOrder = 4
          OnClick = btn_copiarPrimeiroPassoClick
        end
        object btn_copiarSegundoPasso: TButton
          Left = 470
          Top = 78
          Width = 75
          Height = 21
          Caption = 'Copiar'
          TabOrder = 5
          OnClick = btn_copiarSegundoPassoClick
        end
        object Button3: TButton
          Left = -218
          Top = 270
          Width = 75
          Height = 21
          Caption = 'Button1'
          TabOrder = 6
        end
        object btn_copiarTerceiroPasso: TButton
          Left = 470
          Top = 127
          Width = 75
          Height = 21
          Caption = 'Copiar'
          TabOrder = 7
          OnClick = btn_copiarTerceiroPassoClick
        end
        object btn_quartoTerceiroPasso: TButton
          Left = 470
          Top = 176
          Width = 75
          Height = 21
          Caption = 'Copiar'
          TabOrder = 8
          OnClick = btn_quartoTerceiroPassoClick
        end
      end
      object pn_perguntas: TPanel
        Left = 595
        Top = 3
        Width = 589
        Height = 320
        TabOrder = 4
        Visible = False
        object txt_comoUsar: TLabel
          Left = 328
          Top = 232
          Width = 3
          Height = 13
        end
        object pn_cpu: TPanel
          Left = 327
          Top = 6
          Width = 250
          Height = 198
          TabOrder = 0
          object lb_nucleos: TLabel
            Left = 8
            Top = 3
            Width = 178
            Height = 16
            Caption = 'Quantos n'#250'cleos o CPU possui?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object rb_CPU2: TRadioButton
            Left = 8
            Top = 45
            Width = 65
            Height = 17
            Caption = '2 n'#250'cleos'
            TabOrder = 0
            OnClick = rb_CPU2Click
          end
          object rb_CPU4: TRadioButton
            Left = 8
            Top = 84
            Width = 65
            Height = 17
            Caption = '4 n'#250'cleos'
            TabOrder = 1
            OnClick = rb_CPU4Click
          end
          object rb_CPU6: TRadioButton
            Left = 8
            Top = 120
            Width = 66
            Height = 17
            Caption = '6 n'#250'cleos'
            TabOrder = 2
            OnClick = rb_CPU6Click
          end
          object rb_CPU8: TRadioButton
            Left = 8
            Top = 157
            Width = 74
            Height = 17
            Caption = '8 n'#250'cleos'
            TabOrder = 3
            OnClick = rb_CPU8Click
          end
          object txt_cpu: TMemo
            Left = 128
            Top = 58
            Width = 89
            Height = 69
            TabOrder = 4
            Visible = False
          end
        end
        object pn_ram: TPanel
          Left = 7
          Top = 6
          Width = 306
          Height = 125
          TabOrder = 1
          object lb_ram: TLabel
            Left = 8
            Top = 3
            Width = 150
            Height = 16
            Caption = 'Quanto de mem'#243'ria RAM?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object rb_RAM4: TRadioButton
            Left = 8
            Top = 25
            Width = 49
            Height = 17
            Caption = '4 GB'
            TabOrder = 0
            OnClick = rb_RAM4Click
          end
          object rb_RAM8: TRadioButton
            Left = 8
            Top = 60
            Width = 49
            Height = 17
            Caption = '8 GB'
            TabOrder = 1
            OnClick = rb_RAM8Click
          end
          object rb_RAM16: TRadioButton
            Left = 7
            Top = 96
            Width = 49
            Height = 17
            Caption = '16 GB'
            TabOrder = 2
            OnClick = rb_RAM16Click
          end
          object txt_memoria: TMemo
            Left = 152
            Top = 38
            Width = 89
            Height = 69
            Lines.Strings = (
              '')
            TabOrder = 3
            Visible = False
          end
        end
        object pn_server: TPanel
          Left = 7
          Top = 136
          Width = 306
          Height = 68
          TabOrder = 2
          object lb_server: TLabel
            Left = 8
            Top = 3
            Width = 131
            Height = 16
            Caption = 'O servidor '#233' dedicado?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object rb_serverSim: TRadioButton
            Left = 8
            Top = 36
            Width = 49
            Height = 17
            Caption = 'Sim'
            TabOrder = 0
            OnClick = rb_serverSimClick
          end
          object rb_serverNao: TRadioButton
            Left = 63
            Top = 36
            Width = 49
            Height = 17
            Caption = 'N'#227'o'
            TabOrder = 1
            OnClick = rb_serverNaoClick
          end
          object txt_servidor: TMemo
            Left = 176
            Top = 4
            Width = 89
            Height = 69
            Lines.Strings = (
              '')
            TabOrder = 2
            Visible = False
          end
        end
        object txt_Firebird: TMemo
          Left = 7
          Top = 210
          Width = 306
          Height = 66
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object btn_txtFirebird: TButton
          Left = 124
          Top = 278
          Width = 89
          Height = 36
          Caption = 'Copiar'
          TabOrder = 4
          OnClick = btn_txtFirebirdClick
        end
        object btn_comoUsar: TButton
          Left = 512
          Top = 278
          Width = 65
          Height = 25
          Caption = 'Como usar'
          TabOrder = 5
          OnClick = btn_comoUsarClick
        end
      end
    end
  end
end
