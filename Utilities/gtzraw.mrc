;___________________________________________
; Invincible by Xtry
; Raw Events
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

raw 1:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $1- | halt
raw 2:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $1- | halt
raw 3:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $1- | halt
raw 4:*: {
  haltdef
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Server $cxs(3) $+ : $+ $cxs(1) $2
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Version $cxs(3) $+ : $+ $cxs(1) $3
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) User modes $cxs(3) $+ : $+ $cxs(1) $4  $+ $cxs(3) $+ - $+ $cxs(2) Channel modes $cxs(3) $+ : $+ $cxs(1) $5
  halt
}
raw 5:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $1- | halt
raw 221:*:{ echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) User mode now is  $+ $cxs(1) $2- | halt } 
raw 205:*:{ echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Traced user $cxs(3) $+ : $+ $cxs(1) $2- | halt } 
raw 251:*: { 
  haltdef
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Total users $cxs(3) $+ : $+ $cxs(1) $4 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Invisible $cxs(3) $+ : $+ $cxs(1) $7 
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Total servers $cxs(3) $+ : $+ $cxs(1) $10
  halt
}
raw 252:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Total operators connected $cxs(3) $+ : $+ $cxs(1) $2 | halt
raw 253:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Unknown connections $cxs(3) $+ : $+ $cxs(1) $2 | halt
raw 254:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Total channels $cxs(3) $+ : $+ $cxs(1) $2 | halt
raw 255:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Local servers $cxs(3) $+ : $+ $cxs(1) $4 | halt
raw 256:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Administrative info for $+ $cxs(1) $5 | halt
raw 257:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Server info $cxs(3) $+ : $+ $cxs(1) $2- | halt
raw 258:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Admin info $cxs(3) $+ : $+ $cxs(1) $2- | halt
raw 259:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Admin email $cxs(3) $+ : $+ $cxs(1) $2- | halt
raw 260:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 265:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Local Users $cxs(3) $+ : $+ $cxs(1) $5  $+ $cxs(3) $+ - $+ $cxs(2) Max $cxs(3) $+ : $+ $cxs(1) $7 | halt
raw 266:*: {
  haltdef
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Global Users $cxs(3) $+ : $+ $cxs(1) $5  $+ $cxs(3) $+ - $+ $cxs(2) Max $cxs(3) $+ : $+ $cxs(1) $7
  halt
}
raw 302:*: { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Userhost $cxs(3) $+ : $+ $cxs(1) $2- | halt }
raw 303:*: { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Ison $cxs(3) $+ : $+ $cxs(1) $2- | halt }
raw 306:*: { 
  if (%waysound = on) { .splay %brb }
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You are now set as $+ $cxs(1) Away  $+ $cxs(2) $+ at $time(HH:nn:ss dddd dd mmmm yyyy) | halt
}
raw 305:*: {
  if (%backsoundx = on) { .splay %wb }
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You are now set as $+ $cxs(1) Back  $+ $cxs(2) $+ at $time(HH:nn:ss dddd dd mmmm yyyy) | halt
}
raw 324:*: { echo -t $2 $cxs(3) $+ [ $+ $cxs(1) $+ Mode $+ $cxs(3) $+ - $+ $cxs(1) $+ $2 $+  $+ $cxs(3) $+ ] $cxs(2) $+ $3- | halt }
raw 328:*: {
  if (%echox.ji = on) { echo -t $2 $cxs(3) $+ [ $+ $cxs(1) $+ Info $+ $cxs(3) $+ - $+ $cxs(1) $+ $2 $+  $+ $cxs(3) $+ ] $cxs(2) $+ URL for $+ $cxs(1) $2  $+ $cxs(2) $+ is $+ $cxs(1) $3- | halt }
  else halt
}
raw 329:*: { echo -t $2 $cxs(3) $+ [ $+ $cxs(1) $+ Info $+ $cxs(3) $+ - $+ $cxs(1) $+ $2 $+  $+ $cxs(3) $+ ] $cxs(2) $+ Discovered on $+ $cxs(1) $asctime($3) | halt }
raw 331:*:{ if ($me ison $2) { echo -t $2 $cxs(3) $+ [ $+ $cxs(1) $+ Topic $+ $cxs(3) $+ - $+ $cxs(1) $+ $2 $+  $+ $cxs(3) $+ ] $+ $color(topic) No topic is set. | halt } }
raw 332:*:{ if ($me ison $2) { echo -t $2 $cxs(3) $+ [ $+ $cxs(1) $+ Topic $+ $cxs(3) $+ - $+ $cxs(1) $+ $2 $+  $+ $cxs(3) $+ ] $+ $color(topic) " $3-  $+ $color(topic) " | halt } }
raw 333:*:{ if ($me ison $2) { echo -t $2 $cxs(3) $+ [ $+ $cxs(1) $+ Topic $+ $cxs(3) $+ - $+ $cxs(1) $+ $2 $+  $+ $cxs(3) $+ ] $+ $color(topic) $svxtry(Set by,$3)  $svxtry(on, $asctime($4,dddd) $+ , $asctime($4,mmmm doo) $+ , $asctime($4,yyyy)) $svxtry(at, $asctime($4,HH:nn:ss)) | halt } }
raw 341:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 351:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 352:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 353:*:echo -s $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 364:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 365:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
alias percent { return $round($calc($calc(100 / $2) * $1),0) $+ % $+ $cxs(3) $+  $+ ) }
raw 366:*:{
  if ($me ison $2) {
    if (%echox.ji = on) {
      set %xinjo [ [ $1 ] ] $ticks
      echo -t $2 $cxs(3) $+ [ $+ $cxs(1) $+ Info $+ $cxs(3) $+ - $+ $cxs(1) $+ $2 $+  $+ $cxs(3) $+ ] $cxs(2) $+ Total user(s) in $+ $cxs(1) $2  $+ $cxs(2) $+ is $+ $cxs(1) $nick($2,0)  $+ $cxs(3) $+ - $+ $cxs(2) Op: $+ $cxs(1) $+ $opnick($2,0) $+  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $Percent($nick($2,0,o,v),$nick($2,0) $+ ) $cxs(2) $+ Voice: $+ $cxs(1) $+ $vnick($2,0) $+  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $Percent($nick($2,0,v,o),$nick($2,0) $+ ) $cxs(2) $+ Regular: $+ $cxs(1) $+ $nick($2,0,r) $+  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $Percent($calc($nick($2,0) - $nick($2,0,ov)),$nick($2,0) $+ )
      echo -t $2 $cxs(3) $+ [ $+ $cxs(1) $+ Info $+ $cxs(3) $+ - $+ $cxs(1) $+ $2 $+  $+ $cxs(3) $+ ] $cxs(2) $+ Synched time in $+ $cxs(1) $2  $+ $cxs(2) $+ is $+ $cxs(1) $round($calc(($ticks - %xinjo [ $+ [ $1 ] ] ) / 1000),3) $+ s
    }
    halt
  }
  else { echo -s $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt }
}
raw 367:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 368:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) End of banlist for $+ $cxs(1) $2 | halt
raw 381:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You are now an IRC Operator | halt
raw 371:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 374:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 375:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 372:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 376:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 391:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 402:*:echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $2  $+ $cxs(2) $+ no such server | halt
raw 403:*:echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $2  $+ $cxs(2) $+ no such channel | halt
raw 404:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Cannot send to  $+ $cxs(1) $2
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 405:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You are on too many channels
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 406:*:echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $2  $+ $cxs(2) $+ was no such nickname | halt
raw 407:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2- | halt
raw 411:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) No recipient given
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 412:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) No text to send
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 413:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) No toplevel domain specified
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 414:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Wildcard in toplevel domain
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 421:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Unknown command $+ $cxs(1) $2
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 422:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) MOTD file missing
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 423:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Administrative info unavailable
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 431:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) No nickname given
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 433:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Nick $+ $cxs(1) $2  $+ $cxs(2) $+ is already in use
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 432:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $2  $+ $cxs(2) $+ is an erroneus nickname
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 436:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Cannot change nickname while banned on $+ $cxs(1) $2
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 441:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $2  $+ $cxs(2) $+ is not on $+ $cxs(1) $3
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 443:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $2  $+ $cxs(2) $+ is already on $+ $cxs(1) $3
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 442:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You're not on $+ $cxs(1) $2
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 444:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $cxs(2) $+  $+ $2 $+ $cxs(2) $+ is not logged in
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 461:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Not enough parameter
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 462:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You may not re-register
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 463:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Your host isn't among the privileged
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 464:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Password incorrect
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 465:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You are banned from this server | halt
raw 467:*:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Channel key $cxs(3) $+ ( $+ $cxs(1) $+ +k $+  $+ $cxs(3) $+ ) $cxs(2) $+ on $+ $cxs(1) $2  $+ $cxs(2) $+ is already set. Remove the current key to set the new one | halt 
raw 471:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Cannot join $+ $cxs(1) $2  $+ $cxs(2) $+ the channel is full $+ $cxs(1) +l
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 472:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Unknown mode char $+ $cxs(1) $2
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 474:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Cannot join $+ $cxs(1) $2  $+ $cxs(2) $+ you are banned $+ $cxs(1) +b
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 473:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Cannot join $+ $cxs(1) $2  $+ $cxs(2) $+ invite only $+ $cxs(1) +i
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 475:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Cannot join $+ $cxs(1) $2  $+ $cxs(2) $+ need correct key $+ $cxs(1) +k
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 477:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Cannot join $+ $cxs(1) $2  $+ $cxs(2) $+ registered nickname only $+ $cxs(1) +R
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 481:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You're not an IRC Operator
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 482:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You're not an Op in $+ $cxs(1) $2
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 483:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You can't kill a server
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 491:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) No O lines for your host
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 493:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $cxs(1) $+ $2  $+ $cxs(2) $+ does not wish to receive that type of message
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 494:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Your own modes prohibit you from sending that
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 501:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Unknown mode flag
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw 502:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Can't change mode for other user
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}
raw 511:*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Your silence list is full
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw *:*You cannot Use colors*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2-
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw *:*Memoserv Services is*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2-
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw *:*chanserv Services is*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2-
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}

raw *:*nickserv Services is*:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $2-
  if (%err.sound = on) { .splay %err.wav }
  else { halt }
  halt
}


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
