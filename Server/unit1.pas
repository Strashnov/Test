unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, IdIPWatch,
  IdSSLOpenSSL, IdServerInterceptLogFile, IdTCPServer, IdCustomTCPServer,
  IdContext, IdIntercept, IdInterceptThrottler, IdIOHandlerStream,
  IdServerIOHandlerStack;

type

  { TForm1 }

  TForm1 = class(TForm)
    IdIPWatch: TIdIPWatch;
    IdServerInterceptLogFile1: TIdServerInterceptLogFile;
    IdServerIOHandlerStack: TIdServerIOHandlerStack;
    IdTCPServer: TIdTCPServer;
    Memo: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdTCPServerExecute(AContext: TIdContext);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.IdTCPServerExecute(AContext: TIdContext);
begin
  Memo.Lines.Add(AContext.Connection.Socket.ReadLn());
  AContext.Connection.Disconnect;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption:=IdIPWatch.LocalIP;
end;

end.

