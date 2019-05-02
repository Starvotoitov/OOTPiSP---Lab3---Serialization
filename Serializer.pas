unit Serializer;

interface

uses
  Messages, Dialogs, SysUtils, Classes, Rtti, TypInfo, RegularExpressions, Rest.JSON, JewelryProduct;
type
  TSerializer = class
    procedure Serialize(Comp: TObject; FileName: string); virtual; abstract;
    function Deserialize(Comp: TObject; FileName: string): TObject; virtual; abstract;
    function IsInComponentProp(Prop: TRttiProperty; Context: TRttiContext): boolean;
  end;

  TBinarySerializer = class(TSerializer)
    procedure Serialize(Comp: TObject; FileName: string); override;
    function Deserialize(Comp: TObject; FileName: string): TObject; override;
  end;

  TJSONSerializer = class(TSerializer)
    FSerializeFile: TextFile;

    procedure Serialize(Comp:TObject; FileName: String); override;
    function Deserialize(COmp: TObject; FileName: String): TObject; override;
  end;

  TXMLSerializer = class(TSerializer)
    FSerializeFile: TextFile;
    FTabs: integer;
    FRegex: TRegex;
    FMatches: TMatchCollection;

    procedure Serialize(Comp: TObject; FileName: string); override;

    function Deserialize(Comp: TObject; FileName: string): TObject; override;
    function LeftMargin():String;
    function OpenTag(Prop: TRttiProperty): string;
    function CloseTag(Prop: TRttiProperty): string;
    function GetProperty(ClassType: TRttiType; const FindStr: string): TRttiProperty;

    procedure SingleObjectSerialize(const Context: TRttiContext; CurrentObject: TObject);
    procedure SingleObjectDeserialize(const Context: TRttiContext; CurrentObject: TObject);
  end;

implementation

uses OOP_1, Windows;

function TSerializer.IsInComponentProp(Prop: TRttiProperty; Context: TRttiContext):boolean;
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

procedure TBinarySerializer.Serialize(Comp: TObject; FileName: String);
var
  FileStream: TFileStream;
  MemStream: TMemoryStream;
begin
  FileStream:=TFileStream.Create(FileName, fmCreate);
  MemStream:=TMemoryStream.Create;
  try
    FileStream.WriteComponent(Comp as TComponent);
  finally
    MemStream.Free;
    FileStream.Free;
  end;
end;

function TBinarySerializer.Deserialize(Comp: TObject; FileName: String): TObject;
var
  FileStream: TFileStream;
  MemStream: TMemoryStream;
begin
  FileStream:=TFileStream.Create(FileName, 0);
  MemStream:=TMemoryStream.Create;
  try
    FileStream.ReadComponent(Comp as TComponent);
  //  ShowMessage(Comp.ToString);
    //Result:=Comp;
  finally
    MemStream.Free;
    FileStream.Free;
  end;
end;

function TXMLSerializer.LeftMargin: string;
var
  i: integer;
begin
//  for i := 1 to FTabs do
//    Result:=Result + '  ';
end;

function TXMLSerializer.OpenTag(Prop: TRttiProperty): string;
begin
  Result:='<' + Prop.Name + '>';
end;

function TXMLSerializer.CloseTag(Prop: TRttiProperty): string;
begin
  Result:='</' + Prop.Name + '>';
end;

procedure TXMLSerializer.SingleObjectSerialize(const Context: TRttiContext; CurrentObject: TObject);
var
  ClassType: TRttiType;
  Prop: TRttiProperty;
  Str: String;
begin
  ClassType:=Context.GetType(CurrentObject.ClassType);
  Writeln(FSerializeFile, LeftMargin + '<' + CurrentObject.ClassName + '>');
  inc(FTabs);
  for Prop in ClassType.GetProperties do
  begin
    if not IsInComponentProp(Prop, Context) then

    case Prop.PropertyType.TypeKind of
      tkInteger, tkInt64:
        begin
          Writeln(FSerializeFile, LeftMargin + OpenTag(Prop) + IntToStr(Prop.GetValue(CurrentObject).AsInteger) + CloseTag(Prop));
        end;
      tkFloat:
        begin
          Writeln(FSerializeFile, LeftMargin + OpenTag(Prop) + FloatToStr(Prop.GetValue(CurrentObject).AsExtended) + CloseTag(Prop));
        end;
      tkString, tkWString, tkUString:
        begin
        //  ShowMessage(Prop.GetValue(CurrentObject).AsString);
        //  Str:=Prop.GetValue(CurrentObject).AsString;
          Writeln(FSerializeFile, LeftMargin + OpenTag(Prop) + Prop.GetValue(CurrentObject).AsString + CloseTag(Prop));
        end;
      tkEnumeration:
        begin
          Writeln(FSerializeFile, LeftMargin + OpenTag(Prop) + GetEnumProp(CurrentObject, Prop.Name) + CloseTag(Prop));
        end;
      tkClass:
        begin
          SingleObjectSerialize(Context, Prop.GetValue(CurrentObject).AsObject);
        end;
      else
        ShowMessage('Ошибка сериализации');
    end;
  end;
  Dec(FTabs);
  Writeln(FSerializeFile, LeftMargin + '</' + CurrentObject.ClassName + '>');
end;

procedure TXMLSerializer.Serialize(Comp: TObject; FileName: String);
var
  Context: TRttiContext;
begin
//  Showmessage('Text');
  Context:=TRttiContext.Create;
  try
    AssignFile(FSerializeFile, FileName);
    ReWrite(FSerializeFile);
    SingleObjectSerialize(Context, Comp);
    CloseFile(FSerializeFile);
  finally
    Context.Free;
  end;
end;

function TXMLSerializer.GetProperty(ClassType: TRttiType; const FindStr: string): TRttiProperty;
begin
  Result:=ClassType.GetProperty(FindStr);
  if Result = nil then
  begin
    for Result in ClassType.GetProperties do
    begin
//      Showmessage(Result.PropertyType.ToString);
      if Result.PropertyType.ToString = FindStr then
        break;
    end;
  end;
//  Showmessage(Result.Name);
end;

procedure TXMLSerializer.SingleObjectDeserialize(const Context: TRttiContext; CurrentObject: TObject);
var
  CurrentStr, PropName, Value: string;
  Arr: TArray<string>;
  ClassType: TRttiType;
  Prop: TRttiProperty;
begin
  ClassType:=Context.GetType(CurrentObject.ClassType);
  while (not eof(FSerializeFile)) do
  begin
    Readln(FSerializeFile, CurrentStr);
    if TRegex.IsMatch(CurrentStr, '\t*<[A-Za-z].*>\t*') then
    begin
      PropName:=Copy(CurrentStr, Pos('<', CurrentStr) + 1, Pos('>', CurrentStr) - Pos('<', CurrentStr) - 1);
//      Prop:=ClassType.GetProperty(PropName);
      Prop:=GetProperty(ClassType, PropName);
      if Prop.PropertyType.TypeKind = tkClass then
      begin
    //ShowMessage('Class = ' + Prop.PropertyType.ToString);
        Prop.SetValue(CurrentObject, Prop.PropertyType.AsInstance.MetaclassType.Create);
        SingleObjectDeserialize(Context, Prop.GetValue(CurrentObject).AsObject);
      end
      else
      begin
      //  for Value in TRegex.Split(CurrentStr, '<[A-Za-z0-9]+>') do
      //    Showmessage(Value);
        Value:=TRegex.Match(CurrentStr, '>[A-Za-z0-9,]*').Value;
        Delete(Value, 1, 1);
      //  Value:=TRegex.Split(CurrentStr, '<[A-Za-z0-9]+>')[0];
        case Prop.PropertyType.TypeKind of
          tkInteger, tkInt64:
            begin
              Prop.SetValue(CurrentObject, StrToInt(Value));
            end;
          tkFloat:
            begin
              Prop.SetValue(CurrentObject, StrToFloat(Value));
            end;
          tkString, tkWString, tkUString:
            begin
              Prop.SetValue(CurrentObject, Value);
            end;
          tkEnumeration:
            begin
              SetEnumProp(CurrentObject, PropName, Value);
            end;
          else
            ShowMessage('Ошибка десериализации');
        end;
      end;
    end
    else
      if TRegex.IsMatch(CurrentStr, '\t*</[A-Za-z].*>\t*') then
        break;
  end;
end;

function TXMLSerializer.Deserialize(Comp: TObject; FileName: String): TObject;
var
  NextStr, ClassName: string;
  Context: TRttiContext;
  ClassType: TRttiType;
  Arr: TArray<string>;
begin
  Context:=TRttiContext.Create;
  try
    try
      AssignFile(FSerializeFile, FileName);
      Reset(FSerializeFile);
      Readln(FSerializeFile, NextStr);
      ClassName:=Copy(NextStr, Pos('<', NextStr) + 1, Pos('>', NextStr) - 2);
   //   Showmessage(ClassName);
      for ClassType in Context.GetTypes do
        if ClassType.ToString = ClassName then
        begin
          Result:=ClassType.AsInstance.MetaclassType.Create;
          SingleObjectDeserialize(Context, Result);
          break;
        end;
     //   ShowMessage(Result.ToString);
      CloseFile(FSerializeFile);
    except
      Showmessage('Ошибка десериализации');
    end;
  finally
    Context.Free;
  end;
end;

procedure TJSONSerializer.Serialize(Comp: TObject; FileName: string);
begin
  try
    AssignFile(FSerializeFile, FileName);
    ReWrite(FSerializeFile);
    Write(FSerializeFile,TJson.ObjectToJsonString(Comp));
    CloseFile(FSerializeFile);
  except
    Showmessage('Ошибка сериализации');
  end;
end;

function TJSONSerializer.Deserialize(COmp: TObject; FileName: string): TObject;
var
  JsonStr: string;
begin
  try
    AssignFile(FSerializeFile, FileName);
    Reset(FSerializeFile);
    Read(FSerializeFile, JsonStr);
    Result:=TJson.JsonToObject<TJewelry>(JsonStr);
 //   Showmessage(Result.ToString);
  //  ShowMessage((Result as TJewelryProduct).ToString);
    CloseFile(FSerializeFile);
  except
    Showmessage('Ошибка десериализации');
  end;
end;

end.
