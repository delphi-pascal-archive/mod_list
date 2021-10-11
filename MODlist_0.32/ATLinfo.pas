unit ATLinfo;

interface

uses Windows, Messages;

//var
// atltag:PTagInfo;
//  FMPEGPlus: PMPEGplus;
//  FWMA: PWMA;
//  FAAC: PAAC;
//  FVQF: PTwinVQ;
//  FMonkey: PMonkey;

function GetATLinfo(filename,ext:string;var title:shortstring):double;

implementation

uses Unit1, ATLConstEx, ATLCommon;

function GetATLinfo(filename,ext:string;var title:shortstring):double;
var artist:string;
 {   WAVPackAudioInfo: TWAVPackAudioInfo;
    MonkeyAudioInfo: TMonkeyAudioInfo;
    AC3AudioInfo: TAC3AudioInfo;
    AACAudioInfo: TAACAudioInfo;
    TTAAudioInfo: TTTAAudioInfo;
    WMAAudioInfo: TWMAAudioInfo;
    OptimFrogAudioInfo: TOptimFrogAudioInfo;
    FLACAudioInfo: TFLACAudioInfo;
    TwinVQAudioInfo: TTwinVQAudioInfo;
    MPEGplusAudioInfo: TMPEGplusAudioInfo;
    MP4AudioInfo: TMP4AudioInfo;
 }
 function ShowAudio(AudioInfo: PAudioInfo; FileName: String; tagrule:byte):double;
    begin
      if not AudioInfo.ReadFromFile(FileName) or not AudioInfo.Valid
         then result:=0 else
         result:=AudioInfo.Duration;
         case tagrule of
          2:begin
            Form1.APETag1.ReadFromFile(FileName);
             if Form1.APETag1.Exists then begin
              title:=Form1.APETag1.Title;
              artist:=Form1.APETag1.Artist;
              Form1.APETag1.ResetData;
             end;
            end;
          3:begin
            Form1.WMATag1.ReadFromFile(FileName);
             if Form1.WMATag1.Exists then begin
              title:=Form1.WMATag1.Title;
              artist:=Form1.WMATag1.Artist;
              Form1.WMATag1.ResetData;
             end;
            end;
          4:begin
            Form1.TwinVQTag1.ReadFromFile(FileName);
             if Form1.TwinVQTag1.Exists then begin
              title:=Form1.TwinVQTag1.Title;
              artist:=Form1.TwinVQTag1.Artist;
              Form1.TwinVQTag1.ResetData;
             end;
            end;
          5:begin
            Form1.MP4Tag1.ReadFromFile(FileName);
             if Form1.MP4Tag1.Exists then begin
              title:=Form1.MP4Tag1.Title;
              artist:=Form1.MP4Tag1.Artist;
              Form1.MP4Tag1.ResetData;
             end;
            end;  
         end;
         if title='' then begin
          Form1.ID3v2Tag1.ReadFromFile(FileName);
           if Form1.ID3v2Tag1.Exists then begin
            title:=Form1.ID3v2Tag1.Title;
            artist:=Form1.ID3v2Tag1.Artist;
           end;
          Form1.ID3v2Tag1.ResetData;
           if title='' then begin
            Form1.ID3v1Tag1.ReadFromFile(FileName);
             if Form1.ID3v2Tag1.Exists then begin
              title:=Form1.ID3v1Tag1.Title;
              artist:=Form1.ID3v1Tag1.Artist;
             end;
            Form1.ID3v1Tag1.ResetData;
           end;
         end;

      end;
begin

 case Ext2AudioVendor(ext) of
        aWAVPack:    result:=ShowAudio(Form1.WAVPackAudioInfo1, FileName, 1);
        aMonkey:     result:=ShowAudio(Form1.MonkeyAudioInfo1, FileName, 2);
        aAC3:        result:=ShowAudio(Form1.AC3AudioInfo1, FileName, 1);
        aAAC:        result:=ShowAudio(Form1.AACAudioInfo1, FileName, 1);
        aTTA:        result:=ShowAudio(Form1.TTAAudioInfo1, FileName, 1);
        aWMA:        result:=ShowAudio(Form1.WMAAudioInfo1, FileName, 3);
        aOptimFrog:  result:=ShowAudio(Form1.OptimFrogAudioInfo1, FileName, 1);
        aFLAC:       result:=ShowAudio(Form1.FLACAudioInfo1, FileName, 1);
        aTwinVQ:     result:=ShowAudio(Form1.TwinVQAudioInfo1, FileName, 4);
        aMPEGplus:   result:=ShowAudio(Form1.MPEGplusAudioInfo1, FileName, 2);
        aMP4:        result:=ShowAudio(Form1.MP4AudioInfo1, FileName, 5);
 end;

 title:=artist+#13+'AT'+#13+title;

end;

end.
