{ KOL MCK } // Do not remove this line!
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
{$DEFINE KOL_MCK}

//********************************************************************
//  Created by KOL project Expert Version 3.00 on: 05.02.3905 20:03:27
//********************************************************************

program MODlist;

uses
KOL,
  Unit1 in 'Unit1.pas' {Form1},
  audtags in 'audtags.pas',
  midiinfo in 'midiinfo.pas',
  v2minfo in 'v2minfo.pas',
  ATLinfo in 'ATLinfo.pas',
  AYtime in 'AYtime.pas',
  ScrollBars in 'ScrollBars.pas';

{$R *.res}
{$R music.RES}
{$R about.RES}
{$R making.RES}

begin // PROGRAM START HERE -- Please do not remove this comment

{$IFDEF KOL_MCK} {$I MODlist_0.inc} {$ELSE}

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

{$ENDIF}

end.
