;___________________________________________
; Invincible by xtry
; Nicklist Colors
; mailto: xtry@pcpostal.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

#cnl on
on *:join:#:{ 
  if ($nick == $me) { .timer 3 1 make.co }
  else { 
    if ($nick isreg $chan) { cline %cnl.reg $chan $nick }
    if ($nick isvo $chan) { cline %cnl.voice $chan $nick }
    if ($nick ishelp $chan) { cline %cnl.help $chan $nick }
    if ($nick isop $chan) { cline %cnl.op $chan $nick }
    if ($nick == $me) { cline %cnl.me $chan $nick }
    if ($nick isnotify) { cline %cnl.notify $chan $nick }
    if ($nick $+ !*@* isignore) { cline %cnl.ignore $chan $nick } 
  }
}
on *:OP:#:{
  if ($opnick == $me) { cline %cnl.me $chan $opnick | halt }
  if ($opnick isnotify) { cline %cnl.notify $chan $opnick | halt }
  if ($opnick $+ !*@* isignore) { cline %cnl.ignore $chan $opnick | halt }
  cline %cnl.op $chan $opnick 
}
on *:serverOP:#:{
  if ($opnick == $me) { cline %cnl.me $chan $opnick | halt }
  if ($opnick isnotify) { cline %cnl.notify $chan $opnick | halt }
  if ($opnick $+ !*@* isignore) { cline %cnl.ignore $chan $opnick | halt }
  cline %cnl.op $chan $opnick 
}
on *:DEOP:#:{
  if ($opnick == $me) { cline %cnl.me $chan $opnick | halt }
  if ($opnick ishelp $chan) { cline %cnl.voice $chan $opnick | halt }
  if ($opnick isvo $chan) { cline %cnl.voice $chan $opnick | halt }
  if ($opnick isnotify) { cline %cnl.notify $chan $opnick | halt }
  if ($opnick $+ !*@* isignore) { cline %cnl.ignore $chan $opnick | halt }
  cline %cnl.reg $chan $opnick 
}

on *:HELP:#:{
  if ($hnick == $me) { cline %cnl.me $chan $hnick | halt }
  if ($hnick isnotify) { cline %cnl.notify $chan $hnick | halt }
  if ($hnick $+ !*@* isignore) { cline %cnl.ignore $chan $hnick | halt }
  if ($hnick isop $chan) { cline %cnl.op $chan $hnick | halt }
  cline %cnl.help $chan $hnick 
}
on *:DEHELP:#:{
  if ($hnick == $me) { cline %cnl.me $chan $hnick | halt }
  if ($hnick isop $chan) { cline %cnl.op $chan $hnick | halt }
  if ($hnick isnotify) { cline %cnl.notify $chan $hnick | halt }
  if ($hnick $+ !*@* isignore) { cline %cnl.ignore $chan $hnick | halt }
  if ($hnick isvo $chan) { cline %cnl.voice $chan $hnick | halt }
  cline %cnl.reg $chan $hnick 
}
on *:VOICE:#:{
  if ($vnick == $me) { cline %cnl.me $chan $vnick | halt }
  if ($vnick isnotify) { cline %cnl.notify $chan $vnick | halt }
  if ($vnick $+ !*@* isignore) { cline %cnl.ignore $chan $vnick | halt }
  if ($vnick isop $chan) { cline %cnl.op $chan $vnick | halt }
  if ($vnick ishelp $chan) { cline %cnl.help $chan $vnick | halt }
  cline %cnl.voice $chan $vnick 
}
on *:DEVOICE:#:{
  if ($vnick == $me) { cline %cnl.me $chan $vnick | halt }
  if ($vnick isnotify) { cline %cnl.notify $chan $vnick | halt }
  if ($vnick $+ !*@* isignore) { cline %cnl.ignore $chan $vnick | halt }
  if ($vnick isop $chan) { cline %cnl.op $chan $vnick | halt }
  if ($vnick ishelp $chan) { cline %cnl.help $chan $vnick | halt }
  cline %cnl.reg $chan $vnick 
}
#cnl end

dialog cnl {
  title "Nicklist Colors"
  icon graph\colors.ico
  size 250 150 300 300
  button "&OK",1, 30 245 50 25,ok,default 
  button "Cancel",2, 80 245 50 25,cancel
  text "Nicklist Colors" ,99, 30 280 1000 1000
  box "Me",3, 30 10 100 50
  combo 4, 40 30 80 100,drop
  box "Op Color",5, 170 10 100 50psd
  combo 6, 180 30 80 100,drop
  box "Help Color",7, 170 80 100 50
  combo 8, 180 100 80 100,drop
  box "Voice Color",9, 170 150 100 50
  combo 10, 180 170  80 100,drop
  box "Reg Color",11, 170 220 100 50
  combo 12, 180 240 80 100,drop
  box "Notify`s Color" ,13, 30 80 100 50 
  combo 14, 40 100 80 100,drop
  box "Ignored Color" ,15, 30 150 100 50
  combo 16, 40 170 80 100,drop
  radio "On",17, 38 220 40 15
  radio "Off",18, 88 220 40 15
}

on *:dialog:cnl:init:0:{
  did -i cnl 4,6,8,10,12,14,16 1 White (0)
  did -i cnl 4,6,8,10,12,14,16 2 Black (1)
  did -i cnl 4,6,8,10,12,14,16 3 Blue (2)
  did -i cnl 4,6,8,10,12,14,16 4 Green (3)
  did -i cnl 4,6,8,10,12,14,16 5 LightRed (4)
  did -i cnl 4,6,8,10,12,14,16 6 Brown (5)
  did -i cnl 4,6,8,10,12,14,16 7 Purple (6)
  did -i cnl 4,6,8,10,12,14,16 8 Orange (7)
  did -i cnl 4,6,8,10,12,14,16 9 Yellow (8)
  did -i cnl 4,6,8,10,12,14,16 10 LightGreen (9)
  did -i cnl 4,6,8,10,12,14,16 11 Cyan (10)
  did -i cnl 4,6,8,10,12,14,16 12 LightCyan (11)
  did -i cnl 4,6,8,10,12,14,16 13 LightBlue (12)
  did -i cnl 4,6,8,10,12,14,16 14 Pink (13)
  did -i cnl 4,6,8,10,12,14,16 15 Grey (14)
  did -i cnl 4,6,8,10,12,14,16 16 LightGrey (15)
  did -c cnl 4 $calc(%cnl.me +1)
  did -c cnl 6 $calc(%cnl.op +1)
  did -c cnl 8 $calc(%cnl.help +1)
  did -c cnl 10 $calc(%cnl.voice +1)
  did -c cnl 12 $calc(%cnl.reg +1)
  did -c cnl 14 $calc(%cnl.notify +1)
  did -c cnl 16 $calc(%cnl.ignore +1)
  if ($group(#cnl) == on) { did -c $dname 17 }
  if ($group(#cnl) == off) { did -c $dname 18 | did -b $dname 3,4,5,6,7,8,9,10,11,12,13,14,15,16 }
}
on *:dialog:cnl:*:1:{
  set %cnl.me $calc($did(cnl,4).sel -1)
  set %cnl.op $calc($did(cnl,6).sel -1)
  set %cnl.help $calc($did(cnl,8).sel -1)
  set %cnl.voice $calc($did(cnl,10).sel -1)
  set %cnl.reg $calc($did(cnl,12).sel -1)
  set %cnl.notify $calc($did(cnl,14).sel -1)
  set %cnl.ignore $calc($did(cnl,16).sel -1)
  if ($did(cnl,17).state == 1) { .enable #cnl | make.co  }
  if ($did(cnl,18).state == 1) { .disable #cnl | un.co }
}
on *:DIALOG:cnl:sclick:17:{ did -e $dname 3,4,5,6,7,8,9,10,11,12,13,14,15,16 }
on *:DIALOG:cnl:sclick:18:{ did -b $dname 3,4,5,6,7,8,9,10,11,12,13,14,15,16 }

alias make.co {
  set -u0 %i 1
  while (%i <= $chan(0)) {
    set -u0 %j 1
    while (%j <= $nick($chan(%i),0)) {
      if ($nick($chan(%i),%j) isreg $chan(%i)) { cline %cnl.reg $chan(%i) $nick($chan(%i),%j)) }
      if ($nick($chan(%i),%j) isvo $chan(%i)) { cline %cnl.voice $chan(%i) $nick($chan(%i),%j)) }
      if ($nick($chan(%i),%j) ishelp $chan(%i)) { cline %cnl.help $chan(%i) $nick($chan(%i),%j)) }
      if ($nick($chan(%i),%j) isop $chan(%i)) { cline %cnl.op $chan(%i) $nick($chan(%i),%j)) }
      if ($nick($chan(%i),%j) == $me) { cline %cnl.me $chan(%i) $nick($chan(%i),%j)) }
      if ($nick($chan(%i),%j) isnotify) { cline %cnl.notify $chan(%i) $nick($chan(%i),%j)) }
      if ($nick($chan(%i),%j) $+ !*@* isignore) { cline %cnl.ignore $chan(%i) $nick($chan(%i),%j)) }
      inc %j
    }
    inc %i
  }
}
alias un.co { 
  set -u0 %i 1
  while (%i <= $chan(0)) {
    set -u0 %j 1
    while (%j <= $nick($chan(%i),0)) { 
      if ($nick($chan(%i),%j) ison $chan(%i)) { cline 01 $chan(%i) $nick($chan(%i),%j)) }
      inc %j
    }
    inc %i
  }
}
alias cnl { dialog -m cnl cnl }

;___________________________________________________________________________
; Copyright © 2001 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: xtry on dalnet.
; mailto: xtry@pcpostal.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
