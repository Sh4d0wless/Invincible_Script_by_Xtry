;___________________________________________
; Invincible by Xtry
; Pic Player
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias picplay { if ($dialog(picp)) dialog -v picp | dialog -m picp picp }
dialog picp {
  title "Pic Player"
  icon graph/picp.ico
  size -1 -1 169 75
  option dbu
  list 1, 3 4 109 68,size sort
  box "", 2, 2 0 111 73
  box "",6,115 58 52 15
  button "Close", 3, 116 62 50 10,ok
  box "",4,115 0 52 35
  button "Send To Active",5,116 4 50 10,disable
  button "Own Window",7,116 14 50 10,disable
  button "Refresh",8,116 24 50 10
}
on *:DIAlOG:picp:init:0:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll dll/mdx.dll SetFont 1,3,5,7,8 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 3,5,7,8 clientedge
  dll $mdllx SetControlMDX $dname 1 listview single grid rowselect report flatsb nosortheader > dll/views.mdx
  did -i $dname 1 1 headerdims 140:1 55:2
  did -i $dname 1 1 headertext + 0 Names ( $+ $findfile(utilities/emo/picp,*.txt,0)) $+ ) $+ $chr(9) $+ + 0 Lines
  picpz
}
on *:DIAlOG:picp:dclick:*:{
  if ($did = 1) {
    if ($active = status window) { .play -es " $+ $findfile(utilities/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1 }
    else { .play -e " $+ $findfile(utilities/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1 }
  }
}
on *:DIAlOG:picp:sclick:*:{
  if ($did = 1) {
    if ($did($dname,1).sel isnum) { did -e $dname 5,7 }
    else { did -b $dname 5,7 }
  }
  if ($did = 7) { picpw }
  if ($did = 5) {
    if ($active = status window) { .play -es " $+ $findfile(utilities/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1 }
    else { .play " $+ $findfile(utilities/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1000 }
  }
  if ($did = 8) {
    did -r $dname 1
    did -b $dname 5,7
    picpz
    did -i $dname 1 1 headertext + 0 Names ( $+ $findfile(utilities/emo/picp,*.txt,0)) $+ ) $+ $chr(9) $+ + 0 Lines
  }
}
alias picpz {
  set %rpic 0
  set %picpdir utilities/emo/picp
  set %picptot $findfile(%picpdir,*.txt,0)
  :loop
  inc %rpic
  if (%rpic > %picptot) { halt }
  did -a $dname 1 1 $nopath($findfile(%picpdir,*.txt,%rpic)) $chr(9) $lines($findfile(%picpdir,*.txt,%rpic))
  goto loop
}
alias picpw {
  if (@picplay != $null) {
    window @picplay fixedsys 12
    .play -e @picplay " $+ $findfile(utilities/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1
  }
  else  { .play -e @picplay " $+ $findfile(utilities/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1 }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
