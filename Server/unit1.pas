unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, SQLDBLib, DB, IBConnection, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBGrids, IdIPWatch, IdSSLOpenSSL,
  IdServerInterceptLogFile, IdTCPServer, IdCustomTCPServer, IdContext,
  IdIntercept, IdInterceptThrottler, IdIOHandlerStream, IdServerIOHandlerStack;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource: TDataSource;
    DBGrid1: TDBGrid;
    IBConnection: TIBConnection;
    IdIPWatch: TIdIPWatch;
    IdServerInterceptLogFile1: TIdServerInterceptLogFile;
    IdServerIOHandlerStack: TIdServerIOHandlerStack;
    IdTCPServer: TIdTCPServer;
    Memo: TMemo;
    SQLDBLibraryLoader: TSQLDBLibraryLoader;
    SQLQuery: TSQLQuery;
    SQLTransaction: TSQLTransaction;
    procedure FormCreate(Sender: TObject);
    procedure IdTCPServerExecute(AContext: TIdContext);
  private
    MessageFromClient:String;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.IdTCPServerExecute(AContext: TIdContext);
begin
  MessageFromClient:=AContext.Connection.Socket.ReadLn();
  Memo.Lines.Add('Value: '+MessageFromClient+'  '+'time stamp '+DateTimeToStr(now));
  SQLQuery.Append;
  SQLQuery.FieldByName('data_client').AsString:=MessageFromClient;
  SQLQuery.Post;
  SQLQuery.ApplyUpdates;
  AContext.Connection.Disconnect;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption:=IdIPWatch.LocalIP;
end;

end.

