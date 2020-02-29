;___________________________________________
; Invincible by Xtry
; Text System
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias xssctxt { if ($dialog(xssctxt)) dialog -v xssctxt | else dialog -m xssctxt xssctxt }
dialog xssctxt {
  title "Text System"
  icon graph/text.ico
  size -1 -1 114 75
  option dbu
  button "Ok",1,5 60 30 10,ok
  button "Cancel",9,35 60 30 10,cancel
  box "",15,3 55 64 17
  box "",8,3 26 108 17
  box "",12,3 39 108 17
  combo 2,58 5 50 60,drop
  text "Primary Colour :",3,6 7 40 7
  box "",4,3 0 108 17
  box "",5,3 13 108 17
  combo 6,58 18 50 60,drop
  text "Secondary Colour :",7,6 20 47 7
  combo 10,58 31 50 60,drop center
  text "Tertiary Colour :",11,6 33 40 7
  text "Echo Logo Style :",13,6 46 50 10
  combo 14,58 44 20 60,drop
}
on *:dialog:xssctxt:*:*:{
  if ($devent == init) {
    dll dll/mdx.dll SetMircVersion $version
    dll dll/mdx.dll MarkDialog $dname
    dll dll/mdx.dll SetFont 1,2,9,3,6,7,10,11,13,14 13 400 Tahoma
    dll dll/mdx.dll SetBorderStyle $dname 1,9 clientedge
    did -ca $dname 14 %xsbrack
    xscolist1
    xscolist2
    xscolist3
    did -a $dname 14 »
    did -a $dname 14 «
    did -a $dname 14 ·
    did -a $dname 14 ©
    did -a $dname 14 ¤
    did -a $dname 14 >
    did -a $dname 14 ×
    did -a $dname 14 Þ
    did -a $dname 14 ¦¦
    did -a $dname 14 †
    did -a $dname 14 ‡
    did -a $dname 14 °
    did -a $dname 14 *
    did -a $dname 14 ¬
    did -a $dname 14 ®
    did -a $dname 14 §
    did -a $dname 14 ¢
    did -a $dname 14 ø
    did -a $dname 14 ÷
    did -a $dname 14 •
    did -a $dname 14 €
    did -a $dname 14 º
    did -a $dname 14 ô
    did -a $dname 14 ::
    did -a $dname 14 ]
    did -a $dname 14 ±
    did -a $dname 14 ª
    did -a $dname 14 ***
    did -a $dname 14 ›
    did -a $dname 14 ‹
    did -a $dname 14 µ
    did -a $dname 14 ¶
    did -a $dname 14 ‹›
    did -a $dname 14 Ð
    did -a $dname 14 œ
  }
  if ($devent == sclick) {
    if ($did = 1) {
      xsw.Set colors color.1 $calc($xsisset($did($dname,2).sel,15) -1 )
      xsw.Set colors color.2 $calc($xsisset($did($dname,6).sel,15) -1 )
      xsw.Set colors color.3 $calc($xsisset($did($dname,10).sel,15) -1 )
      set %xsbrack $did($dname,14)
    }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
