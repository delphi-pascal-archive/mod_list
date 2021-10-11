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
     Homepage: http://www.keygenmusic.net/                    }
unit v2minfo;

interface

uses Windows, Messages, KOL;

function GetV2Minfo(v2mfile:string):dword;

implementation

function GetV2Minfo(v2mfile:string):dword;
var
  tdl, tdh, tdh2, tsign, tsigd, tpq:byte;
  fst:PStream;
  fract, maxt, gevsno, usecs, ttime:dword;
begin
 if (fileexists(v2mfile)) then begin
   fst:=NewReadFileStream(v2mfile);
   fst.Read(fract,4);
   fst.Read(maxt, 4);
   fst.Read(gevsno,4);
   fst.Read(tdl, 1);
   fst.Read(tdh, 1);
   fst.Read(tdh2, 1);
   fst.Read(usecs, 4);
   fst.Read(tsign, 1);
   fst.Read(tsigd, 1);
   fst.Read(tpq, 1);
   ttime:=(((maxt shl 3) div fract +1) div tpq)*usecs  div 1000 +2000;
 end;
fst.Free;
result:=ttime;
end;

end.
 