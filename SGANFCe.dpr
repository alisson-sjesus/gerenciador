program SGANFCe;

uses
  Vcl.Forms,
  U_SGANFCe in 'U_SGANFCe.pas' {frm_SGA_Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_SGA_Principal, frm_SGA_Principal);
  Application.Run;
end.
