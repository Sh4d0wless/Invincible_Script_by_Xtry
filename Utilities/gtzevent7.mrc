;___________________________________________
; Invincible by Xtry
; Events
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on 1:INVITE:*:{
  haltdef
  echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) invites you to join $+ $cxs(1) $chan 
  if (%invitasound = on) {
    .splay %inviter
  }
}

ON ^*:SERVEROP:#: { haltdef | echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(mode) $nick +o $opnick }
ON ^*:SERVERDEOP:#: { haltdef | echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(mode) $nick -o $opnick }
ON ^*:OP:#: { haltdef | echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(mode) $nick +o $opnick }
ON ^*:DEOP:#: { haltdef | echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(mode) $nick -o $opnick }
ON ^*:VOICE:#: { haltdef | echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(mode) $nick +v $vnick }
ON ^*:DEVOICE:#: { haltdef | echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(mode) $nick -v $vnick }
ON ^*:BAN:#: { haltdef | echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(mode) $nick $1- }
ON ^*:UNBAN:#: { haltdef | echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(mode) $nick $1- }

on ^*:TEXT:*:#: {
  if ($nick isop $chan) && ($nick != $me) echo -t $chan  $+ $_nc.rini(nc,o-) $+ @ $+ $nick $+  : $1- | haltdef
  if ($nick !isop $chan) && ($nick isvo $chan) && ($nick != $me) echo -t $chan  $+ $_nc.rini(nc,v-) $+ $chr(43) $+ $nick $+  : $1- | haltdef 
  if ($nick !isop $chan) && ($nick !isvo $chan) && ($nick != $me) echo -t $chan  $+ $_nc.rini(nc,r-) $+ $nick $+  : $1- | haltdef
}

on ^*:TEXT:*:?: {
  echo -t $query($nick) $nick : $1-
  haltdef
}

on ^*:ACTION:*:#: {
  if ($nick isop $chan) && ($nick != $me) echo -t $chan  $+ $color(action) $+ @ $+ $nick $1- | haltdef
  if ($nick !isop $chan) && ($nick isvo $chan) && ($nick != $me) echo -t $chan  $+ $color(action) $+ + $+ $nick $1- | haltdef
  if ($nick !isop $chan) && ($nick !isvo $chan) && ($nick !isreg $chan) && ($nick != $me) echo -t $chan  $+ $color(action) $+ $nick $1- | haltdef
}

on ^*:ACTION:*:?: {
  echo -t $query($nick)  $+ $color(action) $+ $nick $1- | haltdef
}

on ^*:NICK:{
  if ($nick == $me) {
    set %recnick3 %recnick2 
    set %recnick2 %recnick1 
    set %recnick1 $me 
    echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Your nickname now is  $+ $cxs(1) $+ $newnick
    var %atb.k = 0
    var %atb.channs = $chan(0)
    while (%atb.k <= %atb.channs) {
      inc %atb.k
      echo -t $chan(%atb.k) $cxs(3) $+ [ $+ $cxs(1) $+ Nick $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan(%atb.k) $+  $+ $cxs(3) $+ ] $+ $color(nick) $nick changed to $newnick
    }
    haltdef | goto end
  }
  set %atb.nchans $comchan( $newnick , 0 )
  set %atb.nchannum 1
  :nkloop 
  if ( %atb.nchannum > %atb.nchans) {
    halt
  }
  else {
    echo -t $comchan( $newnick , %atb.nchannum ) $cxs(3) $+ [ $+ $cxs(1) $+ Nick $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $comchan($newnick ,%atb.nchannum) $+  $+ $cxs(3) $+ ] $+ $color(nick) $nick changed to $newnick
    inc %atb.nchannum
    goto nkloop
  }
  :end
}

on 1:INPUT:*: {
  if ($1 = lol) && (%lolsoundx = on) {
    .splay $findfile(sounds\lolz,*.wav,$rand(1,$findfile(sounds\lolz,*.wav,0)))
  }
}

on ^*:join:*: {
  haltdef
  if ($nick = $me) {
    echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Joined $+  $+ $cxs(3) $+ ] $cxs(2) $+ $chan $time(HH:nn:ss) $time(dddd dd mmmm yyyy)
    dll dll/mircustom.dll SetIcon -w $window($chan).hwnd 3 graph/ch.ico
    set %recentch3 %recentch2
    set %recentch2 %recentch1
    set %recentch1 $chan
    inc %st.joinx 1
  }
  else {
    if ($nick != $me) && ($me ison $chan) {
      var %clo3 = 1
      var %clo4 = $ialchan($address($nick,2),$chan,%clo3).nick
      if (%clo4 != $nick) {
        echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Join $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(join) $nick ( $+ $address $+ ) ( $+ %clo4 $+ / $+ $whois.country($address) $+ / $+ $ujoinlevel $+ )
        haltdef 
      }
      else {
        echo -t $chan $cxs(3) $+ [ $+ $cxs(1) $+ Join $+  $+ $cxs(3) $+ - $+ $cxs(1) $+ $chan $+  $+ $cxs(3) $+ ] $+ $color(join) $nick ( $+ $address $+ ) ( $+ $whois.country($address) $+ / $+ $ujoinlevel $+ )
        haltdef
      }
    }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
