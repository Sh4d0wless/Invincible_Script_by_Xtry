;___________________________________________
; Invincible by Xtry
; Quits Editor
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias qdialquit { if ($dialog(quits)) dialog -v quits | else dialog -m quits quits }
dialog quits {
  size -1 -1 500 200
  icon graph/quit.ico
  title "Quits Editor"
  box "Quits Editor", 1, 10 10 400 180
  list 2, 20 30 380 160 
  box "" 3, 415 10 75 180
  button "Close", 4, 427 165 50 20,ok 
  button "Add", 5, 427 55 50 20
  button "Remove", 6, 427 75 50 20
  icon 7, 434 20 35 35 , graph/quit.ico
  radio "Enable",10,427 110 50 20,group push
  radio "Disable",11,427 130 50 20,push
}
on *:dialog:quits:init:0: {
  if (%qiutedi = on) { did -c quits 10 }
  if (%qiutedi = off) { did -c quits 11 }
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,2,4,5,6,8 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 4,5,6,10,11 clientedge
  dll dll/mdx.dll SetControlMDX $dname 2 listview report single flatsb nosortheader grid labeltip > dll/views.mdx
  did -i $dname 2 1 headerdims 520
  did -i $dname 2 1 headertext Random quits
  raquitm
}
on *:Dialog:quits:sclick:*: {
  if ( $did == 6 && $did($dname,2).sel != $null ) { /requit }
  if ( $did == 5 ) { dialog -m qadd qadd }
  if ( $did == 10 ) { set %qiutedi on }
  if ( $did == 11 ) { set %qiutedi off }
}
dialog qadd {
  size -1 -1 400 60
  icon graph/quit.ico
  title "Add Quit Message"
  button "Add", 1, 280 21 40 18
  box "", 2, 10 5 380 43
  edit "" 3, 20 20 250 20 , autohs
  button "Cancel" 4, 325 21 50 18,ok
}
on *:dialog:qadd:init:0: {
  did -f $dname 3
}
on *:dialog:qadd:sclick:1: {
  write utilities/quits.txt $did($dname,3).text
  did -r $dname 3
  dialog -x $dname $dname
  raquitm
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
