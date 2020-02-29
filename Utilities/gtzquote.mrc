;___________________________________________
; Invincible by Xtry
; Quote Manager
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias quoteman { if ($dialog(quotez)) dialog -v quotez | else dialog -md quotez quotez }
alias quotezinit {
  var %quotezmi = 0
  while (%quotezmi < $lines(utilities/quote.txt)) {
    inc %quotezmi 1
    { did -a quotez 1 $read(utilities/quote.txt,%quotezmi) }
  }
}
alias quotezs {
  filter -cff utilities/quote.txt utilities/squote.txt * [ $+ [ $1 ] $+ ] *  
  var %quotezs = 0
  while (%quotezs < $lines(utilities/squote.txt)) {
    inc %quotezs 1
    { did -a quotez 13 $read(utilities/squote.txt,%quotezs) }
  }
}
alias quosearch {
  if ( $did(quotez,11).state == 0 ) {
    dialog -s quotez $dialog(quotez).x $dialog(quotez).y 687 192
    did -h quotez 13,14,15
  }
  else {
    dialog -s quotez $dialog(quotez).x $dialog(quotez).y 687 380
    did -v quotez 13,14,15
  }
}
dialog quotez {
  title "Quote Manager"
  icon graph/quote.ico
  size 20 100 687 192
  list 1,10 30 600 150,size
  edit "",2,10 10 600 20,autohs
  button "Clear",3,615 10 60 20
  box "",5,611 1 67 32
  box "",9,611 25 67 53
  box "",12,611 70 67 34
  box "",16,611 96 67 34
  box "",18,611 150 67 33
  box "",20,611 340 67 33
  box "",22,611 314 67 33
  box "",24,611 288 67 33
  button "Add",7,615 35 60 20
  button "Del",8,615 54 60 20
  box "",4,7 1 606 182
  button "Say",10,615 80 60 20
  check "Search",11,615 106 60 20,push
  list 13,10 200 600 150,size
  edit "",14,10 350 600 20,autohs
  box "",19,7 191 606 182
  button "Search!",15,615 350 60 20
  button "Close",17,615 160 60 20,ok
  button "Clear",21,615 324 60 20
  button "Say",23,615 298 60 20
}
on 1:dialog:quotez:init:*:{
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll SetBorderStyle $dname 3,7,8,10,11,15,17,21,23 clientedge
  dll dll/mdx.dll SetControlMDX quotez 1,13 listview single rowselect report flatsb grid labeltip nosortheader > dll/views.mdx
  did -i quotez 1 1 headerdims 1000:1
  did -i quotez 1 1 headertext + 0 Total: $+ $lines(utilities/quote.txt)
  write -c utilities/squote.txt
  did -i quotez 13 1 headerdims 1000:1
  did -i quotez 13 1 headertext + 0 Total Search: $+ $lines(utilities/squote.txt)
  quotezinit
}
on 1:dialog:quotez:dclick:*:{
  if ($did = 1) {
    if ($did(quotez,1).sel = $null) { beep }
    else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Quote $+ $cxs(1) $calc($did(quotez,1).sel -1) $+ $cxs(3) $+ / $+ $cxs(1) $+ $lines(utilities/quote.txt) $cxs(3) $+ : $read(utilities/quote.txt,$calc($did(quotez,1).sel -1)) }
  }
  if ($did = 13) {
    if ($did(quotez,13).sel = $null) { beep }
    else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Quote $+ $cxs(1) $calc($did(quotez,13).sel -1) $+ $cxs(3) $+ / $+ $cxs(1) $+ $lines(utilities/squote.txt) $cxs(3) $+ : $read(utilities/squote.txt,$calc($did(quotez,13).sel -1)) }
  }
}
on 1:dialog:quotez:sclick:*:{
  if ($did = 1) {
    did -r quotez 2
    did -a quotez 2 $read(utilities/quote.txt,$calc($did(quotez,1).sel -1))
    did -i quotez 1 1 headertext + 0 Selected: $+ $calc($did(quotez,1).sel -1) $+ / $+ $lines(utilities/quote.txt)
  }
  if ($did = 3) { did -r quotez 2 }
  if ($did = 7) {
    if ($did(quotez,2).text = $null) { beep }
    else {
      write utilities/quote.txt ( $+ $asctime(ddd dd mmm yyyy) $+ ) $did(quotez,2).text
      did -a quotez 1 ( $+ $asctime(ddd dd mmm yyyy) $+ ) $did(quotez,2).text
      did -i quotez 1 1 headertext + 0 Total: $+ $lines(utilities/quote.txt)
    }
  }
  if ($did = 8) {
    if ($did(quotez,1).sel = $null) { beep }
    else {
      write -dl $+ $calc($did(quotez,1).sel - 1) utilities/quote.txt
      did -d quotez 1 $did(quotez,1).sel
      did -i quotez 1 1 headertext + 0 Total: $+ $lines(utilities/quote.txt)
    }
  }
  if ($did = 10) {
    if ($did(quotez,1).sel = $null) { beep }
    else {
      if ($active = $chan) { _xmsg.c (Quote $calc($did(quotez,1).sel -1) $+ / $+ $lines(utilities/quote.txt) $+ ) $read(utilities/quote.txt,$calc($did(quotez,1).sel -1)) }
      else { _xmsg.q (Quote $calc($did(quotez,1).sel -1) $+ / $+ $lines(utilities/quote.txt) $+ ) $read(utilities/quote.txt,$calc($did(quotez,1).sel -1)) }
    }
  }
  if ($did = 11) { quosearch }
  if ($did = 15) {
    did -r quotez 13
    quotezs $did(14)
    dll dll/mdx.dll SetControlMDX quotez 13 listview single rowselect report flatsb grid labeltip nosortheader > dll/views.mdx
    did -i quotez 13 1 headerdims 1000:1
    did -i quotez 13 1 headertext + 0 Total Search: $+ $lines(utilities/squote.txt)
  }
  if ($did = 23) {
    if ($did(quotez,13).sel = $null) { beep }
    else {
      if ($active = $chan) { _xmsg.c (Quote $calc($did(quotez,1).sel -1) $+ / $+ $lines(utilities/quote.txt) $+ ) $read(utilities/quote.txt,$calc($did(quotez,1).sel -1)) }
      else { _xmsg.q (Quote $calc($did(quotez,1).sel -1) $+ / $+ $lines(utilities/quote.txt) $+ ) $read(utilities/quote.txt,$calc($did(quotez,1).sel -1)) }
    }
  }
  if ($did = 21) {
    did -r quotez 13,14
    write -c utilities/squote.txt
    did -i quotez 13 1 headertext + 0 Total Search: $+ $lines(utilities/squote.txt)
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
