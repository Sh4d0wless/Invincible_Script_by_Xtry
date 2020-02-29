;___________________________________________
; Invincible by Xtry
; Sound & Echo System
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias gtzwav { if ($dialog(gtzwav)) dialog -v gtzwav | else dialog -m gtzwav gtzwav }
dialog gtzwav {
  title Sound System Setup
  icon graph/soundsys.ico
  size -1 -1 246 157
  option dbu
  box "Check To Enable The Sound",9,5 5 236 121
  box "",10,7 9 78 115
  box "",11,84 9 78 115
  box "",19,161 9 78 115
  button "Default",1,199 130 40 10
  button "Close",37,199 140 40 10,ok
  box "",36,197 125 44 27
  check "Start Up",2,9 15 60 7,left
  button "!",40,71 15 10 7
  check "Connected",3,9 25 60 7,left
  button "!",41,71 25 10 7
  check "Disconnected",4,9 35 60 7,left
  button "!",42,71 35 10 7
  check "Join Channel",5,9 45 60 7,left
  button "!",43,71 45 10 7
  check "Part Channel",6,9 55 60 7,left
  button "!",44,71 55 10 7
  check "Opped (+o)",7,9 65 60 7,left
  button "!",45,71 65 10 7
  check "Deopped (-o)",8,9 75 60 7,left
  button "!",46,71 75 10 7
  check "Voiced (+v)",12,86 15 60 7,left
  button "!",49,148 15 10 7
  check "Devoiced (-v)",13,86 25 60 7,left
  button "!",50,148 25 10 7
  check "Kicked By User",14,86 35 60 7,left
  button "!",51,148 35 10 7
  check "Kick A User",15,86 45 60 7,left
  button "!",52,148 45 10 7
  check "Highlight",16,86 55 60 7,left
  button "!",53,148 55 10 7
  check "Notify",17,86 65 60 7,left
  button "!",54,148 65 10 7
  check "Unotify",18,86 75 60 7,left
  button "!",55,148 75 10 7
  check "On Join Clones",20,163 15 60 7,left
  button "!",58,225 15 10 7
  check "Netsplit",21,163 25 60 7,left
  button "!",59,225 25 10 7
  check "Incoming File",22,163 35 60 7,left
  button "!",60,225 35 10 7
  check "Failed Transfer",23,163 45 60 7,left
  button "!",61,225 45 10 7
  check "File Sent",24,163 55 60 7,left
  button "!",62,225 55 10 7
  check "File Received",25,163 65 60 7,left
  button "!",63,225 65 10 7
  check "IRCop Alert",26,163 75 60 7,left
  button "!",64,225 75 10 7
  check "On Invite",27,9 85 60 7,left
  button "!",47,71 85 10 7
  check "Incoming Msg",28,86 85 60 7,left
  button "!",56,148 85 10 7
  check "Incoming Chat",29,163 85 60 7,left
  button "!",65,225 85 10 7
  check "LOL",30,9 95 60 7,left
  button "!",48,71 95 10 7
  check "Ping From User",67,9 105 60 7,left
  button "!",68,71 105 10 7
  check "Emergency Ignore",90,9 115 60 7,left
  button "!",91,71 115 10 7
  check "Error Raw Reply",92,86 115 60 7,left
  button "!",93,148 115 10 7
  check "Notice",69,86 105 60 7,left
  button "!",70,148 105 10 7
  check "Ban On Me",80,163 105 60 7,left
  button "!",81,225 105 10 7
  check "On Away",31,86 95 60 7,left
  button "!",57,148 95 10 7
  check "On Back",32,163 95 60 7,left
  button "!",66,225 95 10 7
  button "Enable All",33,7 130 40 10
  button "Disable All",35,7 140 40 10
  box "",34,5 125 44 27
}
on *:dialog:gtzwav:init:*:{
  gtzsound
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,9,37,33,35,2,3,4,5,6,7,8,27,30,67,90,12,13,14,15,16,17,18,28,31,69,20,21,22,23,24,25,29,80,26,32,92,93 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 33,35,1,37 clientedge
  dll dll/mdx.dll SetBorderStyle $dname 40,41,42,43,44,45,46,49,50,51,52,53,54,55,58,59,60,61,62,63,64,47,56,65,48,68,91,70,81,57,66,93 staticedge
  if ( %startsound = on ) { did -c gtzwav 2 } | else { did -u gtzwav 2 }
  if ( %connsound = on ) { did -c gtzwav 3 } | else { did -u gtzwav 3 }
  if ( %disconnsound = on ) { did -c gtzwav 4 } | else { did -u gtzwav 4 }
  if ( %joinsoundx = on ) { did -c gtzwav 5 } | else { did -u gtzwav 5 }
  if ( %partsoundx = on ) { did -c gtzwav 6 } | else { did -u gtzwav 6 }
  if ( %opgtzs = on ) { did -c gtzwav 7 } | else { did -u gtzwav 7 }
  if ( %deopgtzs = on ) { did -c gtzwav 8 } | else { did -u gtzwav 8 }
  if ( %voigtzs = on ) { did -c gtzwav 12 } | else { did -u gtzwav 12 }
  if ( %devoigtzs = on ) { did -c gtzwav 13 } | else { did -u gtzwav 13 }
  if ( %kicgtzs = on ) { did -c gtzwav 14 } | else { did -u gtzwav 14 }
  if ( %kocgtzs = on ) { did -c gtzwav 15 } | else { did -u gtzwav 15 }
  if ( %hailais = on ) { did -c gtzwav 16 } | else { did -u gtzwav 16 }
  if ( %notisound = on ) { did -c gtzwav 17 } | else { did -u gtzwav 17 }
  if ( %unotisound = on ) { did -c gtzwav 18 } | else { did -u gtzwav 18 }
  if ( %clonesound = on ) { did -c gtzwav 20 } | else { did -u gtzwav 20 }
  if ( %splitsound = on ) { did -c gtzwav 21 } | else { did -u gtzwav 21 }
  if ( %incomfile = on ) { did -c gtzwav 22 } | else { did -u gtzwav 22 }
  if ( %gtzfails = on ) { did -c gtzwav 23 } | else { did -u gtzwav 23 }
  if ( %sentfi = on ) { did -c gtzwav 24 } | else { did -u gtzwav 24 }
  if ( %receifi = on ) { did -c gtzwav 25 } | else { did -u gtzwav 25 }
  if ( %opersound = on ) { did -c gtzwav 26 } | else { did -u gtzwav 26 }
  if ( %invitasound = on ) { did -c gtzwav 27 } | else { did -u gtzwav 27 }
  if ( %msgsound = on ) { did -c gtzwav 28 } | else { did -u gtzwav 28 }
  if ( %incomchat = on ) { did -c gtzwav 29 } | else { did -u gtzwav 29 }
  if ( %lolsoundx = on ) { did -c gtzwav 30 } | else { did -u gtzwav 30 }
  if ( %waysound = on ) { did -c gtzwav 31 } | else { did -u gtzwav 31 }
  if ( %backsoundx = on ) { did -c gtzwav 32 } | else { did -u gtzwav 32 }
  if ( %x.pingtome = on ) { did -c gtzwav 67 } | else { did -u gtzwav 67 }
  if ( %x.notice2me = on ) { did -c gtzwav 69 } | else { did -u gtzwav 69 }
  if ( %banonme = on ) { did -c gtzwav 80 } | else { did -u gtzwav 80 }
  if ( %emeignore = on ) { did -c gtzwav 90 } | else { did -u gtzwav 90 }
  if ( %err.sound = on ) { did -c gtzwav 92 } | else { did -u gtzwav 92 }
}
on *:dialog:gtzwav:sclick:*:{
  if ($did == 2) { if ($did($dname,$did).state == 1) { set %startsound on } | else { set %startsound off } }
  if ($did == 3) { if ($did($dname,$did).state == 1) { set %connsound on } | else { set %connsound off } }
  if ($did == 4) { if ($did($dname,$did).state == 1) { set %disconnsound on } | else { set %disconnsound off } }
  if ($did == 5) { if ($did($dname,$did).state == 1) { set %joinsoundx on } | else { set %joinsoundx off } }
  if ($did == 6) { if ($did($dname,$did).state == 1) { set %partsoundx on } | else { set %partsoundx off } }
  if ($did == 7) { if ($did($dname,$did).state == 1) { set %opgtzs on } | else { set %opgtzs off } }
  if ($did == 8) { if ($did($dname,$did).state == 1) { set %deopgtzs on } | else { set %deopgtzs off } }
  if ($did == 12) { if ($did($dname,$did).state == 1) { set %voigtzs on } | else { set %voigtzs off } }
  if ($did == 13) { if ($did($dname,$did).state == 1) { set %devoigtzs on } | else { set %devoigtzs off } }
  if ($did == 14) { if ($did($dname,$did).state == 1) { set %kicgtzs on } | else { set %kicgtzs off } }
  if ($did == 15) { if ($did($dname,$did).state == 1) { set %kocgtzs on } | else { set %kocgtzs off } }
  if ($did == 16) { if ($did($dname,$did).state == 1) { set %hailais on } | else { set %hailais off } }
  if ($did == 17) { if ($did($dname,$did).state == 1) { set %notisound on } | else { set %notisound off } }
  if ($did == 18) { if ($did($dname,$did).state == 1) { set %unotisound on } | else { set %unotisound off } }
  if ($did == 20) { if ($did($dname,$did).state == 1) { set %clonesound on } | else { set %clonesound off } }
  if ($did == 21) { if ($did($dname,$did).state == 1) { set %splitsound on } | else { set %splitsound off } }
  if ($did == 22) { if ($did($dname,$did).state == 1) { set %incomfile on } | else { set %incomfile off } }
  if ($did == 23) { if ($did($dname,$did).state == 1) { set %gtzfails on } | else { set %gtzfails off } }
  if ($did == 24) { if ($did($dname,$did).state == 1) { set %sentfi on } | else { set %sentfi off } }
  if ($did == 25) { if ($did($dname,$did).state == 1) { set %receifi on } | else { set %receifi off } }
  if ($did == 26) { if ($did($dname,$did).state == 1) { set %opersound on } | else { set %opersound off } }
  if ($did == 27) { if ($did($dname,$did).state == 1) { set %invitasound on } | else { set %invitasound off } }
  if ($did == 28) { if ($did($dname,$did).state == 1) { set %msgsound on } | else { set %msgsound off } }
  if ($did == 29) { if ($did($dname,$did).state == 1) { set %incomchat on } | else { set %incomchat off } }
  if ($did == 30) { if ($did($dname,$did).state == 1) { set %lolsoundx on } | else { set %lolsoundx off } }
  if ($did == 31) { if ($did($dname,$did).state == 1) { set %waysound on } | else { set %waysound off } }
  if ($did == 32) { if ($did($dname,$did).state == 1) { set %backsoundx on } | else { set %backsoundx off } }
  if ($did == 67) { if ($did($dname,$did).state == 1) { set %x.pingtome on } | else { set %x.pingtome off } }
  if ($did == 69) { if ($did($dname,$did).state == 1) { set %x.notice2me on } | else { set %x.notice2me off } }
  if ($did == 80) { if ($did($dname,$did).state == 1) { set %banonme on } | else { set %banonme off } }
  if ($did == 90) { if ($did($dname,$did).state == 1) { set %emeignore on } | else { set %emeignore off } }
  if ($did == 92) { if ($did($dname,$did).state == 1) { set %err.sound on } | else { set %err.sound off } }
  if ($did == 1) { gtzdefsound }
  if ($did == 33) { gtzsok }
  if ($did == 35) { gtzsko }
  if ($did == 40) { .splay %invinciblesound }
  if ($did == 41) { .splay %connect }
  if ($did == 42) { .splay %disconnect }
  if ($did == 43) { .splay %mejoin }
  if ($did == 44) { .splay %mepart }
  if ($did == 45) { .splay %meop }
  if ($did == 46) { .splay %medeop }
  if ($did == 47) { .splay %inviter }
  if ($did == 48) { .splay $findfile(sounds\lolz,*.wav,$rand(1,$findfile(sounds\lolz,*.wav,0))) }
  if ($did == 49) { .splay %mevoice }
  if ($did == 50) { .splay %medevoice }
  if ($did == 51) { .splay %mekick }
  if ($did == 52) { .splay %mekoc }
  if ($did == 53) { .splay %hailai }
  if ($did == 54) { .splay %online }
  if ($did == 55) { .splay %offline }
  if ($did == 56) { .splay %pm }
  if ($did == 57) { .splay %brb }
  if ($did == 58) { .splay %clones }
  if ($did == 59) { .splay %netsplitx }
  if ($did == 60) { .splay %dccsend }
  if ($did == 61) { .splay %failed }
  if ($did == 62) { .splay %sent }
  if ($did == 63) { .splay %downloaded }
  if ($did == 64) { .splay %ircop }
  if ($did == 65) { .splay %chat }
  if ($did == 66) { .splay %wb }
  if ($did == 68) { .splay %x.pongtome }
  if ($did == 70) { .splay %sofnote }
  if ($did == 81) { .splay %mebanned }
  if ($did == 91) { .splay %emerignore }
  if ($did == 93) { .splay %err.wav }
}
alias gtzdefsound {
  gtzsound
  did -c gtzwav 2 | set %startsound on
  did -c gtzwav 3 | set %connsound on
  did -c gtzwav 4 | set %disconnsound on
  did -u gtzwav 5 | set %joinsoundx off
  did -u gtzwav 6 | set %partsoundx off
  did -c gtzwav 7 | set %opgtzs on
  did -c gtzwav 8 | set %deopgtzs on
  did -c gtzwav 12 | set %voigtzs on
  did -c gtzwav 13 | set %devoigtzs on
  did -u gtzwav 14 | set %kicgtzs off
  did -c gtzwav 15 | set %kocgtzs on
  did -c gtzwav 16 | set %hailais on
  did -c gtzwav 17 | set %notisound on
  did -c gtzwav 18 | set %unotisound on
  did -c gtzwav 20 | set %clonesound on
  did -u gtzwav 21 | set %splitsound off
  did -c gtzwav 22 | set %incomfile on
  did -c gtzwav 23 | set %gtzfails on
  did -c gtzwav 24 | set %sentfi on
  did -c gtzwav 25 | set %receifi on
  did -c gtzwav 26 | set %opersound on
  did -c gtzwav 27 | set %invitasound on
  did -u gtzwav 28 | set %msgsound off
  did -u gtzwav 29 | set %incomchat off
  did -u gtzwav 30 | set %lolsoundx off
  did -u gtzwav 31 | set %waysound off
  did -u gtzwav 32 | set %backsoundx off
  did -c gtzwav 67 | set %x.pingtome on
  did -c gtzwav 69 | set %x.notice2me on
  did -c gtzwav 80 | set %banonme on
  did -c gtzwav 90 | set %emeignore on
  did -c gtzwav 92 | set %err.sound on
}
alias gtzsok {
  did -c gtzwav 2 | set %startsound on
  did -c gtzwav 3 | set %connsound on
  did -c gtzwav 4 | set %disconnsound on
  did -c gtzwav 5 | set %joinsoundx on
  did -c gtzwav 6 | set %partsoundx on
  did -c gtzwav 7 | set %opgtzs on
  did -c gtzwav 8 | set %deopgtzs on
  did -c gtzwav 12 | set %voigtzs on
  did -c gtzwav 13 | set %devoigtzs on
  did -c gtzwav 14 | set %kicgtzs on
  did -c gtzwav 15 | set %kocgtzs on
  did -c gtzwav 16 | set %hailais on
  did -c gtzwav 17 | set %notisound on
  did -c gtzwav 18 | set %unotisound on
  did -c gtzwav 20 | set %clonesound on
  did -c gtzwav 21 | set %splitsound on
  did -c gtzwav 22 | set %incomfile on
  did -c gtzwav 23 | set %gtzfails on
  did -c gtzwav 24 | set %sentfi on
  did -c gtzwav 25 | set %receifi on
  did -c gtzwav 26 | set %opersound on
  did -c gtzwav 27 | set %invitasound on
  did -c gtzwav 28 | set %msgsound on
  did -c gtzwav 29 | set %incomchat on
  did -c gtzwav 30 | set %lolsoundx on
  did -c gtzwav 31 | set %waysound on
  did -c gtzwav 32 | set %backsoundx on
  did -c gtzwav 67 | set %x.pingtome on
  did -c gtzwav 69 | set %x.notice2me on
  did -c gtzwav 80 | set %banonme on
  did -c gtzwav 90 | set %emeignore on
  did -c gtzwav 92 | set %err.sound on
}
alias gtzsko {
  did -u gtzwav 2 | set %startsound off
  did -u gtzwav 3 | set %connsound off
  did -u gtzwav 4 | set %disconnsound off
  did -u gtzwav 5 | set %joinsoundx off
  did -u gtzwav 6 | set %partsoundx off
  did -u gtzwav 7 | set %opgtzs off
  did -u gtzwav 8 | set %deopgtzs off
  did -u gtzwav 12 | set %voigtzs off
  did -u gtzwav 13 | set %devoigtzs off
  did -u gtzwav 14 | set %kicgtzs off
  did -u gtzwav 15 | set %kocgtzs off
  did -u gtzwav 16 | set %hailais off
  did -u gtzwav 17 | set %notisound off
  did -u gtzwav 18 | set %unotisound off
  did -u gtzwav 20 | set %clonesound off
  did -u gtzwav 21 | set %splitsound off
  did -u gtzwav 22 | set %incomfile off
  did -u gtzwav 23 | set %gtzfails off
  did -u gtzwav 24 | set %sentfi off
  did -u gtzwav 25 | set %receifi off
  did -u gtzwav 26 | set %opersound off
  did -u gtzwav 27 | set %invitasound off
  did -u gtzwav 28 | set %msgsound off
  did -u gtzwav 29 | set %incomchat off
  did -u gtzwav 30 | set %lolsoundx off
  did -u gtzwav 31 | set %waysound off
  did -u gtzwav 32 | set %backsoundx off
  did -u gtzwav 67 | set %x.pingtome off
  did -u gtzwav 69 | set %x.notice2me off
  did -u gtzwav 80 | set %banonme off
  did -u gtzwav 90 | set %emeignore off
  did -u gtzwav 92 | set %err.sound off
}

;Echo System
alias echosys { if ($dialog(echosys)) dialog -v echosys | else dialog -m echosys echosys }
dialog echosys {
  title Echo System Setup
  icon graph/echosys.ico
  size -1 -1 139 153
  option dbu
  box "Check To Enable The Echo",18,5 5 129 114
  box "",19,12 12 58 100
  box "",20,69 12 58 100
  button "Ok",22,92 125 40 10,ok
  button "Cancel",23,92 135 40 10,cancel
  box "",24,90 120 44 27
  check "Opped (+o)",1,15 20 50 7,left
  check "Deopped (-o)",2,15 30 50 7,left
  check "Voiced (+v)",3,15 40 50 7,left
  check "Devoiced (-v)",4,15 50 50 7,left
  check "Highlight",5,15 60 50 7,left
  check "Netsplit",7,15 70 50 7,left
  check "Kicked By User",25,15 80 50 7,left
  check "Join Info",26,15 90 50 7,left
  check "Welcome/Splash",28,15 100 50 7,left
  check "Incoming File",8,72 20 50 7,left
  check "Failed Transfer",9,72 30 50 7,left
  check "File Sent",10,72 40 50 7,left
  check "File Received",11,72 50 50 7,left
  check "IRCop Alert",12,72 60 50 7,left
  check "Incoming Msg",13,72 70 50 7,left
  check "Incoming Chat",14,72 80 50 7,left
  check "On Join Clones",27,72 90 50 7,left
  check "On Banned",29,72 100 50 7,left
  button "Enable All",15,7 125 40 10
  button "Disable All",16,7 135 40 10
  box "",17,5 120 44 27
}
on *:dialog:echosys:init:*:{
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 18,22,23,1,2,3,4,5,7,25,26,28,8,9,10,11,12,13,14,27,15,16 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 15,16,22,23 clientedge
  if ( %echox.op = on ) { did -c echosys 1 } | else { did -u echosys 1 }
  if ( %echox.deop = on ) { did -c echosys 2 } | else { did -u echosys 2 }
  if ( %echox.v = on ) { did -c echosys 3 } | else { did -u echosys 3 }
  if ( %echox.dv = on ) { did -c echosys 4 } | else { did -u echosys 4 }
  if ( %echox.hl = on ) { did -c echosys 5 } | else { did -u echosys 5 }
  if ( %echox.spl = on ) { did -c echosys 7 } | else { did -u echosys 7 }
  if ( %echox.if = on ) { did -c echosys 8 } | else { did -u echosys 8 }
  if ( %echox.ft = on ) { did -c echosys 9 } | else { did -u echosys 9 }
  if ( %echox.fs = on ) { did -c echosys 10 } | else { did -u echosys 10 }
  if ( %echox.fr = on ) { did -c echosys 11 } | else { did -u echosys 11 }
  if ( %echox.ia = on ) { did -c echosys 12 } | else { did -u echosys 12 }
  if ( %echox.im = on ) { did -c echosys 13 } | else { did -u echosys 13 }
  if ( %echox.ic = on ) { did -c echosys 14 } | else { did -u echosys 14 }
  if ( %echox.k = on ) { did -c echosys 25 } | else { did -u echosys 25 }
  if ( %echox.ji = on ) { did -c echosys 26 } | else { did -u echosys 26 }
  if ( %onjocl = on ) { did -c echosys 27 } | else { did -u echosys 27 }
  if ( %echox.welc = on ) { did -c echosys 28 } | else { did -u echosys 28 }
  if ( %e.band = on ) { did -c echosys 29 } | else { did -u echosys 29 }
}
on *:dialog:echosys:sclick:*:{
  if ($did == 1) { if ($did($dname,$did).state == 1) { set %echox.op on } | else { set %echox.op off } }
  if ($did == 2) { if ($did($dname,$did).state == 1) { set %echox.deop on } | else { set %echox.deop off } }
  if ($did == 3) { if ($did($dname,$did).state == 1) { set %echox.v on } | else { set %echox.v off } }
  if ($did == 4) { if ($did($dname,$did).state == 1) { set %echox.dv on } | else { set %echox.dv off } }
  if ($did == 5) { if ($did($dname,$did).state == 1) { set %echox.hl on } | else { set %echox.hl off } }
  if ($did == 7) { if ($did($dname,$did).state == 1) { set %echox.spl on } | else { set %echox.spl off } }
  if ($did == 8) { if ($did($dname,$did).state == 1) { set %echox.if on } | else { set %echox.if off } }
  if ($did == 9) { if ($did($dname,$did).state == 1) { set %echox.ft on } | else { set %echox.ft off } }
  if ($did == 10) { if ($did($dname,$did).state == 1) { set %echox.fs on } | else { set %echox.fs off } }
  if ($did == 11) { if ($did($dname,$did).state == 1) { set %echox.fr on } | else { set %echox.fr off } }
  if ($did == 12) { if ($did($dname,$did).state == 1) { set %echox.ia on } | else { set %echox.ia off } }
  if ($did == 13) { if ($did($dname,$did).state == 1) { set %echox.im on } | else { set %echox.im off } }
  if ($did == 14) { if ($did($dname,$did).state == 1) { set %echox.ic on } | else { set %echox.ic off } }
  if ($did == 25) { if ($did($dname,$did).state == 1) { set %echox.k on } | else { set %echox.k off } }
  if ($did == 26) { if ($did($dname,$did).state == 1) { set %echox.ji on } | else { set %echox.ji off } }
  if ($did == 27) { if ($did($dname,$did).state == 1) { set %onjocl on } | else { set %onjocl off } }
  if ($did == 28) { if ($did($dname,$did).state == 1) { set %echox.welc on } | else { set %echox.welc off } }
  if ($did == 29) { if ($did($dname,$did).state == 1) { set %e.band on } | else { set %e.band off } }
  if ($did == 15) { echosysok }
  if ($did == 16) { echosysko }
}
alias echosysok {
  did -c echosys 1 | set %echox.op on
  did -c echosys 2 | set %echox.deop on
  did -c echosys 3 | set %echox.v on
  did -c echosys 4 | set %echox.dv on
  did -c echosys 5 | set %echox.hl on
  did -c echosys 7 | set %echox.spl on
  did -c echosys 8 | set %echox.if on
  did -c echosys 9 | set %echox.ft on
  did -c echosys 10 | set %echox.fs on
  did -c echosys 11 | set %echox.fr on
  did -c echosys 12 | set %echox.ia on
  did -c echosys 13 | set %echox.im on
  did -c echosys 14 | set %echox.ic on
  did -c echosys 25 | set %echox.k on
  did -c echosys 26 | set %echox.ji on
  did -c echosys 27 | set %onjocl on
  did -c echosys 28 | set %echox.welc on
  did -c echosys 29 | set %e.band on
}
alias echosysko {
  did -u echosys 1 | set %echox.op off
  did -u echosys 2 | set %echox.deop off
  did -u echosys 3 | set %echox.v off
  did -u echosys 4 | set %echox.dv off
  did -u echosys 5 | set %echox.hl off
  did -u echosys 7 | set %echox.spl off
  did -u echosys 8 | set %echox.if off
  did -u echosys 9 | set %echox.ft off
  did -u echosys 10 | set %echox.fs off
  did -u echosys 11 | set %echox.fr off
  did -u echosys 12 | set %echox.ia off
  did -u echosys 13 | set %echox.im off
  did -u echosys 14 | set %echox.ic off
  did -u echosys 25 | set %echox.k off
  did -u echosys 26 | set %echox.ji off
  did -u echosys 27 | set %onjocl off
  did -u echosys 28 | set %echox.welc off
  did -u echosys 29 | set %e.band off
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
