unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    PhoneJoin: TEdit;
    PasswordJoin: TEdit;
    JoinButton: TButton;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RegisterButton: TButton;
    PhoneRegister: TEdit;
    PasswordRegister: TEdit;
    Label5: TLabel;
    NameRegister: TEdit;
    procedure JoinButtonClick(Sender: TObject);
    procedure RegisterButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses ViewBuyer, Unit2, ViewAdministrator, ViewGuest, ViewModerator,
  ViewSeller;

procedure TForm4.JoinButtonClick(Sender: TObject);
begin
  with DataModule2.Q_Act do
  begin
    SQL.Clear;
    SQL.Add('SELECT UserID, UserPhone, UserPass, UserType FROM user WHERE UserPhone = ');
    SQL.Add(QuotedStr(PhoneJoin.Text));
    SQL.Add(' AND UserPass = ');
    SQL.Add(QuotedStr(PasswordJoin.Text));
    Active := False;
    Active := True;
  end;
  if DataModule2.Q_Act.Eof then
    Form11.Show
  else begin
    DataModule2.UserType := DataModule2.Q_Act.FieldByName('UserType').AsInteger;;
    DataModule2.UserID := DataModule2.Q_Act.FieldByName('UserID').AsInteger;
    if DataModule2.UserType = 0 then
      Form1.Show;
    if DataModule2.UserType = 1 then
      Form7.Show;
    if DataModule2.UserType = 2 then
      Form10.Show;
    if DataModule2.UserType = 3 then
      Form11.Show;
  end;
end;

procedure TForm4.RegisterButtonClick(Sender: TObject);
begin
  with DataModule2.Q_Act do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO User (UserName, UserPhone, UserPass, UserImage, UserType) VALUES (');
    SQL.Add(QuotedStr(NameRegister.Text));
    SQL.Add(', ');
    SQL.Add(QuotedStr(PhoneRegister.Text));
    SQL.Add(', ');
    SQL.Add(QuotedStr(PasswordRegister.Text));
    SQL.Add(', ');
    SQL.Add(QuotedStr(StringReplace('D:\Images\NI.jpg', '\', '\\', [rfReplaceAll])));
    SQL.Add(', 0)');
    ExecSQL;

    SQL.Clear;
    SQL.Add('SELECT UserID, UserPhone, UserPass, UserType FROM user WHERE UserPhone = ');
    SQL.Add(QuotedStr(PhoneRegister.Text));
    SQL.Add(' AND UserPass = ');
    SQL.Add(QuotedStr(PasswordRegister.Text));
    Active := False;
    Active := True;
  end;
    DataModule2.UserType := DataModule2.Q_Act.FieldByName('UserType').AsInteger;;
    DataModule2.UserID := DataModule2.Q_Act.FieldByName('UserID').AsInteger;
  if DataModule2.UserType = 0 then
    Form1.Show;
  if DataModule2.UserType = 1 then
    Form7.Show;
  if DataModule2.UserType = 2 then
    Form10.Show;
  if DataModule2.UserType = 3 then
    Form11.Show;
end;

end.
