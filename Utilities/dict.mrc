;___________________________________________
; Invincible by Xtry
; Dictionary
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias dict { if ($dialog(dict+)) { dialog -v dict+ dict+ } | else { dialog -m dict+ dict+ } }
dialog dict+ {
  title "Dictionary"
  icon graph/dict.ico
  size -1 -1 400 300
  text "Look Up:",1, 1 10 96 16, right
  edit "",2, 100 5 200 23, autohs
  text "Search Type:",3,1 34 96 16, right
  combo 4,101 29 250 100, drop 
  text "Database:",5,1 58 96 16, right
  combo 6,101 53 250 100, drop 
  button "Define",7, 119 80 80 20, default
  button "Reset",8,201 80 80 20
  edit "",10, 12 102 376 150, read multi vsbar
  button "Clear",11, 162 254 75 18
  box "",12, -3 268 420 100
  button "Exit",90,328 279 60 20, cancel
}
on *:dialog:dict+:init:0: {
  did -ac dict+ 4 Return Definations | did -a dict+ 4 Match words exactly | did -a dict+ 4 Match prefixes 
  did -a dict+ 4 Match substring occurring anywhere in word | did -a dict+ 4 Match suffixes | did -a dict+ 4 POSIX- regular expressions 
  did -a dict+ 4 Old (basic) regular expressions |  did -a dict+ 4 Match using SOUNDEX algorithm  | did -a dict+ 4 Match words within Levenshtein distance one 
  did -ac dict+ 6 First match | did -a dict+ 6 All | did -a dict+ 6 Webster's Dictionary(1913) 
  did -a dict+ 6 WordNet (r) 1.6  | did -a dict+ 6 U.S. Gazetteer  | did -a dict+ 6 Jargon File
  did -a dict+ 6 The Free On-line Dictionary of Computing  | did -a dict+ 6 The Elements 
  did -a dict+ 6 Easton's 1897 Bible Dictionary  | did -a dict+ 6 Hitchcock's Bible Names Dictionary (late 1800's)
}
on *:dialog:dict+:sclick:7: {
  if ($did($did) == Stop) { if ($did(10,2) == $null) { did -r dict+ 10 } | closedict+ | return }
  if (($did(2)) && ($did(4)) && ($did(6))) {
    did -ra dict+ 10 ** Connecting... | dict+busy -b 
    unset %def.strategy %def.database
    set %def.strategy $replace($did(4).sel,2,exact,3,prefix,4,substring,5,suffix,6,re,7,regexp,8,soundex,9,lev)
    set %def.database $replace($did(6).sel,10,hitchcock,9,easton,1,*,2,*,3,web1913,4,wn,5,gazetteer,6,jargon,7,foldoc,8,elements)
    if ($gettok($did(2),2,32)) %def.word = " $+ $did(2) $+ "
    else %def.word = $did(2)
    if ($did(6).sel == 2) %def.alldb = $true
    else unset %def.alldb
    %def.erase = $true
    sockclose dict+ | sockopen dict+ dict.org 2628
  }
  else did -ar dict+ 10 *** Invalid parameters 
}
on *:dialog:dict+:sclick:8: did -c dict+ 6 3 | did -c dict+ 4 1 | did -rf dict+ 2 
on *:dialog:dict+:sclick:11: did -r dict+ 10 | did -f dict+ 2
;on *:dialog:dict+:sclick:90: set %dict+pos $dialog(dict+).x $dialog(dict+).y 400 300
on *:sockopen:dict+: if ($socker) { did -a dict+ 10 ** Socket Error: $sockerr | return } | else did -ra dict+ 10 ** Connection established, looking up $did(dict+,2)
on *:sockread:dict+: {
  if ($socker) { did -a dict+ 10 ** Socket Error: $sockerr | return } 
  :read
  sockread %def.dict+
  if (%def.dict+ == $null) %def.dict+ = $chr(160)
  mandefine [ %def.dict+ $crlf ]
  if ($sockbr)  goto read 
}
alias mandefine {
  tokenize 32 $1- | if ($1 == 250) closedict+
  if ($1 == 552) { did -ar dict+ 10 ** No Match for %def.word | putdict+ quit | return } 
  if (%def.read) { 
    if (($1 == .) && (%def.alldb == $null)) closedict+  
    elseif (($1 == %def.database) && ("* iswm $2)) did -a dict+ 10 $gettok($1-,2,34) [ $crlf ]
    elseif ($1 == 151) {
      if ($did(dict+,6).sel < 3)  did -a dict+ 10 $str($chr(160),10) *** $gettok($1-,4,34) *** [ $crlf ]
    }
    else did -a dict+ 10 $1-
  }
  if ($1 == 220) {
    if (%def.strategy == 1) { 
      putdict+ DEFINE %def.database %def.word 
      if (%def.database == *) %def.firstmatch = $true
    }
    else putdict+ MATCH %def.database %def.strategy %def.word 
  }
  if (($1 isnum 151-152) && (%def.read == $null)) { 
    %def.read = $true
    if (%def.erase) { did -r dict+ 10 | unset %def.erase }
    if ($did(dict+,6).sel < 3) {
      if ($gettok($1-,4,34)) did -a dict+ 10 $str($chr(160),10) *** $gettok($1-,4,34) *** [ $crlf ]
      elseif (*matches?found* iswm $1-) did -a dict+ 10 $str($chr(160),10) *** $remove($2-,$crlf) *** [ $crlf ]
    }
  }
}
on *:sockclose:dict+:closedict+
alias -l putdict+ if ($sock(dict+)) sockwrite -n dict+ $1- 
alias -l closedict+ did -c dict+ 10 1 | dict+busy -e | unset %def.* | sockclose dict+ | return
alias -l dict+busy { 
  did -ra dict+ 7 $iif($1 == -b,Stop,Define)
  did $1 dict+ 8 | did $1 $+ f dict+ 2 | did $1 dict+ 4 | did $1 dict+ 6
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
