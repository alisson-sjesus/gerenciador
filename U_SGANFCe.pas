unit U_SGANFCe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.RegularExpressions, Clipbrd,
  Vcl.Menus, System.DateUtils;

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
    procedure btn_GerarClick(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
    procedure btn_CopiarClick(Sender: TObject);
    procedure opcoesScriptChange(Sender: TObject);
    procedure btnCopiarScriptClick(Sender: TObject);
  private
    { Private declarations }
  public
    var
    regex: TRegEx;
    Matches: TMatchCollection;
    txtNFCeFormat : String;
    dataAtual: TDateTime;
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

procedure Tfrm_SGA_Principal.btn_CopiarClick(Sender: TObject);
begin
  Clipboard.AsText := txtNFCeOutput.Text;
  ShowMessage('Numeração copiada com sucesso!');
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
  regex := TRegEx.Create('(?:0{2,})(\d+)(?:\s\d+)?', [roIgnoreCase, roMultiLine]);
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
    end;

end;

procedure Tfrm_SGA_Principal.opcoesScriptChange(Sender: TObject);
begin
  if opcoesScript.Text = 'NFC-es pendentes' then
    begin
      txtScripts.Text := 'select idnfmaster, 1 as tratado, subserie, current_timestamp as datahora, 0 as cstat from nfmaster';
    end
    else if opcoesScript.Text = 'Exportar movimentação' then
    begin
      txtScripts.Text := 'select n.* from nfmaster n' + sLineBreak +
                         '--join nfdet d on n.idnfmaster = d.idnfmaster' + sLineBreak +
                         '--join vendas v on v.idnfmaster = n.idnfmaster' + sLineBreak +
                         '--join areceber a on v.idcompra = a.idcompra' + sLineBreak +
                         'where n.situacao = 0 and n.serie = ''NFC-E'' and n.dataentsai between ''01.03.2023'' and ''31.03.2023''';
    end
    else if opcoesScript.Text = 'Exportar movimentação (Utilizar numeração de NFC-e)' then
      begin
        txtScripts.Text := 'select n.* from nfmaster n' + sLineBreak +
        '--join nfdet d on n.idnfmaster = d.idnfmaster' + sLineBreak +
        '--join vendas v on v.idnfmaster = n.idnfmaster' + sLineBreak +
        '--join areceber a on v.idcompra = a.idcompra' + sLineBreak +
        'where n.situacao = 0 and n.serie = ''NFC-E'' and n.dataentsai between ''01.03.2023'' and ''31.03.2023''' + sLineBreak +
        'and numnota in (' + txtNFCeOutput.Text + ')';
      end;
         
end;

end.
