unit U_SGANFCe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.RegularExpressions, Clipbrd,
  Vcl.Menus, System.DateUtils, Vcl.ExtCtrls;

type
  Tfrm_SGA_Principal = class(TForm)
    frmSGA: TPageControl;
    frmGerenciadorNFCe: TTabSheet;
    frmScripts: TTabSheet;
    frmUteis: TTabSheet;
    Label1: TLabel;
    btn_Gerar: TButton;
    btn_Limpar: TButton;
    btn_Copiar: TButton;
    txtNFCe: TMemo;
    txtNFCeOutput: TMemo;
    opcoesScript: TComboBox;
    Label2: TLabel;
    txtScripts: TMemo;
    btnCopiarScript: TButton;
    opcoesUteis: TComboBox;
    Label3: TLabel;
    txtUteis: TMemo;
    btnCopiarUteis: TButton;
    checkBoxExibirScript: TCheckBox;
    pn_base: TPanel;
    lb_primeiroPasso: TLabel;
    txt_primeiroPasso: TEdit;
    txt_segundoPasso: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    txt_terceiroPasso: TEdit;
    Label6: TLabel;
    txt_quartoPasso: TEdit;
    btn_copiarPrimeiroPasso: TButton;
    btn_copiarSegundoPasso: TButton;
    Button3: TButton;
    btn_copiarTerceiroPasso: TButton;
    btn_quartoTerceiroPasso: TButton;
    lb_aviso: TLabel;
    Label7: TLabel;
    pn_cpu: TPanel;
    lb_nucleos: TLabel;
    rb_CPU2: TRadioButton;
    rb_CPU4: TRadioButton;
    rb_CPU6: TRadioButton;
    rb_CPU8: TRadioButton;
    pn_ram: TPanel;
    lb_ram: TLabel;
    rb_RAM4: TRadioButton;
    rb_RAM8: TRadioButton;
    txt_Firebird: TMemo;
    rb_RAM16: TRadioButton;
    pn_server: TPanel;
    lb_server: TLabel;
    rb_serverSim: TRadioButton;
    rb_serverNao: TRadioButton;
    pn_perguntas: TPanel;
    btn_txtFirebird: TButton;
    txt_memoria: TMemo;
    txt_cpu: TMemo;
    txt_servidor: TMemo;
    txt_comoUsar: TLabel;
    btn_comoUsar: TButton;
    procedure btn_GerarClick(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
    procedure btn_CopiarClick(Sender: TObject);
    procedure opcoesScriptChange(Sender: TObject);
    procedure btnCopiarScriptClick(Sender: TObject);
    procedure opcoesUteisChange(Sender: TObject);
    procedure btnCopiarUteisClick(Sender: TObject);
    procedure checkBoxExibirScriptClick(Sender: TObject);
    procedure btn_copiarPrimeiroPassoClick(Sender: TObject);
    procedure btn_copiarSegundoPassoClick(Sender: TObject);
    procedure btn_copiarTerceiroPassoClick(Sender: TObject);
    procedure btn_quartoTerceiroPassoClick(Sender: TObject);
    procedure rb_serverNaoClick(Sender: TObject);
    procedure rb_CPU2Click(Sender: TObject);
    procedure rb_RAM4Click(Sender: TObject);
    procedure rb_CPU4Click(Sender: TObject);
    procedure rb_CPU6Click(Sender: TObject);
    procedure rb_CPU8Click(Sender: TObject);
    procedure rb_RAM8Click(Sender: TObject);
    procedure rb_RAM16Click(Sender: TObject);
    procedure rb_serverSimClick(Sender: TObject);
    procedure btn_txtFirebirdClick(Sender: TObject);
    procedure btn_comoUsarClick(Sender: TObject);
  private
    { Private declarations }
  public
    var
    regex: TRegEx;
    Matches: TMatchCollection;
    txtNFCeFormat, nfceOutput: String;
  end;

var
  frm_SGA_Principal: Tfrm_SGA_Principal;

implementation

{$R *.dfm}

procedure Tfrm_SGA_Principal.btnCopiarScriptClick(Sender: TObject);

  begin
    Clipboard.AsText := txtScripts.Text;
    ShowMessage('Script copiado com sucesso!');
  end;

procedure Tfrm_SGA_Principal.btnCopiarUteisClick(Sender: TObject);

  begin
    Clipboard.AsText := txtUteis.Text;
    ShowMessage('Texto foi copiado com sucesso!');
  end;

procedure Tfrm_SGA_Principal.btn_CopiarClick(Sender: TObject);
  begin
    Clipboard.AsText := txtNFCeOutput.Text;
    ShowMessage('Numeração copiada com sucesso!');
  end;

procedure Tfrm_SGA_Principal.btn_copiarPrimeiroPassoClick(Sender: TObject);
  begin
    Clipboard.AsText := txt_primeiroPasso.Text;
    ShowMessage('Texto foi copiado com sucesso!');
  end;

procedure Tfrm_SGA_Principal.btn_copiarSegundoPassoClick(Sender: TObject);
  begin
    Clipboard.AsText := txt_segundoPasso.Text;
    ShowMessage('Texto foi copiado com sucesso!');
  end;

procedure Tfrm_SGA_Principal.btn_copiarTerceiroPassoClick(Sender: TObject);
  begin
    Clipboard.AsText := txt_terceiroPasso.Text;
    ShowMessage('Texto foi copiado com sucesso!');
  end;

function dataMesPassado(): String;
  var
    dataAtual: TDateTime;
    mesAnterior: TDateTime;
    dataInicial: TDateTime;
    dataFinal: TDateTime;

  begin
    dataAtual := Date;
    mesAnterior := IncMonth(dataAtual, -1);
    dataInicial := StartOfTheMonth(mesAnterior);
    dataFinal := Trunc(EndOfTheMonth(mesAnterior));
    FormatSettings.ShortDateFormat := 'dd.mm.yyyy';

    Result := '''' + DateTimeToStr(dataInicial) + '''' + ' and ' + '''' + DateTimeToStr(dataFinal) + '''';
  end;

procedure Tfrm_SGA_Principal.btn_GerarClick(Sender: TObject);
  var
  Match: TMatch;
  begin



  if (txtNFCe.Text = '') then
    begin
      MessageDlg('Cole as numerações das NFC-es no campo de texto', mtWarning, [mbOK], 0);
    end
  else
    begin
    regex := TRegEx.Create('(?:0{2,})(\d+)(?:\s+)?(?:0{2}\d+)?(?:\d+)?(?:\s\d+)?', [roIgnoreCase, roMultiLine]);
    txtNFCeFormat := txtNFCe.Text;
    Matches := RegEx.Matches(txtNFCeFormat);

    for Match in Matches do
      if (txtNFCeOutput.Text = '') then
        begin
          txtNFCeOutput.Text := Match.Groups[1].Value;
        end
      else
        begin
          txtNFCeOutput.Text := txtNFCeOutput.Text + ', ' + Match.Groups[1].Value;
        end;
    end;

    nfceOutput := txtNFCeOutput.Text;
  end;

procedure Tfrm_SGA_Principal.btn_LimparClick(Sender: TObject);
  begin
    if (txtNFCe.Text = '') then
      begin
        ShowMessage('Campo já está limpo');
      end
    else
      begin
        txtNFCeOutput.Text := '';
        txtNFCe.Text := '';
        nfceOutput := '';
      end;
  end;

procedure Tfrm_SGA_Principal.btn_quartoTerceiroPassoClick(Sender: TObject);
  begin
    Clipboard.AsText := txt_quartoPasso.Text;
    ShowMessage('Texto foi copiado com sucesso!');
  end;

procedure Tfrm_SGA_Principal.btn_txtFirebirdClick(Sender: TObject);
begin
    if txt_Firebird.Text = '' then
      begin
        ShowMessage('Não há nada para copiar');
      end
      else
      begin
        Clipboard.AsText := txt_Firebird.Text;
        ShowMessage('Texto foi copiado com sucesso!');
      end;

end;

procedure Tfrm_SGA_Principal.checkBoxExibirScriptClick(Sender: TObject);
  var
    scriptExportacao : String;
  begin
    scriptExportacao := 'select n.* from nfmaster n' + sLineBreak +
          '--join nfdet d on n.idnfmaster = d.idnfmaster' + sLineBreak +
          '--join vendas v on v.idnfmaster = n.idnfmaster' + sLineBreak +
          '--join areceber a on v.idcompra = a.idcompra' + sLineBreak +
          'where n.situacao = 0 and n.serie = ''NFC-E'' and n.dataentsai between ' + dataMesPassado() + sLineBreak +
          'and n.numnota in (' + nfceOutput + ')';

          if checkBoxExibirScript.Checked then
            begin
              txtNFCeOutput.Text := scriptExportacao;
            end
          else
            begin
              txtNFCeOutput.Text := nfceOutput;
            end;

  end;

procedure Tfrm_SGA_Principal.opcoesScriptChange(Sender: TObject);
  begin
    if opcoesScript.Text = 'NFC-es pendentes' then
      begin
        txtScripts.Text := 'select idnfmaster, 1 as tratado, subserie, current_timestamp as datahora, 0 as cstat from' + sLineBreak +
                           'nfmaster n where n.dataentsai between ' + dataMesPassado() + sLineBreak +
                           'and n.serie = ''NFC-E'' and n.protocolo = '''' and n.chavenfe <> '''' and situacao = 0';
      end
    else if opcoesScript.Text = 'Exportar movimentação' then
      begin
        txtScripts.Text := 'select n.* from nfmaster n' + sLineBreak +
                           '--join nfdet d on n.idnfmaster = d.idnfmaster' + sLineBreak +
                           '--join vendas v on v.idnfmaster = n.idnfmaster' + sLineBreak +
                           '--join areceber a on v.idcompra = a.idcompra' + sLineBreak +
                           'where n.situacao = 0 and n.serie = ''NFC-E'' and n.dataentsai between ' + dataMesPassado();
      end
    else if opcoesScript.Text = '- Selecione uma opção -' then
      begin
        txtScripts.Text := '';
      end
    else if opcoesScript.Text = 'Enviar NFC-es com status de "Envie na frente do caixa"' then
      begin
        txtScripts.Text := 'select idnfmaster, 0 as cstat from nfcependentes n' + sLineBreak +
                           'where n.cstat in (''-4'', ''-3'')';
      end
    else if opcoesScript.Text = 'Corrigir diferença de centavos entre VENDAS e NFMASTER' then
      begin
        txtScripts.Text := 'select v.idcompra, sum (d.quantidade * d.composicao * d.vlrunitario - d.vlrunitdesc + d.vlrunitacresc) as VALOR --VLRDOCUMENTO' + sLineBreak +
                           'from vendas v' + sLineBreak +
                           'join nfmaster m on m.idnfmaster=v.idnfmaster' + sLineBreak +
                           'join nfdet d on d.idnfmaster=m.idnfmaster' + sLineBreak +
                           'join areceber ar on ar.idcompra=v.idcompra' + sLineBreak +
                           'where' + sLineBreak +
                           'v.situacao=''0'' and m.situacao=''0'' and m.serie=''NFC-E'' and m.emissao between ' + dataMesPassado() +  ' and m.protocolo = ''''' + sLineBreak +
                           'and v.desconto=''0'' and v.acrescimo=''0'' and d.cancelado=''0''' + sLineBreak +
                           'group by idcompra';
      end;



  end;

procedure Tfrm_SGA_Principal.opcoesUteisChange(Sender: TObject);
var
    memoriaRAM, cpu, server: array [0..4] of Integer;
  begin
    if opcoesUteis.Text = 'Portas do Firewall' then
      begin
        pn_base.Visible := False;
        txtUteis.Visible := True;
        btnCopiarUteis.Visible := True;
        lb_aviso.Visible := False;
        btnCopiarUteis.Top := btnCopiarUteis.Top - 117;
        txtUteis.Height := 33;
        pn_perguntas.Visible := False;
        txtUteis.Text := '65123, 65100, 64123, 9092, 4899, 4096, 3050,992, 993, 995, 587, 465, 445, 80, 21';
      end
    else if opcoesUteis.Text = 'Reparar base corrompida' then
      begin
        lb_aviso.Top := 400;
        lb_aviso.Visible := True;
        pn_base.Top := 144;
        pn_base.Visible := True;
        pn_perguntas.Visible := False;
        txtUteis.Visible := False;
        btnCopiarUteis.Visible := False;
        txtUteis.Text := '1º passo - gfix -v -f SAC4WIN2.fdb -user SYSDBA -pass masterkey' + sLineBreak +
                           '2º passo - gfix -m -i SAC4WIN2.fdb -user SYSDBA -pass masterkey' + sLineBreak +
                           '3º passo - gbak -g -b -z -l -v SAC4WIN2.fdb SAC4WINbkp.fbk -user SYSDBA -pass masterkey' + sLineBreak +
                           '4º passo - gbak -g -c -z -v SAC4WINbkp.fbk  SAC4WINnewbkp.fdb -user SYSDBA -pass masterkey';
      end
    else if opcoesUteis.Text = 'Configurar CPU e RAM para Firebird' then
      begin
        lb_aviso.Visible := False;
        pn_perguntas.Top := 110;
        pn_perguntas.Left := 1;
        pn_base.Visible := False;
        pn_perguntas.Visible := True;
        txtUteis.Visible := False;
        btnCopiarUteis.Visible := False;
        txtUteis.Text := '';
      end
      else if opcoesUteis.Text = 'Deletão' then
      begin
        pn_base.Visible := False;
        txtUteis.Visible := True;
        btnCopiarUteis.Visible := True;
        txtUteis.Height := 150;
        btnCopiarUteis.Top := btnCopiarUteis.Top + 117;
        lb_aviso.Visible := False;
        pn_perguntas.Visible := False;
        txtUteis.Text := 'delete from AUDITORIA;' + sLineBreak +
                         'delete from COMPRAS;' + sLineBreak +
                         'delete from ECFPOSICAOTRIB;' + sLineBreak +
                         'delete from r01;' + sLineBreak +
                         'delete from r02;' + sLineBreak +
                         'delete from r03;' + sLineBreak +
                         'delete from r06;' + sLineBreak +
                         'delete from r07;' + sLineBreak +
                         'delete from NFMASTER;' + sLineBreak +
                         'delete from NUMEROSERIES;' + sLineBreak +
                         'delete from SOBOX;' + sLineBreak +
                         'delete from VENDAS;' + sLineBreak +
                         'delete from turnos;' + sLineBreak +
                         'delete from INVENTARIOS;' + sLineBreak +
                         'delete from ESTOQUEDIA;' + sLineBreak +
                         'delete from PRODUTOSAUX;';
      end;
  end;

function ram4(): String;
  begin
    Result := 'DefaultDbCachePages = 4096' + sLineBreak +
              'FileSystemCacheThreshold = 67108864' + sLineBreak;
  end;

function ram8(): String;
  begin
    Result := 'DefaultDbCachePages = 8192' + sLineBreak +
              'FileSystemCacheThreshold = 134217728' + sLineBreak;
  end;

function ram16(): String;
  begin
    Result := 'DefaultDbCachePages = 16384' + sLineBreak +
              'FileSystemCacheThreshold = 268435456' + sLineBreak;
  end;

function cpu2():String;
  begin
    Result := 'CpuAffinityMask = 3' + sLineBreak;
  end;

function cpu4():String;
  begin
    Result := 'CpuAffinityMask = 15' + sLineBreak;
  end;

function cpu6():String;
  begin
    Result := 'CpuAffinityMask = 63' + sLineBreak;
  end;

function cpu8():String;
  begin
    Result := 'CpuAffinityMask = 255' + sLineBreak;
  end;

function servidorSim():String;
  begin
    Result := 'FileSystemCacheSize = 70' + sLineBreak;
  end;

function servidorNao():String;
  begin
    Result := 'FileSystemCacheSize = 50' + sLineBreak;
  end;

procedure Tfrm_SGA_Principal.rb_CPU2Click(Sender: TObject);
begin
  txt_cpu.Text := '';
  txt_cpu.Text := cpu2();
  txt_Firebird.Text := txt_cpu.Text + txt_memoria.Text + txt_servidor.Text;
end;

procedure Tfrm_SGA_Principal.rb_CPU4Click(Sender: TObject);
begin
  txt_cpu.Text := '';
  txt_cpu.Text := cpu4();
  txt_Firebird.Text := txt_cpu.Text + txt_memoria.Text + txt_servidor.Text;
end;

procedure Tfrm_SGA_Principal.rb_CPU6Click(Sender: TObject);
begin
  txt_cpu.Text := '';
  txt_cpu.Text := cpu6();
  txt_Firebird.Text := txt_cpu.Text + txt_memoria.Text + txt_servidor.Text;
end;

procedure Tfrm_SGA_Principal.rb_CPU8Click(Sender: TObject);
begin
  txt_cpu.Text := '';
  txt_cpu.Text := cpu8();
  txt_Firebird.Text := txt_cpu.Text + txt_memoria.Text + txt_servidor.Text;
end;

procedure Tfrm_SGA_Principal.rb_RAM16Click(Sender: TObject);
begin
  txt_memoria.Text := '';
  txt_memoria.Text := ram16();
  txt_Firebird.Text := txt_cpu.Text + txt_memoria.Text + txt_servidor.Text;
end;

procedure Tfrm_SGA_Principal.rb_RAM4Click(Sender: TObject);
begin
  txt_memoria.Text := '';
  txt_memoria.Text := ram4();
  txt_Firebird.Text := txt_cpu.Text + txt_memoria.Text + txt_servidor.Text;
end;

procedure Tfrm_SGA_Principal.rb_RAM8Click(Sender: TObject);
begin
  txt_memoria.Text := '';
  txt_memoria.Text := ram8();
  txt_Firebird.Text := txt_cpu.Text + txt_memoria.Text + txt_servidor.Text;
end;

procedure Tfrm_SGA_Principal.rb_serverSimClick(Sender: TObject);
begin
  txt_servidor.Text := '';
  txt_servidor.Text := servidorSim();
  txt_Firebird.Text := txt_cpu.Text + txt_memoria.Text + txt_servidor.Text;
end;

procedure Tfrm_SGA_Principal.rb_serverNaoClick(Sender: TObject);
begin
  txt_servidor.Text := '';
  txt_servidor.Text := servidorNao();
  txt_Firebird.Text := txt_cpu.Text + txt_memoria.Text + txt_servidor.Text;
end;

procedure Tfrm_SGA_Principal.btn_comoUsarClick(Sender: TObject);
var
  valorFirebird : String;
begin
  if txt_cpu.Text = '' then
    begin
      valorFirebird := 'CpuAffinityMask = 1';
    end
  else
    begin
      valorFirebird :=  txt_cpu.Text;
    end;

  ShowMessage('Localizar esses campos dentro do arquivo firebird.conf que está na pasta do Firebird' + sLineBreak +
              'Tirar o "#" antes do nome do campo, por exemplo:' + sLineBreak +
              'O padrão é assim: #CpuAffinityMask = 1' + sLineBreak +
              'Deixar assim => ' + valorFirebird + sLineBreak +
              sLineBreak + 'É recomendavel usar Firebird Classic');
end;

end.
