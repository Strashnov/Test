unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, IdIPWatch,
  IdTCPServer, IdCustomTCPServer, IdContext;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    IdIPWatch1: TIdIPWatch;
    IdTCPServer1: TIdTCPServer;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdTCPServer1Execute(AContext: TIdContext);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.IdTCPServer1Execute(AContext: TIdContext);
begin
  Memo1.Lines.Add(AContext.Connection.Socket.ReadLn());
  AContext.Connection.Disconnect;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption:=IdIPWatch1.LocalIP;
end;

end.

