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
    F3: boolean;
    UserID: Integer;
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ViewBuyer, Unit3, ViewSeller;

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  F3 := False;
  UserID := 1;
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

  if Q_Cars.FieldByName('CarCondition').AsInteger = 0 then
    Form1.RichEditParams.Text := '����� ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak
  else
    Form1.RichEditParams.Text := '�/� ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '��� �������               ' + Q_Cars.FieldByName('CarBirth').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '����, �                       ' + Q_Cars.FieldByName('CarCost').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '���                            ' + Q_Cars.FieldByName('GearType').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '�����                          ' + Q_Cars.FieldByName('CarBodyName').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '���������                  ' + Q_Cars.FieldByName('EngineTypeName').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '����� ���������, �    ' + Q_Cars.FieldByName('CarTechEngineVolume').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '������                       ' + Q_Cars.FieldByName('DriveType').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '��������, �.�.           ' + Q_Cars.FieldByName('CarTechPower').AsString + sLineBreak;
  Form1.RichEditParams.Text := Form1.RichEditParams.Text + '������������ ����    ' + Q_Cars.FieldByName('WheelType').AsString + sLineBreak;

  if Q_Cars.FieldByName('CarCondition').AsInteger = 0 then
    Form7.RichEditParams.Text := '����� ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak
  else
    Form7.RichEditParams.Text := '�/� ' + Q_Cars.FieldByName('CarName').AsString + sLineBreak + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '��� �������               ' + Q_Cars.FieldByName('CarBirth').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '����, �                       ' + Q_Cars.FieldByName('CarCost').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '���                            ' + Q_Cars.FieldByName('GearType').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '�����                          ' + Q_Cars.FieldByName('CarBodyName').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '���������                  ' + Q_Cars.FieldByName('EngineTypeName').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '����� ���������, �    ' + Q_Cars.FieldByName('CarTechEngineVolume').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '������                       ' + Q_Cars.FieldByName('DriveType').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '��������, �.�.           ' + Q_Cars.FieldByName('CarTechPower').AsString + sLineBreak;
  Form7.RichEditParams.Text := Form7.RichEditParams.Text + '������������ ����    ' + Q_Cars.FieldByName('WheelType').AsString + sLineBreak;

  if F3 then begin
    if Q_Cars.FieldByName('CarImage').AsString <> '' then begin
      Form3.CarImagePath := Q_Cars.FieldByName('CarImage').AsString;
      Form3.CarImage.Picture.LoadFromFile(Q_Cars.FieldByName('CarImage').AsString);
    end
    else begin
      Form3.CarImagePath := '';
      Form3.CarImage.Picture.LoadFromFile('NI.png');
    end;
    Form3.CarInfo.Text := Q_Cars.FieldByName('CarDescription').AsString;
    Form3.CarName.Text := Q_Cars.FieldByName('CarTechName').AsString;
    Form3.CarEngineVolume.Text := StringReplace(Q_Cars.FieldByName('CarTechEngineVolume').AsString, ',', '.', [rfReplaceAll]);
    Form3.CarEnginePower.Text := Q_Cars.FieldByName('CarTechPower').AsString;
    Form3.CarGear.ItemIndex := StrToInt(Q_Cars.FieldByName('GearID').AsString) - 1;
    Form3.CarDrive.ItemIndex := StrToInt(Q_Cars.FieldByName('DriveID').AsString) - 1;
    Form3.Priority.Text := Q_Cars.FieldByName('CarPriority').AsString;
    Form3.CarBirth.Text := Q_Cars.FieldByName('CarBirth').AsString;
    Form3.CarCost.Text := Q_Cars.FieldByName('CarCost').AsString;
    Form3.CarSeller.ItemIndex := StrToInt(Q_Cars.FieldByName('UserID').AsString) -1;
    Form3.CarEngine.ItemIndex := StrToInt(Q_Cars.FieldByName('EngineTypeID').AsString) -1;
    Form3.CarBody.ItemIndex := StrToInt(Q_Cars.FieldByName('CarBodyID').AsString) -1;
  end;
end;

procedure TDataModule2.Q_CarsUserAfterScroll(DataSet: TDataSet);
begin
  Form7.RichEditDescriptionSelf.Text := Q_CarsUser.FieldByName('CarDescription').AsString;
  Form7.ImageCarSeller.Picture.LoadFromFile(Q_CarsUser.FieldByName('CarImage').AsString);
  Form7.CarImagePath := Q_CarsUser.FieldByName('CarImage').AsString;

  Form7.ComboBoxModelSelf.ItemIndex := -1;
  Form7.ComboBoxModelSelf.Items.Clear;
  Q_Model.SQL.Clear;
  Q_Model.SQL.Add('SELECT ModelName FROM CarTechModel WHERE ModelBrandID = ');
  Q_Model.SQL.Add(Q_CarsUser.FieldByName('BrandID').AsString);
  Q_Model.ExecSQL;
  Q_Model.Active := False;
  Q_Model.Active := True;
  while not Q_Model.Eof do begin
    Form7.ComboBoxModelSelf.Items.Add(Q_Model.FieldByName('ModelName').AsString);
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
end;

procedure TDataModule2.Q_ChatAfterScroll(DataSet: TDataSet);
begin
  Form7.StringGridChat.Cols[0].Clear;
  Form7.StringGridChat.Cols[1].Clear;
  Form7.StringGridChat.RowCount := 1;

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
    if DataModule2.Q_Act.FieldByName('Setter').AsInteger = UserID then
      Form7.StringGridChat.Cells[1, Form7.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString
    else
      Form7.StringGridChat.Cells[0, Form7.StringGridChat.RowCount - 1] := DataModule2.Q_Act.FieldByName('Text').AsString;
    Form7.StringGridChat.RowCount := Form7.StringGridChat.RowCount + 1;
    Q_Act.Next;
  end;
end;

procedure TDataModule2.Q_SellersAfterScroll(DataSet: TDataSet);
begin
  if F3 then begin
    if Q_Sellers.FieldByName('SellerImage').AsString <> '' then begin
      Form3.SellerImagePath := Q_Sellers.FieldByName('SellerImage').AsString;
      Form3.SellerImage.Picture.LoadFromFile(Q_Sellers.FieldByName('SellerImage').AsString);
    end
    else begin
      Form3.SellerImagePath := '';
      Form3.SellerImage.Picture.LoadFromFile('NI.png');
    end;
    //Form3.SellerName.Text := Q_Sellers.FieldByName('UserName').AsString;
    Form3.SellerPhone.Text := Q_Sellers.FieldByName('SellerPhone').AsString;
    Form3.SellerAddress.ItemIndex := StrToInt(Q_Sellers.FieldByName('AddressID').AsString) -1;
  end;
end;

procedure TDataModule2.Q_SoldCarsAfterScroll(DataSet: TDataSet);
begin
  if F3 then begin
    if Q_SoldCars.FieldByName('SoldCarImage').AsString <> '' then begin
      Form3.SoldCarImage.Picture.LoadFromFile(Q_SoldCars.FieldByName('SoldCarImage').AsString);
    end
    else
      Form3.SoldCarImage.Picture.LoadFromFile('NI.png');
    Form3.SoldCarInfo.Text := Q_SoldCars.FieldByName('SoldCarDescription').AsString;
    Form3.SoldCarSeller.Text := Q_SoldCars.FieldByName('SellerPhone').AsString + ' ' +
    Q_SoldCars.FieldByName('UserName').AsString + ' ���� ' + Q_SoldCars.FieldByName('AdressName').AsString;
  end;
end;

end.
