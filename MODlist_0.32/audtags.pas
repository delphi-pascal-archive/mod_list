{MODlist - creates list of tracker modules © denis111 (keygenmusic), 2006

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

So here's your copy http://www.gnu.org/copyleft/gpl.html :) 

     Author:   keygenmusic
     Contact:  keygenmusic@nm.ru
     Homepage: http://www.keygenmusic.net/
     
Parts of code in this unit taken from  Ay Emul 2.8 http://bulba.at.kz/}
unit audtags;

interface

uses Windows, KOL, Dynamic_Bass, sysutils;

type
  PID3v1 = ^TID3v1;
  TID3v1 = packed record
   Tag:array[0..2] of char;
   Title,Author,Album:array[0..29] of char;
   Year:array[0..3] of char;
   Comment:array[0..29] of char;
   Genre:byte;
  end;
  PID3V2Header = ^TID3V2Header;
  TID3V2Header = packed record
   Tag:array[0..2] of char;
   VerMajor,VerMinor,Flags:byte;
   Size:DWORD;
  end;
  PID3V2ExtHeader = ^TID3V2ExtHeader;
  TID3V2ExtHeader = packed record
   Size:DWORD;
   Flags:word;
   PaddingSize:DWORD;
  end;
  PID3V2Frame = ^TID3V2Frame;
  TID3V2Frame = packed record
   Id,Size:DWORD;
   Flags:word;
  end;

function getaudtaginfo(ahandle:HSTREAM; artist:boolean;
                        fname:string; sep:string):string;
function DoubleNullToValue(p:PChar; value:string):String;

implementation

function getaudtaginfo(ahandle:HSTREAM; artist:boolean;
  fname:string; sep:string):string;
var Author,Title:string;   ext:string[8];
rwav:PChar;

function IntelWord(Wrd:word):word;
asm
xchg al,ah
end;

function IntelDWord(DWrd:dword):dword;
asm
xchg al,ah
ror eax,16
xchg al,ah
end;

procedure GetSongInfo_ID3V1;
 var
  p:PID3v1;
 begin
  p := pointer(BASS_ChannelGetTags(ahandle,BASS_TAG_ID3));
  if p = nil then exit;
  Author := p.Author;
  Author := Trim(PChar(Author));
  Title := p.Title;
  Title := Trim(PChar(Title))
 end;

 function GetSongInfo_ID3V2:boolean;

  function GetID3V2DWord(a:dword):dword;
   asm
    shl ah,1
    xchg al,ah
    shr ax,1
    ror eax,16
    shl ah,1
    xchg al,ah
    shl ax,1
    shr eax,2
   end;

  const
   TIT2 = $32544954;
   TPE1 = $31455054;

  var
   p,TagSize,AddByte,StrSize:integer;

  procedure CaseIds(Id:integer);
   begin
    case Id of
    TIT2:
     begin
      SetLength(Title,StrSize);
      Move(pointer(p + 10 + AddByte + 1)^,Title[1],StrSize);
      Title := Trim(PChar(Title))
     end;
    TPE1:
     begin
      SetLength(Author,StrSize);
      Move(pointer(p + 10 + AddByte + 1)^,Author[1],StrSize);
      Author := Trim(PChar(Author))
     end
    end
   end;

  procedure GetFromIDV24x; //not tested
   begin
    TagSize := DWORD(p) + GetID3V2DWord(PID3V2Header(p).Size);
    if PID3V2Header(p).Flags and 32 = 0 then
     Inc(TagSize,10);
    Inc(p,10);
    if PID3V2Header(p - 10).Flags and 64 <> 0 then
     Inc(p,GetID3V2DWord(PID3V2ExtHeader(p).Size));
    while p <= TagSize - SizeOf(TID3V2Frame) do
     with PID3V2Frame(p)^ do
      begin
       AddByte := Ord(Flags and 64 <> 0);
       StrSize := integer(GetID3V2DWord(Size)) - AddByte - 1;
       if (Flags and 15 = 0) and
          (StrSize > 0) and (StrSize <= TagSize - p - 10 - AddByte - 1) and
          (PByte(p + 10 + AddByte)^ = 0) then
        CaseIds(Id);
       Inc(p,GetID3V2DWord(Size) + 10)
      end
   end;

  procedure GetFromIDV23x;
   begin
    if PID3V2Header(p).Flags and 128 <> 0 then exit;
    TagSize := DWORD(p) + GetID3V2DWord(PID3V2Header(p).Size) + 10;
    Inc(p,10);
    if PID3V2Header(p - 10).Flags and 64 <> 0 then
     Inc(p,IntelDWord(PID3V2ExtHeader(p).Size));
    while p <= TagSize - SizeOf(TID3V2Frame) do
     with PID3V2Frame(p)^ do
      begin
       AddByte := Ord(Flags and 32 <> 0);
       StrSize := integer(IntelDWord(Size)) - AddByte - 1;
       if (Flags and (128 + 64) = 0) and (StrSize > 0) and
          (StrSize <= TagSize - p - 10 - AddByte - 1) and
          (PByte(p + 10 + AddByte)^ = 0) then
        CaseIds(Id);
       Inc(p,IntelDWord(Size) + 10)
      end
   end;

 begin
  Result := False;
  p := integer(BASS_ChannelGetTags(ahandle,BASS_TAG_ID3V2));
  if p = 0 then exit;
  case PID3V2Header(p).VerMajor of
  4:GetFromIDV24x;
  3:GetFromIDV23x
  else
   exit
  end;
  if (Author <> '') or (Title <> '') then
   Result := True
 end;

 procedure GetSongInfo_OGG;
 var
  p:PChar;
  l,tl,cl:longword;
  Tag:string;
 begin
  p := BASS_ChannelGetTags(ahandle,BASS_TAG_OGG);
  if p = nil then exit;
  repeat
   l := StrLen(p);
   tl := 0;
   while (tl < l) and (PByte(DWORD(p) + tl)^ <> Ord('=')) do Inc(tl);
   if (tl = l) or (tl = 0) then break;
   if tl < l - 1 then
    begin
     SetLength(Tag,tl);
     Move(p^,Tag[1],tl);
     cl := l - tl - 1;
     if UpperCase(Tag) = 'ARTIST' then
      begin
       SetLength(Author,cl);
       Move(pointer(DWORD(p) + tl + 1)^,Author[1],cl)
      end
     else if UpperCase(Tag) = 'TITLE' then
      begin
       SetLength(Title,cl);
       Move(pointer(DWORD(p) + tl + 1)^,Title[1],cl)
      end;
     SetLength(Tag,0)
    end;
   Inc(integer(p),l + 1)
  until PByte(p)^ = 0;
  Author := Trim(Author);
  Title := Trim(Title)
 end;



begin
Author := '';
Title := '';
ext:=lowercase(ExtractFileExt(fname));
if ahandle = 0 then exit;
if StrSatisfy(ext, '*.mp*') then

 begin
  if not GetSongInfo_ID3V2 then
   GetSongInfo_ID3V1
 end else
if ext='.ogg' then
 GetSongInfo_OGG else
if ext='.wav' then begin
 rwav:=BASS_ChannelGetTags(ahandle, BASS_TAG_RIFF_INFO);
 title:=trim(DoubleNullToValue(rwav,'INAM='));
 end;
 {LogFileOutput(GetStartDir+'\fdsd.txt', rwav);
 LogFileOutput(GetStartDir+'\fdsd.txt', int2hex(zz,4));  }
// if StrSatisfy(rwav

if artist=true then result:=author+#13+'AT'+#13+title else
result:=title;
end;

function DoubleNullToValue(p:PChar; value:string):String;
var CurrentString:Pchar;
begin
 try
    if p <> chr(0) then
    begin
      CurrentString := p;
      while True do
      begin
        if strsatisfy(CurrentString, value+'*') then
         result:=string(CurrentString+5);
        Inc(CurrentString, Succ(StrLen(CurrentString)));
        if CurrentString[0] = #0 then
          Break;
      end;
    end;
  finally
  end;
end;

end.
