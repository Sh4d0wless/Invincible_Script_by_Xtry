;___________________________________________
; Invincible by Xtry
; Events
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:Op:#:{
  if ($nick = Chanserv) { halt }
  if ($opnick = $me) && ($nick != $me) && (%opgtzs = on) { .splay %meop }
  halt
}
on *:Deop:#:{
  if ($opnick = Chanserv) { halt }
  if ($opnick = $me) && ($nick != $me) && (%deopgtzs = on) { .splay %medeop }
  halt
}
on *:Kick:#:{
  if ($nick = Chanserv) { halt }
  if ($knick = $me) && ($nick != $me) && (%kicgtzs = on) { .splay %mekick }
  halt
}
on *:Voice:#:{
  if ($vnick = $me) && ($nick != $me) && (%voigtzs = on) { .splay %mevoice }
  halt
}
on *:Devoice:#:{
  if ($vnick = $me) && ($nick != $me) && (%devoigtzs = on) { .splay %medevoice }
  halt
}
on *:OPEN:?:*:{
  if (%msgsound = on) { .splay %pm }
}
on ^*:TEXT:*:#:{
  if ($me isin $1-) && (# != $active) && (%hailais = on) { .splay %hailai }
}
on ^*:ACTION:*:#:{
  if ($me isin $1-) && (# != $active) && (%hailais = on) { .splay %hailai }
}
on ^*:TEXT:*:?:{
  if ($me isin $1-) && ($query($nick) != $active) && (%hailais = on) { .splay %hailai }
}
on ^*:ACTION:*:?:{
  if ($me isin $1-) && ($query($nick) != $active) && (%hailais = on) { .splay %hailai }
}
on 1:NOTIFY: {
  if (%notisound = on) {
    .splay %online
  }
}
on ^*:UNOTIFY:{
  if (%unotisound = on) {
    .splay %offline
  }
}

on ^*:SNOTICE:*: {
  haltdef
  echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) $+ [ $+ $cxs(1) $+  $+ $nick $+  $+ $cxs(3) $+ ] $+ $color(notice) $1-
}

on *:disconnect:{
  if (%auname != Xtry) { .set %auname Xtry }
  if (%name != Invincible) { .set %name Invincible }
  if (%name2 != Invincible) { .set %name2 Invincible }
}

menu @splash {
  sclick:window -c @splash
  exit:window -c @splash
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
