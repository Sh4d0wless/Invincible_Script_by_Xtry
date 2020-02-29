;___________________________________________
; Invincible by Xtry
; User List
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

; userlist / levels: shitlist: 50 | | autovoice: 100 | autoop: 150 | protect list: 999
on ^1:join:*: {
  if ($nick == $me) return
  if ($me isop #) { 
    if (# isin $ulist($nick).info) || ($ulist($nick).info == $null) && ($level($fulladdress) == 50) { MODE $chan -o+bb  $nick $nick $+ !*@* $address($1,2) | kick $chan $nick Death Listed - %name }
    if (# isin $ulist($nick).info) || ($ulist($nick).info == $null) && ($level($fulladdress) == 100) { mode $chan +v $nick | notice.p $nick (User List) Welcome to $chan $nick $+ . You are in my Auto Voice list - %name }
    if (# isin $ulist($nick).info) || ($ulist($nick).info == $null) && ($level($fulladdress) == 150) { mode $chan +o $nick | notice.p $nick (User List) Welcome to $chan $nick $+ . You are in my Auto Op list - %name }
  }
}
on *:kick:*:if (# isin $ulist($knick).info) || ($ulist($knick).info == $null) && ($level($ulist($address($knick,5))) == 999) { mode $chan +bb-o  $address($1,2) $nick $+ !*@* $nick | kick $chan $nick Protected User ( $+ $knick $+ ) - %name }
alias userlist if ($dialog(ulist)) { dialog -v ulist } | else dialog -m ulist userlist
alias -l user.new if ($1) { userlist | did -rac ulist 2 $1- | did -c ulist 6 1 | did -e ulist 9 }
dialog userlist {
  title "User List"
  size -1 -1 250 170
  icon graph/user.ico
  option dbu
  button "Close",999,215 154 30 10,ok
  box "Hostmask",1,5 3 240 25
  combo 2,10 12 230 50, drop size edit
  box "Users List",3,5 30 240 65
  list 4,10 39 230 50, size vsbar autovs sort
  box "Levels",5,5 97 240 25
  combo 6,10 106 230 50, drop size
  box "Channels (separated by commas, leave blank to all)",7,5 124 240 25
  edit "",8,10 133 230 10, autohs
  button "Add",9,5 154 30 10, default disable
  button "Delete",10,37 154 30 10, disable
  button "Update",11,69 154 30 10, disable
}
alias -l get.users var %u = 1 | var %user.tmp = $ulist(*,%u) | while (%user.tmp != $null) { var %user.tmp = $ulist(*,%u) | if (%user.tmp != $null) { did -a ulist 4 %user.tmp } | inc %u }
alias -l drop.lines did -ra ulist 6 Normal (1) | did -a ulist 6 DeathList (50) | did -a ulist 6 Auto Voice (100) | did -a ulist 6 Auto Op (150) | did -a ulist 6 Protected User (999)
on *:dialog:ulist:init:*:get.users | drop.lines
on *:dialog:ulist:sclick:*:{
  if ($did == 4) { did -rac ulist 2 $did(4).seltext | var %user.info = $level($did(4).seltext) | if (%user.info == 1) { did -c ulist 6 1 } | if (%user.info == 50) { did -c ulist 6 2 } | if (%user.info == 100) { did -c ulist 6 3 } | if (%user.info == 150) { did -c ulist 6 4 } | if (%user.info == 999) { did -c ulist 6 5 } | if ($ulist($did(4).seltext).info != $null) { did -ra ulist 8 $ulist($did(4).seltext).info } | else { did -r ulist 8 } }
  if ($did == 9) { .auser $iif($did(6).sel < 4,$iif($did(6).sel > 1,$calc(($ifmatch -1) * 50),1),999) $$did(ulist,2).text $did(ulist,8).text | did -a ulist 4 $did(2).text | did -r ulist 2,8 | did -u ulist 6 }
  if ($did == 10) { .ruser $$did(4).seltext | did -d ulist 4 $did(4).sel | did -r ulist 2 | did -u ulist 6 }
  if ($did == 11) { .auser $iif($did(6).sel < 4,$iif($did(6).sel > 1,$calc(($ifmatch -1) * 50),1),999) $$did(ulist,2).text | .iuser $$did(ulist,2).text $did(ulist,8).text | did -r ulist 2,8 | did -u ulist 4,6 }
  if ($did(2).text == $null) { did -b ulist 9 } | else { did -e ulist 9 }
  if ($did(4).seltext == $null) { did -b ulist 10,11 } | else { did -e ulist 10,11 }
  if ($did(6).sel == $null) { did -b ulist 9,11 }
  if ($did(2).text isin $didtok(4)) { did -b ulist 9 }
}
on *:dialog:ulist:edit:2:if ($did(2).text == $null) || ($did(2).text isin $didtok(4)) { did -b ulist 9 } | if ($did(2).text != $null) && ($did(2).text !isin $didtok(4)) { did -e ulist 9 | if ($did(6).sel == $null) { did -c ulist 6 1 } }
alias _a return $address($1,$2)
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
