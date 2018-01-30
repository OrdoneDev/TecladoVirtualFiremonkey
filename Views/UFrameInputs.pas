unit UFrameInputs;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation;

type
  TFrameInputs = class(TFrame)
    lytBackground: TLayout;
    lytNomeProduto: TLayout;
    lytCodigo: TLayout;
    lblNomeProduto: TLabel;
    lblCodigo: TLabel;
    edtNomeProduto: TEdit;
    edtCodigo: TEdit;
    lytValor: TLayout;
    lblValor: TLabel;
    edtValor: TEdit;
    Label1: TLabel;
    procedure edtNomeProdutoClick(Sender: TObject);
    procedure edtNomeProdutoExit(Sender: TObject);
    procedure edtValorClick(Sender: TObject);
    procedure edtNumpadExit(Sender: TObject);
    procedure edtCodigoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(_AOwner: TComponent); override;
    procedure Release; override;
  end;

var
  FrameInputs: TFrameInputs;

implementation

uses
  ULibrary;

{$R *.fmx}

{ TFrameInputs }

constructor TFrameInputs.Create(_AOwner: TComponent);
begin
  inherited;
  Parent := TFmxObject(_AOwner);
end;

procedure TFrameInputs.edtNomeProdutoClick(Sender: TObject);
begin
  OnKeyboard(Sender);
end;

procedure TFrameInputs.edtNomeProdutoExit(Sender: TObject);
begin
  OffKeyboard;
end;

procedure TFrameInputs.edtCodigoClick(Sender: TObject);
begin
  //Teclado numpad integer
  OnNumPad(Sender, true);
end;

procedure TFrameInputs.edtValorClick(Sender: TObject);
begin
  //Teclado numpad float
  OnNumPad(Sender, false);
end;

procedure TFrameInputs.Release;
begin
  Name := '';
  inherited;
  FrameInputs := nil;
end;

procedure TFrameInputs.edtNumpadExit(Sender: TObject);
begin
  OffNumPad;
end;

end.
