program OOP_1_Project;

uses
  Forms,
  OOP_1 in 'OOP_1.pas' {fMain},
  OOP_Factory in 'OOP_Factory.pas',
  Serializer in 'Serializer.pas';

//,
//  TJewelryProduct in 'TJewelryProduct.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
