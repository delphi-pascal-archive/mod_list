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

unit AYtime;

interface

uses Windows,SysUtils,KOL,lh5,UniReader,midiinfo,Unit1;

type

PModTypes = ^ModTypes;
ModTypes = packed record
case Integer of
0: (Index:array[0..65536] of byte);
1: (ST_Delay:byte;
    ST_PositionsPointer,ST_OrnamentsPointer,ST_PatternsPointer:word;
    ST_Name:array[0..17]of char;
    ST_Size:word);
2: (ASC1_Delay,ASC1_LoopingPosition:byte;
    ASC1_PatternsPointers,ASC1_SamplesPointers,ASC1_OrnamentsPointers:word;
    ASC1_Number_Of_Positions:byte;
    ASC1_Positions:array[0..65535-9]of byte);
3: (ASC0_Delay:byte;
    ASC0_PatternsPointers,ASC0_SamplesPointers,ASC0_OrnamentsPointers:word;
    ASC0_Number_Of_Positions:byte;
    ASC0_Positions:array[0..65535-8]of byte);
4: (STP_Delay:byte;
    STP_PositionsPointer,STP_PatternsPointer,
    STP_OrnamentsPointer,STP_SamplesPointer:word;
    STP_Init_Id:byte);
5: (PT2_Delay:byte;
    PT2_NumberOfPositions:byte;
    PT2_LoopPosition:byte;
    PT2_SamplesPointers:array[0..31]of word;
    PT2_OrnamentsPointers:array[0..15]of word;
    PT2_PatternsPointer:word;
    PT2_MusicName:array[0..29]of char;
    PT2_PositionList:array[0..65535 - 131]of byte);
6: (PT3_MusicName:array[0..$62]of char;
    PT3_TonTableId:byte;
    PT3_Delay:byte;
    PT3_NumberOfPositions:byte;
    PT3_LoopPosition:byte;
    PT3_PatternsPointer:word;
    PT3_SamplesPointers:array[0..31]of word;
    PT3_OrnamentsPointers:array[0..15]of word;
    PT3_PositionList:array[0..65535-201]of byte);
7: (PSC_MusicName:array[0..68]of char;
    PSC_UnknownPointer:word;
    PSC_PatternsPointer:word;
    PSC_Delay:byte;
    PSC_OrnamentsPointer:word;
    PSC_SamplesPointers:array[0..31]of word);
8: (FTC_MusicName:array[0..68]of char;
    FTC_Delay:byte;
    FTC_Loop_Position:byte;
    FTC_Slack:integer;
    FTC_PatternsPointer:word;
    FTC_Slack2:array[0..4]of byte;
    FTC_SamplesPointers:array[0..31]of word;
    FTC_OrnamentsPointers:array[0..32]of word;
    FTC_Positions:array[0..(65536 - $d4) div 2 - 1] of packed record
                                            Pattern:byte;
                                            Transposition:shortint;
                                            end);
9: (PT1_Delay:byte;
    PT1_NumberOfPositions:byte;
    PT1_LoopPosition:byte;
    PT1_SamplesPointers:array[0..15]of word;
    PT1_OrnamentsPointers:array[0..15]of word;
    PT1_PatternsPointer:word;
    PT1_MusicName:array[0..29]of char;
    PT1_PositionList:array[0..65535-99]of byte);
10:(FLS_PositionsPointer:word;
    FLS_OrnamentsPointer:word;
    FLS_SamplesPointer:word;
    FLS_PatternsPointers:array[1..(65536-6)div 6] of packed record
     PatternA,PatternB,PatternC:word;
    end);
11:(SQT_Size,SQT_SamplesPointer,SQT_OrnamentsPointer,SQT_PatternsPointer,
    SQT_PositionsPointer,SQT_LoopPointer:word);
12:(GTR_Delay:byte;
    GTR_ID:array[0..3] of char;
    GTR_Address:word;
    GTR_Name:array[0..31] of char;
    GTR_SamplesPointers:array[0..14]of word;
    GTR_OrnamentsPointers:array[0..15]of word;
    GTR_PatternsPointers:array[0..31] of packed record
     PatternA,PatternB,PatternC:word;
    end;
    GTR_NumberOfPositions:byte;
    GTR_LoopPosition:byte;
    GTR_Positions:array[0..65536 - 295 - 1]of byte);
13:(PSM_PositionsPointer:word;
    PSM_SamplesPointer:word;
    PSM_OrnamentsPointer:word;
    PSM_PatternsPointer:word;
    PSM_Remark:array[0..65535-8]of byte);
end;

 TVTXFileHeader = packed record
  Id:word;
  Mode:byte;
  Loop:word;
  ChipFrq:dword;
  InterFrq:byte;
  Year:word;
  UnpackSize:dword;
 end;

 TEPSGRec = packed record
  case Boolean of
  True:(Reg,Data:byte;
        TSt:longword);
  False:(All:int64);
  end;

   PYM5FileHeader = ^TYM5FileHeader;
 TYM5FileHeader = packed record
  Id:dword;
  Leo:array[0..7]of char;
  Num_of_tiks:dword;
  Song_Attr:dword;
  Num_of_Dig:word;
  ChipFrq:dword;
  InterFrq:word;
  Loop:dword;
  Add_Size:word;
 end;

   TLZHFileHeader = Packed Record
  HSize      : Byte;
  ChkSum     : Byte;
  Method     : Array[1..5] of Char;
  CompSize   : LongInt;
  UCompSize  : LongInt;
  Dos_DT     : LongInt;
  Attr       : Word;
  FileNameLen: Byte;
 end;

  TAYFileHeader = packed record
   FileID,TypeID:longword;
   FileVersion,PlayerVersion:byte;
   PSpecialPlayer,PAuthor,PMisc:smallint;
   NumOfSongs,FirstSong:byte;
   PSongsStructure:smallint;
 end;

 TAYMFileHeader = packed record
   AYM:array[0..2] of char;
   Rev:char;
   Name:array[0..27] of char;
   Author:array[0..15] of char;
   Init,Play:word;
   MusMin,MusMax,MusPos,RegPos:byte;
   AF,BC,DE,HL,IX,IY:word;
   Blocks:byte;
 end;
 TAYMBlock = packed record
   start,size:word;
 end;

 TSongStructure = packed record
   PSongName,PSongData:smallint;
 end;

 WordPtr = ^word;

 Available_Types =
 ({Unknown,   }AYFile, AYMFile, STCFile, ASCFile,
  {ASC0File, }STPFile, PSCFile, FLSFile, FTCFile, PT1File, PT2File, PT3File,
  SQTFile, GTRFile, FXMFile, PSMFile, VTXFile, PSGFile, EPSGFile, YM3File
  , YM2File, YM3BFile,
  YM5File, YM6File, OUTFile,ZXAYFile{ KARFile, XMIFile});

const
 TrkFileMin = STCFile;
 TrkFileMax = ZXAYFile;
 KsaId = 'KSA SOFTWARE COMPILATION OF ';
 FrqZ80      = 3494400;

function AYAnalizeFile(File_Name,SFileExt:string;var STitle:shortstring):integer;
procedure OutLstAYm(path, File_Name,SFileExt:string;size:cardinal; var modlst:PStrList);

implementation

procedure GetTimeFXM(Module:PModTypes;Address:integer;var Tm,Lp:integer);

 function FXM_Loop_Found(j11,j22,j33:word):boolean;
 var
  j1,j2,j3:longword;
  a1,a2,a3:byte;
  f71,f72,f73:boolean;
  f61,f62,f63:boolean;
  fxms1,fxms2,fxms3:array of word;
  k:integer;
  tr:integer;
 begin
       j1 := WordPtr(@Module.Index[Address])^;
       j2 := WordPtr(@Module.Index[Address + 2])^;
       j3 := WordPtr(@Module.Index[Address + 4])^;
       a1 := 1; a2 := 1; a3:= 1;
       f71 := False; f72 := False; f73 := False;
       f61 := False; f62 := False; f63 := False;
       tr := 0;
       repeat
        if (j1 = j11) and (j2 = j22) and (j3 = j33) then
         begin
          Result := True;
          Lp := tr;
          exit
         end;
        Dec(a1);
        if a1 = 0 then
         begin
          f71 := False;
          f61 := False;
          repeat
           case Module.Index[j1] of
           0..$7F,$8F..$FF:
            begin
             inc(j1);
             a1 := Module.Index[j1];
             inc(j1);
             break
            end;
           $80:
            begin
             if j1 >= 65536 - 2 then break;
             j1 := WordPtr(@Module.Index[j1 + 1])^;
             f71 := True
            end;
           $81:
            begin
             if j1 >= 65536 - 3 then break;
             k := Length(fxms1);
             SetLength(fxms1,k + 1);
             fxms1[k] := j1 + 3;
             j1 := WordPtr(@Module.Index[j1 + 1])^
            end;
           $82:
            begin
             if (j1 = j11) and (j2 = j22) and (j3 = j33) then
              begin
               Result := True;
               Lp := tr;
               exit
              end;
             k := Length(fxms1);
             SetLength(fxms1,k + 2);
             inc(j1);
             fxms1[k] := Module.Index[j1];
             inc(j1);
             fxms1[k + 1] := j1
            end;
           $83:
            begin
             k := Length(fxms1);
             if k < 2 then break;
             dec(fxms1[k - 2]);
             if fxms1[k - 2] and 255 <> 0 then
              begin
               j1 := fxms1[k - 1];
               f61 := True
              end
             else
              begin
               SetLength(fxms1,k - 2);
               inc(j1)
              end
            end;
           $84,$85,$88,$8D,$8E:
            inc(j1,2);
           $86,$87,$8C:
            inc(j1,3);
           $89:
            begin
             k := Length(fxms1);
             if k < 1 then break;
             j1 := fxms1[k - 1];
             SetLength(fxms1,k - 1)
            end;
           $8A,$8B:
            inc(j1);
           end;
           if j1 >= 65536 then break
          until False;
         end;
        Dec(a2);
        if a2 = 0 then
         begin
          f72 := False;
          f62 := False;
          repeat
           case Module.Index[j2] of
           0..$7F,$8F..$FF:
            begin
             inc(j2);
             a2 := Module.Index[j2];
             inc(j2);
             break
            end;
           $80:
            begin
             if j2 >= 65536 - 2 then break;
             j2 := WordPtr(@Module.Index[j2 + 1])^;
             f72 := True
            end;
           $81:
            begin
             if j2 >= 65536 - 3 then break;
             k := Length(fxms2);
             SetLength(fxms2,k + 1);
             fxms2[k] := j2 + 3;
             j2 := WordPtr(@Module.Index[j2 + 1])^
            end;
           $82:
            begin
             if (j1 = j11) and (j2 = j22) and (j3 = j33) then
              begin
               Result := True;
               Lp := tr;
               exit
              end;
             k := Length(fxms2);
             SetLength(fxms2,k + 2);
             inc(j2);
             fxms2[k] := Module.Index[j2];
             inc(j2);
             fxms2[k + 1] := j2
            end;
           $83:
            begin
             k := Length(fxms2);
             if k < 2 then break;
             dec(fxms2[k - 2]);
             if fxms2[k - 2] and 255 <> 0 then
              begin
               j2 := fxms2[k - 1];
               f62 := True
              end
             else
              begin
               SetLength(fxms2,k - 2);
               inc(j2)
              end
            end;
           $84,$85,$88,$8D,$8E:
            inc(j2,2);
           $86,$87,$8C:
            inc(j2,3);
           $89:
            begin
             k := Length(fxms2);
             if k < 1 then break;
             j2 := fxms2[k - 1];
             SetLength(fxms2,k - 1)
            end;
           $8A,$8B:
            inc(j2)
           end;
           if j2 >= 65536 then break
          until False;
         end;
        Dec(a3);
        if a3 = 0 then
         begin
          f73 := False;
          f63 := False;
          repeat
           case Module.Index[j3] of
           0..$7F,$8F..$FF:
            begin
             inc(j3);
             a3 := Module.Index[j3];
             inc(j3);
             break
            end;
           $80:
            begin
             if j3 >= 65536 - 2 then break;
             j3 := WordPtr(@Module.Index[j3 + 1])^;
             f73 := True
            end;
           $81:
            begin
             if j3 >= 65536 - 3 then break;
             k := Length(fxms3);
             SetLength(fxms3,k + 1);
             fxms3[k] := j3 + 3;
             j3 := WordPtr(@Module.Index[j3 + 1])^
            end;
           $82:
            begin
             if (j1 = j11) and (j2 = j22) and (j3 = j33) then
              begin
               Result := True;
               Lp := tr;
               exit
              end;
             k := Length(fxms3);
             SetLength(fxms3,k + 2);
             inc(j3);
             fxms3[k] := Module.Index[j3];
             inc(j3);
             fxms3[k + 1] := j3
            end;
           $83:
            begin
             k := Length(fxms3);
             if k < 2 then break;
             dec(fxms3[k - 2]);
             if fxms3[k - 2] and 255 <> 0 then
              begin
               j3 := fxms3[k - 1];
               f63 := True
              end
             else
              begin
               SetLength(fxms3,k - 2);
               inc(j3)
              end
            end;
           $84,$85,$88,$8D,$8E:
            inc(j3,2);
           $86,$87,$8C:
            inc(j3,3);
           $89:
            begin
             k := Length(fxms3);
             if k < 1 then break;
             j3 := fxms3[k - 1];
             SetLength(fxms3,k - 1)
            end;
           $8A,$8B:
            inc(j3);
           end;
           if j3 >= 65536 then break
          until False;
         end;
        inc(tr);
       until ((f71 and (f72 or f62) and (f73 or f63)) or
             ((f71 or f61) and f72 and (f73 or f63)) or
             ((f71 or f61) and (f72 or f62) and f73));
  Result := False
 end;

var
 j1,j2,j3:longword;
 a1,a2,a3:shortint;
 f71,f72,f73,
 f61,f62,f63:boolean;
 k:integer;
 j11,j22,j33:word;
 fxms1,fxms2,fxms3:array of word;
begin
   with Module^ do
    begin
//     if Address > 65536 - 6 then RaiseBadFileStructure;
     j1 := WordPtr(@Index[Address])^;
     j2 := WordPtr(@Index[Address + 2])^;
     j3 := WordPtr(@Index[Address + 4])^;
     a1 := 1; a2 := 1; a3:= 1;
     f71 := False; f72 := False; f73 := False;
     f61 := False; f62 := False; f63 := False;
     repeat
      Dec(a1);
      if a1 = 0 then
       begin
        f71 := False;
        f61 := False;
        repeat
         case Index[j1] of
         0..$7F,$8F..$FF:
          begin
           Inc(j1);
           a1 := Index[j1];
           Inc(j1);
           break
          end;
         $80:
          begin
           if j1 >= 65536 - 2 then break;
           j1 := WordPtr(@Index[j1 + 1])^;
           j11 := j1;
           f71 := True
          end;
         $81:
          begin
           if j1 >= 65536 - 3 then break;
           k := System.Length(fxms1);
           SetLength(fxms1,k + 1);
           fxms1[k] := j1 + 3;
           j1 := WordPtr(@Index[j1 + 1])^
          end;
         $82:
          begin
           k := System.Length(fxms1);
           SetLength(fxms1,k + 2);
           Inc(j1);
           fxms1[k] := Index[j1];
           Inc(j1);
           fxms1[k + 1] := j1
          end;
         $83:
          begin
           k := System.Length(fxms1);
           if k < 2 then break;
           Dec(fxms1[k - 2]);
           if fxms1[k - 2] and 255 <> 0 then
            begin
             j1 := fxms1[k - 1];
             if j1 < 2 then break;
             j11 := j1 - 2;
             f61 := True
            end
           else
            begin
             SetLength(fxms1,k - 2);
             Inc(j1)
            end
          end;
         $84,$85,$88,$8D,$8E:
          Inc(j1,2);
         $86,$87,$8C:
          Inc(j1,3);
         $89:
          begin
           k := System.Length(fxms1);
           if k < 1 then break;
           j1 := fxms1[k - 1];
           SetLength(fxms1,k - 1)
          end;
         $8A,$8B:
          Inc(j1)
         end;
         if j1 >= 65536 then break
        until False;
       end;
      Dec(a2);
      if a2 = 0 then
       begin
        f72 := False;
        f62 := False;
        repeat
         case Index[j2] of
         0..$7F,$8F..$FF:
          begin
           Inc(j2);
           a2 := Index[j2];
           Inc(j2);
           break
          end;
         $80:
          begin
           if j2 >= 65536 - 2 then break;
           j2 := WordPtr(@Index[j2 + 1])^;
           j22 := j2;
           f72 := True
          end;
         $81:
          begin
           if j2 >= 65536 - 3 then break;
           k := System.Length(fxms2);
           SetLength(fxms2,k + 1);
           fxms2[k] := j2 + 3;
           j2 := WordPtr(@Module.Index[j2 + 1])^
          end;
         $82:
          begin
           k := System.Length(fxms2);
           SetLength(fxms2,k + 2);
           Inc(j2);
           fxms2[k] := Index[j2];
           Inc(j2);
           fxms2[k + 1] := j2
          end;
         $83:
          begin
           k := System.Length(fxms2);
           if k < 2 then break;
           Dec(fxms2[k - 2]);
           if fxms2[k - 2] and 255 <> 0 then
            begin
             j2 := fxms2[k - 1];
             if j2 < 2 then break;
             j22 := j2 - 2;
             f62 := True
            end
           else
            begin
             SetLength(fxms2,k - 2);
             Inc(j2)
            end
          end;
         $84,$85,$88,$8D,$8E:
          Inc(j2,2);
         $86,$87,$8C:
          Inc(j2,3);
         $89:
          begin
           k := System.Length(fxms2);
           if k < 1 then break;
           j2 := fxms2[k - 1];
           SetLength(fxms2,k - 1)
          end;
         $8A,$8B:
          Inc(j2)
         end;
         if j2 >= 65536 then break
        until False;
       end;
      Dec(a3);
      if a3 = 0 then
       begin
        f73 := False;
        f63 := False;
        repeat
         case Index[j3] of
         0..$7F,$8F..$FF:
          begin
           Inc(j3);
           a3 := Index[j3];
           Inc(j3);
           break
          end;
         $80:
          begin
           if j3 >= 65536 - 2 then break;
           j3 := WordPtr(@Index[j3 + 1])^;
           j33 := j3;
           f73 := True
          end;
         $81:
          begin
           if j3 >= 65536 - 3 then break;
           k := System.Length(fxms3);
           SetLength(fxms3,k + 1);
           fxms3[k] := j3 + 3;
           j3 := WordPtr(@Index[j3 + 1])^
          end;
         $82:
          begin
           k := System.Length(fxms3);
           SetLength(fxms3,k + 2);
           Inc(j3);
           fxms3[k] := Index[j3];
           Inc(j3);
           fxms3[k + 1] := j3
          end;
         $83:
          begin
           k := System.Length(fxms3);
           if k < 2 then break;
           Dec(fxms3[k - 2]);
           if fxms3[k - 2] and 255 <> 0 then
            begin
             j3 := fxms3[k - 1];
             if j3 < 2 then break;
             j33 := j3 - 2;
             f63 := True
            end
           else
            begin
             SetLength(fxms3,k - 2);
             Inc(j3)
            end
          end;
         $84,$85,$88,$8D,$8E:
          Inc(j3,2);
         $86,$87,$8C:
          Inc(j3,3);
         $89:
          begin
           k := System.Length(fxms3);
           if k < 1 then break;
           j3 := fxms3[k - 1];
           SetLength(fxms3,k - 1)
          end;
         $8A,$8B:
          Inc(j3)
         end;
         if j3 >= 65536 then break
        until False
       end;
      Inc(tm);
      if tm > 180000 then
       begin
        tm := 15001;
        break
       end
     until ((f71 and (f72 or f62) and (f73 or f63)) or
            ((f71 or f61) and f72 and (f73 or f63)) or
            ((f71 or f61) and (f72 or f62) and f73)
           ) and FXM_Loop_Found(j11,j22,j33);
     Dec(tm)
    end
end;

procedure GetTimePSM(Module:PModTypes;var Tm,Lp:integer);
var
 d,b,a,rc:byte;
 p,l,j,ra:longword;
begin
with Module^ do
 begin
  p := PSM_PositionsPointer;
//  if Index[p] = 255 then RaiseBadFileStructure;
  l := p;
  repeat
   inc(p);
   inc(p)
  until Index[p] = 255;
  inc(p);
  d := Index[p];
  if d <> 255 then
   begin
    l := PSM_PositionsPointer + d;
  //  if l > p - 3 then RaiseBadFileStructure
   end;

  p := PSM_PositionsPointer;
  repeat
   if p = l then Lp := Tm;
   d := Index[p]; if d = 255 then break;
   j := PSM_PatternsPointer + d * 7 + 5;
   if j >= 65535 then break;
   j := WordPtr(@Index[j])^;
   d := Index[PSM_PatternsPointer + d * 7];
   a := 1;
   rc := 0;
   repeat
    if rc <> 0 then
     begin
      dec(rc);
      if rc = 0 then j := ra
     end;
    b := Index[j];
    case b of
    0..$60,$90,$fc..$fe:
     inc(Tm,d*a);
    $b1..$b7:
     inc(j);
    $b8..$f8:
     a := b - $b7;
    $f9:
     begin
      ra := j + 3; if ra >= 65536 then break;
      rc := Index[j + 2];
      j := WordPtr(@Index[j])^ - 1;
     end;
    $ff:break
    end;
    inc(j)
   until False;
   inc(p); inc(p)
  until False;
 end;
end;

procedure GetTimeGTR(Module:PModTypes;var Tm,Lp,Nt:integer);
var
 a:byte;
 a1:shortint;
 flg:boolean;
 j1:longword;

  begin
   with Module^ do
    begin
     a := 0; a1 := 0; flg := False;
     j1 := GTR_PatternsPointers[GTR_Positions[0] div 6].PatternA;
     repeat
      Dec(a1);
      if a1 < 0 then
       begin
        a1 := 0;
        while Index[j1] = 255 do
         begin
          Inc(a);
          flg := a >= GTR_NumberOfPositions;
          if flg then break;
          if a = GTR_LoopPosition then Lp := tm;
          j1 := GTR_PatternsPointers[Module.GTR_Positions[a] div 6].PatternA
         end;
        if flg then break;
        repeat
         case Index[j1] of
         0..$5f:
          begin
           inc(j1);
           if a = 0 then inc(Nt);
           break
          end;
         $D0..$DF:
          begin
           inc(j1);
           break
          end;
         $80..$BF:
          a1 := Index[j1] - $80;
         $C0..$CF:
          Inc(j1);
         $E0:
          if GTR_ID[3] <> #$10 then
           begin
            inc(j1);
            break
           end
         end;
         inc(j1)
        until False
       end;
      Inc(tm,GTR_Delay)
     until False;

     j1 := GTR_PatternsPointers[GTR_Positions[0] div 6].PatternB;
     while Index[j1] <> 255 do
      begin
       case Index[j1] of
       0..$5f:
        inc(Nt);
       $C0..$CF:
        Inc(j1);
       end;
       inc(j1)
      end;

     j1 := GTR_PatternsPointers[GTR_Positions[0] div 6].PatternC;
     while Index[j1] <> 255 do
      begin
       case Index[j1] of
       0..$5f:
        inc(Nt);
       $C0..$CF:
        Inc(j1);
       end;
       inc(j1)
      end;
    end
end;

procedure GetTimeSTC(Module:PModTypes;var Tm,Nt:integer);
var
 i,j:integer;
 j1,j2:longword;
 a:byte;
begin
   with Module^ do
    begin
     j := -1;
     repeat
      inc(j);
      j2 := ST_PositionsPointer + j * 2;
      inc(j2);
      j2 := Index[j2];
      i := -1;
      repeat
       inc(i);
       j1 := ST_PatternsPointer + 7 * i;
       if j1 >= 65535 then break
      until Index[j1] = j2;
      j1 := WordPtr(@Index[j1 + 1])^;
      a := 1;
      while Index[j1] <> 255 do
       begin
        case Index[j1] of
        0..$5f:
         begin
          Inc(tm,a);
          if j = 0 then Inc(Nt)
         end;
        $80,$81:
         Inc(tm,a);
        $a1..$e0:
         a := Index[j1] - $a0;
        $83..$8e:
         inc(j1)
        end;
        inc(j1)
       end
     until j = Index[ST_PositionsPointer];
     tm := tm * ST_Delay;

     j2 := ST_PositionsPointer;
     inc(j2);
     j2 := Index[j2];
     i := -1;
     repeat
      inc(i);
      j1 := ST_PatternsPointer + 7 * i;
      if j1 >= 65535 then break
     until Index[j1] = j2;
     j2 := j1;
     j1 := WordPtr(@Index[j1 + 1 + 2])^;
     while Index[j1] <> 255 do
      begin
       case Index[j1] of
       0..$5f:
        Inc(Nt);
       $83..$8e:
        inc(j1)
       end;
       inc(j1)
      end;

     j1 := WordPtr(@Index[j2 + 1 + 4])^;
     while Index[j1] <> 255 do
      begin
       case Index[j1] of
       0..$5f:
        Inc(Nt);
       $83..$8e:
        inc(j1)
       end;
       inc(j1)
      end

    end
end;

procedure GetTimeASC(Module:PModTypes;var Tm,Lp,Nt:integer);
var
 i:integer;
 j1,j2,j3:longword;
 b:byte;
 a1,a2,a3,a11,a22,a33:shortint;
 Env1,Env2,Env3:boolean;
 DLCatcher:integer;
begin
    a1 := 0; a2 := 0; a3 := 0;
    a11 := 0; a22 := 0; a33 := 0;
    Env1 := False; Env2 := False; Env3 := False;
    with Module^ do
     begin
      b := ASC1_Delay;
      DLCatcher := 16384;
      for i := 0 to ASC1_Number_Of_Positions - 1 do
       begin
        if ASC1_LoopingPosition = i then Lp := tm;
        j1 := WordPtr(@Index[ASC1_PatternsPointers + 6 * Index[i + 9]])^ +
                              ASC1_PatternsPointers;
        j2 := WordPtr(@Index[ASC1_PatternsPointers + 6 * Index[i + 9] + 2])^ +
                              ASC1_PatternsPointers;
        j3 := WordPtr(@Index[ASC1_PatternsPointers + 6 * Index[i + 9] + 4])^ +
                              ASC1_PatternsPointers;
        repeat
         dec(a1);
         if a1 < 0 then
          begin
           if Index[j1] = 255 then break;
           repeat
            case Index[j1] of
            0..$55:
             begin
              a1 := a11;
              inc(j1);
              if Env1 then inc(j1);
              if i = 0 then inc(Nt);
              break
             end;
            $56..$5f:
             begin
              a1 := a11;
              inc(j1);
              break
             end;
            $60..$9f:
             a11 := Index[j1] - $60;
            $e0:
             Env1 := True;
            $e1..$ef:
             Env1 := False;
            $f0,$f5..$f7,$f9,$fb:
             inc(j1);
            $f4:
             begin
              inc(j1);
              b := Index[j1]
             end
            end;
            inc(j1)
           until False;
          end;
         dec(a2);
         if a2 < 0 then
          repeat
           case Index[j2] of
           0..$55:
            begin
             a2 := a22;
             inc(j2);
             if Env2 then inc(j2);
             if i = 0 then inc(Nt);
             break
            end;
           $56..$5f:
            begin
             a2 := a22;
             inc(j2);
             break
            end;
           $60..$9f:
            a22 := Index[j2] - $60;
           $e0:
            Env2 := True;
           $e1..$ef:
            Env2 := False;
           $f0,$f5..$f7,$f9,$fb:
            inc(j2);
           $f4:
            begin
             inc(j2);
             b := Index[j2]
            end
           end;
           inc(j2)
          until False;
         dec(a3);
         if a3 < 0 then
          repeat
           case Module.Index[j3] of
           0..$55:
            begin
             a3 := a33;
             inc(j3);
             if Env3 then inc(j3);
             if i = 0 then inc(Nt);
             break
            end;
           $56..$5f:
            begin
             a3 := a33;
             inc(j3);
             break
            end;
           $60..$9f:
            a33 := Index[j3] - $60;
           $e0:
            env3 := True;
           $e1..$ef:
            env3 := False;
           $f0,$f5..$f7,$f9,$fb:
            inc(j3);
           $f4:
            begin
             inc(j3);
             b := Index[j3]
            end
           end;
           inc(j3)
          until False;
         Inc(tm,b);
         Dec(DLCatcher);
         if DLCatcher < 0 then break
        until False
       end
     end
end;

procedure GetTimeSTP(Module:PModTypes;var Tm,Lp,Nt:integer);
var
 a:byte;
 i:integer;
 j1:longword;
begin
   a := 1;
   with Module^ do
    begin
     for i := 0 to Index[STP_PositionsPointer] - 1 do
      begin
       if i = Index[STP_PositionsPointer + 1] then
        Lp := tm * STP_Delay;
       j1 := WordPtr(@Index[STP_PatternsPointer +
                      Index[STP_PositionsPointer + 2 + i * 2]])^;
       while Index[j1] <> 0 do
        begin
         case Index[j1] of
         1..$60:
          begin
           Inc(tm,a);
           if i = 0 then inc(Nt);
          end; 
         $d0..$ef:
          Inc(tm,a);
         $80..$BF:
          a := Index[j1] - $7f;
         $c0..$cf,$f0:
          inc(j1)
         end;
         inc(j1)
        end
      end;
     tm := tm * STP_Delay;

     j1 := WordPtr(@Index[STP_PatternsPointer + 2 +
                      Index[STP_PositionsPointer + 2]])^;
     while Index[j1] <> 0 do
      begin
       case Index[j1] of
       1..$60:
        inc(Nt);
       $c0..$cf,$f0:
        inc(j1)
       end;
       inc(j1)
      end;

     j1 := WordPtr(@Index[STP_PatternsPointer + 4 +
                      Index[STP_PositionsPointer + 2]])^;
     while Index[j1] <> 0 do
      begin
       case Index[j1] of
       1..$60:
        inc(Nt);
       $c0..$cf,$f0:
        inc(j1)
       end;
       inc(j1)
      end

    end
end;

procedure GetTimePT2(Module:PModTypes;var Tm,Lp,Nt:integer);
var
 i:integer;
 b:byte;
 a1,a2,a3,a11,a22,a33:shortint;
 DLCatcher:integer;
 j1,j2,j3:longword;
begin
   with Module^ do
    begin
     b := PT2_Delay;
     a1 := 0; a2 := 0; a3 := 0;
     a11 := 0; a22 := 0; a33 := 0;
     DLCatcher := 16384;
     i := 0;
     repeat
       if i >= 65536-131 then break;
       if shortint(PT2_PositionList[i]) < 0 then break;
       if i = PT2_LoopPosition then Lp := tm;
       j1 := WordPtr(@Index[PT2_PatternsPointer +
                                PT2_PositionList[i] * 6])^;
       j2 := WordPtr(@Index[PT2_PatternsPointer +
                                PT2_PositionList[i] * 6 + 2])^;
       j3 := WordPtr(@Index[PT2_PatternsPointer +
                                PT2_PositionList[i] * 6 + 4])^;
       repeat
        dec(a1);
        if a1 < 0 then
         begin
          if Index[j1] = 0 then break;
          repeat
           case Index[j1] of
           $80..$df:
            begin
             a1 := a11;
             inc(j1);
             if i = 0 then inc(Nt);
             break
            end;
           $70,$e0:
            begin
             a1 := a11;
             inc(j1);
             break
            end;
           $71..$7e:
            inc(j1,2);
           $20..$5f:
            a11 := Index[j1] - $20;
           $f:
            begin
             inc(j1);
             b := Index[j1]
            end;
           1..$b,$e:
            inc(j1);
           $d:
            inc(j1,3)
           end;
           inc(j1)
          until False
         end;
        dec(a2);
        if a2 < 0 then
         repeat
          case Index[j2] of
          $80..$df:
           begin
            a2 := a22;
            inc(j2);
            if i = 0 then inc(Nt);
            break
           end;
          $70,$e0:
           begin
            a2 := a22;
            inc(j2);
            break
           end;
          $71..$7e:
           inc(j2,2);
          $20..$5f:
           a22 := Index[j2] - $20;
          $f:
           begin
            inc(j2);
            b := Index[j2]
           end;
          1..$b,$e:
           inc(j2);
          $d:
           inc(j2,3)
          end;
          inc(j2)
         until False;
        dec(a3);
        if a3 < 0 then
         repeat
          case Index[j3] of
          $80..$df:
           begin
            a3 := a33;
            inc(j3);
            if i = 0 then inc(Nt);
            break
           end;
          $70,$e0:
           begin
            a3 := a33;
            inc(j3);
            break
           end;
          $71..$7e:
           inc(j3,2);
          $20..$5f:
           a33 := Index[j3] - $20;
          $f:
           begin
            inc(j3);
            b := Index[j3]
           end;
          1..$b,$e:
           inc(j3);
          $d:
           inc(j3,3)
          end;
          inc(j3)
         until False;
        Inc(tm,b);
        Dec(DLCatcher);
        if DLCatcher < 0 then break
       until False;
       inc(i)
     until False
    end
end;

procedure GetTimePT3(Module:PModTypes;var Tm,Lp,Nt:integer);
var
 b:byte;
 a1,a2,a3,a11,a22,a33:shortint;
 j1,j2,j3:longword;
 i,j,DLCatcher:integer;
 c1,c2,c3,c4,c5,c8:integer;
begin
   with Module^ do
    begin
     b := PT3_Delay;
     a11 := 1; a22 := 1; a33 := 1;
     DLCatcher := 16384;
     for i := 0 to PT3_NumberOfPositions - 1 do
      begin
       if i = PT3_LoopPosition then Lp := tm;
       j1 := WordPtr(@Index[PT3_PatternsPointer +
                                PT3_PositionList[i] * 2])^;
       j2 := WordPtr(@Index[PT3_PatternsPointer +
                                PT3_PositionList[i] * 2 + 2])^;
       j3 := WordPtr(@Index[PT3_PatternsPointer +
                                PT3_PositionList[i] * 2 + 4])^;
       a1 := 1; a2 := 1; a3 := 1;
       repeat
        dec(a1);
        if a1 = 0 then
         begin
          if Index[j1] = 0 then break;
          j := 0; c1 := 0; c2 := 0; c3 := 0; c4 := 0; c5 := 0; c8 := 0;
          repeat
           case Index[j1] of
           $50..$af:
            begin
             a1 := a11;
             inc(j1);
             if i = 0 then inc(Nt);
             break
            end;
           $d0,$c0:
            begin
             a1 := a11;
             inc(j1);
             break
            end;
           $10,$f0..$ff:
            inc(j1);
           $b2..$bf:
            inc(j1,2);
           $b1:
            begin
             inc(j1);
             a11 := Index[j1]
            end;
           $11..$1f:
            inc(j1,3);
           1:
            begin
             inc(j);
             c1 := j
            end;
           2:
            begin
             inc(j);
             c2 := j
            end;
           3:
            begin
             inc(j);
             c3 := j
            end;
           4:
            begin
             inc(j);
             c4 := j
            end;
           5:
            begin
             inc(j);
             c5 := j
            end;
           8:
            begin
             inc(j);
             c8 := j
            end;
           9:
            inc(j)
           end;
           inc(j1)
          until False;
          while j > 0 do
           begin
            if (j = c1) or (j = c8) then
             inc(j1,3)
            else if (j = c2) then
             inc(j1,5)
            else if (j = c3) or (j = c4) then
             inc(j1)
            else if (j = c5) then
             inc(j1,2)
            else
             begin
              b := Index[j1];
              inc(j1)
             end;
            if j1 >= 65536 then break;
            dec(j)
           end
         end;
        dec(a2);
        if a2 = 0 then
         begin
          j := 0; c1 := 0; c2 := 0; c3 := 0; c4 := 0; c5 := 0; c8 := 0;
          repeat
           case Index[j2] of
           $50..$af:
            begin
             a2 := a22;
             inc(j2);
             if i = 0 then inc(Nt);
             break
            end;
           $d0,$c0:
            begin
             a2 := a22;
             inc(j2);
             break
            end;
           $10,$f0..$ff:
            inc(j2);
           $b2..$bf:
            inc(j2,2);
           $b1:
            begin
             inc(j2);
             a22 := Index[j2]
            end;
           $11..$1f:
            inc(j2,3);
           1:
            begin
             inc(j);
             c1 := j
            end;
           2:
            begin
             inc(j);
             c2 := j
            end;
           3:
            begin
             inc(j);
             c3 := j
            end;
           4:
            begin
             inc(j);
             c4 := j
            end;
           5:
            begin
             inc(j);
             c5 := j
            end;
           8:
            begin
             inc(j);
             c8 := j
            end;
           9:
            inc(j)
           end;
           inc(j2)
          until False;
          while j > 0 do
           begin
            if (j = c1) or (j = c8) then
             inc(j2,3)
            else if (j = c2) then
             inc(j2,5)
            else if (j = c3) or (j = c4) then
             inc(j2)
            else if (j = c5) then
             inc(j2,2)
            else
             begin
              b := Index[j2];
              inc(j2)
             end;
            if j2 >= 65536 then break;
            dec(j)
           end
         end;
        dec(a3);
        if a3 = 0 then
         begin
          j := 0; c1 := 0; c2 := 0; c3 := 0; c4 := 0; c5 := 0; c8 := 0;
          repeat
           case Module.Index[j3] of
           $50..$af:
            begin
             a3 := a33;
             inc(j3);
             if i = 0 then inc(Nt);
             break
            end;
           $d0,$c0:
            begin
             a3 := a33;
             inc(j3);
             break
            end;
           $10,$f0..$ff:
            inc(j3);
           $b2..$bf:
            inc(j3,2);
           $b1:
            begin
             inc(j3);
             a33 := Index[j3]
            end;
           $11..$1f:
            inc(j3,3);
           1:
            begin
             inc(j);
             c1 := j
            end;
           2:
            begin
             inc(j);
             c2 := j
            end;
           3:
            begin
             inc(j);
             c3 := j
            end;
           4:
            begin
             inc(j);
             c4 := j
            end;
           5:
            begin
             inc(j);
             c5 := j
            end;
           8:
            begin
             inc(j);
             c8 := j
            end;
           9:
            inc(j)
           end;
           inc(j3)
          until False;
          while j > 0 do
           begin
            if (j = c1) or (j = c8) then
             inc(j3,3)
            else if (j = c2) then
             inc(j3,5)
            else if (j = c3) or (j = c4) then
             inc(j3)
            else if (j = c5) then
             inc(j3,2)
            else
             begin
              b := Index[j3];
              inc(j3)
             end;
            if j3 >= 65536 then break;
            dec(j)
           end
         end;
        Inc(tm,b);
        Dec(DLCatcher);
        if DLCatcher < 0 then break
       until False
      end
    end
end;

procedure GetTimePSC(Module:PModTypes;var Tm,Lp,Nt:integer);
var
 b:byte;
 pptr,cptr,pptr0:longword;
 j1,j2,j3:longword;
 a1,a2,a3:shortint;
 i:integer;
begin
   with Module^ do
    begin
     b := PSC_Delay;
     pptr := PSC_PatternsPointer;
     inc(pptr);
     pptr0 := pptr + 8;
     while Index[pptr] <> 255 do
      begin
       inc(pptr,8);
       if pptr >= 65536 then break
      end;
   //  if pptr >= 65536 - 2 then break;
     cptr := WordPtr(@Index[pptr + 1])^;
     inc(cptr);
     pptr := PSC_PatternsPointer;
     inc(pptr);
     while Index[pptr] <> 255 do
      begin
       if pptr = cptr then Lp := tm;
       if pptr >= 65536 - 6 then break;
       j1 := WordPtr(@Index[pptr + 1])^;
       j2 := WordPtr(@Index[pptr + 3])^;
       j3 := WordPtr(@Index[pptr + 5])^;
       Inc(pptr,8);
       if pptr >= 65536 then break;
       a1 := 1; a2 := 1; a3 := 1;
       for i := 1 to Index[pptr - 8] do
        begin
         dec(a1);
         if a1 = 0 then
          repeat
           case Index[j1] of
           $c0..$ff:
            begin
             a1 := Index[j1] - $bf;
             inc(j1);
             break
            end;
           $67..$6d,$6f..$7b:
            inc(j1);
           $6e:
            begin
             inc(j1);
             b := Index[j1]
            end;
           $0..$56:
            if pptr = pptr0 then inc(Nt);
           end;
           inc(j1)
          until False;
         dec(a2);
         if a2 = 0 then
          repeat
           case Index[j2] of
           $c0..$ff:
            begin
             a2 := Index[j2] - $bf;
             inc(j2);
             break
            end;
           $67..$6d,$6f..$79,$7b:
            inc(j2);
           $6e:
            begin
             inc(j2);
             b := Index[j2]
            end;
           $7a:
            inc(j2,3);
           $0..$56:
            if pptr = pptr0 then inc(Nt);
           end;
           inc(j2)
          until False;
         dec(a3);
         if a3 = 0 then
          repeat
           case Index[j3] of
           $c0..$ff:
            begin
             a3 := Index[j3] - $bf;
             inc(j3);
             break
            end;
           $67..$6d,$6f..$7b:
            inc(j3);
           $6e:
            begin
             inc(j3);
             b := Index[j3]
            end;
           $0..$56:
            if pptr = pptr0 then inc(Nt);
           end;
           inc(j3)
          until False;
         Inc(tm,b)
        end
      end
    end
end;

procedure GetTimeFTC(Module:PModTypes;var Tm,Lp,Nt:integer);
var
 b:byte;
 i:integer;
 j1,j2,j3:longword;
 a1,a2,a3:shortint;
 DLCatcher:integer;
begin
   with Module^ do
    begin
     b := FTC_Delay;
     i := 0;
     repeat
      if FTC_Positions[i].Pattern = 255 then break;
      if i = FTC_Loop_Position then Lp := tm;
      j1 := WordPtr(@Index[FTC_PatternsPointer +
                           FTC_Positions[i].Pattern * 6])^;
      j2 := WordPtr(@Index[FTC_PatternsPointer +
                           FTC_Positions[i].Pattern * 6 + 2])^;
      j3 := WordPtr(@Index[FTC_PatternsPointer +
                           FTC_Positions[i].Pattern * 6 + 4])^;
      Inc(i);
      if i >= (65536 - $d4) div 2 then break;
      a1 := 0; a2 := 0; a3 := 0;
      DLCatcher := 256;
      repeat
       Dec(a1);
       if a1 < 0 then
        begin
         if Index[j1] = 255 then break;
         repeat
          case Index[j1] of
          $60..$cb:
           begin
            a1 := 0;
            inc(j1);
            if i = 0 then inc(Nt);
            break
           end;
          $30:
           begin
            a1 := 0;
            inc(j1);
            break
           end;
          $40..$5f:
           begin
            a1 := Index[j1] - $40;
            inc(j1);
            break
           end;
          $ee,$ef:
           Inc(j1);
          $31..$3e,$ed:
           Inc(j1,2);
          $f0..$ff:
           begin
            inc(j1);
            b := Index[j1]
           end
          end;
          inc(j1)
         until False
        end;
        Dec(a2);
        if a2 < 0 then
         repeat
          case Index[j2]of
          $60..$cb:
           begin
            a2 := 0;
            inc(j2);
            if i = 0 then inc(Nt);
            break
           end;
          $30:
           begin
            a2 := 0;
            inc(j2);
            break
           end;
          $40..$5f:
           begin
            a2 := Index[j2] - $40;
            inc(j2);
            break
           end;
          $ee,$ef:
           inc(j2);
          $31..$3e,$ed:
           inc(j2,2);
          $f0..$ff:
           begin
            inc(j2);
            b := Index[j2]
           end
          end;
          inc(j2)
         until False;
        Dec(a3);
        if a3 < 0 then
         repeat
          case Index[j3] of
          $60..$cb:
           begin
            a3 := 0;
            inc(j3);
            if i = 0 then inc(Nt);
            break
           end;
          $30:
           begin
            a3 := 0;
            inc(j3);
            break
           end;
          $40..$5f:
           begin
            a3 := Index[j3] - $40;
            inc(j3);
            break
           end;
          $ee,$ef:
           inc(j3);
          $31..$3e,$ed:
           inc(j3,2);
          $f0..$ff:
           begin
            inc(j3);
            b := Index[j3]
           end
          end;
          inc(j3)
         until False;
        Inc(tm,b);
        Dec(DLCatcher);
        if DLCatcher < 0 then break
      until False
     until False
    end
end;

procedure GetTimeSQT(Module:PModTypes;var Tm,Lp,Nt:integer);
var
 pptr,pptr0,cptr:longword;
 f71,f72,f73,
 f61,f62,f63,
 f41,f42,f43,flg:boolean;
 j1,j2,j3:longword;
 j11,j22,j33:word;
 b:byte;
 a1,a2,a3:shortint;
 i:integer;
begin
   with Module^ do
    begin
     pptr := SQT_PositionsPointer;
     pptr0 := pptr + 7;
     while Index[pptr] <> 0 do
      begin
       if pptr = SQT_LoopPointer then Lp := tm;
       f41 := Index[pptr] and 128 <> 0;
       j1 := WordPtr(@Index[byte(Index[pptr] * 2) + SQT_PatternsPointer])^;
       inc(j1);
       Inc(pptr,2);
       if pptr >= 65536 then break;
       f42 := Index[pptr] and 128 <> 0;
       j2 := WordPtr(@Index[byte(Index[pptr] * 2) + SQT_PatternsPointer])^;
       inc(j2);
       Inc(pptr,2);
       if pptr >= 65536 then break;
       f43 := Index[pptr] and 128 <> 0;
       j3 := WordPtr(@Index[byte(Index[pptr] * 2) + SQT_PatternsPointer])^;
       inc(j3);
       Inc(pptr,2);
       if pptr >= 65536 then break;
       b := Index[pptr];
       inc(pptr);
       a1 := 0; a2 := 0; a3 := 0;
       for i := 1 to Index[j1 - 1] do
        begin
         if a1 <> 0 then
          begin
           dec(a1);
           if f71 then
            begin
             cptr := j11;
             f61 := False;
             if Index[cptr] in [0..$7f] then
              begin
               inc(cptr);
               case Index[cptr] of
               0..$7f:
                begin
                 inc(cptr);
                 if f61 then j1 := cptr + 1;
                 case Index[cptr - 1] - 1 of
                 4:
                  if f41 then
                   begin
                    b := Index[cptr] and 31;
                    if b = 0 then b := 32
                   end;
                 5:
                  if f41 then
                   begin
                    b := (b + Index[cptr]) and 31;
                    if b = 0 then b := 32
                   end
                 end
                end;
               $80..$ff:
                begin
                 if Index[cptr] and 64 <> 0 then
                  begin
                   inc(cptr);
                   if Index[cptr] and 15 <> 0 then
                    begin
                     inc(cptr);
                     if f61 then j1 := cptr + 1;
                     case (Index[cptr - 1]) and 15 - 1 of
                     4:
                      if f41 then
                       begin
                        b := Index[cptr] and 31;
                        if b = 0 then b := 32
                       end;
                     5:
                      if f41 then
                       begin
                        b := (b + Index[cptr]) and 31;
                        if b = 0 then b := 32
                       end
                     end
                    end
                  end
                end
               end
              end
            end
          end
         else
          begin
           if j1 >= 65536 then break;
           cptr := j1;
           f61 := True;
           f71 := False;
           repeat
            case Index[cptr] of
            0..$5f:
             begin
              if pptr = pptr0 then inc(Nt);
              j11 := cptr;
              inc(cptr);
              case Index[cptr] of
              0..$7f:
               begin
                inc(cptr);
                if f61 then
                 begin
                  j1 := cptr + 1;
                  f61 := False
                 end;
                case Index[cptr - 1] - 1 of
                4:
                 if f41 then
                  begin
                   b := Index[cptr] and 31;
                   if b = 0 then b := 32
                  end;
                5:
                 if f41 then
                  begin
                   b := (b + Index[cptr]) and 31;
                   if b = 0 then b := 32
                  end
                end
               end;
              $80..$ff:
               begin
                if Index[cptr] and 64 <> 0 then
                 begin
                  inc(cptr);
                  if Index[cptr] and 15 <> 0 then
                   begin
                    inc(cptr);
                    if f61 then
                     begin
                      j1 := cptr + 1;
                      f61 := False
                     end;
                    case Index[cptr - 1] and 15 - 1 of
                    4:
                     if f41 then
                      begin
                       b := Index[cptr] and 31;
                       if b = 0 then b := 32
                      end;
                    5:
                     if f41 then
                      begin
                       b := (b + Index[cptr]) and 31;
                       if b = 0 then b := 32
                      end
                    end
                   end
                 end
               end
              end;
              inc(cptr);
              if f61 then j1 := cptr;
              break
             end;
            $60..$6e:
             begin
              inc(cptr);
              if f61 then j1 := cptr + 1;
              case Index[cptr - 1] - $60 - 1 of
              4:
               if f41 then
                begin
                 b := Index[cptr] and 31;
                 if b = 0 then b := 32
                end;
              5:if f41 then
               begin
                b := (b + Index[cptr]) and 31;
                if b = 0 then b := 32
               end
              end;
              break
             end;
            $6f..$7f:
             begin
              if Index[cptr] <> $6f then
               begin
                inc(cptr);
                if f61 then j1 := cptr + 1;
                case Index[cptr - 1] - $6f - 1 of
                4:
                 if f41 then
                  begin
                   b := Index[cptr] and 31;
                   if b = 0 then b := 32
                  end;
                5:
                 if f41 then
                  begin
                   b := (b + Index[cptr]) and 31;
                   if b = 0 then b := 32
                  end
                end
               end
              else
               j1 := cptr + 1;
              break
             end;
            $80..$bf:
             begin
              if (Index[cptr] in [$80..$9f]) and (pptr = pptr0) then inc(Nt);
              j1 := cptr + 1;
              if Index[cptr] in [$a0..$bf] then
               begin
                a1 := Index[cptr] and 15;
                if Index[cptr] and 16 = 0 then break;
                if a1 <> 0 then f71 := True
               end;
              cptr := j11;
              f61 := False;
              if Index[cptr] in [0..$7f] then
               begin
                inc(cptr);
                case Index[cptr] of
                0..$7f:
                 begin
                  inc(cptr);
                  if f61 then j1 := cptr + 1;
                  case Index[cptr - 1] - 1 of
                  4:
                   if f41 then
                    begin
                     b := Index[cptr] and 31;
                     if b = 0 then b := 32
                    end;
                   5:
                    if f41 then
                     begin
                      b := (b + Index[cptr]) and 31;
                      if b = 0 then b := 32
                     end
                   end
                 end;
                $80..$ff:
                 begin
                  if Index[cptr] and 64 <> 0 then
                   begin
                    inc(cptr);
                    if Index[cptr] and 15 <> 0 then
                     begin
                      inc(cptr);
                      if f61 then j1 := cptr + 1;
                      case (Index[cptr - 1]) and 15 - 1 of
                      4:
                       if f41 then
                        begin
                         b := Index[cptr] and 31;
                         if b = 0 then b := 32
                        end;
                      5:
                       if f41 then
                        begin
                         b := (b + Index[cptr]) and 31;
                         if b = 0 then b := 32
                        end
                      end
                     end
                   end
                 end
                end
               end;
              break
             end;
            $c0..$ff:
             begin
              j1 := cptr + 1;
              j11 := cptr;
              break
             end
            end
           until False
          end;
         if a2 <> 0 then
          begin
           dec(a2);
           if f72 then
            begin
             cptr := j22;
             f62 := False;
             if Index[cptr] in [0..$7f] then
              begin
               inc(cptr);
               case Index[cptr] of
               0..$7f:
                begin
                 inc(cptr);
                 if f62 then j2 := cptr + 1;
                 case Index[cptr - 1] - 1 of
                 4:
                  if f42 then
                   begin
                    b := Index[cptr] and 31;
                    if b = 0 then b := 32
                   end;
                 5:
                  if f42 then
                   begin
                    b := (b + Index[cptr]) and 31;
                    if b = 0 then b := 32
                   end
                 end
                end;
               $80..$ff:
                begin
                 if Index[cptr] and 64 <> 0 then
                  begin
                   inc(cptr);
                   if Index[cptr] and 15 <> 0 then
                    begin
                     inc(cptr);
                     if f62 then j2 := cptr + 1;
                     case Index[cptr - 1] and 15 - 1 of
                     4:
                      if f42 then
                       begin
                        b := Index[cptr] and 31;
                        if b = 0 then b := 32
                       end;
                     5:
                      if f42 then
                       begin
                        b := (b + Index[cptr]) and 31;
                        if b = 0 then b := 32
                       end
                     end
                    end
                  end
                end
               end
              end
            end
          end
         else
          begin
           if j2 >= 65536 then break;
           cptr := j2;
           f62 := True;
           f72 := False;
           repeat
            case Index[cptr] of
            0..$5f:
             begin
              if pptr = pptr0 then inc(Nt);
              j22 := cptr;
              inc(cptr);
              case Index[cptr] of
              0..$7f:
               begin
                inc(cptr);
                if f62 then
                 begin
                  j2 := cptr + 1;
                  f62 := False
                 end;
                case Index[cptr - 1] - 1 of
                4:
                 if f42 then
                  begin
                   b := Index[cptr] and 31;
                   if b = 0 then b := 32
                  end;
                5:
                 if f42 then
                  begin
                   b := (b + Index[cptr]) and 31;
                   if b = 0 then b := 32
                  end
                end
               end;
              $80..$ff:
               begin
                if Index[cptr] and 64 <> 0 then
                 begin
                  inc(cptr);
                  if Index[cptr] and 15 <> 0 then
                   begin
                    inc(cptr);
                    if f62 then
                     begin
                      j2 := cptr + 1;
                      f62 := False
                     end;
                    case Index[cptr - 1] and 15 - 1 of
                    4:
                     if f42 then
                      begin
                       b := Index[cptr] and 31;
                       if b = 0 then b := 32
                      end;
                    5:
                     if f42 then
                      begin
                       b := (b + Index[cptr]) and 31;
                       if b = 0 then b := 32
                      end
                    end
                   end
                 end
               end
              end;
              inc(cptr);
              if f62 then j2 := cptr;
              break
             end;
            $60..$6e:
             begin
              inc(cptr);
              if f62 then j2 := cptr + 1;
              case Index[cptr - 1] - $60 - 1 of
              4:
               if f42 then
                begin
                 b := Index[cptr] and 31;
                 if b = 0 then b := 32
                end;
              5:
               if f42 then
                begin
                 b := (b + Index[cptr]) and 31;
                 if b = 0 then b := 32
                end
              end;
              break
             end;
            $6f..$7f:
             begin
              if Index[cptr] <> $6f then
               begin
                inc(cptr);
                if f62 then j2 := cptr + 1;
                case Index[cptr - 1] - $6f - 1 of
                4:
                 if f42 then
                  begin
                   b := Index[cptr] and 31;
                   if b = 0 then b := 32
                  end;
                5:
                 if f42 then
                  begin
                   b := (b + Index[cptr]) and 31;
                   if b = 0 then b := 32
                  end
                end
               end
              else
               j2 := cptr + 1;
              break
             end;
            $80..$bf:
             begin
              if (Index[cptr] in [$80..$9f]) and (pptr = pptr0) then inc(Nt);
              j2 := cptr + 1;
              if not (Index[cptr] in [$80..$9f]) then
               begin
                a2 := Index[cptr] and 15;
                if Index[cptr] and 16 = 0 then break;
                if a2 <> 0 then f72 := True
               end;
              cptr := j22;
              f62 := False;
              if Index[cptr] in [0..$7f] then
               begin
                inc(cptr);
                case Index[cptr] of
                0..$7f:
                 begin
                  inc(cptr);
                  if f62 then j2 := cptr + 1;
                  case Index[cptr - 1] - 1 of
                  4:
                   if f42 then
                    begin
                     b := Index[cptr] and 31;
                     if b = 0 then b := 32
                    end;
                  5:
                   if f42 then
                    begin
                     b := (b + Index[cptr]) and 31;
                     if b = 0 then b := 32
                    end
                  end
                 end;
                $80..$ff:
                 begin
                  if Index[cptr] and 64 <> 0 then
                   begin
                    inc(cptr);
                    if Index[cptr] and 15 <> 0 then
                     begin
                      inc(cptr);
                      if f62 then j2 := cptr + 1;
                      case Index[cptr - 1] and 15 - 1 of
                      4:
                       if f42 then
                        begin
                         b := Index[cptr] and 31;
                         if b = 0 then b := 32
                        end;
                      5:
                       if f42 then
                        begin
                         b := (b + Index[cptr]) and 31;
                         if b = 0 then b := 32
                        end
                      end
                     end
                   end
                 end
                end
               end;
              break
             end;
            $c0..$ff:
             begin
              j2 := cptr + 1;
              j22 := cptr;
              break
             end
            end
           until False
          end;
         if a3 <> 0 then
          begin
           Dec(a3);
           if f73 then
            begin
             cptr := j33;
             f63 := False;
             if Index[cptr] in [0..$7f] then
              begin
               inc(cptr);
               case Index[cptr] of
               0..$7f:
                begin
                 inc(cptr);
                 if f63 then j3 := cptr + 1;
                 case Index[cptr - 1] - 1 of
                 4:
                  if f43 then
                   begin
                    b := Index[cptr] and 31;
                    if b = 0 then b := 32
                   end;
                 5:
                  if f43 then
                   begin
                    b := (b + Index[cptr]) and 31;
                    if b = 0 then b := 32
                   end
                 end
                end;
               $80..$ff:
                begin
                 if Index[cptr] and 64 <> 0 then
                  begin
                   inc(cptr);
                   if Index[cptr] and 15 <> 0 then
                    begin
                     inc(cptr);
                     if f63 then j3 := cptr + 1;
                     case Index[cptr - 1] and 15 - 1 of
                     4:
                      if f43 then
                       begin
                        b := Index[cptr] and 31;
                        if b = 0 then b := 32
                       end;
                     5:
                      if f43 then
                       begin
                        b := (b + Index[cptr]) and 31;
                        if b = 0 then b := 32
                       end
                     end
                    end
                  end
                end
               end
             end
            end
          end
         else
          begin
           if j3 >= 65536 then break;
           cptr := j3;
           f63 := True;
           f73 := False;
           repeat
            case Index[cptr] of
            0..$5f:
             begin
              if pptr = pptr0 then inc(Nt); 
              j33 := cptr;
              inc(cptr);
              case Index[cptr] of
              0..$7f:
               begin
                inc(cptr);
                if f63 then
                 begin
                  j3 := cptr + 1;
                  f63 := False
                 end;
                case Index[cptr - 1] - 1 of
                4:
                 if f43 then
                  begin
                   b := Index[cptr] and 31;
                   if b = 0 then b := 32
                  end;
                5:
                 if f43 then
                  begin
                   b := (b + Index[cptr]) and 31;
                   if b = 0 then b := 32
                  end
                end
               end;
              $80..$ff:
               begin
                if Index[cptr] and 64 <> 0 then
                 begin
                  inc(cptr);
                  if Index[cptr] and 15 <> 0 then
                   begin
                    inc(cptr);
                    if f63 then
                     begin
                      j3 := cptr + 1;
                      f63 := False
                     end;
                    case Index[cptr - 1] and 15 - 1 of
                    4:
                     if f43 then
                      begin
                       b := Index[cptr] and 31;
                       if b = 0 then b := 32
                      end;
                    5:
                     if f43 then
                      begin
                       b := (b + Index[cptr]) and 31;
                       if b = 0 then b := 32
                      end
                    end
                   end
                 end
               end
              end;
              inc(cptr);
              if f63 then j3 := cptr;
              break
             end;
            $60..$6e:
             begin
              inc(cptr);
              if f63 then j3 := cptr + 1;
              case Index[cptr - 1] - $60 - 1 of
              4:
               if f43 then
                begin
                 b := Index[cptr] and 31;
                 if b = 0 then b := 32
                end;
              5:
               if f43 then
                begin
                 b := (b + Index[cptr]) and 31;
                 if b = 0 then b := 32
                end
              end;
              break
             end;
            $6f..$7f:
             begin
              if Index[cptr] <> $6f then
               begin
                inc(cptr);
                if f63 then j3 := cptr + 1;
                case Index[cptr - 1] - $6f - 1 of
                4:
                 if f43 then
                  begin
                   b := Index[cptr] and 31;
                   if b = 0 then b := 32
                  end;
                5:
                 if f43 then
                  begin
                   b := (b + Index[cptr]) and 31;
                   if b = 0 then b := 32
                  end
                end
               end
              else
               j3 := cptr + 1;
              break
             end;
            $80..$bf:
             begin
              if (Index[cptr] in [$80..$9f]) and (pptr = pptr0) then inc(Nt);
              j3 := cptr + 1;
              if not (Index[cptr] in [$80..$9f]) then
               begin
                a3 := Index[cptr] and 15;
                if Index[cptr] and 16 = 0 then break;
                if a3 <> 0 then f73 := True
               end;
              cptr := j33;
              f63 := False;
              if Index[cptr] in [0..$7f] then
               begin
                inc(cptr);
                case Index[cptr] of
                0..$7f:
                 begin
                  inc(cptr);
                  if f63 then j3 := cptr + 1;
                  case Index[cptr - 1] - 1 of
                   4:
                    if f43 then
                     begin
                      b := Index[cptr] and 31;
                      if b = 0 then b := 32
                     end;
                   5:
                    if f43 then
                     begin
                      b := (b + Index[cptr]) and 31;
                      if b = 0 then b := 32
                     end
                   end
                 end;
                $80..$ff:
                 begin
                  if Index[cptr] and 64 <> 0 then
                   begin
                    inc(cptr);
                    if Index[cptr] and 15 <> 0 then
                     begin
                      inc(cptr);
                      if f63 then j3 := cptr + 1;
                      case Index[cptr - 1] and 15 - 1 of
                      4:
                       if f43 then
                        begin
                         b := Index[cptr] and 31;
                         if b = 0 then b := 32
                        end;
                      5:
                       if f43 then
                        begin
                         b := (b + Index[cptr]) and 31;
                         if b = 0 then b := 32
                        end
                      end
                     end
                   end
                 end
                end
               end;
              break
             end;
            $c0..$ff:
             begin
              j3 := cptr + 1;
              j33 := cptr;
              break
             end;
            end
           until False
          end;
         Inc(tm,b)
        end
      end
    end
end;

procedure GetTimePT1(Module:PModTypes;var Tm,Lp,Nt:integer);
var
 b:byte;
 j1,j2,j3:longword;
 a1,a2,a3,a11,a22,a33:shortint;
 DLCatcher:integer;
 i:integer;
begin
   with Module^ do
    begin
     b := PT1_Delay;
     a1 := 0; a2 := 0; a3 := 0;
     a11 := 0; a22 := 0; a33 := 0;
     DLCatcher := 16384;
     for i := 0 to PT1_NumberOfPositions - 1 do
      begin
       if i = PT1_LoopPosition then Lp := tm;
       j1 := WordPtr(@Index[PT1_PatternsPointer +
                                        PT1_PositionList[i] * 6])^;
       j2 := WordPtr(@Index[PT1_PatternsPointer +
                                        PT1_PositionList[i] * 6 + 2])^;
       j3 := WordPtr(@Index[PT1_PatternsPointer +
                                        PT1_PositionList[i] * 6 + 4])^;
       repeat
        Dec(a1);
        if a1 < 0 then
         begin
          if Index[j1] = 255 then break;
           repeat
            case Index[j1] of
            0..$5f:
             begin
              a1 := a11;
              inc(j1);
              if i = 0 then inc(Nt);
              break
             end;
            $80,$90:
             begin
              a1 := a11;
              inc(j1);
              break
             end;
            $82..$8f:
             Inc(j1,2);
            $b1..$fe:
             a11 := Index[j1] - $b1;
            $91..$a0:
             b := Index[j1] - $91;
            end;
            inc(j1)
           until False
         end;
        Dec(a2);
        if a2 < 0 then
         repeat
          case Index[j2] of
          0..$5f:
           begin
            a2 := a22;
            inc(j2);
            if i = 0 then inc(Nt);
            break
           end;
          $80,$90:
           begin
            a2 := a22;
            inc(j2);
            break
           end;
          $82..$8f:
           Inc(j2,2);
          $b1..$fe:
           a22 := Index[j2] - $b1;
          $91..$a0:
           b := Index[j2] - $91
          end;
          inc(j2)
         until False;
        Dec(a3);
        if a3 < 0 then
         repeat
          case Index[j3] of
          0..$5f:
           begin
            a3 := a33;
            inc(j3);
            if i = 0 then inc(Nt);
            break
           end;
          $80,$90:
           begin
            a3 := a33;
            inc(j3);
            break
           end;
          $82..$8f:
           Inc(j3,2);
          $b1..$fe:
           a33 := Index[j3] - $b1;
          $91..$a0:
           b := Index[j3] - $91
          end;
          inc(j3)
         until False;
        Inc(tm,b);
        Dec(DLCatcher);
        if DLCatcher < 0 then break
       until False
      end
    end
end;

procedure GetTimeFLS(Module:PModTypes;var Tm,Nt:integer);
var
 b:byte;
 a1,a11:shortint;
 i:integer;
 pptr:longword;
 j1:longword;
begin
   with Module^ do
    begin
     b := Index[FLS_PositionsPointer];
     a1 := 0; a11 := 0; i := 0;
     repeat
      pptr := i + FLS_PositionsPointer + 1;
      if pptr >= 65536 then break;
      if Index[pptr] = 0 then break;
      j1 := FLS_PatternsPointers[Index[pptr]].PatternA;
      repeat
       Dec(a1);
       if a1 < 0 then
        begin
         if Index[j1] = 255 then break;
         repeat
          case Index[j1] of
          0..$5f:
           begin
            if i = 0 then inc(Nt);
            inc(j1);
            a1 := a11;
            break
           end;
          $80,$81:
           begin
            inc(j1);
            a1 := a11;
            break
           end;
          $82..$8e:
           Inc(j1);
          $8f..$ff:
           a11 := Index[j1] - $a1
          end;
          inc(j1)
         until False
        end;
       Inc(tm,b)
      until False;
      Inc(i)
     until False;

     pptr := FLS_PositionsPointer + 1;
     if Index[pptr] = 0 then exit;
     j1 := FLS_PatternsPointers[Index[pptr]].PatternB;
     while Index[j1] <> 255 do
      repeat
       case Index[j1] of
       0..$5f:
        begin
         inc(Nt);
         inc(j1);
         break
        end;
       $80,$81:
        begin
         inc(j1);
         break
        end;
       $82..$8e:
        Inc(j1);
       end;
       inc(j1)
      until False;

     j1 := FLS_PatternsPointers[Index[pptr]].PatternC;
     while Index[j1] <> 255 do
      repeat
       case Index[j1] of
       0..$5f:
        begin
         inc(Nt);
         inc(j1);
         break
        end;
       $80,$81:
        begin
         inc(j1);
         break
        end;
       $82..$8e:
        Inc(j1);
       end;
       inc(j1)
      until False

    end
end;

{var
 fout:TextFile;
 NOfFiles:integer;   }

function AYAnalizeFile(File_Name,SFileExt:string;
                        var STitle:shortstring):integer;

var
 Module{, F_Frame}:ModTypes;      Ch:char;   f:file;
 F_Length, TimeLength, Address, F_Address, F_Offset, FormSpec:integer;
 Song_Name,Song_Author{,FTypeS}:string;

function LoadTrackerModule(FType:Available_Types):boolean;
var
 i,i1,i2:integer;
 j,j2:longword;
 pwrd:WordPtr;
begin
Result := False;
  try
      AssignFile(f,File_Name);
      Reset(f,1);
      F_Length := FileSize(File_Name);
      if F_Length > 65536 then F_Length := 65536;
   try
    FillChar(Module,65536,0);
     if FType=FXMFile then begin
      Seek(f,4);
      BlockRead(f, Address,2);
      BlockRead(f,Module.Index[Address],F_Length);
     end else
    BlockRead(f,Module.Index[0],F_Length)
   finally
    CloseFile(f)
   end;
   case FType of
   SQTFile:
    with Module do
     begin
      i := SQT_SamplesPointer - 10;
      if  i < 0 then exit;
      i1 := 0;
      i2 := SQT_PositionsPointer - i;
      if i2 < 0 then exit;
      while Index[i2] <> 0 do
       begin
        if i2 > 65536 - 8 then exit;
        if i1 < Index[i2] and $7f then
         i1 := Index[i2] and $7f;
        Inc(i2,2);
        if i1 < Index[i2] and $7f then
         i1 := Index[i2] and $7f;
        Inc(i2,2);
        if i1 < Index[i2] and $7f then
         i1 := Index[i2] and $7f;
        Inc(i2,3)
       end;
      j2 := longword(@Index[65535]);
      pwrd := @SQT_SamplesPointer;
      i1 := (SQT_PatternsPointer - i + i1 * 2) div 2;
      if i1 < 1 then exit;
      for i2 := 1 to i1 do
       begin
        if longword(pwrd) >= j2 then exit;
        if pwrd^ < i then exit;
        Dec(pwrd^,i);
        Inc(integer(pwrd),2)
       end
     end;
   FLSFile:
    begin
     i := Module.FLS_OrnamentsPointer - 16;
     if i >= 0 then
      with Module do
       repeat
        i2 := FLS_SamplesPointer + 2 - i;
        if (i2 >= 8) and (i2 < F_Length) then
         begin
          pwrd := @Index[i2];
          i1 := pwrd^ - i;
          if (i1 >= 8) and (i1 < F_Length) then
           begin
            pwrd := @Index[i2 - 4];
            i2 := pwrd^ - i;
            if (i2 >= 6) and (i2 < F_Length) then
             if i1 - i2 = $20 then
              begin
               i2 := FLS_PatternsPointers[1].PatternB - i;
               if (i2 > 21) and (i2 < F_Length) then
                begin
                 i1 := FLS_PatternsPointers[1].PatternA - i;
                 if (i1 > 20) and (i1 < F_Length) then
                  if Index[i1 - 1] = 0 then
                   begin
                    while (i1 < F_Length) and (Index[i1] <> 255) do
                     begin
                      repeat
                       case Index[i1] of
                       0..$5f,$80,$81:
                        begin
                         Inc(i1);
                         break
                        end;
                       $82..$8e:
                        Inc(i1)
                       end;
                       Inc(i1);
                      until i1 >= F_Length;
                     end;
                    if i1 + 1 = i2 then break
                   end
                end
              end
           end
         end;
        Dec(i)
       until i < 0;
     if i < 0 then
      exit
     else
      with Module do
       begin
        pwrd := @Module;
        i1 := FLS_SamplesPointer - i; if i1 and 1 <> 0 then exit;
        i2 := FLS_PositionsPointer - i; if (i2 - i1) and 3 <> 0 then exit;
        inc(i1,integer(pwrd));
        inc(i2,integer(pwrd) + 2);
        repeat
         Dec(pwrd^,i);
         Inc(integer(pwrd),2)
        until i1 <= integer(pwrd);
        Inc(integer(pwrd),2);
        repeat
         Dec(pwrd^,i);
         Inc(integer(pwrd),4)
        until i2 <= integer(pwrd)
       end
    end;
   GTRFile:
    with Module do
     begin
      pwrd := @GTR_SamplesPointers[0];
      if longword(pwrd) + (15 + 16 + 32 * 3) * 2 > longword(@Index[65536]) then
       exit;
      j := GTR_Address;
      for i := 0 to (15 + 16 + 32 * 3) - 1 do
       begin
        if pwrd^ < j then exit;
        Dec(pwrd^,j);
        Inc(integer(pwrd),2)
       end;
      GTR_Address := 0
     end;
            end;
  except
   exit
  end;
Result := True
end;

procedure Analize(FType:Available_Types);
var
 LoopPoint,NumOfNtIn1Pos,{NumOfPositions,LoopPosition,}i,j,tmp:integer;
 URHandle, orisize,l,k:integer;     DWrd:dword;
 LZHFileHeader:TLZHFileHeader; YM5FileHeader:TYM5FileHeader;
 KsaId2:string;               EPSGRec:TEPSGRec;
 Wrd:word;        b,b1:byte;    t:smallint;
 VTXFileHeader:TVTXFileHeader;
  Zag:array[0..3]of char;
// LHZag:array[0..4] of char;
begin
tmp:=0;
TimeLength:=0;
if FType in [TrkFileMin..TrkFileMax] then
 if LoadTrackerModule(FType) then
  begin
TimeLength := 0; LoopPoint := 0; NumOfNtIn1Pos := 0;
try
case FType of
ZXAYFile:
  begin
   tmp:=4;
   while tmp < F_Length do
    begin
     Move(Module.Index[tmp],i,4);
     if i and $FFFFF = 0 then Inc(TimeLength);
    end;
   TimeLength := round(TimeLength * 1000 / (FrqZ80 / $100000) +
                (i and $FFFFF) / FrqZ80 * 1000);     // or (t and $FFFFF) ??
  end;
OUTFile:begin
   tmp:=0;
   repeat
    Move(Module.Index[tmp],t,2);
    inc(tmp,2);
    if (t = -1) or (t = 0) then Inc(TimeLength);
    inc(tmp,3);
   until tmp >= F_Length;
   TimeLength := round(TimeLength * 1000 / (FrqZ80 / 17472));
   if t > 0 then
    Inc(TimeLength,round((t / 17472) * 1000 / (FrqZ80 / 17472)))
  end;
PSGFile: begin
     Move(Module.Index[0],zag,4);
            if zag = 'PSG'#26 then
              begin
               Move(Module.Index[4],zag,2);
               if byte(zag[0]) > 10 then exit;
               if byte(zag[0]) = 10 then
         //       PlrFrq := byte(zag[1]) * 1000
              end
             else if zag = 'EPSG' then
              begin
               Move(Module.Index[4],zag,2);
               if (zag[0] <> #26) then exit;
               case zag[1] of
               #0:  FormSpec := 70908;
               #1:  FormSpec := 71680;
               #255:Move(Module.Index[6],FormSpec,4)
               else exit
               end;
               FType := EPSGFile;
              end;
if FType=EPSGFile then
  begin
   tmp:=16;
   EPSGRec.All := 0;
   while tmp < F_Length do
    begin
     Move(Module.Index[tmp],EPSGRec,5);
     inc(tmp, 5);
     if EPSGRec.All = $FFFFFFFFFF then Inc(TimeLength)
    end;
   if EPSGRec.All  = $FFFFFFFFFF then
    j := 0
   else
    j := EPSGRec.TSt;
   TimeLength := round((TimeLength / (FrqZ80 / FormSpec) + j / FrqZ80) * 1000)
  end else
  begin
   tmp:=16;
   while tmp < F_Length do
    begin
     b:=Module.Index[tmp];
     inc(tmp);
     if b = 255 then Inc(TimeLength)
     else if b = 254 then
      begin
        b1:=Module.Index[tmp];
        inc(tmp);
       Inc(TimeLength,b1 * 4)
      end 
     else inc(tmp);
    end;
   if not (b in [254,255]) then Inc(TimeLength)
  end;

end;
FXMFile: GetTimeFXM(@Module,Address,TimeLength,NumOfNtIn1Pos);
PSMFile: GetTimePSM(@Module, TimeLength,NumOfNtIn1Pos);
STCFile: GetTimeSTC(@Module,TimeLength,NumOfNtIn1Pos);
ASCFile: GetTimeASC(@Module,TimeLength,LoopPoint,NumOfNtIn1Pos);
STPFile: GetTimeSTP(@Module,TimeLength,LoopPoint,NumOfNtIn1Pos);
PSCFile: GetTimePSC(@Module,TimeLength,LoopPoint,NumOfNtIn1Pos);
FLSFile: GetTimeFLS(@Module,TimeLength,NumOfNtIn1Pos);
FTCFile: GetTimeFTC(@Module,TimeLength,LoopPoint,NumOfNtIn1Pos);
PT1File: GetTimePT1(@Module,TimeLength,LoopPoint,NumOfNtIn1Pos);
PT2File: GetTimePT2(@Module,TimeLength,LoopPoint,NumOfNtIn1Pos);
PT3File: GetTimePT3(@Module,TimeLength,LoopPoint,NumOfNtIn1Pos);
SQTFile: GetTimeSQT(@Module,TimeLength,LoopPoint,NumOfNtIn1Pos);
GTRFile: GetTimeGTR(@Module,TimeLength,LoopPoint,NumOfNtIn1Pos);
end;
except

end;

Song_Name := ''; Song_Author := '';
  case FType of
  YM3File:  begin
         F_Offset := 0; F_Address := 0;
         UniReadInit(URHandle,URFile,File_Name,nil);
         F_Length := UniReadersData[URHandle].UniFileSize;
     if F_Length > 65536 then F_Length := 65536;
    //  F_Frame := @F_Buffer;
             UniFileSeek(URHandle,0);
             UniRead(URHandle,@LZHFileHeader,15);
             if LZHFileHeader.Method = '-lh5-' then
              begin
               orisize := LZHFileHeader.UCompSize;
               Original_Size := orisize;
               F_Length := LZHFileHeader.CompSize;
               Compressed_Size := F_Length;
               F_Offset := LZHFileHeader.HSize + 2;
               UniFileSeek(URHandle,F_Offset);
               UniAddDepacker(URHandle,UDLZH)
              end
             else
              begin
               orisize := UniReadersData[URHandle].UniFileSize;
               F_Offset := 0;
               UniFileSeek(URHandle,0)
              end;
             UniRead(URHandle,@YM5FileHeader,4);
             case YM5FileHeader.Id of
             $62334d59:
               begin
                FType := YM3bFile;
                TimeLength := (orisize - 8) div 14;
               end;
             $21334d59,
             $21324d59:
               begin
                if YM5FileHeader.Id = $21324d59 then
                 FType := YM2File;
                TimeLength := (orisize - 4) div 14;
            //    Looping_VBL := 0;
               end;
             $21354d59,
             $21364d59:
               begin
                if YM5FileHeader.Id = $21354d59 then
                 FType := YM5File
                else
                 FType := YM6File;
                if orisize < sizeof(TYM5FileHeader) then exit;
                UniRead(URHandle,@YM5FileHeader.Leo,sizeof(TYM5FileHeader) - 4);
                TimeLength := FastSwap(YM5FileHeader.Num_of_tiks);
                l := orisize - TimeLength * 16;
                if l < sizeof(TYM5FileHeader) then exit;
              {  ChipFrq := IntelDWord(YM5FileHeader.ChipFrq);
                PlrFrq := IntelWord(YM5FileHeader.InterFrq) * 1000;
                Looping_VBL := IntelDWord(YM5FileHeader.Loop); }
                k := FastSwap16(YM5FileHeader.Add_Size) + sizeof(TYM5FileHeader);
                if k + 3 > l then exit;
                for i := 34 + 1 to k do
                 UniRead(URHandle,@DWrd,1);
                for i := 1 to FastSwap16(YM5FileHeader.Num_of_Dig) do
                 begin
                  if k + 4 > l then exit;
                  UniRead(URHandle,@DWrd,4);
                  DWrd := FastSwap(DWrd);
                  inc(k,4 + DWrd); if k > l then exit;
                  for j := 0 to DWrd - 1 do
                   UniRead(URHandle,@DWrd,1)
                 end;
                repeat
                 inc(k); if k > l then exit;
                 UniRead(URHandle,@Ch,1);
                 if Ch <> #0 then Song_Name := Song_Name + Ch
                until Ch = #0;
                repeat
                 inc(k); if k > l then exit;
                 UniRead(URHandle,@Ch,1);
                 if Ch <> #0 then Song_Author := Song_Author + Ch
                until Ch = #0;
                repeat
                 inc(k); if k > l then exit;
                 UniRead(URHandle,@Ch,1);
                // if Ch <> #0 then ComStr := ComStr + Ch
                until Ch = #0;
                FormSpec := k
               end
             else exit
             end;
             UniReadClose(URHandle);
            end;
  STCFile:  begin
             SetLength(KsaId2,20);
             Move(Module.ST_Name,KsaId2[1],20);
             Song_Name := Copy(KsaId2,1,18);
             if (Song_Name='SONG BY ST COMPILE') or
                (Song_Name='SONG BY MB COMPILE') or
                (Song_Name='SONG BY ST-COMPILE') or
                (Song_Name='SOUND TRACKER v1.1') or
                (Song_Name='S.T.FULL EDITION  ') or
                (Song_Name='SOUND TRACKER v1.3') then
              Song_Name := ''
             else
              begin
               Wrd := WordPtr(@KsaId2[19])^;
               if Wrd <> F_Length then
                if KsaId2[19] in [' '..#127] then
                 begin
                  Song_Name := Song_Name + KsaId2[19];
                  if KsaId2[20] in [' '..#127] then
                   Song_Name := Song_Name + KsaId2[20]
                 end
              end
            end;
  GTRFIle:  begin
             SetLength(Song_Name,32);
             Move(Module.GTR_Name,Song_Name[1],32)
            end;
  PSCFile:  begin
             SetLength(Song_Name,20);
             SetLength(Song_Author,20);
             Move(Module.PSC_MusicName[$19],Song_Name[1],20);
             Move(Module.PSC_MusicName[$31],Song_Author[1],20);
            end;
  FTCFile:  begin
             SetLength(Song_Name,42);
             Move(Module.FTC_MusicName[8],Song_Name[1],42)
            end;
  PT1File:  begin
             SetLength(Song_Name,30);
             Move(Module.PT1_MusicName,Song_Name[1],30)
            end;
  PT2File:  begin
             SetLength(Song_Name,30);
             Move(Module.PT2_MusicName,Song_Name[1],30)
            end;
  PT3File:  begin
             SetLength(Song_Name,32);
             SetLength(Song_Author,32);
             Move(Module.PT3_MusicName[$1E],Song_Name[1],32);
             Move(Module.PT3_MusicName[$42],Song_Author[1],32);
            end;
  ASCFile:  begin
             if Module.ASC1_PatternsPointers -
                          Module.ASC1_Number_Of_Positions = 72 then
              begin
               SetLength(Song_Name,20);
               SetLength(Song_Author,20);
               Move(Module.Index[Module.ASC1_PatternsPointers - 44],
                        Song_Name[1],20);
               Move(Module.Index[Module.ASC1_PatternsPointers - 20],
                        Song_Author[1],20);
              end
            end;
  STPFile:  begin
             SetLength(KsaId2,28);
             Move(Module.Index[10],KsaId2[1],28);
             if KsaId2 = KsaId then
              begin
               SetLength(Song_Name,25);
               Move(Module.Index[38],Song_Name[1],25)
              end
            end;
  VTXFile:  begin
            Move(Module.Index[0], VTXFileHeader, 2);
             if (VTXFileHeader.Id <> $5941)and
                (VTXFileHeader.Id <> $4d59)and
                (VTXFileHeader.Id <> $7961)and
                (VTXFileHeader.Id <> $6d79) then exit;
             if (VTXFileHeader.Id = $5941) or (VTXFileHeader.Id = $4d59) then
              begin
               Move(Module.Index[2], VTXFileHeader.Mode, 8);
              Move(Module.Index[10], VTXFileHeader.Mode, 8);
              tmp:=18;
              end
             else begin
             Move(Module.Index[2], VTXFileHeader.Mode, sizeof(VTXFileHeader) - 2);
             tmp:=sizeof(VTXFileHeader);
             end;
            { Looping_VBL := VTXFileHeader.Loop;
             PlrFrq := VTXFileHeader.InterFrq * 1000;
             ChipFrq := VTXFileHeader.ChipFrq;
             ChanMode := VTXFileHeader.Mode and 7;
             orisize := VTXFileHeader.UnpackSize; }
             TimeLength := VTXFileHeader.UnpackSize div 14;
          //   if VTXFileHeader.Mode = 0 then Ster := 1 else Ster := 2;
          {   if (VTXFileHeader.Id = $7961) or (VTXFileHeader.Id = $5941) then
              ChType := AY_Chip
             else
              ChType := YM_Chip;  }
             repeat
             Move(Module.Index[tmp], Ch, 1);
             inc(tmp);
              if Ch <> #0 then Song_Name := Song_Name + Ch
             until Ch = #0;
             repeat
              Move(Module.Index[tmp], Ch, 1);
              inc(tmp);
               if Ch <> #0 then Song_Author := Song_Author + Ch
             until Ch = #0;
         {  if (VTXFileHeader.Id = $7961) or (VTXFileHeader.Id = $6d79) then
              begin
               if VTXFileHeader.Year <> 0 then
                DateStr := IntToStr(VTXFileHeader.Year);
               repeat
                UniRead(URHandle,@Ch,1);
                if Ch <> #0 then PrgName := PrgName + Ch
               until Ch = #0;
               repeat
                UniRead(URHandle,@Ch,1);
                if Ch <> #0 then TrackName := TrackName + Ch
               until Ch = #0;
               repeat
                UniRead(URHandle,@Ch,1);
                if Ch <> #0 then ComStr := ComStr + Ch
               until Ch = #0
              end;
             F_Offset := UniReadersData[URHandle].UniFilePos;
             F_Length := UniReadersData[URHandle].UniFileSize - F_Offset  }
            end;

  end;

for i := 1 to Length(Song_Name) do
 if Song_Name[i] in [#0..#31] then Song_Name[i] := ' ';

for i := 1 to Length(Song_Author) do
 if Song_Author[i] in [#0..#31] then Song_Author[i] := ' ';

{NumOfPositions := 0; LoopPosition := 0; FTypeS := '';
case FType of
STCFile:
 begin
  NumOfPositions := Module.Index[Module.ST_PositionsPointer] + 1;
  FTypeS := 'STC';
 end;
ASCFile:
 begin
  LoopPosition := Module.ASC1_LoopingPosition;
  NumOfPositions := Module.ASC1_Number_Of_Positions;
  FTypeS := 'ASC';
 end;
STPFile:
 begin
  LoopPosition := Module.Index[Module.STP_PositionsPointer + 1];
  NumOfPositions := Module.Index[Module.STP_PositionsPointer];
  FTypeS := 'STP';
 end;
PSCFile:
 begin
  i := Module.PSC_PatternsPointer;
  while Module.Index[i + 1] <> 255 do inc(i,8);
  LoopPosition := (WordPtr(@Module.Index[i + 2])^ - Module.PSC_PatternsPointer) div 8;
  NumOfPositions := (i - Module.PSC_PatternsPointer) div 8;
  FTypeS := 'PSC';
 end;
FLSFile:
 begin
  i := Module.FLS_PositionsPointer + 1;
  while Module.Index[i] <> 0 do inc(i);
  NumOfPositions := i - Module.FLS_PositionsPointer - 1;
  FTypeS := 'FLS';
 end;
FTCFile:
 begin
  LoopPosition := Module.FTC_Loop_Position;
  i := 0; while Module.FTC_Positions[i].Pattern <> 255 do inc(i);
  NumOfPositions := i;
 end;
PT1File:
 begin
  LoopPosition := Module.PT1_LoopPosition;
  NumOfPositions := Module.PT1_NumberOfPositions;
  FTypeS := 'PT1';
 end;
PT2File:
 begin
  LoopPosition := Module.PT2_LoopPosition;
  NumOfPositions := Module.PT2_NumberOfPositions;
  FTypeS := 'PT2';
 end;
PT3File:
 begin
  LoopPosition := Module.PT3_LoopPosition;
  NumOfPositions := Module.PT3_NumberOfPositions;
  FTypeS := 'PT3';
 end;
SQTFile:
 begin
  i := Module.SQT_PositionsPointer;
  while (Module.Index[i] <> 0) and (Module.Index[i + 2] <> 0) and
        (Module.Index[i + 4] <> 0) do inc(i,7);
  LoopPosition := (Module.SQT_LoopPointer - Module.SQT_PositionsPointer) div 7;
  NumOfPositions := (i - Module.SQT_PositionsPointer) div 7;
  FTypeS := 'SQT';
 end;
GTRFile:
 begin
  LoopPosition := Module.GTR_LoopPosition;
  NumOfPositions := Module.GTR_NumberOfPositions;
  FTypeS := 'GTR';
 end;
end; }

 end;
end;


begin
//if not FileExists(File_Name) then exit;
//Inc(NOfFiles);
//SFileExt := LowerCase(ExtractFileExt(File_Name));
if SFileExt = '.psg' then Analize(PSGFile) else
if SFileExt = '.stc' then Analize(STCFile) else
if SFileExt = '.asc' then Analize(ASCFile) else
if SFileExt = '.stp' then Analize(STPFile) else
if SFileExt = '.psc' then Analize(PSCFile) else
if SFileExt = '.fls' then Analize(FLSFile) else
if SFileExt = '.ftc' then Analize(FTCFile) else
if SFileExt = '.pt1' then Analize(PT1File) else
if SFileExt = '.pt2' then Analize(PT2File) else
if SFileExt = '.pt3' then Analize(PT3File) else
if SFileExt = '.sqt' then Analize(SQTFile) else
if SFileExt = '.gtr' then Analize(GTRFile) else
if SFileExt = '.fxm' then Analize(FXMFile) else
if SFileExt = '.psm' then Analize(PSMFile) else
if SFileExt = '.vtx' then Analize(VTXFile) else
if SFileExt = '.ym' then Analize(YM3File) else
if SFileExt = '.zxay' then Analize(ZXAYFile);{ else
if SFileExt = '.ay' then OpenAYFile else
if SFileExt = '.aym' then OpenAYMFile else}
if Song_Author='' then STitle:=Song_Name else
        STitle:=Song_Author+#13+'AT'+#13+Song_Name;
result:=TimeLength div 50;          // don't ask why 50 :)
end;

procedure OutLstAYm(path,File_Name,SFileExt:string; size:cardinal; var modlst:PStrList);
var
 i,j,CurPos, URHandle, Offset, Address, FormatSpec,F,T:integer;
 FileType:Available_Types;        TimeL:dword;
 Ch:char;
 Byt:byte;
 Wrd:word;
 AuthorString,MiscString,SongName:string; Title:shortstring;
 AYFileHeader:TAYFileHeader;
 AYMFileHeader:TAYMFileHeader;
 SongStructure:TSongStructure;
begin
UniReadInit(URHandle, URFile, path+File_Name, nil);
 if SFileExt='.ay' then
  begin
UniRead(URHandle,@AYFileHeader,SizeOf(AYFileHeader));
if AYFileHeader.FileID <> $5941585A then exit;
if (AYFileHeader.TypeID <> $4C554D45) and
   (AYFileHeader.TypeID <> $44414D41) then exit;

UniFileSeek(URHandle,SmallInt(FastSwap16(AYFileHeader.PAuthor)) + 12);
AuthorString := '';
repeat
 UniRead(URHandle,@Ch,1);
 if Ch <> #0 then AuthorString := AuthorString + Ch;
until Ch = #0;
AuthorString := Trim(AuthorString);

UniFileSeek(URHandle,SmallInt(FastSwap16(AYFileHeader.PMisc)) + 14);
MiscString := '';
repeat
 UniRead(URHandle,@Ch,1);
 if Ch <> #0 then MiscString := MiscString + Ch;
until Ch = #0;
MiscString := Trim(MiscString);

UniFileSeek(URHandle,SmallInt(FastSwap16(AYFileHeader.PSongsStructure)) + 18);
for j := 0 to AYFileHeader.NumOfSongs do
 begin
  UniRead(URHandle,@SongStructure,4);

 { if F_NumOfTrack >= 0 then
   if j <> F_NumOfTrack then continue;  }

  CurPos := UniReadersData[URHandle].UniFilePos;
  UniFileSeek(URHandle,SmallInt(FastSwap16(SongStructure.PSongName)) + CurPos - 4);
  SongName := '';
  repeat
   UniRead(URHandle,@Ch,1);
   if Ch <> #0 then SongName := SongName + Ch;
  until Ch = #0;
  SongName := Trim(SongName);
     if AYFileHeader.TypeID = $4C554D45 then
      begin
       Offset := 0;
       Address := 0;
       FormatSpec := j;
       FileType := AYFile;
       UniFileSeek(URHandle,SmallInt(FastSwap16(SongStructure.PSongData)) + CurPos + 2);
       UniRead(URHandle,@Wrd,2);
       if Wrd <> 0 then
        TimeL := FastSwap16(Wrd)
       else
        TimeL := 15000
      end
     else
      begin
       Offset := SmallInt(FastSwap16(SongStructure.PSongData)) + CurPos - 2;
       UniFileSeek(URHandle,Offset);
       UniRead(URHandle,@Wrd,2);
       Address := FastSwap16(Wrd);
       UniRead(URHandle,@Byt,1);
       FormatSpec := Byt;
       UniRead(URHandle,@Byt,1);
       UniRead(URHandle,@Wrd,2);
       TimeL := Byt * FastSwap16(Wrd);
       inc(Offset,14 - 6);
       FileType := FXMFile
      end;
     if AuthorString='' then Title:=SongName else
        Title:=AuthorString+#13+'AT'+#13+SongName;
     if AYFileHeader.NumOfSongs=0 then
     modlst.Add(outmodrow(File_Name, Title, (TimeL/50), size)) else
     modlst.Add(outmodrow(File_Name+' /'+int2str(j), Title, (TimeL/50), size));
  UniFileSeek(URHandle,CurPos)
 end
end else  if SFileExt='.ay' then
begin
UniRead(URHandle,@AYMFileHeader,SizeOf(AYMFileHeader));
if AYMFileHeader.AYM <> 'AYM' then exit;
if AYMFileHeader.Rev <> '0' then exit;
F := 0; T := AYMFileHeader.MusMax - AYMFileHeader.MusMin;
for j := F to T do
 begin
    AuthorString:=Trim(AYMFileHeader.Author);
    SongName:=Trim(AYMFileHeader.Name);
        if AuthorString='' then Title:=SongName else
        Title:=AuthorString+#13+'AT'+#13+SongName;
   if T=0 then
     modlst.Add(outmodrow(File_Name, Title, 300, size)) else
     modlst.Add(outmodrow(File_Name+' /'+int2str(j), Title, 300, size));

 end
end;
UniReadClose(URHandle);
end;

end.
