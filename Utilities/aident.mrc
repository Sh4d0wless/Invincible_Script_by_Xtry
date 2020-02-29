;___________________________________________
; Invincible by Xtry
; Auto Identify
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

; Syntax : /aid
alias aid { if ($dialog(aid)) dialog -v aid | else dialog -m aid aid }


alias _aid.spe {
  if (%aid.1 = on) && (%aid.n1 != $null) && (%aid.p1 != $null) { nickserv identify %aid.n1 %aid.p1 }
  if (%aid.2 = on) && (%aid.n2 != $null) && (%aid.p2 != $null) { nickserv identify %aid.n2 %aid.p2 }
  if (%aid.3 = on) && (%aid.n3 != $null) && (%aid.p3 != $null) { nickserv identify %aid.n3 %aid.p3 }
  if (%aid.4 = on) && (%aid.n4 != $null) && (%aid.p4 != $null) { nickserv identify %aid.n4 %aid.p4 }
  if (%aid.5 = on) && (%aid.n5 != $null) && (%aid.p5 != $null) { nickserv identify %aid.n5 %aid.p5 }
  if (%aid.6 = on) && (%aid.n6 != $null) && (%aid.p6 != $null) { nickserv identify %aid.n6 %aid.p6 }
  if (%aid.7 = on) && (%aid.n7 != $null) && (%aid.p7 != $null) { nickserv identify %aid.n7 %aid.p7 }
  if (%aid.8 = on) && (%aid.n8 != $null) && (%aid.p8 != $null) { nickserv identify %aid.n8 %aid.p8 }
  if (%aid.9 = on) && (%aid.n9 != $null) && (%aid.p9 != $null) { nickserv identify %aid.n9 %aid.p9 }
  if (%aid.10 = on) && (%aid.n10 != $null) && (%aid.p10 != $null) { nickserv identify %aid.n10 %aid.p10 }
}
alias _aid.all {
  if (%aid.n1 != $null) && (%aid.p1 != $null) { nickserv identify %aid.n1 %aid.p1 }
  if (%aid.n2 != $null) && (%aid.p2 != $null) { nickserv identify %aid.n2 %aid.p2 }
  if (%aid.n3 != $null) && (%aid.p3 != $null) { nickserv identify %aid.n3 %aid.p3 }
  if (%aid.n4 != $null) && (%aid.p4 != $null) { nickserv identify %aid.n4 %aid.p4 }
  if (%aid.n5 != $null) && (%aid.p5 != $null) { nickserv identify %aid.n5 %aid.p5 }
  if (%aid.n6 != $null) && (%aid.p6 != $null) { nickserv identify %aid.n6 %aid.p6 }
  if (%aid.n7 != $null) && (%aid.p7 != $null) { nickserv identify %aid.n7 %aid.p7 }
  if (%aid.n8 != $null) && (%aid.p8 != $null) { nickserv identify %aid.n8 %aid.p8 }
  if (%aid.n9 != $null) && (%aid.p9 != $null) { nickserv identify %aid.n9 %aid.p9 }
  if (%aid.n10 != $null) && (%aid.p10 != $null) { nickserv identify %aid.n10 %aid.p10 }
}

; Dialog
dialog aid {
  ;title & size
  title DALnet Auto Identify
  icon graph/id.ico
  size -1 -1 385 250

  ;1
  edit "",1,30 10 130 20,autohs disable
  edit "",2,160 10 130 20,autohs pass disable
  check "",3,10 10 20 20
  button "Set",51,295 10 40 20
  button "Clear",31,335 10 40 20
  ;2
  edit "",4,30 30 130 20,autohs disable
  edit "",5,160 30 130 20,autohs pass disable
  check "",6,10 30 20 20
  button "Set",52,295 30 40 20
  button "Clear",32,335 30 40 20
  ;3
  edit "",7,30 50 130 20,autohs disable
  edit "",8,160 50 130 20,autohs pass disable
  check "",9,10 50 20 20
  button "Set",53,295 50 40 20
  button "Clear",33,335 50 40 20
  ;4
  edit "",10,30 70 130 20,autohs disable
  edit "",11,160 70 130 20,autohs pass disable
  check "",12,10 70 20 20
  button "Set",54,295 70 40 20
  button "Clear",34,335 70 40 20
  ;5
  edit "",13,30 90 130 20,autohs disable
  edit "",14,160 90 130 20,autohs pass disable
  check "",15,10 90 20 20
  button "Set",55,295 90 40 20
  button "Clear",35,335 90 40 20
  ;6
  edit "",16,30 110 130 20,autohs disable
  edit "",17,160 110 130 20,autohs pass disable
  check "",18,10 110 20 20
  button "Set",56,295 110 40 20
  button "Clear",36,335 110 40 20
  ;7
  edit "",19,30 130 130 20,autohs disable
  edit "",20,160 130 130 20,autohs pass disable
  check "",21,10 130 20 20
  button "Set",57,295 130 40 20
  button "Clear",37,335 130 40 20
  ;8
  edit "",22,30 150 130 20,autohs disable
  edit "",23,160 150 130 20,autohs pass disable
  check "",24,10 150 20 20
  button "Set",58,295 150 40 20
  button "Clear",38,335 150 40 20
  ;9
  edit "",25,30 170 130 20,autohs disable
  edit "",26,160 170 130 20,autohs pass disable
  check "",27,10 170 20 20
  button "Set",59,295 170 40 20
  button "Clear",39,335 170 40 20
  ;10
  edit "",28,30 190 130 20,autohs disable
  edit "",29,160 190 130 20,autohs pass disable
  check "",30,10 190 20 20
  button "Set",60,295 190 40 20
  button "Clear",40,335 190 40 20

  ; Close buttons
  button "Close",500,295 220 80 20,ok
}

; Init event for aid dialog
on *:dialog:aid:init:*:{
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 31,32,33,34,35,36,37,38,39,40,51,52,53,54,55,56,57,58,59,60,1,2,4,5,7,8,10,11,13,14,16,17,19,20,22,23,25,26,28,29,500 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 31,32,33,34,35,36,37,38,39,40,51,52,53,54,55,56,57,58,59,60,500 clientedge

  ; Checking settings
  if (%aid.1 = on) { did -c $dname 3 } | else { did -u $dname 3 }
  if (%aid.2 = on) { did -c $dname 6 } | else { did -u $dname 6 }
  if (%aid.3 = on) { did -c $dname 9 } | else { did -u $dname 9 }
  if (%aid.4 = on) { did -c $dname 12 } | else { did -u $dname 12 }
  if (%aid.5 = on) { did -c $dname 15 } | else { did -u $dname 15 }
  if (%aid.6 = on) { did -c $dname 18 } | else { did -u $dname 18 }
  if (%aid.7 = on) { did -c $dname 21 } | else { did -u $dname 21 }
  if (%aid.8 = on) { did -c $dname 24 } | else { did -u $dname 24 }
  if (%aid.9 = on) { did -c $dname 27 } | else { did -u $dname 27 }
  if (%aid.10 = on) { did -c $dname 30 } | else { did -u $dname 30 }

  ; Checking nicks
  if (%aid.n1 != $null) { did -a $dname 1 %aid.n1 }
  if (%aid.n2 != $null) { did -a $dname 4 %aid.n2 }
  if (%aid.n3 != $null) { did -a $dname 7 %aid.n3 }
  if (%aid.n4 != $null) { did -a $dname 10 %aid.n4 }
  if (%aid.n5 != $null) { did -a $dname 13 %aid.n5 }
  if (%aid.n6 != $null) { did -a $dname 16 %aid.n6 }
  if (%aid.n7 != $null) { did -a $dname 19 %aid.n7 }
  if (%aid.n8 != $null) { did -a $dname 22 %aid.n8 }
  if (%aid.n9 != $null) { did -a $dname 25 %aid.n9 }
  if (%aid.n10 != $null) { did -a $dname 28 %aid.n10 }

  ; Checking passwords
  if (%aid.p1 != $null) { did -a $dname 2 %aid.p1 }
  if (%aid.p2 != $null) { did -a $dname 5 %aid.p2 }
  if (%aid.p3 != $null) { did -a $dname 8 %aid.p3 }
  if (%aid.p4 != $null) { did -a $dname 11 %aid.p4 }
  if (%aid.p5 != $null) { did -a $dname 14 %aid.p5 }
  if (%aid.p6 != $null) { did -a $dname 17 %aid.p6 }
  if (%aid.p7 != $null) { did -a $dname 20 %aid.p7 }
  if (%aid.p8 != $null) { did -a $dname 23 %aid.p8 }
  if (%aid.p9 != $null) { did -a $dname 26 %aid.p9 }
  if (%aid.p10 != $null) { did -a $dname 29 %aid.p10 }
}

; Sclick for aid dialog
on *:dialog:aid:sclick:*:{
  ; Enable/Disable
  if ($did = 3) { if ($did($dname,$did).state == 1) { set %aid.1 on } | else { set %aid.1 off } }
  ; Clear
  if ($did = 31) { unset %aid.n1 | unset %aid.p1 | set %aid.1 off | did -r $dname 1,2 | did -u $dname 3 }
  ; Set
  if ($did = 51) {
    set %aid.n1 $$?="Nickname :"
    set %aid.p1 $$?*="Password :"
    set %aid.1 on
    did -r $dname 1,2
    did -a $dname 1 %aid.n1
    did -a $dname 2 %aid.p1
    did -c $dname 3
  }
  if ($did = 6) { if ($did($dname,$did).state == 1) { set %aid.2 on } | else { set %aid.2 off } }
  if ($did = 32) { unset %aid.n2 | unset %aid.p2 | set %aid.2 off | did -r $dname 4,5 | did -u $dname 6 }
  if ($did = 52) {
    set %aid.n2 $$?="Nickname :"
    set %aid.p2 $$?*="Password :"
    set %aid.2 on
    did -r $dname 4,5
    did -a $dname 4 %aid.n2
    did -a $dname 5 %aid.p2
    did -c $dname 6
  }
  if ($did = 9) { if ($did($dname,$did).state == 1) { set %aid.3 on } | else { set %aid.3 off } }
  if ($did = 33) { unset %aid.n3 | unset %aid.p3 | set %aid.3 off | did -r $dname 7,8 | did -u $dname 9 }
  if ($did = 53) {
    set %aid.n3 $$?="Nickname :"
    set %aid.p3 $$?*="Password :"
    set %aid.3 on
    did -r $dname 7,8
    did -a $dname 7 %aid.n3
    did -a $dname 8 %aid.p3
    did -c $dname 9
  }
  if ($did = 12) { if ($did($dname,$did).state == 1) { set %aid.4 on } | else { set %aid.4 off } }
  if ($did = 34) { unset %aid.n4 | unset %aid.p4 | set %aid.4 off | did -r $dname 10,11 | did -u $dname 12 }
  if ($did = 54) {
    set %aid.n4 $$?="Nickname :"
    set %aid.p4 $$?*="Password :"
    set %aid.4 on
    did -r $dname 10,11
    did -a $dname 10 %aid.n4
    did -a $dname 11 %aid.p4
    did -c $dname 12
  }
  if ($did = 15) { if ($did($dname,$did).state == 1) { set %aid.5 on } | else { set %aid.5 off } }
  if ($did = 35) { unset %aid.n5 | unset %aid.p5 | set %aid.5 off | did -r $dname 13,14 | did -u $dname 15 }
  if ($did = 55) {
    set %aid.n5 $$?="Nickname :"
    set %aid.p5 $$?*="Password :"
    set %aid.5 on
    did -r $dname 13,14
    did -a $dname 13 %aid.n5
    did -a $dname 14 %aid.p5
    did -c $dname 15
  }
  if ($did = 18) { if ($did($dname,$did).state == 1) { set %aid.6 on } | else { set %aid.6 off } }
  if ($did = 36) { unset %aid.n6 | unset %aid.p6 | set %aid.6 off | did -r $dname 16,17 | did -u $dname 18 }
  if ($did = 56) {
    set %aid.n6 $$?="Nickname :"
    set %aid.p6 $$?*="Password :"
    set %aid.6 on
    did -r $dname 16,17
    did -a $dname 16 %aid.n6
    did -a $dname 17 %aid.p6
    did -c $dname 18
  }
  if ($did = 21) { if ($did($dname,$did).state == 1) { set %aid.7 on } | else { set %aid.7 off } }
  if ($did = 37) { unset %aid.n7 | unset %aid.p7 | set %aid.7 off | did -r $dname 19,20 | did -u $dname 21 }
  if ($did = 57) {
    set %aid.n7 $$?="Nickname :"
    set %aid.p7 $$?*="Password :"
    set %aid.7 on
    did -r $dname 19,20
    did -a $dname 19 %aid.n7
    did -a $dname 20 %aid.p7
    did -c $dname 21
  }
  if ($did = 24) { if ($did($dname,$did).state == 1) { set %aid.8 on } | else { set %aid.8 off } }
  if ($did = 38) { unset %aid.n8 | unset %aid.p8 | set %aid.8 off | did -r $dname 22,23 | did -u $dname 24 }
  if ($did = 58) {
    set %aid.n8 $$?="Nickname :"
    set %aid.p8 $$?*="Password :"
    set %aid.8 on
    did -r $dname 22,23
    did -a $dname 22 %aid.n8
    did -a $dname 23 %aid.p8
    did -c $dname 24
  }
  if ($did = 27) { if ($did($dname,$did).state == 1) { set %aid.9 on } | else { set %aid.9 off } }
  if ($did = 39) { unset %aid.n9 | unset %aid.p9 | set %aid.9 off | did -r $dname 25,26 | did -u $dname 27 }
  if ($did = 59) {
    set %aid.n9 $$?="Nickname :"
    set %aid.p9 $$?*="Password :"
    set %aid.9 on
    did -r $dname 25,26
    did -a $dname 25 %aid.n9
    did -a $dname 26 %aid.p9
    did -c $dname 27
  }
  if ($did = 30) { if ($did($dname,$did).state == 1) { set %aid.10 on } | else { set %aid.10 off } }
  if ($did = 40) { unset %aid.n10 | unset %aid.p10 | set %aid.10 off | did -r $dname 28,29 | did -u $dname 30 }
  if ($did = 60) {
    set %aid.n10 $$?="Nickname :"
    set %aid.p10 $$?*="Password :"
    set %aid.10 on
    did -r $dname 28,29
    did -a $dname 28 %aid.n10
    did -a $dname 29 %aid.p10
    did -c $dname 30
  }
}

; Events when DALnet Auto Identify 1.0 works
; If connected
on *:connect:{
  ; Available only in DALnet
  if ($network = DALnet) && (dal.net isin $server) {
    ; Checking settings to identify
    if (%aid.1 = on) && (%aid.n1 != $null) && (%aid.p1 != $null) { nickserv identify %aid.n1 %aid.p1 }
    if (%aid.2 = on) && (%aid.n2 != $null) && (%aid.p2 != $null) { nickserv identify %aid.n2 %aid.p2 }
    if (%aid.3 = on) && (%aid.n3 != $null) && (%aid.p3 != $null) { nickserv identify %aid.n3 %aid.p3 }
    if (%aid.4 = on) && (%aid.n4 != $null) && (%aid.p4 != $null) { nickserv identify %aid.n4 %aid.p4 }
    if (%aid.5 = on) && (%aid.n5 != $null) && (%aid.p5 != $null) { nickserv identify %aid.n5 %aid.p5 }
    if (%aid.6 = on) && (%aid.n6 != $null) && (%aid.p6 != $null) { nickserv identify %aid.n6 %aid.p6 }
    if (%aid.7 = on) && (%aid.n7 != $null) && (%aid.p7 != $null) { nickserv identify %aid.n7 %aid.p7 }
    if (%aid.8 = on) && (%aid.n8 != $null) && (%aid.p8 != $null) { nickserv identify %aid.n8 %aid.p8 }
    if (%aid.9 = on) && (%aid.n9 != $null) && (%aid.p9 != $null) { nickserv identify %aid.n9 %aid.p9 }
    if (%aid.10 = on) && (%aid.n10 != $null) && (%aid.p10 != $null) { nickserv identify %aid.n10 %aid.p10 }
  }
  ; Current network is not DALnet
  else { halt }
}
; Nick changes
on *:nick:{
  ; Available only for your nick & DALnet
  if ($nick = $me) && ($network = DALnet) && (dal.net isin $server) {
    ; Checking new nick & settings to identify
    if ($newnick = %aid.n1) && (%aid.1 = on) && (%aid.p1 != $null) { nickserv identify %aid.n1 %aid.p1 }
    if ($newnick = %aid.n2) && (%aid.2 = on) && (%aid.p2 != $null) { nickserv identify %aid.n2 %aid.p2 }
    if ($newnick = %aid.n3) && (%aid.3 = on) && (%aid.p3 != $null) { nickserv identify %aid.n3 %aid.p3 }
    if ($newnick = %aid.n4) && (%aid.4 = on) && (%aid.p4 != $null) { nickserv identify %aid.n4 %aid.p4 }
    if ($newnick = %aid.n5) && (%aid.5 = on) && (%aid.p5 != $null) { nickserv identify %aid.n5 %aid.p5 }
    if ($newnick = %aid.n6) && (%aid.6 = on) && (%aid.p6 != $null) { nickserv identify %aid.n6 %aid.p6 }
    if ($newnick = %aid.n7) && (%aid.7 = on) && (%aid.p7 != $null) { nickserv identify %aid.n7 %aid.p7 }
    if ($newnick = %aid.n8) && (%aid.8 = on) && (%aid.p8 != $null) { nickserv identify %aid.n8 %aid.p8 }
    if ($newnick = %aid.n9) && (%aid.9 = on) && (%aid.p9 != $null) { nickserv identify %aid.n9 %aid.p9 }
    if ($newnick = %aid.n10) && (%aid.10 = on) && (%aid.p10 != $null) { nickserv identify %aid.n10 %aid.p10 }
  }
  ; Not DALnet & it's not your current nick
  else { halt }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
