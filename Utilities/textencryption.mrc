;___________________________________________
; Invincible by Xtry
; Text Encryption
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯


#encryption on
on *:text:*:#:if (!ecrypt == $1) echo $colour(info) -i2 # $decrypt($2-)
on *:text:*:?:if (!ecrypt == $1) echo $colour(info) -i2 $nick $decrypt($2-)
#encryption end
alias encrypt {
  var %i = 1,%tmp = $replace($1-,$chr(32),$chr(160)),%asc,%asc.crypt,%crypt
  while ($mid(%tmp,%i,1)) {
    %asc = $asc($mid(%tmp,%i,1))
    %asc.crypt = $calc(%asc + 69) 
    %crypt = %crypt $+ $chr(%asc.crypt)
    inc %i 
  }
  return !ecrypt %crypt 
}
alias crypt $iif($1-,say $encrypt($1-),echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Syntax Error, pls use $+ $cxs(1) /crypt <message>)
alias decrypt {
  var %i = 1,%tmp = $replace($1-,$chr(32),$chr(160)),%asc,%asc.decrypt,%decrypt
  while ($mid(%tmp,%i,1)) {
    %asc = $asc($mid(%tmp,%i,1))
    %asc.decrypt = $calc(%asc - 69)
    %decrypt = %decrypt $+ $chr(%asc.decrypt)
    inc %i
  }
  return Decrypted Message: $replace(%decrypt,$chr(160),$chr(32))
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
