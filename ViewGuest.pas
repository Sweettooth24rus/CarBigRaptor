unit ViewGuest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.JPEG,
  Data.Bind.GenData, Vcl.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.Bind.ObjectScope, Vcl.ExtDlgs;

type
  TForm11 = class(TForm)
    DBGridCar: TDBGrid;
    CarSeller: TEdit;
    CarInfo: TRichEdit;
    CarImage: TImage;
    RichEditParams: TRichEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBoxSort: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    GroupBoxParams: TGroupBox;
    ButtonFilter: TButton;
    RadioButtonConditionNew: TRadioButton;
    RadioButtonConditionUsed: TRadioButton;
    ComboBoxBrand: TComboBox;
    ComboBoxModel: TComboBox;
    RadioButtonConditionAny: TRadioButton;
    EditYear1: TEdit;
    EditYear2: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    EditCost1: TEdit;
    Label21: TLabel;
    EditCost2: TEdit;
    ComboBoxGear: TComboBox;
    ComboBoxBody: TComboBox;
    ComboBoxEngine: TComboBox;
    ComboBoxDrive: TComboBox;
    Label22: TLabel;
    EditVolume1: TEdit;
    Label23: TLabel;
    EditVolume2: TEdit;
    Label24: TLabel;
    EditPower1: TEdit;
    Label25: TLabel;
    EditPower2: TEdit;
    CheckBoxPhoto: TCheckBox;
    GroupBoxCondition: TGroupBox;
    GroupBoxWheel: TGroupBox;
    RadioButtonWheelRight: TRadioButton;
    RadioButtonWheelLeft: TRadioButton;
    RadioButtonWheelAny: TRadioButton;
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
    ButtonClear: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    procedure ImageBrandClick(Sender: TObject);
    procedure ImageModelClick(Sender: TObject);
    procedure ImageGearClick(Sender: TObject);
    procedure ImageBodyClick(Sender: TObject);
    procedure ImageEngineClick(Sender: TObject);
    procedure ImageDriveClick(Sender: TObject);
    procedure ImageYearClick(Sender: TObject);
    procedure ImageCostClick(Sender: TObject);
    procedure ImageVolumeClick(Sender: TObject);
    procedure ImagePowerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxBrandChange(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ComboBoxSortChange(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure ButtonFilterClick(Sender: TObject);
    procedure ButtonSellCarClick(Sender: TObject);
    procedure ButtonChatClick(Sender: TObject);
    procedure SellerDeleteClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
  private
    { Private declarations }
    Sort: Bool;
    Filter: Bool;
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit6, Unit8;

procedure TForm11.ButtonChatClick(Sender: TObject);
begin
  Form8.Show();
end;

procedure TForm11.ButtonClearClick(Sender: TObject);
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

procedure TForm11.ButtonFilterClick(Sender: TObject);
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
    if Form11.Sort then
      SQL.Add('0)')
    else
      SQL.Add('1)');

    ExecSQL;
    Active := False;
    Active := True;
  end;
end;

procedure TForm11.ButtonRefreshClick(Sender: TObject);
begin
  DataModule2.Q_Chat.Active := False;
  DataModule2.Q_Chat.Active := True;
end;

procedure TForm11.ButtonSellCarClick(Sender: TObject);
begin
  Form6.Show;
end;

procedure TForm11.ComboBoxBrandChange(Sender: TObject);
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

procedure TForm11.ComboBoxSortChange(Sender: TObject);
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

procedure TForm11.FormShow(Sender: TObject);
begin
  Sort := True;
  Filter := False;

  ComboBoxSort.Items.Add('???? ??????????');
  ComboBoxSort.Items.Add('????');
  ComboBoxSort.Items.Add('???? ????????????');
  ComboBoxSort.Items.Add('????????');
  ComboBoxSort.Items.Add('?????? ?????????');
  ComboBoxSort.Items.Add('???????? ?????????');
  ComboBoxSort.ItemIndex := 0;

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

procedure TForm11.ImageBodyClick(Sender: TObject);
begin
  ComboBoxBody.ItemIndex := -1;
end;

procedure TForm11.ImageBrandClick(Sender: TObject);
begin
  ComboBoxBrand.ItemIndex := -1;
  ComboBoxModel.ItemIndex := -1;
  ComboBoxModel.Items.Clear;
end;

procedure TForm11.ImageCostClick(Sender: TObject);
begin
  EditCost1.Text := '';
  EditCost2.Text := '';
end;

procedure TForm11.ImageDriveClick(Sender: TObject);
begin
  ComboBoxDrive.ItemIndex := -1;
end;

procedure TForm11.ImageEngineClick(Sender: TObject);
begin
  ComboBoxEngine.ItemIndex := -1;
end;

procedure TForm11.ImageGearClick(Sender: TObject);
begin
  ComboBoxGear.ItemIndex := -1;
end;

procedure TForm11.ImageModelClick(Sender: TObject);
begin
  ComboBoxModel.ItemIndex := -1;
end;

procedure TForm11.ImagePowerClick(Sender: TObject);
begin
  EditPower1.Text := '';
  EditPower2.Text := '';
end;

procedure TForm11.ImageVolumeClick(Sender: TObject);
begin
  EditVolume1.Text := '';
  EditVolume2.Text := '';
end;

procedure TForm11.ImageYearClick(Sender: TObject);
begin
  EditYear1.Text := '';
  EditYear2.Text := '';
end;

procedure TForm11.Label4Click(Sender: TObject);
begin
  if Sort then
    Label4.Caption := '?????????? ?? ????????'
  else
    Label4.Caption := '?????????? ?? ???????????';
  Sort := NOT Sort;
  ComboBoxSortChange(Label4);
end;

procedure TForm11.SellerDeleteClick(Sender: TObject);
begin
  with DataModule2.Q_Act do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM User WHERE UserID = ' + IntToStr(DataModule2.UserID));
    ExecSQL;
  end;
  Form4.Show;
end;

end.
