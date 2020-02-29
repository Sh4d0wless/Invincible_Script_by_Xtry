;___________________________________________
; Invincible by Xtry
; Theme
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias thema { if ($dialog(thema)) dialog -v thema | else dialog -m thema thema }
alias thema.list {
  set %thema.list 1
  while %thema.list <= $lines(graph\theme\themes.txt) {
    did -a thema 3 $gettok($read(graph\theme\themes.txt,%thema.list),1,58)
    inc %thema.list
  }
}

dialog thema {
  title "Script Theme"
  size -1 -1 647 220
  icon graph/theme.ico
  icon 1, 10 10 500 200
  button "Preview",2,515 125 120 22,disable
  button "Apply",4,515 147 120 22,disable
  list 3,515 10 120 120,sort
  button "Close",5,515 186 120 22,ok
}

on *:dialog:thema:init:*:{
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 2,3,4,5 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 2,4,5 clientedge
  did -gv $dname 1 graph/theme/previewinit.bmp
  thema.list
}

on *:dialog:thema:sclick:*:{
  if ($did = 2) { themaview. $+ %thema.sel }
  if ($did = 3) { set %thema.sel $did($dname,3).seltext | did -e $dname 2,4 }
  if ($did = 4) {
    if ($?!="Do you want to clear all windows?" = $true) {
      clearall
      thema. $+ %thema.sel
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Script Theme changed to $+ $cxs(1) %thema.sel
    }
    else {
      thema. $+ %thema.sel
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Script Theme changed to $+ $cxs(1) %thema.sel
    }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
