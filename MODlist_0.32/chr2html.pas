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
     Homepage: http://keygenmusic.nm.ru                    }
unit chr2html;

interface

uses  KOL;

function ConvertToHTML(s: string): string;


implementation


function ConvertToHTML(s: string): string;
var
  i: Integer;
begin
  Result := '';
  if length(s)>0 then
  for i:=1 to length(s) do
   if byte(s[i]) in [33..39, 60..64, 128..167] then   //168+ is alt letters,
    result:=result+'&#'+int2str(byte(s[i]))+';' else  // russian also there, so
    result:=result+s[i];                              // let it be as is
 { for i := 33 to 39 do
    StrReplace(Result, chr(i), '&#'+int2str(i)+';');
  for i := 60 to 64 do
   repeat
    bl:=StrReplace(Result, chr(i), '&#'+int2str(i)+';');
   until bl=false;
  for i := 128 to 255 do
   repeat
    bl:=StrReplace(Result, chr(i), '&#'+int2str(i)+';');
   until bl=false;  }
end;
end.
