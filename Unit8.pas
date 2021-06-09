unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm8 = class(TForm)
    RichEditMessage: TRichEdit;
    ButtonSend: TButton;
    Label1: TLabel;
    procedure ButtonSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm8.ButtonSendClick(Sender: TObject);
begin
  with DataModule2.Q_Act do
  begin
    SQL.Clear;
    SQL.Add('CALL InsertChat(');
    SQL.Add(IntToStr(DataModule2.UserID));
    SQL.Add(', ');
    SQL.Add(DataModule2.Q_Cars.FieldByName('UserID').AsString);
    SQL.Add(', ');
    SQL.Add(QuotedStr(RichEditMessage.Text));
    SQL.Add(')');
    ExecSQL;
  end;
  Form8.Close;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
  RichEditMessage.Text := '';
end;

end.
