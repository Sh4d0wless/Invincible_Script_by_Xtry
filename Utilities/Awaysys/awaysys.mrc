;___________________________________________
; Invincible by Xtry
; Away System
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:LOAD:{
  if ($isfile($shortfn($scriptdirawaysys.dlg))) {
    if ($version >= 5.71) {
      if ($script(awaysys.dlg) == $null) { .load -rs $shortfn($scriptdirawaysys.dlg) }
      doimportthing
      awaysys.config 
    }
    else { asincompaterror }
  }
  else { asdlgerror }
}
on *:START:{ 
  if ($isfile($shortfn($scriptdirawaysys.dlg))) {
    if ($version >= 5.71) {
      if ($script(awaysys.dlg) == $null) { .load -rs $shortfn($scriptdirawaysys.dlg) }
      if ($ascheckini == $false) { asresetdefault }
      unset %asqaway
      if (%asawaymode != Back) { assetback }
    }
    else { asincompaterror }
  }
  else { asdlgerror }
  if ($asdiagver != $asver) { asecho WARNING AwaySystem core script is incompatable with Away System dialog version }
}
on *:CONNECT:{ 
  if (Away isin %asawaymode) {
    asecho Setting to Online %asawaymode Mode: ( $+  $+ $cxs(1) $+ %asawaymsg $+  $+ $cxs(2) $+ )
    away %asawaymsg
    %asconnect.status = 1
    if ($asrini(awaysystem.log) == 1) { writeaslog  $+ $colour(action) $+ *** Set to Online %asawaymode Mode (Connected to IRC) @ $time(HH:nn:ss) $date(mm/dd/yyyy) (04 $+ %asawaymsg $+  $+ $colour(action) $+ ) }
    doastimer
  }  
  elseif ($asrini(idleaway)) { beginasidlechck | asecho AwayIdle checker started } 
}
on *:DISCONNECT:{ 
  if (%asawaymode == IdleAway) { .timer -m 1 50 assetback | .timerIdleAway off }
  unset %asconnect.status 
}
on *:JOIN:#:{ if (%asconnect.status) && ($nick == $me) { assetaway.disp | unset %asconnect.status } }
alias awaypager { if ($asrini(awaypager)) { return on }
else { return off } }
alias awaylogging { if ($asrini(awaylogging)) { return on }
else { return off } }
alias awaynotices { if ($asrini(awaynotices)) { return on }
else { return off } }
alias ascheckini { 
  if ($exists(awaysys.ini)) && (%asawaymode) { return $true }
  else { return $false }
}
alias asecho { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Away System - $1- }
alias asrini { return $readini -n awaysys.ini AwaySystem $1- }
alias aswini { writeini -n awaysys.ini AwaySystem $1- }
alias asrmini { remini awaysys.ini AwaySystem $1- }
alias assite { return #FFA @ DALnet }
alias ascalc.dev { return $calc($1 / 60) }
alias beginasidlechck { if ($asrini(idleaway)) && ($server) { resetidle | .timerIdleAway 0 10 ascheckidle } }
alias ascheckidle {  if (%asawaymode == Back) { if ($idle > $asrini(idleaway)) { .timeridleaway off | asidleawaybox } } }
alias asidleawaybox { if ($asrini(disableidledlg)) { asdoidleaway }
else { set %astimeremaining 10 | .timerascountdown 10 1 showastime | dialog -m asidleaway asidleaway } }
alias showastime {
  dec %astimeremaining
  if (%astimeremaining == 0) { dialog -x asidleaway | unset %astimeremaining | asdoidleaway | return }
  did -a asidleaway 3 Away System will enter IdleAway mode in %astimeremaining seconds
}
alias asdoidleaway { %asawaymsg = Auto IdleAway after $ascalc.dev($asrini(idleaway)) minute(s) | awaystatus.set | if ($asrini(awaynick)) { aswini oldnick2 $asrini(awaynick) } | set %asawaymode IdleAway | assetaway }
alias assetaway.disp { if ($chan(0) > 0) && (%asawaymode != StealthAway) && ($server) { $asgetawaymsg } }
alias assetback.disp { if ($chan(0) > 0) && (%asawaymode != StealthAway) && ($server) { $asgetbackmsg } }
alias assetaway { 
  .timerIdleAway off
  if ($asrini(awaysystem.log) == 1) { writeaslog  $+ $colour(action) $+ *** Set to %asawaymode Mode @ $time(HH:nn:ss) $date(mm/dd/yyyy) (4 $+ %asawaymsg $+  $+ $colour(action) $+ ) }
  %asawaytime = $ctime
  if ($server) { away %asawaymsg }
  %asawayclock = $time(HH:nn:ss)
  assetaway.disp
  if (%asawaymode != StealthAway) && ($asrini(awaynick)) { %asoldnick = $me | nick $asnickini }
  doastimer
  if (%asawaymode == StealthAway) && ($server) { asecho Setting to Stealth Away Mode ( $+  $+ $cxs(1) $+ %asawaymsg $+  $+ $cxs(2) $+ ) Pager: $+ $cxs(1) $+ $awaypager  $+ $cxs(2) $+ Logger: $+ $cxs(1) $+ $awaylogging }
  if ($asrini(savetbar)) && ($titlebar) && ($asrini(awaytbar)) { aswini savedawaytbar $titlebar }
  if ($timer(Tbar) == $null) && ($asrini(awaytbar)) { .timerTbar -o 0 1 tbar }
  tbar
  asdodeop
  if ($dialog(asconf)) { did -a asconf 304 You have entered Away Mode, some options won't be saved | did -b asconf 9,10,14,15,16,17,18,19,36,37,38,39,46,47,11,48,49,84,54,55,50,51,52,53 }
}
alias assetback { 
  %asawayback = $ctime
  if ($server == $null) || (%asawaymode == StealthAway) { asecho Setting to Back Mode - Gone for $+ $cxs(1) $awayduration }   
  if (%asoldnick) && (%asawaymode != StealthAway) { nick %asoldnick }
  if ($timer(Away)) { .timerAway off }
  if ($server) { away | assetback.disp }
  set %asawaymode Back
  awaystatus.compare
  if ($asrini(awaysystem.log) == 1) { writeaslog  $+ $colour(action) $+ *** Set to Back Mode @ $time(HH:nn:ss) $date(mm/dd/yyyy) | writeaslog - }
  if ($asrini(asidno) == $null) || ($server == $null) { unset %asoldnick }
  if ($asrini(idleaway)) { beginasidlechck }
  tbar
  unset %asawaypager.status %asawaylogging.status %asawaynotices.status %asawaymsg %asawaytime %asawayclock %asnicks* %asawayback
  resetidle
  if ($dialog(asconf)) { did -a asconf 304 You have returned to Back Mode. To re-enable disabled options, reopen this dialog }
}
alias asreset.confirm { 
  if ($?!="Reset ALL options to their default values?") { 
    dialog -x asconf
    if (Away isin %asawaymode) { assetback } 
  asresetdefault | .timer 1 0 awaysyserror Preferences have be reset } 
}
alias clearawaysystemlog { 
  if ($?!="Clear AwaySystem Logs?") { 
    if ($exists($shortfn($asrini(awaysystemlog.log)))) { .remove $shortfn($asrini(awaysystemlog.log)) }
    if ($window(@AwaySystem)) { window -c @AwaySystem }
    .timer 1 0 awaysyserror All Logs have been cleared
    updaslogsize
  }
  showasprefs
}
alias awaysystemlog {
  if ($exists($shortfn($asrini(awaysystemlog.log)))) {   
    if ($window(@AwaySystem)) { window -a @AwaySystem }
    else { window -hadk0 +tnsx @AwaySystem 90 90 }  
    clear @AwaySystem
    titlebar @AwaySystem LogViewer - $asrini(awaysystemlog.log)
    loadbuf -p @AwaySystem $shortfn($asrini(awaysystemlog.log))
    sline -a @AwaySystem 31
  }
  else { .timer 1 0 awaysyserror The AwaySystem Logfile is empty }
}
alias asredoawaymsg {
  if ($1) {
    if ($timer(Away)) { .timerAway off }
    %asawaymsg = $1-
    if ($server) { away %asawaymsg }
    if (%asawaymode == IdleAway) { set %asawaymode Away }
    assetaway.disp
    if (%asawaymode == StealthAway) || ($server == $null) { asecho Changed %asawaymode message ( $+  $+ $cxs(1) $+ %asawaymsg $+  $+ $cxs(2) $+ ) }
    tbar
    doastimer
    if ($asrini(awaysystem.log)) { writeaslog  $+ $colour(action) $+ *** Changed %asawaymode Message (04 $+ %asawaymsg $+  $+ $colour(action) $+ ) @ $time(HH:nn:ss) $date(mm/dd/yyyy) }
    if ($dialog(asconf)) { did -a asconf 304 You have changed your away message }
  }
}
alias showasprefs { if ($dialog(asconf)) { dialog -v asconf } }
alias loadawaymsg {
  if ($asrini(disableawaymsg) != 1) {
    var %msgnum = 1
    var %totalmsg = $ini(awaysys.ini,Awaymsgs,0)
    while (%msgnum <= %totalmsg) {
      did -a $1 1 $asreadmsg(%msgnum)
      inc %msgnum
    }
  }
}
alias aslogfolder {
  var %tempsdir = $$sdir="Select Folder for the AwaySystem Log file"  $iif($asrini(awaysystemlog.log), $nofile($shortfn($asrini(awaysystemlog.log))), $logdir)
  if (%tempsdir == $did(asconf,25)) { showasprefs }
  else { did -ra asconf 25 %tempsdir | showasprefs }
}
alias aspagersndselect { did -a asconf 30 $dir="AwayPager Sound" *.wav
  if ($did(asconf,30) == $null) { did -a asconf 30 No Sound }
  showasprefs
}
alias updaslogsize { if ($dialog(asconf)) { did -a asconf 306 Logfile Size: $round($calc($file($asrini(awaysystemlog.log)).size / 1024),2) KB } }
alias aslogsndselect { did -a asconf 33 $dir="AwayLog Sound" *.wav
  if ($did(asconf,33) == $null) { did -a asconf 33 No Sound }
  showasprefs
}
alias awaystatus.set {
  %asawaypager.status = $awaypager
  %asawaylogging.status = $awaylogging
  %asawaynotices.status = $awaynotices
}
alias asshowdefaway { return is Away (Reason:@awaymsg) (Since:@awaytime) (Pager:@awaypager) (Logger:@awaylog) }
alias asshowdefback { return is Back (Back from:@awaymsg) (Gone for:@awayduration) }
alias awaysyshlp {
  if ($window(@AwaySystemHelp)) { window -a @AwaySystemHelp }
  else {
    if ($exists($shortfn($scriptdirashelp.msg))) {
      clear @AwaySystemHelp
      window -haodk0 +tnsl @AwaySystemHelp -1 -1 700 400 MS Sans Serif,413
      loadbuf -p @AwaySystemHelp $shortfn($scriptdirashelp.msg)
      sline @AwaySystemHelp 22
    }
  }
  if ($1) { sline @AwaySystemHelp $1 }
}
alias asloadthemes {
  if ($exists(awaysysthemes.ini)) {
    var %themes = 1
    var %totalthemes $ini(awaysysthemes.ini,0)
    while (%themes <= %totalthemes) {
      did -a asconf 47 $replace($ini(awaysysthemes.ini,%themes),±,$chr(32))
      inc %themes
    }
  }
  did -c asconf 47 $asrini(selectedtheme) 
  if ($asrini(selectedtheme) != 1) {
    did -am asconf 55 $replace($ini(awaysysthemes.ini,$calc($asrini(selectedtheme) - 1)),±,$chr(32))
    did -a asconf 51 $astrini($calc($asrini(selectedtheme) - 1),awaymsg))
    did -a asconf 53 $astrini($calc($asrini(selectedtheme) - 1),backmsg)
    if ($astrini($calc($asrini(selectedtheme) - 1),cmd)) { did -c asconf 84 }
    if ($astrini($calc($asrini(selectedtheme) - 1),cmd) == 0) { did -u asconf 84 }
  }
}
alias asgetawaymsg {
  if ($themesini($calc($asrini(selectedtheme) - 1)) == $null) { aswini selectedtheme 1 }
  if ($asrini(selectedtheme) != 1) { 
    var %ascommand = $iif($astrini($calc($asrini(selectedtheme) -1),cmd),ame,amsg)
    var %asmessage = %ascommand $replace($astrini($calc($asrini(selectedtheme) - 1),awaymsg),@awaymsg,$+ $awaymsg $+,@awaytime,$+ $asawayclock $+,@awaypager,$+ $awaypager $+,@awaylog,$+ $awaylogging $+))
    return %asmessage
  }
  else { return ame is Away (Reason: $+ %asawaymsg $+ ) (Since: $+ %asawayclock $+ ) (Pager: $+ $awaypager $+ ) (Logger: $+ $awaylogging $+ ) - %name }
}
alias asgetbackmsg {
  if $themesini($calc($asrini(selectedtheme) - 1)) == $null) { aswini selectedtheme 1 }
  if ($asrini(selectedtheme) != 1) {
    var %ascommand = $iif($astrini($calc($asrini(selectedtheme) - 1),cmd),ame,amsg)
    var %asmessage = %ascommand $replace($astrini($calc($asrini(selectedtheme) - 1),backmsg),@awaymsg,$+ $awaymsg $+,@awaytime,$+ $asawayclock $+,@awayduration,$+ $awayduration $+))
    return %asmessage
  }
  else { return ame is Back ( $+ From: $+ %asawaymsg $+ ) (Gone for: $+ $awayduration $+ ) - %name }
}
alias themesini { 
  if ($exists(awaysysthemes.ini)) {
    return $ini(awaysysthemes.ini,$1)
  }
}
alias astrini { 
  var %readini $readini -n awaysysthemes.ini $themesini($1) $2-
  return $replace(%readini,$chr(152),$chr(3),$chr(176),$chr(2),$chr(175),$chr(31),$chr(247),$chr(22))
}
alias astwini { writeini -n awaysysthemes.ini $themesini($1) $replace($2-,$chr(3),$chr(152),$chr(2),$chr(176),$chr(31),$chr(175),$chr(22),$chr(247)) }
alias astwini2 { writeini -n awaysysthemes.ini $1 $replace($2-,$chr(3),$chr(152),$chr(2),$chr(176),$chr(31),$chr(175),$chr(22),$chr(247)) }
alias astrmini { remini awaysysthemes.ini $themesini($1-) }
alias awaysys.config { 
  if ($dialog(asconf) == $null) { dialog -md asconf asconf }
  else { showasprefs }
}
alias asgoaway { $dialog(asawaydiag,asawaydiag) }
alias asdoeditboxchk {
  if ($len($did(1)) < 100) { did -a $dname 4 $len($did(1)) }
  if ($len($did(1)) == 100) { did -a $dname 4 Max }
  if ($len($did(1)) > 100) { did -a $dname 4 Max | beep 1 }
}
alias asversion { return AwaySystem 3 version $asver }
alias asver { return 3.00.2032 }
alias asrandomawaysel {
  did -a asconf 69 $file="Choose text document for RandomAway" *.txt | did -a asconf 70 &Open
  if ($did(asconf,69) == $null) { did -a asconf 69 Disable RandomAway | did -a asconf 70 &New }
  showasprefs
}
alias awaysyserror { 
  if ($asrini(disableerrordialog) != 1) { set %awaysyserror $1- | beep 1 | $dialog(awaysyserror,awaysyserror,-4) }
  else { asecho $1- }
}
alias clearawaysysnicks {
  if ($?!="This clears stored Away Nicks & messages. $crlf Do you wish to Continue?") { remini awaysys.ini Awaynicks | remini awaysys.ini Awaymsgs | var %awaynick = $did(asconf,37) | did -rac asconf 37 %awaynick | .timer 1 0 awaysyserror All AwayNicks && Away Messages cleared }
  showasprefs
}
alias awaysysabout { $dialog(asabout,asabout,-4) }
alias asreadmsg { return $readini -n awaysys.ini Awaymsgs $1- }
alias doasprefinit {
  if ($themesini($calc($asrini(selectedtheme) - 1)) == $null) { aswini selectedtheme 1 }
  if ($exists(awaysysthemes.ini) == $false) && ($asrini(selectedtheme) != 1) { aswini selectedtheme 1 }
  updaslogsize 
  did -am $dname 25 $nofile($asrini(awaysystemlog.log))
  if ($asrini(disableversionreply)) { did -c $dname 73 }
  if ($asrini(disableerrordialog)) { did -c $dname 74 }
  if ($asrini(disablelasttab)) { did -c $dname 75 }
  if ($asrini(disableawaynick)) { did -c $dname 76 }
  if ($asrini(disableidledlg)) { did -c $dname 87 }
  if (Away !isin %asawaymode) {
    if ($asrini(awaypager)) { did -c $dname 2 }
    if ($asrini(awaylogging)) { did -c $dname 6 }
    if ($asrini(awaypager) != 1) { did -b $dname 3,4 }
    if ($asrini(awaylogging) != 1) { did -b $dname 7,8,9,10,86 }
    if ($asrini(awaynotices)) { did -c $dname 7 }
    if ($asrini(awaynick)) { did -c $dname 36 | did -ace $dname 37 $asrini(awaynick) }
  }
  if ($asrini(selectedtheme) == 1) {
    did -ra $dname 55 %name2
    did -ra $dname 51 $asshowdefaway
    did -ra $dname 53 $asshowdefback
    did -c asconf 84 | did -m $dname 55,51,53 | did -b $dname 48,49,84
  }
  if ($lock(run)) { did -b $dname 70,213,214,215 | did -a $dname 304 /run command locked }
  did -a $dname 77 Current Theme: $asgetthemename
  did -a $dname 47 %name2
  asloadthemes
  loadasnicks $dname 37
  if ($asrini(awaydeop)) { did -c $dname 91 }
  if ($asrini(awayactions)) { did -c $dname 8 }
  if ($asrini(ctcppage)) { did -c $dname 3 }
  if ($asrini(ctcpreply)) { did -c $dname 4 }
  if ($asrini(notify)) { did -c $dname 9 }
  if ($asrini(notify) == 0) { did -b $dname 10 }
  if ($asrini(awaytbar)) { did -c $dname 16 }
  if ($asrini(awaytbar) != 1) { did -b $dname 17 }
  if ($asrini(savetbar)) { did -c $dname 17 }
  if ($asrini(asinputback)) { did -c $dname 20 }
  if ($asrini(awaysystem.log)) { did -c $dname 22 }
  if ($asrini(closemsg)) { did -c $dname 86 }
  if ($asrini(asidno)) { did -c $dname 40 | did -a $dname 41 $asrini(asidno) }
  if ($asrini(asidno) == $null) { did -b $dname 41 }
  if ($asrini(asquietid)) { did -c $dname 42 }
  if ($asrini(awaynick) == $null) { did -bac $dname 37 $asrini(oldnick1) }
  if ($lock(run)) { did -b $dname 70 }
  if ($asrini(sendnotices)) { did -c $dname 10 }
  did -c $dname 15 $getdroptime($asrini(awaytimer))
  did -c $dname 19 $getdroptime($asrini(idleaway))
  if ($asrini(awaypager.snd)) { did -a $dname 30 $asrini(awaypager.snd) }
  if ($asrini(awaylog.snd)) { did -a $dname 33 $asrini(awaylog.snd) }
  var %presets = 1
  var %totalpresets $ini(awaysys.ini,Presets,0)
  while (%presets <= %totalpresets) {
    did -a $dname 59 $replace($ini(awaysys.ini,Presets,%presets),±,$chr(32))
    inc %presets
  }
  did -c $dname 59 1
  did -ra $dname 83 $replace($ini(awaysys.ini,Presets,$did(59).sel),±,$chr(32))
  did -ra $dname 63 $asprini($did(59).sel)
  if ($did(59).sel) { did -m $dname 83 }
  if ($asrini(randomaway)) { did -a $dname 69 $asrini(randomaway) }
  if ($asrini(randomaway) != Disable RandomAway) && ($asrini(randomaway)) { did -a $dname 70 &Open }
  if (Away isin %asawaymode) { 
    did -a $dname 304 Away Mode status - Some options won't be saved
    did -bm $dname 9,10,14,15,16,17,18,19,37,38,39,46,47,11,48,49,84,54,55,50,51,52,53
    if (%asawaypager.status == on) { did -c $dname 2 }
    if (%asawaypager.status == off) { did -b $dname 3,4 }    
    if (%asawaylogging.status == on) { did -c $dname 6 }
    if (%asawaylogging.status = off) { did -b $dname 7,8,9,86 }
    if (%asawaynotices.status == on) { did -c $dname 7 }
    if ($asrini(oldnick2)) { did -cb $dname 36 | did -abc $dname 37 $asrini(oldnick2) }
    else { did -abc $dname 37 $asrini(oldnick1) | did -b $dname 36 }
  }
}
alias getdroptime {
  if ($1 == 60) { return 1 }
  if ($1 == 120) { return 2 }
  if ($1 == 180) { return 3 }
  if ($1 == 300) { return 4 }
  if ($1 == 600) { return 5 }
  if ($1 == 900) { return 6 }
  if ($1 == 1200) { return 7 }
  if ($1 == 1500) { return 8 }
  if ($1 == 1800) { return 9 }
  if ($1 == 2700) { return 10 }
  if ($1 == 3600) { return 11 }
  if ($1 == 7200) { return 12 }
  if ($1 == 10800) { return 13 }
  if ($1 == 14400) { return 14 }
  if ($1 == 18000) { return 15 }
  if ($1 == 21600) { return 16 }
  if ($1 == 0) { return 17 }
}
alias asdroptime {
  if ($1 == 1) { return 60 }
  if ($1 == 2) { return 120 }
  if ($1 == 3) { return 180 }
  if ($1 == 4) { return 300 }
  if ($1 == 5) { return 600 }
  if ($1 == 6) { return 900 }
  if ($1 == 7) { return 1200 }
  if ($1 == 8) { return 1500 }
  if ($1 == 9) { return 1800 }
  if ($1 == 10) { return 2700 }
  if ($1 == 11) { return 3600 }
  if ($1 == 12) { return 7200 }
  if ($1 == 13) { return 10800 }
  if ($1 == 14) { return 14400 }
  if ($1 == 15) { return 18000 }
  if ($1 == 16) { return 21600 }
  if ($1 == 17) { return 0 }
}
alias asgetthemename {
  if ($exists(awaysysthemes.ini) && $asrini(selectedtheme) > 1) { return $replace($themesini($calc($asrini(selectedtheme) - 1)),±,$chr(32)) }
  else { return %name2 }
}
alias asprini { return $readini -n awaysys.ini Presets $ini(awaysys.ini,Presets,$1-) }
alias aspwini { writeini -n awaysys.ini Presets $ini(awaysys.ini,Presets,$1) $2- }
alias asprmini { remini awaysys.ini Presets $ini(awaysys.ini,Presets,$1-) }
alias awaydiag { $dialog(asawaydiag1,asawaydiag1) }
alias asreadnick { return $readini -n awaysys.ini Awaynicks $1- }
alias writenicks { 
  if ($asrini(disableawaynick) != 1) {
    var %totalnicks = $ini(awaysys.ini,Awaynicks,0)
    var %nicknum = 1
    while (%nicknum <= $calc(%totalnicks + 1)) {
      if ($asreadnick(%nicknum) == $1) { break }
      if ($asreadnick(%nicknum) == $null) { writeini -n awaysys.ini Awaynicks $calc($ini(awaysys.ini,Awaynicks,0) + 1) $1 | break }
      inc %nicknum
    }
  }
}
alias loadasnicks {
  if ($asrini(disableawaynick) != 1) {
    var %nicknum = 1
    var %totalnicks = $ini(awaysys.ini,Awaynicks,0)
    while (%nicknum <= %totalnicks) {
      if ($dialog(asconf)) && ($did(asconf,37) == $asreadnick(%nicknum)) { goto jump }
      if ($dialog(asawaydiag)) && ($did(asawaydiag,105) == $asreadnick(%nicknum)) { goto jump }
      did -a $1 $2 $asreadnick(%nicknum)
      :jump
      inc %nicknum
    }
  }
}
alias asresetdefault { asrmini | set %asawaymode Back | aswini awaypager 1 | aswini awaylogging 1 | aswini awaynotices 1 | aswini awaysystemlog.log $logdir $+ awaysys.log | aswini closemsg 1 | aswini notify 1 | aswini awaytbar 1 | aswini ctcppage 1
  aswini ctcpreply 1 | aswini awayactions 1 | aswini savetbar 1 | aswini sendnotices 1 | aswini awaytimer 2700 | aswini idleaway 0 | aswini randomaway Disable RandomAway | aswini selectedtheme 1 | asverno | unset %asqaway %asnicks*
}
alias -l doimportthing {
  if ($exists(awaysys.ini)) && ($asrini(awaysysver) >= $asver) && ($?!="Existing settings file exist, Import them?") { asimport }
  else { asresetdefault }
}
alias -l asdodeop {
  if ($asrini(awaydeop)) {
    var %channum = 1
    var %totalchans = $chan(0)
    while (%channum <= %totalchans) {
      if ($me isop $chan(%channum)) { mode $chan(%channum) -o $me }
      inc %channum
    }
  }
}
alias -l awaymsg { return %asawaymsg }
alias -l asawayclock { return %asawayclock }
alias -l awayduration { return $duration($calc(%asawayback - %asawaytime)) }
alias -l asnickini { return $replace($asrini(awaynick),@me,$me) }
alias -l asverno { aswini awaysysver $asver }
alias -l asdlgerror { asecho Initilization failed. ' $+ $scriptdirawaysys.dlg' can't be found | .unload -rs $nopath($script) }
alias -l asincompaterror { asecho Error! $asversion will not work on mIRC $version mIRC 5.71 or later is required. | unload -rs $nopath($script) }
alias -l writeaslog {
  if ($asrini(awaysystemlog.log)) { write " $+ $asrini(awaysystemlog.log) $+ " $1- | updateaslogwindow }
  else { .timer 1 0 awaysyserror Log folder became unset and has been disabled | aswini awaysystem.log 0 | aswini awaysystemlog.log $logdirawaysys.log }
}
alias -l playaslogsnd { 
  if ($asrini(awaylog.snd) == Default Beep) { beep }
  else { if ($isfile($asrini(awaylog.snd))) { splay $shortfn($asrini(awaylog.snd)) } }
}
alias -l playaspagesnd {
  if ($asrini(awaypager.snd) == Default Beep) { beep }
  else { if ($isfile($asrini(awaypager.snd))) { splay $shortfn($asrini(awaypager.snd)) } }
}
alias -l doastimer { if ($asrini(awaytimer)) && (%asawaymode != StealthAway) && ($server) { .timerAway 0 $asrini(awaytimer) assetaway.disp } }
alias -l tbar { 
  if ($asrini(awaytbar)) {
    if (Away isin %asawaymode) {
      if (%asawaymode != Back) { titlebar - $iif($server,Online,Offline) %asawaymode Mode ( $+ %asawaymsg $+ ) for $duration($calc($ctime - %asawaytime)) - AwayPager $awaypager $+ , AwayLog $iif($awaynotices == on,& NoticeLog) $awaylogging }
    }
    else {
      if ($asrini(savedawaytbar)) { titlebar $asrini(savedawaytbar) | asrmini savedawaytbar }
      else { titlebar }
      .timerTbar off
    }
  }
}
alias -l updateaslogwindow {
  if ($window(@AwaySystem)) && ($asrini(awaysystemlog.log)) { 
    clear @AwaySystem
    if ($exists($shortfn($asrini(awaysystemlog.log)))) { loadbuf -p @AwaySystem " $+ $asrini(awaysystemlog.log) $+ " }
  }
  updaslogsize
} 
alias -l awaystatus.compare {
  if ($asrini(oldnick2) == $null) { asrmini awaynick }
  if ($asrini(oldnick2)) { aswini awaynick $asrini(oldnick2) | asrmini oldnick2 }
  if (%asawaypager.status == on) { aswini awaypager 1 }
  if (%asawaylogging.status == on) { aswini awaylogging 1 }
  if (%asawaynotices.status == on) { aswini awaynotices 1 }
  if (%asawaypager.status == off) { aswini awaypager 0 }
  if (%asawaylogging.status == off) { aswini awaylogging 0 }
  if (%asawaynotices.status == off) { aswini awaynotices 0 }
  unset %asawaypager.status %asawaylogging.status %asawaynotices.status
}
alias -l asawaynotice {
  if ($asrini(notify)) {
    if ($nick isin %asnicks) { return }
    else {
      if ($asrini(sendnotices)) { %asnicks = %asnicks $nick }
      notice.p $nick (Away System) I'm currently away ( $+ %asawaymsg $+ ), your message has been logged - %name
      if ($awaypager == on) { notice.p $nick (Away System) If your message is urgent, you may page me by typing /ctcp $me PAGE <yourmessage> - %name }
    }
  }
}
ctcp &*:VERSION:if ($asrini(disableversionreply) != 1) { .ctcpreply $nick VERSION (Away System) created by %auname - %name }
ctcp *:PAGE:{ if ($asrini(awaypager)) {
    if (Away isin %asawaymode) || ($asrini(ctcppage)) {
      if ($nick != $me) { 
        var %temppage $time(HH:nn:ss) $date(m/d/yyyy)  $+ $colour(CTCP) $+ Page:12 $nick $+ :  $2-
        playaspagesnd
        if ($window(@AwayPager) == $null) { window -ng2 @AwayPager }
        aline -hp @AwayPager %temppage
        if ($asrini(awaysystem.log)) { writeaslog %temppage }
        if ($asrini(ctcpreply)) { ctcpreply $nick PAGE (Away System) Your page has been logged! }
      }
    }
  } 
}
on *:TEXT:*:?:{
  if (Away isin %asawaymode) && ($nick != $me) && ($asrini(awaylogging)) { 
    var %temppriv $time(HH:nn:ss) $date(m/d/yyyy) PrivMessage: <4 $+ $nick $+ > $1-
    if ($window(@AwayLog) == $null) { window -ng1 @AwayLog }
    if ($asrini(awaylog.snd)) { playaslogsnd }
    if ($asrini(awaysystem.log)) { writeaslog %temppriv }
    aline -hp @AwayLog %temppriv
    if ($asrini(closemsg)) { close -m $nick }
    asawaynotice
  }
}
on *:TEXT:*:#:{
  if (Away isin %asawaymode) && ($me isin $1-) && ($asrini(awaylogging)) { 
    var %tempmsg $time(HH:nn:ss) $date(m/d/yyyy) 13ChanMessage: <3 $+ $chan $+ 12\4 $+ $nick $+ > $1-
    if ($window(@AwayLog) == $null) { window -ng1 @AwayLog }
    if ($asrini(awaylog.snd)) { playaslogsnd }
    if ($asrini(awaysystem.log)) { writeaslog  %tempmsg }    
    aline -hp @AwayLog %tempmsg
    asawaynotice
  }
}
on *:ACTION:*:?:{
  if (Away isin %asawaymode) && ($nick != $me) && ($asrini(awaylogging)) && ($asrini(awayactions)) { 
    var %tempprivaction $time(HH:nn:ss) $date(m/d/yyyy) PrivAction: $+ $colour(action) * $nick $1-
    if ($window(@AwayLog) == $null) { window -ng1 @AwayLog }
    if ($asrini(awaylog.snd)) { playaslogsnd }
    if ($asrini(awaysystem.log)) { writeaslog %tempprivaction }
    aline -hp @AwayLog %tempprivaction
    if ($asrini(closemsg)) { close -m $nick }
    asawaynotice
  }
}
on *:ACTION:*:#:{
  if (Away isin %asawaymode) && ($me isin $1-) && ($asrini(awaylogging)) && ($asrini(awayactions)) { 
    var %tempaction $time(HH:nn:ss) $date(m/d/yyyy) 13ChanAction: $+ $colour(action) * $chan $+ 12\ $+ $colour(action) $+ $nick $1-
    if ($window(@AwayLog) == $null) { window -ng1 @AwayLog }
    if ($asrini(awaylog.snd)) { playaslogsnd }
    if ($asrini(awaysystem.log)) { writeaslog  %tempaction }    
    aline -hp @AwayLog %tempaction
    asawaynotice
  }
}
on *:NOTICE:*:*:{
  if (Away isin %asawaymode) && ($nick != $me) && ($asrini(awaylogging)) && ($asrini(awaynotices)) { 
    var %tempnotice $time(HH:nn:ss) $date(mm/dd/yyyy) Notice:  $+ $colour(notice) $+ - $+ $nick $+ - $1-
    if ($window(@AwayLog) == $null) { window -ng1 @AwayLog }
    if ($asrini(awaylog.snd)) { playaslogsnd }
    if ($asrini(awaysystem.log)) { writeaslog %tempnotice }
    aline -hp @AwayLog %tempnotice
  }
}
on *:INPUT:#:{ if (Away isin %asawaymode) && ($asrini(asinputback)) { assetback } }
on *:NICK:{
  if ($nick == $me) && ($asrini(asidno)) {
    if ($newnick == %asoldnick) { 
      if ($asrini(asquietid) == 0) { asecho Identifying to NickServ }
    nickserv identify %asoldnick $asrini(asidno) | unset %asoldnick }
  }
}
dialog asidleaway {
  title "About to enter IdleAway Mode"
  icon graph/awaysys.ico
  size -1 -1 180 52 
  option dbu
  icon 4, 10 10 20 20
  text "AwaySystem will enter IdleAway mode in 10 seconds", 3, 25 15 140 7, center
  button "&Abort!", 1, 50 35 35 12, ok
  button "&Go Now!", 2, 90 35 35 12, cancel default
}
on *:DIALOG:asidleaway:init:0:{
  if ($exists($shortfn($scriptdiryield.ico))) { did -g $dname 4 $shortfn($scriptdiryield.ico) }
}
dialog asuwiz {
  title "AwaySystem Uninstall Wizard"
  icon graph/awaysys.ico
  size -1 -1 260 160
  option dbu
  box "", 3, -1 -4 263 36
  icon 4, 0 1 30 30
  text "AwaySystem Uninstall Wizard - Select Options", 5, 38 13 200 7
  text "Select the Type of uninstall. If custom is selected, choose options below then click Next.", 22, 9 40 240 7
  check "Unload AwaySystem script files", 10, 15 60 82 7, disable
  check "Remove awaysys.ini file", 11, 15 70 110 7
  check "Remove awaysysthemes.ini file", 12, 15 80 120 7
  check "Remove awaysys.log file", 13, 140 60 100 7
  check "Remove Icon && Help files", 14, 140 70 90 7
  check "Remove AwaySystem script files", 15, 140 80 90 7
  text "Type of Uninstall:", 7, 75 110 45 7
  radio "Automatic", 20, 120 110 33 7, group
  radio "Custom", 21, 160 110 28 7
  box "", 6, -1 133 263 30
  button "&Finish", 9, 175 142 35 12, ok hide
  button "&Cancel", 1, 175 142 35 12, default
  button "&Next >>", 2, 215 142 35 12
}
on *:DIALOG:asuwiz:init:0:did -bc $dname 10,11,12,13,14,15 | did -c $dname 20 | if ($exists($shortfn($scriptdirmmircs.bmp))) { did -g $dname 4 $shortfn($scriptdirmmircs.bmp) }
on *:DIALOG:asuwiz:sclick:1:{ dialog -x $dname | .timer 1 0 awaysys.config }
on *:DIALOG:asuwiz:sclick:2:{
  did -b $dname 1,2,7,10,11,12,13,14,15,20,21
  if (Away isin %asawaymode) { did -a $dname 6 Removing Away status from IRC for uninstall... | assetback }
  if ($did(13).state) { .remove $shortfn($asrini(awaysystemlog.log)) | did -a $dname 6 Deleting Log File }
  if ($did(12).state) { .remove awaysysthemes.ini | did -a $dname 6 Removing themes file }
  if ($did(11).state) { .remove awaysys.ini | did -a $dname 6 Removing awaysys.ini Configuration file }
  if ($timer(IdleAway)) { .timerIdleAway off }
  if ($did(14).state) { .remove $shortfn($scriptdirmmircs.bmp) | .remove $shortfn($scriptdiryield.ico) | .remove $shortfn($scriptdirashelp.msg) | did -a $dname 6 Removing Icon && Help files.. }
  did -a $dname 6 Unsetting varibles | unset %asoldnick %asaway* %asqaway %asnicks* 
  if ($did(15).state) { did -a $dname 6 Removing Script files | .remove $shortfn($scriptdirawaysys.mrc) | .remove $shortfn($scriptdirawaysys.dlg) }
  did -a $dname 6 Unloading AwaySystem Script from mIRC | .unload -rs $nopath(awaysys.dlg) | did -a $dname 5 AwaySystem Uninstall Wizard - Success! | did -a $dname 6 AwaySystem Uninstall was successful. Please click Finish to close this dialog and return to mIRC | did -h $dname 1 | did -v $dname 9 | did -b $dname 2,1,22 | .unload -rs $nopath(awaysys.mrc)
}
on *:DIALOG:asuwiz:sclick:20:did -bc $dname 11,12,13,14,15
on *:DIALOG:asuwiz:sclick:21:did -eu $dname 11,12,13,14,15


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
