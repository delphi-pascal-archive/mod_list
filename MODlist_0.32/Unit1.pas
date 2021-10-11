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
{ KOL MCK } // Do not remove this line!
{$DEFINE KOL_MCK}
{$IFDEF SMALLEST_CODE}
{$ENDIF}

Unit Unit1;

interface

{$IFDEF KOL_MCK}
uses Windows, Messages, KOL, KOLGRushControls, KOLGif, AudioWAVPack, AudioMonkey, AudioAAC, AudioTTA, AudioWMA, AudioOptimFrog, AudioFLAC, AudioTwinVQ, AudioMPEGplus, AudioMP4, AudioAC3, TagID3v1, TagID3v2, TagAPE, TagWMA, TagTwinVQ, TagMp4 {$IFNDEF KOL_MCK},mirror ,Classes, Controls, MCKATL, mckCtrls, mckObjs, MCKGif, MCKGRushControls, mckObjs {$ENDIF},Dynamic_Bass, ShellAPI;        //place your units here
{$ELSE}
{$I uses.inc}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;
{$ENDIF}

type
  {$IFDEF KOL_MCK}
  {$I MCKfakeClasses.inc}
  {$IFDEF KOLCLASSES} {$I TForm1class.inc} {$ELSE OBJECTS} PForm1 = ^TForm1; {$ENDIF CLASSES/OBJECTS}
  {$IFDEF KOLCLASSES}{$I TForm1.inc}{$ELSE} TForm1 = object(TObj) {$ENDIF}
    Form: PControl;
  {$ELSE not_KOL_MCK}
  TForm1 = class(TForm)
  {$ENDIF KOL_MCK}
    KOLProj: TKOLProject;
    EditBox1: TKOLEditBox;
    Label1: TKOLLabel;
    Label2: TKOLLabel;
    fhdrMemo1: TKOLMemo;
    fftrMemo1: TKOLMemo;
    Label3: TKOLLabel;
    Label4: TKOLLabel;
    RowStartEdit1: TKOLEditBox;
    BWRowsEdit1: TKOLEditBox;
    RowEndEdit1: TKOLEditBox;
    Label5: TKOLLabel;
    Label6: TKOLLabel;
    Label7: TKOLLabel;
    ColStartEdit1: TKOLEditBox;
    BWcolsedit1: TKOLEditBox;
    ColEndEdit1: TKOLEditBox;
    Label8: TKOLLabel;
    Label9: TKOLLabel;
    Label10: TKOLLabel;
    OpenDirDialog1: TKOLOpenDirDialog;
    OpenSaveDialog1: TKOLOpenSaveDialog;
    OpenSaveDialog2: TKOLOpenSaveDialog;
    KOLForm1: TKOLForm;
    GifShow1: TKOLGifShow;
    GRushPanel1: TKOLGRushPanel;
    GRushPanel2: TKOLGRushPanel;
    Label11: TKOLLabel;
    Label12: TKOLLabel;
    Label13: TKOLLabel;
    Label14: TKOLLabel;
    CheckBox1: TKOLGRushCheckBox;
    CheckBox2: TKOLGRushCheckBox;
    CheckBox3: TKOLGRushCheckBox;
    Button1: TKOLGRushButton;
    Button2: TKOLGRushButton;
    Button3: TKOLGRushButton;
    Button4: TKOLGRushButton;
    Button5: TKOLGRushButton;
    Label15: TKOLLabel;
    MusButton1: TKOLGRushButton;
    Label16: TKOLLabel;
    EditBox2: TKOLEditBox;
    Label17: TKOLLabel;
    GRushButton1: TKOLGRushButton;
    Label18: TKOLLabel;
    Label19: TKOLLabel;
    GRushButton2: TKOLGRushButton;
    GRushButton3: TKOLGRushButton;
    GRushButton4: TKOLGRushButton;
    GRushCheckBox1: TKOLGRushCheckBox;
    Label20: TKOLLabel;
    EditBox4: TKOLEditBox;
    Label21: TKOLLabel;
    typMemo1: TKOLMemo;
    ScrollBar1: TKOLScrollBar;
    ScrollBar2: TKOLScrollBar;
    GRushCheckBox2: TKOLGRushCheckBox;
    WAVPackAudioInfo1: TWAVPackAudioInfo;
    MonkeyAudioInfo1: TMonkeyAudioInfo;
    AACAudioInfo1: TAACAudioInfo;
    TTAAudioInfo1: TTTAAudioInfo;
    WMAAudioInfo1: TWMAAudioInfo;
    OptimFrogAudioInfo1: TOptimFrogAudioInfo;
    FLACAudioInfo1: TFLACAudioInfo;
    TwinVQAudioInfo1: TTwinVQAudioInfo;
    MPEGplusAudioInfo1: TMPEGplusAudioInfo;
    MP4AudioInfo1: TMP4AudioInfo;
    AC3AudioInfo1: TAC3AudioInfo;
    ID3v1Tag1: TID3v1Tag;
    ID3v2Tag1: TID3v2Tag;
    APETag1: TAPETag;
    WMATag1: TWMATag;
    TwinVQTag1: TTwinVQTag;
    Mp4Tag1: TMp4Tag;
    GRushCheckBox3: TKOLGRushCheckBox;
    EditBox3: TKOLEditBox;
    Label22: TKOLLabel;
    EditBox5: TKOLEditBox;
    Label23: TKOLLabel;
    {Label19: TKOLLabel;
    GRushButton2: TKOLGRushButton;
    GRushButton3: TKOLGRushButton;
    GRushButton4: TKOLGRushButton;
    GRushCheckBox1: TKOLGRushCheckBox;   }
    procedure KOLForm1FormCreate(Sender: PObj);
    procedure Label2Click(Sender: PObj);
    procedure Button1Click(Sender: PObj);
    procedure Button2Click(Sender: PObj);
    procedure Button3Click(Sender: PObj);
    procedure Button4Click(Sender: PObj);
    procedure Button5Click(Sender: PObj);
    procedure CheckBox2Click(Sender: PObj);
    procedure KOLForm1MouseDown(Sender: PControl;
      var Mouse: TMouseEventData);
    procedure GRushPanel1MouseDown(Sender: PControl;
      var Mouse: TMouseEventData);
    procedure Label12Show(Sender: PObj);
    procedure GifShow1Click(Sender: PObj);
    procedure Label14MouseMove(Sender: PControl;
      var Mouse: TMouseEventData);
    procedure Label14MouseLeave(Sender: PObj);
    procedure Label13MouseMove(Sender: PControl;
      var Mouse: TMouseEventData);
    procedure Label13MouseLeave(Sender: PObj);
    procedure KOLForm1Show(Sender: PObj);
    procedure KOLForm1Close(Sender: PObj; var Accept: Boolean);
    procedure MusButton1Click(Sender: PObj);
    procedure GRushButton1Click(Sender: PObj);
    procedure GRushButton2Click(Sender: PObj);
    procedure GRushButton4Click(Sender: PObj);
    procedure GRushButton3Click(Sender: PObj);
    procedure EditBox4Change(Sender: PObj);
    function fhdrMemo1Message(var Msg: tagMSG; var Rslt: Integer): Boolean;
    procedure ScrollBar1Show(Sender: PObj);
    function fftrMemo1Message(var Msg: tagMSG; var Rslt: Integer): Boolean;
    procedure ScrollBar1SBBeforeScroll(Sender: PControl; OldPos,
      NewPos: Integer; Cmd: Word; var AllowChange: Boolean);
    procedure ScrollBar2Show(Sender: PObj);
    procedure ScrollBar2SBBeforeScroll(Sender: PControl; OldPos,
      NewPos: Integer; Cmd: Word; var AllowChange: Boolean);
    function KOLForm1Message(var Msg: tagMSG; var Rslt: Integer): Boolean;
    procedure Label13MouseDown(Sender: PControl;
      var Mouse: TMouseEventData);
    procedure Label13MouseUp(Sender: PControl; var Mouse: TMouseEventData);
    procedure Label14MouseUp(Sender: PControl; var Mouse: TMouseEventData);
    procedure Label14MouseDown(Sender: PControl;
      var Mouse: TMouseEventData);
    procedure EditBox4Char(Sender: PControl; var Key: KOLChar;
      Shift: Cardinal);
    procedure KOLForm1DropFiles(Sender: PControl;
      const FileList: KOL_String; const Pt: TPoint);
  private
    { Private declarations }
  public
    { Public declarations }


  end;

type
TDlgParam=record
f1: DWord;
f2: DWord;
end;
PDlgParam = ^TDlgParam;

var
  Form1 {$IFDEF KOL_MCK} : PForm1 {$ELSE} : TForm1 {$ENDIF} ;
  musicstm:PStream;
  music:HMUSIC;
  extlst:PStrList;
  mkdlg:integer;
  thd:THandle;
  makelist:boolean;
    dlgh: HWND;
  //  atlinit:byte=0;
  htmllist:boolean;

const mlhdr='MODlist header]';
      mlftr='MODlist footer]';
      mlrs='MODlist RS]';
      mlbr='MODlist BR]';
      mlre='MODlist RE]';
      mlcs='MODlist CS]';
      mlbc='MODlist BC]';
      mlce='MODlist CE]';
      bkt='[';
      bkte='[/';
      deftypes='.xm;.mod;.s3m;.it;.mo3;.mtm;.umx;.669;.mid;.v2m;.oxm;.rmi;';
      addtypes='.669;.mid;.v2m;.rmi;';
      strmtypes='.mp3;.mp2;.mp1;.ogg;.wav;.aiff;';
      atltypes='.wma;.mpc;.aac;.vqf;.ape;.flac;.wvc;.wv;.tta;.ofr;.m4a;.ac3';
aytypes='.stc;.asc;.stp;.psc;.fls;.ftc;.pt1;.pt2;.pt3;.sqt;.gtr;.fxm;.psm;.vtx;.psg;.ym;.out;.zxay;.ay;.aym;';
      conffile='MODlist.ini';

{$IFDEF KOL_MCK}
procedure NewForm1( var Result: PForm1; AParent: PControl );
{$ENDIF}
procedure getmodlist( path:string; fllst:PStrList);
procedure loadmodtemplate(Filepath: string);
function savemodtemplate:string;
function getmtlvalue(srcstr:string; param:shortstring):string;
function outmodrow(Name:string; title:shortstring; len:real; size:Cardinal)
                           :string;

function outmodcell(celltext:string;fname:string;cell:char):string;
function insertdatetime(fmtstr: string):string;
function extallowed(ext:shortstring; masklist:PStrList):boolean;
procedure getdirtree(path,subp:string; subd,dirfirst:boolean; list:PStrList);
procedure listmakethread;
//procedure working;
function DlgProc(dhWnd, Msg, wParam, lParam:Integer): Integer{BOOL}; stdcall;
procedure DrawButton(pdis: PDRAWITEMSTRUCT);

implementation

uses chr2html, audtags, midiinfo, v2minfo, ATLinfo, AYtime, ScrollBars;

{$IFNDEF KOL_MCK} {$R *.DFM} {$ENDIF}

{$IFDEF KOL_MCK}
{$I Unit1_1.inc}
{$ENDIF}

procedure TForm1.KOLForm1FormCreate(Sender: PObj);
var bassload: boolean;
    config:PiniFile;
begin
 form.Caption:='MODlist';
 config:=OpenIniFile(GetStartDir+'\'+conffile);
 config.Mode:=ifmRead;
 config.Section:='Options';
 EditBox1.Text:=config.ValueString('Folder', EditBox1.Text);
 EditBox2.Text:=config.ValueString('Columns', EditBox2.Text);
 typMemo1.Text:=config.ValueString('FileTypes', typMemo1.Text);
 if typMemo1.Text='' then typMemo1.Text:=deftypes+aytypes;
 EditBox4.Text:=config.ValueString('FileSizes', EditBox4.Text);
 CheckBox2.Checked:=config.ValueBoolean('Subfolders', CheckBox2.Checked);
 CheckBox1.Checked:=config.ValueBoolean('Subfolders1st', CheckBox1.Checked);
 if CheckBox2.Checked=false then CheckBox1.Enabled:=false;
 CheckBox3.Checked:=config.ValueBoolean('HTMLConvert', CheckBox3.Checked);
 GrushCheckBox1.Checked:=config.ValueBoolean('iNonaudio', GrushCheckBox1.Checked);
 GrushCheckBox2.Checked:=config.ValueBoolean('SpaceChar', GrushCheckBox1.Checked);
 GrushCheckBox3.Checked:=config.ValueBoolean('HTMLLinks', GrushCheckBox3.Checked);
 EditBox3.Text:=config.ValueString('LinksColumns', EditBox3.Text);
 EditBox5.Text:=config.ValueString('LinksPrefix', EditBox5.Text);
 config.Free;
 if FileExists('bass.dll') then
 repeat             //just in case
  bassload:=Load_BASSDLL('bass.dll');
  sleep(10);
 until bassload=true
 else
  MessageBox(form.Handle, 'Bass.dll not found. Program will not work properly!',
   'Error', MB_OK);
 if EditBox1.Text='' then EditBox1.Text:=GetStartDir;
 OpenSaveDialog2.InitialDir:=GetStartDir+'templates\';
 BWcolsedit1.Text:=#09#09;   //tab symbol
 loadmodtemplate(GetStartDir+'current.mlt');
 if BASS_Init(-1, 44100, 0, form1.form.GetWindowHandle, nil)=true then begin
  musicstm:=NewMemoryStream;
  Resource2Stream( musicstm, hInstance, 'XM', RT_RCDATA);
  music:=BASS_MusicLoad(true, musicstm.Memory,0,musicstm.Size,
           0, 0);
  if music<>0 then BASS_ChannelPlay(music, true);
 end;

end;

procedure TForm1.Button1Click(Sender: PObj);
var dir: string;
begin
 if OpenDirDialog1.Execute=true then begin
  dir:=opendirdialog1.Path;
  EditBox1.Text:=dir;
  opendirdialog1.InitialPath:=dir;
 end;
end;


procedure TForm1.Button2Click(Sender: PObj);
var tid:cardinal;
  dlg: HWND;
  param: PDlgParam;
begin
 EditBox1.Text:=IncludeTrailingChar(EditBox1.Text,'\');
 typMemo1.Text:=IncludeTrailingChar(typMemo1.Text,';');
 OpenSaveDialog1.InitialDir:=EditBox1.Text;
 if StrSatisfy(fhdrMemo1.Text, '*<html*') then begin
   OpenSaveDialog1.FilterIndex:=2;
   htmllist:=true;
   end
  else begin htmllist:=false;
    if BWcolsEdit1.Text=';' then OpenSaveDialog1.FilterIndex:=3
  else   OpenSaveDialog1.FilterIndex:=0; end;
 if OpenSaveDialog1.Execute=true then
  begin
   StrSaveToFile(OpenSaveDialog1.Filename, insertdatetime(fhdrMemo1.Text));
   New(param);
   param.f1 := 1001;
   param.f2 := 2000;
   makelist:=true;
   thd:=CreateThread(nil, 0, @listmakethread, nil, 0, tid);
   dlg := DialogBoxParam( Hinstance, 'MAKEDLG', form.Handle,
    @DlgProc, LParam(param));
   try
   SetThreadPriority(thd, THREAD_PRIORITY_LOWEST);
   except end;
  end;
end;

procedure listmakethread;
var tmp:string; bl:boolean; list:PStrList;
begin
  try
 { form1.Form.Enabled:=false;
  form1.Button2.Font.FontHeight:=19;
  form1.Button2.Caption:='Preparing...';   }
  extlst:=NewStrList;
  tmp:=form1.typMemo1.Text;
  except end ;
  repeat
  try
  bl:=StrReplace(tmp,';',#13#10);
  except end;
  until bl=false;
  extlst.Text:=tmp;
  list:=NewStrList;
  getdirtree(form1.EditBox1.Text,'', form1.CheckBox2.Checked,
                  form1.CheckBox1.Checked, list);
  sleep(100);            //just in case
 { form1.Button2.Font.FontHeight:=20;
  form1.Button2.Caption:='Making...';     }
  getmodlist(form1.EditBox1.Text, list);
  list.Free;
  LogFileOutput(Form1.OpenSaveDialog1.Filename,
                  insertdatetime(Form1.fftrMemo1.Text));
  //form1.button2.Caption:='Make list';
  extlst.Free;
  EndDialog(mkdlg, 0);
 { form1.Form.Enabled:=true;    }
end;

{procedure working;                    //buggy
begin
 while true do begin
     sleep(500);                                     //funny, isn't it? increase
     if form1.button2.Caption='Working |' then       // value in "sleep" to
       form1.button2.Caption:='Working /'            // make it spin slower :)
     else if form1.button2.Caption='Working /' then
       form1.button2.Caption:='Working -'
     else if form1.button2.Caption='Working -' then
       form1.button2.Caption:='Working \'
     else if form1.button2.Caption='Working \' then
       form1.button2.Caption:='Working |';
   end;
end;   }

procedure TForm1.Button3Click(Sender: PObj);
begin
 OpenSaveDialog2.OpenDialog:=true;
 OpenSaveDialog2.Options:=[OSFileMustExist,OSOverwritePrompt,OSPathMustExist];
 OpenSaveDialog2.Title:='Choose template:';
 if OpenSaveDialog2.Execute=true then begin
  Button5.Click; //clear all memos & editboxes
  loadmodtemplate(OpenSaveDialog2.Filename);

 end;
end;



procedure TForm1.Button4Click(Sender: PObj);
var mtl:string;
begin
 OpenSaveDialog2.OpenDialog:=false;
 OpenSaveDialog2.Options:=[OSOverwritePrompt,OSPathMustExist];
 OpenSaveDialog2.Title:='Save template:';
 if OpenSaveDialog2.Execute=true then begin
  mtl:=savemodtemplate;
  StrSaveToFile(OpenSaveDialog2.Filename, mtl);
 end;
end;

procedure TForm1.Label2Click(Sender: PObj);
begin
  ShellExecute(Form.GetWindowHandle, 'open', PChar(label2.Caption), nil, nil,
                    SW_SHOWNORMAL);
end;

procedure getdirtree(path,subp:string; subd,dirfirst:boolean; list:PStrList);
var modsubds, fllst:PStrList;  filedata:TWIN32FindData;  hf:cardinal;
    p:integer;
begin
modsubds:=NewStrList;
fllst:=NewStrList;
if DirectoryExists(ExcludeTrailingPathDelimiter(path)) then begin
try
  hf:= FindFirstFile(PChar(path+'*.*'), filedata);
  if hf<>INVALID_HANDLE_VALUE then
   repeat
    form1.Form.ProcessMessages;
    if ((filedata.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY)=
      FILE_ATTRIBUTE_DIRECTORY) then
       modsubds.Add(IncludeTrailingPathDelimiter(filedata.cFileName)) else
       fllst.Add(subp+filedata.cFileName);
    until FindNextFile(hf, filedata)=false or makelist=false;
  finally
   FindClose(hf);
  end;
  try
  if modsubds.Count>1 then modsubds.Sort(false);
  if fllst.Count>1 then fllst.Sort(false);
  if modsubds.Find('\', p) then modsubds.Delete(p);
  if modsubds.Find('.\', p) then modsubds.Delete(p);
  if modsubds.Find('..\', p) then modsubds.Delete(p);
  except end;
  if dirfirst=false then begin
   try
   if fllst.Count>1 then fllst.Sort(false);
   list.Text:=list.Text+fllst.Text;
   fllst.Free;
   except end;
  end;
  try
  if (modsubds.Count>0) and (subd=true) then for p:=0 to modsubds.Count-1 do
     getdirtree(path+modsubds.Items[p], subp+modsubds.Items[p], subd,
                                                          dirfirst, list);
  except end;
  if dirfirst=true then begin
   try
   if fllst.Count>1 then fllst.Sort(false);
   list.Text:=list.Text+fllst.Text;
   fllst.Free;
   except end;
  end;
  modsubds.Free;
 end;
end;

procedure getmodlist( path:string; fllst:PStrList);
var p:integer;
    fname:string;  modlst:PStrList;
    ext,title:shortstring;
    bmus:HMUSIC; blen:real;
    tmp:array[0..1023] of char;
begin
 modlst:=NewStrList;
 if assigned(fllst) then
 if (fllst.Count>0) then
  for p:=0 to fllst.Count-1 do if makelist=true then
   begin                                   //ffffffffffffff
    try                                             //ttttttttt
    form1.Form.ProcessMessages;
    fname:=fllst.Items[p];
    ext:=lowercase(ExtractFileExt(path+fname));
    title:='';
    if extallowed(ext, extlst) then begin //eeeeeeeee
{--------code with bass.dll----------------------------------------------------}
    bmus:=0;
    blen:=0;
    if (form1.EditBox4.Text='0') or
       (filesize(path+fllst.Items[p])<str2int(form1.EditBox4.Text)*1048576)
   then begin             //sssssssss
   if StrSatisfy(deftypes,'*'+ext+';*') and
       (StrSatisfy(addtypes,'*'+ext+';*')=false) then begin
    bmus:=BASS_MusicLoad(false, PChar(path+fname),0,0,
           BASS_MUSIC_STOPBACK or BASS_MUSIC_CALCLEN or BASS_MUSIC_NOSAMPLE, 0);
      if bmus<>0 then
        begin
         //berr:=BASS_ErrorGetCode;
         title:=BASS_ChannelGetTags(bmus, BASS_TAG_MUSIC_NAME);
         blen:=BASS_ChannelBytes2Seconds(bmus,BASS_ChannelGetLength(bmus));
         BASS_MusicFree(bmus);
        end;
      end else if StrSatisfy(strmtypes,'*'+ext+';*') then begin
       bmus:=BASS_StreamCreateFile(false, PChar(path+fname),0,0,0);
      if bmus<>0 then begin
       blen:=BASS_ChannelBytes2Seconds(bmus,BASS_ChannelGetLength(bmus));
       title:=getaudtaginfo(bmus, true, path+fllst.Items[p], '');
       BASS_StreamFree(bmus);
      end;
      end else
    if ext='.669' then      //not bass.dll supported ext begin
     begin
     File2Mem(PChar(path+fname), @tmp, 255);
      if StrIsStartingFrom(tmp, #$69#$66) then
     {  for i:=2 to 74 do          //pobably after offset 74 is: "by someone"
        if byte(tmp[i])<20 then title:=title+' '
           else title:=title+tmp[i]; }
       filltitle(@tmp[2], @title, 72);
        title:=trim(title);
     end else
     if (ext='.mid') or (ext='.rmi') then
     begin
     try
      blen:=GetMIDIinfo(path+fname, title) div 1000;
      title:=trim(title);  
     except end;
     end else
     if ext='.v2m' then      
     begin
     try
      blen:=GetV2Minfo(path+fname) div 1000;
     except end;
     end else
     if StrSatisfy(atltypes,'*'+ext+';*') then begin
      try
      blen:=GetATLinfo(path+fname, ext, title);
      except end;
     end else
     if StrSatisfy(aytypes,'*'+ext+';*') then begin
      try
       if (ext='.ay') or (ext='.aym') then begin
        OutLstAYm(path, fname, ext,
                        filesize(path+fname), modlst);
        fname:='';
       end else
        blen:=AYAnalizeFile(path+fname, ext, title);
      except end;
     end else
      if (form1.GrushCheckBox1.Checked=false) then
       fname:='';
 //not bass.dll supported ext end
    if string(fname)<>'' then begin   //lllll
      modlst.Add(outmodrow(fname, title, blen,
                  filesize(path+fllst.Items[p])));
       end;                                    //lllll
             if (modlst.Count>100) and (fllst.Count-p>8) then begin
              modlst.AppendToFile(Form1.OpenSaveDialog1.Filename);
              modlst.Clear;
              modlst.Free;               //save your memory heap, or something
              modlst:=NewStrList;        // causing 0x0eedfade exception
             end;
      end; //sssssssss
     end;                                    //eeeeeeee
    except end;                             //ttttttttttttt
   end;                                     //fffffffffffffff
  if modlst.Count>0 then begin
  try
   title:=modlst.Items[modlst.Count-1];    //using title as temp. var
   setlength(title, length(title)-length(form1.BWRowsEdit1.Text));
   modlst.Items[modlst.Count-1]:=title;
   title:='';     //just in case
   modlst.AppendToFile(Form1.OpenSaveDialog1.Filename);
  except end;
  end;
  try
 // atlinit:=2;
 // GetATLinfo('', '', title, atlinit);
  modlst.Clear;   //just in case
  modlst.Free;
    except end;
end;

function outmodrow(Name:string; title:shortstring; len:real; size:Cardinal)
                            :string;
var time,htitl,artist:string; hr,min,sec,i:integer;
begin
  artist:=' ';
  sec:=trunc(len);
  hr:=sec div 3600;
  min:=sec mod 3600 div 60;
  sec:=sec mod 60;
  if strsatisfy(title, '*'+#13+'AT'+#13+'*') then begin
  artist:=copy(title,0,IndexOfStr(title, #13+'AT'+#13)-1);
  if form1.CheckBox3.Checked=true then artist:=ConvertToHTML(artist);
  title:=copy(title,IndexOfStr(title, #13+'AT'+#13)+4, MaxInt);
  end;
  htitl:=title;
  if form1.CheckBox3.Checked=true then htitl:=ConvertToHTML(title);
  if hr>3600 then time:=Format('%02d:%02d:%02d', [hr, min, sec]) else
    time:=Format('%02d:%02d', [min, sec]);
  result:=form1.RowStartEdit1.Text;
  for i:=1 to length(form1.EditBox2.Text) do begin
   if form1.EditBox2.Text[i]='F' then
    result:=result+outmodcell(Name,Name,'F')
   else if form1.EditBox2.Text[i]='N' then
    result:=result+outmodcell(htitl,Name,'N')
   else if form1.EditBox2.Text[i]='T' then
     if len>0 then result:=result+outmodcell(time,Name,'T')
       else result:=result+outmodcell(' ',Name,' ')
   else if form1.EditBox2.Text[i]='S' then
    result:=result+outmodcell(Num2Bytes(size)+'b',Name,'S')
   else if form1.EditBox2.Text[i]='A' then
    result:=result+outmodcell(artist,Name,'A');
   if (i<>(length(form1.EditBox2.Text))) then
    result:=result+form1.BWcolsEdit1.Text;
  end;
   result:=result+form1.RowEndEdit1.Text+form1.BWRowsEdit1.Text;
end;

function outmodcell(celltext:string;fname:string;cell:char):string;

 function addhtmllink(text:string):string;
  begin
   if form1.GRushCheckBox3.Checked and
                        (pos(cell,form1.EditBox3.Text)>0) then begin
    try
    repeat
    until StrReplace(fname,'\','/')=false;
    except end;
    result:='<a href="'+form1.EditBox5.Text+fname+'">'+text+'</a>';
   end else
   result:=text;
  end;

begin
 result:=form1.ColStartEdit1.Text;
 if form1.GRushCheckBox2.Checked then begin
  if (trim(celltext)='') then begin
   if htmllist then result:=result+'&nbsp'
    else result:=result+' ';
  end else
   result:=result+addhtmllink(celltext);
   end else result:=result+addhtmllink(celltext);
 result:=result+form1.ColEndEdit1.Text;
end;

function savemodtemplate:string;
begin
 result:=bkt+mlhdr+Form1.fhdrMemo1.Text+bkte+mlhdr+#13#10+
  bkt+mlrs+Form1.RowStartEdit1.Text+bkte+mlrs+
  bkt+mlbr+Form1.BWRowsEdit1.Text+bkte+mlbr+
  bkt+mlre+Form1.RowEndEdit1.Text+bkte+mlre+#13#10+
  bkt+mlcs+Form1.ColStartEdit1.Text+bkte+mlcs+bkt+mlbc+Form1.BWcolsEdit1.Text+
  bkte+mlbc+bkt+mlce+Form1.ColEndEdit1.Text+bkte+mlce+#13#10+
  bkt+mlftr+Form1.fftrMemo1.Text+bkte+mlftr;
end;

procedure loadmodtemplate(Filepath: string);
var mtl:string;
begin
 mtl:=StrLoadFromFile(Filepath);
 if mtl<>''then begin
  Form1.fhdrMemo1.Text:=getmtlvalue(mtl, mlhdr);
  Form1.RowStartEdit1.Text:=getmtlvalue(mtl, mlrs);
  Form1.BWRowsEdit1.Text:=getmtlvalue(mtl, mlbr);
  Form1.RowEndEdit1.Text:=getmtlvalue(mtl, mlre);
  Form1.ColStartEdit1.Text:=getmtlvalue(mtl, mlcs);
  Form1.BWcolsEdit1.Text:=getmtlvalue(mtl, mlbc);
  Form1.ColEndEdit1.Text:=getmtlvalue(mtl, mlce);
  Form1.fftrMemo1.Text:=getmtlvalue(mtl, mlftr);
     if StrSatisfy(form1.fhdrMemo1.Text, '*<html*') then Form1.CheckBox3.Checked:=true
       else  Form1.CheckBox3.Checked:=false;
 end;
end;

function getmtlvalue(srcstr:string; param:shortstring):string;
var  b,e:integer;
begin
 b:=pos(param, srcstr); e:=pos(bkte+param, srcstr);
   if (b<>0) and (e<>0) then
    Result:=copy(srcstr, b+length(param), e-(b+length(param)));
end;

function extallowed(ext:shortstring; masklist:PStrList):boolean;
var i:integer;
begin
 result:=false;
 if masklist.Count>0 then
  for i:=0 to masklist.Count-1 do begin
  try
   if StrSatisfy(ext, masklist.Items[i]) then
    begin
    result:=true;
    break;
    end;
  except end;
  end;
end;

function insertdatetime(fmtstr: string):string;
var b,e:integer; dtime, tmp:string;
begin
   result:=fmtstr;
  while StrSatisfy(result, '*%D*%/D*') do begin
   b:=pos('%D', result); e:=pos('%/D', result);
   tmp:=result;
   Delete(tmp, b, e-b+3);
   dtime:=copy(result, b+2, e-(b+2));
   dtime:=Date2StrFmt(dtime, Now);
   dtime:=Time2StrFmt(dtime, Now);
   insert(dtime, tmp, b);
   result:=tmp;
  end;
end;

procedure TForm1.Button5Click(Sender: PObj);
begin
 fhdrMemo1.Clear;
 fftrMemo1.Clear;
 RowStartEdit1.Clear;
 BWRowsEdit1.Clear;
 RowEndEdit1.Clear;
 ColStartEdit1.Clear;
 BWcolsedit1.Clear;
 ColEndEdit1.Clear;
end;

procedure TForm1.CheckBox2Click(Sender: PObj);
begin
if CheckBox2.Checked then CheckBox1.Enabled:=true else CheckBox1.Enabled:=false;
end;

procedure TForm1.KOLForm1MouseDown(Sender: PControl;
  var Mouse: TMouseEventData);
begin
 form.DragStart;
end;

procedure TForm1.GRushPanel1MouseDown(Sender: PControl;
  var Mouse: TMouseEventData);
begin
 form.DragStart;
end;

procedure TForm1.Label12Show(Sender: PObj);
begin
 label12.BringToFront;
 //label12.Font.FontHeight:=15;
end;

procedure TForm1.GifShow1Click(Sender: PObj);
begin
 label2.Click;
end;

procedure TForm1.Label14MouseMove(Sender: PControl;
  var Mouse: TMouseEventData);
begin
if label14.Font.Color<>clWhite then
 label14.Font.Color:=clLime;
end;

procedure TForm1.Label14MouseLeave(Sender: PObj);
begin
 label14.Font.Color:=$0000BC00;
end;

procedure TForm1.Label13MouseMove(Sender: PControl;
  var Mouse: TMouseEventData);
begin
if label13.Font.Color<>clWhite then
 label13.Font.Color:=clLime;
end;

procedure TForm1.Label13MouseLeave(Sender: PObj);
begin
 label13.Font.Color:=$0000BC00;
end;

{rocedure TForm1.fhdrMemo1Show(Sender: PObj);
begin
 initializeflatsb(fhdrMemo1.Handle);
end;}

procedure TForm1.KOLForm1Show(Sender: PObj);
begin
   ShowScrollBar(fhdrMemo1.Handle, SB_VERT , false);
   ShowScrollBar(fftrMemo1.Handle, SB_VERT , false);
   AnimateWindow (Form.Handle, 400, AW_BLEND);
   GRushPanel1.Hide;
   GRushPanel1.Show;
   SetFocus(EditBox1.Handle);
   Label1.Font.FontHeight:=15;
end;

procedure TForm1.KOLForm1Close(Sender: PObj; var Accept: Boolean);
begin
 ShowScrollBar(fhdrMemo1.Handle, SB_VERT , false);
 ShowScrollBar(fftrMemo1.Handle, SB_VERT , false);
 AnimateWindow(form.handle, 400, AW_BLEND or AW_HIDE);
end;

procedure TForm1.MusButton1Click(Sender: PObj);
begin
 if MusButton1.Tag=0 then begin
  BASS_ChannelStop(music);
  MusButton1.Caption:='Music ON';
 end else begin
  BASS_ChannelPlay(music, true);
  MusButton1.Caption:='Music OFF';
 end;
  MusButton1.Tag := Ord(not Odd(MusButton1.Tag)); //invert tag
end;

procedure TForm1.GRushButton1Click(Sender: PObj);
 var
  param: PDlgParam;
begin
// ShellAbout(form.Handle, '-=MODlist=-', '',555);
New(param);
param.f1 := 1000;
param.f2 := 2000;
dlgh := DialogBoxParam( Hinstance, 'ABOUTDLG', form.Handle,
@DlgProc, LParam(param));
//form.Enabled:=false;
end;

function DlgProc(dhWnd, Msg, wParam, lParam:Integer): Integer{BOOL}; stdcall;
{this is the Message Proc for the Dialog Box. Some of the messages
here are like WndProc (MessageProc) messages (WM_COMMAND, WM_CLOSE)
and othes (WM_INITDIALOG, WM_CTLCOLORDLG) are not. In a Dialog Proc
a DlgItem ID is often used instead of a hWnd}
begin
Result := 0 {False};
case Msg of
 WM_INITDIALOG: begin
//WM_INITDIALOG is where you set your Dlg Items properties. There are
//special DlgItem functions (SendDlgItemMessage, SetDlgItemText) to help
//with this.
 if PDlgParam(lparam).f1=1000 then AnimateWindow(dhWnd, 500, AW_CENTER);
 mkdlg:=dhWnd;        //get dlg handle

                 end;
  WM_COMMAND: begin
{like the WM_COMMAND in MessageProc, but the wParam may be used instead
of the LParam, you can get the ID number of the control, instead of it's
Handle}
            if LOWORD(wParam) = IDOK then
              begin
              makelist:=false;
              EndDialog(dhWnd, IDOK);
              Result := 1{True};
            end;
            end;
  WM_CLOSE:
    begin
{unlike MessageProc you use EndDialog to kill a Modal Dialog}
    EndDialog(dhWnd, IDCANCEL);
  //  CloseHandle(dlgh);
    Result := 1 {True};
    end;
  WM_CTLCOLORDLG: begin Result := form1.form.brush.Handle;
   end;
{this WM_CTLCOLORDLG is sent to the Dialog's DialogProc and you set the
Result to the color brush used to do the WM_ERASEBKGND message.
You can Leave this message out to get the normal button face color.
This message is rarely used in dialogs and I used it just to show you how}

  WM_CTLCOLORSTATIC:
    begin
     SetTextColor(wParam, form1.form.font.Color);
     SetBkColor(wParam, form1.form.Color);
     Result := form1.form.brush.Handle;
    end;
   WM_CTLCOLORBTN:
   begin
    SetTextColor(lParam, form1.form.font.Color);
    result:=form1.form.brush.Handle;
   end;
   WM_DRAWITEM:
   begin
        DrawButton(PDrawItemStruct(lParam));
        Result:=0;
   end;
end;
end;

procedure DrawButton(pdis: PDRAWITEMSTRUCT);
var
  szText: array[0..9] of char;
const
 colText=$0000CC00;
 elrnd=5;
begin
  SelectObject(pdis.hDC, form1.form.brush.Handle);
  SetTextColor(pdis.hDC, colText);
  SetBkMode(pdis.hDC, TRANSPARENT);
  SelectObject(pdis.hDC, CreatePen(PS_INSIDEFRAME, 1, colText));
  RoundRect(pdis.hDC, pdis.rcItem.Left, pdis.rcItem.Top,
       pdis.rcItem.Right, pdis.rcItem.Bottom, elrnd, elrnd);
  GetWindowText(pdis.hwndItem, szText, sizeof(szText));
  DrawText(pdis.hDC, szText, -1, pdis.rcItem, DT_SINGLELINE or DT_CENTER or DT_VCENTER);
  if (pdis.itemState and ODS_SELECTED) <> 0 then
  begin
   SetTextColor(pdis.hDC, clLime);
   SelectObject(pdis.hDC, CreatePen(PS_INSIDEFRAME, 2, clLime));
   RoundRect(pdis.hDC, pdis.rcItem.Left, pdis.rcItem.Top,
       pdis.rcItem.Right, pdis.rcItem.Bottom, elrnd, elrnd);
   OffsetRect(pdis^.rcItem , 1,1);
   DrawText(pdis.hDC, szText, - 1, pdis.rcItem,
             DT_SINGLELINE or DT_CENTER or DT_VCENTER);

  end;
end;

procedure TForm1.GRushButton2Click(Sender: PObj);
begin
 typMemo1.Text:=deftypes+aytypes;
end;

procedure TForm1.GRushButton4Click(Sender: PObj);
begin
 typMemo1.Text:='.*;';
end;

procedure TForm1.GRushButton3Click(Sender: PObj);
begin
 typMemo1.Text:=strmtypes+atltypes;
end;

procedure TForm1.EditBox4Change(Sender: PObj);
begin
 if EditBox4.Text='' then EditBox4.Text:='0';
end;

function TForm1.fhdrMemo1Message(var Msg: tagMSG;
  var Rslt: Integer): Boolean;
begin
if msg.message=WM_PAINT   then
begin
UpdateScrollBar(Form1.fhdrMemo1.Handle, Form1.ScrollBar1.Handle);
result:=false;
end;
 result:=false;
end;

function TForm1.fftrMemo1Message(var Msg: tagMSG;
  var Rslt: Integer): Boolean;
begin
if msg.message=WM_PAINT   then
begin
UpdateScrollBar(Form1.fftrMemo1.Handle, Form1.ScrollBar2.Handle);
result:=false;
end;
 result:=false;
end;

procedure TForm1.ScrollBar1Show(Sender: PObj);
begin
PosScrollBar(Form1.ScrollBar1, Form1.fhdrMemo1.BoundsRect);
end;

procedure TForm1.ScrollBar1SBBeforeScroll(Sender: PControl; OldPos,
  NewPos: Integer; Cmd: Word; var AllowChange: Boolean);
begin
 SBSetScroll(form1.fhdrMemo1.Handle, Cmd, NewPos);
end;

procedure TForm1.ScrollBar2Show(Sender: PObj);
begin
 PosScrollBar(Form1.ScrollBar2, Form1.fftrMemo1.BoundsRect);
end;

procedure TForm1.ScrollBar2SBBeforeScroll(Sender: PControl; OldPos,
  NewPos: Integer; Cmd: Word; var AllowChange: Boolean);
begin
 SBSetScroll(form1.fftrMemo1.Handle, Cmd, NewPos);
end;

function TForm1.KOLForm1Message(var Msg: tagMSG;
  var Rslt: Integer): Boolean;
begin
if (msg.message=WM_CTLCOLORSCROLLBAR) then
rslt:=fhdrMemo1.brush.Handle
else result:=false;

end;

procedure TForm1.Label13MouseDown(Sender: PControl;
  var Mouse: TMouseEventData);
begin
 label13.Font.Color:=clWhite;
end;

procedure TForm1.Label13MouseUp(Sender: PControl;
  var Mouse: TMouseEventData);
var config:PiniFile;
begin
 label13.Font.Color:=$0000BC00;
 BASS_Free;
 Unload_BASSDLL;
 StrSaveToFile(getstartdir+'current.mlt', savemodtemplate);
 config:=OpenIniFile(GetStartDir+'\'+conffile);
 config.Mode:=ifmWrite;
 config.Section:='Options';
 config.ValueString('Folder', EditBox1.Text);
 config.ValueString('Columns', EditBox2.Text);
 config.ValueString('FileTypes', typMemo1.Text);
 config.ValueString('FileSizes', EditBox4.Text);;
 config.ValueString('LinksColumns', EditBox3.Text);
 config.ValueString('LinksPrefix', EditBox5.Text);
 config.ValueBoolean('Subfolders', CheckBox2.Checked);
 config.ValueBoolean('Subfolders1st', CheckBox1.Checked);
 config.ValueBoolean('HTMLConvert', CheckBox3.Checked);
 config.ValueBoolean('iNonaudio', GrushCheckBox1.Checked);
 config.ValueBoolean('SpaceChar', GrushCheckBox2.Checked);
 config.ValueBoolean('HTMLLinks', GrushCheckBox3.Checked);
 config.Free;
 Form.Close;
end;

procedure TForm1.Label14MouseUp(Sender: PControl;
  var Mouse: TMouseEventData);
begin
  Form.WindowState:=wsMinimized;
end;

procedure TForm1.Label14MouseDown(Sender: PControl;
  var Mouse: TMouseEventData);
begin
  label14.Font.Color:=clWhite;
end;

procedure TForm1.EditBox4Char(Sender: PControl; var Key: KOLChar;
  Shift: Cardinal);
begin
  if not (key in['0'..'9',#8]) then begin
  Key:= #0;
  MessageBeep (Cardinal(-1));
 end;
end;

procedure TForm1.KOLForm1DropFiles(Sender: PControl;
  const FileList: KOL_String; const Pt: TPoint);
var FList: PStrList;
   //  I: Integer;
 begin
   FList := NewStrList;
   FList.Text := FileList;
 {  for I := 0 to FList.Count-1 do
   begin
     // do something with FList.Items[ I ]
   end;    }
 if (GetFileAttributes(pchar(Flist.Items[0])) and FILE_ATTRIBUTE_DIRECTORY) =
       FILE_ATTRIBUTE_DIRECTORY then
  EditBox1.Text:=Flist.Items[0] else
   if lowercase(ExtractFileExt(Flist.Items[0]))='.mlt' then
 loadmodtemplate(Flist.Items[0]);
 FList.Free;

end;

end.
