;___________________________________________
; Invincible by Xtry
; Events
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on 1:Op:#:{
  if (%echox.op = on) && ($opnick == $me) && ($nick != $me) && ($active != $chan) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were $+ $cxs(1) +o $+ $cxs(2) in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick }
}

on 1:Deop:#:{
  if (%echox.deop = on) && ($opnick == $me) && ($nick != $me) && ($active != $chan) && ($nick != Chanserv) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were $+ $cxs(1) -o $+ $cxs(2) in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick }
}

on 1:Kick:#:{
  if (%echox.k = on) && ($knick == $me) && ($nick != $me) && ($active != $chan) && ($nick != Chanserv) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were kicked from $+ $cxs(1) $chan  $+ $cxs(2) by $+ $cxs(1) $nick }
}

on 1:Voice:#:{
  if (%echox.v = on) && ($vnick == $me) && ($nick != $me) && ($active != $chan) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were $+ $cxs(1) +v $+ $cxs(2) in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick }
}

on 1:Devoice:#:{
  if (%dvthx = on) && ($vnick = $me) && ($nick != $me) && ($nick != ChanServ) {
    if (@nick isin %dvthxr) { _xmsg.c2 $replace(%dvthxr,@nick,$nick) }
    else { _msgx.c2 %dvthxr }
  }
  if (%echox.dv = on) && ($vnick == $me) && ($nick != $me) && ($active != $chan) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were $+ $cxs(1) -v $+ $cxs(2) in $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick }
}

on *:OPEN:?: {
  dll dll/mircustom.dll SetIcon -w $window($nick).hwnd 4 graph/pv.ico
  if (%echox.im = on) {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Incoming private message from $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+  $+ $cxs(3) $+ )
  }
}
on ^*:NOTIFY:{
  if ($notify($nick).note = $null) {
    echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $nick $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) is Online
    halt
  } 
  else {
    echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $nick $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) is Online $cxs(3) $+ ( $+ $cxs(1) $+ $notify($nick).note $+  $+ $cxs(3) $+ )
    halt
  }
}
on ^*:UNOTIFY:{
  if ($notify($nick).note = $null) {
    echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $nick $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) is Offline
    halt
  } 
  else {
    echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $nick $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) is Offline $cxs(3) $+ ( $+ $cxs(1) $+ $notify($nick).note $+  $+ $cxs(3) $+ )
    halt
  }
}
on ^*:join:*: {
  dll dll/mircustom.dll SetIcon -w $window($chan).hwnd 3 graph/chan.ico
  if ($nick == $me) && (%joinsoundx = on) {
    .splay %mejoin
  }
}
on *:part:#:{
  if ($nick == $me) { 
    if (%partsoundx = on) { .splay %mepart }
    inc %st.partx 1
  }
}
on *:TEXT:*:#:{
  if ($me isin $1-) && (# != $active) && (%echox.hl = on) {
    if ($nick isop $chan) && ($nick !isvo $chan) && ($nick !isreg $chan) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Highlight channel message from $+ $cxs(1) $nick $cxs(3) $+ @ $+ $cxs(1) $chan  $+ $cxs(3) $+ : $timestamp  $+ $_nc.rini(nc,o-) $+ @ $+ $nick :  $+ $color(highlight) $+ $1- }
    if ($nick !isop $chan) && ($nick isvo $chan) && ($nick !isreg $chan) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Highlight channel message from $+ $cxs(1) $nick $cxs(3) $+ @ $+ $cxs(1) $chan  $+ $cxs(3) $+ : $timestamp  $+ $_nc.rini(nc,v-) $+ + $+ $nick :  $+ $color(highlight) $+ $1- }
    if ($nick !isop $chan) && ($nick !isvo $chan) && ($nick isreg $chan) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Highlight channel message from $+ $cxs(1) $nick $cxs(3) $+ @ $+ $cxs(1) $chan  $+ $cxs(3) $+ : $timestamp  $+ $_nc.rini(nc,r-) $+ $nick :  $+ $color(highlight) $+ $1- }
  }
}
on *:TEXT:*:?:{
  if ($me isin $1-) && ($active != $query($nick)) && (%echox.hl = on) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Highlight query message from $+ $cxs(1) $nick  $+ $cxs(3) $+ : $timestamp  $+ $color(highlight) $+ $nick : $1- }
}
on *:ACTION:*:?:{
  if ($me isin $1-) && ($active != $query($nick)) && (%echox.hl = on) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Highlight query action from $+ $cxs(1) $nick  $+ $cxs(3) $+ : $timestamp  $+ $color(action) $+ $nick $1- }
}

on ^*:NOTICE:*:?:{
  if ($nick = chanserv) || ($nick = nickserv) || ($nick = memoserv) || ($nick = statserv) || ($nick = operserv) || ($nick = helpserv) || ($nick = $server) {
    echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+  $+ $nick $+  $+ $cxs(3) $+ ] $+ $color(notice) $1-
    halt
  }
  else {
    echo -st $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ Notice $+ $cxs(3) $+ - $+ $cxs(1) $+ Private $+ $cxs(3) $+ ] $+ $color(notice) $nick ( $+ $address $+ ) : $1-
    set %pv.not1 $comchan($nick,0)
    set %pv.not2 1
    :nkloop
    if ( %pv.not2 > %pv.not1) { halt }
    echo -t $comchan($nick,%pv.not2) $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ Notice $+ $cxs(3) $+ - $+ $cxs(1) $+ Private $+ $cxs(3) $+ ] $+ $color(notice) $nick ( $+ $address $+ ) : $1-
    inc %pv.not2
    goto nkloop
  }
}


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
