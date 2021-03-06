unit ViewAdministrator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ExtDlgs;

type
  TForm10 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    CarImage: TImage;
    DBGridCar: TDBGrid;
    CarSeller: TEdit;
    ClearButton: TButton;
    CarInfo: TRichEdit;
    RichEditParams: TRichEdit;
    Label2: TLabel;
    Label3: TLabel;
    ButtonChat: TButton;
    Label4: TLabel;
    ComboBoxSort: TComboBox;
    GroupBoxParams: TGroupBox;
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
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    ImageBrand: TImage;
    ImageModel: TImage;
    ImageYear: TImage;
    ImageCost: TImage;
    ImagePower: TImage;
    ImageDrive: TImage;
    ImageVolume: TImage;
    ImageEngine: TImage;
    ImageBody: TImage;
    ImageGear: TImage;
    ButtonFilter: TButton;
    ComboBoxBrand: TComboBox;
    ComboBoxModel: TComboBox;
    EditYear1: TEdit;
    EditYear2: TEdit;
    ComboBoxGear: TComboBox;
    ComboBoxBody: TComboBox;
    ComboBoxEngine: TComboBox;
    ComboBoxDrive: TComboBox;
    EditCost1: TEdit;
    EditCost2: TEdit;
    EditVolume1: TEdit;
    EditVolume2: TEdit;
    EditPower1: TEdit;
    EditPower2: TEdit;
    CheckBoxPhoto: TCheckBox;
    GroupBoxCondition: TGroupBox;
    RadioButtonConditionNew: TRadioButton;
    RadioButtonConditionUsed: TRadioButton;
    RadioButtonConditionAny: TRadioButton;
    GroupBoxWheel: TGroupBox;
    RadioButtonWheelRight: TRadioButton;
    RadioButtonWheelLeft: TRadioButton;
    RadioButtonWheelAny: TRadioButton;
    ButtonClear: TButton;
    ButtonSellCar: TButton;
    SellerImage: TImage;
    SellerUpdate: TButton;
    SellerDelete: TButton;
    ButtonLoadSeller: TButton;
    Label10: TLabel;
    SellerPhone: TEdit;
    SellerName: TEdit;
    Label26: TLabel;
    OpenPictureDialog: TOpenPictureDialog;
    DBGridCarSeller: TDBGrid;
    RichEditDescriptionSelf: TRichEdit;
    Label1: TLabel;
    ImageCarSeller: TImage;
    CarSell: TButton;
    CarUpdate: TButton;
    CarImageLoad: TButton;
    CarImageDelete: TButton;
    ComboBoxBrandSelf: TComboBox;
    Label28: TLabel;
    GroupBox1: TGroupBox;
    RadioButtonNewSelf: TRadioButton;
    RadioButtonUsedSelf: TRadioButton;
    Label29: TLabel;
    Label30: TLabel;
    ComboBoxModelSelf: TComboBox;
    EditYear: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    EditCost: TEdit;
    ComboBoxGearSelf: TComboBox;
    Label33: TLabel;
    Label34: TLabel;
    ComboBoxBodySelf: TComboBox;
    ComboBoxEngineSelf: TComboBox;
    Label35: TLabel;
    Label36: TLabel;
    EditVolume: TEdit;
    ComboBoxDriveSelf: TComboBox;
    Label37: TLabel;
    Label38: TLabel;
    EditPower: TEdit;
    GroupBox2: TGroupBox;
    RadioButtonRightSelf: TRadioButton;
    RadioButtonLeftSelf: TRadioButton;
    Label39: TLabel;
    Label40: TLabel;
    EditAddress: TEdit;
    DBGridChats: TDBGrid;
    ButtonDeleteSeller: TButton;
    ButtonRefresh: TButton;
    ButtonSend: TButton;
    EditChat: TEdit;
    StringGridChat: TStringGrid;
    TabSheet5: TTabSheet;
    DBGridSellers: TDBGrid;
    ImageSellers: TImage;
    TabSheet6: TTabSheet;
    DBGridSold: TDBGrid;
    RichEditSoldDescription: TRichEdit;
    Label27: TLabel;
    ImageSold: TImage;
    Label41: TLabel;
    EditSold: TEdit;
    RichEditSold: TRichEdit;
    procedure ButtonSellCarClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure ComboBoxSortChange(Sender: TObject);
    procedure ComboBoxBrandChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonFilterClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ImageYearClick(Sender: TObject);
    procedure ImageVolumeClick(Sender: TObject);
    procedure ImagePowerClick(Sender: TObject);
    procedure ImageModelClick(Sender: TObject);
    procedure ImageGearClick(Sender: TObject);
    procedure ImageEngineClick(Sender: TObject);
    procedure ImageDriveClick(Sender: TObject);
    procedure ImageCostClick(Sender: TObject);
    procedure ImageBrandClick(Sender: TObject);
    procedure ImageBodyClick(Sender: TObject);
    procedure SellerUpdateClick(Sender: TObject);
    procedure ButtonLoadSellerClick(Sender: TObject);
    procedure ButtonDeleteSellerClick(Sender: TObject);
    procedure SellerDeleteClick(Sender: TObject);
    procedure CarImageLoadClick(Sender: TObject);
    procedure CarImageDeleteClick(Sender: TObject);
    procedure ComboBoxBrandSelfChange(Sender: TObject);
    procedure CarSellClick(Sender: TObject);
    procedure CarUpdateClick(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonChatClick(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Sort: Bool;
    Filter: Bool;
    CarImagePath, SellerImagePath: AnsiString;
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

uses Unit2, Unit6, Unit4, Unit8;

procedure TForm10.ButtonChatClick(Sender: TObject);
begin
  Form8.Show();
end;

procedure TForm10.ButtonClearClick(Sender: TObject);
begin
  Filter := False;
  RadioButtonConditionAny.Checked := True;
  ComboBoxBrand.ItemIndex := -1;
  ComboBoxModel.ItemIndex := -1;
  EditYear1.Text := '';
  EditYear2.Text := '';
  EditCost1.Text := '';
  EditCost2.Text := '';
  ComboBoxGear.ItemIndex := -1;
  ComboBoxBody.ItemIndex := -1;
  ComboBoxEngine.ItemIndex := -1;
  EditVolume1.Text := '';
  EditVolume2.Text := '';
  ComboBoxDrive.ItemIndex := -1;
  EditPower1.Text := '';
  EditPower2.Text := '';
  RadioButtonWheelAny.Checked := True;
  CheckBoxPhoto.Checked := False;
  ComboBoxSortChange(ButtonClear);
end;

procedure TForm10.ButtonDeleteSellerClick(Sender: TObject);
begin
  SellerImagePath := 'D:\Images\NI.jpg';
  SellerImage.Picture.LoadFromFile('D:\Images\NI.jpg');
end;

procedure TForm10.ButtonFilterClick(Sender: TObject);
begin
  Filter := True;
  with DataModule2.Q_Cars do
  begin
    SQL.Clear;
    SQL.Add('CALL SelectCarTableForUser(');

    if RadioButtonConditionAny.Checked then
      SQL.Add('-1, ')
    else if RadioButtonConditionNew.Checked then
      SQL.Add('0, ')
    else if RadioButtonConditionUsed.Checked then
      SQL.Add('1, ');

    SQL.Add(IntToStr(ComboBoxBrand.ItemIndex + 1));
    SQL.Add(', ');

    if ComboBoxModel.ItemIndex = -1 then
      SQL.Add('0')
    else
      SQL.Add(ComboBoxModel.Items[ComboBoxModel.ItemIndex]);
    SQL.Add(', ');

    if EditYear1.Text = '' then
      SQL.Add('-1')
    else
      SQL.Add(EditYear1.Text);
    SQL.Add(', ');
    if EditYear2.Text = '' then
      SQL.Add('-1')
    else
      SQL.Add(EditYear2.Text);
    SQL.Add(', ');

    if EditCost1.Text = '' then
      SQL.Add('-1')
    else
      SQL.Add(EditCost1.Text);
    SQL.Add(', ');
    if EditCost2.Text = '' then
      SQL.Add('-1')
    else
      SQL.Add(EditCost2.Text);
    SQL.Add(', ');

    SQL.Add(IntToStr(ComboBoxGear.ItemIndex + 1));
    SQL.Add(', ');

    SQL.Add(IntToStr(ComboBoxBody.ItemIndex + 1));
    SQL.Add(', ');

    SQL.Add(IntToStr(ComboBoxEngine.ItemIndex + 1));
    SQL.Add(', ');

    if EditVolume1.Text = '' then
      SQL.Add('-1')
    else
      SQL.Add(EditVolume1.Text);
    SQL.Add(', ');
    if EditVolume2.Text = '' then
      SQL.Add('-1')
    else
      SQL.Add(EditVolume2.Text);
    SQL.Add(', ');

    SQL.Add(IntToStr(ComboBoxDrive.ItemIndex + 1));
    SQL.Add(', ');

    if EditPower1.Text = '' then
      SQL.Add('-1')
    else
      SQL.Add(EditPower1.Text);
    SQL.Add(', ');
    if EditPower2.Text = '' then
      SQL.Add('-1')
    else
      SQL.Add(EditPower2.Text);
    SQL.Add(', ');

    if RadioButtonWheelAny.Checked then
      SQL.Add('0, ')
    else if RadioButtonWheelLeft.Checked then
      SQL.Add('1, ')
    else if RadioButtonWheelRight.Checked then
      SQL.Add('2, ');

    if CheckBoxPhoto.Checked then
      SQL.Add('1, ')
    else
      SQL.Add('0, ');

    SQL.Add(IntToStr(ComboBoxSort.ItemIndex));
    SQL.Add(', ');
    if Form10.Sort then
      SQL.Add('0)')
    else
      SQL.Add('1)');

    ExecSQL;
    Active := False;
    Active := True;
  end;
end;

procedure TForm10.ButtonLoadSellerClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
    if FileExists(OpenPictureDialog.FileName) then begin
      SellerImage.Picture.LoadFromFile(OpenPictureDialog.FileName);
      SellerImagePath := OpenPictureDialog.FileName;
    end
    else begin
      SellerImagePath := 'D:\Images\NI.jpg';
      SellerImage.Picture.LoadFromFile('D:\Images\NI.jpg');
      raise Exception.Create('File does not exist.');
    end;
end;

procedure TForm10.ButtonRefreshClick(Sender: TObject);
begin
  DataModule2.Q_Chat.Active := False;
  DataModule2.Q_Chat.Active := True;
end;

procedure TForm10.ButtonSellCarClick(Sender: TObject);
begin
  Form6.Show;
end;

procedure TForm10.ButtonSendClick(Sender: TObject);
begin
  with DataModule2.Q_Act do
  begin
    SQL.Clear;
    SQL.Add('CALL InsertChat(');
    SQL.Add(IntToStr(DataModule2.UserID));
    SQL.Add(', ');
    SQL.Add(DataModule2.Q_Chat.FieldByName('UserID').AsString);
    SQL.Add(', ');
    SQL.Add(QuotedStr(EditChat.Text));
    SQL.Add(')');
    ExecSQL;

    StringGridChat.Cols[0].Clear;
    StringGridChat.Cols[1].Clear;
    StringGridChat.RowCount := 1;

    SQL.Clear;
    SQL.Add('SELECT Setter, Getter, Text FROM chat WHERE (Setter = ');
    SQL.Add(DataModule2.Q_Chat.FieldByName('Setter').AsString);
    SQL.Add(' AND Getter = ');
    SQL.Add(DataModule2.Q_Chat.FieldByName('Getter').AsString);
    SQL.Add(') OR (Setter = ');
    SQL.Add(DataModule2.Q_Chat.FieldByName('Getter').AsString);
    SQL.Add(' AND Getter = ');
    SQL.Add(DataModule2.Q_Chat.FieldByName('Setter').AsString);
    SQL.Add(') ORDER BY MessageID ASC');
    ExecSQL;
    Active := False;
    Active := True;

    while not Eof do begin
      if FieldByName('Setter').AsInteger = DataModule2.UserID then
        StringGridChat.Cells[1, StringGridChat.RowCount - 1] := FieldByName('Text').AsString
      else
        StringGridChat.Cells[0, StringGridChat.RowCount - 1] := FieldByName('Text').AsString;
      StringGridChat.RowCount := StringGridChat.RowCount + 1;
      Next;
    end;
  end;
  EditChat.Text := '';
end;

procedure TForm10.CarImageDeleteClick(Sender: TObject);
begin
  CarImagePath := 'D:\Images\NI.jpg';
  ImageCarSeller.Picture.LoadFromFile('D:\Images\NI.jpg');
end;

procedure TForm10.CarImageLoadClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
    if FileExists(OpenPictureDialog.FileName) then begin
      ImageCarSeller.Picture.LoadFromFile(OpenPictureDialog.FileName);
      CarImagePath := OpenPictureDialog.FileName;
    end
    else begin
      CarImagePath := 'D:\Images\NI.jpg';
      ImageCarSeller.Picture.LoadFromFile('D:\Images\NI.jpg');
      raise Exception.Create('File does not exist.');
    end;
end;

procedure TForm10.CarSellClick(Sender: TObject);
begin
  DataModule2.Q_Act.SQL.Clear;
  DataModule2.Q_Act.SQL.Add('CALL SellCar(');
  DataModule2.Q_Act.SQL.Add(DataModule2.Q_CarsUser.FieldByName('CarID').AsString);
  DataModule2.Q_Act.SQL.Add(')');
  DataModule2.Q_Act.ExecSQL;
  DataModule2.Q_CarsUser.Active := False;
  DataModule2.Q_CarsUser.Active := True;
end;

procedure TForm10.CarUpdateClick(Sender: TObject);
begin
  with DataModule2.Q_Act do
  begin
    SQL.Clear;
    SQL.Add('CALL UpdateCar(');
    SQL.Add(QuotedStr(DataModule2.Q_CarsUser.FieldByName('CarID').AsString));
    SQL.Add(', ');
    SQL.Add(QuotedStr(DataModule2.Q_CarsUser.FieldByName('CarTechID').AsString));
    SQL.Add(', ');
    SQL.Add(QuotedStr(IntToStr(ComboBoxBrandSelf.ItemIndex + 1)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(ComboBoxModelSelf.Items[ComboBoxModelSelf.ItemIndex]));
    SQL.Add(', ');
    SQL.Add(QuotedStr(IntToStr(ComboBoxBodySelf.ItemIndex + 1)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(IntToStr(ComboBoxEngineSelf.ItemIndex + 1)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(EditVolume.Text));
    SQL.Add(', ');
    SQL.Add(QuotedStr(EditPower.Text));
    SQL.Add(', ');

    if RadioButtonLeftSelf.Checked then
      SQL.Add('''1'', ')
    else
      SQL.Add('''2'', ');

    SQL.Add(QuotedStr(IntToStr(ComboBoxGearSelf.ItemIndex + 1)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(IntToStr(ComboBoxDriveSelf.ItemIndex + 1)));
    SQL.Add(', ');

    SQL.Add(QuotedStr(IntToStr(DataModule2.UserID)));
    SQL.Add(', ');
    SQL.Add(QuotedStr(FormatDateTime('yyyy/mm/dd', System.SysUtils.Date)));
    SQL.Add(', ');

    if RadioButtonNewSelf.Checked then
      SQL.Add('''0'', ')
    else
      SQL.Add('''1'', ');

    SQL.Add(QuotedStr(EditCost.Text));
    SQL.Add(', ');
    SQL.Add(EditYear.Text);
    SQL.Add(', ');
    SQL.Add(QuotedStr(EditAddress.Text));
    SQL.Add(', ');
    SQL.Add(QuotedStr(RichEditDescriptionSelf.Text));
    SQL.Add(', ');
    SQL.Add(QuotedStr(StringReplace(CarImagePath, '\', '\\', [rfReplaceAll])));
    SQL.Add(')');
    execSQL;
  end;
  DataModule2.Q_CarsUser.Active := False;
  DataModule2.Q_CarsUser.Active := True;
end;

procedure TForm10.ComboBoxBrandChange(Sender: TObject);
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

procedure TForm10.ComboBoxBrandSelfChange(Sender: TObject);
begin
  ComboBoxModelSelf.ItemIndex := -1;
  ComboBoxModelSelf.Items.Clear;
  DataModule2.Q_Model.SQL.Clear;
  DataModule2.Q_Model.SQL.Add('SELECT ModelName FROM CarTechModel WHERE ModelBrandID = ');
  DataModule2.Q_Model.SQL.Add(IntToStr(ComboBoxBrandSelf.ItemIndex + 1));
  DataModule2.Q_Model.ExecSQL;
  DataModule2.Q_Model.Active := False;
  DataModule2.Q_Model.Active := True;
  while not DataModule2.Q_Model.Eof do begin
    ComboBoxModelSelf.Items.Add(DataModule2.Q_Model.FieldByName('ModelName').AsString);
    DataModule2.Q_Model.Next;
  end;
end;

procedure TForm10.ComboBoxSortChange(Sender: TObject);
begin
  if Filter then
    ButtonFilterClick(ComboBoxSort)
  else begin
    DataModule2.Q_Cars.SQL.Clear;
    DataModule2.Q_Cars.SQL.Add('SELECT * FROM CarTableForUser');
    if ComboBoxSort.ItemIndex = 0 then
      DataModule2.Q_Cars.SQL.Add(' ORDER BY CarDate ');
    if ComboBoxSort.ItemIndex = 1 then
      DataModule2.Q_Cars.SQL.Add(' ORDER BY CarCost ');
    if ComboBoxSort.ItemIndex = 2 then
      DataModule2.Q_Cars.SQL.Add(' ORDER BY CarBirth ');
    if ComboBoxSort.ItemIndex = 3 then
      DataModule2.Q_Cars.SQL.Add(' ORDER BY CarName ');
    if ComboBoxSort.ItemIndex = 4 then
      DataModule2.Q_Cars.SQL.Add(' ORDER BY CarTechEngineVolume ');
    if ComboBoxSort.ItemIndex = 5 then
      DataModule2.Q_Cars.SQL.Add(' ORDER BY CarTechPower ');

    if Sort then
      DataModule2.Q_Cars.SQL.Add('ASC')
    else
      DataModule2.Q_Cars.SQL.Add('DESC');

  DataModule2.Q_Cars.ExecSQL;
  DataModule2.Q_Cars.Active := False;
  DataModule2.Q_Cars.Active := True;
  end;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
  Sort := True;
  Filter := False;

  DataModule2.Q_Sellers.SQL.Clear;
  DataModule2.Q_Sellers.SQL.Add('SELECT UserID, UserName, UserPhone, UserImage FROM user WHERE UserType = 1');
  DataModule2.Q_Sellers.SQL.Add(' ORDER BY UserName ASC');
  DataModule2.Q_Sellers.ExecSQL;
  DataModule2.Q_Sellers.Active := False;
  DataModule2.Q_Sellers.Active := True;

  ComboBoxSort.Items.Add('???? ??????????');
  ComboBoxSort.Items.Add('????');
  ComboBoxSort.Items.Add('???? ????????????');
  ComboBoxSort.Items.Add('????????');
  ComboBoxSort.Items.Add('?????? ?????????');
  ComboBoxSort.Items.Add('???????? ?????????');
  ComboBoxSort.ItemIndex := 0;

  while not DataModule2.Q_Brand.Eof do begin
    ComboBoxBrand.Items.Add(DataModule2.Q_Brand.FieldByName('BrandName').AsString);
    ComboBoxBrandSelf.Items.Add(DataModule2.Q_Brand.FieldByName('BrandName').AsString);
    DataModule2.Q_Brand.Next;
  end;
  while not DataModule2.Q_Gear.Eof do begin
    ComboBoxGear.Items.Add(DataModule2.Q_Gear.FieldByName('GearType').AsString);
    ComboBoxGearSelf.Items.Add(DataModule2.Q_Gear.FieldByName('GearType').AsString);
    DataModule2.Q_Gear.Next;
  end;
  while not DataModule2.Q_Body.Eof do begin
    ComboBoxBody.Items.Add(DataModule2.Q_Body.FieldByName('CarBodyName').AsString);
    ComboBoxBodySelf.Items.Add(DataModule2.Q_Body.FieldByName('CarBodyName').AsString);
    DataModule2.Q_Body.Next;
  end;
  while not DataModule2.Q_Engine.Eof do begin
    ComboBoxEngine.Items.Add(DataModule2.Q_Engine.FieldByName('EngineTypeName').AsString);
    ComboBoxEngineSelf.Items.Add(DataModule2.Q_Engine.FieldByName('EngineTypeName').AsString);
    DataModule2.Q_Engine.Next;
  end;
  while not DataModule2.Q_Drive.Eof do begin
    ComboBoxDrive.Items.Add(DataModule2.Q_Drive.FieldByName('DriveType').AsString);
    ComboBoxDriveSelf.Items.Add(DataModule2.Q_Drive.FieldByName('DriveType').AsString);
    DataModule2.Q_Drive.Next;
  end;

  DataModule2.Q_Act.SQL.Clear;
  DataModule2.Q_Act.SQL.Add('SELECT UserID, UserName, ');
  DataModule2.Q_Act.SQL.Add('UserPhone, UserImage ');
  DataModule2.Q_Act.SQL.Add('FROM user WHERE UserID = ');
  DataModule2.Q_Act.SQL.Add(IntToStr(DataModule2.UserID));
  DataModule2.Q_Act.ExecSQL;
  DataModule2.Q_Act.Active := False;
  DataModule2.Q_Act.Active := True;
  SellerImage.Picture.LoadFromFile(DataModule2.Q_Act.FieldByName('UserImage').AsString);
  SellerName.Text := DataModule2.Q_Act.FieldByName('UserName').AsString;
  SellerPhone.Text := DataModule2.Q_Act.FieldByName('UserPhone').AsString;

  DataModule2.Q_CarsUser.SQL.Clear;
  DataModule2.Q_CarsUser.SQL.Add('SELECT * FROM CarTableForUser WHERE UserID = ');
  DataModule2.Q_CarsUser.SQL.Add(IntToStr(DataModule2.UserID));
  DataModule2.Q_CarsUser.ExecSQL;
  DataModule2.Q_CarsUser.Active := False;
  DataModule2.Q_CarsUser.Active := True;

  DataModule2.Q_Act.SQL.Clear;
  DataModule2.Q_Act.SQL.Add('SELECT MAX(MessageID) AS MMID FROM chat WHERE Setter = 1 OR Getter = 1 GROUP BY IF(Getter > Setter, CONCAT(Setter, "-", Getter), CONCAT(Getter, "-", Setter)) ORDER BY MMID DESC');
  DataModule2.Q_Act.ExecSQL;
  DataModule2.Q_Act.Active := False;
  DataModule2.Q_Act.Active := True;
  DataModule2.Q_Chat.SQL.Clear;
  DataModule2.Q_Chat.SQL.Add('SELECT UserID, UserName, Text, Setter, Getter FROM Chat, User WHERE UserID = IF(');
  DataModule2.Q_Chat.SQL.Add(IntToStr(DataModule2.UserID));
  DataModule2.Q_Chat.SQL.Add(' = Setter, Getter, Setter)');
  if DataModule2.Q_Act.Eof then
    DataModule2.Q_Chat.SQL.Add(' AND MessageID = 0')
  else begin
    DataModule2.Q_Chat.SQL.Add('AND(MessageID = ');
    DataModule2.Q_Chat.SQL.Add(DataModule2.Q_Act.FieldByName('MMID').AsString);
    DataModule2.Q_Act.Next;
    while not DataModule2.Q_Act.Eof do begin
      DataModule2.Q_Chat.SQL.Add(' OR MessageID = ');
      DataModule2.Q_Chat.SQL.Add(DataModule2.Q_Act.FieldByName('MMID').AsString);
      DataModule2.Q_Act.Next;
    end;
    DataModule2.Q_Chat.SQL.Add(') ORDER BY MessageID DESC')
  end;
  DataModule2.Q_Chat.ExecSQL;
  DataModule2.Q_Chat.Active := False;
  DataModule2.Q_Chat.Active := True;
end;

procedure TForm10.ImageBodyClick(Sender: TObject);
begin
  ComboBoxBody.ItemIndex := -1;
end;

procedure TForm10.ImageBrandClick(Sender: TObject);
begin
  ComboBoxBrand.ItemIndex := -1;
  ComboBoxModel.ItemIndex := -1;
  ComboBoxModel.Items.Clear;
end;

procedure TForm10.ImageCostClick(Sender: TObject);
begin
  EditCost1.Text := '';
  EditCost2.Text := '';
end;

procedure TForm10.ImageDriveClick(Sender: TObject);
begin
  ComboBoxDrive.ItemIndex := -1;
end;

procedure TForm10.ImageEngineClick(Sender: TObject);
begin
  ComboBoxEngine.ItemIndex := -1;
end;

procedure TForm10.ImageGearClick(Sender: TObject);
begin
  ComboBoxGear.ItemIndex := -1;
end;

procedure TForm10.ImageModelClick(Sender: TObject);
begin
  ComboBoxModel.ItemIndex := -1;
end;

procedure TForm10.ImagePowerClick(Sender: TObject);
begin
  EditPower1.Text := '';
  EditPower2.Text := '';
end;

procedure TForm10.ImageVolumeClick(Sender: TObject);
begin
  EditVolume1.Text := '';
  EditVolume2.Text := '';
end;

procedure TForm10.ImageYearClick(Sender: TObject);
begin
  EditYear1.Text := '';
  EditYear2.Text := '';
end;

procedure TForm10.Label4Click(Sender: TObject);
begin
  if Sort then
    Label4.Caption := '?????????? ?? ????????'
  else
    Label4.Caption := '?????????? ?? ???????????';
  Sort := NOT Sort;
  ComboBoxSortChange(Label4);
end;

procedure TForm10.SellerDeleteClick(Sender: TObject);
begin
  with DataModule2.Q_Act do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM User WHERE UserID = ' + IntToStr(DataModule2.UserID));
    ExecSQL;
  end;
  Form4.Show;
end;

procedure TForm10.SellerUpdateClick(Sender: TObject);
begin
  with DataModule2.Q_Act do
  begin
    SQL.Clear;
    SQL.Add('UPDATE user SET ');
    SQL.Add('UserName=''' + SellerName.Text + ''', ');
    SQL.Add('UserPhone=''' + SellerPhone.Text + ''', ');
    SQL.Add('UserImage=''' + StringReplace(SellerImagePath, '\', '\\', [rfReplaceAll]) + ''' ');
    SQL.Add(' WHERE UserID = ' + IntToStr(DataModule2.UserID));
    ExecSQL;
  end;
end;

procedure TForm10.TabSheet4Show(Sender: TObject);
begin
  DataModule2.Q_Act.SQL.Clear;
  DataModule2.Q_Act.SQL.Add('SELECT MAX(MessageID) AS MMID FROM chat WHERE Setter = 1 OR Getter = 1 GROUP BY IF(Getter > Setter, CONCAT(Setter, "-", Getter), CONCAT(Getter, "-", Setter)) ORDER BY MMID DESC');
  DataModule2.Q_Act.ExecSQL;
  DataModule2.Q_Act.Active := False;
  DataModule2.Q_Act.Active := True;
  DataModule2.Q_Chat.SQL.Clear;
  DataModule2.Q_Chat.SQL.Add('SELECT UserID, UserName, Text, Setter, Getter FROM Chat, User WHERE UserID = IF(');
  DataModule2.Q_Chat.SQL.Add(IntToStr(DataModule2.UserID));
  DataModule2.Q_Chat.SQL.Add(' = Setter, Getter, Setter)');
  if DataModule2.Q_Act.Eof then
    DataModule2.Q_Chat.SQL.Add(' AND MessageID = 0')
  else begin
    DataModule2.Q_Chat.SQL.Add('AND(MessageID = ');
    DataModule2.Q_Chat.SQL.Add(DataModule2.Q_Act.FieldByName('MMID').AsString);
    DataModule2.Q_Act.Next;
    while not DataModule2.Q_Act.Eof do begin
      DataModule2.Q_Chat.SQL.Add(' OR MessageID = ');
      DataModule2.Q_Chat.SQL.Add(DataModule2.Q_Act.FieldByName('MMID').AsString);
      DataModule2.Q_Act.Next;
    end;
    DataModule2.Q_Chat.SQL.Add(') ORDER BY MessageID DESC')
  end;
  DataModule2.Q_Chat.ExecSQL;
  DataModule2.Q_Chat.Active := False;
  DataModule2.Q_Chat.Active := True;
end;

end.
