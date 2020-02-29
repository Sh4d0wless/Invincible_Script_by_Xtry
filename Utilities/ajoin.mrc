;___________________________________________
; Invincible by Xtry
; Auto Join
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:load:{ 
if ($version < 5.91) echo -a  $+ $colour(info2) $+ *** You need mirc 5.91 or greator in order to use this addon. | beep }
alias -l aj.switch {
  if ($_ar(general,switch) == off) { return off }
  else { return on } 
}
;[read write utilities\ajoin\autojoin.ini]
alias -l _ar {
  if ($exists(utilities\ajoin\autojoin.ini) == $false) { write -c utilities\ajoin\autojoin.ini }
  return $readini utilities\ajoin\autojoin.ini $$1 $$2 
}
alias _aw {
  if ($exists(utilities\ajoin\autojoin.ini) == $false) { write -c utilities\ajoin\autojoin.ini }
  writeini utilities\ajoin\autojoin.ini $$1 $$2 $$3-
}
alias -l _arem {
  if ($exists(utilities\ajoin\autojoin.ini) == $false) { write -c utilities\ajoin\autojoin.ini }
  remini utilities\ajoin\autojoin.ini $$1 $$2 
}
alias aj {
  if ($version < 5.91) { echo -a 4This addon will not work properly with mIRC $version $+ , please upgrade to latest mIRC www.mirc.com | beep | halt }
  if $dialog(_ajoin) == $null) { dialog -m _ajoin _ajoin } 
}
on *:connect: {
  if ($_ar(general,switch) == on) {
    if ($_ar(general,delay) == on) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto joining channels $cxs(3) $+ ( $+ $cxs(2) $+ delay $+ $cxs(1) %ajdelay  $+ $cxs(2) $+ secs $+ $cxs(3) $+ ) $+ $cxs(2) $+ , please wait.. | .timer 1 %ajdelay aj.join }
    else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto joining channels, please wait.. | aj.join }
  }
}
alias ajoin {
  if ($version < 5.91) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) This addon will not work properly with mIRC $version $+ , please upgrade to latest mIRC www.mirc.com | beep | halt }
  if ($aj.network == $true) && ($_ar(general,switch) == on) { aj.join }
}
dialog _ajoin {
  title "Auto Join"
  icon graph/chan.ico
  size -1 -1 121 130
  option dbu
  button "Exit", 4, 88 119 30 10, ok
  list 1, 6 35 52 65, disable size hsbar
  edit "", 2, 6 10 52 10, disable autohs
  button "Add", 3, 6 22 25 10, disable
  button "Del", 5, 33 22 25 10, disable
  list 6, 63 35 52 65, disable sort size hsbar
  button "Add", 7, 63 22 25 10, disable
  button "Del", 8, 90 22 25 10, disable
  edit "", 9, 63 10 52 10, disable autohs
  box "Network :", 10, 3 2 58 101
  box "Channel :", 11, 60 2 58 101
  check "Enabled", 13, 3 105 30 10,push
  button "Join now", 14, 34 105 30 10
  check "Delay", 12, 70 105 30 10,push
  edit "%ajdelay",20,101 105 17 10
}
on *:dialog:_ajoin:init:*:{
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 4,3,5,7,8,2,1,9,10,11,12,13,14,6 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 3,5,4,7,8,14,13,12 clientedge
  if ($_ar(general,switch) == on) { did -c _ajoin 13 | did -e _ajoin 1,2,3,5 } 
  if ($_ar(general,delay) == on) { did -c _ajoin 12 }
  if (%ajena = on) { did -o _ajoin 13 1 Enabled }
  if (%ajena = off) { did -o _ajoin 13 1 Disabled }
  if ($did(_ajoin,12).state == 0) { did -b _ajoin 20 }
  if ($did(_ajoin,12).state == 1) { did -e _ajoin 20 }
  did -o _ajoin 20 1 %ajdelay
  did -o _ajoin 2 1 $net.check 
  aj.refresh
}
alias -l net.check {
  if ($network != $null) { return $network }
  else return $server
}
alias -l aj.netc {
  if ($_ar(network,count) != $null) { return $_ar(network,count) }
  else return 0
}
alias -l aj.chanc {
  if ($_ar($did(1).sel,count) != $null) && ($_ar($did(1).sel,count) >= 1) { return $_ar($did(1).sel,count) }
  else return 0
}
alias -l aj.refresh {
  did -r _ajoin 1,6
  var %aj1 = $aj.netc
  var %ajc = 1
  :loop
  if (%ajc <= %aj1) { did -a _ajoin 1 $_ar(network,%ajc) } 
  else { goto end }
  inc %ajc
  goto loop
  :end
}
alias -l net {
  return " $+ $findfile($mircdirutilities\ajoin, $net.check $+ .txt,1) $+ "
}
alias -l aj.join {
  var %aj1 = $lines($net) 
  var %ajc = 1
  while (%ajc <= %aj1) { join $read($net ,%ajc) | inc %ajc 1 }
}
alias -l aj.channel {
  did -r _ajoin 6
  var %aj1 = $lines(utilities/ajoin/ $+ $_ar(network,$_ar(network,current)) $+ .txt) 
  var %ajc = 1
  while (%ajc <= %aj1)  { did -a _ajoin 6 $read(utilities/ajoin/ $+ $_ar(network,$_ar(network,current)) $+ .txt,%ajc) | inc %ajc 1 }
}
alias -l aj.network {
  var %aj1 = $aj.netc
  var %ajc = 1
  :loop
  if (%ajc > %aj1) { return $false | goto end }  
  elseif ($_ar(network,%ajc) == $net.check) { return $true } 
  else { return $false | goto end }
  inc %ajc
  goto loop
  :end
}
alias -l del.ajset { remove $findfile($mircdirutilities\ajoin,autojoin.ini,1) } 
on *:dialog:_ajoin:sclick:*:{
  if ($did == 4) { set %ajdelay $did($dname,20) }
  if ($did == 3) && ($did(2,$did(2).text) != $null) { _aw network count $calc($aj.netc + 1) | _aw network $aj.netc $did(2).text | did -a _ajoin 1 $did(2).text | did -r _ajoin 2 }
  if ($did == 5) && ($did(1,$did(1).sel) != $null) { var %ajq =  $_ar(network,$_ar(network,current)) | _arem network $aj.netc $did(1).sel | _aw network count $calc($aj.netc - 1) | did -r _ajoin 1 |  if ($findfile($mircdirutilities\ajoin,%ajq $+ .txt,1) != $null) { .remove utilities/ajoin/ $+ %ajq $+ .txt } | aj.refresh | aj.channel }
  if ($did == 1) && ($did(1,$did(1).sel) != $null) { if ($left($active,1) == $chr(35)) { did -o _ajoin 9 1 $active } | did -e _ajoin 6,9,7,8 | _aw network current $did(1).sel | aj.channel }
  if ($did == 7) && ($did(1,$did(1).sel) != $null) && ($did(9,$did(9).text) != $null) { write utilities/ajoin/ $+ $did(1,$did(1).sel) $+ .txt $did(9).text | did -a _ajoin 6 $did(9).text | did -r _ajoin 9 }
  if ($did == 8) && ($did(6,$did(6).sel) != $null) { write -ds $+ $did(6,$did(6).sel) utilities/ajoin/ $+ $did(1,$did(1).sel) $+ .txt | .timer -m 1 1 aj.channel }
  if ($did == 12) {
    if ($did(_ajoin,$did).state == 1) { did -e _ajoin 20 }
    if ($did(_ajoin,$did).state == 0) { did -b _ajoin 20 }
    if ($_ar(general,delay) == on) { _aw general delay off }
    else { _aw general delay on }
  }
  if ($did == 13) {
    if ($did(_ajoin,$did).state == 1) { did -o _ajoin 13 1 Enabled | set %ajena on }
    else { did -o _ajoin 13 1 Disabled | set %ajena off }
    if ($_ar(general,switch) == on) { did -b _ajoin 1,2,3,5 | did -u _ajoin 13 | _aw general switch off | haltdef }
    else { did -c _ajoin 13 | did -e _ajoin 1,2,3,5 | _aw general switch on | haltdef }
  }
  if ($did == 14)  { aj.join }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
