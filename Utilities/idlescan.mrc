;___________________________________________
; Invincible by Xtry
; Idle Scanner
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias idlescan {
  if ( $prop == $null ) {
    /return E_No_Property
  }
  if ($1 == $null) || ($1 !isnum $1) {
    /return E_No_IdleTime
  }
  if ( $prop == kick ) {
    /set %idle.i 1
    :nextkick
    if ( $nick($active,%idle.i) == $null ) {
      /goto donekick
    }
    if ( $nick($active,%idle.i) != $null ) {
      if ( $nick($active,%idle.i).idle > $1 ) {
        /kick $nick($active,%idle.i) Idle Detected ( $+ $duration($nick($active,%idle.i).idle) $+ ) - %name
        /inc %idle.i 1
        /goto nextkick
      }
      if ( $nick($active,%idle.i).idle < $1 ) {
        /inc %idle.i 1
        /goto nextkick
      }
    }
    :donekick
    /return S_IdleScan_Complete
  }
  if ( $prop == notice ) {
    /set %idle.i 1
    :nextnotice
    if ( $nick($active,%idle.i) == $null ) {
      /goto donenotice
    }
    if ( $nick($active,%idle.i) != $null ) {
      if ( $nick($active,%idle.i).idle > $1 ) {
        /notice.p $nick($active,%idle.i) (Idle Scanner) You've been idling for $duration($nick($active,%idle.i).idle) $+ . Please part from the channel
        /inc %idle.i 1
        /goto nextnotice
      }
      if ( $nick($active,%idle.i).idle < $1 ) {
        /inc %idle.i 1
        /goto nextnotice
      }
    }
    :donenotice
    /return S_IdleScan_Complete
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
