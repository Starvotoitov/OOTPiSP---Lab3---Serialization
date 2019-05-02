unit OOP_Factory;

interface

uses
  OOP_1, JewelryProduct;

type
  TCreator = class
    function FactoryMethod: TJewelryProduct; virtual; abstract;
  end;

  [TInfoAttribute('������� ����������� ������')]
  TGemCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('������� ����������� �����')]
  TPreciousMetalCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('������� ��������� �������')]
  TJewelryCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('������� �������')]
  TChainCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('������� ������')]
  TRingsCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('������� ��������')]
  TPendantsCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('������� ����������')]
  TAromapendantsCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('������� ��������')]
  TMedallionCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

implementation

function TGemCreator.FactoryMethod: TJewelryProduct;
begin
  Result:=TGem.Create;
end;

function TPreciousMetalCreator.FactoryMethod: TJewelryProduct;
begin
  Result:=TPreciousMetal.Create;
end;

function TJewelryCreator.FactoryMethod: TJewelryProduct;
begin
  Result:=TJewelry.Create;
end;

function TChainCreator.FactoryMethod: TJewelryProduct;
begin
  Result:=TChain.Create;
end;

function TRingsCreator.FactoryMethod: TJewelryProduct;
begin
  Result:=TRings.Create;
end;

function TPendantsCreator.FactoryMethod: TJewelryProduct;
begin
  Result:=TPendants.Create;
end;

function TAromapendantsCreator.FactoryMethod: TJewelryProduct;
begin
  Result:=TAromapendants.Create;
end;

function TMedallionCreator.FactoryMethod: TJewelryProduct;
begin
  Result:=TMedallion.Create;
end;

end.
