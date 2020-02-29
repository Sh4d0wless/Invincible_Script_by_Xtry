;___________________________________________
; Invincible by Xtry
; Events
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:join:#: {
  if (%onjocl = on) {
    if ($nick == $me) { return }
    var %c3 = 1
    var %c4 = $ialchan($address($nick,2),$chan,%c3).nick
    if (%c4 != $nick) {
      echo $chan $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Clones detected on $+ $cxs(1) $chan  $+ $cxs(3) $+ : $+ $cxs(1) $nick  $+ $cxs(2) $+ & $+ $cxs(1) %c4  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address($nick,2) $+  $+ $cxs(3) $+ ) 
      inc %c3 
      var %c4 = $ialchan($address($nick,2),$chan,%c3).nick
      if (%clonesound = on) { .splay %clones }
    }
  }
  else return
}

on ^*:mode:#:{
  if ($me ison $chan) {
    echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(mode) $nick $1-
    haltdef
  }
}

on ^*:part:*: {
  if ($nick = $me) { halt }
  if ($me ison $chan) {
    if ($1 != $null) var %cabud = ( $+ $1- $+  $+ $color(part) $+ )
    echo $color(part) -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Part $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(part) $nick ( $+ $address $+ ) %cabud
    haltdef
  }
}

on ^*:topic:#:{ echo -t # $_form.topic($nick,$chan,$1-) | halt }

on 1:Kick:#:{
  if ($nick = chanserv) { halt }
  if ($nick = $me) && ($knick != $me) && (%kocgtzs = on) { .splay %mekoc }
}

on ^*:QUIT:{
  if ($nick == $me) { halt }
  set %chans $comchan( $nick , 0 )
  set %channum 1
  :loop
  if ( %channum > %chans) {
    halt
  }
  else {
    echo -t $comchan( $nick , %channum ) $chan $cxs(3) $+ [ $+ $cxs(1) $+ Quit $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $comchan($nick ,%channum) $+  $+ $cxs(3) $+ ] $+ $color(quit) $nick ( $+ $address $+ ) ( $+ $1- $+ )
    inc %channum
    goto loop
  }
}

on ^*:NOTICE:*:#:{
  if ($nick = chanserv) || ($nick = nickserv) || ($nick = memoserv) || ($nick = statserv) || ($nick = operserv) || ($nick = helpserv) || ($nick = $server) {
    echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+  $+ Notice $+  $+ $cxs(3) $+ - $+ $cxs(1) $+  $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(notice) $nick : $1-
    if ($active != $chan) {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+  $+ Notice $+  $+ $cxs(3) $+ - $+ $cxs(1) $+  $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(notice) $nick : $1-
      halt
    }
    halt
  }
  else {
    echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+  $+ Notice $+  $+ $cxs(3) $+ - $+ $cxs(1) $+  $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(notice) $nick ( $+ $address $+ ) : $1-
    if ($active != $chan) {
      echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+  $+ Notice $+  $+ $cxs(3) $+ - $+ $cxs(1) $+  $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(notice) $nick ( $+ $address $+ ) : $1-
      halt
    }
    halt
  }
}

on 1:INPUT:#: {
  if ($1- = .o) {
    if ($me !isop $chan) && ($network = dalnet) && (dal isin $server) { chanserv op $chan $me }
  }
  if ($1- = .do) {
    if ($me isop $chan) && ($network = dalnet) && (dal isin $server) { mode $chan -o $me }
  }
  if ($1- = .v) {
    if ($me isop $chan) && ($network = dalnet) && (dal isin $server) { mode $chan +v $me }
  }
  if ($1- = .dov) {
    if ($me isop $chan) && ($network = dalnet) && (dal isin $server) { mode $chan +v-o $me $me }
  }
  if ($1- = .dodv) {
    if ($me isop $chan) && ($network = dalnet) && (dal isin $server) { mode $chan -ov $me }
  }
}

on *:connect:{
  if (%auname != Xtry) { .set %auname Xtry }
  if (%name != Invincible) { .set %name Invincible }
  if (%name2 != Invincible) { .set %name2 Invincible }
}


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
