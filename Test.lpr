program Test;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Main, About, runtimetypeinfocontrols, tachartlazaruspkg,
  printer4lazarus;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformAbout, formAbout);
  Application.Run;
end.

