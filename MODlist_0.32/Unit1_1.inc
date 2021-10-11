{ KOL MCK } // Do not remove this line!

procedure NewForm1( var Result: PForm1; AParent: PControl );
begin

  {$IFDEF KOLCLASSES}
  Result := PForm1.Create;
  {$ELSE OBJECTS}
  New( Result, Create );
  {$ENDIF KOL CLASSES/OBJECTS}
  Result.Form := NewForm( AParent, 'MODlist' ).SetPosition( 276, 320 ).Tabulate;
  Applet :=  Result.Form;
  Result.Form.Add2AutoFree( Result );
{$IFDEF UNICODE_CTRLS}
     Result.Form.SetUnicode(TRUE);
{$ENDIF UNICODE_CTRLS}
   {$IFDEF USE_NAMES}
    Result.Form.SetName( Applet, 'Form1' );
   {$ENDIF}
    Result.Form.Tag := 1;
    Result.Form.Transparent := True;
    Result.Form.HasBorder := False;
    Result.Form.SetClientSize( 632, 570);
    Result.Form.Color := clBlack;
    Result.Form.Font.Color := $00BC00;
    Result.Form.Font.FontHeight := 12;
    Result.Form.Font.FontName := 'Tahoma';
    Result.Form.Border := 0;
      Result.Form.OnMessage := Result.KOLForm1Message;
      Result.Form.OnClose := Result.KOLForm1Close;
      Result.Form.OnMouseDown := Result.KOLForm1MouseDown;
      Result.Form.OnShow := Result.KOLForm1Show;
      Result.Form.OnDropFiles := Result.KOLForm1DropFiles;

    Result.ID3v2Tag1 := NewTagID3v2;
   {$IFDEF USE_NAMES}
    Result.ID3v2Tag1.SetName( Result.Form, 'ID3v2Tag1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.ID3v2Tag1 );

    Result.ID3v1Tag1 := NewTagID3v1;
   {$IFDEF USE_NAMES}
    Result.ID3v1Tag1.SetName( Result.Form, 'ID3v1Tag1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.ID3v1Tag1 );

    Result.AC3AudioInfo1 := NewAudioAC3;
   {$IFDEF USE_NAMES}
    Result.AC3AudioInfo1.SetName( Result.Form, 'AC3AudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.AC3AudioInfo1 );

    Result.MP4AudioInfo1 := NewAudioMP4;
   {$IFDEF USE_NAMES}
    Result.MP4AudioInfo1.SetName( Result.Form, 'MP4AudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.MP4AudioInfo1 );

    Result.MPEGplusAudioInfo1 := NewAudioMPEGplus;
   {$IFDEF USE_NAMES}
    Result.MPEGplusAudioInfo1.SetName( Result.Form, 'MPEGplusAudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.MPEGplusAudioInfo1 );

    Result.TwinVQAudioInfo1 := NewAudioTwinVQ;
   {$IFDEF USE_NAMES}
    Result.TwinVQAudioInfo1.SetName( Result.Form, 'TwinVQAudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.TwinVQAudioInfo1 );

    Result.FLACAudioInfo1 := NewAudioFLAC;
   {$IFDEF USE_NAMES}
    Result.FLACAudioInfo1.SetName( Result.Form, 'FLACAudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.FLACAudioInfo1 );

    Result.OptimFrogAudioInfo1 := NewAudioOptimFrog;
   {$IFDEF USE_NAMES}
    Result.OptimFrogAudioInfo1.SetName( Result.Form, 'OptimFrogAudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.OptimFrogAudioInfo1 );

    Result.WMAAudioInfo1 := NewAudioWMA;
   {$IFDEF USE_NAMES}
    Result.WMAAudioInfo1.SetName( Result.Form, 'WMAAudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.WMAAudioInfo1 );

    Result.TTAAudioInfo1 := NewAudioTTA;
   {$IFDEF USE_NAMES}
    Result.TTAAudioInfo1.SetName( Result.Form, 'TTAAudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.TTAAudioInfo1 );

    Result.AACAudioInfo1 := NewAudioAAC;
   {$IFDEF USE_NAMES}
    Result.AACAudioInfo1.SetName( Result.Form, 'AACAudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.AACAudioInfo1 );

    Result.MonkeyAudioInfo1 := NewAudioMonkey;
   {$IFDEF USE_NAMES}
    Result.MonkeyAudioInfo1.SetName( Result.Form, 'MonkeyAudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.MonkeyAudioInfo1 );

    Result.WAVPackAudioInfo1 := NewAudioWAVPack;
   {$IFDEF USE_NAMES}
    Result.WAVPackAudioInfo1.SetName( Result.Form, 'WAVPackAudioInfo1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.WAVPackAudioInfo1 );

    Result.OpenSaveDialog2 := NewOpenSaveDialog( 'Choose template:', '', [ OSFileMustExist, OSOverwritePrompt, OSPathMustExist ] );
      Result.OpenSaveDialog2.Filter := 'MODlist template(*.mlt)|*.mlt|All files(*.*)|*.*';
   {$IFDEF USE_NAMES}
    Result.OpenSaveDialog2.SetName( Result.Form, 'OpenSaveDialog2' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.OpenSaveDialog2 );

    Result.OpenSaveDialog1 := NewOpenSaveDialog( 'Save list as:', '', [ OSOverwritePrompt, OSPathMustExist ] );
      Result.OpenSaveDialog1.Filter := 'All files(*.*)|*.*|HTML (*.htm;*.html)|*.htm;*.html|CSV (*.csv)|*.csv|Plain text (*.txt)|*.txt';
      Result.OpenSaveDialog1.OpenDialog := FALSE;
   {$IFDEF USE_NAMES}
    Result.OpenSaveDialog1.SetName( Result.Form, 'OpenSaveDialog1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.OpenSaveDialog1 );

    Result.OpenDirDialog1 := NewOpenDirDialog( 'Select folder:', [  ] );
   {$IFDEF USE_NAMES}
    Result.OpenDirDialog1.SetName( Result.Form, 'OpenDirDialog1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.OpenDirDialog1 );

    Result.APETag1 := NewTagAPE;
   {$IFDEF USE_NAMES}
    Result.APETag1.SetName( Result.Form, 'APETag1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.APETag1 );

    Result.WMATag1 := NewTagWMA;
   {$IFDEF USE_NAMES}
    Result.WMATag1.SetName( Result.Form, 'WMATag1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.WMATag1 );

    Result.TwinVQTag1 := NewTagTwinVQ;
   {$IFDEF USE_NAMES}
    Result.TwinVQTag1.SetName( Result.Form, 'TwinVQTag1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.TwinVQTag1 );

    Result.Mp4Tag1 := NewTagMp4;
   {$IFDEF USE_NAMES}
    Result.Mp4Tag1.SetName( Result.Form, 'Mp4Tag1' ); 
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.Mp4Tag1 );
    // Result.GRushPanel1.TabOrder = 5
    Result.GRushPanel1  :=  PGRushControl( NewGRushPanel(Result.Form).SetAlign ( caClient ) );
   {$IFDEF USE_NAMES}
    Result.GRushPanel1.SetName( Result.Form, 'GRushPanel1' ); 
   {$ENDIF}
    Result.GRushPanel1.Font.FontHeight := 15;
    Result.GRushPanel1.Border := 2;
    Result.GRushPanel1.Caption := '-=MODlist=-';
    Result.GRushPanel1.All_ColorFrom := 0;
    Result.GRushPanel1.All_ColorTo := 0;
    Result.GRushPanel1.Def_ColorOuter := 10789024;
    Result.GRushPanel1.Def_ColorText := 48128;
    Result.GRushPanel1.Dis_ColorText := 32768;
    Result.GRushPanel1.All_ColorShadow := 0;
    Result.GRushPanel1.Def_GradientStyle := gsSolid;
    Result.GRushPanel1.All_ShadowOffset := 0;
    // Result.Label1.TabOrder = -1
      Result.Label1 := NewLabel( Result.GRushPanel1, 'Folder:' ).SetPosition( 8, 37 ).SetSize( 41, 16 );
   {$IFDEF USE_NAMES}
      Result.Label1.SetName( Result.Form, 'Label1' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label1.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    // Result.Label11.TabOrder = -1
      Result.Label11 := NewLabel( Result.GRushPanel1, '2007  ' ).SetPosition( 152, 550 ).SetSize( 46, 16 );
   {$IFDEF USE_NAMES}
      Result.Label11.SetName( Result.Form, 'Label11' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label11.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label11.Font.FontHeight := 16;
    // Result.Label12.TabOrder = -1
      Result.Label12 := NewLabel( Result.GRushPanel1, 'Options' ).SetPosition( 242, 55 ).SetSize( 52, 15 );
   {$IFDEF USE_NAMES}
      Result.Label12.SetName( Result.Form, 'Label12' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label12.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label12.Font.FontHeight := 16;
    Result.Label12.TextAlign := KOL.taCenter;
    // Result.Label13.TabOrder = -1
      Result.Label13 := NewLabel( Result.GRushPanel1, 'X' ).SetPosition( 618, 4 ).SetSize( 10, 17 );
   {$IFDEF USE_NAMES}
      Result.Label13.SetName( Result.Form, 'Label13' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label13.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label13.Font.FontStyle := [ fsBold ];
    Result.Label13.Font.FontName := 'MS Sans Serif';
      Result.Label13.EraseBackground := TRUE;
    // Result.Label14.TabOrder = -1
      Result.Label14 := NewLabel( Result.GRushPanel1, '__' ).SetPosition( 600, 4 ).SetSize( 17, 20 );
   {$IFDEF USE_NAMES}
      Result.Label14.SetName( Result.Form, 'Label14' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label14.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label14.Font.FontStyle := [ fsBold ];
    Result.Label14.Font.FontHeight := 11;
      Result.Label14.EraseBackground := TRUE;
    // Result.Label15.TabOrder = -1
      Result.Label15 := NewLabel( Result.GRushPanel1, 'v0.32' ).SetPosition( 592, 550 ).SetSize( 33, 16 );
   {$IFDEF USE_NAMES}
      Result.Label15.SetName( Result.Form, 'Label15' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label15.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label15.Font.FontHeight := 16;
    // Result.Label2.TabOrder = -1
      Result.Label2 := NewLabel( Result.GRushPanel1, 'http://www.keygenmusic.net/' ).SetPosition( 200, 549 ).SetSize( 177, 15 );
   {$IFDEF USE_NAMES}
      Result.Label2.SetName( Result.Form, 'Label2' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label2.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label2.Font.Color := clAqua;
    Result.Label2.Font.FontStyle := [ fsUnderline ];
    Result.Label2.Font.FontHeight := 16;
      Result.Label2.Cursor := LoadCursor( 0, IDC_HAND );
    Result.Label2.Color := clBlack;
    // Result.EditBox1.TabOrder = 0
      Result.EditBox1 := NewEditBox( Result.GRushPanel1, [  ] ).SetPosition( 48, 31 ).SetSize( 481, 0 );
   {$IFDEF USE_NAMES}
      Result.EditBox1.SetName( Result.Form, 'EditBox1' ); 
   {$ENDIF}
      Result.EditBox1.Ctl3D := False;
    Result.EditBox1.Style := Result.EditBox1.Style and not WS_TABSTOP;
    Result.EditBox1.Font.Color := clLime;
    {$IFNDEF UNICODE_CTRLS}Result.EditBox1.SetUnicode( TRUE );{$ENDIF}
    // Result.GRushPanel2.TabOrder = 1
      Result.GRushPanel2  :=  PGRushControl( NewGRushPanel(Result.GRushPanel1).SetPosition( 8, 64 ).SetSize( 521, 485 ) );
   {$IFDEF USE_NAMES}
      Result.GRushPanel2.SetName( Result.Form, 'GRushPanel2' ); 
   {$ENDIF}
    Result.GRushPanel2.Font.FontHeight := 12;
      Result.GRushPanel2.All_ColorFrom := 0;
      Result.GRushPanel2.All_ColorTo := 0;
      Result.GRushPanel2.Def_ColorOuter := 0;
      Result.GRushPanel2.Def_ColorText := 48128;
      Result.GRushPanel2.Dis_ColorText := 32768;
      Result.GRushPanel2.All_ColorShadow := 0;
      Result.GRushPanel2.Def_BorderRoundWidth := 10;
      Result.GRushPanel2.Def_BorderRoundHeight := 10;
      Result.GRushPanel2.Def_GradientStyle := gsSolid;
      Result.GRushPanel2.All_ShadowOffset := 0;
    // Result.Label10.TabOrder = -1
        Result.Label10 := NewLabel( Result.GRushPanel2, 'Splitter:' ).SetPosition( 177, 144 ).SetSize( 0, 17 );
   {$IFDEF USE_NAMES}
        Result.Label10.SetName( Result.Form, 'Label10' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label10.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label10.Font.FontHeight := 15;
    // Result.Label16.TabOrder = -1
        Result.Label16 := NewLabel( Result.GRushPanel2, 'Include columns:' ).SetPosition( 6, 185 ).SetSize( 83, 17 );
   {$IFDEF USE_NAMES}
        Result.Label16.SetName( Result.Form, 'Label16' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label16.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label16.Font.FontHeight := 15;
    // Result.Label17.TabOrder = -1
        Result.Label17 := NewLabel( Result.GRushPanel2, '(F - file name, N - title, T - play time, S - file size, A - artist(mp3, etc only))' ).SetPosition( 150, 185 ).SetSize( 355, 18 ).MakeWordWrap;
   {$IFDEF USE_NAMES}
        Result.Label17.SetName( Result.Form, 'Label17' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label17.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label17.Font.FontHeight := 13;
    // Result.Label18.TabOrder = -1
        Result.Label18 := NewLabel( Result.GRushPanel2, 'Tip: type "%D  yyyy/MM/dd HH:mm:ss%/D"  to insert current date/time. See readme for more details.' ).SetPosition( 6, 317 ).SetSize( 507, 15 );
   {$IFDEF USE_NAMES}
        Result.Label18.SetName( Result.Form, 'Label18' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label18.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label18.Font.FontHeight := 13;
    // Result.Label19.TabOrder = -1
        Result.Label19 := NewLabel( Result.GRushPanel2, 'Include file types:' ).SetPosition( 256, 335 ).SetSize( 107, 16 );
   {$IFDEF USE_NAMES}
        Result.Label19.SetName( Result.Form, 'Label19' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label19.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label19.Font.FontHeight := 15;
    // Result.Label20.TabOrder = -1
        Result.Label20 := NewLabel( Result.GRushPanel2, 'Do not index files larger then' ).SetPosition( 10, 421 ).SetSize( 143, 17 );
   {$IFDEF USE_NAMES}
        Result.Label20.SetName( Result.Form, 'Label20' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label20.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label20.Font.FontHeight := 13;
    // Result.Label21.TabOrder = -1
        Result.Label21 := NewLabel( Result.GRushPanel2, 'Mb' ).SetPosition( 210, 421 ).SetSize( 31, 17 );
   {$IFDEF USE_NAMES}
        Result.Label21.SetName( Result.Form, 'Label21' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label21.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label21.Font.FontHeight := 15;
    // Result.Label22.TabOrder = -1
        Result.Label22 := NewLabel( Result.GRushPanel2, 'with prefix:' ).SetPosition( 220, 441 ).SetSize( 49, 16 );
   {$IFDEF USE_NAMES}
        Result.Label22.SetName( Result.Form, 'Label22' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label22.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label22.Font.FontHeight := 15;
    // Result.Label23.TabOrder = -1
        Result.Label23 := NewLabel( Result.GRushPanel2, 'Tip: prefix can be a website addres (http://www.mysite.com/) or path to some folder or leave empty.' ).SetPosition( 26, 457 ).SetSize( 483, 18 ).MakeWordWrap;
   {$IFDEF USE_NAMES}
        Result.Label23.SetName( Result.Form, 'Label23' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label23.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label23.Font.FontHeight := 13;
    // Result.Label3.TabOrder = -1
        Result.Label3 := NewLabel( Result.GRushPanel2, 'File header:' ).SetPosition( 6, 4 ).SetSize( 67, 15 );
   {$IFDEF USE_NAMES}
        Result.Label3.SetName( Result.Form, 'Label3' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label3.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label3.Font.FontHeight := 15;
    // Result.Label4.TabOrder = -1
        Result.Label4 := NewLabel( Result.GRushPanel2, 'File footer:' ).SetPosition( 6, 202 ).SetSize( 0, 17 );
   {$IFDEF USE_NAMES}
        Result.Label4.SetName( Result.Form, 'Label4' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label4.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label4.Font.FontHeight := 15;
    // Result.Label5.TabOrder = -1
        Result.Label5 := NewLabel( Result.GRushPanel2, 'Row start:' ).SetPosition( 6, 110 ).SetSize( 0, 15 );
   {$IFDEF USE_NAMES}
        Result.Label5.SetName( Result.Form, 'Label5' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label5.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label5.Font.FontHeight := 15;
    // Result.Label6.TabOrder = -1
        Result.Label6 := NewLabel( Result.GRushPanel2, 'Row end:' ).SetPosition( 348, 110 ).SetSize( 0, 15 );
   {$IFDEF USE_NAMES}
        Result.Label6.SetName( Result.Form, 'Label6' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label6.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label6.Font.FontHeight := 15;
    // Result.Label7.TabOrder = -1
        Result.Label7 := NewLabel( Result.GRushPanel2, 'Splitter:' ).SetPosition( 177, 110 ).SetSize( 0, 15 );
   {$IFDEF USE_NAMES}
        Result.Label7.SetName( Result.Form, 'Label7' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label7.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label7.Font.FontHeight := 15;
    // Result.Label8.TabOrder = -1
        Result.Label8 := NewLabel( Result.GRushPanel2, 'Column start:' ).SetPosition( 6, 144 ).SetSize( 75, 17 );
   {$IFDEF USE_NAMES}
        Result.Label8.SetName( Result.Form, 'Label8' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label8.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label8.Font.FontHeight := 15;
    // Result.Label9.TabOrder = -1
        Result.Label9 := NewLabel( Result.GRushPanel2, 'Column end:' ).SetPosition( 348, 144 ).SetSize( 75, 17 );
   {$IFDEF USE_NAMES}
        Result.Label9.SetName( Result.Form, 'Label9' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.Label9.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.Label9.Font.FontHeight := 15;
    // Result.ScrollBar2.TabOrder = 0
        Result.ScrollBar2 := NewScrollBar( Result.GRushPanel2, sbVertical ).SetPosition( 496, 216 ).SetSize( 0, 89 );
   {$IFDEF USE_NAMES}
        Result.ScrollBar2.SetName( Result.Form, 'ScrollBar2' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.ScrollBar2.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
        Result.ScrollBar2.Ctl3D := False;
    Result.ScrollBar2.Color := clGreen;
        Result.ScrollBar2.SBMax := 100;
    // Result.ScrollBar1.TabOrder = 1
        Result.ScrollBar1 := NewScrollBar( Result.GRushPanel2, sbVertical ).SetPosition( 496, 24 ).SetSize( 0, 89 );
   {$IFDEF USE_NAMES}
        Result.ScrollBar1.SetName( Result.Form, 'ScrollBar1' ); 
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
   Result.ScrollBar1.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
        Result.ScrollBar1.Ctl3D := False;
    Result.ScrollBar1.Color := clGreen;
        Result.ScrollBar1.SBMax := 100;
    // Result.BWcolsedit1.TabOrder = 2
        Result.BWcolsedit1 := NewEditBox( Result.GRushPanel2, [ eoWantTab ] ).SetPosition( 177, 161 ).SetSize( 167, 17 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.BWcolsedit1.SetName( Result.Form, 'BWcolsedit1' ); 
   {$ENDIF}
        Result.BWcolsedit1.HasBorder := FALSE;
    Result.BWcolsedit1.Font.Color := clLime;
    Result.BWcolsedit1.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.BWcolsedit1.SetUnicode( TRUE );{$ENDIF}
    // Result.BWRowsEdit1.TabOrder = 2
        Result.BWRowsEdit1 := NewEditBox( Result.GRushPanel2, [ eoWantTab ] ).SetPosition( 177, 126 ).SetSize( 167, 17 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.BWRowsEdit1.SetName( Result.Form, 'BWRowsEdit1' ); 
   {$ENDIF}
        Result.BWRowsEdit1.HasBorder := FALSE;
    Result.BWRowsEdit1.Font.Color := clLime;
    Result.BWRowsEdit1.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.BWRowsEdit1.SetUnicode( TRUE );{$ENDIF}
    // Result.ColEndEdit1.TabOrder = 2
        Result.ColEndEdit1 := NewEditBox( Result.GRushPanel2, [ eoWantTab ] ).SetPosition( 348, 161 ).SetSize( 168, 17 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.ColEndEdit1.SetName( Result.Form, 'ColEndEdit1' ); 
   {$ENDIF}
        Result.ColEndEdit1.HasBorder := FALSE;
    Result.ColEndEdit1.Font.Color := clLime;
    Result.ColEndEdit1.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.ColEndEdit1.SetUnicode( TRUE );{$ENDIF}
    // Result.ColStartEdit1.TabOrder = 2
        Result.ColStartEdit1 := NewEditBox( Result.GRushPanel2, [ eoWantTab ] ).SetPosition( 6, 161 ).SetSize( 167, 17 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.ColStartEdit1.SetName( Result.Form, 'ColStartEdit1' ); 
   {$ENDIF}
        Result.ColStartEdit1.HasBorder := FALSE;
    Result.ColStartEdit1.Font.Color := clLime;
    Result.ColStartEdit1.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.ColStartEdit1.SetUnicode( TRUE );{$ENDIF}
    // Result.EditBox2.TabOrder = 2
        Result.EditBox2 := NewEditBox( Result.GRushPanel2, [ eoUpperCase, eoWantTab ] ).SetPosition( 94, 183 ).SetSize( 51, 17 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.EditBox2.SetName( Result.Form, 'EditBox2' ); 
   {$ENDIF}
        Result.EditBox2.HasBorder := FALSE;
    Result.EditBox2.Font.Color := clLime;
    Result.EditBox2.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.EditBox2.SetUnicode( TRUE );{$ENDIF}
        Result.EditBox2.Text := 'FNTS';
    // Result.EditBox3.TabOrder = 2
        Result.EditBox3 := NewEditBox( Result.GRushPanel2, [ eoUpperCase, eoWantTab ] ).SetPosition( 166, 441 ).SetSize( 51, 17 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.EditBox3.SetName( Result.Form, 'EditBox3' ); 
   {$ENDIF}
        Result.EditBox3.HasBorder := FALSE;
    Result.EditBox3.Font.Color := clLime;
    Result.EditBox3.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.EditBox3.SetUnicode( TRUE );{$ENDIF}
        Result.EditBox3.Text := 'F';
    // Result.EditBox4.TabOrder = 2
        Result.EditBox4 := NewEditBox( Result.GRushPanel2, [  ] ).SetPosition( 156, 421 ).SetSize( 49, 15 );
   {$IFDEF USE_NAMES}
        Result.EditBox4.SetName( Result.Form, 'EditBox4' ); 
   {$ENDIF}
        Result.EditBox4.HasBorder := FALSE;
    Result.EditBox4.Font.Color := clLime;
    Result.EditBox4.Font.FontHeight := 15;
    Result.EditBox4.TextAlign := KOL.taRight;
    {$IFNDEF UNICODE_CTRLS}Result.EditBox4.SetUnicode( TRUE );{$ENDIF}
        Result.EditBox4.Text := '100';
    // Result.EditBox5.TabOrder = 2
        Result.EditBox5 := NewEditBox( Result.GRushPanel2, [ eoWantTab ] ).SetPosition( 272, 441 ).SetSize( 241, 17 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.EditBox5.SetName( Result.Form, 'EditBox5' ); 
   {$ENDIF}
        Result.EditBox5.HasBorder := FALSE;
    Result.EditBox5.Font.Color := clLime;
    Result.EditBox5.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.EditBox5.SetUnicode( TRUE );{$ENDIF}
    // Result.RowEndEdit1.TabOrder = 2
        Result.RowEndEdit1 := NewEditBox( Result.GRushPanel2, [ eoWantTab ] ).SetPosition( 348, 126 ).SetSize( 168, 17 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.RowEndEdit1.SetName( Result.Form, 'RowEndEdit1' ); 
   {$ENDIF}
        Result.RowEndEdit1.HasBorder := FALSE;
    Result.RowEndEdit1.Font.Color := clLime;
    Result.RowEndEdit1.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.RowEndEdit1.SetUnicode( TRUE );{$ENDIF}
    // Result.RowStartEdit1.TabOrder = 2
        Result.RowStartEdit1 := NewEditBox( Result.GRushPanel2, [ eoWantTab ] ).SetPosition( 6, 126 ).SetSize( 167, 17 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.RowStartEdit1.SetName( Result.Form, 'RowStartEdit1' ); 
   {$ENDIF}
        Result.RowStartEdit1.HasBorder := FALSE;
    Result.RowStartEdit1.Font.Color := clLime;
    Result.RowStartEdit1.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.RowStartEdit1.SetUnicode( TRUE );{$ENDIF}
    // Result.CheckBox1.TabOrder = 3
        Result.CheckBox1  :=  PGRushControl( NewGRushCheckBox(Result.GRushPanel2, 'Subfolders first').SetPosition( 8, 349 ).SetSize( 105, 15 ) );
   {$IFDEF USE_NAMES}
        Result.CheckBox1.SetName( Result.Form, 'CheckBox1' ); 
   {$ENDIF}
    Result.CheckBox1.Font.FontHeight := 15;
        Result.CheckBox1.Checked := TRUE;
        Result.CheckBox1.Def_ColorFrom := 32768;
        Result.CheckBox1.Over_ColorFrom := 40960;
        Result.CheckBox1.Down_ColorFrom := 32768;
        Result.CheckBox1.Dis_ColorFrom := 6908265;
        Result.CheckBox1.Def_ColorTo := 32768;
        Result.CheckBox1.Over_ColorTo := 40960;
        Result.CheckBox1.Down_ColorTo := 32768;
        Result.CheckBox1.Dis_ColorTo := 32768;
        Result.CheckBox1.All_ColorOuter := 0;
        Result.CheckBox1.Def_ColorText := 48128;
        Result.CheckBox1.Over_ColorText := 48128;
        Result.CheckBox1.Down_ColorText := 48128;
        Result.CheckBox1.Dis_ColorText := 32768;
        Result.CheckBox1.All_ColorShadow := 0;
        Result.CheckBox1.All_BorderColor := 0;
        Result.CheckBox1.All_GradientStyle := gsSolid;
        Result.CheckBox1.All_ColorCheck := 65280;
    // Result.CheckBox2.TabOrder = 3
        Result.CheckBox2  :=  PGRushControl( NewGRushCheckBox(Result.GRushPanel2, 'Include subfolders').SetPosition( 8, 332 ).SetSize( 137, 15 ) );
   {$IFDEF USE_NAMES}
        Result.CheckBox2.SetName( Result.Form, 'CheckBox2' ); 
   {$ENDIF}
    Result.CheckBox2.Font.FontHeight := 15;
        Result.CheckBox2.Checked := TRUE;
        Result.CheckBox2.Def_ColorFrom := 32768;
        Result.CheckBox2.Over_ColorFrom := 40960;
        Result.CheckBox2.Down_ColorFrom := 32768;
        Result.CheckBox2.Dis_ColorFrom := 6908265;
        Result.CheckBox2.Def_ColorTo := 32768;
        Result.CheckBox2.Over_ColorTo := 40960;
        Result.CheckBox2.Down_ColorTo := 32768;
        Result.CheckBox2.Dis_ColorTo := 32768;
        Result.CheckBox2.All_ColorOuter := 0;
        Result.CheckBox2.Def_ColorText := 48128;
        Result.CheckBox2.Over_ColorText := 48128;
        Result.CheckBox2.Down_ColorText := 48128;
        Result.CheckBox2.Dis_ColorText := 32768;
        Result.CheckBox2.All_ColorShadow := 0;
        Result.CheckBox2.All_BorderColor := 0;
        Result.CheckBox2.All_GradientStyle := gsSolid;
        Result.CheckBox2.All_ColorCheck := 65280;
    // Result.CheckBox3.TabOrder = 3
        Result.CheckBox3  :=  PGRushControl( NewGRushCheckBox(Result.GRushPanel2, 'Convert title strings to HTML format').SetPosition( 8, 366 ).SetSize( 242, 15 ) );
   {$IFDEF USE_NAMES}
        Result.CheckBox3.SetName( Result.Form, 'CheckBox3' ); 
   {$ENDIF}
    Result.CheckBox3.Font.FontHeight := 15;
        Result.CheckBox3.Def_ColorFrom := 32768;
        Result.CheckBox3.Over_ColorFrom := 40960;
        Result.CheckBox3.Down_ColorFrom := 32768;
        Result.CheckBox3.Dis_ColorFrom := 6908265;
        Result.CheckBox3.Def_ColorTo := 32768;
        Result.CheckBox3.Over_ColorTo := 40960;
        Result.CheckBox3.Down_ColorTo := 32768;
        Result.CheckBox3.Dis_ColorTo := 32768;
        Result.CheckBox3.All_ColorOuter := 0;
        Result.CheckBox3.Def_ColorText := 48128;
        Result.CheckBox3.Over_ColorText := 48128;
        Result.CheckBox3.Down_ColorText := 48128;
        Result.CheckBox3.Dis_ColorText := 32768;
        Result.CheckBox3.All_ColorShadow := 0;
        Result.CheckBox3.All_BorderColor := 0;
        Result.CheckBox3.All_GradientStyle := gsSolid;
        Result.CheckBox3.All_ColorCheck := 65280;
    // Result.GRushCheckBox1.TabOrder = 3
        Result.GRushCheckBox1  :=  PGRushControl( NewGRushCheckBox(Result.GRushPanel2, 'Include non-audio && too large files').SetPosition( 8, 400 ).SetSize( 214, 15 ) );
   {$IFDEF USE_NAMES}
        Result.GRushCheckBox1.SetName( Result.Form, 'GRushCheckBox1' ); 
   {$ENDIF}
    Result.GRushCheckBox1.Font.FontHeight := 15;
        Result.GRushCheckBox1.Def_ColorFrom := 32768;
        Result.GRushCheckBox1.Over_ColorFrom := 40960;
        Result.GRushCheckBox1.Down_ColorFrom := 32768;
        Result.GRushCheckBox1.Dis_ColorFrom := 6908265;
        Result.GRushCheckBox1.Def_ColorTo := 32768;
        Result.GRushCheckBox1.Over_ColorTo := 40960;
        Result.GRushCheckBox1.Down_ColorTo := 32768;
        Result.GRushCheckBox1.Dis_ColorTo := 32768;
        Result.GRushCheckBox1.All_ColorOuter := 0;
        Result.GRushCheckBox1.Def_ColorText := 48128;
        Result.GRushCheckBox1.Over_ColorText := 48128;
        Result.GRushCheckBox1.Down_ColorText := 48128;
        Result.GRushCheckBox1.Dis_ColorText := 32768;
        Result.GRushCheckBox1.All_ColorShadow := 0;
        Result.GRushCheckBox1.All_BorderColor := 0;
        Result.GRushCheckBox1.All_GradientStyle := gsSolid;
        Result.GRushCheckBox1.All_ColorCheck := 65280;
    // Result.GRushCheckBox2.TabOrder = 3
        Result.GRushCheckBox2  :=  PGRushControl( NewGRushCheckBox(Result.GRushPanel2, 'Add space char in empty cells').SetPosition( 8, 383 ).SetSize( 242, 15 ) );
   {$IFDEF USE_NAMES}
        Result.GRushCheckBox2.SetName( Result.Form, 'GRushCheckBox2' ); 
   {$ENDIF}
    Result.GRushCheckBox2.Font.FontHeight := 15;
        Result.GRushCheckBox2.Def_ColorFrom := 32768;
        Result.GRushCheckBox2.Over_ColorFrom := 40960;
        Result.GRushCheckBox2.Down_ColorFrom := 32768;
        Result.GRushCheckBox2.Dis_ColorFrom := 6908265;
        Result.GRushCheckBox2.Def_ColorTo := 32768;
        Result.GRushCheckBox2.Over_ColorTo := 40960;
        Result.GRushCheckBox2.Down_ColorTo := 32768;
        Result.GRushCheckBox2.Dis_ColorTo := 32768;
        Result.GRushCheckBox2.All_ColorOuter := 0;
        Result.GRushCheckBox2.Def_ColorText := 48128;
        Result.GRushCheckBox2.Over_ColorText := 48128;
        Result.GRushCheckBox2.Down_ColorText := 48128;
        Result.GRushCheckBox2.Dis_ColorText := 32768;
        Result.GRushCheckBox2.All_ColorShadow := 0;
        Result.GRushCheckBox2.All_BorderColor := 0;
        Result.GRushCheckBox2.All_GradientStyle := gsSolid;
        Result.GRushCheckBox2.All_ColorCheck := 65280;
    // Result.GRushCheckBox3.TabOrder = 3
        Result.GRushCheckBox3  :=  PGRushControl( NewGRushCheckBox(Result.GRushPanel2, 'Add HTML links to columns').SetPosition( 8, 442 ).SetSize( 153, 15 ) );
   {$IFDEF USE_NAMES}
        Result.GRushCheckBox3.SetName( Result.Form, 'GRushCheckBox3' ); 
   {$ENDIF}
    Result.GRushCheckBox3.Font.FontHeight := 15;
        Result.GRushCheckBox3.Def_ColorFrom := 32768;
        Result.GRushCheckBox3.Over_ColorFrom := 40960;
        Result.GRushCheckBox3.Down_ColorFrom := 32768;
        Result.GRushCheckBox3.Dis_ColorFrom := 6908265;
        Result.GRushCheckBox3.Def_ColorTo := 32768;
        Result.GRushCheckBox3.Over_ColorTo := 40960;
        Result.GRushCheckBox3.Down_ColorTo := 32768;
        Result.GRushCheckBox3.Dis_ColorTo := 32768;
        Result.GRushCheckBox3.All_ColorOuter := 0;
        Result.GRushCheckBox3.Def_ColorText := 48128;
        Result.GRushCheckBox3.Over_ColorText := 48128;
        Result.GRushCheckBox3.Down_ColorText := 48128;
        Result.GRushCheckBox3.Dis_ColorText := 32768;
        Result.GRushCheckBox3.All_ColorShadow := 0;
        Result.GRushCheckBox3.All_BorderColor := 0;
        Result.GRushCheckBox3.All_GradientStyle := gsSolid;
        Result.GRushCheckBox3.All_ColorCheck := 65280;
    // Result.fftrMemo1.TabOrder = 4
        Result.fftrMemo1 := NewEditBox( Result.GRushPanel2, [ eoMultiline, eoNoHScroll, eoWantTab ] ).SetPosition( 6, 219 ).SetSize( 510, 95 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.fftrMemo1.SetName( Result.Form, 'fftrMemo1' ); 
   {$ENDIF}
        Result.fftrMemo1.Ctl3D := False;
        Result.fftrMemo1.HasBorder := FALSE;
    Result.fftrMemo1.Font.Color := clLime;
    Result.fftrMemo1.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.fftrMemo1.SetUnicode( TRUE );{$ENDIF}
    // Result.typMemo1.TabOrder = 4
        Result.typMemo1 := NewEditBox( Result.GRushPanel2, [ eoMultiline, eoNoHScroll, eoNoVScroll, eoWantTab ] ).SetPosition( 256, 352 ).SetSize( 257, 59 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.typMemo1.SetName( Result.Form, 'typMemo1' ); 
   {$ENDIF}
        Result.typMemo1.Ctl3D := False;
        Result.typMemo1.HasBorder := FALSE;
    Result.typMemo1.Font.Color := clLime;
    Result.typMemo1.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.typMemo1.SetUnicode( TRUE );{$ENDIF}
    // Result.fhdrMemo1.TabOrder = 5
        Result.fhdrMemo1 := NewEditBox( Result.GRushPanel2, [ eoMultiline, eoNoHScroll, eoWantTab ] ).SetPosition( 6, 20 ).SetSize( 510, 89 ).EditTabChar;
   {$IFDEF USE_NAMES}
        Result.fhdrMemo1.SetName( Result.Form, 'fhdrMemo1' ); 
   {$ENDIF}
        Result.fhdrMemo1.Ctl3D := False;
        Result.fhdrMemo1.HasBorder := FALSE;
    Result.fhdrMemo1.Font.Color := clLime;
    Result.fhdrMemo1.Font.FontHeight := 15;
    {$IFNDEF UNICODE_CTRLS}Result.fhdrMemo1.SetUnicode( TRUE );{$ENDIF}
    // Result.GRushButton2.TabOrder = 6
        Result.GRushButton2  :=  PGRushControl( NewGRushButton(Result.GRushPanel2, 'Trackers').SetPosition( 258, 418 ).SetSize( 74, 16 ) );
   {$IFDEF USE_NAMES}
        Result.GRushButton2.SetName( Result.Form, 'GRushButton2' ); 
   {$ENDIF}
    Result.GRushButton2.Font.FontHeight := 13;
        Result.GRushButton2.Def_ColorFrom := 0;
        Result.GRushButton2.Over_ColorFrom := 0;
        Result.GRushButton2.Down_ColorFrom := 65280;
        Result.GRushButton2.Dis_ColorFrom := 0;
        Result.GRushButton2.Def_ColorTo := 32768;
        Result.GRushButton2.Over_ColorTo := 40960;
        Result.GRushButton2.Down_ColorTo := 0;
        Result.GRushButton2.Dis_ColorTo := 0;
        Result.GRushButton2.All_ColorOuter := 0;
        Result.GRushButton2.Def_ColorText := 52224;
        Result.GRushButton2.Over_ColorText := 65280;
        Result.GRushButton2.Down_ColorText := 65280;
        Result.GRushButton2.Dis_ColorText := 25600;
        Result.GRushButton2.All_ColorShadow := 0;
        Result.GRushButton2.Def_BorderColor := 52224;
        Result.GRushButton2.Over_BorderColor := 65280;
        Result.GRushButton2.Down_BorderColor := 65280;
        Result.GRushButton2.Def_GradientStyle := gsDoubleVert;
        Result.GRushButton2.Down_GradientStyle := gsDoubleVert;
    // Result.GRushButton3.TabOrder = 6
        Result.GRushButton3  :=  PGRushControl( NewGRushButton(Result.GRushPanel2, 'Stream(mp3 etc)').SetPosition( 354, 418 ).SetSize( 94, 16 ) );
   {$IFDEF USE_NAMES}
        Result.GRushButton3.SetName( Result.Form, 'GRushButton3' ); 
   {$ENDIF}
    Result.GRushButton3.Font.FontHeight := 13;
        Result.GRushButton3.Def_ColorFrom := 0;
        Result.GRushButton3.Over_ColorFrom := 0;
        Result.GRushButton3.Down_ColorFrom := 65280;
        Result.GRushButton3.Dis_ColorFrom := 0;
        Result.GRushButton3.Def_ColorTo := 32768;
        Result.GRushButton3.Over_ColorTo := 40960;
        Result.GRushButton3.Down_ColorTo := 0;
        Result.GRushButton3.Dis_ColorTo := 0;
        Result.GRushButton3.All_ColorOuter := 0;
        Result.GRushButton3.Def_ColorText := 52224;
        Result.GRushButton3.Over_ColorText := 65280;
        Result.GRushButton3.Down_ColorText := 65280;
        Result.GRushButton3.Dis_ColorText := 25600;
        Result.GRushButton3.All_ColorShadow := 0;
        Result.GRushButton3.Def_BorderColor := 52224;
        Result.GRushButton3.Over_BorderColor := 65280;
        Result.GRushButton3.Down_BorderColor := 65280;
        Result.GRushButton3.Def_GradientStyle := gsDoubleVert;
        Result.GRushButton3.Down_GradientStyle := gsDoubleVert;
    // Result.GRushButton4.TabOrder = 6
        Result.GRushButton4  :=  PGRushControl( NewGRushButton(Result.GRushPanel2, 'All').SetPosition( 473, 418 ).SetSize( 40, 16 ) );
   {$IFDEF USE_NAMES}
        Result.GRushButton4.SetName( Result.Form, 'GRushButton4' ); 
   {$ENDIF}
    Result.GRushButton4.Font.FontHeight := 13;
        Result.GRushButton4.Def_ColorFrom := 0;
        Result.GRushButton4.Over_ColorFrom := 0;
        Result.GRushButton4.Down_ColorFrom := 65280;
        Result.GRushButton4.Dis_ColorFrom := 0;
        Result.GRushButton4.Def_ColorTo := 32768;
        Result.GRushButton4.Over_ColorTo := 40960;
        Result.GRushButton4.Down_ColorTo := 0;
        Result.GRushButton4.Dis_ColorTo := 0;
        Result.GRushButton4.All_ColorOuter := 0;
        Result.GRushButton4.Def_ColorText := 52224;
        Result.GRushButton4.Over_ColorText := 65280;
        Result.GRushButton4.Down_ColorText := 65280;
        Result.GRushButton4.Dis_ColorText := 25600;
        Result.GRushButton4.All_ColorShadow := 0;
        Result.GRushButton4.Def_BorderColor := 52224;
        Result.GRushButton4.Over_BorderColor := 65280;
        Result.GRushButton4.Down_BorderColor := 65280;
        Result.GRushButton4.Def_GradientStyle := gsDoubleVert;
        Result.GRushButton4.Down_GradientStyle := gsDoubleVert;
    // Result.GifShow1.TabOrder = 4
      Result.GifShow1 := TKOLGifShow( NewGifShow( Result.GRushPanel1 ).SetPosition( 536, 272 ));
   {$IFDEF USE_NAMES}
      Result.GifShow1.SetName( Result.Form, 'GifShow1' ); 
   {$ENDIF}
      Result.GifShow1.Cursor := LoadCursor( 0, IDC_HAND );
    {$R Form1_GifShow1.RES}
      Result.GifShow1.LoadFromResourceName( hInstance, 'FORM1_GIFSHOW1' );
    // Result.Button1.TabOrder = 5
      Result.Button1  :=  PGRushControl( NewGRushButton(Result.GRushPanel1, 'Browse...').SetPosition( 535, 28 ).SetSize( 90, 26 ) );
   {$IFDEF USE_NAMES}
      Result.Button1.SetName( Result.Form, 'Button1' ); 
   {$ENDIF}
    Result.Button1.Font.FontHeight := 20;
      Result.Button1.Def_ColorFrom := 0;
      Result.Button1.Over_ColorFrom := 0;
      Result.Button1.Down_ColorFrom := 65280;
      Result.Button1.Dis_ColorFrom := 0;
      Result.Button1.Def_ColorTo := 32768;
      Result.Button1.Over_ColorTo := 40960;
      Result.Button1.Down_ColorTo := 0;
      Result.Button1.Dis_ColorTo := 0;
      Result.Button1.All_ColorOuter := 0;
      Result.Button1.Def_ColorText := 52224;
      Result.Button1.Over_ColorText := 65280;
      Result.Button1.Down_ColorText := 65280;
      Result.Button1.Dis_ColorText := 25600;
      Result.Button1.All_ColorShadow := 0;
      Result.Button1.Def_BorderColor := 52224;
      Result.Button1.Over_BorderColor := 65280;
      Result.Button1.Down_BorderColor := 65280;
      Result.Button1.Def_GradientStyle := gsDoubleVert;
      Result.Button1.Down_GradientStyle := gsDoubleVert;
    // Result.Button2.TabOrder = 5
      Result.Button2  :=  PGRushControl( NewGRushButton(Result.GRushPanel1, 'Make list').SetPosition( 535, 204 ).SetSize( 90, 26 ) );
   {$IFDEF USE_NAMES}
      Result.Button2.SetName( Result.Form, 'Button2' ); 
   {$ENDIF}
    Result.Button2.Font.FontHeight := 20;
      Result.Button2.Def_ColorFrom := 0;
      Result.Button2.Over_ColorFrom := 0;
      Result.Button2.Down_ColorFrom := 65280;
      Result.Button2.Dis_ColorFrom := 0;
      Result.Button2.Def_ColorTo := 32768;
      Result.Button2.Over_ColorTo := 40960;
      Result.Button2.Down_ColorTo := 0;
      Result.Button2.Dis_ColorTo := 0;
      Result.Button2.All_ColorOuter := 0;
      Result.Button2.Def_ColorText := 52224;
      Result.Button2.Over_ColorText := 65280;
      Result.Button2.Down_ColorText := 65280;
      Result.Button2.Dis_ColorText := 25600;
      Result.Button2.All_ColorShadow := 0;
      Result.Button2.Def_BorderColor := 52224;
      Result.Button2.Over_BorderColor := 65280;
      Result.Button2.Down_BorderColor := 65280;
      Result.Button2.Def_GradientStyle := gsDoubleVert;
      Result.Button2.Down_GradientStyle := gsDoubleVert;
    // Result.Button3.TabOrder = 5
      Result.Button3  :=  PGRushControl( NewGRushButton(Result.GRushPanel1, 'Load template').SetPosition( 535, 84 ).SetSize( 90, 26 ) );
   {$IFDEF USE_NAMES}
      Result.Button3.SetName( Result.Form, 'Button3' ); 
   {$ENDIF}
    Result.Button3.Font.FontHeight := 14;
      Result.Button3.Def_ColorFrom := 0;
      Result.Button3.Over_ColorFrom := 0;
      Result.Button3.Down_ColorFrom := 65280;
      Result.Button3.Dis_ColorFrom := 0;
      Result.Button3.Def_ColorTo := 32768;
      Result.Button3.Over_ColorTo := 40960;
      Result.Button3.Down_ColorTo := 0;
      Result.Button3.Dis_ColorTo := 0;
      Result.Button3.All_ColorOuter := 0;
      Result.Button3.Def_ColorText := 52224;
      Result.Button3.Over_ColorText := 65280;
      Result.Button3.Down_ColorText := 65280;
      Result.Button3.Dis_ColorText := 25600;
      Result.Button3.All_ColorShadow := 0;
      Result.Button3.Def_BorderColor := 52224;
      Result.Button3.Over_BorderColor := 65280;
      Result.Button3.Down_BorderColor := 65280;
      Result.Button3.Def_GradientStyle := gsDoubleVert;
      Result.Button3.Down_GradientStyle := gsDoubleVert;
    // Result.Button4.TabOrder = 5
      Result.Button4  :=  PGRushControl( NewGRushButton(Result.GRushPanel1, 'Save template').SetPosition( 535, 116 ).SetSize( 90, 26 ) );
   {$IFDEF USE_NAMES}
      Result.Button4.SetName( Result.Form, 'Button4' ); 
   {$ENDIF}
    Result.Button4.Font.FontHeight := 14;
      Result.Button4.Def_ColorFrom := 0;
      Result.Button4.Over_ColorFrom := 0;
      Result.Button4.Down_ColorFrom := 65280;
      Result.Button4.Dis_ColorFrom := 0;
      Result.Button4.Def_ColorTo := 32768;
      Result.Button4.Over_ColorTo := 40960;
      Result.Button4.Down_ColorTo := 0;
      Result.Button4.Dis_ColorTo := 0;
      Result.Button4.All_ColorOuter := 0;
      Result.Button4.Def_ColorText := 52224;
      Result.Button4.Over_ColorText := 65280;
      Result.Button4.Down_ColorText := 65280;
      Result.Button4.Dis_ColorText := 25600;
      Result.Button4.All_ColorShadow := 0;
      Result.Button4.Def_BorderColor := 52224;
      Result.Button4.Over_BorderColor := 65280;
      Result.Button4.Down_BorderColor := 65280;
      Result.Button4.Def_GradientStyle := gsDoubleVert;
      Result.Button4.Down_GradientStyle := gsDoubleVert;
    // Result.Button5.TabOrder = 5
      Result.Button5  :=  PGRushControl( NewGRushButton(Result.GRushPanel1, 'Clear all').SetPosition( 535, 148 ).SetSize( 90, 26 ) );
   {$IFDEF USE_NAMES}
      Result.Button5.SetName( Result.Form, 'Button5' ); 
   {$ENDIF}
      Result.Button5.Def_ColorFrom := 0;
      Result.Button5.Over_ColorFrom := 0;
      Result.Button5.Down_ColorFrom := 65280;
      Result.Button5.Dis_ColorFrom := 0;
      Result.Button5.Def_ColorTo := 32768;
      Result.Button5.Over_ColorTo := 40960;
      Result.Button5.Down_ColorTo := 0;
      Result.Button5.Dis_ColorTo := 0;
      Result.Button5.All_ColorOuter := 0;
      Result.Button5.Def_ColorText := 52224;
      Result.Button5.Over_ColorText := 65280;
      Result.Button5.Down_ColorText := 65280;
      Result.Button5.Dis_ColorText := 25600;
      Result.Button5.All_ColorShadow := 0;
      Result.Button5.Def_BorderColor := 52224;
      Result.Button5.Over_BorderColor := 65280;
      Result.Button5.Down_BorderColor := 65280;
      Result.Button5.Def_GradientStyle := gsDoubleVert;
      Result.Button5.Down_GradientStyle := gsDoubleVert;
    // Result.GRushButton1.TabOrder = 5
      Result.GRushButton1  :=  PGRushControl( NewGRushButton(Result.GRushPanel1, 'About...').SetPosition( 534, 372 ).SetSize( 90, 26 ) );
   {$IFDEF USE_NAMES}
      Result.GRushButton1.SetName( Result.Form, 'GRushButton1' ); 
   {$ENDIF}
      Result.GRushButton1.Def_ColorFrom := 0;
      Result.GRushButton1.Over_ColorFrom := 0;
      Result.GRushButton1.Down_ColorFrom := 65280;
      Result.GRushButton1.Dis_ColorFrom := 0;
      Result.GRushButton1.Def_ColorTo := 32768;
      Result.GRushButton1.Over_ColorTo := 40960;
      Result.GRushButton1.Down_ColorTo := 0;
      Result.GRushButton1.Dis_ColorTo := 0;
      Result.GRushButton1.All_ColorOuter := 0;
      Result.GRushButton1.Def_ColorText := 52224;
      Result.GRushButton1.Over_ColorText := 65280;
      Result.GRushButton1.Down_ColorText := 65280;
      Result.GRushButton1.Dis_ColorText := 25600;
      Result.GRushButton1.All_ColorShadow := 0;
      Result.GRushButton1.Def_BorderColor := 52224;
      Result.GRushButton1.Over_BorderColor := 65280;
      Result.GRushButton1.Down_BorderColor := 65280;
      Result.GRushButton1.Def_GradientStyle := gsDoubleVert;
      Result.GRushButton1.Down_GradientStyle := gsDoubleVert;
    // Result.MusButton1.TabOrder = 5
      Result.MusButton1  :=  PGRushControl( NewGRushButton(Result.GRushPanel1, 'Music OFF').SetPosition( 534, 404 ).SetSize( 90, 26 ) );
   {$IFDEF USE_NAMES}
      Result.MusButton1.SetName( Result.Form, 'MusButton1' ); 
   {$ENDIF}
      Result.MusButton1.Def_ColorFrom := 0;
      Result.MusButton1.Over_ColorFrom := 0;
      Result.MusButton1.Down_ColorFrom := 65280;
      Result.MusButton1.Dis_ColorFrom := 0;
      Result.MusButton1.Def_ColorTo := 32768;
      Result.MusButton1.Over_ColorTo := 40960;
      Result.MusButton1.Down_ColorTo := 0;
      Result.MusButton1.Dis_ColorTo := 0;
      Result.MusButton1.All_ColorOuter := 0;
      Result.MusButton1.Def_ColorText := 52224;
      Result.MusButton1.Over_ColorText := 65280;
      Result.MusButton1.Down_ColorText := 65280;
      Result.MusButton1.Dis_ColorText := 25600;
      Result.MusButton1.All_ColorShadow := 0;
      Result.MusButton1.Def_BorderColor := 52224;
      Result.MusButton1.Over_BorderColor := 65280;
      Result.MusButton1.Down_BorderColor := 65280;
      Result.MusButton1.Def_GradientStyle := gsDoubleVert;
      Result.MusButton1.Down_GradientStyle := gsDoubleVert;
      Result.Label12.OnShow := Result.Label12Show;
      Result.Label13.OnMouseDown := Result.Label13MouseDown;
      Result.Label13.OnMouseMove := Result.Label13MouseMove;
      Result.Label13.OnMouseUp := Result.Label13MouseUp;
      Result.Label13.OnMouseLeave := Result.Label13MouseLeave;
      Result.Label14.OnMouseDown := Result.Label14MouseDown;
      Result.Label14.OnMouseMove := Result.Label14MouseMove;
      Result.Label14.OnMouseUp := Result.Label14MouseUp;
      Result.Label14.OnMouseLeave := Result.Label14MouseLeave;
      Result.Label2.OnClick := Result.Label2Click;
    Result.Label2.Anchor(FALSE, FALSE, FALSE, TRUE);
    Result.EditBox1.Color := $006A00;
      Result.ScrollBar2.OnShow := Result.ScrollBar2Show;
      Result.ScrollBar2.OnSBBeforeScroll := Result.ScrollBar2SBBeforeScroll;
      Result.ScrollBar1.OnShow := Result.ScrollBar1Show;
      Result.ScrollBar1.OnSBBeforeScroll := Result.ScrollBar1SBBeforeScroll;
    Result.BWcolsedit1.Color := $006A00;
    Result.BWRowsEdit1.Color := $006A00;
    Result.ColEndEdit1.Color := $006A00;
    Result.ColStartEdit1.Color := $006A00;
    Result.EditBox2.Color := $006A00;
    Result.EditBox3.Color := $006A00;
    Result.EditBox4.Color := $006A00;
      Result.EditBox4.OnKeyChar := Result.EditBox4Char;
      Result.EditBox4.OnChange := Result.EditBox4Change;
    Result.EditBox5.Color := $006A00;
    Result.RowEndEdit1.Color := $006A00;
    Result.RowStartEdit1.Color := $006A00;
      Result.CheckBox2.OnClick := Result.CheckBox2Click;
    Result.fftrMemo1.Color := $006A00;
      Result.fftrMemo1.OnMessage := Result.fftrMemo1Message;
      Result.GifShow1.OnClick := Result.GifShow1Click;
    Result.typMemo1.Color := $006A00;
      Result.Button1.OnClick := Result.Button1Click;
      Result.Button2.OnClick := Result.Button2Click;
      Result.Button3.OnClick := Result.Button3Click;
      Result.Button4.OnClick := Result.Button4Click;
      Result.Button5.OnClick := Result.Button5Click;
    Result.fhdrMemo1.Color := $006A00;
      Result.fhdrMemo1.OnMessage := Result.fhdrMemo1Message;
      Result.GRushButton1.OnClick := Result.GRushButton1Click;
      Result.OpenSaveDialog2.WndOwner := Result.Form.GetWindowHandle;
      Result.OpenSaveDialog1.WndOwner := Result.Form.GetWindowHandle;
      Result.OpenDirDialog1.WndOwner := Result.Form.GetWindowHandle;
      Result.GRushPanel1.OnMouseDown := Result.GRushPanel1MouseDown;
    Result.GRushPanel1.Anchor(FALSE, FALSE, TRUE, TRUE);
      Result.MusButton1.OnClick := Result.MusButton1Click;
      Result.GRushButton2.OnClick := Result.GRushButton2Click;
      Result.GRushButton3.OnClick := Result.GRushButton3Click;
      Result.GRushButton4.OnClick := Result.GRushButton4Click;
    Result.Form.CenterOnParent;
    Result.KOLForm1FormCreate( Result );

end;

