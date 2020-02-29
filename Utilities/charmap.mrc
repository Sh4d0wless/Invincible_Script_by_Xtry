;___________________________________________
; Invincible by Xtry
; Characters Map
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias _asciimake {
  var %charz.a = 32, %charz.b = 128
  while (%charz.a < 128) { did -a ascii 3 $chr(36) $+ chr( $+ %charz.a $+ ) $chr(9) $chr(%charz.a) | inc %charz.a }
  while (%charz.b < 256) { did -a ascii 4 $chr(36) $+ chr( $+ %charz.b $+ ) $chr(9) $chr(%charz.b) | inc %charz.b }
}
alias ascii.copy { clipboard $gettok($did(3).seltext,11-,32) }
alias ascii.copy2 { clipboard $gettok($did(4).seltext,11-,32) }
alias charmap { if ($dialog(ascii)) dialog -v ascii | else dialog -m ascii ascii }
dialog ascii {
  title "Characters Map"
  size -1 -1 280 328
  icon graph/chars.ico
  option pixel
  tab "32-127", 1, 2 2 275 326
  tab "128-255", 2
  list 3, 10 30 260 300, tab 1
  list 4, 10 30 260 300, tab 2
  button "&Ok", 6, 230 340 60 25, ok hide
}

on *:dialog:ascii:init:*: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetControlMDX 3,4 ListView headerdrag report rowselect showsel grid nosortheader single > dll/views.mdx
  did -i $dname 3,4 1 headerdims 70:1 160:3
  did -i $dname 3,4 1 headertext chr(x) $chr(9) $+ Symbol $+ 
  _asciimake
}

on *:dialog:ascii:sclick:3: {
  if ($gettok($did($dname,3,1),1,32) != rclick) halt
  dll dll/popups.dll New ascii 16 16
  dll dll/popups.dll AddItem ascii end 1 1 &Copy $cr ascii.copy
  pop ascii $mouse.dx $mouse.dy
}

on *:dialog:ascii:sclick:4: {
  if ($gettok($did($dname,4,1),1,32) != rclick) halt
  dll dll/popups.dll New ascii2 16 16
  dll dll/popups.dll AddItem ascii2 end 1 1 &Copy $cr ascii.copy2
  pop ascii2 $mouse.dx $mouse.dy
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
