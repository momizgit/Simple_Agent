unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  process;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Process1: TProcess;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  str:Tstrings;
begin
  try
        Process1:=TProcess.Create(Form1);
        Process1.ShowWindow:=swoHIDE;
        //Process1.InheritHandles:=False;
        Process1.Options:=[poUsePipes,poWaitOnExit,poStderrToOutPut];
        //Process1.Options:=[poNoConsole];
        Process1.Executable:='PowerShell.exe';
        //Process1.Parameters.Add('Get-WmiObject -Class Win32_BIOS -ComputerName .;');
        Process1.Parameters.Add('Test-Connection 8.8.8.8;');
        Process1.Active:=True;
        Memo1.Lines.LoadFromStream(Process1.Output);
        Memo1.Lines.Append();
  finally
        Process1.Free;
  end;
end;

end.

