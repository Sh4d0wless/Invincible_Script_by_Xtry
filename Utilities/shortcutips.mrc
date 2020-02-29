;___________________________________________
; Invincible by Xtry
; Shortcut Keys
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias sckey { if ($dialog(fkeys)) dialog -v fkeys | else dialog -m fkeys fkeys }
dialog fkeys {
  title Shortcut Keys
  icon graph/fkeyz.ico
  size 270 215 160 96
  option dbu
  list 1, 6 6 147 65, size
  box "", 2, 2 0 155 75
  check "Run On Start",4,3 82 50 15
  button "Close",3, 117 81 40 12,cancel
  text "Double Click To Run",5,50 76 60 7,disabled
}
on *:DIAlOG:fkeys:init:0:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll dll/mdx.dll SetFont 1,4,3,5 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 1,3 clientedge
  dll $mdllx SetControlMDX $dname 1 listview single  rowselect report flatsb grid labeltip nosortheader > dll/views.mdx
  did -i $dname 1 1 headerdims 60:1 213:2
  did -i $dname 1 1 headertext + 0 Key $tab Function
  did -a $dname 1 +0 F1 $+ $chr(9) $+ +0 Shortcut Keys Dialog
  did -a $dname 1 +0 F2 $+ $chr(9) $+ +0 Nickserv Identify
  did -a $dname 1 +0 F3 $+ $chr(9) $+ +0 Self Op & Deop
  did -a $dname 1 +0 F4 $+ $chr(9) $+ +0 Instant Kickban Highlighted Nick(s)
  did -a $dname 1 +0 F5 $+ $chr(9) $+ +0 Toggle User Mode ±R
  did -a $dname 1 +0 F6 $+ $chr(9) $+ +0 Change Nickname
  did -a $dname 1 +0 F7 $+ $chr(9) $+ +0 Ctcp Ping Yourself
  did -a $dname 1 +0 F8 $+ $chr(9) $+ +0 Cycle Current Channel
  did -a $dname 1 +0 F9 $+ $chr(9) $+ +0 Op+Voice Notice
  did -a $dname 1 +0 F10 $+ $chr(9) $+ +0 Secure Channel Mode +miRcMntl
  did -a $dname 1 +0 F11 $+ $chr(9) $+ +0 Clear Active Window
  did -a $dname 1 +0 F12 $+ $chr(9) $+ +0 Quit & Exit
  did -a $dname 1 +0 Shift+F1 $+ $chr(9) $+ +0 Away/Back Setup Mode
  did -a $dname 1 +0 Shift+F2 $+ $chr(9) $+ +0 Memo Express
  did -a $dname 1 +0 Shift+F3 $+ $chr(9) $+ +0 User List
  did -a $dname 1 +0 Shift+F4 $+ $chr(9) $+ +0 Enable/Disable Scripted Text
  did -a $dname 1 +0 Shift+F5 $+ $chr(9) $+ +0 Country Lookup
  did -a $dname 1 +0 Shift+F6 $+ $chr(9) $+ +0 Run Programs
  did -a $dname 1 +0 Shift+F7 $+ $chr(9) $+ +0 URL Manager
  did -a $dname 1 +0 Shift+F8 $+ $chr(9) $+ +0 Help Center
  did -a $dname 1 +0 Shift+F9 $+ $chr(9) $+ +0 Rejoin All Auto Join Channels
  did -a $dname 1 +0 Shift+F10 $+ $chr(9) $+ +0 Folder Browser
  did -a $dname 1 +0 Shift+F11 $+ $chr(9) $+ +0 Open/Close Tools Bar
  did -a $dname 1 +0 Shift+F12 $+ $chr(9) $+ +0 Search System
  did -a $dname 1 +0 Ctrl+F1 $+ $chr(9) $+ +0 Connector
  did -a $dname 1 +0 Ctrl+F2 $+ $chr(9) $+ +0 Oper Up (IRCop)
  did -a $dname 1 +0 Ctrl+F3 $+ $chr(9) $+ +0 Connect To Recent Server
  did -a $dname 1 +0 Ctrl+F4 $+ $chr(9) $+ +0 Notepad
  did -a $dname 1 +0 Ctrl+F5 $+ $chr(9) $+ +0 Random Nickname
  did -a $dname 1 +0 Ctrl+F6 $+ $chr(9) $+ +0 Auto Identify To All Nicknames
  did -a $dname 1 +0 Ctrl+F7 $+ $chr(9) $+ +0 Weather Forecaster
  did -a $dname 1 +0 Ctrl+F8 $+ $chr(9) $+ +0 Characters Map
  did -a $dname 1 +0 Ctrl+F9 $+ $chr(9) $+ +0 Channel Protection
  did -a $dname 1 +0 Ctrl+F10 $+ $chr(9) $+ +0 Script Pass Protection
  did -a $dname 1 +0 Ctrl+F11 $+ $chr(9) $+ +0 File Server Setup
  did -a $dname 1 +0 Ctrl+F12 $+ $chr(9) $+ +0 File Dropper
  if ( %sctips = on ) { did -c fkeys 4 }
  if ( %sctips = off ) { did -u fkeys 4 }
}
on *:dialog:fkeys:sclick:*:{
  if ($did == 4) { if ($did($dname,$did).state == 1) { set %sctips on } | else { set %sctips off } }
}
on *:dialog:fkeys:dclick:1:{
  if ($did = 1) {
    set %gtzfkeys $did($dname,1).seltext
    if (0 +fs 0 0 0 F1	+fs 0 0 0 isin %gtzfkeys) { f1 }
    if (0 +fs 0 0 0 F2	+fs 0 0 0 isin %gtzfkeys) { f2 }
    if (0 +fs 0 0 0 F3	+fs 0 0 0 isin %gtzfkeys) { f3 }
    if (0 +fs 0 0 0 F4	+fs 0 0 0 isin %gtzfkeys) { f4 }
    if (0 +fs 0 0 0 F5	+fs 0 0 0 isin %gtzfkeys) { f5 }
    if (0 +fs 0 0 0 F6	+fs 0 0 0 isin %gtzfkeys) { f6 }
    if (0 +fs 0 0 0 F7	+fs 0 0 0 isin %gtzfkeys) { f7 }
    if (0 +fs 0 0 0 F8	+fs 0 0 0 isin %gtzfkeys) { f8 }
    if (0 +fs 0 0 0 F9	+fs 0 0 0 isin %gtzfkeys) { f9 }
    if (0 +fs 0 0 0 F10	+fs 0 0 0 isin %gtzfkeys) { f10 }
    if (0 +fs 0 0 0 F11	+fs 0 0 0 isin %gtzfkeys) { f11 }
    if (0 +fs 0 0 0 F12	+fs 0 0 0 isin %gtzfkeys) { f12 }
    if (0 +fs 0 0 0 Shift+F1	+fs 0 0 0 isin %gtzfkeys) { sf1 }
    if (0 +fs 0 0 0 Shift+F2	+fs 0 0 0 isin %gtzfkeys) { sf2 }
    if (0 +fs 0 0 0 Shift+F3	+fs 0 0 0 isin %gtzfkeys) { sf3 }
    if (0 +fs 0 0 0 Shift+F4	+fs 0 0 0 isin %gtzfkeys) { sf4 }
    if (0 +fs 0 0 0 Shift+F5	+fs 0 0 0 isin %gtzfkeys) { sf5 }
    if (0 +fs 0 0 0 Shift+F6	+fs 0 0 0 isin %gtzfkeys) { sf6 }
    if (0 +fs 0 0 0 Shift+F7	+fs 0 0 0 isin %gtzfkeys) { sf7 }
    if (0 +fs 0 0 0 Shift+F8	+fs 0 0 0 isin %gtzfkeys) { sf8 }
    if (0 +fs 0 0 0 Shift+F9	+fs 0 0 0 isin %gtzfkeys) { sf9 }
    if (0 +fs 0 0 0 Shift+F10	+fs 0 0 0 isin %gtzfkeys) { sf10 }
    if (0 +fs 0 0 0 Shift+F11	+fs 0 0 0 isin %gtzfkeys) { sf11 }
    if (0 +fs 0 0 0 Shift+F12	+fs 0 0 0 isin %gtzfkeys) { sf12 }
    if (0 +fs 0 0 0 Ctrl+F1	+fs 0 0 0 isin %gtzfkeys) { cf1 }
    if (0 +fs 0 0 0 Ctrl+F2	+fs 0 0 0 isin %gtzfkeys) { cf2 }
    if (0 +fs 0 0 0 Ctrl+F3	+fs 0 0 0 isin %gtzfkeys) { cf3 }
    if (0 +fs 0 0 0 Ctrl+F4	+fs 0 0 0 isin %gtzfkeys) { cf4 }
    if (0 +fs 0 0 0 Ctrl+F5	+fs 0 0 0 isin %gtzfkeys) { cf5 }
    if (0 +fs 0 0 0 Ctrl+F6	+fs 0 0 0 isin %gtzfkeys) { cf6 }
    if (0 +fs 0 0 0 Ctrl+F7	+fs 0 0 0 isin %gtzfkeys) { cf7 }
    if (0 +fs 0 0 0 Ctrl+F8	+fs 0 0 0 isin %gtzfkeys) { cf8 }
    if (0 +fs 0 0 0 Ctrl+F9	+fs 0 0 0 isin %gtzfkeys) { cf9 }
    if (0 +fs 0 0 0 Ctrl+F10	+fs 0 0 0 isin %gtzfkeys) { cf10 }
    if (0 +fs 0 0 0 Ctrl+F11	+fs 0 0 0 isin %gtzfkeys) { cf11 }
    if (0 +fs 0 0 0 Ctrl+F12	+fs 0 0 0 isin %gtzfkeys) { cf12 }
  }
}

;Tips & Tricks
alias tips { if ($dialog(tips)) dialog -v tips | else dialog -m tips tips }
dialog tips {
  title "Tips & Tricks"
  size 1 215 259 119
  icon graph/lamp.ico
  icon 1, 219 10 32 32, graph\lamp.ico, 0
  text "Tips && Tricks :", 2, 4 8 80 16
  text "", 3, 4 29 201 55
  button "&Next", 4, 45 95 39 21
  button "&Exit", 5, 3 95 39 21, ok
  check "Run On Start", 6, 170 94 80 20
}

alias tips { $iif($dialog(tips),halt,dialog -m tips tips) }
on *:dialog:tips:init:*:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll dll/mdx.dll SetFont 2,3,4,5,6 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 4,5 clientedge
  $iif($cfg(other,tips) == on,did -c $dname 6) 
  dialog -t $dname Tips & Tricks
  did -ra $dname 3 $read utilities\tips.txt
  if ( %tips = on ) { did -c tips 6 }
  if ( %tips = off ) { did -u tips 6 }
}
on *:dialog:tips:sclick:*:{
  if ($did == 4) { did -ra $dname 3 $read utilities\tips.txt }
  if ($did == 6) { if ($did($dname,$did).state == 1) { set %tips on } | else { set %tips off } }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
