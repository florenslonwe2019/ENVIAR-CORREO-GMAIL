unit CORREO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdMessage, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP;

type
  TForm1 = class(TForm)
    EDUSUARIO: TEdit;
    EDCONTRA: TEdit;
    EdAsunto: TEdit;
    EDDESTINATARIO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    SMTP: TIdSMTP;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    DATA: TIdMessage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
   procedure ConfiguararFormulario;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
begin
     TRY
       smtp.Username:=EDUSUARIO.Text;
       smtp.Password:=EDCONTRA.Text;

       data.Subject:=EdAsunto.Text;
       data.Recipients.EMailAddresses:=EDDESTINATARIO.Text;
       data.Body:=Memo1.Lines;

        TRY
          SMTP.Connect;
          SMTP.Send(DATA);

        FINALLY
          SMTP.Disconnect(TRUE);
          ShowMessage('CORREO ENVIADO');
        END;


     Except
         on E:Exception do
         ShowMessage(E.Message);

     END;
end;

procedure TForm1.ConfiguararFormulario;
begin
      position:=poScreenCenter;
      BorderStyle:=bsToolWindow;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 ConfiguararFormulario;
end;

end.
