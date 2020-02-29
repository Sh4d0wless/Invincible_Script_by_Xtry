;___________________________________________
; Invincible by Xtry
; Channel Statistics
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias statz {
  window @stats
  aline @stats $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Statistics for $+ $cxs(1) #
  aline @stats $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Total users $cxs(3) $+ : $+ $cxs(1) $nick(#,0)
  aline @stats $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Regular users $cxs(3) $+ : $+ $cxs(1) $nick(#,0,r)  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $round($calc($nick(#,0,r) / $nick(#,0) * 100),0) $+ % $+  $+ $cxs(3) $+ )
  aline @stats $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Opped $cxs(3) $+ : $+ $cxs(1) $opnick(#,0)  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $round($calc($nick(#,0,o) / $nick(#,0) * 100),0) $+  % $+  $+ $cxs(3) $+ )
  aline @stats $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Voiced $cxs(3) $+ : $+ $cxs(1) $vnick(#,0)  $+ $cxs(3) $+ ( $+  $+ $cxs(1) $+ $round($calc($nick(#,0,v) / $nick(#,0) * 100),0) $+ % $+  $+ $cxs(3) $+ )
  aline @stats $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Current modes $cxs(3) $+ : $+ $cxs(1) $chan($chan).mode
  aline @stats $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Current topic $cxs(3) $+ : $chan($chan).topic
  aline @stats $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) End of $+ $cxs(1) #  $+ $cxs(2) $+ statistics
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
