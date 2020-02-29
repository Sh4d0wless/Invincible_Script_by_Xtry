;___________________________________________
; Invincible by Xtry
; Auto Pinger
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias aping { if ($dialog(aping)) dialog -v aping | else dialog -m aping aping }
alias -l _ping.dir { return $shortfn($scriptdir) }
alias -l _ping.ini { return $shortfn($scriptdiraping.ini) }
alias -l _ping.wini { writeini -n $_ping.ini $1 $2 $3 }
alias -l _ping.rini { return $readini($_ping.ini,$1,$2) }
alias -l _ping.d {
  _ping.wini aping s y
  _ping.wini aping u y
  .enable #aping
  _ping.wini aping r n
  _ping.wini aping d 300
  _ping.wini aping t !ping
  if ($dialog(aping)) {
    did -c $dname 1,7,12
    did -r $dname 3,9
    did -u $dname 11,13
    did -a $dname 3 $_ping.rini(aping,d)
    did -a $dname 9 $_ping.rini(aping,t)
  }
}

dialog aping {
  title Auto Pinger
  icon graph/sck.ico
  size -1 -1 330 200

  check "Auto Ping to server",1,20 20 120 20
  text "Delay :",2,150 23 50 20
  edit "",3,195 20 70 20
  text "Seconds",4,270 23 50 20
  box "",5,10 5 310 45

  box "",6,10 43 310 110
  check "Auto Ping to user",7,20 58 120 20
  text "Trigger :",8,148 61 50 20
  edit "",9,195 58 115 20

  text "Reply :",10,150 90 50 20
  radio "Channel",11,195 88 70 20
  radio "Notice",12,195 108 70 20
  radio "Message",13,195 128 70 20

  box "",14,10 146 310 45
  button "Default",15,20 162 70 20
  button "Close",16,240 162 70 20,ok
}

on *:dialog:aping:init:*:{
  if ($_ping.rini(aping,s) = y) { did -c $dname 1 } | else { did -u $dname 1 }
  if ($_ping.rini(aping,u) = y) && ($group(#aping) = on) { did -c $dname 7 } | else { did -u $dname 7 }

  if ($_ping.rini(aping,r) = c) { did -c $dname 11 }
  if ($_ping.rini(aping,r) = n) { did -c $dname 12 }
  if ($_ping.rini(aping,r) = m) { did -c $dname 13 }

  did -a $dname 3 $_ping.rini(aping,d)
  did -a $dname 9 $_ping.rini(aping,t)
}

on *:dialog:aping:sclick:*:{
  if ($did = 1) { if ($did($dname,$did).state == 1) { _ping.wini aping s y } | else { _ping.wini aping s n } }
  if ($did = 7) { if ($did($dname,$did).state == 1) { _ping.wini aping u y | .enable #aping } | else { _ping.wini aping u n | .disable #aping } }

  if ($did = 11) { if ($did($dname,$did).state == 1) { _ping.wini aping r c } }
  if ($did = 12) { if ($did($dname,$did).state == 1) { _ping.wini aping r n } }
  if ($did = 13) { if ($did($dname,$did).state == 1) { _ping.wini aping r m } }

  if ($did = 15) { _ping.d }
}

on *:dialog:aping:edit:*:{
  if ($did = 3) { if ($did($dname,$did).text isnum) { _ping.wini aping d $did($dname,$did).text } }
  if ($did = 9) { _ping.wini aping t $did($dname,$did).text }
}

on *:connect:{ if ($_ping.rini(aping,s) = y) { .timeraping 0 $_ping.rini(aping,d) raw -q ping $me } | else { halt } }
#aping off
on *:text:*:#:{
  if ($_ping.rini(aping,t) isin $1-) && ($nick != $me) { _ping.wini aping tc $chan | ctcb $nick ping }
} 
on *:ctcpreply:ping*:{
  if ($nick != $me) {
    var %aping_ = 0
    %aping_ = $ctime - $2
    if ($_ping.rini(aping,r) = c) { _xmsg.c3 $_ping.rini(aping,tc) (Auto Pinger) $nick : Your Ping reply from $remove($address($me,2),*!*@) ( $+ $whois.country($remove($address($me,2),*!*@)) $+ ) in $server $+ : $+ $port is $duration(%aping_) - %name }
    if ($_ping.rini(aping,r) = n) { notice.p $nick (Auto Pinger) Your Ping reply from $remove($address($me,2),*!*@) ( $+ $whois.country($remove($address($me,2),*!*@)) $+ ) in $server $+ : $+ $port is $duration(%aping_) - %name }
    if ($_ping.rini(aping,r) = m) { _xmsg.q2 $nick (Auto Pinger) Your Ping reply from $remove($address($me,2),*!*@) ( $+ $whois.country($remove($address($me,2),*!*@)) $+ ) in $server $+ : $+ $port is $duration(%aping_) - %name }
    halt
  }
}
#aping end

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
