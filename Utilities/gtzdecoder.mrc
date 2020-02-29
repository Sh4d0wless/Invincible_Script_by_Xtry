;___________________________________________
; Invincible by Xtry
; Safe Decode
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

#decoder on 
on *:text:*//$decode(*,m)*:*: { 
  set %decode_end , $+ m $+ ) 
  set %decode_begin //$decode $+ (
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Safe Decode will now detect " $+ //$decode $+ " function contents from  $+ $cxs(1) $+ $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+  $+ $cxs(3) $+ ) )
  set %decodestring $mid($1-, $calc($pos($1-, %decode_begin, 1) + $len(%decode_begin)), $calc($pos($1-, %decode_end, 1) - 1 - $calc($pos($mid($1-, $calc($pos($1-, %decode_begin, 1) + $len(%decode_begin)), $mid($1-, $calc($pos($1-, %decode_begin, 1) + $len(%decode_begin)), 0)), %decode_begin, 1) + $len(%decode_begin)))) 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Decode Source $cxs(3) $+ :  $+ $cxs(1) $+ %decodestring 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Decode Output $cxs(3) $+ :  $+ $cxs(1) $+ $decode(%decodestring, $ $+ m)
} 

on !*:notice:*//$decode(*,m)*:*: { 
  set %decode_end , $+ m $+ ) 
  set %decode_begin //$decode $+ ( 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Safe Decode will now detect " $+ //$decode $+ " function contents from  $+ $cxs(1) $+ $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+  $+ $cxs(3) $+ ) )
  set %decodestring $mid($1-, $calc($pos($1-, %decode_begin, 1) + $len(%decode_begin)), $calc($pos($1-, %decode_end, 1) - 1 - $calc($pos($mid($1-, $calc($pos($1-, %decode_begin, 1) + $len(%decode_begin)), $mid($1-, $calc($pos($1-, %decode_begin, 1) + $len(%decode_begin)), 0)), %decode_begin, 1) + $len(%decode_begin)))) 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Decode Source $cxs(3) $+ :  $+ $cxs(1) $+ %decodestring 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Decode Output $cxs(3) $+ :  $+ $cxs(1) $+ $decode(%decodestring, $ $+ m)
} 

on !*:action:*//$decode(*,m)*:*: { 
  set %decode_end , $+ m $+ ) 
  set %decode_begin //$decode $+ ( 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Safe Decode will now detect " $+ //$decode $+ " function contents from  $+ $cxs(1) $+ $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+  $+ $cxs(3) $+ ) )
  set %decodestring $mid($1-, $calc($pos($1-, %decode_begin, 1) + $len(%decode_begin)), $calc($pos($1-, %decode_end, 1) - 1 - $calc($pos($mid($1-, $calc($pos($1-, %decode_begin, 1) + $len(%decode_begin)), $mid($1-, $calc($pos($1-, %decode_begin, 1) + $len(%decode_begin)), 0)), %decode_begin, 1) + $len(%decode_begin)))) 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Decode Source $cxs(3) $+ :  $+ $cxs(1) $+ %decodestring 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Decode Output $cxs(3) $+ :  $+ $cxs(1) $+ $decode(%decodestring, $ $+ m)
} 

on *:input:*: { 
  if (//$decode* iswm $1-) { 
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Safe Decode doesn't allow you to type this, it's dangerous 
    halt 
  } 
} 
#decoder end 

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
