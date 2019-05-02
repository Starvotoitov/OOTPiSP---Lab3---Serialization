unit OOP_Factory;

interface

uses
  OOP_1, JewelryProduct;

type
  TCreator = class
    function FactoryMethod: TJewelryProduct; virtual; abstract;
  end;

  [TInfoAttribute('Создать драгоценный камень')]
  TGemCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('Создать драгоценный метал')]
  TPreciousMetalCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('Создать ювелирное изделие')]
  TJewelryCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('Создать цепочку')]
  TChainCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('Создать кольцо')]
  TRingsCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('Создать подвеску')]
  TPendantsCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('Создать аромакулон')]
  TAromapendantsCreator = class(TCreator)
    function FactoryMethod: TJewelryProduct; override;
  end;

  [TInfoAttribute('Создать медальон')]
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
