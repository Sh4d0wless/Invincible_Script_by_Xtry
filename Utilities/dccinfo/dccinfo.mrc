;___________________________________________
; Invincible by Xtry
; DCC Info
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias dccinfo { if ($dialog(dcc)) dialog -v dcc | else dialog -md dcc dcc }
dialog dcc {
  title "Dcc Transfer Info"
  icon graph/abconn.ico
  size -1 -1 671 240
  button "Close",1,602 210 60 20,ok
  box "",9,598 200 68 34
  check "Start",2,8 210 60 20,push
  box "",6,4 200 68 34
  box "",3,4 -2 662 205,size
  list 5, 7 7 656 193,size
  check "Open on file transfer",7,80 206 120 15
  check "Start on open",8,80 221 120 15
}

on *:dialog:dcc:init:*:{
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname 
  dll dll/mdx.dll SetControlMDX $dname 5 ListView report icon sortascending grid nosortheader > dll/views.mdx
  var %dcc1 $mdx(SetControlMDX,5 listview report editlabels nosortheader single rowselect infotip showsel flatsb > [ dll/views.mdx ] )
  did -i dcc 5 1 headerdims 42:1 70:2 140:3 190:4 80:5 50:6 80:7
  did -i dcc 5 1 headertext +l Type $chr(9) Status $chr(9) Nickname $chr(9) Filename $chr(9) Percentage $chr(9) Rate $chr(9) Open
  if (%dccistart = on) { dcciplay | did -c dcc 8
    else { dccistop | did -u dcc 8 }
  }
  if (%dcciopen = on) { did -c dcc 7
    else { did -u dcc 8 }
  }
}
alias dcc.rehash {
  var %a = 1
  while (%a <= $get(0)) {  did -a dcc 5 Get $chr(9) $get(%a).status $chr(9) $get(%a) $chr(9) $get(%a).file $chr(9) $get(%a).pc $+ % $chr(9) $bytes($get(%a).cps,3k).suf $chr(9) $duration($get(%a).secs) |  inc %a }
  var %a = 1
  while (%a <= $send(0)) {  did -a dcc 5 Send $chr(9) $send(%a).status $chr(9) $send(%a) $chr(9) $send(%a).file $chr(9) $send(%a).pc $+ % $chr(9) $bytes($send(%a).cps,3k).suf $chr(9) $duration($send(%a).secs) |  inc %a }
}
on *:dialog:dcc:sclick:*: {
  if ($did = 1) { .timerdm off }
  if ($did = 2) { if ($did($dname,$did).state == 1) { dcciplay }
    if ($did = 2) { if ($did($dname,$did).state == 0) { dccistop }
    }
  }
  if ($did = 8) { if ($did($dname,$did).state == 1) { set %dccistart on | set %dcciwatch on | did -c dcc 8 }
    if ($did = 8) { if ($did($dname,$did).state == 0) { set %dccistart off | set %dcciwatch off | did -u dcc 8 }
    }
  }
  if ($did = 7) { if ($did($dname,$did).state == 1) { set %dcciopen on | did -c dcc 7 }
    if ($did = 7) { if ($did($dname,$did).state == 0) { set %dcciopen off | did -u dcc 7 }
    }
  }
}
alias -l vdll { return dll/views.mdx }
alias dcciplay { set %dcciwatch on | did -a $dname 2 Stop | did -c $dname 2 | .timerdm 0 1 dcc.rehash }
alias dccistop { set %dcciwatch off | did -a $dname 2 Start | did -u $dname 2 | .timerdm off }

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
