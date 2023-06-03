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
  private
    { Private declarations }
  public
    var
    regex: TRegEx;
    Matches: TMatchCollection;
    txtNFCeFormat, nfceOutput : String;
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
    ShowMessage('Numera��o copiada com sucesso!');
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
      MessageDlg('Cole as numera��es das NFC-es no campo de texto', mtWarning, [mbOK], 0);
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
        ShowMessage('Campo j� est� limpo');
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
    else if opcoesScript.Text = 'Exportar movimenta��o' then
      begin
        txtScripts.Text := 'select n.* from nfmaster n' + sLineBreak +
                           '--join nfdet d on n.idnfmaster = d.idnfmaster' + sLineBreak +
                           '--join vendas v on v.idnfmaster = n.idnfmaster' + sLineBreak +
                           '--join areceber a on v.idcompra = a.idcompra' + sLineBreak +
                           'where n.situacao = 0 and n.serie = ''NFC-E'' and n.dataentsai between ' + dataMesPassado();
      end
    else if opcoesScript.Text = 'Exportar movimenta��o (Utilizar numera��o de NFC-e)' then
      begin
          txtScripts.Text := 'select n.* from nfmaster n' + sLineBreak +
          '--join nfdet d on n.idnfmaster = d.idnfmaster' + sLineBreak +
          '--join vendas v on v.idnfmaster = n.idnfmaster' + sLineBreak +
          '--join areceber a on v.idcompra = a.idcompra' + sLineBreak +
          'where n.situacao = 0 and n.serie = ''NFC-E'' and n.dataentsai between ' + dataMesPassado() + sLineBreak +
          'and numnota in (' + nfceOutput + ')';
      end
      else if opcoesScript.Text = '- Selecione uma op��o -' then
        begin
        txtScripts.Text := '';
        end;

  end;

procedure Tfrm_SGA_Principal.opcoesUteisChange(Sender: TObject);
  begin
    if opcoesUteis.Text = 'Portas do Firewall' then
      begin
        pn_base.Visible := False;
        txtUteis.Visible := True;
        btnCopiarUteis.Visible := True;
        lb_aviso.Visible := False;
        txtUteis.Text := '65123, 65100, 64123, 9092, 4899, 4096, 3050,992, 993, 995, 587, 465, 445, 80, 21';
      end
    else if opcoesUteis.Text = 'Reparar base corrompida' then
      begin
        lb_aviso.Top := 400;
        lb_aviso.Visible := True;
        pn_base.Top := 144;
        pn_base.Visible := True;
        txtUteis.Visible := False;
        btnCopiarUteis.Visible := False;
        txtUteis.Text := '1� passo - gfix -v -f SAC4WIN2.fdb -user SYSDBA -pass masterkey' + sLineBreak +
                           '2� passo - gfix -m -i SAC4WIN2.fdb -user SYSDBA -pass masterkey' + sLineBreak +
                           '3� passo - gbak -g -b -z -l -v SAC4WIN2.fdb SAC4WINbkp.fbk -user SYSDBA -pass masterkey' + sLineBreak +
                           '4� passo - gbak -g -c -z -v SAC4WINbkp.fbk  SAC4WINnewbkp.fdb -user SYSDBA -pass masterkey';
      end
    else
      begin
        txtScripts.Text := 'Oi :)';
      end;
  end;

end.
