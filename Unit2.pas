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
    procedure Q_CarsAfterScroll(DataSet: TDataSet);
    procedure Q_SellersAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure Q_SoldCarsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    F3: boolean;
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Unit1, Unit3;

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  F3 := False;
end;

procedure TDataModule2.Q_CarsAfterScroll(DataSet: TDataSet);
begin
  Form1.CarInfo.Text := Q_Cars.FieldByName('CarDescription').AsString;
  Form1.CarSeller.Text := Q_Cars.FieldByName('UserPhone').AsString + ' ' +
  Q_Cars.FieldByName('UserName').AsString;
  Form1.CarImage.Picture.LoadFromFile(Q_Cars.FieldByName('CarImage').AsString);

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
