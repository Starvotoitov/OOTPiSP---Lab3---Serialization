unit JewelryProduct;

interface

uses Rtti, Classes, dialogs;

type
  TJewelryProduct = class(TComponent)
  public
    constructor Create();
  end;

implementation

uses OOP_1;

constructor TJewelryProduct.Create();
var
  Context: TRttiContext;
  ClassType: TRttiType;
  Prop: TRttiProperty;
begin
  Context:=TRttiContext.Create;
  try
    ClassType:=Context.GetType(Self.ClassType);
    for Prop in ClassType.GetProperties do
      if (Prop.PropertyType.TypeKind = tkClass) and (Pos('System.Classes.', Prop.PropertyType.QualifiedName) = 0 ) then
      begin
          Showmessage(Prop.PropertyType.QualifiedName);
          Prop.SetValue(Self, fMain.FindCreatorByType(Prop.PropertyType.ToString).FactoryMethod);
      end;
  finally
    Context.Free
  end;
end;

end.
