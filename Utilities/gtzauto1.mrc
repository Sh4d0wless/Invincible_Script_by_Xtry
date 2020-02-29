;___________________________________________
; Invincible by Xtry
; Auto Thanks & Auto Timed Message & Auto Greet
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias agreetx { if ($dialog(agreet)) dialog -v agreet | else dialog -m agreet agreet }
alias agreetn-init {
  var %agreet-n = 0
  while (%agreet-n < $lines(utilities/agreet/nick.txt)) {
    inc %agreet-n 1
    { did -a agreet 11 $read(utilities/agreet/nick.txt,%agreet-n) }
  }
}

alias agreetc-init {
  var %agreet-c = 0
  while (%agreet-c < $lines(utilities/agreet/chan.txt)) {
    inc %agreet-c 1
    { did -a agreet 5 $read(utilities/agreet/chan.txt,%agreet-c) }
  }
}
alias join.agreetnadd {
  if ($lines(utilities/agreet/chan.txt) >= 1) {
    var %join.agreetn = 0
    while (%join.agreetn < $lines(utilities/agreet/chan.txt)) {
      inc %join.agreetn 1
      { writeini -n utilities/agreet/join.ini $read(utilities/agreet/chan.txt,%join.agreetn) $did($dname,11).text 0 | writeini -n utilities/agreet/date.ini $read(utilities/agreet/chan.txt,%join.agreetn) $did($dname,11).text 0 }
    }
  }
}
alias join.agreetnrem {
  if ($lines(utilities/agreet/chan.txt) >= 1) {
    var %join.agreetn = 0
    while (%join.agreetn < $lines(utilities/agreet/chan.txt)) {
      inc %join.agreetn 1
      { remini utilities/agreet/join.ini $read(utilities/agreet/chan.txt,%join.agreetn) $did($dname,11).text | remini utilities/agreet/date.ini $read(utilities/agreet/chan.txt,%join.agreetn) $did($dname,11).text }
    }
  }
}

alias join.agreetcadd {
  if ($lines(utilities/agreet/nick.txt) >= 1) {
    var %join.agreetc = 0
    while (%join.agreetc < $lines(utilities/agreet/nick.txt)) {
      inc %join.agreetc 1
      { writeini -n utilities/agreet/join.ini $did($dname,5).text $read(utilities/agreet/nick.txt,%join.agreetc) 0 | writeini -n utilities/agreet/date.ini $did($dname,5).text $read(utilities/agreet/nick.txt,%join.agreetc) 0 }
    }
  }
}

alias join.agreetcrem {
  if ($lines(utilities/agreet/nick.txt) >= 1) {
    var %join.agreetc = 0
    while (%join.agreetc < $lines(utilities/agreet/nick.txt)) {
      inc %join.agreetc 1
      { remini utilities/agreet/join.ini $did($dname,5).text | remini utilities/agreet/date.ini $did($dname,5).text }
    }
  }
}

dialog agreet {
  size -1 -1 548 315
  title "Auto Greet"
  icon graph/agreet.ico
  box "",24,442 260 100 50
  button "Close",1,452 275 80 25,ok

  box "",23,5 260 181 50
  radio "Enable",2,15 275 80 25,push group
  radio "Disable",3,95 275 80 25,push

  ;channels
  box "Auto Greet Channels :",4,5 5 172 145
  combo 5,15 23 150 120

  box "",6,175 5 100 145
  button "Add",7,185 23 80 20,disable
  button "Remove",8,185 44 80 20,disable

  check "All Channels",9,185 120 80 20,push

  ;nicknames
  box "Auto Greet Nicknames :",10,273 5 172 145
  combo 11,283 23 150 120

  box "",12,443 5 100 145
  button "Add",13,453 23 80 20,disable
  button "Remove",14,453 44 80 20,disable
  check "All Nicknames",19,453 120 80 20,push

  ;message
  box "Greet Message (Listed Nicknames) :",16,5 150 538 50
  edit "",17, 15 168 430 20,autohs
  button "Update",18,453 168 80 20,disable

  box "Greet Message (All Nicknames) :",20,5 200 538 50
  edit "",21, 15 218 430 20,autohs
  button "Update",22,453 218 80 20,disable
}
on 1:dialog:agreet:sclick:*:{
  if ($did = 5) {
    if ($did($dname,5).sel isnum) {
      did -b agreet 7
      did -e agreet 8
    }
  }
  if ($did = 2) { set %agreetin on }
  if ($did = 3) { set %agreetin off }
  if ($did = 9) { if ($did($dname,$did).state == 1) { set %agreet.ach yes } | else { set %agreet.ach no } }
  if ($did = 19) { if ($did($dname,$did).state == 1) { set %agreet.ani yes | did -e agreet 21 } | else { set %agreet.ani no | did -b agreet 21 } }
  if ($did = 7) {
    join.agreetcadd
    .write utilities/agreet/chan.txt $cgreet($did($dname,5).text)
    did -r $dname 5
    agreetc-init
  }
  if ($did = 8) {
    join.agreetcrem
    .write -ds $+ $cgreet($did($dname,5).text) utilities\agreet\chan.txt
    did -r $dname 5
    agreetc-init
  }
  if ($did = 11) {
    if ($did($dname,11).sel isnum) {
      did -r $dname 17
      did -b agreet 13,18
      did -e agreet 14
      did -a $dname 17 $readini(utilities\agreet\msg.ini,Messages,$did($dname,11).text)
    }
  }
  if ($did = 13) {
    if ($did($dname,17).text = $null) { writeini -n utilities\agreet\msg.ini Messages $did($dname,11).text No Message } | else { writeini -n utilities\agreet\msg.ini Messages $did($dname,11).text $did($dname,17).text }
    else { beep }
    join.agreetnadd
    .write utilities\agreet\nick.txt $did($dname,11).text
    did -r $dname 11
    agreetn-init
  }
  if ($did = 14) {
    join.agreetnrem
    .remini utilities\agreet\msg.ini Messages $did($dname,11).text
    .write -ds $+ $did($dname,11).text utilities\agreet\nick.txt
    did -r $dname 11,17
    did -b $dname 18
    agreetn-init
  }
  if ($did = 18) {
    if ($did($dname,11).sel isnum) && ($did($dname,11).text != $null) {
      .writeini -n utilities\agreet\msg.ini Messages $did($dname,11).text $did($dname,17).text
      did -r $dname 17
      did -a $dname 17 $readini(utilities\agreet\msg.ini,Messages,$did($dname,11).text)
    }
    else { beep }
  }
  if ($did = 22) {
    if ($did($dname,21).text != $null) {
      .writeini -n utilities\agreet\msg.ini All Nicks $did($dname,21).text
      did -r $dname 21
      did -a $dname 21 $readini(utilities\agreet\msg.ini,All,Nicks)
    }
    else { beep }
  }
}
on 1:dialog:agreet:init:*:{
  agreetc-init
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,2,3,4,5,6,7,8,9,10,11,12,13,14,16,17,18,19,20,21,22 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 1,2,3,7,8,9,13,14,17,18,19,22 clientedge
  if (%agreetin = on) { did -c agreet 2 } | else { did -c agreet 3 }
  if (%agreet.ach = yes) { did -c agreet 9 } | else { did -u agreet 9 }
  if (%agreet.ani = yes) { did -c agreet 19 | did -e agreet 21 } | else { did -u agreet 19 | did -b agreet 21 }
  did -a agreet 21 $readini(utilities\agreet\msg.ini,All,Nicks)
  agreetn-init
}
on 1:dialog:agreet:edit:*:{
  if ($did = 5) {
    if ($left($did(5).text,1) != $chr(35)) {
      did -b agreet 7
      did -b agreet 8
    }
    else { did -e agreet 7 | did -b agreet 8 }
  }
  if ($did = 11) {
    if ($left($did(11).text,1) = $chr(35)) || ($left($did(11).text,1) isnum) || ($left($did(11).text,1) = $null) || ($chr(46) isin $did(11).text) {
      did -b agreet 13,14,18
      did -r agreet 17
    }
    else { did -e agreet 13 | did -b agreet 14 }
  }
  if ($did = 17) {
    if ($left($did(17).text,1) != $null) && ($did($dname,11).sel isnum) {
      did -e $dname 18
    }
    else { did -b $dname 18 }
  }
  if ($did = 21) {
    if ($left($did(21).text,1) != $null) {
      did -e $dname 22
    }
    else { did -b $dname 22 }
  }
}
on *:join:#:{
  if (%agreetin = on) && ($nick != $me) {
    if (%agreet.ach = yes) {
      if ($nick == $read(utilities/agreet/nick.txt,w,$nick)) && ($ini(utilities/agreet/msg.ini,Messages,$replace($nick,[,~,],~)) > 0) { _xmsg.c2 (Auto Greet) $nick : $replace($readini(utilities/agreet/msg.ini,Messages,$replace($nick,[,~,],~)),<nick>,$nick,<chan>,$chan) }
      else {
        if (%agreet.ani = yes) { _xmsg.c2 (Auto Greet) $nick : $replace($readini(utilities/agreet/msg.ini,All,Nicks),<nick>,$nick,<chan>,$chan) }
        else { halt }
      }
    }
    else {
      if (%agreet.ach = no) && ($chan == $read(utilities/agreet/chan.txt,w,$chan)) {
        if ($nick == $read(utilities/agreet/nick.txt,w,$nick)) && ($ini(utilities/agreet/msg.ini,Messages,$replace($nick,[,~,],~)) > 0) {
          if ($readini(utilities/agreet/join.ini,$replace($chan,[,~,],~),$replace($nick,[,~,],~)) = 0) && ($readini(utilities/agreet/date.ini,$replace($chan,[,~,],~),$replace($nick,[,~,],~)) = 0) {
            writeini -n utilities/agreet/join.ini $chan $nick $calc($readini(utilities/agreet/join.ini,$replace($chan,[,~,],~),$nick) + 1)
            writeini -n utilities/agreet/date.ini $chan $nick $time(HH:nn:ss dddd dd mmmm yyyy)
            _xmsg.c2 (Auto Greet) $nick ( $+ $readini(utilities/agreet/join.ini,$replace($chan,[,~,],~),$replace($nick,[,~,],~)) joins for $chan since $readini(utilities/agreet/date.ini,$replace($chan,[,~,],~),$replace($nick,[,~,],~)) $+ ) : $replace($readini(utilities/agreet/msg.ini,Messages,$replace($nick,[,~,],~)),<nick>,$nick,<chan>,$chan)
          }
          else {
            writeini -n utilities/agreet/join.ini $chan $nick $calc($readini(utilities/agreet/join.ini,$replace($chan,[,~,],~),$nick) + 1)
            _xmsg.c2 (Auto Greet) $nick ( $+ $readini(utilities/agreet/join.ini,$replace($chan,[,~,],~),$replace($nick,[,~,],~)) joins for $chan since $readini(utilities/agreet/date.ini,$replace($chan,[,~,],~),$replace($nick,[,~,],~)) $+ ) : $replace($readini(utilities/agreet/msg.ini,Messages,$replace($nick,[,~,],~)),<nick>,$nick,<chan>,$chan)
          }
        }
        else {
          if (%agreet.ani = yes) { _xmsg.c2 (Auto Greet) $nick : $replace($readini(utilities/agreet/msg.ini,All,Nicks),<nick>,$nick,<chan>,$chan) }
          else { halt }
        }
      }
    }
  }
  else { halt }
}

alias authx { if ($dialog(authx)) dialog -v authx | else dialog -m authx authx }
dialog authx {
  size -1 -1 223 122
  title "Event Reply (Auto Thanks)"
  icon graph/ajoin.ico
  option dbu
  button "Ok",1,189 108 30 10,ok
  box "",25,187 103 34 17
  box "On Op (+o)",2,2 2 70 23
  radio "Enable",3,7 10 30 10,push group
  radio "Disable",4,37 10 30 10,push
  box "On Voice (+v)",5,2 28 70 23
  radio "Enable",6,7 36 30 10,push group
  radio "Disable",7,37 36 30 10,push
  box "On Deop (-o)",13,2 54 70 23
  radio "Enable",14,7 62 30 10,push group
  radio "Disable",15,37 62 30 10,push
  box "On Devoice (-v)",16,2 80 70 23
  radio "Enable",17,7 88 30 10,push group
  radio "Disable",18,37 88 30 10,push
  box "Reply Message :",9,71 2 150 23
  box "Reply Message :",10,71 28 150 23
  box "Reply Message :",19,71 54 150 23
  box "Reply Message :",20,71 80 150 23
  edit "",11,75 10 142 11,autohs
  edit "",12,75 36 142 11,autohs
  edit "",21,75 62 142 11,autohs
  edit "",22,75 88 142 11,autohs
  button "Default",23,4 108 30 10
  box "",24,2 103 34 17
}
on 1:dialog:authx:sclick:*: {
  if ($did = 3) { set %othx on | did -n authx 11 }
  if ($did = 4) { set %othx off | did -m authx 11 }
  if ($did = 6) { set %vthx on | did -n authx 12 }
  if ($did = 7) { set %vthx off | did -m authx 12 }
  if ($did = 14) { set %dothx on | did -n authx 21 }
  if ($did = 15) { set %dothx off | did -m authx 21 }
  if ($did = 17) { set %dvthx on | did -n authx 22 }
  if ($did = 18) { set %dvthx off | did -m authx 22 }
  if ($did = 23) {
    set %othx on
    did -c authx 3
    did -u authx 4
    did -n authx 11
    set %vthx on
    did -c authx 6
    did -u authx 7
    did -n authx 12
    set %dothx off
    did -c authx 15
    did -u authx 14
    did -m authx 21
    set %dvthx off
    did -c authx 18
    did -u authx 17
    did -m authx 22
    set %othxr Thanks for the +o (Op) @nick :)
    set %vthxr Thanks for the +v (Voice) @nick :)
    set %dothxr Don't -o (Deop) me please @nick :(
    set %dvthxr Don't -v (Devoice) me please @nick :(
    did -r authx 11
    did -r authx 12
    did -r authx 21
    did -r authx 22
    did -a authx 11 %othxr
    did -a authx 12 %vthxr
    did -a authx 21 %dothxr
    did -a authx 22 %dvthxr
  }
}
on 1:dialog:authx:init:*: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,2,3,4,7,5,6,9,10,19,20,11,12,14,15,17,18,23,13,16,21,22 13 14 Tahoma
  did -a authx 11 %othxr
  did -a authx 12 %vthxr
  did -a authx 21 %dothxr
  did -a authx 22 %dvthxr
  if (%othx = on) { did -c authx 3 | did -n authx 11 }
  if (%othx = off) { did -c authx 4 | did -m authx 11 }
  if (%vthx = on) { did -c authx 6 | did -n authx 12 }
  if (%vthx = off) { did -c authx 7 | did -m authx 12 }
  if (%dothx = on) { did -c authx 14 | did -n authx 21 }
  if (%dothx = off) { did -c authx 15 | did -m authx 21 }
  if (%dvthx = on) { did -c authx 17 | did -n authx 22 }
  if (%dvthx = off) { did -c authx 18 | did -m authx 22 }
}
on *:DIALOG:authx:edit:*: {
  if ($did == 11) { set %othxr $did(11).text }
  if ($did == 12) { set %vthxr $did(12).text }
  if ($did == 21) { set %dothxr $did(21).text }
  if ($did == 22) { set %dvthxr $did(22).text }
}
on 1:op:#:{
  if (%othx = on) && ($opnick = $me) && ($nick != $me) && ($nick != ChanServ) {
    if (@nick isin %othxr) { _xmsg.c2 $replace(%othxr,@nick,$nick) }
    else { _xmsg.c2 %othxr }
  }
  if (%opbl = on) && ($me isop $chan) && ($nick != $me) && ($opnick != $me) {
    mode $chan -o $opnick
    _xmsg.c2 (Status Protection) Currently all Op (+o) modes are blocked for the time being in $chan (Op Block). - %name
  }
}
on 1:voice:#:{
  if (%vthx = on) && ($vnick = $me) && ($nick != $me) && ($nick != ChanServ) {
    if (@nick isin %vthxr) { _xmsg.c2 $replace(%vthxr,@nick,$nick) }
    else { _xmsg.c2 %vthxr }
  }
  if (%vobl = on) && ($me isop $chan) && ($nick != $me) && ($vnick != $me) {
    mode $chan -v $vnick
    _xmsg.c2 (Status Protection) Currently all Voice (+v) modes are blocked for the time being in $chan (Voice Block). - %name
  }
}

;Auto Timed Message
alias autotm { if ($dialog(chanad)) dialog -v chanad | else dialog -m chanad chanad }
dialog chanad {
  size -1 -1 480 245
  title "Auto Timed Message Setup"
  icon graph/autotm.ico
  button "Ok",1, 385 215 65 20, OK
  box "",2, 10 85 220 125, tab1
  box "",3, 245 85 220 125, tab1
  box "Message to chanel :",5, 10 10 455 50, tab1
  edit "",6, 20 30 440 20, autohs tab1
  text "Ad delay:",8, 20 68 79 20, tab1
  edit "",9, 70 66 35 20, tab1 autohs
  text "min(s)",45, 108 68 79 20, tab1
  button "Start Msg",12, 40 215 60 20, tab1
  button "Stop Msg",13, 140 215 60 20, tab1
  text "Channel #1",14, 20 105 65 20, tab2
  text "Channel #2",15, 20 125 65 20, tab2
  text "Channel #3",16, 20 145 65 20, tab2
  text "Channel #4",17, 20 165 65 20, tab2
  text "Channel #5",18, 20 185 65 20, tab2
  text "Channel #6",19, 255 105 65 20, tab2
  text "Channel #7",20, 255 125 65 20, tab2
  text "Channel #8",21, 255 145 65 20, tab2
  text "Channel #9",22, 255 165 65 20, tab2
  text "Channel #10",23, 255 185 65 20, tab2
  edit "",24, 90 105 95 20, tab2 autohs
  edit "",25, 90 125 95 20, tab2 autohs
  edit "",26, 90 145 95 20, tab2 autohs
  edit "",27, 90 165 95 20, tab2 autohs
  edit "",28, 90 185 95 20, tab2 autohs
  edit "",29, 325 105 95 20, tab2 autohs
  edit "",30, 325 125 95 20, tab2 autohs
  edit "",31, 325 145 95 20, tab2 autohs
  edit "",32, 325 165 95 20, tab2 autohs
  edit "",33, 325 185 95 20, tab2 autohs
  check "All Channels",34, 275 215 85 20, tab2
  button "Clear",35, 188 105 35 20, tab2
  button "Clear",36, 188 125 35 20, tab2
  button "Clear",37, 188 145 35 20, tab2
  button "Clear",38, 188 165 35 20, tab2
  button "Clear",39, 188 185 35 20, tab2
  button "Clear",40, 423 105 35 20, tab2
  button "Clear",41, 423 125 35 20, tab2
  button "Clear",42, 423 145 35 20, tab2
  button "Clear",43, 423 165 35 20, tab2
  button "Clear",44, 423 185 35 20, tab2
}

on *:dialog:chanad:edit:*: {
  if ($did == 6) { set %chan.item $did(6) }
  if ($did == 9) { set %chan.delay $did(9) }
  if ($did == 24) { set %chan.chan1 $did(24) }
  if ($did == 25) { set %chan.chan2 $did(25) }
  if ($did == 26) { set %chan.chan3 $did(26) }
  if ($did == 27) { set %chan.chan4 $did(27) }
  if ($did == 28) { set %chan.chan5 $did(28) }
  if ($did == 29) { set %chan.chan6 $did(29) }
  if ($did == 30) { set %chan.chan7 $did(30) }
  if ($did == 31) { set %chan.chan8 $did(31) }
  if ($did == 32) { set %chan.chan9 $did(32) }
  if ($did == 33) { set %chan.chan10 $did(33) }
}

on *:DIALOG:chanad:init:0: {
  did -o chanad 6 1 %chan.item $did(6)
  did -o chanad 9 1 %chan.delay $did(9)
  did -o chanad 24 1 %chan.chan1 $did(24)
  did -o chanad 25 1 %chan.chan2 $did(25)
  did -o chanad 26 1 %chan.chan3 $did(26)
  did -o chanad 27 1 %chan.chan4 $did(27)
  did -o chanad 28 1 %chan.chan5 $did(28)
  did -o chanad 29 1 %chan.chan6 $did(29)
  did -o chanad 30 1 %chan.chan7 $did(30)
  did -o chanad 31 1 %chan.chan8 $did(31)
  did -o chanad 32 1 %chan.chan9 $did(32)
  did -o chanad 33 1 %chan.chan10 $did(33)
  if (%channel.all == off) { did -e $dname 24,25,26,27,28,29,30,31,32,33,14,15,16,17,18,19,20,21,22,23,35,36,37,38,39,40,41,42,43,44 }
  if (%channel.all == on) { did -b $dname 24,25,26,27,28,29,30,31,32,33,14,15,16,17,18,19,20,21,22,23,35,36,37,38,39,40,41,42,43,44 | did -c $dname 34 }
}

on *:DIALOG:chanad:sclick:*: {
  if ($did == 34) { if ($did($dname,$did).state == 1) { did -b $dname 24,25,26,27,28,29,30,31,32,33,14,15,16,17,18,19,20,21,22,23,35,36,37,38,39,40,41,42,43,44 | set %channel.all on } | else { did -e $dname 24,25,26,27,28,29,30,31,32,33,14,15,16,17,18,19,20,21,22,23,35,36,37,38,39,40,41,42,43,44 | set %channel.all off } }
  if ($did == 12) { 
    if (%chan.delay == $null) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You must set the ad delay first | goto bleh }
    set %channel on
    .timerchanAd 1 .1 chanAdOn 
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto timed message has been started
    :bleh 
  }
  if ($did == 13) { 
    .timerchanAd off 
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto timed message has been halted
    set %channel off 
  }
  if ($did == 35) { unset %chan.chan1 | did -o chanad 24 1 %chan.chan1 }
  if ($did == 36) { unset %chan.chan2 | did -o chanad 25 1 %chan.chan2 }
  if ($did == 37) { unset %chan.chan3 | did -o chanad 26 1 %chan.chan3 }
  if ($did == 38) { unset %chan.chan4 | did -o chanad 27 1 %chan.chan4 }
  if ($did == 39) { unset %chan.chan5 | did -o chanad 28 1 %chan.chan5 }
  if ($did == 40) { unset %chan.chan6 | did -o chanad 29 1 %chan.chan6 }
  if ($did == 41) { unset %chan.chan7 | did -o chanad 30 1 %chan.chan7 }
  if ($did == 42) { unset %chan.chan8 | did -o chanad 31 1 %chan.chan8 }
  if ($did == 43) { unset %chan.chan9 | did -o chanad 32 1 %chan.chan9 }
  if ($did == 44) { unset %chan.chan10 | did -o chanad 33 1 %chan.chan10 }
}

Alias chanDisplayAd {
  return (Auto Timed Message) %chan.item - %name
}
alias saychan {
  msg $active (Auto Timed Message) %chan.item - %name
}
alias chanDisplayAd2 {
  if (%channel.all == on) { /amsg $chanDisplayAd | goto end }
  if (%chan.chan1 != $null) && ($chan(%chan.chan1) != $null) { msg %chan.chan1 $chanDisplayAd }
  if (%chan.chan2 != $null) && ($chan(%chan.chan2) != $null) { msg %chan.chan2 $chanDisplayAd }
  if (%chan.chan3 != $null) && ($chan(%chan.chan3) != $null) { msg %chan.chan3 $chanDisplayAd }
  if (%chan.chan4 != $null) && ($chan(%chan.chan4) != $null) { msg %chan.chan4 $chanDisplayAd }
  if (%chan.chan5 != $null) && ($chan(%chan.chan5) != $null) { msg %chan.chan5 $chanDisplayAd }
  if (%chan.chan6 != $null) && ($chan(%chan.chan6) != $null) { msg %chan.chan6 $chanDisplayAd }
  if (%chan.chan7 != $null) && ($chan(%chan.chan7) != $null) { msg %chan.chan7 $chanDisplayAd }
  if (%chan.chan8 != $null) && ($chan(%chan.chan8) != $null) { msg %chan.chan8 $chanDisplayAd }
  if (%chan.chan9 != $null) && ($chan(%chan.chan9) != $null) { msg %chan.chan9 $chanDisplayAd }
  if (%chan.chan10 != $null) && ($chan(%chan.chan10) != $null) { msg %chan.chan10 $chanDisplayAd }
  :end
}
Alias chanAdOn {
  .timerchanAd 0 $calc(%chan.delay * 60) chanDisplayAd2
  set %channel on
  chanDisplayAd2
}
Alias chanAdOff {
  .timerchanAd off | set %channel off | halt
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
