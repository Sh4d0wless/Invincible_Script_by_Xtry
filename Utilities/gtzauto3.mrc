;___________________________________________
; Invincible by Xtry
; Auto Oper & Auto Regain Nick
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias aoperz { if ($dialog(autooper)) dialog -v autooper | else dialog -m autooper autooper }
dialog autooper {
  size -1 -1 251 145
  title "Auto Oper (IRCop)"
  icon graph/aoperz.ico
  button "Ok",1, 160 110 85 20, OK
  box "",2, 5 8 240 97
  text "Server :",3, 15 20 45 20
  edit "",4, 70 20 115 20, autohs
  text "Nickname :",5, 15 50 55 20
  edit "",6, 70 48 115 20, autohs 
  text "Password :",7, 15 80 55 20
  edit "",8, 70 78 115 20, autohs %ircop.pass
  button "Clear",10, 190 20 40 20 
  button "Clear",11, 190 48 40 20
  button "Clear",12, 190 78 40 20
  radio "On",13, 5 110 35 20,push
  radio "Off",14, 45 110 35 20,push
}
on *:DIALOG:autooper:edit:*: {
  if ($did == 6) { set %ircop.nick $did(6) }
  if ($did == 8) { set %ircop.pass $did(8).text }
  if ($did == 4) { set %ircop.serv $did(4) }
}
on *:dialog:autooper:init:0:{
  did -o autooper 6 1 %ircop.nick $did(6)
  did -o autooper 8 1 %ircop.pass $did(8).text
  did -o autooper 4 1 %ircop.serv $did(4)
  if (%auto.oper == on) { did -c autooper 13 1 %auto.oper $did(13) }
  if (%auto.oper == off) { did -c autooper 14 1 %auto.oper $did(14) }
  if (%auto.oper == off) { did -b $dname 3,4,5,6,7,8 }
  if (%auto.oper == on) { did -e $dname 3,4,5,6,7,8 }
} 
on *:dialog:autooper:sclick:*:{
  if ($did == 10) { unset %ircop.serv | did -o autooper 4 1 %ircop.serv }
  if ($did == 11) { unset %ircop.nick | did -o autooper 6 1 %ircop.nick }
  if ($did == 12) { unset %ircop.pass | did -o autooper 8 1 %ircop.pass }
  if ($did == 13) { set %auto.oper on | did -e $dname 3,4,5,6,7,8 }
  if ($did == 14) { set %auto.oper off | did -b $dname 3,4,5,6,7,8 }
}
on *:connect: { 
  if (%ircop.nick != $null) && (%ircop.pass != $null) && ($server == %ircop.serv) && (%auto.oper == on) { oper %ircop.nick %ircop.pass }
}


;Auto Regain Nick
alias RegainNickOn { 
  if %RegainNickFlag == 1 goto AlreadyRunning
  .set %RegainNick $$?="Enter Nick To Regain :" 
  if %RegainNick == $me goto SameNick
  .nick   %RegainNick
  .notify %RegainNick 
  .set %RegainNickFlag 1 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Monitoring to regain $+ $cxs(1) %RegainNick
  goto Hop
  :Samenick
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Cannot monitor your own nick
  halt
  :AlreadyRunning
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto regain nick is already running and currently monitoring to regain $+ $cxs(1) %RegainNick
  halt
  :Hop
}

alias RegainNickOff { 
  if  (%RegainNickFlag == 1)  {
    .notify -r %RegainNick 
    .set %RegainNick ""
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto regain nick was $+ $cxs(1) Disabled
    .set %RegainNickFlag 0 
  }
  else { .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto regain nick is not running | halt }
}

on *:UNOTIFY:{
  if  (%RegainNickFlag == 1) {    
    if ($nick == %RegainNick) { 
      .nick %RegainNick 
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Successfully regained the nick $+ $cxs(1) %RegainNick
      .RegainNickOff
    }
  }
  else halt
}

on *:NICK:{
  if (%RegainNickFlag == 1) {
    if (%RegainNick == $me) {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Successfully regained $+ $cxs(1) %RegainNick
      .RegainNickOff
    }
  }
}
alias aregainn { if ($dialog(autoregn)) dialog -v autoregn | else dialog -m autoregn autoregn }
dialog autoregn {
  title "Auto Regain Nick"
  icon graph/nicks.ico
  size -1 -1 100 37
  option dbu
  box "",4,3 0 94 34
  button "Close",1,5 22 90 10,ok
  radio "Enable",2,5 5 45 15,push
  radio "Disable",3,50 5 45 15,push
}
on 1:dialog:autoregn:init:0: {
  if ( %RegainNickFlag == 1 ) { did -c autoregn 2 }
  if ( %RegainNickFlag == 0 ) { did -c autoregn 3 }
}
on 1:dialog:autoregn:sclick:*: {
  if ( $did = 2 ) { Regainnickon }
  if ( $did = 3 ) { Regainnickoff }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
