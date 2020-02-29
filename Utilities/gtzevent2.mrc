;___________________________________________
; Invincible by Xtry
; Events
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on @:DEOP:#:{
  if (%Deop.protection = on) && ($opnick = $me) && ($nick != $me) {
    if ($nick ison $chan) {
      chanserv op $chan $me
      chanserv deop $chan $nick
      mode $chan -ov+b $nick $nick $address($nick,2)
      kick $chan $nick Deop Protection - %name
    }
    else { chanserv op $chan $me }
  }
}

on *:INPUT:?:{
  if ($left($1,3) = /me) && ($left($1,9) != /memoserv) { .me $2- | echo -at  $+ $color(action) $+ $me $2- | haltdef }
}

on *:KICK:#:{
  .ial on
  if (($knick = $me) && (%kick.protection = on)) {
    if ($nick = Chanserv) { halt }
    if ($nick = $me) { halt }
    chanserv unban $chan $me
    chanserv deop $chan $nick
    join $chan
    mode $chan -o+b $nick $address($nick,2)
    kick $chan $nick Kick Protection - %name
  }
}

on *:Ban:#:{
  .ial on
  if ($me !isop $chan) { halt }
  else {
    if ($banmask iswm $mask($address($me,1),0)) { goto protect }
    if ($banmask iswm $mask($address($me,1),1)) { goto protect }
    if ($banmask iswm $mask($address($me,1),2)) { goto protect }
    if ($banmask iswm $mask($address($me,1),3)) { goto protect }
    if ($banmask iswm $mask($address($me,1),4)) { goto protect }
    if ($banmask iswm $mask($address($me,1),5)) { goto protect }
    if ($banmask iswm $mask($address($me,1),6)) { goto protect }
    if ($banmask iswm $mask($address($me,1),7)) { goto protect }
    if ($banmask iswm $mask($address($me,1),8)) { goto protect }
    if ($banmask iswm $mask($address($me,1),9)) { goto protect }
    if ($banmask iswm $me $+ !*@*) { goto protect }
    else {
      set %banp2 0
      :monitorflash
      inc %banp2
    }
    if (%ban-enforcer = off) && ($ialchan($banmask,$chan,%banp2).nick isop $chan) { goto monitorflash | halt }
    if ($ialchan($banmask,$chan,%banp2).nick == $me) { goto monitorflash | halt }
    if ($ialchan($banmask,$chan,%banp2).nick == $null) { unset %banp2 | halt }
    elseif (%ban-enforcer = on) && ($ialchan($banmask,$chan,%banp2).nick ison $chan) {
      if ($nick = $me) {
        kick $chan $ialchan($banmask,$chan,%banp2).nick Ban Enforcer - %name
        goto monitorflash
      }
      else {
        kick $chan $ialchan($banmask,$chan,%banp2).nick Ban Enforcer (Banned by $nick $+ ) - %name
        goto monitorflash
      }
    }
  }
  :protect
  if ($ialchan($banmask,$chan,1).nick = $me) {
    if (%banonme = on) { .splay %mebanned }
    if (%banp = on) {
      mode $chan -ob+b $nick $banmask $address($nick,2)
      kick $chan $nick Ban Protection - %name | halt
    }
  }
  else halt
}

on ^*:NOTICE:*:*:{
  if ($nick != chanserv) && ($nick != nickserv) && ($nick != memoserv) && ($nick != statserv) && ($nick != operserv) && ($nick != helpserv) && ($nick != $server) && (DCC Send !isin $1-) {
    if (%x.notice2me = on) { .splay %sofnote }
  }
}

on 1:quit:{
  if ($nick == $me) && (%qiutedi = on) { quit $read(utilities/quits.txt) - %name }
}

ctcp ^*:PING:*:{
  if (%x.pingtome = on) && ($nick != $me) { .splay %x.pongtome }
}


on *:ACTION:*:#:{
  if ($me isin $1-) && (# != $active) && (%echox.hl = on) {
    if ($nick isop $chan) && ($nick !isvo $chan) && ($nick !isreg $chan) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Highlight channel action from $+ $cxs(1) $nick $cxs(3) $+ @ $+ $cxs(1) $chan  $+ $cxs(3) $+ : $timestamp  $+ $color(action) $+ @ $+ $nick $1- }
    if ($nick !isop $chan) && ($nick isvo $chan) && ($nick !isreg $chan) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Highlight channel action from $+ $cxs(1) $nick $cxs(3) $+ @ $+ $cxs(1) $chan  $+ $cxs(3) $+ : $timestamp  $+ $color(action) $+ + $+ $nick $1- }
    if ($nick !isop $chan) && ($nick !isvo $chan) && ($nick isreg $chan) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Highlight channel action from $+ $cxs(1) $nick $cxs(3) $+ @ $+ $cxs(1) $chan  $+ $cxs(3) $+ : $timestamp  $+ $color(action) $+ $nick $1- }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
