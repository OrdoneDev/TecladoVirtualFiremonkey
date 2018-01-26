unit UFramePad;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Ani;

type
  TFramePad = class(TFrame)
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
  public
    { Public declarations }
    constructor Create(_AOwner: TComponent; _SenderFocus: TObject); overload;
    procedure Release; override;
  end;

var
  FramePad: TFramePad;

implementation

uses
  ULibrary, FMX.ComboEdit;

{$R *.fmx}

{ TFramePad }

procedure TFramePad.KeyPress(Sender: TObject);
begin
  InputKeyPress(SenderFocus, TCornerButton(Sender).Text);

  if Shift then
    btnShiftClick(btnShift);
end;

procedure TFramePad.ModifyOnShift;
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

procedure TFramePad.btnBackspaceClick(Sender: TObject);
begin
  InputKeyBackSpace(SenderFocus);

  if Shift then
    btnShiftClick(btnShift);
end;

procedure TFramePad.btnCapslookClick(Sender: TObject);
begin
  Capslook  := not Capslook;

  InputKeyInsured(Sender, Capslook);
  ToUpperExecute(lytBottom, Capslook);
  ToUpperExecute(lytTopMostTop, Capslook);
  ToUpperExecute(lytTopTop, Capslook);
end;

procedure TFramePad.btnDelClick(Sender: TObject);
begin
  InputKeyDel(SenderFocus);

  if Shift then
    btnShiftClick(btnShift);
end;

procedure TFramePad.btnDownClick(Sender: TObject);
begin
  InputKeyDown(SenderFocus);

  if Shift then
    btnShiftClick(btnShift);
end;

procedure TFramePad.btnEnterClick(Sender: TObject);
begin
  InputKeyEnter(SenderFocus);

  if Shift then
    btnShiftClick(btnShift);
end;

procedure TFramePad.btnExitClick(Sender: TObject);
begin
  Release;
end;

procedure TFramePad.btnLeftClick(Sender: TObject);
begin
  InputKeyLeft(SenderFocus);
end;

procedure TFramePad.btnRightClick(Sender: TObject);
begin
  InputKeyRight(SenderFocus);
end;

procedure TFramePad.btnShiftClick(Sender: TObject);
begin
  Shift := not Shift;

  InputKeyInsured(Sender, Shift);
  ToUpperExecute(lytBottom, Shift);
  ToUpperExecute(lytTopMostTop, Shift);
  ToUpperExecute(lytTopTop, Shift);
  ModifyOnShift;
end;

procedure TFramePad.btnUpClick(Sender: TObject);
begin
  InputKeyUp(SenderFocus);

  if Shift then
    btnShiftClick(btnShift);
end;

constructor TFramePad.Create(_AOwner: TComponent; _SenderFocus: TObject);
begin
  inherited Create(_AOwner);
  Parent      := TFmxObject(_AOwner);
  SenderFocus := _SenderFocus;
  Capslook    := false;
  Shift       := false;

  FloatMoving;
end;

procedure TFramePad.FloatMoving;
begin
  FloatAnimation1.Enabled := true;
end;

procedure TFramePad.Release;
begin
  Name := '';

  pBackground.Controls.Clear;
  inherited;

  FramePad := nil;
end;

end.
