;___________________________________________
; Invincible by Xtry
; Ghost Killer
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

; Syntax : /Ghostkill
alias ghostkill { if ($dialog(ghost)) dialog -v ghost | else dialog -m ghost ghost }

; Notify usage syntax (dialog)
alias -l ghost.n {
  if (%ghostk.n = on) {
    if (%ghost.n1 != $null) && (%ghost.n1 !isnotify) && (%ghostk.1 = on) { .notify %ghost.n1 }
    if (%ghost.n2 != $null) && (%ghost.n2 !isnotify) && (%ghostk.2 = on) { .notify %ghost.n2 }
    if (%ghost.n3 != $null) && (%ghost.n3 !isnotify) && (%ghostk.3 = on) { .notify %ghost.n3 }
    if (%ghost.n4 != $null) && (%ghost.n4 !isnotify) && (%ghostk.4 = on) { .notify %ghost.n4 }
    if (%ghost.n5 != $null) && (%ghost.n5 !isnotify) && (%ghostk.5 = on) { .notify %ghost.n5 }
    if (%ghost.n6 != $null) && (%ghost.n6 !isnotify) && (%ghostk.6 = on) { .notify %ghost.n6 }
    if (%ghost.n7 != $null) && (%ghost.n7 !isnotify) && (%ghostk.7 = on) { .notify %ghost.n7 }
    if (%ghost.n8 != $null) && (%ghost.n8 !isnotify) && (%ghostk.8 = on) { .notify %ghost.n8 }
    if (%ghost.n9 != $null) && (%ghost.n9 !isnotify) && (%ghostk.9 = on) { .notify %ghost.n9 }
    if (%ghost.n10 != $null) && (%ghost.n10 !isnotify) && (%ghostk.10 = on) { .notify %ghost.n10 }
  }
  else {
    if (%ghost.n1 != $null) && (%ghost.n1 isnotify) { .notify -r %ghost.n1 }
    if (%ghost.n2 != $null) && (%ghost.n2 isnotify) { .notify -r %ghost.n2 }
    if (%ghost.n3 != $null) && (%ghost.n3 isnotify) { .notify -r %ghost.n3 }
    if (%ghost.n4 != $null) && (%ghost.n4 isnotify) { .notify -r %ghost.n4 }
    if (%ghost.n5 != $null) && (%ghost.n5 isnotify) { .notify -r %ghost.n5 }
    if (%ghost.n6 != $null) && (%ghost.n6 isnotify) { .notify -r %ghost.n6 }
    if (%ghost.n7 != $null) && (%ghost.n7 isnotify) { .notify -r %ghost.n7 }
    if (%ghost.n8 != $null) && (%ghost.n8 isnotify) { .notify -r %ghost.n8 }
    if (%ghost.n9 != $null) && (%ghost.n9 isnotify) { .notify -r %ghost.n9 }
    if (%ghost.n10 != $null) && (%ghost.n10 isnotify) { .notify -r %ghost.n10 }
  }
}

; The dialog
dialog ghost {
  ;title & size
  title Ghost Killer
  icon graph/huhsmile.ico
  size -1 -1 385 288

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
  ;Options & Close buttons
  check "Use notify for ghost nickname",41,10 220 200 20
  check "Prompt before kill",42,10 240 200 20
  check "Auto ghost kill if i'm away",43,10 260 200 20
  button "Close",500,295 260 80 20,ok
}

; Dialog events (init)
on *:dialog:ghost:init:*:{
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 31,32,33,34,35,36,37,38,39,40,51,52,53,54,55,56,57,58,59,60,41,42,43,500,12,45,78,10,11,13,14,16,17,19,20,22,23,25,26,28,29 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 31,32,33,34,35,36,37,38,39,40,51,52,53,54,55,56,57,58,59,60,500 clientedge

  did -a $dname 1 %ghost.n1
  did -a $dname 2 %ghost.p1

  did -a $dname 4 %ghost.n2
  did -a $dname 5 %ghost.p2

  did -a $dname 7 %ghost.n3
  did -a $dname 8 %ghost.p3

  did -a $dname 10 %ghost.n4
  did -a $dname 11 %ghost.p4

  did -a $dname 13 %ghost.n5
  did -a $dname 14 %ghost.p5

  did -a $dname 16 %ghost.n6
  did -a $dname 17 %ghost.p6

  did -a $dname 19 %ghost.n7
  did -a $dname 20 %ghost.p7

  did -a $dname 22 %ghost.n8
  did -a $dname 23 %ghost.p8

  did -a $dname 25 %ghost.n9
  did -a $dname 26 %ghost.p9

  did -a $dname 28 %ghost.n10
  did -a $dname 29 %ghost.p10

  if (%ghostk.1 = on) { did -c $dname 3 } | else { did -u $dname 3 }
  if (%ghostk.2 = on) { did -c $dname 6 } | else { did -u $dname 6 }
  if (%ghostk.3 = on) { did -c $dname 9 } | else { did -u $dname 9 }
  if (%ghostk.4 = on) { did -c $dname 12 } | else { did -u $dname 12 }
  if (%ghostk.5 = on) { did -c $dname 15 } | else { did -u $dname 15 }
  if (%ghostk.6 = on) { did -c $dname 18 } | else { did -u $dname 18 }
  if (%ghostk.7 = on) { did -c $dname 21 } | else { did -u $dname 21 }
  if (%ghostk.8 = on) { did -c $dname 24 } | else { did -u $dname 24 }
  if (%ghostk.9 = on) { did -c $dname 27 } | else { did -u $dname 27 }
  if (%ghostk.10 = on) { did -c $dname 30 } | else { did -u $dname 30 }

  if (%ghostk.n = on) { did -c $dname 41 } | else { did -u $dname 41 }
  if (%ghostk.p = on) { did -c $dname 42 } | else { did -u $dname 42 }
  if (%ghostk.a = on) { did -c $dname 43 } | else { did -u $dname 43 }
}

; Dialog events (sclick)
on *:dialog:ghost:sclick:*:{
  if ($did = 3) {
    if ($did($dname,3).state = 1) {
      set %ghostk.1 on
      if ($did($dname,41).state = 1) && (%ghost.n1 != $null) && (%ghost.n1 !isnotify) { .notify %ghost.n1 }
    }
    else {
      set %ghostk.1 off
      if ($did($dname,41).state = 1) && (%ghost.n1 != $null) && (%ghost.n1 isnotify) { .notify -r %ghost.n1 }
    }
  }
  if ($did = 6) {
    if ($did($dname,6).state = 1) {
      set %ghostk.2 on
      if ($did($dname,41).state = 1) && (%ghost.n2 != $null) && (%ghost.n2 !isnotify) { .notify %ghost.n2 }
    }
    else {
      set %ghostk.2 off
      if ($did($dname,41).state = 1) && (%ghost.n2 != $null) && (%ghost.n2 isnotify) { .notify -r %ghost.n2 }
    }
  }
  if ($did = 9) {
    if ($did($dname,9).state = 1) {
      set %ghostk.3 on
      if ($did($dname,41).state = 1) && (%ghost.n3 != $null) && (%ghost.n3 !isnotify) { .notify %ghost.n3 }
    }
    else {
      set %ghostk.3 off
      if ($did($dname,41).state = 1) && (%ghost.n3 != $null) && (%ghost.n3 isnotify) { .notify -r %ghost.n3 }
    }
  }
  if ($did = 12) {
    if ($did($dname,12).state = 1) {
      set %ghostk.4 on
      if ($did($dname,41).state = 1) && (%ghost.n4 != $null) && (%ghost.n4 !isnotify) { .notify %ghost.n4 }
    }
    else {
      set %ghostk.4 off
      if ($did($dname,41).state = 1) && (%ghost.n4 != $null) && (%ghost.n4 isnotify) { .notify -r %ghost.n4 }
    }
  }
  if ($did = 15) {
    if ($did($dname,15).state = 1) {
      set %ghostk.5 on
      if ($did($dname,41).state = 1) && (%ghost.n5 != $null) && (%ghost.n5 !isnotify) { .notify %ghost.n5 }
    }
    else {
      set %ghostk.5 off
      if ($did($dname,41).state = 1) && (%ghost.n5 != $null) && (%ghost.n5 isnotify) { .notify -r %ghost.n5 }
    }
  }
  if ($did = 18) {
    if ($did($dname,18).state = 1) {
      set %ghostk.6 on
      if ($did($dname,41).state = 1) && (%ghost.n6 != $null) && (%ghost.n6 !isnotify) { .notify %ghost.n6 }
    }
    else {
      set %ghostk.6 off
      if ($did($dname,41).state = 1) && (%ghost.n6 != $null) && (%ghost.n6 isnotify) { .notify -r %ghost.n6 }
    }
  }
  if ($did = 21) {
    if ($did($dname,21).state = 1) {
      set %ghostk.7 on
      if ($did($dname,41).state = 1) && (%ghost.n7 != $null) && (%ghost.n7 !isnotify) { .notify %ghost.n7 }
    }
    else {
      set %ghostk.7 off
      if ($did($dname,41).state = 1) && (%ghost.n7 != $null) && (%ghost.n7 isnotify) { .notify -r %ghost.n7 }
    }
  }
  if ($did = 24) {
    if ($did($dname,24).state = 1) {
      set %ghostk.8 on
      if ($did($dname,41).state = 1) && (%ghost.n8 != $null) && (%ghost.n8 !isnotify) { .notify %ghost.n8 }
    }
    else {
      set %ghostk.8 off
      if ($did($dname,41).state = 1) && (%ghost.n8 != $null) && (%ghost.n8 isnotify) { .notify -r %ghost.n8 }
    }
  }
  if ($did = 27) {
    if ($did($dname,27).state = 1) {
      set %ghostk.9 on
      if ($did($dname,41).state = 1) && (%ghost.n9 != $null) && (%ghost.n9 !isnotify) { .notify %ghost.n9 }
    }
    else {
      set %ghostk.9 off
      if ($did($dname,41).state = 1) && (%ghost.n9 != $null) && (%ghost.n9 isnotify) { .notify -r %ghost.n9 }
    }
  }
  if ($did = 30) {
    if ($did($dname,30).state = 1) {
      set %ghostk.10 on
      if ($did($dname,41).state = 1) && (%ghost.n10 != $null) && (%ghost.n10 !isnotify) { .notify %ghost.n10 }
    }
    else {
      set %ghostk.10 off
      if ($did($dname,41).state = 1) && (%ghost.n10 != $null) && (%ghost.n10 isnotify) { .notify -r %ghost.n10 }
    }
  }

  if ($did = 31) {
    if (%ghost.n1 isnotify) { .notify -r %ghost.n1 }
    did -r $dname 1,2
    did -u $dname 3
    ; Unset the Variables :)
    unset %ghost.n1
    unset %ghost.p1
    set %ghostk.1 off
  }
  if ($did = 32) {
    if (%ghost.n2 isnotify) { .notify -r %ghost.n2 }
    did -r $dname 4,5
    did -u $dname 6
    ; Unset the Variables :)
    unset %ghost.n2
    unset %ghost.p2
    set %ghostk.2 off
  }
  if ($did = 33) {
    if (%ghost.n3 isnotify) { .notify -r %ghost.n3 }
    did -r $dname 7,8
    did -u $dname 9
    ; Unset the Variables :)
    unset %ghost.n3
    unset %ghost.p3
    set %ghostk.3 off
  }
  if ($did = 34) {
    if (%ghost.n4 isnotify) { .notify -r %ghost.n4 }
    did -r $dname 10,11
    did -u $dname 12
    ; Unset the Variables :)
    unset %ghost.n4
    unset %ghost.p4
    set %ghostk.4 off
  }
  if ($did = 35) {
    if (%ghost.n5 isnotify) { .notify -r %ghost.n5 }
    did -r $dname 13,14
    did -u $dname 15
    ; Unset the Variables :)
    unset %ghost.n5
    unset %ghost.p5
    set %ghostk.5 off
  }
  if ($did = 36) {
    if (%ghost.n6 isnotify) { .notify -r %ghost.n6 }
    did -r $dname 16,17
    did -u $dname 18
    ; Unset the Variables :)
    unset %ghost.n6
    unset %ghost.p6
    set %ghostk.6 off
  }
  if ($did = 37) {
    if (%ghost.n7 isnotify) { .notify -r %ghost.n7 }
    did -r $dname 19,20
    did -u $dname 21
    ; Unset the Variables :)
    unset %ghost.n7
    unset %ghost.p7
    set %ghostk.7 off
  }
  if ($did = 38) {
    if (%ghost.n8 isnotify) { .notify -r %ghost.n8 }
    did -r $dname 22,23
    did -u $dname 24
    ; Unset the Variables :)
    unset %ghost.n8
    unset %ghost.p8
    set %ghostk.8 off
  }
  if ($did = 39) {
    if (%ghost.n9 isnotify) { .notify -r %ghost.n9 }
    did -r $dname 25,26
    did -u $dname 6
    ; Unset the Variables :)
    unset %ghost.n9
    unset %ghost.p9
    set %ghostk.9 off
  }
  if ($did = 40) {
    if (%ghost.n10 isnotify) { .notify -r %ghost.n10 }
    did -r $dname 28,29
    did -u $dname 30
    ; Unset the Variables :)
    unset %ghost.n10
    unset %ghost.p10
    set %ghostk.10 off
  }

  if ($did = 41) { if ($did($dname,41).state = 1) { set %ghostk.n on | ghost.n } | else { set %ghostk.n off | ghost.n } }
  if ($did = 42) { if ($did($dname,42).state = 1) { set %ghostk.p on } | else { set %ghostk.p off } }
  if ($did = 43) { if ($did($dname,43).state = 1) { set %ghostk.a on } | else { set %ghostk.a off } }

  if ($did = 51) {
    if (%ghost.n1 isnotify) { .notify -r %ghost.n1 }
    set %ghost.n1 $$?="Nickname :"
    set %ghost.p1 $$?*="Password :"
    did -r $dname 1,2
    did -a $dname 1 %ghost.n1
    did -a $dname 2 %ghost.p1
    if (%ghostk.n = on) { .notify %ghost.n1 }
  }
  if ($did = 52) {
    if (%ghost.n2 isnotify) { .notify -r %ghost.n2 }
    set %ghost.n2 $$?="Nickname :"
    set %ghost.p2 $$?*="Password :"
    did -r $dname 4,5
    did -a $dname 4 %ghost.n2
    did -a $dname 5 %ghost.p2
    if (%ghostk.n = on) { .notify %ghost.n2 }
  }
  if ($did = 53) {
    if (%ghost.n3 isnotify) { .notify -r %ghost.n3 }
    set %ghost.n3 $$?="Nickname :"
    set %ghost.p3 $$?*="Password :"
    did -r $dname 7,8
    did -a $dname 7 %ghost.n3
    did -a $dname 8 %ghost.p3
    if (%ghostk.n = on) { .notify %ghost.n3 }
  }
  if ($did = 54) {
    if (%ghost.n4 isnotify) { .notify -r %ghost.n4 }
    set %ghost.n4 $$?="Nickname :"
    set %ghost.p4 $$?*="Password :"
    did -r $dname 10,11
    did -a $dname 10 %ghost.n4
    did -a $dname 11 %ghost.p4
    if (%ghostk.n = on) { .notify %ghost.n4 }
  }
  if ($did = 55) {
    if (%ghost.n5 isnotify) { .notify -r %ghost.n5 }
    set %ghost.n5 $$?="Nickname :"
    set %ghost.p5 $$?*="Password :"
    did -r $dname 13,14
    did -a $dname 13 %ghost.n5
    did -a $dname 14 %ghost.p5
    if (%ghostk.n = on) { .notify %ghost.n5 }
  }
  if ($did = 56) {
    if (%ghost.n6 isnotify) { .notify -r %ghost.n6 }
    set %ghost.n6 $$?="Nickname :"
    set %ghost.p6 $$?*="Password :"
    did -r $dname 16,17
    did -a $dname 16 %ghost.n6
    did -a $dname 17 %ghost.p6
    if (%ghostk.n = on) { .notify %ghost.n6 }
  }
  if ($did = 57) {
    if (%ghost.n7 isnotify) { .notify -r %ghost.n7 }
    set %ghost.n7 $$?="Nickname :"
    set %ghost.p7 $$?*="Password :"
    did -r $dname 19,20
    did -a $dname 19 %ghost.n7
    did -a $dname 20 %ghost.p7
    if (%ghostk.n = on) { .notify %ghost.n7 }
  }
  if ($did = 58) {
    if (%ghost.n8 isnotify) { .notify -r %ghost.n8 }
    set %ghost.n8 $$?="Nickname :"
    set %ghost.p8 $$?*="Password :"
    did -r $dname 22,23
    did -a $dname 22 %ghost.n8
    did -a $dname 23 %ghost.p8
    if (%ghostk.n = on) { .notify %ghost.n8 }
  }
  if ($did = 59) {
    if (%ghost.n9 isnotify) { .notify -r %ghost.n9 }
    set %ghost.n9 $$?="Nickname :"
    set %ghost.p9 $$?*="Password :"
    did -r $dname 25,26
    did -a $dname 25 %ghost.n9
    did -a $dname 26 %ghost.p9
    if (%ghostk.n = on) { .notify %ghost.n9 }
  }
  if ($did = 60) {
    if (%ghost.n10 isnotify) { .notify -r %ghost.n10 }
    set %ghost.n10 $$?="Nickname :"
    set %ghost.p10 $$?*="Password :"
    did -r $dname 28,29
    did -a $dname 28 %ghost.n10
    did -a $dname 29 %ghost.p10
    if (%ghostk.n = on) { .notify %ghost.n10 }
  }
}

alias -l gprompt- { gprompt | did -a gprompt 3 $1 is onlline, Ghost Kill $1 now ? | set %gpromptx1 $1 | set %gpromptx2 $2 }
alias -l gprompt { if ($dialog(gprompt)) dialog -vmo gprompt | else dialog -mo gprompt gprompt }
dialog gprompt {
  ;title & size
  title Ghost Killer Prompt
  icon graph/huhsmile.ico
  size -1 -1 210 120
  button "Yes",1,30 95 70 20,ok
  button "No",2,110 95 70 20,cancel
  edit "",3,10 10 190 75,multi read
}
on *:dialog:gprompt:init:*:{ did -r $dname 3 }
on *:dialog:gprompt:sclick:1:{ nickserv ghost %gpromptx1 %gpromptx2 | unset %gpromptx* }
on *:dialog:gprompt:sclick:2:{ unset %gpromptx* }


; On Notify events
on *:notify:{
  if (%ghostk.n = on) {
    if (%ghostk.1 = on) && (%ghost.n1 = $nick) && ($nick != $me) {
      ; Auto kill ghost if $away
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n1 %ghost.p1 | halt }
      ; Prompt before kill
      if (%ghostk.p = on) { gprompt- %ghost.n1 %ghost.p1 }
      else { nickserv ghost %ghost.n1 %ghost.p1 }
    }
    if (%ghostk.2 = on) && (%ghost.n2 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n2 %ghost.p2 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n2 %ghost.p2 }
      else { nickserv ghost %ghost.n2 %ghost.p2 }
    }
    if (%ghostk.3 = on) && (%ghost.n3 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n3 %ghost.p3 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n3 %ghost.p3 }
      else { nickserv ghost %ghost.n3 %ghost.p3 }
    }
    if (%ghostk.4 = on) && (%ghost.n4 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n4 %ghost.p4 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n4 %ghost.p4 }
      else { nickserv ghost %ghost.n4 %ghost.p4 }
    }
    if (%ghostk.5 = on) && (%ghost.n5 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n5 %ghost.p5 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n5 %ghost.p5 }
      else { nickserv ghost %ghost.n5 %ghost.p5 }
    }
    if (%ghostk.6 = on) && (%ghost.n6 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n6 %ghost.p6 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n6 %ghost.p6 }
      else { nickserv ghost %ghost.n6 %ghost.p6 }
    }
    if (%ghostk.7 = on) && (%ghost.n7 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n7 %ghost.p7 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n7 %ghost.p7 }
      else { nickserv ghost %ghost.n7 %ghost.p7 }
    }
    if (%ghostk.8 = on) && (%ghost.n8 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n8 %ghost.p8 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n8 %ghost.p8 }
      else { nickserv ghost %ghost.n8 %ghost.p8 }
    }
    if (%ghostk.9 = on) && (%ghost.n9 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n9 %ghost.p9 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n9 %ghost.p9 }
      else { nickserv ghost %ghost.n9 %ghost.p9 }
    }
    if (%ghostk.10 = on) && (%ghost.n10 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n10 %ghost.p10 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n10 %ghost.p10 }
      else { nickserv ghost %ghost.n10 %ghost.p10 }
    }
  }
  else { halt }
}

; On Nick events
on *:nick:{
  if (%ghostk.n = on) { halt }
  else {
    if (%ghostk.1 = on) && (%ghost.n1 = $newnick) && ($newnick != $me) {
      ; Auto kill ghost if $away
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n1 %ghost.p1 | halt }
      ; Prompt before kill
      if (%ghostk.p = on) { gprompt- %ghost.n1 %ghost.p1 }
      else { nickserv ghost %ghost.n1 %ghost.p1 }
    }
    if (%ghostk.2 = on) && (%ghost.n2 = $newnick) && ($newnick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n2 %ghost.p2 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n2 %ghost.p2 }
      else { nickserv ghost %ghost.n2 %ghost.p2 }
    }
    if (%ghostk.3 = on) && (%ghost.n3 = $newnick) && ($newnick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n3 %ghost.p3 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n3 %ghost.p3 }
      else { nickserv ghost %ghost.n3 %ghost.p3 }
    }
    if (%ghostk.4 = on) && (%ghost.n4 = $newnick) && ($newnick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n4 %ghost.p4 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n4 %ghost.p4 }
      else { nickserv ghost %ghost.n4 %ghost.p4 }
    }
    if (%ghostk.5 = on) && (%ghost.n5 = $newnick) && ($newnick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n5 %ghost.p5 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n5 %ghost.p5 }
      else { nickserv ghost %ghost.n5 %ghost.p5 }
    }
    if (%ghostk.6 = on) && (%ghost.n6 = $newnick) && ($newnick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n6 %ghost.p6 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n6 %ghost.p6 }
      else { nickserv ghost %ghost.n6 %ghost.p6 }
    }
    if (%ghostk.7 = on) && (%ghost.n7 = $newnick) && ($newnick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n7 %ghost.p7 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n7 %ghost.p7 }
      else { nickserv ghost %ghost.n7 %ghost.p7 }
    }
    if (%ghostk.8 = on) && (%ghost.n8 = $newnick) && ($newnick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n8 %ghost.p8 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n8 %ghost.p8 }
      else { nickserv ghost %ghost.n8 %ghost.p8 }
    }
    if (%ghostk.9 = on) && (%ghost.n9 = $newnick) && ($newnick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n9 %ghost.p9 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n9 %ghost.p9 }
      else { nickserv ghost %ghost.n9 %ghost.p9 }
    }
    if (%ghostk.10 = on) && (%ghost.n10 = $newnick) && ($newnick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n10 %ghost.p10 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n10 %ghost.p10 }
      else { nickserv ghost %ghost.n10 %ghost.p10 }
    }
  }
}

; On Join events
on *:join:#:{
  if (%ghostk.n = on) { halt }
  else {
    if (%ghostk.1 = on) && (%ghost.n1 = $nick) && ($nick != $me) {
      ; Auto ghost kill if $away
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n1 %ghost.p1 | halt }
      ; Prompt before kill
      if (%ghostk.p = on) { gprompt- %ghost.n1 %ghost.p1 }
      else { nickserv ghost %ghost.n1 %ghost.p1 }
    }
    if (%ghostk.2 = on) && (%ghost.n2 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n2 %ghost.p2 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n2 %ghost.p2 }
      else { nickserv ghost %ghost.n2 %ghost.p2 }
    }
    if (%ghostk.3 = on) && (%ghost.n3 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n3 %ghost.p3 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n3 %ghost.p3 }
      else { nickserv ghost %ghost.n3 %ghost.p3 }
    }
    if (%ghostk.4 = on) && (%ghost.n4 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n4 %ghost.p4 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n4 %ghost.p4 }
      else { nickserv ghost %ghost.n4 %ghost.p4 }
    }
    if (%ghostk.5 = on) && (%ghost.n5 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n5 %ghost.p5 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n5 %ghost.p5 }
      else { nickserv ghost %ghost.n5 %ghost.p5 }
    }
    if (%ghostk.6 = on) && (%ghost.n6 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n6 %ghost.p6 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n6 %ghost.p6 }
      else { nickserv ghost %ghost.n6 %ghost.p6 }
    }
    if (%ghostk.7 = on) && (%ghost.n7 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n7 %ghost.p7 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n7 %ghost.p7 }
      else { nickserv ghost %ghost.n7 %ghost.p7 }
    }
    if (%ghostk.8 = on) && (%ghost.n8 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n8 %ghost.p8 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n8 %ghost.p8 }
      else { nickserv ghost %ghost.n8 %ghost.p8 }
    }
    if (%ghostk.9 = on) && (%ghost.n9 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n9 %ghost.p9 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n9 %ghost.p9 }
      else { nickserv ghost %ghost.n9 %ghost.p9 }
    }
    if (%ghostk.10 = on) && (%ghost.n10 = $nick) && ($nick != $me) {
      if ($away = $true) && (%ghost.ka = on) { nickserv ghost %ghost.n10 %ghost.p10 | halt }
      if (%ghostk.p = on) { gprompt- %ghost.n10 %ghost.p10 }
      else { nickserv ghost %ghost.n10 %ghost.p10 }
    }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
