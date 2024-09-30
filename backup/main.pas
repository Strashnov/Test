unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Menus, About, TAGraph, TASeries, PrintersDlgs, Printers;

type

  { TformMain }

  TformMain = class(TForm)
    btnRandom: TButton;
    Button1: TButton;
    Image1: TImage;
    imgSensorScalePressure: TImage;
    labNumber: TLabel;
    labPressure: TLabel;
    MainMenu: TMainMenu;
    miExit: TMenuItem;
    miSeparatorFileOne: TMenuItem;
    miPrint: TMenuItem;
    miAbout: TMenuItem;
    miHelp: TMenuItem;
    miFile: TMenuItem;
    PageSetupDialog: TPageSetupDialog;
    PrintDialog: TPrintDialog;
    shpSensorScale: TShape;
    TimerRandom: TTimer;
    tbPressure: TTrackBar;
    procedure btnRandomClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure TimerRandomTimer(Sender: TObject);
    procedure tbPressureChange(Sender: TObject);
  private

  public

  end;

var
  formMain: TformMain;

implementation

{$R *.lfm}

{ TformMain }

procedure TformMain.FormCreate(Sender: TObject);
begin
  shpSensorScale.Canvas.Pen.Width := 5;
  shpSensorScale.Canvas.Pen.Color := clGreen;
  shpSensorScale.Canvas.MoveTo(imgSensorScalePressure.ClientWidth div 2, imgSensorScalePressure.ClientHeight div 2);
  shpSensorScale.Canvas.LineTo(43, 136);
  labPressure.Visible := False;
end;

procedure TformMain.miAboutClick(Sender: TObject);
begin
  formAbout.ShowModal;
end;

procedure TformMain.miExitClick(Sender: TObject);
begin
  Application.Terminate; //Close all form
end;

procedure TformMain.miPrintClick(Sender: TObject);
var BufferCombiningShapeImage:TImage;
begin
  if PrintDialog.Execute then
    Printer.BeginDoc;
    try
     BufferCombiningShapeImage:=TImage.Create(self);
     BufferCombiningShapeImage.Stretch:=True;
     BufferCombiningShapeImage.Height:=200;
     BufferCombiningShapeImage.Width:=200;
     try
      BufferCombiningShapeImage.Canvas.CopyRect(shpSensorScale.ClientRect,
       imgSensorScalePressure.Canvas, Rect(0,0,200,200));
      Printer.Canvas.StretchDraw(Rect(0, 0, 2000, 2000),
       BufferCombiningShapeImage.Picture.Bitmap);
     finally
       BufferCombiningShapeImage.Free;
     end;
    finally
      Printer.EndDoc;
    end;
end;

procedure TformMain.TimerRandomTimer(Sender: TObject);
begin
  Randomize;
  tbPressure.Position := Random(10);
end;
//Программу написал на скорую руку так как под lazarus нету кода. Обычно работаю на Delphi 12.1
procedure TformMain.tbPressureChange(Sender: TObject);
begin
  shpSensorScale.Refresh;
  shpSensorScale.Canvas.Pen.Width := 5;
  shpSensorScale.Canvas.MoveTo(imgSensorScalePressure.ClientWidth div 2, imgSensorScalePressure.ClientHeight div 2);
  case tbPressure.Position of
    0:
      begin
        labPressure.Visible := False;
        shpSensorScale.Canvas.Pen.Color := clGreen;
        shpSensorScale.Canvas.LineTo(43, 136);
        labNumber.Caption := '0';
        labNumber.Font.Color := clGreen;
      end;
    1:
      begin
        labPressure.Visible := False;
        shpSensorScale.Canvas.Pen.Color := clGreen;
        shpSensorScale.Canvas.LineTo(33, 110);
        labNumber.Caption := '20';
        labNumber.Font.Color := clGreen;
      end;
    2:
      begin
        labPressure.Visible := False;
        shpSensorScale.Canvas.Pen.Color := clGreen;
        shpSensorScale.Canvas.LineTo(35, 81);
        labNumber.Caption := '40';
        labNumber.Font.Color := clGreen;
      end;
    3:
      begin
        labPressure.Visible := False;
        shpSensorScale.Canvas.Pen.Color := clGreen;
        shpSensorScale.Canvas.LineTo(49, 56);
        labNumber.Caption := '60';
        labNumber.Font.Color := clGreen;
      end;
    4:
      begin
        labPressure.Visible := False;
        shpSensorScale.Canvas.Pen.Color := clGreen;
        shpSensorScale.Canvas.LineTo(71, 41);
        labNumber.Caption := '80';
        labNumber.Font.Color := clGreen;
      end;
    5:
      begin
        labPressure.Visible := False;
        shpSensorScale.Canvas.Pen.Color := clYellow;
        shpSensorScale.Canvas.LineTo(98, 33);
        labNumber.Caption := '100';
        labNumber.Font.Color := clYellow;
      end;
    6:
      begin
        labPressure.Visible := False;
        shpSensorScale.Canvas.Pen.Color := clYellow;
        shpSensorScale.Canvas.LineTo(126, 40);
        labNumber.Caption := '120';
        labNumber.Font.Color := clYellow;
      end;
    7:
      begin
        labPressure.Visible := False;
        shpSensorScale.Canvas.Pen.Color := clYellow;
        shpSensorScale.Canvas.LineTo(150, 59);
        labNumber.Caption := '140';
        labNumber.Font.Color := clYellow;
      end;
    8:
      begin
        Beep;
        labPressure.Visible := True;
        shpSensorScale.Canvas.Pen.Color := clRed;
        shpSensorScale.Canvas.LineTo(162, 82);
        labNumber.Caption := '160';
        labNumber.Font.Color := clRed;
      end;
    9:
      begin
        Beep;
        labPressure.Visible := True;
        shpSensorScale.Canvas.Pen.Color := clRed;
        shpSensorScale.Canvas.LineTo(163, 111);
        labNumber.Caption := '180';
        labNumber.Font.Color := clRed;
      end;
    10:
      begin
        Beep;
        labPressure.Visible := True;
        shpSensorScale.Canvas.Pen.Color := clRed;
        shpSensorScale.Canvas.LineTo(151, 137);
        labNumber.Caption := '200';
        labNumber.Font.Color := clRed;
      end;
  end;
end;

procedure TformMain.btnRandomClick(Sender: TObject);
begin
 TimerRandom.Enabled := True;
end;



end.

