unit Unit2;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.Imaging.JPEG;

type
  TDataModule2 = class(TDataModule)
    Connection: TADOConnection;
    Q_Cars: TADOQuery;
    DS_Cars: TDataSource;
    Q_SoldCars: TADOQuery;
    Q_Sellers: TADOQuery;
    DS_SoldCars: TDataSource;
    DS_Sellers: TDataSource;
    Q_Body: TADOQuery;
    Q_Engine: TADOQuery;
    Q_Act: TADOQuery;
    Q_SumSoldCars: TADOQuery;
    Q_SellersBlock: TADOQuery;
    Q_Brand: TADOQuery;
    Q_Model: TADOQuery;
    Q_Gear: TADOQuery;
    Q_Drive: TADOQuery;
    Q_CarsUser: TADOQuery;
    DS_CarsUser: TDataSource;
    Q_Chat: TADOQuery;
    DS_Chat: TDataSource;
    procedure Q_CarsAfterScroll(DataSet: TDataSet);
    procedure Q_SellersAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure Q_SoldCarsAfterScroll(DataSet: TDataSet);
    procedure Q_CarsUserAfterScroll(DataSet: TDataSet);
    procedure Q_ChatAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    UserID: Integer;
    UserType: Integer;
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ViewBuyer, Unit3, ViewSeller, ViewModerator, ViewAdministrator, ViewGuest;

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  UserID := 1;
  UserType := 1;
end;

procedure TDataModule2.Q_CarsAfterScroll(DataSet: TDataSet);
begin
  Form1.CarInfo.Text := Q_Cars.FieldByName('CarDescription').AsString;
  Form1.CarSeller.Text := Q_Cars.FieldByName('UserPhone').AsString + ' ' +
  Q_Cars.FieldByName('UserName').AsString;
  Form1.CarImage.Picture.LoadFromFile(Q_Cars.FieldByName('CarImage').AsString);

  Form7.CarInfo.Text := Q_Cars.FieldByName('CarDescription').AsString;
  Form7.CarSeller.Text := Q_Cars.FieldByName('UserPhone').AsString + ' ' +
  Q_Cars.FieldByName('UserName').AsString;
  Form7.CarImage.Picture.LoadFromFile(Q_Cars.FieldByName('CarImage').AsString);

  Form9.CarInfo.Text := Q_Cars.FieldByName('CarDescription').AsString;
  Form9.CarSeller.Text := Q_Cars.FieldByName('UserPhone').AsString + ' ' +
  Q_Cars.FieldByName('UserName').AsString;
  Form9.CarImage.Picture.LoadFromFile(Q_Cars.FieldByName('CarImage').AsString);

  Form10.CarInfo.Text := Q_Cars.FieldByName('CarDescription').AsString;
  Form10.CarSeller.Text := Q_Cars.FieldByName('UserPhone').AsString + ' ' +
  Q_Cars.FieldByName('UserName').AsString;
  Form10.CarImage.Picture.LoadFromFile(Q_Cars.FieldByName('CarImage').AsString);

  Form11.CarInfo.Text := Q_Cars.FieldByName('CarDescription').AsString;
  Form11.CarSeller.Text := Q_Cars.FieldByName('UserPhone').AsString + ' ' +
  Q_Cars.FieldByName('UserName').AsString;
  Form11.CarImage.Picture.LoadFromFile(Q_Cars.FieldByName('CarImage').AsString);

  if Q_Cars.FieldByName('CarCondition').AsInteger = 0 then
    Form1.RichEditParams.Text := '????? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak
  else
    Form1.RichEditParams.Text := '?/? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '??? ???????               ' + Q_Cars.FieldByName('CarBirth').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '????, ?                       ' + Q_Cars.FieldByName('CarCost').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '???                            ' + Q_Cars.FieldByName('GearType').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '?????                          ' + Q_Cars.FieldByName('CarBodyName').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '?????????                  ' + Q_Cars.FieldByName('EngineTypeName').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '????? ?????????, ?    ' + Q_Cars.FieldByName('CarTechEngineVolume').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '??????                       ' + Q_Cars.FieldByName('DriveType').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '????????, ?.?.           ' + Q_Cars.FieldByName('CarTechPower').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '???????????? ????    ' + Q_Cars.FieldByName('WheelType').AsString + sLineBreak;
  if Q_Cars.FieldByName('CarAddress').AsString.CompareTo('').ToBoolean then
    Form1.RichEditParams.Text := Form1.RichEditParams.Text + sLineBreak + '?????                          ' + Q_Cars.FieldByName('CarAddress').AsString;

  if Q_Cars.FieldByName('CarCondition').AsInteger = 0 then
    Form7.RichEditParams.Text := '????? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak
  else
    Form7.RichEditParams.Text := '?/? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '??? ???????               ' + Q_Cars.FieldByName('CarBirth').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '????, ?                       ' + Q_Cars.FieldByName('CarCost').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '???                            ' + Q_Cars.FieldByName('GearType').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '?????                          ' + Q_Cars.FieldByName('CarBodyName').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '?????????                  ' + Q_Cars.FieldByName('EngineTypeName').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '????? ?????????, ?    ' + Q_Cars.FieldByName('CarTechEngineVolume').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '??????                       ' + Q_Cars.FieldByName('DriveType').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '????????, ?.?.           ' + Q_Cars.FieldByName('CarTechPower').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '???????????? ????    ' + Q_Cars.FieldByName('WheelType').AsString + sLineBreak;
  if Q_Cars.FieldByName('CarAddress').AsString.CompareTo('').ToBoolean then
    Form7.RichEditParams.Text := Form7.RichEditParams.Text + sLineBreak + '?????                          ' + Q_Cars.FieldByName('CarAddress').AsString;

  if Q_Cars.FieldByName('CarCondition').AsInteger = 0 then
    Form9.RichEditParams.Text := '????? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak
  else
    Form9.RichEditParams.Text := '?/? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak;
  Form9.RichEditParams.Text := Form9.RichEditParams.Text + '??? ???????               ' + Q_Cars.FieldByName('CarBirth').AsString + sLineBreak;
  Form9.RichEditParams.Text := Form9.RichEditParams.Text + '????, ?                       ' + Q_Cars.FieldByName('CarCost').AsString + sLineBreak;
  Form9.RichEditParams.Text := Form9.RichEditParams.Text + '???                            ' + Q_Cars.FieldByName('GearType').AsString + sLineBreak;
  Form9.RichEditParams.Text := Form9.RichEditParams.Text + '?????                          ' + Q_Cars.FieldByName('CarBodyName').AsString + sLineBreak;
  Form9.RichEditParams.Text := Form9.RichEditParams.Text + '?????????                  ' + Q_Cars.FieldByName('EngineTypeName').AsString + sLineBreak;
  Form9.RichEditParams.Text := Form9.RichEditParams.Text + '????? ?????????, ?    ' + Q_Cars.FieldByName('CarTechEngineVolume').AsString + sLineBreak;
  Form9.RichEditParams.Text := Form9.RichEditParams.Text + '??????                       ' + Q_Cars.FieldByName('DriveType').AsString + sLineBreak;
  Form9.RichEditParams.Text := Form9.RichEditParams.Text + '????????, ?.?.           ' + Q_Cars.FieldByName('CarTechPower').AsString + sLineBreak;
  Form9.RichEditParams.Text := Form9.RichEditParams.Text + '???????????? ????    ' + Q_Cars.FieldByName('WheelType').AsString + sLineBreak;
  if Q_Cars.FieldByName('CarAddress').AsString.CompareTo('').ToBoolean then
    Form9.RichEditParams.Text := Form9.RichEditParams.Text + sLineBreak + '?????                          ' + Q_Cars.FieldByName('CarAddress').AsString;

  if Q_Cars.FieldByName('CarCondition').AsInteger = 0 then
    Form10.RichEditParams.Text := '????? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak
  else
    Form10.RichEditParams.Text := '?/? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak;
  Form10.RichEditParams.Text := Form10.RichEditParams.Text + '??? ???????               ' + Q_Cars.FieldByName('CarBirth').AsString + sLineBreak;
  Form10.RichEditParams.Text := Form10.RichEditParams.Text + '????, ?                       ' + Q_Cars.FieldByName('CarCost').AsString + sLineBreak;
  Form10.RichEditParams.Text := Form10.RichEditParams.Text + '???                            ' + Q_Cars.FieldByName('GearType').AsString + sLineBreak;
  Form10.RichEditParams.Text := Form10.RichEditParams.Text + '?????                          ' + Q_Cars.FieldByName('CarBodyName').AsString + sLineBreak;
  Form10.RichEditParams.Text := Form10.RichEditParams.Text + '?????????                  ' + Q_Cars.FieldByName('EngineTypeName').AsString + sLineBreak;
  Form10.RichEditParams.Text := Form10.RichEditParams.Text + '????? ?????????, ?    ' + Q_Cars.FieldByName('CarTechEngineVolume').AsString + sLineBreak;
  Form10.RichEditParams.Text := Form10.RichEditParams.Text + '??????                       ' + Q_Cars.FieldByName('DriveType').AsString + sLineBreak;
  Form10.RichEditParams.Text := Form10.RichEditParams.Text + '????????, ?.?.           ' + Q_Cars.FieldByName('CarTechPower').AsString + sLineBreak;
  Form10.RichEditParams.Text := Form10.RichEditParams.Text + '???????????? ????    ' + Q_Cars.FieldByName('WheelType').AsString + sLineBreak;
  if Q_Cars.FieldByName('CarAddress').AsString.CompareTo('').ToBoolean then
    Form10.RichEditParams.Text := Form10.RichEditParams.Text + sLineBreak + '?????                          ' + Q_Cars.FieldByName('CarAddress').AsString;

  if Q_Cars.FieldByName('CarCondition').AsInteger = 0 then
    Form11.RichEditParams.Text := '????? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak
  else
    Form11.RichEditParams.Text := '?/? ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak;
  Form11.RichEditParams.Text := Form11.RichEditParams.Text + '??? ???????               ' + Q_Cars.FieldByName('CarBirth').AsString + sLineBreak;
  Form11.RichEditParams.Text := Form11.RichEditParams.Text + '????, ?                       ' + Q_Cars.FieldByName('CarCost').AsString + sLineBreak;
  Form11.RichEditParams.Text := Form11.RichEditParams.Text + '???                            ' + Q_Cars.FieldByName('GearType').AsString + sLineBreak;
  Form11.RichEditParams.Text := Form11.RichEditParams.Text + '?????                          ' + Q_Cars.FieldByName('CarBodyName').AsString + sLineBreak;
  Form11.RichEditParams.Text := Form11.RichEditParams.Text + '?????????                  ' + Q_Cars.FieldByName('EngineTypeName').AsString + sLineBreak;
  Form11.RichEditParams.Text := Form11.RichEditParams.Text + '????? ?????????, ?    ' + Q_Cars.FieldByName('CarTechEngineVolume').AsString + sLineBreak;
  Form11.RichEditParams.Text := Form11.RichEditParams.Text + '??????                       ' + Q_Cars.FieldByName('DriveType').AsString + sLineBreak;
  Form11.RichEditParams.Text := Form11.RichEditParams.Text + '????????, ?.?.           ' + Q_Cars.FieldByName('CarTechPower').AsString + sLineBreak;
  Form11.RichEditParams.Text := Form11.RichEditParams.Text + '???????????? ????    ' + Q_Cars.FieldByName('WheelType').AsString + sLineBreak;
  if Q_Cars.FieldByName('CarAddress').AsString.CompareTo('').ToBoolean then
    Form11.RichEditParams.Text := Form11.RichEditParams.Text + sLineBreak + '?????                          ' + Q_Cars.FieldByName('CarAddress').AsString;
end;

procedure TDataModule2.Q_CarsUserAfterScroll(DataSet: TDataSet);
begin
  Form7.RichEditDescriptionSelf.Text := Q_CarsUser.FieldByName('CarDescription').AsString;
  Form7.ImageCarSeller.Picture.LoadFromFile(Q_CarsUser.FieldByName('CarImage').AsString);
  Form7.CarImagePath := Q_CarsUser.FieldByName('CarImage').AsString;

  Form9.RichEditDescriptionSelf.Text := Q_CarsUser.FieldByName('CarDescription').AsString;
  Form9.ImageCarSeller.Picture.LoadFromFile(Q_CarsUser.FieldByName('CarImage').AsString);
  Form9.CarImagePath := Q_CarsUser.FieldByName('CarImage').AsString;

  Form10.RichEditDescriptionSelf.Text := Q_CarsUser.FieldByName('CarDescription').AsString;
  Form10.ImageCarSeller.Picture.LoadFromFile(Q_CarsUser.FieldByName('CarImage').AsString);
  Form10.CarImagePath := Q_CarsUser.FieldByName('CarImage').AsString;

  Form7.ComboBoxModelSelf.ItemIndex := -1;
  Form7.ComboBoxModelSelf.Items.Clear;
  Form9.ComboBoxModelSelf.ItemIndex := -1;
  Form9.ComboBoxModelSelf.Items.Clear;
  Form10.ComboBoxModelSelf.ItemIndex := -1;
  Form10.ComboBoxModelSelf.Items.Clear;
  Q_Model.SQL.Clear;
  Q_Model.SQL.Add('SELECT ModelName FROM CarTechModel WHERE ModelBrandID = ');
  Q_Model.SQL.Add(Q_CarsUser.FieldByName('BrandID').AsString);
  Q_Model.ExecSQL;
  Q_Model.Active := False;
  Q_Model.Active := True;
  while not Q_Model.Eof do begin
    Form7.ComboBoxModelSelf.Items.Add(Q_Model.FieldByName('ModelName').AsString);
    Form9.ComboBoxModelSelf.Items.Add(Q_Model.FieldByName('ModelName').AsString);
    Form10.ComboBoxModelSelf.Items.Add(Q_Model.FieldByName('ModelName').AsString);
    Q_Model.Next;
  end;

  if Q_CarsUser.FieldByName('CarCondition').AsInteger = 0 then
    Form7.RadioButtonNewSelf.Checked := True
  else
    Form7.RadioButtonUsedSelf.Checked := True;
  Form7.ComboBoxBrandSelf.ItemIndex := Q_CarsUser.FieldByName('BrandID').AsInteger - 1;
  Form7.ComboBoxModelSelf.ItemIndex := Form7.ComboBoxModelSelf.Items.IndexOf(Q_CarsUser.FieldByName('ModelName').AsString);
  Form7.EditYear.Text := Q_CarsUser.FieldByName('CarBirth').AsString;
  Form7.EditCost.Text := Q_CarsUser.FieldByName('CarCost').AsString;
  Form7.ComboBoxGearSelf.ItemIndex := Q_CarsUser.FieldByName('GearID').AsInteger - 1;
  Form7.ComboBoxBodySelf.ItemIndex := Q_CarsUser.FieldByName('CarBodyID').AsInteger - 1;
  Form7.ComboBoxEngineSelf.ItemIndex := Q_CarsUser.FieldByName('EngineTypeID').AsInteger - 1;
  Form7.EditVolume.Text := StringReplace(Q_CarsUser.FieldByName('CarTechEngineVolume').AsString, ',', '.', [rfReplaceAll]);
  Form7.ComboBoxDriveSelf.ItemIndex := Q_CarsUser.FieldByName('DriveID').AsInteger - 1;
  Form7.EditPower.Text := Q_CarsUser.FieldByName('CarTechPower').AsString;
  if Q_CarsUser.FieldByName('WheelID').AsInteger = 2 then
    Form7.RadioButtonRightSelf.Checked := True
  else
    Form7.RadioButtonLeftSelf.Checked := True;
  Form7.EditAddress.Text := Q_CarsUser.FieldByName('CarAddress').AsString;

  if Q_CarsUser.FieldByName('CarCondition').AsInteger = 0 then
    Form9.RadioButtonNewSelf.Checked := True
  else
    Form9.RadioButtonUsedSelf.Checked := True;
  Form9.ComboBoxBrandSelf.ItemIndex := Q_CarsUser.FieldByName('BrandID').AsInteger - 1;
  Form9.ComboBoxModelSelf.ItemIndex := Form9.ComboBoxModelSelf.Items.IndexOf(Q_CarsUser.FieldByName('ModelName').AsString);
  Form9.EditYear.Text := Q_CarsUser.FieldByName('CarBirth').AsString;
  Form9.EditCost.Text := Q_CarsUser.FieldByName('CarCost').AsString;
  Form9.ComboBoxGearSelf.ItemIndex := Q_CarsUser.FieldByName('GearID').AsInteger - 1;
  Form9.ComboBoxBodySelf.ItemIndex := Q_CarsUser.FieldByName('CarBodyID').AsInteger - 1;
  Form9.ComboBoxEngineSelf.ItemIndex := Q_CarsUser.FieldByName('EngineTypeID').AsInteger - 1;
  Form9.EditVolume.Text := StringReplace(Q_CarsUser.FieldByName('CarTechEngineVolume').AsString, ',', '.', [rfReplaceAll]);
  Form9.ComboBoxDriveSelf.ItemIndex := Q_CarsUser.FieldByName('DriveID').AsInteger - 1;
  Form9.EditPower.Text := Q_CarsUser.FieldByName('CarTechPower').AsString;
  if Q_CarsUser.FieldByName('WheelID').AsInteger = 2 then
    Form9.RadioButtonRightSelf.Checked := True
  else
    Form9.RadioButtonLeftSelf.Checked := True;
  Form9.EditAddress.Text := Q_CarsUser.FieldByName('CarAddress').AsString;

  if Q_CarsUser.FieldByName('CarCondition').AsInteger = 0 then
    Form10.RadioButtonNewSelf.Checked := True
  else
    Form10.RadioButtonUsedSelf.Checked := True;
  Form10.ComboBoxBrandSelf.ItemIndex := Q_CarsUser.FieldByName('BrandID').AsInteger - 1;
  Form10.ComboBoxModelSelf.ItemIndex := Form10.ComboBoxModelSelf.Items.IndexOf(Q_CarsUser.FieldByName('ModelName').AsString);
  Form10.EditYear.Text := Q_CarsUser.FieldByName('CarBirth').AsString;
  Form10.EditCost.Text := Q_CarsUser.FieldByName('CarCost').AsString;
  Form10.ComboBoxGearSelf.ItemIndex := Q_CarsUser.FieldByName('GearID').AsInteger - 1;
  Form10.ComboBoxBodySelf.ItemIndex := Q_CarsUser.FieldByName('CarBodyID').AsInteger - 1;
  Form10.ComboBoxEngineSelf.ItemIndex := Q_CarsUser.FieldByName('EngineTypeID').AsInteger - 1;
  Form10.EditVolume.Text := StringReplace(Q_CarsUser.FieldByName('CarTechEngineVolume').AsString, ',', '.', [rfReplaceAll]);
  Form10.ComboBoxDriveSelf.ItemIndex := Q_CarsUser.FieldByName('DriveID').AsInteger - 1;
  Form10.EditPower.Text := Q_CarsUser.FieldByName('CarTechPower').AsString;
  if Q_CarsUser.FieldByName('WheelID').AsInteger = 2 then
    Form10.RadioButtonRightSelf.Checked := True
  else
    Form10.RadioButtonLeftSelf.Checked := True;
  Form10.EditAddress.Text := Q_CarsUser.FieldByName('CarAddress').AsString;
end;

procedure TDataModule2.Q_ChatAfterScroll(DataSet: TDataSet);
begin
  Form1.StringGridChat.Cols[0].Clear;
  Form1.StringGridChat.Cols[1].Clear;
  Form1.StringGridChat.RowCount := 1;

  Form7.StringGridChat.Cols[0].Clear;
  Form7.StringGridChat.Cols[1].Clear;
  Form7.StringGridChat.RowCount := 1;

  Form9.StringGridChat.Cols[0].Clear;
  Form9.StringGridChat.Cols[1].Clear;
  Form9.StringGridChat.RowCount := 1;

  Form10.StringGridChat.Cols[0].Clear;
  Form10.StringGridChat.Cols[1].Clear;
  Form10.StringGridChat.RowCount := 1;

  Q_Act.SQL.Clear;
  Q_Act.SQL.Add('SELECT Setter, Getter, Text FROM chat WHERE (Setter = ');
  Q_Act.SQL.Add(Q_Chat.FieldByName('Setter').AsString);
  Q_Act.SQL.Add(' AND Getter = ');
  Q_Act.SQL.Add(Q_Chat.FieldByName('Getter').AsString);
  Q_Act.SQL.Add(') OR (Setter = ');
  Q_Act.SQL.Add(Q_Chat.FieldByName('Getter').AsString);
  Q_Act.SQL.Add(' AND Getter = ');
  Q_Act.SQL.Add(Q_Chat.FieldByName('Setter').AsString);
  Q_Act.SQL.Add(') ORDER BY MessageID ASC');
  Q_Act.ExecSQL;
  Q_Act.Active := False;
  Q_Act.Active := True;

  while not DataModule2.Q_Act.Eof do begin
    if DataModule2.Q_Act.FieldByName('Setter').AsInteger = UserID then begin
      Form1.StringGridChat.Cells[1, Form1.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString;
      Form7.StringGridChat.Cells[1, Form7.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString;
      Form9.StringGridChat.Cells[1, Form9.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString;
      Form10.StringGridChat.Cells[1, Form10.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString;
    end
    else begin
      Form1.StringGridChat.Cells[0, Form1.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString;
      Form7.StringGridChat.Cells[0, Form7.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString;
      Form9.StringGridChat.Cells[0, Form9.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString;
      Form10.StringGridChat.Cells[0, Form10.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString;
    end;
    Form1.StringGridChat.RowCount := Form1.StringGridChat.RowCount + 1;
    Form7.StringGridChat.RowCount := Form7.StringGridChat.RowCount + 1;
    Form9.StringGridChat.RowCount := Form9.StringGridChat.RowCount + 1;
    Form10.StringGridChat.RowCount := Form10.StringGridChat.RowCount + 1;
    Q_Act.Next;
  end;
end;

procedure TDataModule2.Q_SellersAfterScroll(DataSet: TDataSet);
begin
  Form9.SellerImagePath := Q_Sellers.FieldByName('UserImage').AsString;
  Form9.ImageSellers.Picture.LoadFromFile(Q_Sellers.FieldByName('UserImage').AsString);

  Form10.SellerImagePath := Q_Sellers.FieldByName('UserImage').AsString;
  Form10.ImageSellers.Picture.LoadFromFile(Q_Sellers.FieldByName('UserImage').AsString);
end;

procedure TDataModule2.Q_SoldCarsAfterScroll(DataSet: TDataSet);
begin
  Form10.RichEditSoldDescription.Text := Q_SoldCars.FieldByName('CarDescription').AsString;
  Form10.EditSold.Text := Q_SoldCars.FieldByName('UserPhone').AsString + ' ' +
  Q_SoldCars.FieldByName('UserName').AsString;
  Form10.ImageSold.Picture.LoadFromFile(Q_SoldCars.FieldByName('CarImage').AsString);

  Form10.RichEditSold.Text := Q_SoldCars.FieldByName('CarName').AsString + sLineBreak + sLineBreak;
  Form10.RichEditSold.Text := Form10.RichEditSold.Text + '??? ???????               ' + Q_SoldCars.FieldByName('CarBirth').AsString + sLineBreak;
  Form10.RichEditSold.Text := Form10.RichEditSold.Text + '????, ?                       ' + Q_SoldCars.FieldByName('CarCost').AsString + sLineBreak;
  Form10.RichEditSold.Text := Form10.RichEditSold.Text + '???                            ' + Q_SoldCars.FieldByName('GearType').AsString + sLineBreak;
  Form10.RichEditSold.Text := Form10.RichEditSold.Text + '?????                          ' + Q_SoldCars.FieldByName('CarBodyName').AsString + sLineBreak;
  Form10.RichEditSold.Text := Form10.RichEditSold.Text + '?????????                  ' + Q_SoldCars.FieldByName('EngineTypeName').AsString + sLineBreak;
  Form10.RichEditSold.Text := Form10.RichEditSold.Text + '????? ?????????, ?    ' + Q_SoldCars.FieldByName('CarTechEngineVolume').AsString + sLineBreak;
  Form10.RichEditSold.Text := Form10.RichEditSold.Text + '??????                       ' + Q_SoldCars.FieldByName('DriveType').AsString + sLineBreak;
  Form10.RichEditSold.Text := Form10.RichEditSold.Text + '????????, ?.?.           ' + Q_SoldCars.FieldByName('CarTechPower').AsString + sLineBreak;
  Form10.RichEditSold.Text := Form10.RichEditSold.Text + '???????????? ????    ' + Q_SoldCars.FieldByName('WheelType').AsString + sLineBreak;
  if Q_SoldCars.FieldByName('CarAddress').AsString.CompareTo('').ToBoolean then
    Form10.RichEditSold.Text := Form10.RichEditSold.Text + sLineBreak + '?????                          ' + Q_SoldCars.FieldByName('CarAddress').AsString;

end;

end.
