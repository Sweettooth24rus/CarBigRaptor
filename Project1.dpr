program Project1;

uses
  Vcl.Forms,
  ViewBuyer in 'ViewBuyer.pas' {Form1},
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit6 in 'Unit6.pas' {Form6},
  ViewSeller in 'ViewSeller.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  ViewModerator in 'ViewModerator.pas' {Form9},
  ViewAdministrator in 'ViewAdministrator.pas' {Form10},
  ViewGuest in 'ViewGuest.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
