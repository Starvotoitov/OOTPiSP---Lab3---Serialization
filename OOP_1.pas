unit OOP_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TypInfo, Rtti, Serializer, JewelryProduct;

const
  DefaultLeft = 350;
  DefaultTop = 10;
  DefaultWidth = 185;
  DefaultHeight = 20;

type

  TInfoAttribute = class(TCustomAttribute)
  public
    FInfoName: string;
    constructor Create(const NameValue: string);
  end;

  {$M+}

  [TInfoAttribute('Рубин')]
  [TInfoAttribute('Изумруд')]
  [TInfoAttribute('Алмаз')]
  [TInfoAttribute('Кварц')]
  [TInfoAttribute('Гранат')]
  [TInfoAttribute('Топаз')]
  [TInfoAttribute('Опал')]
  TGemType = (Ruby, Emerald, Dimond, Quartz, Garnet, Topaz, Opal);

  [TInfoAttribute('Золото')]
  [TInfoAttribute('Серебро')]
  [TInfoAttribute('Платина')]
  TMetalType = (Gold, Silver, Platinum);

  [TInfoAttribute('Квадратная')]
  [TInfoAttribute('Треугольная')]
  [TInfoAttribute('Круглая')]
  [TInfoAttribute('Куплевидная')]
  [TInfoAttribute('Уникальная')]
  TPendantsForm = (Square, Triangle, Circle, Drop, Unique);

  [TInfoAttribute('Панцирное плетение')]
  [TInfoAttribute('Ромб')]
  [TInfoAttribute('Якорное')]
  [TInfoAttribute('Фигаро')]
  [TInfoAttribute('Перлина')]
  TTypeOfWeaving = (ArmorWeaving, Rhombus, AnchorWeaving, Figaro, Perlina);

  [TInfoAttribute('Роза')]
  [TInfoAttribute('Жасмин')]
  [TInfoAttribute('Герань')]
  [TInfoAttribute('Лаванда')]
  [TInfoAttribute('Шалфей')]
  TEssentialOil = (Rose, Jasmine, Geranium, Lavander, Sage);



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

  [TInfoAttribute('Драгоценный камень')]
  TGem = class(TJewelryProduct)
  private
    FGemType: TGemType;
    FSize: real;
    FMass: real;
    FPurity: real;
  published
    [TInfoAttribute('Тип камня')]
    property GemType: TGemType read FGemType write FGemType;
    [TInfoAttribute('Размер камня')]
    property Size: real read FSize write FSize;
    [TInfoAttribute('Масса камня')]
    property Mass: real read FMass write FMass;
    [TInfoAttribute('Чистота камня')]
    property Purity: real read FPurity write FPurity;
  end;

  [TInfoAttribute('Драгоценный металл')]
  TPreciousMetal = class(TJewelryProduct)
  private
    FMetalType: TMetalType;
    FWight: real;
    FSample: integer;
    FAveragePrice: real;
  published
    [TInfoAttribute('Тип металла')]
    property MetalType: TMetalType read FMetalType write FMetalType;
    [TInfoAttribute('Вес металла')]
    property Wight: real read FWight write FWight;
    [TInfoAttribute('Проба металла')]
    property Sample: integer read FSample write FSample;
    [TInfoAttribute('Средняя цена')]
    property AveragePrice: real read FAveragePrice write FAveragePrice;
  end;

  [TInfoAttribute('Ювелирное изделие')]
  TJewelry = class(TJewelryProduct)
  private
    FOwnersName: string;
    FAuthorsName: string;
    FPrice: real;
    FPreciousMetal: TPreciousMetal;
    FGems: TGem;
    FCollection: string;
    FProcessing: string;
    FStyle: string;
  published
    [TInfoAttribute('Имя владельца')]
    property OwnersName: string read FOwnersName write FOwnersName;
    [TInfoAttribute('Имя автора')]
    property AuthorsName: string read FAuthorsName write FAuthorsName;
    [TInfoAttribute('Цена изделия')]
    property Price: real read FPrice write FPrice;
    [TInfoAttribute('Драгоценный металл')]

    property PreciousMetal: TPreciousMetal read FPreciousMetal write FPreciousMetal;
    [TInfoAttribute('Драгоценный камень')]
    property Gems: TGem read FGems write FGems;
    [TInfoAttribute('Коллекция')]
    property Collection: string read FCollection write FCollection;
    [TInfoAttribute('Обработка')]
    property Processing: string read FProcessing write FProcessing;
    [TInfoAttribute('Стиль')]
    property Style: string read FStyle write FStyle;
  end;

  [TInfoAttribute('Цепочка')]
  TChain = class(TJewelry)
  private
    FLength: real;
    FTypeOfWeaving: TTypeOfWeaving;
  published
    [TInfoAttribute('Длина цепочки')]
    property Length: real read FLength write FLength;
    [TInfoAttribute('Тип плетения')]
    property TypeOfWeaving: TTypeOfWeaving read FTypeOfWeaving write FTypeOfWeaving;
  end;

  [TInfoAttribute('Кольцо')]
  TRings = class(TJewelry)
  private
    FSize: real;
    FEngraving: string;
  published
    [TInfoAttribute('Размер кольца')]
    property Size: real read FSize write FSize;
    [TInfoAttribute('Гравировка')]
    property Engraving: string read FEngraving write FEngraving;
  end;

  [TInfoAttribute('Подвеска')]
  TPendants = class(TJewelry)
  private
    FChainThickness: real;
    FForm: TPendantsForm;
    FDimensions: real;
  published
    [TInfoAttribute('Толщина подвески')]
    property ChainThickness: real read FChainThickness write FChainThickness;
    [TInfoAttribute('Форма подвески')]
    property Form: TPendantsForm read FForm write FForm;
    [TInfoAttribute('Размер подвески')]
    property Dimensions: real read FDimensions write FDimensions;
  end;

  [TInfoAttribute('Аромакулон')]
  TAromapendants = class(TPendants)
  private
    FVolume: real;
    FEssentialOil: TEssentialOil;
  published
    [TInfoAttribute('Объем')]
    property Volume: real read FVolume write FVolume;
    [TInfoAttribute('Тип аромамасла')]
    property EssentialOil: TEssentialOil read FEssentialOil write FEssentialOil;
  end;

  [TInfoAttribute('Медальон')]
  TMedallion = class(TPendants)
  private
    FWithPhoto: string;
    FRelicsSize: real;
  published
    [TInfoAttribute('Фото')]
    property Photo: string read FWithPhoto write FWithPhoto;
    [TInfoAttribute('Размер фото')]
    property RelicsSize: real read FRelicsSize write FRelicsSize;
  end;

  {$M-}

  TControllerList = ^TController;
  TController = record
                 Controller: TComponent;
                 Next: TControllerList;
               end;

  TProductList = ^TProduct;
  TProduct = record
               Product: TJewelryProduct;
               Next: TProductList;
             end;

  TItemCreator = record
                   ObjName: string;
                   Creator: TCreator;
                 end;

  TfMain = class(TForm)
    cbCreate: TComboBox;
    bCreate: TButton;
    bClose: TButton;
    bChange: TButton;
    bDelete: TButton;
    lbProducts: TListBox;
    dDeserialize: TOpenDialog;
    dSerialize: TSaveDialog;
    Сериализовать: TButton;
    Десериализовать: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bCreateClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure bChangeClick(Sender: TObject);
    procedure lbProductsClick(Sender: TObject);
    procedure СериализоватьClick(Sender: TObject);
    procedure ДесериализоватьClick(Sender: TObject);

  private
    { Private declarations }
  public
    FProductListHeader: TProductList;
    FProductListLast: TProductList;
    FControllerListHeader: TControllerList;
    FControllerListLast: TControllerList;
    FCreatorsArr: array of TItemCreator;
    FClassNamesArr: array of string;
    FSerializerArr: array of TSerializer;

    function FindInProductListByIndex(Index: integer): TProductList;
    function CreateButton(Owner: TComponent; Parent: TWinControl; Left, Top, Width, Height: integer; const Caption: string): TButton;
    function CreateLabel(Owner: TComponent; Parent: TWinControl; Left, Top, Width, Height: integer; const Caption: string): TLabel;
    function CreateEdit(Owner: TComponent; Parent: TWinControl; Left, Top, Width, Height: integer; const Text: string): TEdit;
    function CreateComboBox(Owner: TComponent; Parent: TWinControl; Left, Top, Width, Height: integer; Prop: TRttiProperty; const CurrentValue: string): TComboBox;
    function FindCreatorByType(const CreatorType: string): TCreator;
    function FindEnumValue(const FindAttribute: string; Prop:TRttiProperty): String;
    function IsInComponentProp(Prop: TRttiProperty; Context: TRttiContext):boolean;

    procedure Initialize();
    procedure AddToProductList(Product: TJewelryProduct);
    procedure AddToControllerList(Controller: TComponent);
    procedure AddToClassNameArr(const Name: string);
    procedure AddCreator(Creator: TCreator; const ObjectType: string);
    procedure AddSerializer(Serializer: TSerializer);
    procedure ClearComponent();
    procedure ShowProductInfo(const Context: TRttiContext; CurrentObject: TObject; var LeftMargin, TopMargin: integer);
    procedure GetProductInfo(const Context: TRttiContext; CurrentObject: TObject; var CurrentController: TControllerList);
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

function TfMain.IsInComponentProp(Prop: TRttiProperty; Context: TRttiContext):boolean;
var
  CurProp: TRttiProperty;
  CompType: TrttiType;
begin
  Result:=False;
  CompType:=Context.GetType(TComponent);
  for CurProp in CompType.GetProperties do
    if CurProp = Prop then
    begin
      Result:=True;
      break;
    end;
end;

constructor TInfoAttribute.Create(const NameValue: string);
begin
  FInfoName:=NameValue;
end;

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

function TfMain.FindCreatorByType(const CreatorType: string): TCreator;
var
  ItemCreator: TItemCreator;
begin
  for ItemCreator in FCreatorsArr do
    if ItemCreator.ObjName = CreatorType then
      Result:=ItemCreator.Creator;
end;

procedure TfMain.Initialize();
begin
  FProductListHeader:=New(TProductList);
  FProductListLast:=FProductListHeader;
  FProductListLast^.Next:=nil;
  FProductListLast^.Product:=nil;

  FControllerListHeader:=New(TControllerList);
  FControllerListLast:=FControllerListHeader;
  FControllerListLast^.Next:=nil;
  FControllerListLast^.Controller:=nil;
end;

function TfMain.FindInProductListByIndex(Index: integer): TProductList;
var
  Current: TProductList;
  i: integer;
begin
  Current:=FProductListHeader;
  for i:=0 to Index do
    Current:=Current^.Next;
  Result:=Current;
end;

procedure TfMain.AddToProductList(Product: TJewelryProduct);
begin
  FProductListLast^.Next:=New(TProductList);
  FProductListLast:=FProductListLast^.Next;
  FProductListLast^.Next:=nil;
  FProductListLast^.Product:=Product;
end;

procedure TfMain.bCreateClick(Sender: TObject);
var
  Context: TRttiContext;
  ClassType: TRttiType;
  Attributes: TCustomAttribute;
begin
  Context:=TRttiContext.Create;
  try
    try
      AddToProductList(FCreatorsArr[cbCreate.ItemIndex].Creator.FactoryMethod);

      ClassType:=Context.GetType(FProductListLast^.Product.ClassType);
      for Attributes in ClassType.GetAttributes do
        lbProducts.Items.Add(TInfoAttribute(Attributes).FInfoName);
    except
      Showmessage('Something wrong');
    end;
  finally
    Context.Free;
  end;
end;

procedure TfMain.AddToControllerList(Controller: TComponent);
begin
  FControllerListLast^.Next:=New(TControllerList);
  FControllerListLast:=FControllerListLast^.Next;
  FControllerListLast^.Next:=nil;
  FControllerListLast^.Controller:=Controller;
end;

procedure TfMain.AddToClassNameArr(const Name: string);
begin
  SetLength(FClassNamesArr, Length(FClassNamesArr) + 1);
  FClassNamesArr[Length(FClassNamesArr) - 1]:=Name;
end;

procedure TfMain.AddCreator(Creator: TCreator; const ObjectType: string);
begin
  SetLength(FCreatorsArr, Length(FCreatorsArr) + 1);
  FCreatorsArr[Length(FCreatorsArr) - 1].Creator:=Creator;
  FCreatorsArr[Length(FCreatorsArr) - 1].ObjName:=ObjectType;
end;

procedure TfMain.AddSerializer(Serializer: TSerializer);
begin
  SetLength(FSerializerArr, Length(FSerializerArr) + 1);
  FSerializerArr[Length(FSerializerArr) - 1]:=Serializer;
end;

procedure TfMain.ClearComponent;
var
  Prev, Current: TControllerList;
begin
  Current:=FControllerListHeader^.Next;
  while Current <> nil do
  begin
    Prev:=Current;
    Current:=Current^.Next;
    Prev^.Controller.Free;
    Dispose(Prev);
  end;
  FControllerListHeader^.Next:=nil;
  FControllerListLast:=FControllerListHeader;
end;

procedure TfMain.FormCreate(Sender: TObject);
var
  i: integer;
  Context: TRttiContext;
  ClassType: TRttiType;
  Attributes: TCustomAttribute;
begin
  Initialize;

  AddCreator(TGemCreator.Create, TGem.ClassName);
  AddCreator(TPreciousMetalCreator.Create, TPreciousMetal.ClassName);
  AddCreator(TJewelryCreator.Create, TJewelry.ClassName);
  AddCreator(TChainCreator.Create, TChain.ClassName);
  AddCreator(TRingsCreator.Create, TRings.ClassName);
  AddCreator(TPendantsCreator.Create, TPendants.ClassName);
  AddCreator(TAromapendantsCreator.Create, TAromapendants.ClassName);
  AddCreator(TMedallioncreator.Create, TMedallion.ClassName);

//  SetLength(FSerializerArr, 2);
//  FSerializerArr[0]:=TTextSerializer.Create;
//  FSerializerArr[1]:=TBinarySerializer.Create;

  AddSerializer(TXMLSerializer.Create);
  AddSerializer(TBinarySerializer.Create);
  AddSerializer(TJSONSerializer.Create);

  Context:=TRttiContext.Create;
  try
    for i:=0 to Length(FCreatorsArr)-1 do
    begin
      ClassType:=Context.GetType(FCreatorsArr[i].Creator.ClassType);
      for Attributes in ClassType.GetAttributes do
        cbCreate.Items.Add(TInfoAttribute(Attributes).FInfoName);
    end;
  finally
    Context.Free;
  end;
end;

procedure TfMain.bCloseClick(Sender: TObject);
begin
  ClearComponent();
end;

procedure TfMain.bDeleteClick(Sender: TObject);
var
  Prev, Current: TProductList;
  i: integer;
begin
  Prev:=FProductListHeader;
  for i := 1 to lbProducts.ItemIndex - 1 do
    Prev:=Prev^.Next;
  Current:=Prev^.Next;
  Prev^.Next:=Current^.Next;
  Current^.Product.Free;
  Dispose(Current);
  lbProducts.Items.Delete(lbProducts.ItemIndex);
  ClearComponent();
end;

procedure TfMain.bChangeClick(Sender: TObject);
var
  Context: TRttiContext;
  Current: TControllerList;
  CurrentObject: TJewelryProduct;
begin
  Context:=TRttiContext.Create;
  try
    try
      CurrentObject:=FindInProductListByIndex(lbProducts.ItemIndex).Product;
      Current:=FControllerListHeader;
      GetProductInfo(Context, CurrentObject, Current);
    except
      Showmessage('Something wrong');
    end;
  finally
    Context.Free;
  end;
end;

function TfMain.CreateButton(Owner: TComponent; Parent: TWinControl; Left: Integer; Top: Integer; Width: Integer; Height: Integer; const Caption: string): TButton;
begin
  Result:=TButton.Create(Owner);
  Result.Parent:=Parent;
  Result.Left:=Left;
  Result.Top:=Top;
  Result.Width:=Width;
  Result.Height:=Height;
  Result.Caption:=Caption;
end;

function TfMain.CreateLabel(Owner: TComponent; Parent: TWinControl; Left: Integer; Top: Integer; Width: Integer; Height: Integer; const Caption: string): TLabel;
begin
  Result:=TLabel.Create(Owner);
  Result.Parent:=Parent;
  Result.Left:=Left;
  Result.Top:=Top;
  Result.Width:=Width;
  Result.Height:=Height;
  Result.Caption:=Caption;
end;

function TfMain.CreateEdit(Owner: TComponent; Parent: TWinControl; Left: Integer; Top: Integer; Width: Integer; Height: Integer; const Text: string): TEdit;
begin
  Result:=TEdit.Create(Owner);
  Result.Parent:=Parent;
  Result.Left:=Left;
  Result.Top:=Top;
  Result.Width:=Width;
  Result.Height:=Height;
  Result.Text:=Text;
end;

function TfMain.FindEnumValue(const FindAttribute: string; Prop: TRttiProperty): string;
var
  Index: integer;
  Attributes: TCustomAttribute;
  EnumVal: string;
begin
  Index:=0;
  for Attributes in Prop.PropertyType.GetAttributes do
  begin
    EnumVal:=GetEnumName(Prop.PropertyType.Handle, Index);
    if FindAttribute = TInfoAttribute(Attributes).FInfoName then
      Result:=EnumVal;
    inc(Index);
  end;
end;

function TfMain.CreateComboBox(Owner: TComponent; Parent: TWinControl; Left: Integer; Top: Integer; Width: Integer; Height: Integer; Prop: TRttiProperty; const CurrentValue: string): TComboBox;
var
  EnumVal: string;
  Index: integer;
  Attributes: TCustomAttribute;
begin
  Result:=TComboBox.Create(Owner);
  Result.Parent:=Parent;
  Result.Left:=Left;
  Result.Top:=Top;
  Result.Width:=Width;
  Result.Height:=Height;
  Result.Style:=csDropDownList;

  Index:=0;
  for Attributes in Prop.PropertyType.GetAttributes do
  begin
    Result.Items.Add(TInfoAttribute(Attributes).FInfoName);
    EnumVal:=GetEnumName(Prop.PropertyType.Handle, Index);
    if CurrentValue <> EnumVal then
      inc(Index);
  end;
    Result.ItemIndex:=Index;
end;

procedure TfMain.ShowProductInfo(const Context: TRttiContext; CurrentObject: TObject; var LeftMargin, TopMargin: integer);
var
  ClassType: TRttiType;
  Component: TRttiType;
  Prop: TRttiProperty;
begin
  ClassType:=Context.GetType(Currentobject.ClassType);
  Component:=Context.GetType(TComponent);
  for Prop in ClassType.GetProperties do
    begin
  //    Showmessage(Prop.PropertyType);
      if not IsInComponentProp(Prop, Context) then
      case Prop.PropertyType.TypeKind of
        tkInteger, tkFloat, tkInt64, tkString, tkWString, tkUString:
          begin
//          Showmessage(Prop.Name);
            AddToControllerList(CreateLabel(fMain, fMain, LeftMargin, TopMargin, DefaultWidth, DefaultHeight, TInfoAttribute(Prop.GetAttributes[0]).FInfoName));
            TopMargin:=TopMargin+DefaultHeight+3;
            AddToControllerList(CreateEdit(fMain, fMain, LeftMargin, TopMargin, DefaultWidth, DefaultHeight, Prop.GetValue(CurrentObject).ToString));

            TopMargin:=TopMargin+DefaultHeight+10;
          end;
        tkEnumeration:
          begin
            AddToControllerList(CreateLabel(fMain, fMain, LeftMargin, TopMargin, DefaultWidth, DefaultHeight, TInfoAttribute(Prop.GetAttributes[0]).FInfoName));
            TopMargin:=TopMargin + DefaultHeight + 3;
            AddToControllerList(CreateComboBox(fMain, fMain, LeftMargin, TopMargin, DefaultWidth, DefaultHeight, Prop, Prop.GetValue(CurrentObject).ToString));
            TopMargin:=TopMargin + DefaultHeight + 3;
          end;
        tkClass:
          begin
            ShowProductInfo(Context, Prop.GetValue(CurrentObject).AsObject, LeftMargin, TopMargin);
          end;
        else
          ShowMessage('Неизвестное поле');
      end;
    end;
end;

procedure TfMain.GetProductInfo(const Context: TRttiContext; CurrentObject: TObject; var CurrentController: TControllerList);
var
  ClassType: TRttiType;
  Prop: TRttiProperty;
begin
  ClassType:=Context.GetType(Currentobject.ClassType);
  for Prop in ClassType.GetProperties do
    begin
      if  not IsInComponentProp(Prop, Context) then
      case Prop.PropertyType.TypeKind of
        tkInteger, tkInt64:
          begin
          CurrentController:=CurrentController^.Next^.Next;
            Prop.SetValue(CurrentObject, StrToInt((CurrentController^.Controller as TEdit).Text));
          end;
        tkFloat:
          begin
            CurrentController:=CurrentController^.Next^.Next;
            Prop.SetValue(Currentobject, StrToFloat((CurrentController^.Controller as TEdit).Text));
          end;
        tkString, tkWString, tkUString:
          begin
            CurrentController:=CurrentController^.Next^.Next;
            Prop.SetValue(CurrentObject, (CurrentController^.Controller as TEdit).Text);
          end;
        tkEnumeration:
          begin
            CurrentController:=CurrentController^.Next^.Next;
            with CurrentController^.Controller as TComboBox do
            begin
              SetEnumProp(CurrentObject, Prop.Name, FindEnumValue(Items[ItemIndex], Prop));
            end;
          end;
        tkClass:
          begin
            GetProductInfo(Context, Prop.GetValue(CurrentObject).AsObject, CurrentController);
          end;
        else
          ShowMessage('Неизвестное поле');
      end;
    end;
end;

procedure TfMain.lbProductsClick(Sender: TObject);
var
  Context: TRttiContext;
  LeftMargin, TopMargin: integer;
  CurrentObject: TJewelryProduct;
begin
if lbProducts.ItemIndex <> -1 then
begin
  ClearComponent();
  LeftMargin:=DefaultLeft;
  TopMargin:=DefaultTop;
  Context:=TRttiContext.Create;
  try
    CurrentObject:=FindInProductListByIndex(lbProducts.ItemIndex).Product;
    ShowProductInfo(Context, CurrentObject, LeftMargin, TopMargin);
  finally
    Context.Free
  end;

  bChange:=CreateButton(fMain, fMain, LeftMargin, TopMargin, DefaultWidth, DefaultHeight, 'Сохранить изменение');
  bChange.OnClick:=bChangeClick;
  AddToControllerList(bChange);
  TopMargin:=TopMargin + DefaultHeight + 10;

  bDelete:=CreateButton(fMain, fMain, LeftMargin, TopMargin, DefaultWidth, DefaultHeight, 'Удалить');
  bDelete.OnClick:=bDeleteClick;
  AddToControllerList(bDelete);
  TopMargin:=TopMargin + DefaultHeight+ 10;

  bClose:=CreateButton(fMain, fMain, LeftMargin, TopMargin, DefaultWidth, DefaultHeight, 'Закрыть');
  bClose.OnClick:=bCloseClick;
  AddToControllerList(bClose);
end;
end;

procedure TfMain.СериализоватьClick(Sender: TObject);
begin
  if dSerialize.Execute then
  begin
    Showmessage(IntToStr(dSerialize.FilterIndex));
    FSerializerArr[dSerialize.FilterIndex-1].Serialize(FindInProductListByIndex(lbProducts.ItemIndex).Product, dSerialize.FileName);
  end;
end;

procedure TfMain.ДесериализоватьClick(Sender: TObject);
var
//  O: TOBject;
  Context: TRttiContext;
  Attributes: TCustomAttribute;
  ClassType: TRttiType;
begin
  if dDeserialize.Execute then
  begin
    Context:=TRttiContext.Create;
    try
      try
        //AddToProductList(FCreatorsArr[cbCreate.ItemIndex].Creator.FactoryMethod);
        AddToProductList(FSerializerArr[dDeserialize.FilterIndex-1].Deserialize(FindInProductListByIndex(lbProducts.ItemIndex).Product, dDeserialize.FileName) as TJewelryProduct);
        ClassType:=Context.GetType(FProductListLast^.Product.ClassType);
        for Attributes in ClassType.GetAttributes do
          lbProducts.Items.Add(TInfoAttribute(Attributes).FInfoName);
      except
        Showmessage('Something wrong');
      end;
    finally
      Context.Free;
    end;
  end;
//  begin
//    O:=FSerializerArr[dDeserialize.FilterIndex-1].Deserialize(FindInProductListByIndex(lbProducts.ItemIndex).Product, dDeserialize.FileName);
//    Showmessage(O.ToString);
//   AddToProductList(FSerializerArr[dDeserialize.FilterIndex-1].Deserialize(FindInProductListByIndex(lbProducts.ItemIndex).Product, dDeserialize.FileName) as TJewelryProduct);
//  end;
end;

end.

