;___________________________________________
; Invincible by Xtry
; Tools Bar
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias barz { if ($dialog(barz)) dialog -v barz | else dialog -m barz barz }
dialog barz {
  title "Tools Bar"
  icon graph/toolbar.ico
  option dbu
  size 1 103 302 15
  check "Script Setup",3,1 1 60 13,push
  check "Utilities",4,61 1 60 13,push
  check "Entertainment",5,121 1 60 13,push
  check "Protections",6,181 1 60 13,push
  check "Miscellaneous",22,241 1 60 13,push

  button "",1,1 17 60 10
  button "",2,61 17 60 10
  button "",7,121 17 60 10
  button "",8,181 17 60 10
  button "",10,241 17 60 10

  button "",11,1 27 60 10
  button "",12,61 27 60 10
  button "",13,121 27 60 10
  button "",14,181 27 60 10
  button "",15,241 27 60 10

  button "",16,1 37 60 10
  button "",17,61 37 60 10
  button "",18,121 37 60 10
  button "",19,181 37 60 10
  button "",20,241 37 60 10

  button "",21,1 47 60 10
  button "",23,61 47 60 10
  button "",24,121 47 60 10
  button "",25,181 47 60 10
  button "",26,241 47 60 10

  button "",27,1 57 60 10
  button "",28,61 57 60 10
  button "",29,121 57 60 10
  button "",30,181 57 60 10
  button "",31,241 57 60 10

  button "",32,1 67 60 10
  button "",33,61 67 60 10
  button "",34,121 67 60 10
  button "",35,181 67 60 10
  button "",36,241 67 60 10

  button "",37,1 77 60 10
  button "",38,61 77 60 10
  button "",39,121 77 60 10
  button "",40,181 77 60 10
  button "",41,241 77 60 10

  button "",42,1 87 60 10
  button "",43,61 87 60 10
  button "",44,121 87 60 10
  button "",45,181 87 60 10
  button "",46,241 87 60 10
}
on *:dialog:barz:init:0:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll $mdllx SetMircVersion $version
  dll $mdllx MarkDialog $dname
  dll dll/mdx.dll SetFont 3,4,5,6,22,1,2,7,8,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 1,2,7,8,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46 staticedge
  dll dll/mdx.dll SetBorderStyle $dname 3,4,5,6,22 dlgmodal
}
on *:dialog:barz:sclick:*:{
  if ($did = 3) { barz3 }
  if ($did = 4) { barz4 }
  if ($did = 5) { barz5 }
  if ($did = 6) { barz6 }
  if ($did = 22) { barz7 }
  if ($did = 1) {
    if ($did(barz,3).state == 1) { aid }
    if ($did(barz,4).state == 1) { awaysys.config }
    if ($did(barz,5).state == 1) { gamez }
    if ($did(barz,6).state == 1) { secure.query }
    if ($did(barz,22).state == 1) { authorx }
  }
  if ($did = 2) {
    if ($did(barz,3).state == 1) { authx }
    if ($did(barz,4).state == 1) { memos }
    if ($did(barz,5).state == 1) { petz }
    if ($did(barz,6).state == 1) { as.settings }
    if ($did(barz,22).state == 1) { dialog -c barz barz | wingtz | barz }
  }
  if ($did = 7) {
    if ($did(barz,3).state == 1) { ghostkill }
    if ($did(barz,4).state == 1) { scanner }
    if ($did(barz,5).state == 1) { picplay }
    if ($did(barz,6).state == 1) { gtz.cpro }
    if ($did(barz,22).state == 1) { run mailto: InvincibleScript@yahoo.com }
  }
  if ($did = 8) {
    if ($did(barz,3).state == 1) { aoperz }
    if ($did(barz,4).state == 1) { urlc }
    if ($did(barz,5).state == 1) { tbox }
    if ($did(barz,6).state == 1) { pp }
    if ($did(barz,22).state == 1) { tips }
  }
  if ($did = 10) {
    if ($did(barz,3).state == 1) { aping }
    if ($did(barz,4).state == 1) { emailer }
    if ($did(barz,5).state == 1) { .timer -o 1 0 mp3stuffo }
    if ($did(barz,6).state == 1) { akick }
    if ($did(barz,22).state == 1) { sckey }
  }
  if ($did = 11) {
    if ($did(barz,3).state == 1) { xssctxt }
    if ($did(barz,4).state == 1) { fservx }
    if ($did(barz,5).state == 1) { bigfont $$?="Text: " }
    if ($did(barz,6).state == 1) { gtzpp }
    if ($did(barz,22).state == 1) { gtzhelp }
  }
  if ($did = 12) {
    if ($did(barz,3).state == 1) { gtzwav }
    if ($did(barz,4).state == 1) { userlist }
    if ($did(barz,5).state == 1) { triv.dlg }
    if ($did(barz,6).state == 1) { .run utilities/irclean.exe }
    if ($did(barz,22).state == 1) { cp }
  }
  if ($did = 13) {
    if ($did(barz,3).state == 1) { echosys }
    if ($did(barz,4).state == 1) { sysi }
    if ($did(barz,5).state == 1) { lyrics }
    if ($did(barz,6).state == 1) { tscan }
    if ($did(barz,22).state == 1) { connect2 }
  }
  if ($did = 14) {
    if ($did(barz,3).state == 1) { dccgtz }
    if ($did(barz,4).state == 1) { servinfo }
    if ($did(barz,5).state == 1) { sketch }
    if ($did(barz,22).state == 1) { logviews }
  }
  if ($did = 15) {
    if ($did(barz,3).state == 1) { nlc }
    if ($did(barz,4).state == 1) { personainx }
    if ($did(barz,22).state == 1) { rprog }
  }
  if ($did = 16) {
    if ($did(barz,3).state == 1) { tsgtz }
    if ($did(barz,4).state == 1) { dccinfo }
    if ($did(barz,22).state == 1) { run $$sdir="Select Directory to View" }
  }
  if ($did = 17) {
    if ($did(barz,3).state == 1) { introx }
    if ($did(barz,4).state == 1) { weafor }
    if ($did(barz,22).state == 1) { dfsearchf }
  }
  if ($did = 18) {
    if ($did(barz,3).state == 1) { kickcounter }
    if ($did(barz,4).state == 1) { time }
  }
  if ($did = 19) {
    if ($did(barz,3).state == 1) { aj }
    if ($did(barz,4).state == 1) { connexhis }
  }
  if ($did = 20) {
    if ($did(barz,3).state == 1) { gtzsctxt }
    if ($did(barz,4).state == 1) { gtzclookup $$?="Code/Domain for Country Lookup (ie : uk) :" }
  }
  if ($did = 21) {
    if ($did(barz,3).state == 1) { run utilities/found.txt }
    if ($did(barz,4).state == 1) { run utilities/iplookup/iplookup.exe }
  }
  if ($did = 23) {
    if ($did(barz,3).state == 1) { agreetx }
    if ($did(barz,4).state == 1) { charmap }
  }
  if ($did = 24) {
    if ($did(barz,3).state == 1) { thema }
    if ($did(barz,4).state == 1) { txt2c }
  }
  if ($did = 25) { if ($did(barz,4).state == 1) { run utilities/mc.exe } }
  if ($did = 26) { if ($did(barz,4).state == 1) { filetm } }
  if ($did = 27) { if ($did(barz,4).state == 1) { quoteman } }
  if ($did = 28) { if ($did(barz,4).state == 1) { ncpro } }
  if ($did = 29) { if ($did(barz,4).state == 1) { check.notify } }
  if ($did = 30) { if ($did(barz,4).state == 1) { kickpl } }
  if ($did = 31) { if ($did(barz,4).state == 1) { dialist } }
  if ($did = 32) { if ($did(barz,4).state == 1) { aregainn } }
  if ($did = 33) { if ($did(barz,4).state == 1) { Ip.scan } }
  if ($did = 34) { if ($did(barz,4).state == 1) { votebox } }
  if ($did = 35) { if ($did(barz,4).state == 1) { chcount } }
  if ($did = 36) { if ($did(barz,4).state == 1) { autotm } }
  if ($did = 37) { if ($did(barz,4).state == 1) { ignore.manager } }
  if ($did = 38) { if ($did(barz,4).state == 1) { seen } }
  if ($did = 39) { if ($did(barz,4).state == 1) { fav } }
  if ($did = 40) { if ($did(barz,4).state == 1) { padnote } }
  if ($did = 41) { if ($did(barz,4).state == 1) { fidrop } }
  if ($did = 42) { if ($did(barz,4).state == 1) { ftpad } }
  if ($did = 43) { if ($did(barz,4).state == 1) { qdialquit } }
  if ($did = 44) { if ($did(barz,4).state == 1) { alarmx } }
  if ($did = 45) { if ($did(barz,4).state == 1) { dict }
  }
}
alias barz3 {
  if ( $did(barz,3).state == 0 ) {
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 30
    dialog -t barz Tools Bar
    did -e barz 4,5,6,22
  }
  else {
    did -r $dname 1,2,7,8,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46
    did -a $dname 1 Auto Identify
    did -a $dname 2 Auto Thanks
    did -a $dname 7 Ghost Killer
    did -a $dname 8 Auto Oper
    did -a $dname 10 Auto Pinger
    did -a $dname 11 Text System
    did -a $dname 12 Sound System
    did -a $dname 13 Echo System
    did -a $dname 14 DCC Controls
    did -a $dname 15 Nicklist Colors
    did -a $dname 16 Timestamp Styler
    did -a $dname 17 Introduction Setup
    did -a $dname 18 Kick Counter
    did -a $dname 19 Auto Join
    did -a $dname 20 Scripted Text
    did -a $dname 21 Proxy Scanner Log
    did -a $dname 23 Auto Greet
    did -a $dname 24 Script Theme
    did -v $dname 1,2,7,8,10,11,12,13,14,15,16,17,18,19,20,21,23,24
    did -h $dname 25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 116
    dialog -t barz Tools Bar - Script Setup
    did -b barz 4,5,6,22
  }
}
alias barz4 {
  if ( $did(barz,4).state == 0 ) {
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 30
    dialog -t barz Tools Bar
    did -e barz 3,5,6,22
  }
  else {
    did -r $dname 1,2,7,8,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46
    did -a $dname 1 Away System
    did -a $dname 2 Memo Express
    did -a $dname 7 Net Scanner
    did -a $dname 8 URL Manager
    did -a $dname 10 Email Client
    did -a $dname 11 Fserv Setup
    did -a $dname 12 User List
    did -a $dname 13 System Info
    did -a $dname 14 Multi Network Info
    did -a $dname 15 Personal Info
    did -a $dname 16 DCC Transfer Info
    did -a $dname 17 Weather Forecaster
    did -a $dname 18 Time Info
    did -a $dname 19 Connections History
    did -a $dname 20 Country Lookup
    did -a $dname 21 IP Lookup
    did -a $dname 23 Chars Map
    did -a $dname 24 Text To Char
    did -a $dname 25 Measurement Conv.
    did -a $dname 26 Transfer Manager
    did -a $dname 27 Quote Manager
    did -a $dname 28 Nick Completor
    did -a $dname 29 Notify Viewer
    did -a $dname 30 Kicked User List
    did -a $dname 31 List Maker
    did -a $dname 32 Auto Regain Nick
    did -a $dname 33 IP && Nick Finder
    did -a $dname 34 Vote Machine
    did -a $dname 35 Channel Counter
    did -a $dname 36 Auto Timed Msg
    did -a $dname 37 Ignore Manager
    did -a $dname 38 Seen System
    did -a $dname 39 Favorites
    did -a $dname 40 Notepad
    did -a $dname 41 File Dropper
    did -a $dname 42 FTP Advertisement
    did -a $dname 43 Quits Editor
    did -a $dname 44 Alarm Clock
    did -a $dname 45 Dictionary
    did -v $dname 1,2,7,8,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45
    did -h $dname 46
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 196
    dialog -t barz Tools Bar - Utilities
    did -b barz 3,5,6,22
  }
}
alias barz5 {
  if ( $did(barz,5).state == 0 ) {
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 30
    dialog -t barz Tools Bar
    did -e barz 3,4,6,22
  }
  else {
    did -r $dname 1,2,7,8,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46
    did -a $dname 1 Personal Games
    did -a $dname 2 Funny Pets
    did -a $dname 7 Pic Player
    did -a $dname 8 Colorfull Text Box
    did -a $dname 10 mp3stuff Options
    did -a $dname 11 Big Fonts
    did -a $dname 12 Trivia Settings
    did -a $dname 13 Lyrics Finder
    did -a $dname 14 Sketch
    did -v $dname 1,2,7,8,10,11,12,13,14
    did -h $dname 15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 76
    dialog -t barz Tools Bar - Entertainment
    did -b barz 3,4,6,22
  }
}
alias barz6 {
  if ( $did(barz,6).state == 0 ) {
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 30
    dialog -t barz Tools Bar
    did -e barz 3,5,4,22
  }
  else {
    did -r $dname 1,2,7,8,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46
    did -a $dname 1 Secure Query
    did -a $dname 2 Anti Spambot
    did -a $dname 7 Status Prot
    did -a $dname 8 Personal Flood Prot
    did -a $dname 10 Channel Prot
    did -a $dname 11 Script Pass Prot
    did -a $dname 12 IRClean
    did -a $dname 13 Trojan Scanner
    did -v $dname 1,2,7,8,10,11,12,13
    did -h $dname 14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 76
    dialog -t barz Tools Bar - Protections
    did -b barz 3,5,4,22
  }
}
alias barz7 {
  if ( $did(barz,22).state == 0 ) {
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 30
    dialog -t barz Tools Bar
    did -e barz 3,5,4,6
  }
  else {
    did -r $dname 1,2,7,8,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46
    did -a $dname 1 About
    did -a $dname 2 Script Highlight
    did -a $dname 7 Email Author
    did -a $dname 8 Tips && Tricks
    did -a $dname 10 Shortcut Keys
    did -a $dname 11 Help Center
    did -a $dname 12 Control Panel
    did -a $dname 13 Connector
    did -a $dname 14 Log Viewer
    did -a $dname 15 Run Programs
    did -a $dname 16 Folder Browser
    did -a $dname 17 Search System
    did -v $dname 1,2,7,8,10,11,12,13,14,15,16,17
    did -h $dname 18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46
    dialog -s barz $dialog(barz).x $dialog(barz).y 604 96
    dialog -t barz Tools Bar - Miscellaneous
    did -b barz 3,5,4,6
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
