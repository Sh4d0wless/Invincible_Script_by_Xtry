;___________________________________________
; Invincible by Xtry
; Alarm Clock
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias alarmx { if ($dialog(alarm)) dialog -v alarm | else dialog -m alarm alarm }
alias alarm.c { 
  if ($dialog(alarm) == $null) { .timeralarmc off }
  else { did -o alarm 1 1 $time(HH:nn:ss ddd dd mmm yyyy) }
}
dialog alarm {
  title Alarm Clock
  icon graph/alarm.ico
  size -1 -1 250 200
  edit "",1,25 10 200 20,read center disable
  box "",3,23 2 204 30

  button "Close",4,80 172 80 20,ok
  box "",26,78 164 84 30

  box "Set Alarm :",5,5 35 240 128
  text "Time :",9,25 63 40 20
  edit "",6,80 60 145 20,autohs center

  text "Message :",10,25 85 60 20
  edit "",11,80 81 145 20,autohs center

  button "Set",7,143 105 80 20,disable

  edit "",8,25 130 200 20,read center disable
}
on *:dialog:alarm:init:0:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll dll/mdx.dll SetFont 1,4,5,6,7,9,10,11 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 4,7 clientedge
  did -r alarm 1
  .timeralarma 0 0 alarm.c
}
on *:dialog:alarm:edit:*:{
  if ($did = 6) {
    did -r alarm 8
    if ($left($did(6).text,1) != $null) { did -e alarm 7 }
    else { did -b alarm 7 }
  }
  if ($did = 11) { did -r alarm 8 }
}

on *:dialog:alarm:sclick:*:{
  if ($did = 4) { .timeralarma off }
  if ($did = 7) {
    did -r alarm 8
    if (: !isin $did(6).text) || ($len($did(6).text) != 5) || ($left($did(6).text,2) !isnum) || ($right($did(6).text,2) !isnum) { did -o alarm 8 1 Use HH:MM format. ie: $time(HH:nn) }
    else {
      if ($did(11).text = $null) { did -o alarm 8 1 Set the alarm message }
      else {
        did -o alarm 8 1 Alarm is now set to $did(6).text
        set %alarm.time $did(6).text
        set %alarm.msg $did(11).text
        .timeralarmx %alarm.time 1 0 alarmxr
      }
    }
  }
}


alias alarmxr { if ($dialog(alarmr)) dialog -v alarmr | else dialog -m alarmr alarmr }
dialog alarmr {
  title Alarm Clock
  icon graph/alarm.ico
  size -1 -1 250 95
  box "Reminder :",1,5 2 240 60
  edit "",3,10 35 230 20,center disable
  edit "",4,75 15 100 20,center disable

  button "Close",5,85 70 80 20,ok
}
on *:dialog:alarmr:init:0:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll dll/mdx.dll SetFont 1,3,4,5 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 5 clientedge
  did -o alarmr 4 1 %alarm.time
  did -o alarmr 3 1 %alarm.msg
  .splay %alarm.wav
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
