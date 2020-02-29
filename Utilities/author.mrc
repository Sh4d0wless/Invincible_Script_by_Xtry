;___________________________________________
; Invincible by Xtry
; About Dialog & Colors Dialog
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;author dialog
alias authorx {
  dialog -mrvo auth auth
}

dialog auth {
  title About %name2
  size -1 -1 270 240
  icon graph/gtzlogo.ico
  icon 2,15 10 80 35,graph\gtzlogo.ico
  icon 13,190 10 90 65,graph\ivan.jpg,disable

  text "Invincible®",3,60 10 100 15
  text "mIRC Script",4,60 25 100 15
  text "By Xtry (Ivan)",5,60 45 100 15
  text "Copyright © 2000-2003",9,60 65 120 15
  text "Invincible Co. Ltd.",10,60 80 100 15
  text "All Rights Reserved",11,60 95 100 15
  link "InvincibleScript@yahoo.com",12,60 115 150 15
  text "Credits :",14,60 150 100 15,hide
  text "J4g4L @ DALnet (#malam)",15,60 165 150 15,hide
  text "ya2ng @ DALnet",16,60 180 150 15,hide

  button "Continue",1,200 210 60 25,ok
}
on *:dialog:auth:init:0: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,2,7,5 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 1,7,2 clientedge
  set %_about 0
}
on 1:dialog:auth:sclick:*:{
  if ($did = 2) {
    if (%_about = 0) { .splay %invinciblesound | did -ev $dname 13,14,15,16 | set %_about 1 }
    else { .splay stop | did -bh $dname 13,14,15,16 | set %_about 0 }
  }
  if ($did = 13) { .run http://www.facelink.com/ivantrance | dialog -x $dname $dname }
  if ($did = 12) { .run mailto: InvincibleScript@yahoo.com }
  if ($did = 1) { .splay stop }
}


;colors dialog
alias col.d { if ($dialog(col)) dialog -v col | else dialog -m col col }
dialog col {
  title "Colors Box"
  icon graph/toolbar.ico
  size -1 -1 180 60

  icon 1, 10 10 18 18
  icon 2, 30 10 18 18
  icon 3, 50 10 18 18
  icon 4, 70 10 18 18
  icon 5, 90 10 18 18
  icon 6, 110 10 18 18
  icon 7, 130 10 18 18
  icon 8, 150 10 18 18
  icon 9, 10 30 18 18
  icon 10, 30 30 18 18
  icon 11, 50 30 18 18
  icon 12, 70 30 18 18
  icon 13, 90 30 18 18
  icon 14, 110 30 18 18
  icon 15, 130 30 18 18
  icon 16, 150 30 18 18
}

on *:dialog:col:init:*:{
  did -gv $dname 1 graph/col/00.bmp
  did -gv $dname 2 graph/col/01.bmp
  did -gv $dname 3 graph/col/02.bmp
  did -gv $dname 4 graph/col/03.bmp
  did -gv $dname 5 graph/col/04.bmp
  did -gv $dname 6 graph/col/05.bmp
  did -gv $dname 7 graph/col/06.bmp
  did -gv $dname 8 graph/col/07.bmp
  did -gv $dname 9 graph/col/08.bmp
  did -gv $dname 10 graph/col/09.bmp
  did -gv $dname 11 graph/col/10.bmp
  did -gv $dname 12 graph/col/11.bmp
  did -gv $dname 13 graph/col/12.bmp
  did -gv $dname 14 graph/col/13.bmp
  did -gv $dname 15 graph/col/14.bmp
  did -gv $dname 16 graph/col/15.bmp
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
