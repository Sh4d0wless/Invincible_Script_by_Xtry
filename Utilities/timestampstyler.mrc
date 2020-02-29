;___________________________________________
; Invincible by Xtry
; Timestamp styler
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias tsgtz { if ($dialog(tsgtz)) dialog -v tsgtz | else dialog -m tsgtz tsgtz }
dialog tsgtz {
  title Timestamp Styler
  size -1 -1 220 125
  icon graph/ts.ico
  button "Default",1,10 95 60 20
  button "Close",2,151 95 60 20,ok
  edit "",3,10 25 200 20,autohs
  button "Preview",4,10 75 60 20
  check "Help",9,151 75 60 20,push
  text "Timestamp Style :",5,7 5 100 15
  box "",6,5 15 210 58
  box "",7,5 65 210 54
  icon 8, 10 45 200 25
  edit "",10,5 130 210 100,multi vsbar read
}
on *:dialog:tsgtz:init:0:{
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,2,3,4,9,5,10 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 1,2,4,9 clientedge
  did -a $dname 3 %stamp.style
  .loadbuf -o $dname 10 utilities/tshelp.txt
  did -h $dname 10
}
on *:dialog:tsgtz:sclick:*:{
  if ($did == 4) { 
    set %stamp.style $did($dname,3)
    tstampview
  }
  if ($did == 2) { .timestamp -f %stamp.style }
  if ($did == 9) { stamp.hlp }
  if ($did == 1) {
    set %stamp.style [HH:nn:ss]
    did -r $dname 3
    did -a $dname 3 %stamp.style
    tstampview
  }
}
alias -l tstampview {
  if ($dialog(tsgtz)) {
    window -hp +f @ts.preview 0 0 200 25 | clear @ts.preview
    if ($isfile(tspreviw.bmp)) { .remove tspreviw.bmp }
    drawfill @ts.preview $color(background) $color(background) 0 0
    drawtext -pb @ts.preview $color(background) $color(background) Tahoma 11 2 2 $chr(160) $time(%stamp.style) $chr(160)
    drawsave @ts.preview graph/tspreview.bmp | window -c @ts.preview
    did -gv tsgtz 8 graph/tspreview.bmp
  }
}
alias -l stamp.hlp {
  if ( $did(tsgtz,9).state == 0 ) {
    dialog -s tsgtz $dialog(tsgtz).x $dialog(tsgtz).y 220 125
    did -h tsgtz 10
  }
  else {
    dialog -s tsgtz $dialog(tsgtz).x $dialog(tsgtz).y 220 235
    did -v tsgtz 10
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
