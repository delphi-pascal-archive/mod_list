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
Parts of code in this unit taken from MIDI utils by Colin Wilson:
                      http://www.wilsonc.demon.co.uk/delphi.htm         }
unit midiinfo;

interface

uses Windows, Messages, KOL;

type

  TEventData = packed record    // ** nb takes 5 bytes
  case status : byte of
    0 : (b2, b3 : byte);
    1 : (sysex : PChar)
  end;
  PEventData = ^TEventData;

//---------------------------------------------------------------------------
// Midi event
  PMidiEventData = ^TMidiEventData;
  TMidiEventData = packed record // ** nb takes 11 bytes
    pos : LongInt;               // Position in ticks from start of song.
    sysexSize : word;            // Size of sysex or meta message
    data : TEventData;           // Event data
    OnOffEvent : PMidiEventData;
  end;
  TTrack = 0..255;
  TChannel = 0..15;
  TNote = 0..127;
  TController = 0..127;
  TPatchNo = 0..127;
  TBankNo = 0..127;
  TControllerValue = 0..127;

const
  midiNoteOff 	        = $80;
  midiNoteOn            = $90;
  midiKeyAftertouch 	= $a0;
  midiController 	= $b0;
  midiProgramChange 	= $c0;
  midiChannelAftertouch = $d0;
  midiPitchBend 	= $e0;
  midiSysex       	= $f0;
  midiSysexCont		= $f7;
  midiMeta		= $ff;

  midiStatusMask	= $f0;
  midiStatus		= $80;
  midiChannelMask	= $0f;

  metaSeqno		= $00;
  metaText		= $01;
  metaCopyright		= $02;
  metaTrackName		= $03;
  metaInstrumentName	= $04;
  metaLyric		= $05;
  metaMarker		= $06;
  metaCuePoint		= $07;
  metaMiscText0		= $08;
  metaMiscText1		= $09;
  metaMiscText2		= $0a;
  metaMiscText3		= $0b;
  metaMiscText4		= $0c;
  metaMiscText5		= $0d;
  metaMiscText6		= $0e;
  metaMiscText7		= $0f;
  metaTrackStart	= $21;
  metaTrackEnd		= $2f;
  metaTempoChange	= $51;
  metaSMPTE		= $54;
  metaTimeSig		= $58;
  metaKeySig		= $59;
  metaSequencer		= $7f;
  chanType : array [0..15] of integer = (0, 0, 0, 0, 0, 0, 0, 0,
                                         2, 2, 2, 2, 1, 1, 2, 0);


function FastSwap(Value: LongWord): LongWord; register; overload;
function FastSwap16(Value: Word): Word; register; overload;
procedure filltitle(buffer: pointer; title:pointer; size:byte);
function GetMIDIinfo(midifile:string; var title:shortstring):dword;


implementation

function FastSwap(Value: LongWord): LongWord; register; overload;
asm
  bswap eax
end;

function FastSwap16(Value: Word): Word; register; overload;
asm
  xchg ah,al
end;

function GetMIDIinfo(midifile:string; var title:shortstring):dword;
var trk,Tracks,Ticks:word;
  trackSize:cardinal;
  SMFType:byte;
  tmpin:dword;
  divi : Integer;
  fst, buffer:PStream;
  fPatch: TPatchNo;
  fChannel: TChannel;
 // fTrackName : PMidiEventData;
  gotEndOfTrack, riffh : boolean;
  curticks,tticks,tmpd, curtempo, curtime, ttime, r:dword;

function DoPass (pass2 : boolean) : Integer;
  var
    sysexFlag : boolean;
    l, pos : Integer;
    c, c1, status, runningStatus, mess : byte;
    events : PMidiEventData;
    notGotPatch, notGotChannel, newStatus : boolean;
    eventCount, tmptick: Integer;

  //-----------------------------------------------------------------------
  //  function GetFVariNum : Integer;
  //
  //  Get a variable length integer from the SMF data.  The first byte is
  // the most significant.  Use onlu the lower 7 bits of each bytes - the
  // eigth is set if there are more bytes.

    function GetFVariNum : Integer;
    var
      l : Integer;
      b : byte;
    begin
      l := 0;
      repeat
        b := PByte (Integer (buffer.Memory) + pos)^;
        Inc (pos);
        l := (l shl 7) + (b and $7f);  // Add it to what we've already got
      until (b and $80) = 0;           // Finish when the 8th bit is clear.
      result := l
    end;

  //-----------------------------------------------------------------------
  //  function GetFChar : Integer;
  //
  // Get a byte from the SMF stream

    function GetFChar : byte;
    begin
      result := PByte (Integer (buffer.Memory) + pos)^;
      Inc (pos);
    end;

  begin
    events := buffer.Memory;
    eventCount := 0;
    runningStatus := 0;              // Clear 'running status'
    divi := 0;                       // Current position (in ticks) is zero
    newStatus := False;
    pos := 0;                        // Start at the beginning of the buffer
    sysexFlag := False;              // Clear flag - we're not in the middle of
                                     // a sysex message

    notGotChannel := True;
    notGotPatch := True;
    tmptick:=0;
    curtime:=0;
    while pos < trackSize do
    begin
      tmptick:=GetFVariNum;
      Inc (divi, tmptick);       // Get event position
      c := GetFChar;                 // Get first byte of event status if it's >= $80

                                     // If we're in the middle of a sysex msg, this
                                     // must be a sysex continuation event
     { if sysexFlag and (c <> midiSysexCont) then
        raise EMidiTrackStream.Create ('Error in Sysex'); }

      if (c and midiStatus) <> 0 then
      begin                          // It's a 'status' byte
        status := c;
        newStatus := True;           // Get the first data byte

      end
      else
      begin
        status := runningStatus;

       { if status = 0 then
                                     // byte indicates 'running status' but we don't
                                     // know the status
          raise EMidiTrackStream.Create ('Error in Running Status')   }
      end;

   {   if pass2 then
      begin
        events^.pos := divi;
        events^.data.status := status
      end;  }
      if c in [140,141,144,145,176]=false then  //those events bad for play time
        inc (curtime, trunc((tmptick/Ticks)*curtempo) );
        if status < midiSysex then           // Is it a 'channel' message
      begin
        if NewStatus then
        begin
          c := GetFChar;
          NewStatus := False;
          runningStatus := status;
        end;

        mess := (status shr 4);      // the top four bits of the status
                                     // Get the second data byte if there is one.
        if chanType [mess] > 1 then c1 := GetFChar else c1 := 0;

        if not pass2 then
        begin
          if notGotPatch and (mess = $c) then
          begin                         // It's  the first 'patch change' message
            notGotPatch := False;
            fPatch := c
          end;

          if notGotChannel then
          begin                         // It's the first 'channel' message
            notGotChannel := False;
            fChannel := status and midiChannelMask;
           end
        end
        else
          with events^ do
          begin
            data.b2 := c;              // Save the data bytes
            data.b3 := c1
          end
      end
      else
      begin                          // It's a meta event or sysex.
        newStatus := False;
        case status of
          midiMeta :                      // Meta event
            begin
              c1 := GetFChar;        // Get meta type  *********** tempohandle
              l := GetFVariNum;      // Get data len
              if (trk=1) and (c1=metaTrackName) then if title='' then begin
              try
              filltitle(pointer (Integer (buffer.Memory) + pos-1), @title, l);
             except end;
               end;
                                     // Allocate space for message (including meta type)
              if pass2 then
              begin
         {       events^.sysexSize := l + 1;
                GetMem (events^.data.sysex, events^.sysexSize);

                events^.data.sysex [0] := char (c1);
                Move (pointer (Integer (buffer.Memory) + pos)^, events^.data.sysex [1], l);
                case c1 of             // Save 'track name' event
                  metaTrackName :
                    fTrackName := events;
                  metaText : if fTrackName = Nil then fTrackName := events;

                end }
              end
              else
                if (c1 = metaTempoChange) and (l=3)  then begin
                 curtempo:=(256*GetFChar+GetFChar)*256+GetFChar;
                 dec(pos, l);
                end;
                if c1 = metaTrackEnd then
                  if not gotEndOfTrack then
                    gotEndOfTrack := True;
              Inc (pos, l);
            end;
          midiSysex, midiSysexCont:  // Sysex event
            begin
              l := GetFVariNum;     // Get length of sysex data
          {    if pass2 then
              begin
                                    // Allocate a buffer, and copy it in.
                events^.sysexSize := l;
                GetMem (events^.data.sysex, l);
                Move (pointer (Integer (buffer.Memory) + pos)^, events^.data.sysex [0], l);
              end;   }
              Inc (pos, l);
                                    // Set flag if the message doesn't end with f7
              sysexFlag := PChar (Integer (buffer.Memory) + pos - 1)^ <> char (midiSysexCont);
             end
            else
        end
      end;
      Inc (eventCount);
      Inc (events);
    end;
    result := eventCount;
    curticks:=divi;
  end;

begin
Ticks:=0;
ttime:=0;
Tracks:=0;
//curtime:=0;
curtempo:=125000;
title:='';
 if (fileexists(midifile)) then begin
   fst:=NewReadFileStream(midifile);
   try
   fst.Read(tmpin, 4);     //'MThd' or riff
   if tmpin=$46464952 then riffh:=true;
   if riffh then repeat
    fst.Read(tmpin,4);
    inc(ttime);                       //using ttime as temp var
   until (tmpin=$6468544D) or (ttime=256);   //'MThd' or too big riff header
   ttime:=0;
   fst.Read(tmpin, 4);
   fst.Seek(1, spCurrent);
   fst.Read(SMFType, 1);
   fst.Seek(1, spCurrent);
   fst.Read(Tracks, 1);
   fst.Read(Ticks, 2);
   Ticks:=FastSwap16(Ticks);
   tticks:=0;
   curticks:=0;
   finally
   for trk := 1 to Tracks do            //to Tracks
  begin
    if fst.ReadStrLen(4)<>'MTrk' then  break;
    fst.Read(trackSize, 4);
    trackSize:=fastswap(trackSize);
    buffer:=NewMemoryStream;
    Stream2Stream(buffer, fst, trackSize);
    DoPass(false);
    if curticks>tticks then tticks:=curticks;
    if curtime>ttime then ttime:=curtime;
    buffer.Free;
  end;
   end;

if riffh then begin
try
 fst.Seek(1, spCurrent);
 fst.Read(tmpin, 4);
 if tmpin=$50534944 then begin       //'DISP'
  fst.Read(tmpin, 4);
  fst.Seek(tmpin+1, spCurrent);
 end;
  fst.Read(tmpin,4);
  if tmpin=$5453494C then fst.Seek(8,spCurrent); //if 'LIST'
  fst.Read(tmpin,4);
  fst.Read(tmpd, 4);
  while (tmpin<>$4D414E49) and (fst.Position<fst.Size) do   //'INAM'
   begin
    fst.Seek(tmpd,spCurrent);
    fst.Read(tmpin,4);
    fst.Read(tmpd, 4);
   end;
  if (tmpd<256) and (tmpin=$4D414E49) then begin
  fillchar(title, tmpd, 0);
  title:=fst.ReadStrZ;
 //filltitle(pointer(integer(fst.Memory)+fst.Position), @title, tmpd);   }
  end;
 except end;
end;

fst.Free;
ttime:=ttime div 1000;
{if ticks>0 then
 qtrns:=tticks div ticks; }
end;
result:=ttime;
 end;

procedure filltitle(buffer: pointer; title:pointer; size:byte);
begin
 fillchar(title^, size+2, 0);
 move(buffer^, title^, size+1);
end;

end.
