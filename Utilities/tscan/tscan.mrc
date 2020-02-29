;___________________________________________
; Invincible by Xtry
; Trojan Scanner
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

; Installation
; Put the tscan folder into your mIRC's main directory, open your mIRC and type /load -rs tscan/tscan.mrc
; If you put the tscan folder into your mIRC's sub-directory, you must type /load -rs sub-directory/tscan/tscan.mrc

; Load event (mIRC 5.71 or higher required)
on *:load:{
  if ($version < 5.71) {
    .unload -rs $shortfn($scriptdir) $+ ghost.mrc
    echo -a * Trojan Scanner 1.0 require mIRC version 5.71 or higher.
    echo -a * Your mIRC version is $version $+ . Please upgrade your mIRC version.
    echo -a * Installation canceled & script unloaded.
  }
  else {
    echo -a * Trojan Scanner 1.0 has been sucessfully loaded.
    echo -a * Type /tscan to open the dialog.
    wtscanctxt2 -c
  }
}

; Syntax /tscan
alias tscan { if ($dialog(troscan)) dialog -v troscan | else dialog -m troscan troscan }


; Aliases
alias -l tscandir { return $shortfn($scriptdir) }
alias -l tscandirtxt { return $shortfn($scriptdirtscanlog.txt) }
alias -l tscandirctxt { return $shortfn($scriptdirchan.txt) }
alias -l rtscandirctxt { return $read($tscandirctxt,w,$1) }
alias -l wtscanctxt1 { write $tscandirctxt $1 }
alias -l wtscanctxt2 { write $1 $tscandirctxt }
alias -l wtscanctxt3 { write $tscandirtxt $1- }
alias -l tscandirini { return $shortfn($scriptdirtscan.ini) }
alias -l wtscanini { writeini -n $tscandirini $1 $2 $3 }
alias -l rtscanini { return $readini($tscandirini,$1,$2) }
alias -l ctscanlog { if ($lines($tscandirtxt) < 1) { did -b troscan 39 } | else { did -e troscan 39 } }

; Alias for channel list in dialog
alias -l tscancini {
  var %tschan = 0
  while (%tschan < $lines($tscandirctxt)) {
    inc %tschan 1
    { did -a $dname 27 $read($tscandirctxt,%tschan) }
  }
}

; Alias for sclick in dialog (enable all)
alias -l tscanok {
  did -c $dname 1 | wtscanini set nb on
  did -c $dname 2 | wtscanini set nbp on
  did -c $dname 3 | wtscanini set s7 on
  did -c $dname 4 | wtscanini set s7g on
  did -c $dname 5 | wtscanini set bo on
  did -c $dname 6 | wtscanini set tt on
  did -c $dname 7 | wtscanini set inc on
  did -c $dname 8 | wtscanini set p3128 on
  did -c $dname 9 | wtscanini set ku on
  did -c $dname 10 | wtscanini set fo on
  did -c $dname 11 | wtscanini set wg on
  did -c $dname 12 | wtscanini set p8080 on
  did -c $dname 13 | wtscanini set gf on
  did -c $dname 14 | wtscanini set und on
  did -c $dname 15 | wtscanini set y3k on
  did -c $dname 16 | wtscanini set sb on
  did -c $dname 17 | wtscanini set hack on
  did -c $dname 18 | wtscanini set dt on
}

; Alias for sclick in dialog (disable all)
alias -l tscanko {
  did -u $dname 1 | wtscanini set nb off
  did -u $dname 2 | wtscanini set nbp off
  did -u $dname 3 | wtscanini set s7 off
  did -u $dname 4 | wtscanini set s7g off
  did -u $dname 5 | wtscanini set bo off
  did -u $dname 6 | wtscanini set tt off
  did -u $dname 7 | wtscanini set inc off
  did -u $dname 8 | wtscanini set p3128 off
  did -u $dname 9 | wtscanini set ku off
  did -u $dname 10 | wtscanini set fo off
  did -u $dname 11 | wtscanini set wg off
  did -u $dname 12 | wtscanini set p8080 off
  did -u $dname 13 | wtscanini set gf off
  did -u $dname 14 | wtscanini set und off
  did -u $dname 15 | wtscanini set y3k off
  did -u $dname 16 | wtscanini set sb off
  did -u $dname 17 | wtscanini set hack off
  did -u $dname 18 | wtscanini set dt off
}

; Dialog
dialog troscan {
  ; Title & size
  title Trojan Scanner
  icon graph/tro.ico
  size -1 -1 670 218

  ; Settings
  check "Netbus",1,15 25 80 15
  check "Netbus Pro",2,15 50 80 15
  check "Sub7",3,15 75 80 15
  check "Sub7 2.2",4,15 100 80 15
  check "Back Orifice",5,15 125 80 15
  check "The Thing",6,15 150 80 15
  check "Incommand",7,100 25 80 15
  check "Proxy 3128",8,100 50 80 15
  check "Kuang",9,100 75 80 15
  check "Fore",10,100 100 80 15
  check "Wingate",11,100 125 80 15
  check "Proxy 8080",12,100 150 80 15
  check "Girlfriend",13,190 25 80 15
  check "Undetected",14,190 50 80 15
  check "Y3K",15,190 75 80 15
  check "Schoolbus",16,190 100 80 15
  check "Hack'a'tack",17,190 125 80 15
  check "Deep Throat",18,190 150 80 15

  ; Channel
  combo 27,288 25 120 145
  check "All Channel",28,415 145 70 20,push
  button "Add",29,415 45 70 20,disable
  button "Rem",30,415 65 70 20,disable

  ; Options
  check "Log Trojan Info",32,504 25 150 15
  check "Kick Ban User",34,504 50 90 15
  check "Op",35,550 75 55 15,disable
  check "Voice",36,550 100 55 15,disable
  check "Regular",37,550 125 55 15,disable
  button "View Log",38,504 145 70 20
  button "Clear Log",39,582 145 70 20

  ; Box
  box "Settings :",20,5 5 275 173
  box "Channel :",25,278 5 218 173
  box "Options :",31,494 5 170 173
  box "",21,5 170 659 43

  ; Buttons
  button "Enable All",22,15 185 70 20
  button "Disable All",23,85 185 70 20
  button "Close",24,582 185 70 20,ok
}

; Init event for dialog
on *:dialog:troscan:init:*:{

  ; Checking settings
  if ($rtscanini(set,nb) = on) { did -c $dname 1 } | else { did -u $dname 1 }
  if ($rtscanini(set,nbp) = on) { did -c $dname 2 } | else { did -u $dname 2 }
  if ($rtscanini(set,s7) = on) { did -c $dname 3 } | else { did -u $dname 3 }
  if ($rtscanini(set,s7g) = on) { did -c $dname 4 } | else { did -u $dname 4 }
  if ($rtscanini(set,bo) = on) { did -c $dname 5 } | else { did -u $dname 5 }
  if ($rtscanini(set,tt) = on) { did -c $dname 6 } | else { did -u $dname 6 }
  if ($rtscanini(set,inc) = on) { did -c $dname 7 } | else { did -u $dname 7 }
  if ($rtscanini(set,p3128) = on) { did -c $dname 8 } | else { did -u $dname 8 }
  if ($rtscanini(set,ku) = on) { did -c $dname 9 } | else { did -u $dname 9 }
  if ($rtscanini(set,fo) = on) { did -c $dname 10 } | else { did -u $dname 10 }
  if ($rtscanini(set,wg) = on) { did -c $dname 11 } | else { did -u $dname 11 }
  if ($rtscanini(set,p8080) = on) { did -c $dname 12 } | else { did -u $dname 12 }
  if ($rtscanini(set,gf) = on) { did -c $dname 13 } | else { did -u $dname 13 }
  if ($rtscanini(set,und) = on) { did -c $dname 14 } | else { did -u $dname 14 }
  if ($rtscanini(set,y3k) = on) { did -c $dname 15 } | else { did -u $dname 15 }
  if ($rtscanini(set,sb) = on) { did -c $dname 16 } | else { did -u $dname 16 }
  if ($rtscanini(set,hack) = on) { did -c $dname 17 } | else { did -u $dname 17 }
  if ($rtscanini(set,dt) = on) { did -c $dname 18 } | else { did -u $dname 18 }

  ; Checking channel
  if ($rtscanini(opt,all) = on) { did -c $dname 28 } | else { did -u $dname 28 }
  tscancini

  ; Checking options
  if ($rtscanini(opt,log) = on) { did -c $dname 32 } | else { did -u $dname 32 }
  if ($rtscanini(opt,kb) = on) { did -c $dname 34 | did -e $dname 35,36,37 } | else { did -u $dname 34 | did -b $dname 35,36,37 }
  if ($rtscanini(opt,kbop) = on) { did -c $dname 35 } | else { did -u $dname 35 }
  if ($rtscanini(opt,kbvo) = on) { did -c $dname 36 } | else { did -u $dname 36 }
  if ($rtscanini(opt,kbreg) = on) { did -c $dname 37 } | else { did -u $dname 37 }
  ctscanlog
}

; Sclick event for dialog
on *:dialog:troscan:sclick:*:{
  ; Settings
  if ($did = 1) { if ($did($dname,$did).state == 1) { wtscanini set nb on } | else { wtscanini set nb off } }
  if ($did = 2) { if ($did($dname,$did).state == 1) { wtscanini set nbp on } | else { wtscanini set nbp off } }
  if ($did = 3) { if ($did($dname,$did).state == 1) { wtscanini set s7 on } | else { wtscanini set s7 off } }
  if ($did = 4) { if ($did($dname,$did).state == 1) { wtscanini set s7g on } | else { wtscanini set s7g off } }
  if ($did = 5) { if ($did($dname,$did).state == 1) { wtscanini set bo on } | else { wtscanini set bo off } }
  if ($did = 6) { if ($did($dname,$did).state == 1) { wtscanini set tt on } | else { wtscanini set tt off } }
  if ($did = 7) { if ($did($dname,$did).state == 1) { wtscanini set inc on } | else { wtscanini set inc off } }
  if ($did = 8) { if ($did($dname,$did).state == 1) { wtscanini set p3128 on } | else { wtscanini set p3128 off } }
  if ($did = 9) { if ($did($dname,$did).state == 1) { wtscanini set ku on } | else { wtscanini set ku off } }
  if ($did = 10) { if ($did($dname,$did).state == 1) { wtscanini set fo on } | else { wtscanini set fo off } }
  if ($did = 11) { if ($did($dname,$did).state == 1) { wtscanini set wg on } | else { wtscanini set wg off } }
  if ($did = 12) { if ($did($dname,$did).state == 1) { wtscanini set p8080 on } | else { wtscanini set p8080 off } }
  if ($did = 13) { if ($did($dname,$did).state == 1) { wtscanini set gf on } | else { wtscanini set gf off } }
  if ($did = 14) { if ($did($dname,$did).state == 1) { wtscanini set und on } | else { wtscanini set und off } }
  if ($did = 15) { if ($did($dname,$did).state == 1) { wtscanini set y3k on } | else { wtscanini set y3k off } }
  if ($did = 16) { if ($did($dname,$did).state == 1) { wtscanini set sb on } | else { wtscanini set sb off } }
  if ($did = 17) { if ($did($dname,$did).state == 1) { wtscanini set hack on } | else { wtscanini set wg off } }
  if ($did = 18) { if ($did($dname,$did).state == 1) { wtscanini set dt on } | else { set wtscanini set dt off } }

  ; Enable all
  if ($did = 22) { tscanok }

  ; Disable all
  if ($did = 23) { tscanko }

  ; Channel config
  if ($did = 27) {
    if ($did($dname,27).sel isnum) && ($did($dname,27).text != $null) { did -e $dname 30 }
    else { did -b $dname 30 }
  }
  if ($did = 28) { if ($did($dname,$did).state == 1) { wtscanini opt all on } | else { wtscanini opt all off } }
  if ($did = 29) {
    if ($did($dname,27).text != $null) && ($left($did($dname,27).text,1) = $chr(35)) { wtscanctxt1 $did($dname,27).text | did -r $dname 27 | tscancini }
    else { beep }
  }
  if ($did = 30) {
    if ($did($dname,27).sel isnum) && ($did($dname,27).text != $null) { wtscanctxt2 -ds $+ $did($dname,27).text | did -r $dname 27 | tscancini }
    else { beep }
  }

  ; Options
  if ($did = 32) { if ($did($dname,$did).state == 1) { wtscanini opt log on } | else { wtscanini opt log off } }
  if ($did = 34) { if ($did($dname,$did).state == 1) { did -e $dname 35,36,37 | wtscanini opt kb on } | else { did -b $dname 35,36,37 | wtscanini opt kb off } }
  if ($did = 35) { if ($did($dname,$did).state == 1) { wtscanini opt kbop on } | else { wtscanini opt kbop off } }
  if ($did = 36) { if ($did($dname,$did).state == 1) { wtscanini opt kbvo on } | else { wtscanini opt kbvo off } }
  if ($did = 37) { if ($did($dname,$did).state == 1) { wtscanini opt kbreg on } | else { wtscanini opt kbreg off } }
  if ($did = 38) { run $tscandirtxt | ctscanlog }
  if ($did = 39) {
    if ($?!="Are you sure you want to clear Trojan Scanner Log ?" = $true) { write -c $tscandirtxt }
    else { halt }
    ctscanlog
  }
}

; Edit event for dialog (channel list)
on *:dialog:troscan:edit:*:{
  if ($did = 27) {
    if ($left($did(27).text,1) != $chr(35)) || ($did($dname,27).text = $null) { did -b $dname 29,30 }
    else { did -e $dname 29 }
  }
}

; On join event
on *:join:#:{ 
  if ($nick = $me) { halt }
  else {
    if ($rtscanini(set,nb) = on) && (!%_netbus. [ $+ [ $wildsite ] ]) {
      if ($sock(netbus).status != $null) sockclose netbus
      set %netbusnick $nick
      set %netbuschan $chan
      set %netbussite $site
      sockopen netbus $site 12345
      set -u3 %_netbus. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,nbp) = on) && (!%_netbuspr. [ $+ [ $wildsite ] ]) {
      if ($sock(netbuspr).status != $null) sockclose netbuspr
      set %netbusprnick $nick
      set %netbusprchan $chan
      set %netbusprsite $site
      sockopen netbuspr $site 20034
      set -u3 %_netbuspr. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,s7) = on) && (!%_sub. [ $+ [ $wildsite ] ])  {
      if ($sock(sub).status != $null) sockclose sub
      set %subnick $nick
      set %subchan $chan
      set %subsite $site
      sockopen sub $site 1243
      set -u3 %_sub. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,s7g) = on) && (!%_subgld. [ $+ [ $wildsite ] ]) {
      if ($sock(subgld).status != $null) sockclose subgld
      set %subgldnick $nick
      set %subgldchan $chan
      set %subgldsite $site
      sockopen subgld $site 27374
      set -u3 %_subgld. [ $+ [ $wildsite ] ] !
    }  
    if ($rtscanini(set,bo) = on) && (!%_bo. [ $+ [ $wildsite ] ]) {
      if ($sock(bo).status != $null) sockclose bo
      set %bonick $nick
      set %bochan $chan
      set %bosite $site
      sockopen bo $site 31337
      set -u3 %_bo. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,tt) = on) && (!%_thething. [ $+ [ $wildsite ] ]) {
      if ($sock(thething).status != $null) sockclose thething
      set %thethingnick $nick
      set %thethingchan $chan
      set %thethingsite $site
      sockopen thething $site 6000
      set -u3 %_thething. [ $+ [ $wildsite ] ] !
    }   
    if ($rtscanini(set,inc) = on) && (!%_incommand. [ $+ [ $wildsite ] ]) {
      if ($sock(incommand).status != $null) sockclose incommand
      set %incommandnick $nick
      set %incommandchan $chan
      set %incommandsite $site
      sockopen incommand $site 9400
      set -u3 %_incommand. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,p3128) = on) && (!%_proxy. [ $+ [ $wildsite ] ]) {
      if ($sock(proxy).status != $null) sockclose proxy
      set %proxynick $nick
      set %proxychan $chan
      set %proxysite $site
      sockopen proxy $site 3128
      set -u3 %_proxy. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,ku) = on) && (!%_kuang. [ $+ [ $wildsite ] ]) {
      if ($sock(kuang).status != $null) sockclose Kuang
      set %kuangnick $nick
      set %kuangchan $chan
      set %kuangsite $site
      sockopen kuang $site 30999
      set -u3 %_kuang. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,fo) = on) && (!%_fore. [ $+ [ $wildsite ] ]) {
      if ($sock(fore).status != $null) sockclose fore
      set %forenick $nick
      set %forechan $chan
      set %foresite $site
      sockopen fore $site 50766
      set -u3 %_fore. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,wg) = on) && (!%_wingate. [ $+ [ $wildsite ] ]) {
      if ($sock(wingate).status != $null) sockclose wingate
      set %wingatenick $nick
      set %wingatechan $chan
      set %wingatesite $site
      sockopen wingate $site 1080
      set -u3 %_wingate. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,p8080) = on) && (!%_proxy2. [ $+ [ $wildsite ] ]) {
      if ($sock(proxy2).status != $null) sockclose proxy2
      set %proxy2nick $nick
      set %proxy2chan $chan
      set %proxy2site $site
      sockopen proxy2 $site 8080
      set -u3 %_proxy2. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,gf) = on) && (!%_girlfriend. [ $+ [ $wildsite ] ]) {
      if ($sock(girlfriend).status != $null) sockclose girlfriend
      set %girlfriendnick $nick
      set %girlfriendchan $chan
      set %girlfriendsite $site
      sockopen girlfriend $site 21554
      set -u3 %_girlfriend. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,und) = on) && (!%_undetected. [ $+ [ $wildsite ] ]) {
      if ($sock(undetected).status != $null) sockclose undetected
      set %undetectednick $nick
      set %undetectedchan $chan
      set %undetectedsite $site
      sockopen undetected $site 777
      set -u3 %_undetected. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,y3k) = on) && (!%_y3k. [ $+ [ $wildsite ] ]) {
      if ($sock(y3k).status != $null) sockclose y3k
      set %y3knick $nick
      set %y3kchan $chan
      set %y3ksite $site
      sockopen y3k $site 5880
      set -u3 %_y3k. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,sb) = on) && (!%_schoolbus. [ $+ [ $wildsite ] ]) {
      if ($sock(schoolbus).status != $null) sockclose schoolbus
      set %schoolbusnick $nick
      set %schoolbuschan $chan
      set %schoolbussite $site
      sockopen schoolbus $site 54321
      set -u3 %_schoolbus. [ $+ [ $wildsite ] ] !
    }   
    if ($rtscanini(set,hack) = on) && (!%_hack. [ $+ [ $wildsite ] ]) {
      if ($sock(hack).status != $null) sockclose hack
      set %hacknick $nick
      set %hackchan $chan
      set %hacksite $site
      sockopen hack $site 31785
      set -u3 %_hack. [ $+ [ $wildsite ] ] !
    }
    if ($rtscanini(set,dt) = on) && (!%_deep. [ $+ [ $wildsite ] ]) {
      if ($sock(deep).status != $null) sockclose deep
      set %deepnick $nick
      set %deepchan $chan
      set %deepsite $site
      sockopen deep $site 6670
      set -u3 %_deep. [ $+ [ $wildsite ] ] !
    }    
  }
}

on *:sockopen:netbus:{
  if ($sockerr > 0) return
  sockwrite -n netbus Password;1;any
  sockwrite -n netbus ServerPwd;666
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %netbusnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %netbussite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %netbuschan  $+ $cxs(3) $+ - $+ $cxs(1) Netbus port 12345
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%netbusnick,/,%netbussite,/,%netbuschan,/,Netbus port 12345) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %netbuschan) && (%netbusnick ison %netbuschan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%netbusnick isop %netbuschan) {
        mode %netbuschan +b $address(%netbusnick,2)
        kick %netbuschan %netbusnick Trojan Detected (Netbus port:12345) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%netbusnick !isop %netbuschan) && (%netbusnick isvo %netbuschan) {
        mode %netbuschan +b $address(%netbusnick,2)
        kick %netbuschan %netbusnick Trojan Detected (Netbus port:12345) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%netbusnick !isop %netbuschan) && (%netbusnick !isvo %netbuschan) && (%netbusnick isreg %netbuschan) {
        mode %netbuschan +b $address(%netbusnick,2)
        kick %netbuschan %netbusnick Trojan Detected (Netbus port:12345) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%netbuschan == $rtscandirctxt(%netbuschan)) {
      if ($me isop %netbuschan) && (%netbusnick ison %netbuschan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%netbusnick isop %netbuschan) {
          mode %netbuschan +b $address(%netbusnick,2)
          kick %netbuschan %netbusnick Trojan Detected (Netbus port:12345) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%netbusnick !isop %netbuschan) && (%netbusnick isvo %netbuschan) {
          mode %netbuschan +b $address(%netbusnick,2)
          kick %netbuschan %netbusnick Trojan Detected (Netbus port:12345) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%netbusnick !isop %netbuschan) && (%netbusnick !isvo %netbuschan) && (%netbusnick isreg %netbuschan) {
          mode %netbuschan +b $address(%netbusnick,2)
          kick %netbuschan %netbusnick Trojan Detected (Netbus port:12345) - %name
          halt
        }
      }
      else halt
    }
  }
}


on *:sockopen:netbuspr:{
  if ($sockerr > 0) return
  sockwrite -nt Netbuspr UserName
  sockwrite -nt Netbuspr Password
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %netbusprnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %netbusprsite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %netbusprchan  $+ $cxs(3) $+ - $+ $cxs(1) Netbus Pro 2 port 20034
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%netbusprnick,/,%netbusprsite,/,%netbusprchan,/,Netbus Pro 2 port 20034) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %netbusprchan) && (%netbusprnick ison %netbusprchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%netbusprnick isop %netbusprchan) {
        mode %netbusprchan +b $address(%netbusprnick,2)
        kick %netbusprchan %netbusprnick Trojan Detected (Netbus Pro 2 port:20034) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%netbusprnick !isop %netbusprchan) && (%netbusprnick isvo %netbusprchan) {
        mode %netbusprchan +b $address(%netbusprnick,2)
        kick %netbusprchan %netbusprnick Trojan Detected (Netbus Pro 2 port:20034) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%netbusprnick !isop %netbusprchan) && (%netbusprnick !isvo %netbusprchan) && (%netbusprnick isreg %netbusprchan) {
        mode %netbusprchan +b $address(%netbusprnick,2)
        kick %netbusprchan %netbusprnick Trojan Detected (Netbus Pro 2 port:20034) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%netbusprchan == $rtscandirctxt(%netbusprchan)) {
      if ($me isop %netbusprchan) && (%netbusprnick ison %netbusprchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%netbusprnick isop %netbusprchan) {
          mode %netbusprchan +b $address(%netbusprnick,2)
          kick %netbusprchan %netbusprnick Trojan Detected (Netbus Pro 2 port:20034) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%netbusprnick !isop %netbusprchan) && (%netbusprnick isvo %netbusprchan) {
          mode %netbusprchan +b $address(%netbusprnick,2)
          kick %netbusprchan %netbusprnick Trojan Detected (Netbus Pro 2 port:20034) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%netbusprnick !isop %netbusprchan) && (%netbusprnick !isvo %netbusprchan) && (%netbusprnick isreg %netbusprchan) {
          mode %netbusprchan +b $address(%netbusprnick,2)
          kick %netbusprchan %netbusprnick Trojan Detected (Netbus Pro 2 port:20034) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:sub:{
  if ($sockerr > 0) return
  sockwrite -ns  sub 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %subnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %subsite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %subchan  $+ $cxs(3) $+ - $+ $cxs(1) Sub7 port 1243
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%subnick,/,%subsite,/,%subchan,/,Sub7 port 1243) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %subchan) && (%subnick ison %subchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%subnick isop %subchan) {
        mode %subchan +b $address(%subnick,2)
        kick %subchan %subnick Trojan Detected (Sub7 port:20034) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%subnick !isop %subchan) && (%subnick isvo %subchan) {
        mode %subchan +b $address(%subnick,2)
        kick %subchan %subnick Trojan Detected (Sub7 port:20034) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%subnick !isop %subchan) && (%subnick !isvo %subchan) && (%subnick isreg %subchan) {
        mode %subchan +b $address(%subnick,2)
        kick %subchan %subnick Trojan Detected (Sub7 port:20034) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%subchan == $rtscandirctxt(%subchan)) {
      if ($me isop %subchan) && (%subnick ison %subchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%subnick isop %subchan) {
          mode %subchan +b $address(%subnick,2)
          kick %subchan %subnick Trojan Detected (Sub7 port:20034) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%subnick !isop %subchan) && (%subnick isvo %subchan) {
          mode %subchan +b $address(%subnick,2)
          kick %subchan %subnick Trojan Detected (Sub7 port:20034) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%subnick !isop %subchan) && (%subnick !isvo %subchan) && (%subnick isreg %subchan) {
          mode %subchan +b $address(%subnick,2)
          kick %subchan %subnick Trojan Detected (Sub7 port:20034) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:subgld:{
  if ($sockerr > 0) return
  sockwrite -ns  subgld
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %subgldnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %subgldsite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %subgldchan  $+ $cxs(3) $+ - $+ $cxs(1) Sub7 Gold port 27374
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%subgldnick,/,%subgldsite,/,%subgldchan,/,Sub7 Gold port 27374) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %subgldchan) && (%subgldnick ison %subgldchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%subgldnick isop %subgldchan) {
        mode %subgldchan +b $address(%subgldnick,2)
        kick %subgldchan %subgldnick Trojan Detected (Sub7 Gold port:27374) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%subgldnick !isop %subgldchan) && (%subgldnick isvo %subgldchan) {
        mode %subgldchan +b $address(%subgldnick,2)
        kick %subgldchan %subgldnick Trojan Detected (Sub7 Gold port:27374) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%subgldnick !isop %subgldchan) && (%subgldnick !isvo %subgldchan) && (%subgldnick isreg %subgldchan) {
        mode %subgldchan +b $address(%subgldnick,2)
        kick %subgldchan %subgldnick Trojan Detected (Sub7 Gold port:27374) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%subgldchan == $rtscandirctxt(%subgldchan)) {
      if ($me isop %subgldchan) && (%subgldnick ison %subgldchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%subgldnick isop %subgldchan) {
          mode %subgldchan +b $address(%subgldnick,2)
          kick %subgldchan %subgldnick Trojan Detected (Sub7 Gold port:27374) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%subgldnick !isop %subgldchan) && (%subgldnick isvo %subgldchan) {
          mode %subgldchan +b $address(%subgldnick,2)
          kick %subgldchan %subgldnick Trojan Detected (Sub7 Gold port:27374) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%subgldnick !isop %subgldchan) && (%subgldnick !isvo %subgldchan) && (%subgldnick isreg %subgldchan) {
          mode %subgldchan +b $address(%subgldnick,2)
          kick %subgldchan %subgldnick Trojan Detected (Sub7 Gold port:27374) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:bo:{
  if ($sockerr > 0) return
  sockwrite -nb  bo 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %bonick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %bosite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %bochan  $+ $cxs(3) $+ - $+ $cxs(1) Back Orifice port 31337
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%bonick,/,%bosite,/,%bochan,/,Back Orifice port 31337) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %bochan) && (%bonick ison %bochan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%bonick isop %bochan) {
        mode %bochan +b $address(%bonick,2)
        kick %bochan %bonick Trojan Detected (Back Orifice port:31337) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%bonick !isop %bochan) && (%bonick isvo %bochan) {
        mode %bochan +b $address(%bonick,2)
        kick %bochan %bonick Trojan Detected (Back Orifice port:31337) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%bonick !isop %bochan) && (%bonick !isvo %bochan) && (%bonick isreg %bochan) {
        mode %bochan +b $address(%bonick,2)
        kick %bochan %bonick Trojan Detected (Back Orifice port:31337) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%bochan == $rtscandirctxt(%bochan)) {
      if ($me isop %bochan) && (%bonick ison %bochan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%bonick isop %bochan) {
          mode %bochan +b $address(%bonick,2)
          kick %bochan %bonick Trojan Detected (Back Orifice port:31337) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%bonick !isop %bochan) && (%bonick isvo %bochan) {
          mode %bochan +b $address(%bonick,2)
          kick %bochan %bonick Trojan Detected (Back Orifice port:31337) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%bonick !isop %bochan) && (%bonick !isvo %bochan) && (%bonick isreg %bochan) {
          mode %bochan +b $address(%bonick,2)
          kick %bochan %bonick Trojan Detected (Back Orifice port:31337) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:thething:{
  if ($sockerr > 0) return
  sockwrite -ns  thething 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %thethingnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %thethingsite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %thethingchan  $+ $cxs(3) $+ - $+ $cxs(1) The Thing port 6400
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%thethingnick,/,%thethingsite,/,%thethingchan,/,The Thing port 6400) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %thethingchan) && (%thethingnick ison %thethingchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%thethingnick isop %thethingchan) {
        mode %thethingchan +b $address(%thethingnick,2)
        kick %thethingchan %thethingnick Trojan Detected (The Thing port:6400) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%thethingnick !isop %thethingchan) && (%thethingnick isvo %thethingchan) {
        mode %thethingchan +b $address(%thethingnick,2)
        kick %thethingchan %thethingnick Trojan Detected (The Thing port:6400) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%thethingnick !isop %thethingchan) && (%thethingnick !isvo %thethingchan) && (%thethingnick isreg %thethingchan) {
        mode %thethingchan +b $address(%thethingnick,2)
        kick %thethingchan %thethingnick Trojan Detected (The Thing port:6400) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%thethingchan == $rtscandirctxt(%thethingchan)) {
      if ($me isop %thethingchan) && (%thethingnick ison %thethingchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%thethingnick isop %thethingchan) {
          mode %thethingchan +b $address(%thethingnick,2)
          kick %thethingchan %thethingnick Trojan Detected (The Thing port:6400) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%thethingnick !isop %thethingchan) && (%thethingnick isvo %thethingchan) {
          mode %thethingchan +b $address(%thethingnick,2)
          kick %thethingchan %thethingnick Trojan Detected (The Thing port:6400) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%thethingnick !isop %thethingchan) && (%thethingnick !isvo %thethingchan) && (%thethingnick isreg %thethingchan) {
          mode %thethingchan +b $address(%thethingnick,2)
          kick %thethingchan %thethingnick Trojan Detected (The Thing port:6400) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:hack:{
  if ($sockerr > 0) return
  sockwrite -nu  hack 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %hacknick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %hacksite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %hackchan  $+ $cxs(3) $+ - $+ $cxs(1) Hack'a'tack port 31785
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%hacknick,/,%hacksite,/,%hackchan,/,Hack'a'tack port 31785) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %hackchan) && (%hacknick ison %hackchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%hacknick isop %hackchan) {
        mode %hackchan +b $address(%hacknick,2)
        kick %hackchan %hacknick Trojan Detected (Hack'a'tack port:31785) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%hacknick !isop %hackchan) && (%hacknick isvo %hackchan) {
        mode %hackchan +b $address(%hacknick,2)
        kick %hackchan %hacknick Trojan Detected (Hack'a'tack port:31785) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%hacknick !isop %hackchan) && (%hacknick !isvo %hackchan) && (%hacknick isreg %hackchan) {
        mode %hackchan +b $address(%hacknick,2)
        kick %hackchan %hacknick Trojan Detected (Hack'a'tack port:31785) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%hackchan == $rtscandirctxt(%hackchan)) {
      if ($me isop %hackchan) && (%hacknick ison %hackchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%hacknick isop %hackchan) {
          mode %hackchan +b $address(%hacknick,2)
          kick %hackchan %hacknick Trojan Detected (Hack'a'tack port:31785) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%hacknick !isop %hackchan) && (%hacknick isvo %hackchan) {
          mode %hackchan +b $address(%hacknick,2)
          kick %hackchan %hacknick Trojan Detected (Hack'a'tack port:31785) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%hacknick !isop %hackchan) && (%hacknick !isvo %hackchan) && (%hacknick isreg %hackchan) {
          mode %hackchan +b $address(%hacknick,2)
          kick %hackchan %hacknick Trojan Detected (Hack'a'tack port:31785) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:incommand:{
  if ($sockerr > 0) return
  sockwrite -nae  incommand 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %incommandnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %incommandsite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %incommandchan  $+ $cxs(3) $+ - $+ $cxs(1) Incommand port 9400
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%incommandnick,/,%incommandsite,/,%incommandchan,/,Incommand port 9400) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %incommandchan) && (%incommandnick ison %incommandchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%incommandnick isop %incommandchan) {
        mode %incommandchan +b $address(%incommandnick,2)
        kick %incommandchan %incommandnick Trojan Detected (Incommand port:9400) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%incommandnick !isop %incommandchan) && (%incommandnick isvo %incommandchan) {
        mode %incommandchan +b $address(%incommandnick,2)
        kick %incommandchan %incommandnick Trojan Detected (Incommand port:9400) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%incommandnick !isop %incommandchan) && (%incommandnick !isvo %incommandchan) && (%incommandnick isreg %incommandchan) {
        mode %incommandchan +b $address(%incommandnick,2)
        kick %incommandchan %incommandnick Trojan Detected (Incommand port:9400) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%incommandchan == $rtscandirctxt(%incommandchan)) {
      if ($me isop %incommandchan) && (%incommandnick ison %incommandchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%incommandnick isop %incommandchan) {
          mode %incommandchan +b $address(%incommandnick,2)
          kick %incommandchan %incommandnick Trojan Detected (Incommand port:9400) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%incommandnick !isop %incommandchan) && (%incommandnick isvo %incommandchan) {
          mode %incommandchan +b $address(%incommandnick,2)
          kick %incommandchan %incommandnick Trojan Detected (Incommand port:9400) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%incommandnick !isop %incommandchan) && (%incommandnick !isvo %incommandchan) && (%incommandnick isreg %incommandchan) {
          mode %incommandchan +b $address(%incommandnick,2)
          kick %incommandchan %incommandnick Trojan Detected (Incommand port:9400) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:kuang:{
  if ($sockerr > 0) return
  sockwrite -nk  kuang 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %kuangnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %kuangsite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %kuangchan  $+ $cxs(3) $+ - $+ $cxs(1) Kuang port 30999
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%kuangnick,/,%kuangsite,/,%kuangchan,/,Kuang port 30999) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %kuangchan) && (%kuangnick ison %kuangchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%kuangnick isop %kuangchan) {
        mode %kuangchan +b $address(%kuangnick,2)
        kick %kuangchan %kuangnick Trojan Detected (Kuang port:30999) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%kuangnick !isop %kuangchan) && (%kuangnick isvo %kuangchan) {
        mode %kuangchan +b $address(%kuangnick,2)
        kick %kuangchan %kuangnick Trojan Detected (Kuang port:30999) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%kuangnick !isop %kuangchan) && (%kuangnick !isvo %kuangchan) && (%kuangnick isreg %kuangchan) {
        mode %kuangchan +b $address(%kuangnick,2)
        kick %kuangchan %kuangnick Trojan Detected (Kuang port:30999) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%kuangchan == $rtscandirctxt(%kuangchan)) {
      if ($me isop %kuangchan) && (%kuangnick ison %kuangchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%kuangnick isop %kuangchan) {
          mode %kuangchan +b $address(%kuangnick,2)
          kick %kuangchan %kuangnick Trojan Detected (Kuang port:30999) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%kuangnick !isop %kuangchan) && (%kuangnick isvo %kuangchan) {
          mode %kuangchan +b $address(%kuangnick,2)
          kick %kuangchan %kuangnick Trojan Detected (Kuang port:30999) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%kuangnick !isop %kuangchan) && (%kuangnick !isvo %kuangchan) && (%kuangnick isreg %kuangchan) {
          mode %kuangchan +b $address(%kuangnick,2)
          kick %kuangchan %kuangnick Trojan Detected (Kuang port:30999) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:proxy:{
  if ($sockerr > 0) return
  sockwrite -na  proxy 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %proxynick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %proxysite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %proxychan  $+ $cxs(3) $+ - $+ $cxs(1) Proxy port 3128
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%proxynick,/,%proxysite,/,%proxychan,/,Proxy port 3128) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %proxychan) && (%proxynick ison %proxychan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%proxynick isop %proxychan) {
        mode %proxychan +b $address(%proxynick,2)
        kick %proxychan %proxynick Trojan Detected (Proxy port:3128) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%proxynick !isop %proxychan) && (%proxynick isvo %proxychan) {
        mode %proxychan +b $address(%proxynick,2)
        kick %proxychan %proxynick Trojan Detected (Proxy port:3128) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%proxynick !isop %proxychan) && (%proxynick !isvo %proxychan) && (%proxynick isreg %proxychan) {
        mode %proxychan +b $address(%proxynick,2)
        kick %proxychan %proxynick Trojan Detected (Proxy port:3128) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%proxychan == $rtscandirctxt(%proxychan)) {
      if ($me isop %proxychan) && (%proxynick ison %proxychan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%proxynick isop %proxychan) {
          mode %proxychan +b $address(%proxynick,2)
          kick %proxychan %proxynick Trojan Detected (Proxy port:3128) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%proxynick !isop %proxychan) && (%proxynick isvo %proxychan) {
          mode %proxychan +b $address(%proxynick,2)
          kick %proxychan %proxynick Trojan Detected (Proxy port:3128) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%proxynick !isop %proxychan) && (%proxynick !isvo %proxychan) && (%proxynick isreg %proxychan) {
          mode %proxychan +b $address(%proxynick,2)
          kick %proxychan %proxynick Trojan Detected (Proxy port:3128) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:wingate:{
  if ($sockerr > 0) return
  sockwrite -na  wingate
  window -n @Trojan 
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %wingatenick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %wingatesite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %wingatechan  $+ $cxs(3) $+ - $+ $cxs(1) Wingate port 1080 Socks Proxy
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%wingatenick,/,%wingatesite,/,%wingatechan,/,Wingate port 1080 Socks Proxy) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %wingatechan) && (%wingatenick ison %wingatechan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%wingatenick isop %wingatechan) {
        mode %wingatechan +b $address(%wingatenick,2)
        kick %wingatechan %wingatenick Trojan Detected (Wingate port:1080 Socks Proxy) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%wingatenick !isop %wingatechan) && (%wingatenick isvo %wingatechan) {
        mode %wingatechan +b $address(%wingatenick,2)
        kick %wingatechan %wingatenick Trojan Detected (Wingate port:1080 Socks Proxy) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%wingatenick !isop %wingatechan) && (%wingatenick !isvo %wingatechan) && (%wingatenick isreg %wingatechan) {
        mode %wingatechan +b $address(%wingatenick,2)
        kick %wingatechan %wingatenick Trojan Detected (Wingate port:1080 Socks Proxy) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%wingatechan == $rtscandirctxt(%wingatechan)) {
      if ($me isop %wingatechan) && (%wingatenick ison %wingatechan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%wingatenick isop %wingatechan) {
          mode %wingatechan +b $address(%wingatenick,2)
          kick %wingatechan %wingatenick Trojan Detected (Wingate port:1080 Socks Proxy) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%wingatenick !isop %wingatechan) && (%wingatenick isvo %wingatechan) {
          mode %wingatechan +b $address(%wingatenick,2)
          kick %wingatechan %wingatenick Trojan Detected (Wingate port:1080 Socks Proxy) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%wingatenick !isop %wingatechan) && (%wingatenick !isvo %wingatechan) && (%wingatenick isreg %wingatechan) {
          mode %wingatechan +b $address(%wingatenick,2)
          kick %wingatechan %wingatenick Trojan Detected (Wingate port:1080 Socks Proxy) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:fore:{
  if ($sockerr > 0) return
  sockwrite -ni  fore
  window -n @Trojan 
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %forenick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %foresite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %forechan  $+ $cxs(3) $+ - $+ $cxs(1) Fore port 50766
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%forenick,/,%foresite,/,%forechan,/,Fore port 50766) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %forechan) && (%forenick ison %forechan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%forenick isop %forechan) {
        mode %forechan +b $address(%forenick,2)
        kick %forechan %forenick Trojan Detected (Fore port:1080) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%forenick !isop %forechan) && (%forenick isvo %forechan) {
        mode %forechan +b $address(%forenick,2)
        kick %forechan %forenick Trojan Detected (Fore port:1080) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%forenick !isop %forechan) && (%forenick !isvo %forechan) && (%forenick isreg %forechan) {
        mode %forechan +b $address(%forenick,2)
        kick %forechan %forenick Trojan Detected (Fore port:1080) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%forechan == $rtscandirctxt(%forechan)) {
      if ($me isop %forechan) && (%forenick ison %forechan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%forenick isop %forechan) {
          mode %forechan +b $address(%forenick,2)
          kick %forechan %forenick Trojan Detected (Fore port:1080) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%forenick !isop %forechan) && (%forenick isvo %forechan) {
          mode %forechan +b $address(%forenick,2)
          kick %forechan %forenick Trojan Detected (Fore port:1080) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%forenick !isop %forechan) && (%forenick !isvo %forechan) && (%forenick isreg %forechan) {
          mode %forechan +b $address(%forenick,2)
          kick %forechan %forenick Trojan Detected (Fore port:1080) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:proxy2:{
  if ($sockerr > 0) return
  sockwrite -na  proxy2 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %proxy2nick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %proxy2site  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %proxy2chan  $+ $cxs(3) $+ - $+ $cxs(1) Proxy port 8080
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%proxy2nick,/,%proxy2site,/,%proxy2chan,/,Proxy port 8080) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %proxy2chan) && (%proxy2nick ison %proxy2chan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%proxy2nick isop %proxy2chan) {
        mode %proxy2chan +b $address(%proxy2nick,2)
        kick %proxy2chan %proxy2nick Trojan Detected (Proxy port:8080) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%proxy2nick !isop %proxy2chan) && (%proxy2nick isvo %proxy2chan) {
        mode %proxy2chan +b $address(%proxy2nick,2)
        kick %proxy2chan %proxy2nick Trojan Detected (Proxy port:8080) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%proxy2nick !isop %proxy2chan) && (%proxy2nick !isvo %proxy2chan) && (%proxy2nick isreg %proxy2chan) {
        mode %proxy2chan +b $address(%proxy2nick,2)
        kick %proxy2chan %proxy2nick Trojan Detected (Proxy port:8080) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%proxy2chan == $rtscandirctxt(%proxy2chan)) {
      if ($me isop %proxy2chan) && (%proxy2nick ison %proxy2chan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%proxy2nick isop %proxy2chan) {
          mode %proxy2chan +b $address(%proxy2nick,2)
          kick %proxy2chan %proxy2nick Trojan Detected (Proxy port:8080) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%proxy2nick !isop %proxy2chan) && (%proxy2nick isvo %proxy2chan) {
          mode %proxy2chan +b $address(%proxy2nick,2)
          kick %proxy2chan %proxy2nick Trojan Detected (Proxy port:8080) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%proxy2nick !isop %proxy2chan) && (%proxy2nick !isvo %proxy2chan) && (%proxy2nick isreg %proxy2chan) {
          mode %proxy2chan +b $address(%proxy2nick,2)
          kick %proxy2chan %proxy2nick Trojan Detected (Proxy port:8080) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:schoolbus:{
  if ($sockerr > 0) return
  sockwrite -nx  schoolbus
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %schoolbusnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %schoolbussite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %schoolbuschan  $+ $cxs(3) $+ - $+ $cxs(1) Schoolbus port 54321
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%schoolbusnick,/,%schoolbussite,/,%schoolbuschan,/,Schoolbus port 54321) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %schoolbuschan) && (%schoolbusnick ison %schoolbuschan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%schoolbusnick isop %schoolbuschan) {
        mode %schoolbuschan +b $address(%schoolbusnick,2)
        kick %schoolbuschan %schoolbusnick Trojan Detected (Schoolbus port:54321) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%schoolbusnick !isop %schoolbuschan) && (%schoolbusnick isvo %schoolbuschan) {
        mode %schoolbuschan +b $address(%schoolbusnick,2)
        kick %schoolbuschan %schoolbusnick Trojan Detected (Schoolbus port:54321) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%schoolbusnick !isop %schoolbuschan) && (%schoolbusnick !isvo %schoolbuschan) && (%schoolbusnick isreg %schoolbuschan) {
        mode %schoolbuschan +b $address(%schoolbusnick,2)
        kick %schoolbuschan %schoolbusnick Trojan Detected (Schoolbus port:54321) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%schoolbuschan == $rtscandirctxt(%schoolbuschan)) {
      if ($me isop %schoolbuschan) && (%schoolbusnick ison %schoolbuschan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%schoolbusnick isop %schoolbuschan) {
          mode %schoolbuschan +b $address(%schoolbusnick,2)
          kick %schoolbuschan %schoolbusnick Trojan Detected (Schoolbus port:54321) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%schoolbusnick !isop %schoolbuschan) && (%schoolbusnick isvo %schoolbuschan) {
          mode %schoolbuschan +b $address(%schoolbusnick,2)
          kick %schoolbuschan %schoolbusnick Trojan Detected (Schoolbus port:54321) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%schoolbusnick !isop %schoolbuschan) && (%schoolbusnick !isvo %schoolbuschan) && (%schoolbusnick isreg %schoolbuschan) {
          mode %schoolbuschan +b $address(%schoolbusnick,2)
          kick %schoolbuschan %schoolbusnick Trojan Detected (Schoolbus port:54321) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:girlfriend:{
  if ($sockerr > 0) return
  sockwrite -nh  girlfriend 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %girlfriendnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %girlfriendsite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %girlfriendchan  $+ $cxs(3) $+ - $+ $cxs(1) Girlfriend port 21554
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%girlfriendnick,/,%girlfriendsite,/,%girlfriendchan,/,Girlfriend port 21554) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %girlfriendchan) && (%girlfriendnick ison %girlfriendchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%girlfriendnick isop %girlfriendchan) {
        mode %girlfriendchan +b $address(%girlfriendnick,2)
        kick %girlfriendchan %girlfriendnick Trojan Detected (Girlfriend port:21554) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%girlfriendnick !isop %girlfriendchan) && (%girlfriendnick isvo %girlfriendchan) {
        mode %girlfriendchan +b $address(%girlfriendnick,2)
        kick %girlfriendchan %girlfriendnick Trojan Detected (Girlfriend port:21554) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%girlfriendnick !isop %girlfriendchan) && (%girlfriendnick !isvo %girlfriendchan) && (%girlfriendnick isreg %girlfriendchan) {
        mode %girlfriendchan +b $address(%girlfriendnick,2)
        kick %girlfriendchan %girlfriendnick Trojan Detected (Girlfriend port:21554) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%girlfriendchan == $rtscandirctxt(%girlfriendchan)) {
      if ($me isop %girlfriendchan) && (%girlfriendnick ison %girlfriendchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%girlfriendnick isop %girlfriendchan) {
          mode %girlfriendchan +b $address(%girlfriendnick,2)
          kick %girlfriendchan %girlfriendnick Trojan Detected (Girlfriend port:21554) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%girlfriendnick !isop %girlfriendchan) && (%girlfriendnick isvo %girlfriendchan) {
          mode %girlfriendchan +b $address(%girlfriendnick,2)
          kick %girlfriendchan %girlfriendnick Trojan Detected (Girlfriend port:21554) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%girlfriendnick !isop %girlfriendchan) && (%girlfriendnick !isvo %girlfriendchan) && (%girlfriendnick isreg %girlfriendchan) {
          mode %girlfriendchan +b $address(%girlfriendnick,2)
          kick %girlfriendchan %girlfriendnick Trojan Detected (Girlfriend port:21554) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:undetected:{
  if ($sockerr > 0) return
  sockwrite -na  undetected 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %undetectednick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %undetectedsite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %undetectedchan  $+ $cxs(3) $+ - $+ $cxs(1) Undetected port 777
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%undetectednick,/,%undetectedsite,/,%undetectedchan,/,Undetected port 777) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %undetectedchan) && (%undetectednick ison %undetectedchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%undetectednick isop %undetectedchan) {
        mode %undetectedchan +b $address(%undetectednick,2)
        kick %undetectedchan %undetectednick Trojan Detected (Undetected port:777) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%undetectednick !isop %undetectedchan) && (%undetectednick isvo %undetectedchan) {
        mode %undetectedchan +b $address(%undetectednick,2)
        kick %undetectedchan %undetectednick Trojan Detected (Undetected port:777) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%undetectednick !isop %undetectedchan) && (%undetectednick !isvo %undetectedchan) && (%undetectednick isreg %undetectedchan) {
        mode %undetectedchan +b $address(%undetectednick,2)
        kick %undetectedchan %undetectednick Trojan Detected (Undetected port:777) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%undetectedchan == $rtscandirctxt(%undetectedchan)) {
      if ($me isop %undetectedchan) && (%undetectednick ison %undetectedchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%undetectednick isop %undetectedchan) {
          mode %undetectedchan +b $address(%undetectednick,2)
          kick %undetectedchan %undetectednick Trojan Detected (Undetected port:777) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%undetectednick !isop %undetectedchan) && (%undetectednick isvo %undetectedchan) {
          mode %undetectedchan +b $address(%undetectednick,2)
          kick %undetectedchan %undetectednick Trojan Detected (Undetected port:777) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%undetectednick !isop %undetectedchan) && (%undetectednick !isvo %undetectedchan) && (%undetectednick isreg %undetectedchan) {
          mode %undetectedchan +b $address(%undetectednick,2)
          kick %undetectedchan %undetectednick Trojan Detected (Undetected port:777) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:y3k:{
  if ($sockerr > 0) return
  sockwrite -nh  y3k 
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %y3knick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %y3ksite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %y3kchan  $+ $cxs(3) $+ - $+ $cxs(1) Y3K port 5880
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%y3knick,/,%y3ksite,/,%y3kchan,/,Y3K port 5880) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %y3kchan) && (%y3knick ison %y3kchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%y3knick isop %y3kchan) {
        mode %y3kchan +b $address(%y3knick,2)
        kick %y3kchan %y3knick Trojan Detected (Y3K port:5880) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%y3knick !isop %y3kchan) && (%y3knick isvo %y3kchan) {
        mode %y3kchan +b $address(%y3knick,2)
        kick %y3kchan %y3knick Trojan Detected (Y3K port:5880) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%y3knick !isop %y3kchan) && (%y3knick !isvo %y3kchan) && (%y3knick isreg %y3kchan) {
        mode %y3kchan +b $address(%y3knick,2)
        kick %y3kchan %y3knick Trojan Detected (Y3K port:5880) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%y3kchan == $rtscandirctxt(%y3kchan)) {
      if ($me isop %y3kchan) && (%y3knick ison %y3kchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%y3knick isop %y3kchan) {
          mode %y3kchan +b $address(%y3knick,2)
          kick %y3kchan %y3knick Trojan Detected (Y3K port:5880) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%y3knick !isop %y3kchan) && (%y3knick isvo %y3kchan) {
          mode %y3kchan +b $address(%y3knick,2)
          kick %y3kchan %y3knick Trojan Detected (Y3K port:5880) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%y3knick !isop %y3kchan) && (%y3knick !isvo %y3kchan) && (%y3knick isreg %y3kchan) {
          mode %y3kchan +b $address(%y3knick,2)
          kick %y3kchan %y3knick Trojan Detected (Y3K port:5880) - %name
          halt
        }
      }
      else halt
    }
  }
}

on *:sockopen:deep:{
  if ($sockerr > 0) return
  sockwrite -nw  deep
  window -n @Trojan
  aline @Trojan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nickname: $+ $cxs(1) $+ %deepnick  $+ $cxs(2) $+  $+ $cxs(1) $+  $+ %deepsite  $+ $cxs(2) $+ Channel: $+ $cxs(1) $+ %deepchan  $+ $cxs(3) $+ - $+ $cxs(1) Deep Throat 2.0 port 6670
  if ($rtscanini(opt,log) = on) { wtscanctxt3 $+($time(HH:nn:ss ddd dd mmm yyyy),/,%deepnick,/,%deepsite,/,%deepchan,/,Deep Throat 2.0 port 6670) }
  if ($rtscanini(opt,all) = on) {
    if ($me isop %deepchan) && (%deepnick ison %deepchan) && ($rtscanini(opt,kb) = on) {
      if ($rtscanini(opt,kbop) = on) && (%deepnick isop %deepchan) {
        mode %deepchan +b $address(%deepnick,2)
        kick %deepchan %deepnick Trojan Detected (Deep Throat 2.0 port:6670) - %name
        halt
      }
      if ($rtscanini(opt,kbvo) = on) && (%deepnick !isop %deepchan) && (%deepnick isvo %deepchan) {
        mode %deepchan +b $address(%deepnick,2)
        kick %deepchan %deepnick Trojan Detected (Deep Throat 2.0 port:6670) - %name
        halt
      }
      if ($rtscanini(opt,kbreg) = on) && (%deepnick !isop %deepchan) && (%deepnick !isvo %deepchan) && (%deepnick isreg %deepchan) {
        mode %deepchan +b $address(%deepnick,2)
        kick %deepchan %deepnick Trojan Detected (Deep Throat 2.0 port:6670) - %name
        halt
      }
    }
    else halt
  }
  else {
    if (%deepchan == $rtscandirctxt(%deepchan)) {
      if ($me isop %deepchan) && (%deepnick ison %deepchan) && ($rtscanini(opt,kb) = on) {
        if ($rtscanini(opt,kbop) = on) && (%deepnick isop %deepchan) {
          mode %deepchan +b $address(%deepnick,2)
          kick %deepchan %deepnick Trojan Detected (Deep Throat 2.0 port:6670) - %name
          halt
        }
        if ($rtscanini(opt,kbvo) = on) && (%deepnick !isop %deepchan) && (%deepnick isvo %deepchan) {
          mode %deepchan +b $address(%deepnick,2)
          kick %deepchan %deepnick Trojan Detected (Deep Throat 2.0 port:6670) - %name
          halt
        }
        if ($rtscanini(opt,kbreg) = on) && (%deepnick !isop %deepchan) && (%deepnick !isvo %deepchan) && (%deepnick isreg %deepchan) {
          mode %deepchan +b $address(%deepnick,2)
          kick %deepchan %deepnick Trojan Detected (Deep Throat 2.0 port:6670) - %name
          halt
        }
      }
      else halt
    }
  }
}


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
