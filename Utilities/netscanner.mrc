;___________________________________________
; Invincible by Xtry
; Net Scanner
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:LOAD:{ 
  if ($lock(dll)) { echo $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You need to unlock the DLL option for this script to work. Press Alt+o -> General -> Lock. Closing in 5 seconds... | .timerzoza 1 5 exit }
  else { echo $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Loaded Net Scanner , type /scanner to begin }
}

dialog scanner {
  title "Net Scanner"
  icon graph/scanner.ico
  size -1 -1 170 138
  option dbu
  box "Scanning", 1, 1 0 168 75
  box "", 2, 1 73 168 19
  check "Clones", 3, 5 79 40 10, push
  check "IRCops", 4, 46 79 40 10, push
  check "Aways", 5, 87 79 40 10, push
  list 6, 4 8 162 53, size hide
  list 7, 4 8 162 53, size hide
  list 8, 4 8 162 53, size hide
  box "Actions", 15, 1 92 100 30
  text "After scanning, perform:", 16, 5 99 102 8
  button "Scan!", 9, 144 78 20 12, disable
  combo 10, 5 107 65 50, size drop
  button "Perform!", 11, 73 107 25 10, disable
  box "Channels", 12, 102 92 67 30
  text "Net Scanner", 13, 3 126 100 13, disable
  button "Done!", 14, 146 124 23 12, ok
  text "Choose scan chan:", 17, 106 99 83 8
  combo 18, 106 107 60 50, size drop
  text "Nicks:", 19, 5 63 20 13, hide
  edit "", 20, 20 61 92 10, read multi autovs return hide
  text "Clone group(s):", 21, 115 63 40 13, hide
  edit "", 22, 154 61 12 10, read hide
  text "IRCop(s):", 23, 130 63 40 13, hide
  edit "", 24, 154 61 12 10, read hide
  text "Away nick(s):", 25, 120 63 40 13, hide
  edit "", 26, 154 61 12 10, read hide
  text "Scan in:", 27, 6 63 40 13, hide
  radio "Network", 28, 31 61 30 12, hide
  radio "Spec. channels", 29, 71 61 45 12, hide
}
on *:dialog:scanner:*:*:{
  if ($devent == init) {
    mdx SetMircVersion $version | mdx MarkDialog $dname 
    mdx SetFont $dname 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29 12 300 Tahoma
    mdx SetControlMDX $dname 6,7,8 ListView report flatsb grid rowselect showsel nosortheader single > [ $mdx.vdll ] 
    var %x = 1 | while (%x <= $chan(0)) { did -a $dname 18 $chan(%x) | inc %x } | did -i $dname 6 1 headerdims 275:1 30:2 | did -i $dname 6 1 headertext Host $ch9 $chr(35) | did -i $dname 7 1 headerdims 85:1 218:2 | did -i $dname 7 1 headertext IRCop Nick $ch9 Host | did -i $dname 8 1 headerdims 85:1 220:2 | did -i $dname 8 1 headertext Away Nick $ch9 Host
  }
  if ($devent == sclick) {
    if ($did == 3) { did -u $dname 4,5 | dide 9,18 | didv 6,19,20,21,22 | did -h $dname 7,8,23,24,25,26,27,28,29 }
    if ($did == 4) { did -u $dname 3,5 | dide 9 | did -h $dname 6,8,19,20,21,22,25,26 | did -b $dname 18 | didv 7,23,24,27,28,29 }
    if ($did == 5) { did -u $dname 3,4 | dide 9,18 | didv 8,25,26 | did -h $dname 6,7,19,20,21,22,7,23,24,27,28,29 }
    if ($did isnum 3-5) { if ($did($dname,$did).state == 0) { did -h $dname 6,7,8,19,20,21,22,23,24,25,26,27,28,29 | did -b $dname 9,11,18 } }
    if ($did == 6) { info $gettok($did($dname,$did).seltext,6,32) }
    if ($did == 9) { 
      did -r $dname 10 
      unset %s.action 
      if ($did(18).seltext) { 
        if ($did(3).state == 1) { 
          scan $did(18).seltext clones 
        } 
        if ($did(5).state == 1) { 
          scan $did(18).seltext away 
        }
      }
      if ($did(4).state == 1) { 
        if (%ircop.type) { ircop.scan }
        else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Please Choose IRCop scan type }
      }
    }
    if ($did == 10) { if ($did($dname,10).seltext) { set %s.action $did($dname,10).seltext } }
    if ($did == 11) { if ($did(10).seltext) { if ($did(3).state == 1) { clone.act $iif($did(10).sel == 1,kick,kban) } | else { var %t.sel = $iif($did($dname,4).state == 1,7,8) | %s.action $gettok($did( $dname,%t.sel).seltext,6,32) } } }
    if ($did == 18) { dialog -t $dname Scanning: $did(18).seltext }
    if ($did == 28) { did -b $dname 18 | set %ircop.type network }
    if ($did == 29) { dide 18 | set %ircop.type channel }
  }
}

alias -l scan {
  if ($2 == clones) {
    if ($chan($1).ial != $true) && ($me ison $1) { .who $1 }
    did -r scanner 6
    var %x = 1, %y = 1
    if ($hget(_clones) == $null) { .hmake -s _clones 100 }
    while (%x <= $nick($1,0)) { 
      if ($ialchan($address($nick($1,%x),2),$1,0) > 1) { .hadd _clones $address($nick($1,%x),2) $hget(_clones,$address($nick($1,%x),2)) }
      inc %x
    }
    while (%y <= $hget(_clones,0).item) {
      did -a scanner 6 $hget(_clones,%y).item $ch9 $ialchan($hget(_clones,%y).item,$1,0)
      inc %y
    }
    dide 11 | dialog -t scanner Finished Clone scanning: $did(scanner,18).seltext | did -o scanner 22 1 $calc($did(6).lines - 1) | didtok scanner 10 44 Kick,BanKick | .hfree -s _clones
  }
  if ($2 == away) { did -r scanner 8 | .enable #scanaway | .who $$1 }
}
alias -l info { 
  did -r scanner 20
  var %x = 1, %y = 1
  if ($hget(_info) == $null) { .hmake -s _info 100 }
  while (%x <= $ialchan($1,$did(scanner,18).seltext,0)) {
    .hadd _info $ialchan($1,$did(scanner,18).seltext,%x).nick
    inc %x
  }
  while (%y <= $hget(_info,0).item) {
    did -a scanner 20 $hget(_info,%y).item $+ ,
    inc %y
  }
  did -ra scanner 20 $left($did(scanner,20).text,-1) | .hfree -s _info
}
alias -l clone.act {
  var %chan = $did(scanner,18).seltext , %t.user = $gettok($did(scanner,6).seltext,11,32) , %t.host = $gettok($did(scanner,6).seltext,6,32)
  $iif($1 == kban,ban %chan %t.host 2)
  var %bloh = 1
  while (%bloh <= %t.user) {
    var %t.nicks = $ialchan(%t.host,%chan,%bloh).nick
    kick %chan %t.nicks Clone %bloh out of %t.user - %name
    inc %bloh
  }
  unset %chan,%t.nicks,%t.user,%t.host
}

alias dide did -e scanner $1-
alias didv did -v scanner $1-
alias ircop.scan { 
  did -r scanner 7 | .enable #ircop-scan.net
  if (%ircop.type == network) { .who 0 o }
  else { .who $did(scanner,18).seltext }
}
alias scanner if ($dialog(scanner)) dialog -v scanner | else dialog -m scanner scanner
alias ch9 return $chr(9)

#ircop-scan.net off
raw 315:*: .disable #ircop-scan.net | dialog -t scanner Finished IRCop scanning: $iif(%ircop.type == channel,$did(scanner,18).seltext),$network) | did -o scanner 24 1 $calc($did(scanner,7).lines - 1) | didtok scanner 10 44 /whois,/query | did -e scanner 11 | did -c scanner 18 1 | unset %ircop.type | halt
raw 352:*: { 
  if (%ircop.type == channel) { if (* isin $7) { did -a scanner 7 $6 $chr(9) $address($6,2) } | haltdef }
  else { did -a scanner 7 $6 $chr(9) $address($6,2) }
}
#ircop-scan.net end
#scanaway off
raw 352:*: if (G isin $7) { did -a scanner 8 $6 $ch9 $address($6,2) | inc %scan.aways } 
raw 315:*: dialog -t scanner Finished Away scanning: $did(scanner,18).seltext | did -o scanner 26 1 $calc($did(scanner,8).lines - 1) | .disable #scanaway | unset %scan.aways | didtok scanner 10 44 /whois,/query | did -e scanner 11 | did -c scanner 18 1 | halt 
#scanaway end

alias -l mdx { if ($lock(dll)) return | if ($isid) return $dll($mdx.udll,$1,$iif($2- != $null,$2-,.)) | dll $shortfn($mdx.udll) $1- }
alias -l mdx.udll { return dll/mdx.dll }
alias -l mdx.vdll { return dll/views.mdx }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
