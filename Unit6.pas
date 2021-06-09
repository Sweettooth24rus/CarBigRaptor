unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.ExtDlgs;

type
  TForm6 = class(TForm)
    ButtonAdd: TButton;
    ButtonLoad: TButton;
    ButtonDelete: TButton;
    ImageCar: TImage;
    RichEditDescription: TRichEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBoxBrand: TComboBox;
    ComboBoxModel: TComboBox;
    EditYear: TEdit;
    ComboBoxGear: TComboBox;
    ComboBoxBody: TComboBox;
    ComboBoxEngine: TComboBox;
    ComboBoxDrive: TComboBox;
    EditCost: TEdit;
    EditVolume: TEdit;
    EditPower: TEdit;
    GroupBoxCondition: TGroupBox;
    RadioButtonConditionNew: TRadioButton;
    RadioButtonConditionUsed: TRadioButton;
    GroupBoxWheel: TGroupBox;
    RadioButtonWheelRight: TRadioButton;
    RadioButtonWheelLeft: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenPictureDialog: TOpenPictureDialog;
    Label4: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    EditAddress: TEdit;
    procedure ButtonLoadClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ComboBoxBrandChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CarImagePath: AnsiString;
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm6.ButtonAddClick(Sender: TObject);
begin
  with DataModule2.Q_Act do
  begin
    SQL.Clear;
    SQL.Add('CALL InsertCarTmp(');
    SQL.Add(QuotedStr(IntToStr(ComboBoxBrand.ItemIndex + 1)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(ComboBoxModel.Items[ComboBoxModel.ItemIndex]));
    SQL.Add(', ');
    SQL.Add(QuotedStr(IntToStr(ComboBoxBody.ItemIndex + 1)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(IntToStr(ComboBoxEngine.ItemIndex + 1)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(EditVolume.Text));
    SQL.Add(', ');
    SQL.Add(QuotedStr(EditPower.Text));
    SQL.Add(', ');

    if RadioButtonWheelLeft.Checked then
      SQL.Add('''1'', ')
    else
      SQL.Add('''2'', ');

    SQL.Add(QuotedStr(IntToStr(ComboBoxGear.ItemIndex + 1)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(IntToStr(ComboBoxDrive.ItemIndex + 1)));
    SQL.Add(', ');

    SQL.Add(QuotedStr(IntToStr(DataModule2.UserID)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(FormatDateTime('yyyy/mm/dd', System.SysUtils.Date)));
    SQL.Add(', ');

    if RadioButtonConditionNew.Checked then
      SQL.Add('''0'', ')
    else
      SQL.Add('''1'', ');

    SQL.Add(QuotedStr(EditCost.Text));
    SQL.Add(', ');
    SQL.Add(EditYear.Text);
    SQL.Add(', ');
    SQL.Add(QuotedStr(EditAddress.Text));
    SQL.Add(', ');
    SQL.Add(QuotedStr(RichEditDescription.Text));
    SQL.Add(', ');
    SQL.Add(QuotedStr(StringReplace(CarImagePath, '\', '\\', [rfReplaceAll])));
    SQL.Add(')');
    ExecSQL;
  end;
  Form6.Close;
end;

procedure TForm6.ButtonDeleteClick(Sender: TObject);
begin
  CarImagePath := 'D:\Images\NI.jpg';
  ImageCar.Picture.LoadFromFile('D:\Images\NI.jpg');
end;

procedure TForm6.ButtonLoadClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
    if FileExists(OpenPictureDialog.FileName) then begin
      ImageCar.Picture.LoadFromFile(OpenPictureDialog.FileName);
      CarImagePath := OpenPictureDialog.FileName;
    end
    else begin
      CarImagePath := 'D:\Images\NI.jpg';
      ImageCar.Picture.LoadFromFile('D:\Images\NI.jpg');
      raise Exception.Create('File does not exist.');
    end;
end;

procedure TForm6.ComboBoxBrandChange(Sender: TObject);
begin
  ComboBoxModel.ItemIndex := -1;
  ComboBoxModel.Items.Clear;
  DataModule2.Q_Model.SQL.Clear;
  DataModule2.Q_Model.SQL.Add('SELECT ModelName FROM CarTechModel WHERE ModelBrandID = ');
  DataModule2.Q_Model.SQL.Add(IntToStr(ComboBoxBrand.ItemIndex + 1));
  DataModule2.Q_Model.ExecSQL;
  DataModule2.Q_Model.Active := False;
  DataModule2.Q_Model.Active := True;
  while not DataModule2.Q_Model.Eof do begin
    ComboBoxModel.Items.Add(DataModule2.Q_Model.FieldByName('ModelName').AsString);
    DataModule2.Q_Model.Next;
  end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  RichEditDescription.Text := '';

  DataModule2.Q_Brand.Active := False;
  DataModule2.Q_Brand.Active := True;
  DataModule2.Q_Gear.Active := False;
  DataModule2.Q_Gear.Active := True;
  DataModule2.Q_Body.Active := False;
  DataModule2.Q_Body.Active := True;
  DataModule2.Q_Engine.Active := False;
  DataModule2.Q_Engine.Active := True;
  DataModule2.Q_Drive.Active := False;
  DataModule2.Q_Drive.Active := True;

  while not DataModule2.Q_Brand.Eof do begin
    ComboBoxBrand.Items.Add(DataModule2.Q_Brand.FieldByName('BrandName').AsString);
    DataModule2.Q_Brand.Next;
  end;
  while not DataModule2.Q_Gear.Eof do begin
    ComboBoxGear.Items.Add(DataModule2.Q_Gear.FieldByName('GearType').AsString);
    DataModule2.Q_Gear.Next;
  end;
  while not DataModule2.Q_Body.Eof do begin
    ComboBoxBody.Items.Add(DataModule2.Q_Body.FieldByName('CarBodyName').AsString);
    DataModule2.Q_Body.Next;
  end;
  while not DataModule2.Q_Engine.Eof do begin
    ComboBoxEngine.Items.Add(DataModule2.Q_Engine.FieldByName('EngineTypeName').AsString);
    DataModule2.Q_Engine.Next;
  end;
  while not DataModule2.Q_Drive.Eof do begin
    ComboBoxDrive.Items.Add(DataModule2.Q_Drive.FieldByName('DriveType').AsString);
    DataModule2.Q_Drive.Next;
  end;
end;

end.
