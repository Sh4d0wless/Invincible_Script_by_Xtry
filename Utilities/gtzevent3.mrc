;___________________________________________
; Invincible by Xtry
; Events
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on 1:quit: {
  if ($2 != $null) && ($3 == $null) {
    if (. isin $1) && (. isin $2) {
      if ($1 == %split.1) && ($2  == %split.2) goto next
      set %split.1 $1
      set %split.2 $2
      timer 1 15 unset %split.*
      if (%splitsound = on) { .splay %netsplitx }
      if (%echox.spl = on) { echo -a  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Netsplit between $+ $cxs(1) $1  $+ $cxs(2) $+ and $+ $cxs(1) $2 }
      if (%nsalert = on) { _amsg.c (Netsplit Detector) Netsplit between $1 and $2 - %name }
      :next
    }
  }
}

CTCP ^*!:*:?:{
  if ($1 = ping) {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) PING from $nick ( $+ $address $+ )
    }
    else {
      set %ctcping.rep 0
      %ctcping.rep = $ctime - $2
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) PING from $nick ( $+ $address $+ ) ( $+ %ctcping.rep $+ )
    }
  }
  if ($1 = chat) {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) CHAT from $nick ( $+ $address $+ )
    }
    else {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) CHAT from $nick ( $+ $address $+ ) ( $+ $2- $+ )
    }
  }
  if ($1 = page) {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) PAGE from $nick ( $+ $address $+ )
    }
    else {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) PAGE from $nick ( $+ $address $+ ) ( $+ $2- $+ )
    }
  }
  if ($1 = time) {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) TIME from $nick ( $+ $address $+ )
    }
    else {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) TIME from $nick ( $+ $address $+ ) ( $+ $2- $+ )
    }
  }
  if ($1 = version) {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) VERSION from $nick ( $+ $address $+ )
    }
    else {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) VERSION from $nick ( $+ $address $+ ) ( $+ $2- $+ )
    }
  }
  if ($1 = userinfo) {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) USERINFO from $nick ( $+ $address $+ )
    }
    else {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) USERINFO from $nick ( $+ $address $+ ) ( $+ $2- $+ )
    }
  }
  if ($1 = clientinfo) {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) CLIENTINFO from $nick ( $+ $address $+ )
    }
    else {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) CLIENTINFO from $nick ( $+ $address $+ ) ( $+ $2- $+ )
    }
  }
  if ($1 = finger) {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) FINGER from $nick ( $+ $address $+ )
    }
    else {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) FINGER from $nick ( $+ $address $+ ) ( $+ $2- $+ )
    }
  }
  if ($1 = dcc) {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) DCC from $nick ( $+ $address $+ )
    }
    else {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) DCC from $nick ( $+ $address $+ ) ( $+ $2- $+ )
    }
  }
  else {
    if ($2- = $null) {
      echo -at  $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) $1 from $nick ( $+ $address $+ )
    }
    else {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ ] $+ $color(ctcp) $1 from $nick ( $+ $address $+ ) ( $+ $2- $+ )
    }
  }
}

CTCP ^*!:*:#:{
  if ($1 = ping) {
    if ($2- = $null) {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) PING from $nick ( $+ $address $+ )
      haltdef
    }
    else {
      set %ctcping.rec 0
      %ctcping.rec = $ctime - $2
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) PING from $nick ( $+ $address $+ ) ( $+ %ctcping.rec $+ )
      haltdef
    }
  }
  if ($1 = version) {
    if ($2- = $null) {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) VERSION from $nick ( $+ $address $+ )
      haltdef
    }
    else {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) VERSION from $nick ( $+ $address $+ ) ( $+ $2- $+ )
      haltdef
    }
  }
  if ($1 = finger) {
    if ($2- = $null) {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) FINGER from $nick ( $+ $address $+ )
      haltdef
    }
    else {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) FINGER from $nick ( $+ $address $+ ) ( $+ $2- $+ )
      haltdef
    }
  }
  if ($1 = time) {
    if ($2- = $null) {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) TIME from $nick ( $+ $address $+ )
      haltdef
    }
    else {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) TIME from $nick ( $+ $address $+ ) ( $+ $2- $+ )
      haltdef
    }
  }
  if ($1 = userinfo) {
    if ($2- = $null) {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) USERINFO from $nick ( $+ $address $+ )
      haltdef
    }
    else {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) USERINFO from $nick ( $+ $address $+ ) ( $+ $2- $+ )
      haltdef
    }
  }
  if ($1 = clientinfo) {
    if ($2- = $null) {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) CLIENTINFO from $nick ( $+ $address $+ )
      haltdef
    }
    else {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) CLIENTINFO from $nick ( $+ $address $+ ) ( $+ $2- $+ )
      haltdef
    }
  }
  else {
    if ($2- = $null) {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) $1 from $nick ( $+ $address $+ )
      haltdef
    }
    else {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Receive $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(ctcp) $1 from $nick ( $+ $address $+ ) ( $+ $2- $+ )
      haltdef
    }
  }
  haltdef
}

on *:ctcpreply:*:{
  if ($upper($1) = ping) {
    set %ctcping.r 0
    %ctcping.r = $ctime - $2
    echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Reply $+ $cxs(3) $+ ] $+ $color(ctcp) $upper($1) reply from $nick ( $+ $address $+ ) : $duration(%ctcping.r)
    haltdef
  }
  else {
    echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ CTCP $+ $cxs(3) $+ - $+ $cxs(1) $+ Reply $+ $cxs(3) $+ ] $+ $color(ctcp) $upper($1) reply from $nick ( $+ $address $+ ) : $2-
    haltdef
  }
}

on ^*:KICK:#:{
  if ($knick = $me) {
    echo -st $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were kicked from $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(2) $+ ( $+ $1- $+ )
    if ($active = $chan) {
      echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Kick $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(kick) You were kicked by $nick ( $+ $1- $+ )
    }
    else { echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You were kicked from $+ $cxs(1) $chan  $+ $cxs(2) $+ by $+ $cxs(1) $nick  $+ $cxs(2) $+ ( $+ $1- $+ ) }
  }
  else { echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Kick $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(kick) $knick was kicked by $nick ( $+ $1- $+ ) }
  haltdef
}

on ^*:usermode:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Set $+ $cxs(1) $1-  $+ $cxs(2) $+ to user mode, and your user mode now is $+ $cxs(1) $usermode
  haltdef
}

on @:DEOP:#:{
  .ial on
  if (%dothx = on) && ($opnick = $me) && ($nick != $me) && ($nick != ChanServ) {
    if (@nick isin %dothxr) { _xmsg.c2 $replace(%dothxr,@nick,$nick) }
    else { _msgx.c2 %dothxr }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
