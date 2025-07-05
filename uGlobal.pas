unit uGlobal;

interface

uses System.Win.Registry, System.Classes, Winapi.Windows, System.SysUtils;

function GetComputerNameFunc : string;
function GetVersionInfo(const app:string):string;

var valueNames : TStringList;

implementation


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
