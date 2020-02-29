;___________________________________________
; Invincible by Xtry
; Colorfull Text Box
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias tbox { if ($dialog(tbox)) dialog -v tbox | else dialog -m tbox tbox }
dialog tbox { 
  title "Colorfull Text Box"
  icon graph/e-color.ico
  size -1 -1 260 254
  text "Text :", 1, 15 7 120 20
  edit  "", 2, 15 20 230 105, multi
  text "Background Color :", 3, 15 130 120 20
  combo 6, 15 145 230 105, hsbar size drop
  text "Text Color :", 5, 15 173 120 20
  combo 4, 15 187 230 105, hsbar size drop
  button "Say It", 100, 18 220 60 20
  box "",7,15 211 66 32
  button "Close", 8, 183 220 60 20, ok
  box "",9,180 211 66 32
}

on 1:DIALOG:tbox:init:0:{
  did -a tbox 6 White
  did -a tbox 6 Black
  did -a tbox 6 Dark Blue
  did -a tbox 6 Dark Green
  did -a tbox 6 Red
  did -a tbox 6 Dark Red
  did -a tbox 6 Purple
  did -a tbox 6 Orange
  did -a tbox 6 Yellow
  did -a tbox 6 Green
  did -a tbox 6 Cyan
  did -a tbox 6 Light Blue
  did -a tbox 6 Blue
  did -a tbox 6 Pink
  did -a tbox 6 Dark Grey
  did -a tbox 6 Grey
  did -a tbox 4 White
  did -a tbox 4 Black
  did -a tbox 4 Dark Blue
  did -a tbox 4 Dark Green
  did -a tbox 4 Red
  did -a tbox 4 Dark Red
  did -a tbox 4 Purple
  did -a tbox 4 Orange
  did -a tbox 4 Yellow
  did -a tbox 4 Green
  did -a tbox 4 Cyan
  did -a tbox 4 Light Blue
  did -a tbox 4 Blue
  did -a tbox 4 Pink
  did -a tbox 4 Dark Grey
  did -a tbox 4 Grey
  did -c tbox 6 5
  did -c tbox 4 11
}

on 1:dialog:tbox:sclick:100:{
  set %gt.w53 $did(2)
  set %gt.color $did(6)
  set %gt.cot $did(4)
  set %gt.len $len(%gt.w53)
  if ( %gt.color = White ) set %gt.color 0
  if ( %gt.color = Black ) set %gt.color 1
  if ( %gt.color = Dark Blue ) set %gt.color 2
  if ( %gt.color = Dark Green ) set %gt.color 3
  if ( %gt.color = Red ) set %gt.color 4
  if ( %gt.color = Dark Red ) set %gt.color 5
  if ( %gt.color = Purple ) set %gt.color 6
  if ( %gt.color = Orange ) set %gt.color 7
  if ( %gt.color = Yellow ) set %gt.color 8
  if ( %gt.color = Green ) set %gt.color 9
  if ( %gt.color = Cyan ) set %gt.color 10
  if ( %gt.color = Light Blue ) set %gt.color 11
  if ( %gt.color = Blue ) set %gt.color 12
  if ( %gt.color = Pink ) set %gt.color 13
  if ( %gt.color = Dark Grey ) set %gt.color 14
  if ( %gt.color = Grey ) set %gt.color 15
  if ( %gt.cot = White ) set %gt.cot 0
  if ( %gt.cot = Black ) set %gt.cot 1
  if ( %gt.cot = Dark Blue ) set %gt.cot 2
  if ( %gt.cot = Dark Green ) set %gt.cot 3
  if ( %gt.cot = Red ) set %gt.cot 4
  if ( %gt.cot = Dark Red ) set %gt.cot 5
  if ( %gt.cot = Purple ) set %gt.cot 6
  if ( %gt.cot = Orange ) set %gt.cot 7
  if ( %gt.cot = Yellow ) set %gt.cot 8
  if ( %gt.cot = Green ) set %gt.cot 9
  if ( %gt.cot = Cyan ) set %gt.cot 10
  if ( %gt.cot = Light Blue ) set %gt.cot 11
  if ( %gt.cot = Blue ) set %gt.cot 12
  if ( %gt.cot = Pink ) set %gt.cot 13
  if ( %gt.cot = Dark Grey ) set %gt.cot 14
  if ( %gt.cot = Grey ) set %gt.cot 15
  if ($active = $chan) {
    _xmsg.c  $+ %gt.color $+ , $+ %gt.color $+    $+  $+ %gt.cot $+ , $+ %gt.color $+ %gt.w53 $+  $+ %gt.color $+ , $+ %gt.color $+    $+  
  }
  else {
    _xmsg.q  $+ %gt.color $+ , $+ %gt.color $+    $+  $+ %gt.cot $+ , $+ %gt.color $+ %gt.w53 $+  $+ %gt.color $+ , $+ %gt.color $+    $+ 
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
