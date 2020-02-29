;___________________________________________
; Invincible by Xtry
; Kick Counter & Specified Kick Message Setup
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

dialog kk {
  title "Kick Counter"
  icon graph/kcounterx.ico
  size -1 -1 121 102
  option dbu
  box "Counter", 1, 3 2 115 39
  text "You had kick", 2, 16 13 32 8
  text "Time(s)", 3, 73 13 18 8
  edit %kick.count, 4, 49 12 22 10, disable, center
  button "Unset", 5, 49 26 23 10
  button "OK", 6, 90 87 27 12, ok
  check "Show kicknumber when you kick", 7, 9 57 91 10
  button "Msg", 8, 6 70 23 10
  text "Msg active chan your kickcount", 9, 33 71 77 8
  check "Enable Kick Counter", 10, 9 47 61 10
  box "Option", 11, 3 41 115 43
  text "Kick Counter", 12, 4 89 70 8, disable
}

On *:Dialog:kk:sclick:5:{ if ($did == 5) { set %kick.count 0 | set %kcount.date $time(HH:nn:ss dddd dd mmmm yyyy) } | if ($did == 5) did -ra kk 4 %kick.count }
On *:Dialog:kk:sclick:7:{ if ($did(7).state == 1) { set %show.kc On } | else { set %show.kc Off } }
On *:Dialog:kk:sclick:8:{
  if ($active = $chan) { _xmsg.c (Kick Counter) $me has kicked %kick.count nicknames since %kcount.date - %name }
  else { _xmsg.q (Kick Counter) $me has kicked %kick.count nicknames since %kcount.date - %name }
}
On *:Dialog:kk:sclick:10:{ if ($did(10).state == 1) { set %ac.kc On } | else { set %ac.kc Off } }
On *:Dialog:kk:init:*:{ if (%show.kc == On) { did -c kk 7 } | if (%ac.kc == On) { did -c kk 10 } }

alias kick {
  if (%ac.kc == Off) { raw -q kick $1 $2 : $+ $3- | halt }
  else {
    if (%show.kc == On) { raw -q kick  $1 $2 : $+ $3- - %kick.count }
    else { raw -q kick $1 $2 : $+ $3- }
  }
}
alias kickcounter { if ($dialog(kk)) dialog -v kk | else dialog -m kk kk }
on *:LOAD:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Kick Counter loaded succesfully
  if ($version < 5.71) {
    .timer 1 3 unload -rs $script
    halt
  }
}

alias kixset { if ($dialog(kk)) dialog -v kix | else dialog -m kix kix }
alias kix.default {
  did -r kix 18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,38
  set %kix.ad No advertising in here!
  set %kix.fl Flooding!
  set %kix.re No Repeats!
  set %kix.be Access Begging!
  set %kix.id Stop idling in here!
  set %kix.la Unacceptable language!
  set %kix.ni Change your nickname!
  set %kix.idt Bad UserID! change your ident!
  set %kix.sc Change your script!
  set %kix.cl No clones in here!
  set %kix.in Infected user!
  set %kix.ha Harrasing!
  set %kix.an Annoying!
  set %kix.sw No swearing here!
  set %kix.lam Lamer!
  set %kix.wa You've Been Warned!
  set %kix.inv Inviter!
  did -a kix 18 %kix.ad
  did -a kix 19 %kix.fl
  did -a kix 20 %kix.re
  did -a kix 21 %kix.be
  did -a kix 22 %kix.id
  did -a kix 23 %kix.la
  did -a kix 24 %kix.ni
  did -a kix 25 %kix.idt
  did -a kix 26 %kix.sc
  did -a kix 27 %kix.cl
  did -a kix 28 %kix.in
  did -a kix 29 %kix.ha
  did -a kix 30 %kix.an
  did -a kix 31 %kix.sw
  did -a kix 32 %kix.lam
  did -a kix 33 %kix.wa
  did -a kix 38 %kix.inv
}
dialog kix {
  title Specified Kick Message Setup
  icon graph/kix.ico
  size -1 -1 350 397

  box "",17,2 -3 345 355
  text "Advertising :" 1,10 10 80 13
  text "Flood :" 2,10 30 80 13
  text "Repeat :" 3,10 50 80 13
  text "Begging :" 4,10 70 80 13
  text "Idling :" 5,10 90 80 13
  text "Bad Language :" 6,10 110 80 13
  text "Bad Nickname :" 7,10 130 80 13
  text "Bad Ident :" 8,10 150 80 13
  text "Bad Script :" 9,10 170 80 13
  text "Clones :" 10,10 190 80 13
  text "Infected :" 11,10 210 80 13
  text "Harrasment :" 12,10 230 80 13
  text "Annoying :" 13,10 250 80 13
  text "Swearing :" 14,10 270 80 13
  text "Lamer :" 15,10 290 80 13
  text "Warned :" 16,10 310 80 13
  text "Inviting :" 37,10 330 80 13

  edit "",18,90 7 250 20,autohs
  edit "",19,90 27 250 20,autohs
  edit "",20,90 47 250 20,autohs
  edit "",21,90 67 250 20,autohs
  edit "",22,90 87 250 20,autohs
  edit "",23,90 107 250 20,autohs
  edit "",24,90 127 250 20,autohs
  edit "",25,90 147 250 20,autohs
  edit "",26,90 167 250 20,autohs
  edit "",27,90 187 250 20,autohs
  edit "",28,90 207 250 20,autohs
  edit "",29,90 227 250 20,autohs
  edit "",30,90 247 250 20,autohs
  edit "",31,90 267 250 20,autohs
  edit "",32,90 287 250 20,autohs
  edit "",33,90 307 250 20,autohs
  edit "",38,90 327 250 20,autohs
  box "",34,2 344 345 50
  button "Default",35,10 360 60 25
  button "Close",36,280 360 60 25,ok
}

on 1:dialog:kix:init:*: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetBorderStyle $dname 35,36 clientedge
  dll dll/mdx.dll SetFont 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,35,36,37 13 14 Tahoma
  did -a kix 18 %kix.ad
  did -a kix 19 %kix.fl
  did -a kix 20 %kix.re
  did -a kix 21 %kix.be
  did -a kix 22 %kix.id
  did -a kix 23 %kix.la
  did -a kix 24 %kix.ni
  did -a kix 25 %kix.idt
  did -a kix 26 %kix.sc
  did -a kix 27 %kix.cl
  did -a kix 28 %kix.in
  did -a kix 29 %kix.ha
  did -a kix 30 %kix.an
  did -a kix 31 %kix.sw
  did -a kix 32 %kix.lam
  did -a kix 33 %kix.wa
  did -a kix 38 %kix.inv
}
on 1:dialog:kix:sclick:*: {
  if ($did = 35) { kix.default }
}
on 1:dialog:kix:edit:*: {
  if ($did = 18) { set %kix.ad $did(18).text }
  if ($did = 19) { set %kix.fl $did(19).text }
  if ($did = 20) { set %kix.re $did(20).text }
  if ($did = 21) { set %kix.be $did(21).text }
  if ($did = 22) { set %kix.id $did(22).text }
  if ($did = 23) { set %kix.la $did(23).text }
  if ($did = 24) { set %kix.ni $did(24).text }
  if ($did = 25) { set %kix.idt $did(25).text }
  if ($did = 26) { set %kix.sc $did(26).text }
  if ($did = 27) { set %kix.cl $did(27).text }
  if ($did = 28) { set %kix.in $did(28).text }
  if ($did = 29) { set %kix.ha $did(29).text }
  if ($did = 30) { set %kix.an $did(30).text }
  if ($did = 31) { set %kix.sw $did(31).text }
  if ($did = 32) { set %kix.lam $did(32).text }
  if ($did = 33) { set %kix.wa $did(33).text }
  if ($did = 38) { set %kix.inv $did(38).text }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
