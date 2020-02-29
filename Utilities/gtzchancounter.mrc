;___________________________________________
; Invincible by Xtry
; Channel Activity Counter
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:Part:#:{
  if ($nick = $me) { halt }
  else {
    if (%xpart.Counter.1 == Enabled) {
      inc %xpart.counter. [ $+ [ $chan ] ]
      notice.p2 $nick (Channel Counter) You are number %xPart.counter. [ $+ [ $chan ] ] to part from $chan since i started counting. - %name
    }
  }
}
on *:kick:#:{
  if ($nick = $me) {
    if (!%kick.count) { set %kick.count 0 | set %kcount.date $time(HH:nn:ss dddd dd mmmm yyyy) }
    inc %kick.count 1
  }
  else {
    if (%xkick.Counter.1 == Enabled) {
      inc %xkick.counter. [ $+ [ $chan ] ]
      notice.p2 $knick (Channel Counter) You are number %xkick.counter. [ $+ [ $chan ] ] to be kicked from $chan since i started counting. - %name
    }
  }
}

on *:Join:#:{
  if ($nick = $me) { halt }
  else {
    if (%xjoin.Counter.1 == Enabled) {
      inc %xjoin.counter. [ $+ [ $chan ] ]
      notice.p2 $nick (Channel Counter) You are number %xjoin.counter. [ $+ [ $chan ] ] to join $chan since i started counting. - %name
    }
  }
}
alias chcount { if ($dialog(chcount)) dialog -v chcount | else dialog -m chcount chcount }
dialog chcount {
  size -1 -1 228 97
  title "Channel Activity Counter"
  icon graph/calcx.ico
  button "Close",1,7 73 60 18,ok
  box "",13,3 63 67 31
  box "",2,3 0 155 67
  check "Join Counter",3,10 12 80 13
  check "Part Counter",4,10 30 80 13
  check "Kick Counter",5,10 48 80 13
  button "Reset",6,100 10 50 18
  button "Reset",7,100 28 50 18
  button "Reset",8,100 46 50 18
  box "",9,156 0 68 67
  button "Reset All",10,160 10 60 18
  button "Enable All",11,160 28 60 18
  button "Disable All",12,160 46 60 18
}
on *:dialog:chcount:init:*:{
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 3,4,5,6,7,8,10,11,12,1 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 10,11,12,6,7,8,1 clientedge
  if (%xpart.Counter.1 == Enabled ) { did -c chcount 4 } | else { did -u chcount 4 }
  if (%xjoin.Counter.1 == Enabled ) { did -c chcount 3 } | else { did -u chcount 3 }
  if (%xkick.Counter.1 == Enabled ) { did -c chcount 5 } | else { did -u chcount 5 }
}
on *:dialog:chcount:sclick:*:{
  if ($did = 4) { if ($did($dname,$did).state == 1) { set %xpart.Counter.1 Enabled } | else { set %xpart.Counter.1 Disabled } }
  if ($did = 3) { if ($did($dname,$did).state == 1) { set %xjoin.Counter.1 Enabled } | else { set %xjoin.Counter.1 Disabled } }
  if ($did = 5) { if ($did($dname,$did).state == 1) { set %xkick.Counter.1 Enabled } | else { set %xkick.Counter.1 Disabled } }
  if ($did = 6) { unset %xjoin.counter. [ $+ [ $?="Reset which channel?" ] ] }
  if ($did = 7) { unset %xpart.counter. [ $+ [ $?="Reset which channel?" ] ] }
  if ($did = 8) { unset %xkick.counter. [ $+ [ $?="Reset which channel?" ] ] }
  if ($did = 10) { unset %xkick.counter.* | unset %xjoin.counter.* | unset %xpart.counter.* }
  if ($did = 11) {
    set %xpart.Counter.1 Enabled
    set %xjoin.Counter.1 Enabled
    set %xkick.Counter.1 Enabled
    did -c chcount 3,4,5
  }
  if ($did = 12) {
    set %xpart.Counter.1 Disabled
    set %xjoin.Counter.1 Disabled
    set %xkick.Counter.1 Disabled
    did -u chcount 3,4,5
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
