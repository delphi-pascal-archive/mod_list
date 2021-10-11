unit ScrollBars;

interface

uses Windows, Messages, KOL;

procedure UpdateScrollBar(hwndw:hwnd; hwndsb:hwnd);
procedure PosScrollBar(sb:Pcontrol; Rect:Trect);
procedure SBSetScroll(hwndw:hwnd; Cmd, NewPos:integer);

implementation

procedure UpdateScrollBar(hwndw:hwnd; hwndsb:hwnd);
var sinfo:tagSCROLLINFO;
begin
sinfo.fMask:=SIF_ALL;
GetScrollInfo(hwndw, SB_VERT, sinfo);
{logfileoutput(getstartdir+'\scroll.txt', int2str(sinfo.nMin)+' '+
int2str(sinfo.nMax)+' '+int2str(sinfo.nPage)+' '+int2str(sinfo.nPos)+' '+
int2str(sinfo.nTrackPos)+#13#10);
}             
SetScrollInfo(hwndsb, SB_CTL, sinfo, true);
end;

procedure PosScrollBar(sb:Pcontrol; Rect:Trect);
var ssm:integer;
begin
ssm:=GetSystemMetrics(SM_CXVSCROLL);
rect.Left:=rect.Right-ssm;
sb.BoundsRect:=rect;
end;

procedure SBSetScroll(hwndw:hwnd; Cmd, NewPos:integer);
var sinfo:tagSCROLLINFO;
begin
 sinfo.fMask:=SIF_ALL;
 GetScrollInfo(hwndw, SB_VERT, sinfo);
 sinfo.nPos:=NewPos;
 SetScrollInfo(hwndw, SB_VERT, sinfo, true);
 SetScrollPos(hwndw, SB_VERT, NewPos, true);
 SendMessage(hwndw, WM_VSCROLL, MakeWParam(Cmd, NewPos),0);
end;

end.
