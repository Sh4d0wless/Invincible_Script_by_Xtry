;___________________________________________
; Invincible by Xtry
; Triple Bans
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias tb {
  if ($1 == $null) {
    $_tb.error(usage)
    halt
  }
  if ($me !isop $chan) {
    $_tb.error(op)
    halt
  }
  if ($active !ischan) {
    $_tb.error(chan)
    halt
  }
  if ($1) && ($me isop $chan) && ($active ischan) {
    var %x = $address($1,3) 
    var %y = $address($1,9) 
    var %z = $address($1,2)
    mode $chan -o+bbb $1 %x %y %z
    ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Sending triple bans to $+ $cxs(1) $1
  }
}

; kick alias
alias tbk {
  if ($active ischan) && ($me isop $chan) && ($1) {
    tb $1
    kick $chan $1 Triple Bans $iif($2,-) $2-
  }
}

; error msgs
alias _tb.error {
  if ($1 == chan) {
    ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) To use triple bans you must be on a channel
    halt
  }
  if ($1 == op) { 
    ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) To use triple bans you must be a channel operator
    halt
  }
  if ($1 == usage) { 
    ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Insufficient parameters syntax , use $+ $cxs(1) /tb nickname
    halt
  }
  else {
    return
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
