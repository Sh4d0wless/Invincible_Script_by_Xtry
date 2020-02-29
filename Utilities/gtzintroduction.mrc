;___________________________________________
; Invincible by Xtry
; Introduction Controls
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias introx { if ($dialog(intro)) dialog -v intro | else dialog -m intro intro }
dialog intro {
  title " Introduction Setup "
  icon graph/intromy.ico
  size -1 -1 285 390
  box "Introduction Setup" ,2, 5 3 275 380
  button "Cancel" ,25, 14 347 80 25 ,cancel
  button "Ok" ,1, 190 347 80 25 ,ok
  text "Name:",4, 15 38 64 20
  edit "" ,3, 90 35 180 20, autohs
  text "Age:" ,9, 15 58 34 20
  edit "" ,10, 90 55 180 20, autohs
  text "Gender:" ,11, 15 78 54 20 
  edit "" ,12, 90 75 180 20, autohs
  text "Location:" ,13, 15 98 54 20
  edit "" ,14, 90 95 180 20, autohs
  text "Job:" ,15, 15 118 54 20
  edit "" ,16, 90 115 180 20, autohs
  text "Birthday:" ,28, 15 138 54 20
  edit "" ,29, 90 135 180 20, autohs
  text "Height/Weight:" ,27, 15 158 70 20
  edit "" ,26, 90 155 180 20, autohs
  text "E-mail:" ,17, 15 178 64 20
  edit "" ,18, 90 175 180 20, autohs
  text "Phone:" ,23, 15 198 64 20
  edit "" ,24, 90 195 180 20, autohs
  text "Interests:" ,19, 15 218 64 20
  edit "" ,20, 90 215 180 20, autohs
  text "Dislikes:" ,34, 15 238 64 20
  edit "" ,35, 90 235 180 20, autohs
  text "Marital Status:" ,36, 15 258 70 20
  edit "" ,37, 90 255 180 20, autohs
  text "Homepage:" ,30, 15 278 54 20
  edit "" ,31, 90 275 180 20, autohs
  text "ICQ:" ,32, 15 298 54 20
  edit "" ,33, 90 295 180 20, autohs
  text "About Me:" ,21, 15 318 54 20
  edit "" ,22, 90 315 180 20, autohs
}
on 1:dialog:intro:*:*: {
  if ($Devent == init) {
    dll dll/mdx.dll SetMircVersion $version
    dll dll/mdx.dll MarkDialog $dname
    dll dll/mdx.dll SetFont 2,25,1,4,3,9,10,11,12,13,14,15,16,28,29,27,26,17,18,23,24,19,20,30,31,32,33,21,22,34,35,36,37 13 14 Tahoma 
    dll dll/mdx.dll SetBorderStyle $dname 1,25 clientedge
    introx.init
  }
  if ($Devent == sclick) {
    if ($did == 1) { set %name1 $did(3) | set %age1 $did(10) | set %sex1 $did(12) | set %country1 $did(14) | set %school $did(16) | set %myhw $did(26) | set %bdayx $did(29) | set %page $did(18) | set %phone1 $did(24) | set %hobby $did(20) | set %my.hphp $did(31) | set %my.icqno $did(33) | set %other.info $did(22) | set %my.disl $did(35) | set %my.mstat $did(37) }
  }
}
alias introx.init {
  did -a $dname 3 %name1
  did -a $dname 10 %age1
  did -a $dname 12 %sex1
  did -a $dname 14 %country1
  did -a $dname 16 %school
  did -a $dname 29 %bdayx
  did -a $dname 26 %myhw
  did -a $dname 18 %page
  did -a $dname 24 %phone1
  did -a $dname 20 %hobby
  did -a $dname 22 %other.info
  did -a $dname 31 %my.hphp
  did -a $dname 33 %my.icqno
  did -a $dname 35 %my.disl
  did -a $dname 37 %my.mstat
}
;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
