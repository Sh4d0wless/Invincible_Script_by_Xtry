;___________________________________________
; Invincible by Xtry
; Personal Flood Protection
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias -l udll return $scriptdirdll/mdx.dll
alias -l mdx return $dll($udll,$1,$2-)
alias -l vdx return $scriptdirdll/views.mdx
alias -l adll return $scriptdirdll/aircdll.dll
alias -l flood return $dll($adll,Flood,$1-)
alias -l mdxl mdx SetMircVersion $version | mdx MarkDialog $dname
alias -l add did -a $dname 3 $1-
alias -l comdx did -i $dname 3 1 $1-
alias -l addtok var %pfp.i = 1 | while $gettok($2-,%pfp.i,$1) { did -a $dname 3 $ifmatch | inc %pfp.i }
alias -l ct did -ao $dname 19 $1 $+ $2 | did -ao $dname 15 $replace($1,MSG,Message) Flood | ref $1
alias core if ($isid) { return $hget(koprot,$1) } | hadd koprot $1- 
alias -l addex var %pfp.d = $$?"Enter Username" | set %pfp.ex $addtok(%pfp.ex,%pfp.d,44) | refex
alias -l delex var %pfp.d = $iif($1,$1,$$?"Enter Username") | set %pfp.ex $remtok(%pfp.ex,%pfp.d,1,44) | refex $dname
alias -l refex did -r $iif($1,$1,$dname) 33 | didtok $iif($1,$1,$dname) 33 44 %pfp.ex
alias -l ref did -r $dname 18,20,24 | did -u $dname 22 | set %pfp.edit.f $$1 | did -a $dname 18 $core($1 $+ .max) | did -a $dname 20 $core($1 $+ .sec) | did $iif($core($1 $+ .ignore),-c,-u) $dname 22 | did -a $dname 24 $core($1 $+ .len) | did -c $dname 27 $core($1 $+ .igt) 
alias -l comkick var %pfp.i = 1 | while $comchan($$1,%pfp.i) { if ($comchan($$1,%pfp.i).op) { kick $ifmatch $1 $2- } } 
alias pp dialog $iif($dialog(koprot),-v,-m) koprot koprot

dialog koprot {
  title "Personal Flood Protection"
  size -1 -1 208 109
  option dbu
  icon graph/prot.ico
  box "", 1, 76 2 128 90
  button "&OK", 2, 161 95 43 12, ok
  list 3, 3 4 69 88, size
  tab "sets", 4, 61 121 99 22
  check "Notify me on trigger", 13, 83 79 68 10, tab 4
  check "Common channel kick on trigger", 12, 83 68 97 10, tab 4
  combo 11, 94 56 104 50, tab 4 size drop
  combo 9, 94 31 104 50, tab 4 size drop
  check "Default Ignore Type:", 8, 84 20 78 10, tab 4
  check "On/Off", 6, 84 9 56 10, tab 4
  check "On Trigger:", 10, 83 44 37 10, tab 4
  tab "floods", 7
  text "Ignore Address:", 26, 85 66 39 8, tab 7
  text "Length", 23, 86 53 17 8, tab 7
  edit "", 24, 105 52 18 10, tab 7
  text "seconds", 25, 125 53 20 8, tab 7
  check "Ignore the user", 22, 83 40 48 10, tab 7
  edit "", 18, 105 28 18 10, tab 7 autohs
  text "Trigger:", 17, 83 29 21 8, tab 7
  text "                   ", 19, 124 29 24 8, tab 7 center
  edit "", 20, 149 28 18 10, tab 7
  text "seconds", 21, 168 29 25 8, tab 7
  button "", 16, 82 22 117 2, disable tab 7 flat
  text "", 15, 82 9 117 11, tab 7 center
  combo 27, 127 65 73 50, tab 7 size drop
  tab "exempt", 32
  list 33, 82 38 117 49, tab 32 size
  button "Remove", 35, 128 25 43 12, tab 32
  button "Add", 34, 82 25 43 12, tab 32
  text "These users will not be ignored when a flood is triggered", 36, 82 9 117 14, tab 32
}

on *:DIALOG:koprot:*:*:{
  if ($devent == init) {
    mdxl
    mdx SetControlMDX $dname 3 treeview haslines fullrowselect hasbuttons showsel > $vdx
    mdx SetFont $dname 15 +b Russian 20 700 Tahoma    
    mdx SetFont $dname 34,35 +b Russian 15 700 Tahoma
    add +eb Configuration
    comdx cb last
    add +e Options
    add +eb Floods
    comdx cb last
    addtok 32 CTCP Message Notice Query DCC Invite
    comdx cb up
    add +eb Exempts
    didtok $dname 9,27 44 0) *!user@userid.host.com,1) *!*@*user@userid.host.com,2) *!*@userid.host.com,3) *!*user@*.host.com,4) *!*@*.host.com,5) Nick!User@userid.host.com
    didtok $dname 11 44 Ignore Everything from User,Ignore the specific flood type   
    did $iif($core(stat),-c,-u) $dname 6  
    did $iif($core(DI),-c,-u) $dname 8
    did $iif($core(OT),-c,-u) $dname 10
    did $iif($core(CC),-c,-u) $dname 12
    did $iif($core(NT),-c,-u) $dname 13
    did -c $dname 9 $didwm($dname,9,$+($core(DI.Type),*),1)
    did -c $dname 11 $core(ot.line)  
    refex
  }
  if ($devent == edit) {
    if ($did == 18) { core %pfp.edit.f $+ .max $did($did) }
    if ($did == 20) { core %pfp.edit.f $+ .sec $did($did) }
    if ($did == 24) { core %pfp.edit.f $+ .len $did($did) }
  }
  if ($devent == sclick) {
    if ($did == 22) { core %pfp.edit.f $+ .ignore $did(22).state }
    if ($did == 27) { core %pfp.edit.f $+ .igt $did(27).sel }
    if ($did == 9) { core DI.Type $left($did(9).seltext,1) }
    if ($did == 11) { core ot.Line $did(11).sel } 
    if ($did == 3) {
      var %pfp.clicked = $gettok($did(3,1),4-,32)
      if (%pfp.clicked == 2 2) { did -f $dname 4 }
      if (%pfp.clicked == 2 3 2) { did -f $dname 7 | ct CTCP 's }
      if (%pfp.clicked == 2 3 3) { did -f $dname 7 | ct MSG 's }
      if (%pfp.clicked == 2 3 4) { did -f $dname 7 | ct Notice 's }
      if (%pfp.clicked == 2 3 5) { did -f $dname 7 | ct Query 's }
      if (%pfp.clicked == 2 3 6) { did -f $dname 7 | ct DCC 's }
      if (%pfp.clicked == 2 3 7) { did -f $dname 7 | ct Invite s }    
      if (%pfp.clicked == 2 4) { did -f $dname 32 }    
    }
    if ($did == 34) { addex }
    if ($did == 35) { if ($did(33).seltext) { delex $ifmatch } }
    if ($did == 6) { core Stat $did(6).state }
    if ($did == 8) { core DI $did(8).state }
    if ($did == 10) { core OT $did(10).state }
    if ($did == 12) { core CC $did(12).state }
    if ($did == 13) { core NT $did(13).state }
  }
}

alias switch {
  var %pfp.sw = ctcp,t,notice,n,invite,i,dcc,d,msg,p,query,p
  var %pfp.i = 1 | while $gettok(%pfp.sw,%pfp.i,44) {
    if ($ifmatch == $1) { return $gettok(%pfp.sw,$calc(%pfp.i +1),44) }
    inc %pfp.i
  }
}

on *:exit:{ hsave -o KoProt utilities/prot/Settings.hs }
on *:start:{ if ($exists($scriptdirSettings.hs)) hmake KoProt 40 | hload KoProt utilities/prot/Settings.hs }
ctcp *:*:?:{ cff ctcp }
on *:text:*:?:{ cff msg }
on *:notice:*:?:{ cff notice }
ctcp *:*dcc*:?:{ cff dcc }
on *:open:?:{ cff query }
on *:invite:#:{ cff invite }

alias cff {
  if ($core(STAT)) && ($nick != NickServ) && ($nick != ChanServ) {
    var %pfp.i = 1 | while $gettok(%pfp.ex,%pfp.i,44) { if ($ifmatch == $nick) || ($ifmatch iswm $address($nick,5)) { halt } | inc %pfp.i }    
    var %pfp.a = $flood($+($$1,.,$wildsite) 1 $core($+($1,.,max)) $core($+($1,.,sec))) 
    if (+Flood* iswm %pfp.a) {
      if ($core(NT)) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $upper($1) Flood Detected from $+ $cxs(1) $nick $cxs(3) $+ ( $+ $cxs(1) $+ $address($nick,2) $+ $cxs(3) $+ ) }
      if ($core($+($1,.,ignore))) && ($core($+($1,.,len)) !isalpha) {
        .ignore $iif($core(ot.Line) == 2,$+(-,$switch($1)),-) $+ $+(u,$core($+($1,.,len))) $iif($calc($core($+($1,.,igt)) -1) > 0,$address($nick,$ifmatch),$address($nick,$core(DI.Type)))
        if (%emeignore = on) { .splay %emerignore }
        else { halt }
      }
      if ($core(CC)) {
        var %pfp.i = 1 
        while $comchan($nick,%pfp.i) {
          if ($comchan($nick,%pfp.i).op) && ($nick ison $comchan($nick,%pfp.i)) && ($nick != $me) { kick $comchan($nick,%pfp.i) $nick $upper($1) Personal Flood - %name }
          inc %pfp.i
        }
      }
    }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
