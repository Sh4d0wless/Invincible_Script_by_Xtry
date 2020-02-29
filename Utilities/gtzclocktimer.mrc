;___________________________________________
; Invincible by Xtry
; Time Info
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

; Syntax : /time
alias time { if ($dialog(time)) dialog -v time | else dialog -m time time }

; Popups aliases
alias _time.p { return $time(HH:nn:ss ddd dd mmm yyyy) }

; Title
alias _time.v { return Time Info }

; Local aliases
alias -l _time.dir { return $shortfn($scriptdir) }
alias _time.ini { return $shortfn($scriptdirtime.ini) }
alias -l _time.wini { writeini -n $_time.ini $1 $2 $3 }
alias -l _time.mkini { writeini -c $_time.ini $1 $2 $3 }
alias _time.rini { return $readini($_time.ini,$1,$2) }
alias -l _time.p { return $time(HH:nn:ss ddd dd mmm yyyy) }
alias -l _time.load {
  if ($exists($_time.ini) = $false) {
    _time.mkini r m 0
    _time.mkini r i 0
    _time.mkini r a 0
    _time.mkini r o 0
    _time.mkini r s 0
  }
  else { _time.dini }
}
alias -l _time.dini {
  if ($_time.rini(r,m) = $null) { _time.wini r m 0 }
  if ($_time.rini(r,i) = $null) { _time.wini r i 0 }
  if ($_time.rini(r,a) = $null) { _time.wini r a 0 }
  if ($_time.rini(r,o) = $null) { _time.wini r o 0 }
  if ($_time.rini(r,s) = $null) { _time.wini r s 0 }
}
alias _time.msg {
  if ($active = $chan) { _xmsg.c (Time Info) $1- - %name }
  else { _xmsg.q (Time Info) $1- - %name }
}
alias -l _time.c {
  if ($1 = m) {
    if ($3 > $2) { _time.wini r m $3 }
  }
  if ($1 = i) {
    if ($3 > $2) { _time.wini r i $3 }
  }
  if ($1 = a) {
    if ($3 > $2) { _time.wini r a $3 }
  }
  if ($1 = o) {
    if ($3 > $2) { _time.wini r o $3 }
  }
  if ($1 = s) {
    if ($3 > $2) { _time.wini r s $3 }
  }
}
alias -l _time {
  if ($dialog(time) = $null) {
    _time.c m $_time.rini(r,m) $uptime(mirc,3)
    _time.c i $_time.rini(r,i) $idle
    _time.c a $_time.rini(r,a) $awaytime
    _time.c o $_time.rini(r,o) $uptime(server,3)
    _time.c s $_time.rini(r,s) $uptime(system,3)
  }
  else {
    did -o time 7 1 $time(HH:nn:ss dddd dd mmmm yyyy zzz)
    did -o time 9 1 $uptime(mirc,1) | _time.c m $_time.rini(r,m) $uptime(mirc,3) | did -o time 23 1 $duration($_time.rini(r,m))
    did -o time 10 1 $duration($idle) | _time.c i $_time.rini(r,i) $idle | did -o time 24 1 $duration($_time.rini(r,i))
    did -o time 1 1 $duration($awaytime) | _time.c a $_time.rini(r,a) $awaytime | did -o time 4 1 $duration($_time.rini(r,a))
    did -o time 11 1 $uptime(server,1) | _time.c o $_time.rini(r,o) $uptime(server,3) | did -o time 25 1 $duration($_time.rini(r,o))
    did -o time 12 1 $uptime(system,1) | _time.c s $_time.rini(r,s) $uptime(system,3) | did -o time 26 1 $duration($_time.rini(r,s))
  }
}

; Dialog
dialog time {
  title $_time.v
  icon graph/time.ico
  size -1 -1 550 135

  edit "",7,50 5 490 20,center read autohs
  edit "",9,50 30 200 20,center read autohs
  edit "",10,50 50 200 20,center read autohs
  edit "",1,50 70 200 20,center read autohs
  edit "",11,50 90 200 20,center read autohs
  edit "",12,50 110 200 20,center read autohs

  text "Time",13,10 9 35 20
  text "mIRC",15,10 34 35 20
  text "Idle",16,10 54 35 20
  text "Away",2,10 74 35 20
  text "Online",17,10 94 35 20
  text "System",18,10 114 35 20

  text "Record",19,255 34 35 20
  text "Record",20,255 54 35 20
  text "Record",3,255 74 35 20
  text "Record",21,255 94 35 20
  text "Record",22,255 114 35 20

  edit "",23,295 30 200 20,center read autohs
  edit "",24,295 50 200 20,center read autohs
  edit "",4,295 70 200 20,center read autohs
  edit "",25,295 90 200 20,center read autohs
  edit "",26,295 110 200 20,center read autohs

  button "Reset",30,500 30 40 20
  button "Reset",31,500 50 40 20
  button "Reset",32,500 70 40 20
  button "Reset",33,500 90 40 20
  button "Reset",34,500 110 40 20
}

; Init event for time dialog
on *:dialog:time:init:*:{
  _time.dini
  .timertime 0 0 _time
}

; Sclick event for time dialog (Reset)
on *:dialog:time:sclick:*:{
  if ($did = 30) { if ($?!="Are you sure you want to reset mIRC Uptime Record ?" = $true) { _time.wini r m 0 } | else { halt } }
  if ($did = 31) { if ($?!="Are you sure you want to reset Idle Time Record ?" = $true) { _time.wini r i 0 } | else { halt } }
  if ($did = 32) { if ($?!="Are you sure you want to reset Away Time Record ?" = $true) { _time.wini r a 0 } | else { halt } }
  if ($did = 33) { if ($?!="Are you sure you want to reset Online Time Record ?" = $true) { _time.wini r o 0 } | else { halt } }
  if ($did = 34) { if ($?!="Are you sure you want to reset System Uptime Record ?" = $true) { _time.wini r s 0 } | else { halt } }
}

; This is where the script works
on *:start:{  _time.c s $_time.rini(r,s) $uptime(system,3) }
on *:exit:{ _time.dini }
on *:connect:{ _time.dini }
on *:disconnect:{ _time.dini }


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
