unit uGlobal;

interface

uses System.Win.Registry, System.Classes, Winapi.Windows, System.SysUtils;

procedure GetRegKeys();
function GetComputerNameFunc : string;
function GetVersionInfo(const app:string):string;

var valueNames : TStringList;

implementation

procedure GetRegKeys();
var
  registry : TRegistry;
  // subKeysNames : TStringList;
  //WorkStation : String;
  i : Integer;
begin
  registry := TRegistry.Create;
  try
    valueNames := TStringList.Create;
    try
      registry.RootKey := HKEY_LOCAL_MACHINE;
      if registry.OpenKeyReadOnly('\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\ODBC Data Sources') then
      begin
        // registry.GetKeyNames(subKeysNames);
        registry.GetValueNames(valueNames);
        registry.CloseKey;
      end;
      {for i := 0 to subKeysNames.Count - 1 do
      begin
        if registry.OpenKeyReadOnly('\Software\Company\Program\' + subKeysNames[i]) then
        begin
          WorkStation := registry.ReadString('WorkStation');
          registry.CloseKey;
          if WorkStation <> '' then
          begin
            // use WorkStation as needed...
          end;
        end;
      end;}
    finally
      // subKeysNames.Free;
    end;
  finally
    registry.Free;
  end;
end;

function GetComputerNameFunc : string;
var ipbuffer : string;
      nsize : dword;
begin
   nsize := 255;
   SetLength(ipbuffer,nsize);
   if GetComputerName(pchar(ipbuffer),nsize) then
      result := ipbuffer;
end;

function GetVersionInfo(const app: string): string;
type
  TVersionInfo = packed record
    Dummy: array[0..7] of Byte;
    V2, V1, V4, V3: Word;
  end;
var
  Zero, Size: Cardinal;
  Data: Pointer;
  VersionInfo: ^TVersionInfo;
begin
  Size := GetFileVersionInfoSize(Pointer(app), Zero);
  if Size = 0 then
    Result := ''
  else
  begin
    GetMem(Data, Size);
    try
      GetFileVersionInfo(Pointer(app), 0, Size, Data);
      VerQueryValue(Data, '\', Pointer(VersionInfo), Size);
      Result := VersionInfo.V1.ToString + '.' + VersionInfo.V2.ToString + '.' + VersionInfo.V3.ToString + '.' + VersionInfo.V4.ToString;
    finally
      FreeMem(Data);
    end;
  end;
end;

end.
