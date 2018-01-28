unit ULibrary;

interface

uses
  FMX.Layouts;

type
  TOnKeyboard = reference to procedure(_SenderFocus: TObject);
  TOffKeyboard = reference to procedure;

  TOnNumpad = reference to procedure(_SenderFocus: TObject; _PadInteger: boolean);
  TOffNumpad = reference to procedure;

procedure InputKeyPress(_SenderFocus: TObject; _KeyString: String);
procedure InputKeyBackSpace(_SenderFocus: TObject);
procedure InputKeyDel(_SenderFocus: TObject);
procedure InputKeyInsured(_Sender: TObject; _Status: boolean);
procedure ToUpperExecute(_Layout: TLayout; _Status: boolean);
procedure InputKeyEnter(_SenderFocus: TObject);
procedure InputKeyLeft(_SenderFocus: TObject);
procedure InputKeyRight(_SenderFocus: TObject);
procedure InputKeyUp(_SenderFocus: TObject);
procedure InputKeyDown(_SenderFocus: TObject);

var
  OnKeyboard: TOnKeyboard;
  OffKeyboard: TOffKeyboard;

  OnNumPad: TOnNumpad;
  OffNumPad: TOffNumpad;

implementation

uses
  System.SysUtils, FMX.Edit, System.UITypes, FMX.Controls,
  FMX.StdCtrls, FMX.ComboEdit;

procedure InputKeyPress(_SenderFocus: TObject; _KeyString: String);
var
  Part: String;
begin
  with TEdit(_SenderFocus) do
  begin
    Part          := Copy(Text, 0, CaretPosition);
    Text          := Part + _KeyString + Copy(Text, CaretPosition + 1, Text.Length);
    CaretPosition := CaretPosition + _KeyString.Length;
  end;
end;

procedure InputKeyBackSpace(_SenderFocus: TObject);
var
  Part: String;
  MoveCaret: Integer;
begin
  with TEdit(_SenderFocus) do
  begin
    if (SelStart = 0) and (SelLength = Text.Length) then
      TEdit(_SenderFocus).Text := ''
    else
    begin
      if CaretPosition = Text.Length then
        MoveCaret := CaretPosition
      else
        MoveCaret := CaretPosition - 1;

      Part          := Copy(Text, 0, CaretPosition - 1);
      Text          := Part + Copy(Text, CaretPosition + 1, Text.Length - 1);
      CaretPosition := MoveCaret;
    end;
  end;
end;

procedure InputKeyDel(_SenderFocus: TObject);
var
  Part: String;
begin
  with TEdit(_SenderFocus) do
  begin
    if (SelStart = 0) and (SelLength = Text.Length) then
      TEdit(_SenderFocus).Text := ''
    else
    begin
      Part  := Copy(Text, 0, CaretPosition);
      Text  := Part + Copy(Text, CaretPosition + 2, Text.Length - 1);
    end;
  end;
end;

procedure InputKeyInsured(_Sender: TObject; _Status: boolean);
begin
  if _Status then
    TCornerButton(_Sender).Text := TCornerButton(_Sender).Text + '^'
  else
    TCornerButton(_Sender).Text := TCornerButton(_Sender).Text.Replace('^', '');
end;

procedure ToUpperExecute(_Layout: TLayout; _Status: boolean);
var
  Temp1: TControl;
begin
  for Temp1 in _Layout.Controls do
  begin
    if Temp1.Tag = 1 then
    begin
      if _Status then
      begin
        if TCornerButton(Temp1).Text = TCornerButton(Temp1).Text.ToUpper then
          TCornerButton(Temp1).Text := TCornerButton(Temp1).Text.ToLower
        else
          TCornerButton(Temp1).Text := TCornerButton(Temp1).Text.ToUpper
      end
      else
      begin
        if TCornerButton(Temp1).Text = TCornerButton(Temp1).Text.ToLower then
          TCornerButton(Temp1).Text := TCornerButton(Temp1).Text.ToUpper
        else
          TCornerButton(Temp1).Text := TCornerButton(Temp1).Text.ToLower;
      end;
    end
  end;
end;

procedure InputKeyEnter(_SenderFocus: TObject);
var
  Key: Word;
  KeyChar: Char;
begin
  Key     := vkReturn;
  KeyChar := ' ';

  TEdit(_SenderFocus).OnKeyDown(_SenderFocus, Key, KeyChar, []);
end;

procedure InputKeyLeft(_SenderFocus: TObject);
begin
  TEdit(_SenderFocus).CaretPosition := TEdit(_SenderFocus).CaretPosition - 1;
end;

procedure InputKeyRight(_SenderFocus: TObject);
begin
  TEdit(_SenderFocus).CaretPosition := TEdit(_SenderFocus).CaretPosition + 1;
end;

procedure InputKeyUp(_SenderFocus: TObject);
var
  Index: Integer;
begin
  if _SenderFocus.ClassName = 'TComboEdit' then
  begin
    Index := TComboEdit(_SenderFocus).ItemIndex;

    if Index > -1 then
      TComboEdit(_SenderFocus).ItemIndex := Index - 1;
  end;
end;

procedure InputKeyDown(_SenderFocus: TObject);
var
  Index: Integer;
begin
  if _SenderFocus.ClassName = 'TComboEdit' then
  begin
    Index := TComboEdit(_SenderFocus).ItemIndex;

    if Index < TComboEdit(_SenderFocus).Items.Count then
      TComboEdit(_SenderFocus).ItemIndex := Index + 1;
  end;
end;

end.
