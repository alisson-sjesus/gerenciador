unit U_SGANFCe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

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
  private
    { Private declarations }
  public
    var
    txtFormatado : String;
  end;

var
  frm_SGA_Principal: Tfrm_SGA_Principal;

implementation

{$R *.dfm}

procedure Tfrm_SGA_Principal.btn_GerarClick(Sender: TObject);
begin
txtFormatado := txtNFCe.Text;
txtNFCeOutput.Text := txtFormatado;
end;

end.
