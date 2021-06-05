unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.JPEG;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    CarSeller: TEdit;
    SearchButton: TButton;
    AdminButton: TButton;
    Search: TComboBox;
    SearchMin: TEdit;
    SearchMax: TEdit;
    ClearButton: TButton;
    CarInfo: TRichEdit;
    CarImage: TImage;
    NameSearch: TEdit;
    Label1: TLabel;
    procedure AdminButtonClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure NameSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4;

procedure TForm1.AdminButtonClick(Sender: TObject);
begin
  Form4.Show;
  Form1.Visible := False;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
begin
  Search.ItemIndex := -1;
  SearchMin.Text := '';
  SearchMax.Text := '';
  DataModule2.Q_Cars.SQL.Clear;
  DataModule2.Q_Cars.SQL.Add('SELECT');
  DataModule2.Q_Cars.SQL.Add('c.CarID, c.CarBirth, ');
  DataModule2.Q_Cars.SQL.Add('c.CarCost, c.CarDate, ');
  DataModule2.Q_Cars.SQL.Add('c.CarDescription, c.CarPriority, ');
  DataModule2.Q_Cars.SQL.Add('c.CarImage, ct.CarTechName, ');
  DataModule2.Q_Cars.SQL.Add('ct.CarTechEngineVolume, ct.CarTechPower, ');
  DataModule2.Q_Cars.SQL.Add('ct.CarBodyID, ct.EngineTypeID, ');
  DataModule2.Q_Cars.SQL.Add('cb.CarBodyName, et.EngineTypeName, ');
  DataModule2.Q_Cars.SQL.Add('g.GearID, g.GearType, ');
  DataModule2.Q_Cars.SQL.Add('d.DriveID, d.DriveType, ');
  DataModule2.Q_Cars.SQL.Add('s.SellerID, s.SellerName, ');
  DataModule2.Q_Cars.SQL.Add('s.SellerPhone, a.AdressName ');
  DataModule2.Q_Cars.SQL.Add('FROM car c, cartech ct, carbody cb, enginetype et, ');
  DataModule2.Q_Cars.SQL.Add('gear g, drive d, seller s, address a ');
  DataModule2.Q_Cars.SQL.Add('WHERE c.CarTechID = ct.CarTechID AND c.SellerID = s.SellerID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.CarBodyID = cb.CarBodyID AND ct.EngineTypeID = et.EngineTypeID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.GearID = g.GearID AND ct.DriveID = d.DriveID ');
  DataModule2.Q_Cars.SQL.Add('AND s.AddressID = a.AddressID ');
  DataModule2.Q_Cars.SQL.Add('ORDER BY c.CarPriority DESC, c.CarDate Desc ');
  DataModule2.Q_Cars.Active := True;
end;

procedure TForm1.NameSearchChange(Sender: TObject);
begin
  DataModule2.Q_Cars.Filtered := False;
  if length(NameSearch.Text) > 0 then begin
    DataModule2.Q_Cars.Filter := '[CarTechName] like ' +
      QuotedStr('%' + NameSearch.Text + '%');
    DataModule2.Q_Cars.Filtered := true;
  end;

end;

procedure TForm1.SearchButtonClick(Sender: TObject);
begin
  if (Length(SearchMin.Text) <> 0) and (Length(SearchMax.Text) <> 0) and (Search.ItemIndex = 0) then begin
  DataModule2.Q_Cars.SQL.Clear;
  DataModule2.Q_Cars.SQL.Add('SELECT');
  DataModule2.Q_Cars.SQL.Add('c.CarID, c.CarBirth, ');
  DataModule2.Q_Cars.SQL.Add('c.CarCost, c.CarDate, ');
  DataModule2.Q_Cars.SQL.Add('c.CarDescription, c.CarPriority, ');
  DataModule2.Q_Cars.SQL.Add('c.CarImage, ct.CarTechName, ');
  DataModule2.Q_Cars.SQL.Add('ct.CarTechEngineVolume, ct.CarTechPower, ');
  DataModule2.Q_Cars.SQL.Add('ct.CarBodyID, ct.EngineTypeID, ');
  DataModule2.Q_Cars.SQL.Add('cb.CarBodyName, et.EngineTypeName, ');
  DataModule2.Q_Cars.SQL.Add('g.GearID, g.GearType, ');
  DataModule2.Q_Cars.SQL.Add('d.DriveID, d.DriveType, ');
  DataModule2.Q_Cars.SQL.Add('s.SellerID, s.SellerName, ');
  DataModule2.Q_Cars.SQL.Add('s.SellerPhone, a.AdressName ');
  DataModule2.Q_Cars.SQL.Add('FROM car c, cartech ct, carbody cb, enginetype et, ');
  DataModule2.Q_Cars.SQL.Add('gear g, drive d, seller s, address a ');
  DataModule2.Q_Cars.SQL.Add('WHERE c.CarTechID = ct.CarTechID AND c.SellerID = s.SellerID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.CarBodyID = cb.CarBodyID AND ct.EngineTypeID = et.EngineTypeID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.GearID = g.GearID AND ct.DriveID = d.DriveID ');
  DataModule2.Q_Cars.SQL.Add('AND s.AddressID = a.AddressID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.CarTechEngineVolume >=' + SearchMin.Text + ' ');
  DataModule2.Q_Cars.SQL.Add('AND ct.CarTechEngineVolume <=' + SearchMax.Text + ' ');
  DataModule2.Q_Cars.SQL.Add('ORDER BY c.CarPriority DESC, c.CarDate Desc');
  DataModule2.Q_Cars.Active := True;
  end;
  if (Length(SearchMin.Text) <> 0) and (Length(SearchMax.Text) <> 0) and (Search.ItemIndex = 1) then begin
  DataModule2.Q_Cars.SQL.Clear;
  DataModule2.Q_Cars.SQL.Add('SELECT');
  DataModule2.Q_Cars.SQL.Add('c.CarID, c.CarBirth, ');
  DataModule2.Q_Cars.SQL.Add('c.CarCost, c.CarDate, ');
  DataModule2.Q_Cars.SQL.Add('c.CarDescription, c.CarPriority, ');
  DataModule2.Q_Cars.SQL.Add('c.CarImage, ct.CarTechName, ');
  DataModule2.Q_Cars.SQL.Add('ct.CarTechEngineVolume, ct.CarTechPower, ');
  DataModule2.Q_Cars.SQL.Add('ct.CarBodyID, ct.EngineTypeID, ');
  DataModule2.Q_Cars.SQL.Add('cb.CarBodyName, et.EngineTypeName, ');
  DataModule2.Q_Cars.SQL.Add('g.GearID, g.GearType, ');
  DataModule2.Q_Cars.SQL.Add('d.DriveID, d.DriveType, ');
  DataModule2.Q_Cars.SQL.Add('s.SellerID, s.SellerName, ');
  DataModule2.Q_Cars.SQL.Add('s.SellerPhone, a.AdressName ');
  DataModule2.Q_Cars.SQL.Add('FROM car c, cartech ct, carbody cb, enginetype et, ');
  DataModule2.Q_Cars.SQL.Add('gear g, drive d, seller s, address a ');
  DataModule2.Q_Cars.SQL.Add('WHERE c.CarTechID = ct.CarTechID AND c.SellerID = s.SellerID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.CarBodyID = cb.CarBodyID AND ct.EngineTypeID = et.EngineTypeID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.GearID = g.GearID AND ct.DriveID = d.DriveID ');
  DataModule2.Q_Cars.SQL.Add('AND s.AddressID = a.AddressID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.CarTechPower >=' + SearchMin.Text + ' ');
  DataModule2.Q_Cars.SQL.Add('AND ct.CarTechPower <=' + SearchMax.Text + ' ');
  DataModule2.Q_Cars.SQL.Add('ORDER BY c.CarPriority DESC, c.CarDate Desc');
  DataModule2.Q_Cars.Active := True;
  end;
  if (Length(SearchMin.Text) <> 0) and (Length(SearchMax.Text) <> 0) and (Search.ItemIndex = 2) then begin
  DataModule2.Q_Cars.SQL.Clear;
  DataModule2.Q_Cars.SQL.Add('SELECT');
  DataModule2.Q_Cars.SQL.Add('c.CarID, c.CarBirth, ');
  DataModule2.Q_Cars.SQL.Add('c.CarCost, c.CarDate, ');
  DataModule2.Q_Cars.SQL.Add('c.CarDescription, c.CarPriority, ');
  DataModule2.Q_Cars.SQL.Add('c.CarImage, ct.CarTechName, ');
  DataModule2.Q_Cars.SQL.Add('ct.CarTechEngineVolume, ct.CarTechPower, ');
  DataModule2.Q_Cars.SQL.Add('ct.CarBodyID, ct.EngineTypeID, ');
  DataModule2.Q_Cars.SQL.Add('cb.CarBodyName, et.EngineTypeName, ');
  DataModule2.Q_Cars.SQL.Add('g.GearID, g.GearType, ');
  DataModule2.Q_Cars.SQL.Add('d.DriveID, d.DriveType, ');
  DataModule2.Q_Cars.SQL.Add('s.SellerID, s.SellerName, ');
  DataModule2.Q_Cars.SQL.Add('s.SellerPhone, a.AdressName ');
  DataModule2.Q_Cars.SQL.Add('FROM car c, cartech ct, carbody cb, enginetype et, ');
  DataModule2.Q_Cars.SQL.Add('gear g, drive d, seller s, address a ');
  DataModule2.Q_Cars.SQL.Add('WHERE c.CarTechID = ct.CarTechID AND c.SellerID = s.SellerID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.CarBodyID = cb.CarBodyID AND ct.EngineTypeID = et.EngineTypeID ');
  DataModule2.Q_Cars.SQL.Add('AND ct.GearID = g.GearID AND ct.DriveID = d.DriveID ');
  DataModule2.Q_Cars.SQL.Add('AND s.AddressID = a.AddressID ');
  DataModule2.Q_Cars.SQL.Add('AND c.CarBirth >=' + SearchMin.Text + ' ');
  DataModule2.Q_Cars.SQL.Add('AND c.CarBirth <=' + SearchMax.Text + ' ');
  DataModule2.Q_Cars.SQL.Add('ORDER BY c.CarPriority DESC, c.CarDate Desc');
  DataModule2.Q_Cars.Active := True;
  end;
end;

end.
