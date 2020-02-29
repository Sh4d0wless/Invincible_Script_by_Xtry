;___________________________________________
; Invincible by Xtry
; Proxy Scanner
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:load: { 
  /write utilities/found.txt 
}
on *:join:#:{
  if ($nick == $me) { return }
  set %ip.toscan $gettok($address($nick,2),2,64)
  if (%irc.proxy == ON) && (~ isin $address) { .sockopen ircproxy $+ $r(1,9999) %ip.toscan 1080 | .sockopen ircproxy $+ $r(1,9999) %ip.toscan 3128 | .sockopen ircproxy $+ $r(1,9999) %ip.toscan 8080 | .sockopen ircproxy $+ $r(1,9999) %ip.toscan 81 | .sockopen ircproxy $+ $r(1,9999) %ip.toscan 8000 | .sockopen ircproxy $+ $r(1,9999) %ip.toscan 54 }
}
on *:sockopen:ircproxy*:{
  if ($sockerr > 0) { return }
  unset %repeat.ip
  set %repeat.ip $read -w* $+ $sock($sockname).ip $+ * utilities/found.txt 
  if (%repeat.ip == $null) { write utilities/found.txt $sock($sockname).ip $sock($sockname).port | echo -s $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Proxy found in $+ $cxs(1) $sock($sockname).ip $sock($sockname).port  }
  .sockclose $sockname
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
