;___________________________________________
; Invincible by Xtry
; Script Pass Protection
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on 1:load: {
  :start1
  set %yes.or.no $?="Do you want %name2 to be password protected (y/n)"
  if (%yes.or.no == y) goto set1
  elseif (%yes.or.no == n) {
    set %on.off OFF
    halt
  }
  elseif (%yes.or.no == $null) goto start1
  :set1 
  set %on.off ON
  set %pass $?*="What do you want the password to be?"
  if (%pass == $null) goto set1
  elseif (%pass != $null) {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Password has been succesfully set as $+ $cxs(1) %pass 
    halt  
  }
}
on 1:start: {
  :start
  if (%yes.or.no == y) goto check
  if (%yes.or.no == n) halt
  elseif (%yes.or.no == $null) {
    set %yes.or.no $?="Do you want %name2 to be password protected (y/n)"
    if (%yes.or.no == y) goto set
    elseif (%yes.or.no == n) {
      set %on.off OFF
      halt
    }
    else goto start
  }
  :set 
  set %on.off ON
  set %pass $?*="What do you want the password to be?"
  if (%pass == $null) goto set
  elseif (%pass != $null) {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Password has been succesfully set to $+ $cxs(1) %pass 
    halt  
  }
  :check 
  .splay %passprot
  set %check.pass $?*="Enter %name2 password :"
  if (%check.pass === %pass) {
    clear
    gcorrect
    halt  
  }
  elseif (%check.pass === $null) goto check
  elseif (%check.pass !=== %pass)  {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Incorrect password
    set %check.pass $?*="Password incorrect. This is the last change, pls try again :" 
    if (%check.pass === %pass) {
      clear
      gcorrect
      halt  
    }
    else echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Incorrect password | /.splay %incorrect | .timer 1 2 /exit
  }  
}
alias passchange { .timer -m 1 1 timer_now }
alias timer_now { change.pass }
alias change.pass {
  if (%on.off == ON) {
    set %check.pass $?="Enter the old password :"
    if (%check.pass === %pass) {
      :set1
      set %pass $?*="Enter the new password :"
      if (%pass == $null) goto set1
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Password has been succesfully changed to $+ $cxs(1) %pass 
      halt
    }
    elseif (%check.pass != %pass) {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Incorrect password 
      halt
    }
  }
  elseif (%on.off == OFF) {
    :start
    set %pass $$?*="Enter the new password :"
    if (%pass == $null) goto start
    else {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Password has been succesfully set to $+ $cxs(1) %pass 
      set %on.off ON
      set %yes.or.no y
      halt
    }
  }
}
alias gtzpp { if ($dialog(apass)) dialog -v apass | else dialog -m apass apass }
dialog apass {
  size -1 -1 300 200
  title Pass Protection
  icon graph\key.ico
  button "Ok",1, 150 175 65 20, OK
  button "Cancel",2, 220 175 65 20, CANCEL
  box "",3, 5 5 285 160
  text "Password Protection",4, 20 22 120 20
  radio "On",5, 150 20 35 20, group
  radio "Off",6, 200 20 35 20
  box "Settings",7, 10 50 275 100
  text "Password:",8, 20 72 65 20
  edit "",9, 90 70 80 20, autohs %pass
  button "Change",10, 190 70 60 20
  text Password Protection is created to only allow people who know your password to access %name2 ,11, 20 100 250 60
}
on *:dialog:apass:edit:*: {
  if ($did == 9) { set %pass $did(9) }
}
on *:dialog:apass:sclick:*: {
  if ($did == 5)  { .timer 1 0 set %yes.or.no y | did -e $dname 8,9,10 }
  if ($did == 6) { .timer 1 0 set %yes.or.no n | did -b $dname 8,9,10 }
  if ($did == 10) { passchange }
}
on *:dialog:apass:init:0: {
  if (%passs >= 1) { goto start }
  set %passs 0
  inc %passs 1
  if (%passs == 1) { startpass }
  :start
  did -o apass 9 1 %pass $did(9)
  did -b $dname 10 
  if (%yes.or.no == y) { did -c apass 5 1 %yes.or.no $did(5) | did -e $dname 8,9,10 }
  if (%yes.or.no == n) { did -c apass 6 1 %yes.or.no $did(6) | did -b $dname 8,9,10 } 
}
alias startpass { .timer -m 1 1 startpass_now }
alias startpass_now { set %yes.or.no $?="Do you want %name2 to be password protected? (y/n)" | if (%yes.or.no == y) { set %pass $?*="What do you want the password to be?" } | if (%yes.or.no == n) { did -b $dialog(apass) 8,9,10 | did -c $dialog(apass) 6 1 } 
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
