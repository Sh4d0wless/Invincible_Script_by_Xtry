;___________________________________________
; Invincible by Xtry
; Multi Network Info
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias servinfo if ($dialog(servinfo)) dialog -v servinfo | else dialog -m servinfo servinfo
dialog servinfo {
  title Multi Network Info
  icon graph/multi.ico
  size -1 -1 295 228
  button "OK", 1, 250 200 40 25, multi ok
  text "Channels:", 2, 10 87 55 13
  combo 3, 10 17 215 100, drop
  box "Network", 4, 2 2 290 42
  edit "", 5, 230 16 55 22.5, read
  box "Network", 6, 2 45 290 150
  text "Nick:", 7, 10 64 25 13
  edit "", 8, 40 60 75 22.5, read
  text "Server:", 9, 122 64 35 13
  edit "", 10, 160 60 125 22.5, read
  list 11, 10 104 105 100
  text "Users:", 12, 122 129 32 13, right
  edit "", 13, 155 125 40 22.5, read
  text "Ops:", 14, 122 149 32 13, right
  edit "", 15, 155 145 40 22.5, read
  text "Modes:", 16, 202 129 75 13
  edit "", 17, 240 125 40 22.5, read
  text "Voices:", 18, 202 149 75 13
  edit "", 19, 240 145 40 22.5, read
}

on *:DIALOG:servinfo:*:*:{
  if ($devent == init) {
    var %i = 1
    while ($scon(%i)) { did -a $dname 3 $scon(%i).network | inc %i }
    if ($did(3).lines) { did -c $dname 3 1 | _insert.info $did(3).sel }
  }
  if ($devent == sclick) {
    if ($did == 3) _insert.info $did(3).sel
    if ($did == 11) if ($did(11).sel) _insert.chan.info $did(3).sel $ifmatch
  }
}

alias _insert.info {
  scon $1 
  did -r $dname 11,13,15,17,19
  var %dido = did -o servinfo
  %dido 5 1 $scon($1).port
  %dido 6 1 $did(servinfo,3).seltext
  %dido 8 1 $scon($1).me
  %dido 10 1 $scon($1).server
  didtok servinfo 11 44 $scon($1).mychans
  scon -r
}

alias _insert.chan.info {
  scon $1
  var %dido = did -o servinfo
  %dido 13 1 $gettok($scon($1).totusers,$2,44)
  %dido 15 1 $gettok($scon($1).totops,$2,44)
  %dido 17 1 $gettok($scon($1).totmo,$2,44)
  %dido 19 1 $gettok($scon($1).totvo,$2,44)
  scon -r
}

alias mychans {
  var %i = 1, %result
  while ($chan(%i)) {
    %result = $addtok(%result,$ifmatch,44)
    inc %i
  }
  return $iif(%result,$ifmatch,0)
}

alias totusers {
  var %i = 1, %result
  while ($chan(%i)) {
    %result = $instok(%result,$nick($chan(%i),0),0,44)
    inc %i
  }
  return $iif(%result,$ifmatch,0)
}

alias totops {
  var %i = 1, %result
  while ($chan(%i)) {
    %result = $instok(%result,$opnick($chan(%i),0),0,44)
    inc %i
  }
  return $iif(%result,$ifmatch,0)
}

alias totvo {
  var %i = 1, %result
  while ($chan(%i)) {
    %result = $instok(%result,$vnick($chan(%i),0),0,44)
    inc %i
  }
  return $iif(%result,$ifmatch,0)
}

alias totmo {
  var %i = 1, %result
  while ($chan(%i)) {
    %result = $instok(%result,$chan(%i).mode,0,44)
    inc %i
  }
  return $iif(%result,$ifmatch,none)
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
