;___________________________________________
; Invincible by Xtry
; Status Protection
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias gtz.cpro { if ($dialog(cpro)) dialog -v cpro | else dialog -m cpro cpro }
dialog cpro {
  title "Status Protection"
  icon graph/statprot.ico
  size -1 -1 84 107
  option dbu
  box "",31,1 89 34 17
  button "Ok",1,3 94 30 10,ok
  box "",2,1 1 82 47
  box "",30,1 44 82 47

  text "Deop Protection",3,3 8 50 10
  radio "On",4,50 6 15 10, group push
  radio "Off",5,65 6 15 10, push

  text "Kick Protection",6,3 18 50 10
  radio "On",7,50 16 15 10, group push
  radio "Off",8,65 16 15 10, push

  text "Ban Protection",12,3 28 50 10
  radio "On",13,50 26 15 10, group push
  radio "Off",14,65 26 15 10, push

  text "Ban Enforcer",9,3 38 50 10
  radio "On",10,50 36 15 10, group push
  radio "Off",11,65 36 15 10, push

  text "Op Block",15,3 51 50 10
  radio "On",16,50 49 15 10, group push
  radio "Off",17,65 49 15 10, push

  text "Voice Block",18,3 61 50 10
  radio "On",19,50 59 15 10, group push
  radio "Off",20,65 59 15 10, push

  text "Ban Block",21,3 71 50 10
  radio "On",22,50 69 15 10, group push
  radio "Off",23,65 69 15 10, push

  text "Unban Block",24,3 81 50 10
  radio "On",25,50 79 15 10, group push
  radio "Off",26,65 79 15 10, push
}
on 1:dialog:cpro:sclick:*: {
  if ( $did = 4 ) { set %Deop.protection on }
  if ( $did = 5 ) { set %Deop.protection off }
  if ( $did = 7 ) { set %Kick.protection on }
  if ( $did = 8 ) { set %Kick.protection off }
  if ( $did = 10 ) { set %ban-enforcer on }
  if ( $did = 11 ) { set %ban-enforcer off }
  if ( $did = 13 ) { set %banp on }
  if ( $did = 14 ) { set %banp off }
  if ( $did = 16 ) { set %opbl on }
  if ( $did = 17 ) { set %opbl off }
  if ( $did = 19 ) { set %vobl on }
  if ( $did = 20 ) { set %vobl off }
  if ( $did = 22 ) { set %banbl on }
  if ( $did = 23 ) { set %banbl off }
  if ( $did = 25 ) { set %ubanbl on }
  if ( $did = 26 ) { set %ubanbl off }
}
on 1:dialog:cpro:init:0: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 1 clientedge
  if ( %Deop.protection = on ) { did -c cpro 4 }
  if ( %Deop.protection = off ) { did -c cpro 5 }
  if ( %Kick.protection = on ) { did -c cpro 7 }
  if ( %Kick.protection = off ) { did -c cpro 8 }
  if ( %ban-enforcer = on ) { did -c cpro 10 }
  if ( %ban-enforcer = off ) { did -c cpro 11 }
  if ( %banp = on ) { did -c cpro 13 }
  if ( %banp = off ) { did -c cpro 14 }
  if ( %opbl = on ) { did -c cpro 16 }
  if ( %opbl = off ) { did -c cpro 17 }
  if ( %vobl = on ) { did -c cpro 19 }
  if ( %vobl = off ) { did -c cpro 20 }
  if ( %banbl = on ) { did -c cpro 22 }
  if ( %banbl = off ) { did -c cpro 23 }
  if ( %ubanbl = on ) { did -c cpro 25 }
  if ( %ubanbl = off ) { did -c cpro 26 }
}

on @*:ban:#:{
  if (%banbl == on) && ($nick != $me) && ($me isop $chan) { mode $chan -b $banmask | _xmsg.c (Status Protection) Currently all banning is prohibited in $chan (Ban Block) - %name }
  if ($active != $chan) && (%e.band = on) {
    if ($address($me,0) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($address($me,1) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($address($me,2) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($address($me,3) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($address($me,4) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($address($me,5) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($address($me,6) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($address($me,7) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($address($me,8) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($address($me,9) iswm $banmask) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
    if ($ialchan($banmask,$chan,1).nick = $me) && ($nick != $me) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were banned in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $banmask $+ $cxs(3) $+ ) | halt }
  }
  else halt
}
on @*:unban:#:{
  if (%ubanbl == on) && ($nick != $me) && ($me isop $chan) { mode $chan +b $banmask | _xmsg.c (Status Protection) Currently all unbanning is prohibited in $chan (Unban Block) - %name }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
