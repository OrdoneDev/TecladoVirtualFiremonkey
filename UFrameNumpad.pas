unit UFrameNumpad;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Ani;

type
  TFrameNumpad = class(TFrame)
    lytNumsTop: TLayout;
    lytNumsClient: TLayout;
    lytBtnEnter: TLayout;
    lytNums2: TLayout;
    lytNums0: TLayout;
    lytNums1: TLayout;
    lytNums: TLayout;
    btn7: TCornerButton;
    btn9: TCornerButton;
    btn8: TCornerButton;
    btnPlus: TCornerButton;
    btn4: TCornerButton;
    btn5: TCornerButton;
    btn6: TCornerButton;
    btnEnter: TCornerButton;
    btn3: TCornerButton;
    btn1: TCornerButton;
    btn2: TCornerButton;
    btn0: TCornerButton;
    btn00: TCornerButton;
    btnvirgula: TCornerButton;
    pBackground: TPanel;
    lytNumsMosttop: TLayout;
    btnBarra: TCornerButton;
    btnTraco: TCornerButton;
    btnAsterisco: TCornerButton;
    btnBackspace: TCornerButton;
    FloatAnimation1: TFloatAnimation;
    btnExit: TCornerButton;
    procedure KeyNums(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnBackspaceClick(Sender: TObject);
    procedure KeyCaracters(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
    SenderFocus: TObject;
    PadInteger: boolean;

    procedure FloatMoving;
  public
    { Public declarations }
    constructor Create(_AOwner: TComponent; _SenderFocus: TObject; _PadInteger: boolean); overload;
    procedure Release; override;
  end;

var
  FrameNumpad: TFrameNumpad;

implementation

uses
  FMX.Edit, ULibrary;

{$R *.fmx}

{ TFrameNumpad }

procedure TFrameNumpad.KeyNums(Sender: TObject);
begin
  InputKeyPress(SenderFocus, TCornerButton(Sender).Text);
end;

procedure TFrameNumpad.KeyCaracters(Sender: TObject);
begin
  if not PadInteger then
    InputKeyPress(SenderFocus, TCornerButton(Sender).Text);
end;

procedure TFrameNumpad.btnEnterClick(Sender: TObject);
begin
  InputKeyEnter(SenderFocus);
end;

procedure TFrameNumpad.btnExitClick(Sender: TObject);
begin
  Release;
end;

procedure TFrameNumpad.btnBackspaceClick(Sender: TObject);
begin
  InputKeyBackSpace(SenderFocus);
end;

constructor TFrameNumpad.Create(_AOwner: TComponent; _SenderFocus: TObject; _PadInteger: boolean);
begin
  inherited Create(_AOwner);
  Parent      := TFmxObject(_AOwner);
  SenderFocus := _SenderFocus;
  PadInteger  := _PadInteger;

  FloatMoving;
end;

procedure TFrameNumpad.FloatMoving;
begin
  FloatAnimation1.Enabled := true;
end;

procedure TFrameNumpad.Release;
begin
  Name := '';

  inherited;

  FrameNumpad := nil;
end;

end.
