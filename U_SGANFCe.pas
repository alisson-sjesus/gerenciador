unit U_SGANFCe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.RegularExpressions, Clipbrd;

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
    procedure btn_GerarClick(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
    procedure btn_CopiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    var
    regex: TRegEx;
    Matches: TMatchCollection;
    txtNFCeFormat : String;
  end;

var
  frm_SGA_Principal: Tfrm_SGA_Principal;

implementation

{$R *.dfm}

procedure Tfrm_SGA_Principal.btn_CopiarClick(Sender: TObject);
begin
  Clipboard.AsText := txtNFCeOutput.Text;
  ShowMessage('Numera��o copiada com sucesso!');
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
      ShowMessage('Campo j� est� limpo');
    end
    else

    begin
      txtNFCeOutput.Text := '';
      txtNFCe.Text := '';
    end;

end;

end.
