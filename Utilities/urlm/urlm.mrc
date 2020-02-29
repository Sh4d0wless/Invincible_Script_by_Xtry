;___________________________________________
; Invincible by Xtry
; URL Manager
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯


alias urlc {
  if (!$dialog(urlm)) {
    if ($_urlm.rini(d) = on) { dialog -md urlm urlm }
    else { dialog -m urlm urlm }
  }
  else { dialog -v urlm urlm }
}
alias _urlm.v { return URL Manager }
alias _urlm.dir { return $shortfn($scriptdir) }
alias _urlm.ini { return $shortfn($scriptdirurlm.ini) }
alias _urlm.rini { return $readini($_urlm.ini,urlm,$1-) }
alias _urlm.wini { writeini $1 $_urlm.ini $2 $3 $4- }
alias _urlm.txt { return $shortfn($scriptdirurlm.txt) }
alias _urlm.rtxt { return $read($_urlm.txt,$1-) }
alias _urlm.wtxt { write $_urlm.txt $1- }
alias _urlm.wtxt_ { write $1- $_urlm.txt }
alias _urlm.txt2 { return $shortfn($scriptdirurlm_.txt) }
alias _urlm.rtxt2 { return $read($_urlm.txt2,$1-) }
alias _urlm.wtxt2 { write $_urlm.txt2 $1- }
alias _urlm.wtxt2_ { write $1- $_urlm.txt2 }
alias _urlm.fav1 {
  did -r $dname 20
  did -c $dname 33
  var %_urlm = 1
  while %_urlm < $url(0) {
    did -a urlm 20 $url(%_urlm)
    inc %_urlm
  }
}
alias _urlm.fav2 {
  did -r $dname 20
  did -u $dname 33
  loadbuf -ro $dname 20 $_urlm.txt
}
alias _urlm.fav {
  if ($_urlm.rini(m) = on) { _urlm.fav1 }
  else { _urlm.fav2 }
}
alias _urlm.list {
  _urlm.fav
  loadbuf -ro $dname 25 $_urlm.txt2
  if ($lines($_urlm.txt) < 1) { did -b $dname 23 } | else { did -e $dname 23 }
  if ($lines($_urlm.txt2) < 1) { did -b $dname 27 } | else { did -e $dname 27 }
  did -o $dname 20 0 http://
  did -o $dname 25 0 http://
}
alias _urlm.o {
  if ($_urlm.rini(o) = -a) { did -c $dname 29 | did -u $dname 30 }
  else { did -u $dname 29 | did -c $dname 30 }
  if ($_urlm.rini(c) = on) { did -c $dname 31 } | else { did -u $dname 31 }
  if ($_urlm.rini(d) = on) { did -c $dname 32 } | else { did -u $dname 32 }
}

dialog urlm {
  title $_urlm.v $chr(160) [/urlm]
  size -1 -1 380 240
  icon graph/explor.ico

  tab "Search Engines",1,10 10 360 200
  tab "Favorites     ",2,10 10 360 200
  tab "Go to URL     ",3,10 10 360 200
  tab "Options       ",4,10 10 360 200

  box "",5,17 32 348 168,tab 1
  box "",6,17 32 348 168,tab 2
  box "",7,17 32 348 168,tab 3
  box "",8,17 32 348 168,tab 4

  text "Keywords :",9,35 63 80 20,tab 1
  edit "",10,100 60 230 20,tab 1 autohs
  check "Yahoo",11,50 100 70 20,tab 1 push
  check "Google",12,120 100 70 20,tab 1 push
  check "MSN",13,190 100 70 20,tab 1 push
  check "Altavista",14,260 100 70 20,tab 1 push
  check "Lycos",15,50 120 70 20,tab 1 push
  check "Goto",16,120 120 70 20,tab 1 push
  check "AllTheWeb",17,190 120 70 20,tab 1 push
  check "Excite",18,260 120 70 20,tab 1 push
  button "Search",19,120 160 140 25,tab 1 disable

  combo 20,30 50 320 130,tab 2
  button "Add",21,30 172 60 20,tab 2 disable
  button "Remove",22,90 172 60 20,tab 2 disable
  button "Clear",23,290 172 60 20,tab 2

  text "URL :",24,30 70 70 20,tab 3
  combo 25,30 90 320 130,tab 3 edit short drop
  button "Go to URL",26,120 130 140 25,tab 3 disable
  button "Clear History",27,270 172 80 20,tab 3

  text "Open URL in :",28,40 55 70 20,tab 4
  radio "Current Browser",29,120 52 100 20,tab 4
  radio "New Browser",30,120 72 100 20,tab 4
  check "Close URL Manager 1.0 Dialog after /URL command",31,40 100 265 20,tab 4
  check "Open URL Manager 1.0 Dialog on desktop",32,40 120 220 20,tab 4
  check "Read mIRC's URL list for Favorites list",33,40 140 200 20,tab 4

  button "Close",100,300 213 70 20,ok
}

on *:dialog:urlm:init:*:{
  _urlm.list
  _urlm.o
}

on *:dialog:urlm:sclick:*:{
  if ($did = 11) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm se $did($dname,$did).text
      did -u $dname 12,13,14,15,16,17,18
      if ($did($dname,10).text != $null) { did -e $dname 19 }
      else { did -b $dname 19 }
    }
    else {
      _urlm.wini -n urlm se 0
      did -u $dname 12,13,14,15,16,17,18
      did -b $dname 19
    }
  }
  if ($did = 12) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm se $did($dname,$did).text
      did -u $dname 11,13,14,15,16,17,18
      if ($did($dname,10).text != $null) { did -e $dname 19 }
      else { did -b $dname 19 }
    }
    else {
      _urlm.wini -n urlm se 0
      did -u $dname 11,13,14,15,16,17,18
      did -b $dname 19
    }
  }
  if ($did = 13) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm se $did($dname,$did).text
      did -u $dname 11,12,14,15,16,17,18
      if ($did($dname,10).text != $null) { did -e $dname 19 }
      else { did -b $dname 19 }
    }
    else {
      _urlm.wini -n urlm se 0
      did -u $dname 11,12,14,15,16,17,18
      did -b $dname 19
    }
  }
  if ($did = 14) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm se $did($dname,$did).text
      did -u $dname 11,12,13,15,16,17,18
      if ($did($dname,10).text != $null) { did -e $dname 19 }
      else { did -b $dname 19 }
    }
    else {
      _urlm.wini -n urlm se 0
      did -u $dname 11,12,13,15,16,17,18
      did -b $dname 19
    }
  }
  if ($did = 15) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm se $did($dname,$did).text
      did -u $dname 11,12,13,14,16,17,18
      if ($did($dname,10).text != $null) { did -e $dname 19 }
      else { did -b $dname 19 }
    }
    else {
      _urlm.wini -n urlm se 0
      did -u $dname 11,12,13,14,16,17,18
      did -b $dname 19
    }
  }
  if ($did = 16) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm se $did($dname,$did).text
      did -u $dname 11,12,13,14,15,17,18
      if ($did($dname,10).text != $null) { did -e $dname 19 }
      else { did -b $dname 19 }
    }
    else {
      _urlm.wini -n urlm se 0
      did -u $dname 11,12,13,14,15,17,18
      did -b $dname 19
    }
  }
  if ($did = 17) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm se $did($dname,$did).text
      did -u $dname 11,12,13,14,15,16,18
      if ($did($dname,10).text != $null) { did -e $dname 19 }
      else { did -b $dname 19 }
    }
    else {
      _urlm.wini -n urlm se 0
      did -u $dname 11,12,13,14,15,16,18
      did -b $dname 19
    }
  }
  if ($did = 18) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm se $did($dname,$did).text
      did -u $dname 11,12,13,14,15,16,17
      if ($did($dname,10).text != $null) { did -e $dname 19 }
      else { did -b $dname 19 }
    }
    else {
      _urlm.wini -n urlm se 0
      did -u $dname 11,12,13,14,15,16,17
      did -b $dname 19
    }
  }
  if ($did = 19) {
    if ($did($dname,10).text = $null) { beep }
    else {
      if ($_urlm.rini(se) = Yahoo) {
        .url $_urlm.rini(o) http://search.yahoo.com/bin/search?p= $+ $did($dname,9).text
        if ($_urlm.rini(c) = on) {
          if ($dialog($dname)) { dialog -x $dname $dname }
          else { halt }
        }
      }
      if ($_urlm.rini(se) = Google) {
        .url $_urlm.rini(o) http://www.google.com/search?q= $+ $did($dname,9).text
        if ($_urlm.rini(c) = on) {
          if ($dialog($dname)) { dialog -x $dname $dname }
          else { halt }
        }
      }
      if ($_urlm.rini(se) = MSN) {
        .url $_urlm.rini(o) http://search.msn.com/results.asp?RS=CHECKED&FORM=MSNH&v=1&q= $+ $did($dname,9).text
        if ($_urlm.rini(c) = on) {
          if ($dialog($dname)) { dialog -x $dname $dname }
          else { halt }
        }
      }
      if ($_urlm.rini(se) = Altavista) {
        .url $_urlm.rini(o) http://www.altavista.com/sites/search/web?q= $+ $did($dname,9).text $+ &pg=q&kl=XX
        if ($_urlm.rini(c) = on) {
          if ($dialog($dname)) { dialog -x $dname $dname }
          else { halt }
        }
      }
      if ($_urlm.rini(se) = Lycos) {
        .url $_urlm.rini(o) http://search.lycos.com/main/?query= $+ $did($dname,9).text $+ &rd=y
        if ($_urlm.rini(c) = on) {
          if ($dialog($dname)) { dialog -x $dname $dname }
          else { halt }
        }
      }
      if ($_urlm.rini(se) = Goto) {
        .url $_urlm.rini(o) http://www.goto.com/d/search/p/go/?Partner=go_home&Keywords= $+ $did($dname,9).text
        if ($_urlm.rini(c) = on) {
          if ($dialog($dname)) { dialog -x $dname $dname }
          else { halt }
        }
      }
      if ($_urlm.rini(se) = AllTheWeb) {
        .url $_urlm.rini(o) http://www.alltheweb.com/cgi-bin/search?exec=FAST+Search&type=all&query= $+ $did($dname,9).text
        if ($_urlm.rini(c) = on) {
          if ($dialog($dname)) { dialog -x $dname $dname }
          else { halt }
        }
      }
      if ($_urlm.rini(se) = Excite) {
        .url $_urlm.rini(o) http://search.excite.com/search.gw?c=web&search= $+ $did($dname,9).text
        if ($_urlm.rini(c) = on) {
          if ($dialog($dname)) { dialog -x $dname $dname }
          else { halt }
        }
      }
    }
  }
  if ($did = 20) {
    did -b $dname 21
    if ($did($dname,$did).sel isnum) { did -e $dname 22 }
    else { did -b $dname 22 }
  }
  if ($did = 21) {
    if ($did($dname,20).text = $null) { beep }
    else { _urlm.wtxt $did($dname,20).text | did -b $dname $did }
    _urlm.list
  }
  if ($did = 22) {
    if ($did($dname,20).sel != $null) { _urlm.wtxt_ -dl $+ $did($dname,20).sel | did -b $dname $did }
    else { beep }
    _urlm.list
  }
  if ($did = 23) {
    if ($?!="Are you sure you want to clear the URL Manager's favorites URL list ?" = $true) { _urlm.wtxt_ -c | _urlm.list }
    else halt
  }
  if ($did = 25) {
    if ($did($dname,$did).sel isnum) { did -e $dname 26 }
    else { did -b $dname 26 }
  }
  if ($did = 26) {
    _urlm.wtxt2 $did($dname,25).text
    _urlm.list
    .url $_urlm.rini(o) $did($dname,25).text
    if ($_urlm.rini(c) = on) {
      if ($dialog($dname)) { dialog -x $dname $dname }
      else { halt }
    }
  }
  if ($did = 27) {
    if ($?!="Are you sure you want to clear the URL Manager's Go to URL history list ?" = $true) { _urlm.wtxt2_ -c | _urlm.list }
    else halt
  }
  if ($did = 29) { if ($did($dname,$did).state = 1) { _urlm.wini -n urlm o -a | did -u $dname 30 } }
  if ($did = 30) { if ($did($dname,$did).state = 1) { _urlm.wini -n urlm o -n | did -u $dname 29 } }
  if ($did = 31) { if ($did($dname,$did).state = 1) { _urlm.wini -n urlm c on } | else { _urlm.wini -n urlm c off } }
  if ($did = 32) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm d on
      dialog -x $dname $dname
      urlm
    }
    else {
      _urlm.wini -n urlm d off
      dialog -x $dname $dname
      urlm
    }
  }
  if ($did = 33) {
    if ($did($dname,$did).state = 1) {
      _urlm.wini -n urlm m on
      _urlm.fav1
    }
    else {
      _urlm.wini -n urlm m off
      _urlm.fav2
    }
  }
}

on *:dialog:urlm:dclick:*:{
  if ($did = 20) {
    if ($did($dname,$did).sel isnum) {
      .url $_urlm.rini(o) $_urlm.rtxt($did($dname,$did).sel)
      if ($_urlm.rini(c) = on) {
        if ($dialog($dname)) { dialog -x $dname $dname }
        else { halt }
      }
    }
  }
}

on *:dialog:urlm:edit:*:{
  if ($did = 10) {
    if ($did($dname,$did).text != $null) {
      _urlm.wini -n urlm k $did($dname,$did).text
      if ($did($dname,11).state = 1) || ($did($dname,12).state = 1) || ($did($dname,13).state = 1) || ($did($dname,14).state = 1) || ($did($dname,15).state = 1) || ($did($dname,16).state = 1) || ($did($dname,17).state = 1) || ($did($dname,18).state = 1) { did -e $dname 19 } | else { did -b $dname 19 }
    }
    else { did -b $dname 19 }
  }
  if ($did = 20) {
    did -b $dname 22
    if ($did($dname,$did).text != $null) { did -e $dname 21 }
    else { did -b $dname 21 }
  }
  if ($did = 25) {
    if ($did($dname,$did).text != $null) { did -e $dname 26 }
    else { did -b $dname 26 }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
