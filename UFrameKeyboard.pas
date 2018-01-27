unit UFrameKeyboard;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Ani;

type
  TFrameKeyboard = class(TFrame)
    pBackground: TPanel;
    lytMostTop: TLayout;
    lytTopMostTop: TLayout;
    lytTopTop: TLayout;
    lytBottom: TLayout;
    btnApostrofo: TCornerButton;
    btnDel: TCornerButton;
    btnBackspace: TCornerButton;
    btnIgual: TCornerButton;
    btnTraco: TCornerButton;
    btn0: TCornerButton;
    btn9: TCornerButton;
    btn7: TCornerButton;
    btn6: TCornerButton;
    btn5: TCornerButton;
    btn4: TCornerButton;
    btn3: TCornerButton;
    btn2: TCornerButton;
    btn1: TCornerButton;
    btnq: TCornerButton;
    btnw: TCornerButton;
    btne: TCornerButton;
    btnr: TCornerButton;
    btnt: TCornerButton;
    btny: TCornerButton;
    btnu: TCornerButton;
    btnAbreColchete: TCornerButton;
    btnAcentoAgudo: TCornerButton;
    btnp: TCornerButton;
    btno: TCornerButton;
    btni: TCornerButton;
    btna: TCornerButton;
    btns: TCornerButton;
    btnd: TCornerButton;
    btnf: TCornerButton;
    btng: TCornerButton;
    btnh: TCornerButton;
    btnj: TCornerButton;
    btnFechaColchete: TCornerButton;
    btnTil: TCornerButton;
    btnccidilha: TCornerButton;
    btnl: TCornerButton;
    btnk: TCornerButton;
    btnShift: TCornerButton;
    btnBarraInvertida: TCornerButton;
    btnz: TCornerButton;
    btnx: TCornerButton;
    btnc: TCornerButton;
    btnv: TCornerButton;
    btnb: TCornerButton;
    btnBarra: TCornerButton;
    btnUp: TCornerButton;
    btnPontoEVirgula: TCornerButton;
    btnPonto: TCornerButton;
    btnVirgula: TCornerButton;
    btnn: TCornerButton;
    lytMostBottom: TLayout;
    btnEspaco: TCornerButton;
    btnRight: TCornerButton;
    btnDown: TCornerButton;
    btnLeft: TCornerButton;
    btnm: TCornerButton;
    btn8: TCornerButton;
    lytTop: TLayout;
    lytDoisLyts: TLayout;
    lytEnter: TLayout;
    lytTresLyts: TLayout;
    btnEnter: TCornerButton;
    btnCapslook: TCornerButton;
    FloatAnimation1: TFloatAnimation;
    btnExit: TCornerButton;
    procedure KeyPress(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnBackspaceClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnCapslookClick(Sender: TObject);
    procedure btnShiftClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
    SenderFocus: TObject;
    Capslook: boolean;
    Shift: boolean;

    procedure FloatMoving;
    procedure ModifyOnShift;
    procedure CancelShift;
  public
    { Public declarations }
    constructor Create(_AOwner: TComponent; _SenderFocus: TObject); overload;
    procedure Release; override;
  end;

var
  FrameKeyboard: TFrameKeyboard;

implementation

uses
  ULibrary, FMX.ComboEdit;

{$R *.fmx}

{ TFramePad }

procedure TFrameKeyboard.KeyPress(Sender: TObject);
begin
  InputKeyPress(SenderFocus, TCornerButton(Sender).Text);
  CancelShift;
end;

procedure TFrameKeyboard.ModifyOnShift;
begin
  case Shift of
    true:
    begin
      btnApostrofo.Text       := '"';
      btn1.Text               := '!';
      btn2.Text               := '@';
      btn3.Text               := '#';
      btn4.Text               := '$';
      btn5.Text               := '%';
      btn6.Text               := '¨';
      btn7.Text               := '&&';
      btn8.Text               := '*';
      btn9.Text               := '(';
      btn0.Text               := ')';
      btnTraco.Text           := '_';
      btnIgual.Text           := '+';
      btnAcentoAgudo.Text     := '`';
      btnAbreColchete.Text    := '{';
      btnTil.Text             := '^';
      btnFechaColchete.Text   := '}';
      btnBarraInvertida.Text  := '|';
      btnVirgula.Text         := '<';
      btnPonto.Text           := '>';
      btnPontoEVirgula.Text   := ':';
      btnBarra.Text           := '?';
    end;

    false:
    begin
      btnApostrofo.Text       := '''';
      btn1.Text               := '1';
      btn2.Text               := '2';
      btn3.Text               := '3';
      btn4.Text               := '4';
      btn5.Text               := '5';
      btn6.Text               := '6';
      btn7.Text               := '7';
      btn8.Text               := '8';
      btn9.Text               := '9';
      btn0.Text               := '0';
      btnTraco.Text           := '-';
      btnIgual.Text           := '=';
      btnAcentoAgudo.Text     := '´';
      btnAbreColchete.Text    := '[';
      btnTil.Text             := '~';
      btnFechaColchete.Text   := ']';
      btnBarraInvertida.Text  := '\';
      btnVirgula.Text         := ',';
      btnPonto.Text           := '.';
      btnPontoEVirgula.Text   := ';';
      btnBarra.Text           := '/';
    end;
  end;
end;

procedure TFrameKeyboard.btnBackspaceClick(Sender: TObject);
begin
  InputKeyBackSpace(SenderFocus);
  CancelShift;
end;

procedure TFrameKeyboard.btnCapslookClick(Sender: TObject);
begin
  Capslook  := not Capslook;

  InputKeyInsured(Sender, Capslook);
  ToUpperExecute(lytBottom, Capslook);
  ToUpperExecute(lytTopMostTop, Capslook);
  ToUpperExecute(lytTopTop, Capslook);
end;

procedure TFrameKeyboard.btnDelClick(Sender: TObject);
begin
  InputKeyDel(SenderFocus);
  CancelShift;
end;

procedure TFrameKeyboard.btnDownClick(Sender: TObject);
begin
  InputKeyDown(SenderFocus);
  CancelShift;
end;

procedure TFrameKeyboard.btnEnterClick(Sender: TObject);
begin
  InputKeyEnter(SenderFocus);
  CancelShift;
end;

procedure TFrameKeyboard.btnExitClick(Sender: TObject);
begin
  Release;
end;

procedure TFrameKeyboard.btnLeftClick(Sender: TObject);
begin
  InputKeyLeft(SenderFocus);
end;

procedure TFrameKeyboard.btnRightClick(Sender: TObject);
begin
  InputKeyRight(SenderFocus);
end;

procedure TFrameKeyboard.btnShiftClick(Sender: TObject);
begin
  Shift := not Shift;

  InputKeyInsured(Sender, Shift);
  ToUpperExecute(lytBottom, Shift);
  ToUpperExecute(lytTopMostTop, Shift);
  ToUpperExecute(lytTopTop, Shift);
  ModifyOnShift;
end;

procedure TFrameKeyboard.btnUpClick(Sender: TObject);
begin
  InputKeyUp(SenderFocus);
  CancelShift;
end;

constructor TFrameKeyboard.Create(_AOwner: TComponent; _SenderFocus: TObject);
begin
  inherited Create(_AOwner);
  Parent      := TFmxObject(_AOwner);
  SenderFocus := _SenderFocus;
  Capslook    := false;
  Shift       := false;

  FloatMoving;
end;

procedure TFrameKeyboard.FloatMoving;
begin
  FloatAnimation1.Enabled := true;
end;

procedure TFrameKeyboard.Release;
begin
  Name := '';

  pBackground.Controls.Clear;
  inherited;

  FramePad := nil;
end;

procedure TFrameKeyboard.CancelShift;
begin
  if Shift then
    btnShiftClick(btnShift);
end;

end.
