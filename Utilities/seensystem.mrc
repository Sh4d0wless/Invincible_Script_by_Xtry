;___________________________________________
; Invincible by Xtry
; Seen System
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯


alias 'sw .writeini -n seen.ini $$1 $$2 $3-
alias ´sr return $readini seen.ini $$1 $$2
alias _chans return $´sr(seen,channels)
alias chans_ return $´sr(seen,ignore_chans)
alias seen.user {
  if ($1 != $null) {
    if ($1 ison $3) && ($1 != $me) { _xmsg.c (Seen System) $2 $+ , the user you looking for ( $+ $1 $+ ) is in $3 right now - %name | goto end }
    if ($me == $1) { _xmsg.c (Seen System) $2 $+ , i'm here.. what do you need? - %name | goto end }
    if ($´sr($1, [ part_ $+ [ $3 ] ] ) != $null) { var %part.time = $´sr($1, [ part_ $+ [ $3 ] ] ) }
    if ($´sr($1,quit_time) != $null) { var %quit.time = $´sr($1,quit_time) }
    if (%quit.time >= %part.time) && (%quit.time != $null) { var %seen.result = quitting at %quit.time from $gettok($´sr($1,quit),1,32) stating: $chr(34) $+ $gettok($´sr($1,quit),2-,32) $+ $chr(34) } 
    if (%quit.time < %part.time) && (%part.time != $null) { var %seen.result = parting from $3 at %part.time }
    if (%seen.result != $null) { _xmsg.c (Seen System) $2 $+ , $´sr($1,address) last seen was %seen.result - %name }
    if (%seen.result == $null) { _xmsg.c (Seen System) $2 $+ , sorry i can't remember seeing $1 - %name }
  }
  :end
}
#seen off
on ^1:JOIN:*:if ($chan isin $_chans) || ($_chans == $chr(42)) && ($nick != $me) && ($chan !isin $chans_) { 'sw $nick join_ $+ [ $chan ] $time(HH:nn:ss (dd/mm/yyyy)) | 'sw $nick address $gettok($address($nick,5),1,33) ( $+ $gettok($address($nick,5),2,33) $+ ) }
on ^1:PART:*:if ($chan isin $_chans) || ($_chans == $chr(42)) && ($nick != $me) && ($chan !isin $chans_) { 'sw $nick part_ $+ [ $chan ] $time(HH:nn:ss (dd/mm/yyyy)) | 'sw $nick address $gettok($address($nick,5),1,33) ( $+ $gettok($address($nick,5),2,33) $+ ) }
on ^1:TEXT:*:*:if ($1 != $null) && ($2 != $null) && ($1 == $´sr(seen,trigger)) { if ($chan !isin $chans_) && ($chan isin $_chans) || ($_chans == $chr(42)) { { seen.user $2 $nick $chan } } }
on ^1:QUIT:{
  var %temp.seen.comchans = $comchan($nick,0) 
  if (%temp.seen.comchans != $null) {
    var %seen.c 1
    while (%seen.c <= %temp.seen.comchans) {
      if ($comchan($nick,%seen.c) isin $_chans) || ($_chans == $chr(42)) { var %total.seen.comchans = %total.seen.comchans $+ $iif(%total.seen.comchans != $null, $+ $chr(44)) $+ $comchan($nick,%seen.c) }
      inc %seen.c
    }
  }
  'sw $nick quit %total.seen.comchans $1- | 'sw $nick quit_time $time(HH:nn:ss (dd/mm/yyyy))
}
#seen end
alias seen if ($dialog(seen)) dialog -v seen | else dialog -m seen seen
dialog seen {
  title "Seen System"
  icon graph/seen.ico
  size -1 -1 130 115
  option dbu
  box "Seen setup",1,5 2 120 109
  check "Enable",2,10 12 60 7
  check "On start clear seen list",3,10 22 70 7
  text "Use",4,10 37 10 7
  edit "",5,21 35 50 10,autohs
  text "as seen trigger",6,73 37 50 7
  check "Respond only in these channels:",7,10 52 90 7
  edit "",8,10 62 110 10, autohs
  check "Ignore all these channels:",9,10 75 90 7
  edit "",10,10 85 110 10, autohs
  button "Save", 11, 90 98 30 10, ok
  button "Help",12,60 98 30 10,disable 
  button "Open list",13,90 10 30 10
  button "Clear list",14,90 20 30 10
}
on *:dialog:seen:init:*: {
  ; yes... this is NOT a bug! ignored channels must be != $null otherwise.... you know...
  if ($´sr(seen,ignore_chans) == $null) { 'sw seen ignore 0 }
  ; end of statement! =)
  if ($´sr(seen,inuse) == 1) { did -c seen 2 | if ($group(#seen) == off) { .enable #seen } } | else { did -b seen 5,7,8,9,10 }
  if ($´sr(seen,startup) == 1) { did -c seen 3 }
  if ($´sr(seen,only) == 1) { did -c seen 7 | if ($´sr(seen,channels) != $null) { did -ra seen 8 $´sr(seen,channels) } } | else { did -b seen 8 | if ($´sr(seen,channels) != $null) && ($´sr(seen,channels) != $chr(42)) { did -ra seen 8 $´sr(seen,channels) } } 
  if ($´sr(seen,ignore) == 1) { did -c seen 9 | if ($´sr(seen,ignore_chans) != $null) { did -ra seen 10 $´sr(seen,ignore_chans) } } | else { did -b seen 10 | if ($´sr(seen,ignore_chans) != $null) { did -ra seen 10 $´sr(seen,ignore_chans) } } 
  if ($´sr(seen,trigger) == $null) { 'sw seen trigger !seen } | if ($´sr(seen,trigger) != $null) { did -ra seen 5 $´sr(seen,trigger) }
}
on *:dialog:seen:sclick:*: {
  if ($did == 2) { if ($´sr(seen,inuse) == 1) { .disable #seen | 'sw seen inuse 0 | did -b seen 5,7,8,9,10 } | else { .enable #seen | 'sw seen inuse 1 | did -e seen 5,7,9 | if ($´sr(seen,channels) != $null) && ($´sr(seen,channels) != $chr(42)) && ($´sr(seen,only) == 1) { did -e seen 8 } | if ($´sr(seen,ignore) == 1) && ($´sr(seen,ignore_chans) != $null) { did -e seen 10 } } }
  if ($did == 3) { if ($´sr(seen,startup) == 1) { 'sw seen startup 0 } | else { 'sw seen startup 1 } }
  if ($did == 7) { if ($´sr(seen,only) == 1) { 'sw seen only 0 | did -b seen 8 | 'sw seen channels * } | else { 'sw seen only 1 | did -e seen 8 | if ($did(8).text != $null) { 'sw seen channels $did(8).text } } }
  if ($did == 9) { if ($´sr(seen,ignore) == 1) { 'sw seen ignore 0 | .remini seen.ini seen ignore_chans | did -b seen 10 } | else { 'sw seen ignore 1 | did -e seen 10 | if ($did(10).text != $null) { 'sw seen ignore_chans $did(10).text } } }
  if ($did == 11) { if ($´sr(seen,trigger) == $null) { 'sw seen trigger !seen } }
  if ($did == 12) { run readme.txt }
  if ($did == 13) { run seen.ini }
  if ($did == 14) { clear.seen.list }
}
on *:dialog:seen:edit:*: {
  if ($did == 5) && ($did(5).text != $null) { 'sw seen trigger $did(5).text } | if ($did(5).text == $null) { .remini seen.ini seen trigger }
  if ($did == 8) && ($did(8).text != $null) { 'sw seen channels $did(8).text } | if ($did(8).text == $null) { .remini seen.ini seen channels }
  if ($did == 10) && ($did(10).text != $null) { 'sw seen ignore_chans $did(10).text } | if ($did(10).text == $null) { .remini seen.ini seen ignore_chans }
}
alias clear.seen.list {
  .write -c seen.ini
  if ($did(seen,2).state == 1) || (%inuse == 1) { 'sw seen inuse 1 | .enable seen } | else { 'sw seen inuse 0 | .disable seen }
  if ($did(seen,3).state == 1) || (%startup == 1) { 'sw seen startup 1 } | else { 'sw seen startup 0 }
  if ($did(seen,5).text != $null) || (%trigger == 1) { 'sw seen trigger $did(seen,5).text } | else { 'sw seen trigger !seen }
  if ($did(seen,7).state == 1) || (%only == 1) { 'sw seen only 1 } | else { 'sw seen only 0 }
  if ($did(seen,8).text != $null) && ($´sr(seen,only) == 1) { 'sw seen channels $did(seen,8).text } | else { 'sw seen channels * | 'sw seen only 0 | did -u seen 7 | did -b seen 8 }
  if ($did(seen,9).state == 1) || (%ignore == 1) { 'sw seen ignore 1 } | else { 'sw seen ignore 0 }
  if ($did(seen,10).text != $null) && ($´sr(seen,ignore) == 1) { 'sw seen ignore_chans $did(seen,10).text }
}
alias clear.seen.list_ {
  if ($´sr(seen,inuse) == 1) { var %inuse 1 }
  if ($´sr(seen,startup) == 1) { var %startup 1 }
  if ($´sr(seen,trigger) != $null) { var %trigger = $´sr(seen,trigger) }
  if ($´sr(seen,only) == 1) { var %only 1 }
  if ($´sr(seen,channels) != $null) { var %channels = $´sr(seen,channels) }
  if ($´sr(seen,ignore) == 1) { var %ignore 1 }
  if ($´sr(seen,ignore_chans) != $null) { var %ignore_chans = $´sr(seen,ignore_chans) }
  if (%inuse == 1) { 'sw seen inuse 1 | .enable seen } | else { 'sw seen inuse 0 | .disable seen }
  if (%startup == 1) { 'sw seen startup 1 } | else { 'sw seen startup 0 }
  if (%trigger == 1) { 'sw seen trigger $did(seen,5).text } | else { 'sw seen trigger !seen }
  if (%only == 1) { 'sw seen only 1 } | else { 'sw seen only 0 }
  if (%channels != $null) && ($´sr(seen,only) == 1) { 'sw seen channels %channels }
  if (%ignore == 1) { 'sw seen ignore 1 } | else { 'sw seen ignore 0 }
  if (%ignore_chans != $null) && ($´sr(seen,ignore) == 1) { 'sw seen ignore_chans %ignore_chans }
}
alias search if ($dialog(search)) dialog -v search | else dialog -m search search
dialog search {
  title "Seen Search"
  icon graph/seen.ico
  size -1 -1 130 123
  option dbu
  button "Ok",999,0 0 0 0,ok
  box "Seen search",1,5 2 120 48
  text "Nickname:",2,10 13 25 7
  edit "",3,45 11 75 10,autohs
  text "On channels:",4,10 23 35 7
  edit "",5,45 21 75 10,autohs
  button "Search",6,58 35 30 10
  button "Clear",7,90 35 30 10
  box "Search results",8,5 53 120 65
  text "Address:",9,10 64 25 7
  edit "",10,37 62 83 10,autohs read
  text "Join time:",11,10 74 25 7
  edit "",12,37 72 83 10,autohs read
  text "Part time:",13,10 84 25 7
  edit "",14,37 82 83 10,autohs read
  text "Quit time:",15,10 94 25 7
  edit "",16,37 92 83 10,autohs read
  text "Quit state:",17,10 104 25 7
  edit "",18,37 102 83 10,autohs read
}
on *:dialog:search:init:*:did -b search 6,7
on *:dialog:search:sclick:*:{
  if ($did == 6) { seen.search }
  if ($did == 7) { did -r search 3,5,10,12,14,16,18 | did -b search 6,7 }
}
on *:dialog:search:edit:*:{
  if ($did(search,3).text == $null) || ($did(search,5).text == $null) { did -b search 6,7 }
  if ($did(search,3).text != $null) || ($did(search,5).text != $null) { did -e search  7 }
  if ($did(search,3).text != $null) && ($did(search,5).text != $null) { did -e search 6,7 }
}
alias seen.search {
  if ($did(search,3).text != $null) && ($did(search,5).text != $null) {
    var %seen.search.nick = $did(search,3).text | var %seen.search.chan $did(search,5).text
    if ($´sr(%seen.search.nick, [ join_ $+ [ %seen.search.chan ] ] ) != $null) || ($´sr(%seen.search.nick, [ part_ $+ [ %seen.search.chan ] ] ) != $null) || ($´sr(%seen.search.nick,quit) != $null) {
      if ($´sr(%seen.search.nick,address) != $null) { did -ra search 10 $´sr(%seen.search.nick,address) }
      if ($´sr(%seen.search.nick, [ join_ $+ [ %seen.search.chan ] ] ) != $null) { did -ra search 12 $´sr(%seen.search.nick, [ join_ $+ [ %seen.search.chan ] ] ) } | else { did -ra search 12 n/a }
      if ($´sr(%seen.search.nick, [ part_ $+ [ %seen.search.chan ] ] ) != $null) { did -ra search 14 $´sr(%seen.search.nick, [ part_ $+ [ %seen.search.chan ] ] ) } | else { did -ra search 14 n/a }
      if ($´sr(%seen.search.nick,quit_time) != $null) { did -ra search 16 $´sr(%seen.search.nick,quit_time) } | else { did -ra search 16 n/a }
      if ($´sr(%seen.search.nick,quit) != $null) && (%seen.search.chan isin $gettok($´sr(%seen.search.nick,quit),1,32)) { did -ra search 18 $gettok($´sr(%seen.search.nick,quit),2-,32) } | else { did -ra search 18 n/a } 
      goto end
    }
  }
  if ($´sr(%seen.search.nick, [ join_ $+ [ %seen.search.chan ] ] ) == $null) && ($´sr(%seen.search.nick, [ part_ $+ [ %seen.search.chan ] ] ) == $null) && ($´sr(%seen.search.nick,quit) == $null) { did -ra search 10,12,14,16,18 no matches found! | goto end }
  did -ra search 10,12,14,16,18 error: parameters missing!
  :end
}
on *:start:if ($´sr(seen,startup) == 1) { clear.seen.list_ } | if ($exists(seen.ini) == $false) { 'sw seen inuse 0 | 'sw seen startup 0 }


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
