program KeyboardExample;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  System.StartUpCopy,
  FMX.Forms,
  UFormMain in 'UFormMain.pas' {FormMain},
  UFrameKeyboard in 'Views\UFrameKeyboard.pas' {FrameKeyboard: TFrame},
  UFrameNumpad in 'Views\UFrameNumpad.pas' {FrameNumpad: TFrame},
  ULibrary in 'Library\ULibrary.pas',
  UFrameInputs in 'Views\UFrameInputs.pas' {FrameInputs: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
