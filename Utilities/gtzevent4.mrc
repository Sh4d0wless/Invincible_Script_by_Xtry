;___________________________________________
; Invincible by Xtry
; Events
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:WALLOPS:*:{
  echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(3) [ $+ $cxs(1) $+ Wallops $+ $cxs(3) $+ - $+ $cxs(1) $+ $network $+  $+ $cxs(3) $+ ] $+ $color(wallops) $nick ($address) : $1-
  halt
}
on 1:START: { gstart }
on 1:CONNECT: { gconnect }
on 1:DISCONNECT: { gdisconnect }


on 1:KICK:*: {
  if ( $nick == $me ) { set %st.ikick $calc(%st.ikick +1 ) }
  if ( $knick == $me ) { set %st.kicki $calc(%st.kicki +1 ) }
}
on 1:BAN:*: {
  if ( $nick == $me ) { set %st.iban $calc(%st.iban +1 ) }
  if ( $bnick == $me ) { set %st.bani $calc(%st.bani +1 ) }
}
on 1:VOICE:*: {
  if ( $vnick == $me ) { set %st.ivo $calc(%st.ivo +1 ) }
}
on 1:DEVOICE:*: {
  if ( $vnick == $me ) { set %st.voi $calc(%st.voi +1 ) }
}
on 1:OP:*: {
  if ( $opnick == $me ) { set %st.iop $calc(%st.iop +1 ) }
}
on 1:DEOP:*: {
  if ( $opnick == $me ) { set %st.opi $calc(%st.opi +1 ) }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
