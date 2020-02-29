;___________________________________________
; Invincible by Xtry
; Ignore Manager
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:LOAD:{
  ignore.settings
}

alias uninstall.ignore.manager {
  unset %ignore.*
  unload -rs $scriptdir $+ ignore.mrc
}

alias -l ignore.settings {
  set %ignore.delay [ off ]
  set %ignore.delay.timer [ 60 ]
  set %ignore.switches.default [ 2 ]
  set %ignore.type.default [ 2 ]
  .ial on
}





alias show.ignoreList.dialog {
  if ($dialog(ignoreListDialog) == $null) { dialog -m ignoreListDialog ignoreListDialog }
  else { dialog  -v ignoreListDialog }
}

alias ignore.manager {
  set %ignore.nick [ $1 ]
  if ($dialog(ignoreDialog) == $null) { 
    dialog -m ignoreDialog ignoreDialog 
  }
  else {
    dialog  -v ignoreDialog
    setIgnore
  }
}

dialog ignoreDialog {
  title "Ignore Manager"
  icon graph/ignore.ico
  size -1 -1 290 140
  option dbu
  text "Mask types :",722,10 10 30 10,left
  radio "",723,20 21 10 10, left
  edit "",724,35 20 130 10, autohs left
  radio "",725,20 31 10 10, left
  edit "",726,35 30 130 10, autohs left
  radio "",727,20 41 10 10, left
  edit "",728,35 40 130 10, autohs left
  radio "",729,20 51 10 10, left
  edit "",730,35 50 130 10, autohs left
  radio "",731,20 61 10 10, left
  edit "",732,35 60 130 10, autohs left
  radio "",733,20 71 10 10, left
  edit "",734,35 70 130 10, autohs left
  radio "",735,20 81 10 10, left
  edit "",736,35 80 130 10, autohs left
  radio "",737,20 91 10 10, left
  edit "",738,35 90 130 10, autohs left
  radio "",739,20 101 10 10, left
  edit "",740,35 100 130 10, autohs left

  text "Ignore types :",741,190 10 35 10,left
  check "Privates",742,200 20 35 10
  check "Channel",743,200 30 35 10
  check "Notices",744,200 40 35 10
  check "Ctcps",745,200 50 35 10
  check "Invites",746,200 60 35 10
  check "Control codes",747,200 70 50 10

  text "Delay :",748,190 90 35 10,left
  edit "",749,200 100 15 10,left
  text "seconds",750,217 101 25 10,left
  check "Enabled",751,245 100 30 10

  button "Ignore", 720, 25 125 30 12, ok
  button "Cancel", 721, 60 125 30 12, cancel
  button "Save settings",752, 155 125 40 10
  button "Restore factory settings",753, 200 125 65 10
}

alias -l  setIgnore {
  var %ign.i = 1
  var %ignore.address.did = 724
  while (%ign.i <= 9) {
    did -ra ignoreDialog %ignore.address.did $address(%ignore.nick,%ign.i)
    inc %ign.i 1
    inc %ignore.address.did 2
  }
  did -c ignoreDialog $calc(721 + 2 * %ignore.type.default)
  unset %ignore.nick
  if (%ignore.delay == on) { did -c ignoreDialog 751 | did -rae ignoreDialog 749 %ignore.delay.timer }
  else { did -u ignoreDialog 751 | did -rab ignoreDialog 749 %ignore.delay.timer }

  %ign.i = 1
  while (%ign.i <= $numtok(%ignore.switches.default,44)) {
    did -c ignoreDialog $calc(741 + $gettok(%ignore.switches.default,%ign.i,44))
    inc %ign.i 1
  }
}


ON *:DIALOG:ignoreDialog:INIT:0:setIgnore

ON *:DIALOG:ignoreDialog:SCLICK:751:{
  if ($did(751).state == 1) { did -e ignoreDialog 749 %ignore.delay.timer }
  if ($did(751).state == 0) { did -b ignoreDialog 749 %ignore.delay.timer }
}

;restore settings button
ON *:DIALOG:ignoreDialog:SCLICK:753:{ 
  ignore.settings  
  var %ign.i = 1
  var %ignore.address.did = 723
  while (%ign.i <= 9) {
    did -u ignoreDialog %ignore.address.did
    inc %ign.i 1
    inc %ignore.address.did 2
  }
  %ign.i = 1
  %ignore.address.did = 742
  while (%ign.i <= 6) {
    did -u ignoreDialog %ignore.address.did
    inc %ign.i 1
    inc %ignore.address.did 1
  }
  did -c ignoreDialog $calc(721 + 2 * %ignore.type.default)
  if (%ignore.delay == on) { did -c ignoreDialog 751 | did -rae ignoreDialog 749 %ignore.delay.timer }
  else { did -u ignoreDialog 751 | did -rab ignoreDialog 749 %ignore.delay.timer }

  %ign.i = 1
  while (%ign.i <= $numtok(%ignore.switches.default,44)) {
    did -c ignoreDialog $calc(741 + $gettok(%ignore.switches.default,%ign.i,44))
    inc %ign.i 1
  }
}

;save settings button
ON *:DIALOG:ignoreDialog:SCLICK:752:{
  var %ign.i = 1
  var %ignore.address.did = 723
  while (%ign.i <= 9) {
    if ($did(%ignore.address.did).state == 1) { set %ignore.type.default [ %ign.i ] } 
    inc %ign.i 1
    inc %ignore.address.did 2
  }
  %ign.i = 1
  %ignore.address.did = 742
  var %ignore.switches.save
  var %ignore.switches.abbr
  while (%ign.i <= 6) {
    if ($did(%ignore.address.did).state == 1) { 
      if (Privates isin $did(%ignore.address.did).text) { %ignore.switches.abbr = 1 }  
      if (Channel isin $did(%ignore.address.did).text) { %ignore.switches.abbr = 2 }  
      if (Notices isin $did(%ignore.address.did).text) { %ignore.switches.abbr = 3 }  
      if (Ctcps isin $did(%ignore.address.did).text) { %ignore.switches.abbr = 4 }  
      if (Invites isin $did(%ignore.address.did).text) { %ignore.switches.abbr = 5 }  
      if (Control isin $did(%ignore.address.did).text) { %ignore.switches.abbr = 6 }  
      %ignore.switches.save = %ignore.switches.save $+ $chr(44) $+ %ignore.switches.abbr
    }
    inc %ign.i 1
    inc %ignore.address.did 1
  }
  set %ignore.switches.default [ $right(%ignore.switches.save,$calc($len(%ignore.switches.save) - 1)) ]

  if ($did(751).state == 1) { set %ignore.delay [ on ] }
  else { set %ignore.delay [ off ] }
  if (($did(749).text != $null) && ($did(749).text isnum) && ($did(749).text >= 0)) { set %ignore.delay.timer [ $did(749).text ] }
  else { 
    if ($did(751).state == 1) { did -rae ignoreDialog 749 %ignore.delay.timer  }
    else { did -rab ignoreDialog 749 %ignore.delay.timer  }
  } 
}

;cancel button
ON *:DIALOG:ignoreDialog:SCLICK:721:close -x

;ignore button
ON *:DIALOG:ignoreDialog:SCLICK:720:{
  var %ign.i = 1
  var %ignore.address.did = 723
  var %ignore.mask
  while (%ign.i <= 9) {
    if ($did(%ignore.address.did).state == 1) { %ignore.mask = $did($calc(%ignore.address.did + 1)).text } 
    inc %ign.i 1
    inc %ignore.address.did 2
  }
  %ign.i = 1
  %ignore.address.did = 742
  var %ignore.switches
  var %ignore.switches.abbr
  while (%ign.i <= 6) {
    if ($did(%ignore.address.did).state == 1) { 
      if (Privates isin $did(%ignore.address.did).text) { %ignore.switches.abbr = p }  
      if (Channel isin $did(%ignore.address.did).text) { %ignore.switches.abbr = c }  
      if (Notices isin $did(%ignore.address.did).text) { %ignore.switches.abbr = n }  
      if (Ctcps isin $did(%ignore.address.did).text) { %ignore.switches.abbr = t }  
      if (Invites isin $did(%ignore.address.did).text) { %ignore.switches.abbr = i }  
      if (Control isin $did(%ignore.address.did).text) { %ignore.switches.abbr = k }  
      %ignore.switches = %ignore.switches $+ %ignore.switches.abbr
    }
    inc %ign.i 1
    inc %ignore.address.did 1
  }
  if ((%ignore.mask != $null) && (%ignore.switches)) { 
    if ($did(751).state == 1) { 
      if (($did(749).text != $null) && ($did(749).text isnum) && ($did(749).text >= 0)) { ignore - $+ %ignore.switches $+ u $+ $did(749).text %ignore.mask }
      else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Ignore cancelled wrong value for the delay }
    }
    else { ignore - $+ %ignore.switches %ignore.mask }
  }
  else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Ignore cancelled no ignore address or ignore type switch(es) selected }
}





dialog ignoreListDialog {
  title "Ignore list"
  icon graph/ignore.ico
  size -1 -1 270 130
  option dbu
  list 761,10 5 140 100
  text "Applied ignore type(s) :",765,200 5 70 10,left
  check "Privates",766,210 15 35 10
  check "Channel",767,210 25 35 10
  check "Notices",768,210 35 35 10
  check "Ctcps",769,210 45 35 10
  check "Invites",770,210 55 35 10
  check "Control codes",771,210 65 50 10
  check "Ignore enabled",772,11 100 70 10
  button "Remove",762,160 75 30 10
  button "Clear All",763,160 90 30 10
  button "Update",764,160 10 30 10
  button "Ok", 760, 120 115 30 12, ok
}


alias -l  setIgnoreList {
  %ignore.number = $ignore(0)
  if (%ignore.number != 0) {
    var %ign.i = 1
    while (%ign.i <= %ignore.number) {
      did -a ignoreListDialog 761 $ignore(%ign.i)
      inc %ign.i 1
    }
    ;did -f ignoreListDialog $did(761,1)
    set.ignore.types  1
  }
  else {
    var %message = Ignore list is empty
    did -a ignoreListDialog 761 %message
  }
  if ($ignore == $true) { did -c ignoreListDialog 772 }
  else { did -u ignoreListDialog 772  }
}

;show the switches
alias -l  set.ignore.types {
  var %ign.j = 766
  while (%ign.j <= 771) {
    did -u ignoreListDialog %ign.j
    inc %ign.j 1
  }      
  %ign.j = 1 
  var %types.max = $numtok($ignore($1).type,44)
  while (%ign.j <= %types.max) {
    if (private isin $gettok($ignore($1).type,%ign.j,44)) { did -c ignoreListDialog 766 }  
    if (channel isin $gettok($ignore($1).type,%ign.j,44)) { did -c ignoreListDialog 767 }  
    if (notice isin $gettok($ignore($1).type,%ign.j,44)) { did -c ignoreListDialog 768 }  
    if (ctcp isin $gettok($ignore($1).type,%ign.j,44)) { did -c ignoreListDialog 769 }  
    if (invite isin $gettok($ignore($1).type,%ign.j,44)) { did -c ignoreListDialog 770 }  
    if (codes isin $gettok($ignore($1).type,%ign.j,44)) { did -c ignoreListDialog 771 }  
    inc %ign.j 1
  }
}

ON *:DIALOG:ignoreListDialog:INIT:0:setIgnoreList

ON *:DIALOG:ignoreListDialog:SCLICK:761:set.ignore.types $did(761).sel

;delete button
ON *:DIALOG:ignoreListDialog:SCLICK:762:{
  var %no.ignore = Ignore list is empty
  if (($did(761).sel != $null) && (%no.ignore !isin $did(761,$did(761).sel))) { 
    var %selected.item = $did(761).sel
    ignore -r $did(761,%selected.item)
    did -d ignoreListDialog 761 $did(761).sel 
    var %ign.j = 766
    while (%ign.j <= 771) {
      did -u ignoreListDialog %ign.j
      inc %ign.j 1
    }     
  }
  else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Error no entry selected }
}


;"delete all" button
ON *:DIALOG:ignoreListDialog:SCLICK:763:{
  var %no.ignore = Ignore list is empty
  var %ignore.number = $ignore(0)
  if  ((%ignore.number != 0) && (%no.ignore !isin $did(761,$did(761).sel))) {
    var %ign.i = 1
    while (%ign.i <= $ignore(0)) {
      did -d ignoreListDialog 761 1
      inc %ign.i 1
    }
    ignore -r
    did -a ignoreListDialog 761 Ignore list is empty
  }
  else { did -ra ignoreListDialog 761 Ignore list is empty }
  var %ign.j = 766
  while (%ign.j <= 771) {
    did -u ignoreListDialog %ign.j
    inc %ign.j 1
  }     
}


;"update" button
ON *:DIALOG:ignoreListDialog:SCLICK:764:{
  var %no.ignore = Ignore list is empty
  if (($did(761).sel != $null) && (%no.ignore !isin $did(761,$did(761).sel))) { 
    var %update.switches
    var %switch.selected = 0
    if ($did(766).state == 1) { %update.switches = %update.switches $+ p | inc %switch.selected 1 }
    if ($did(767).state == 1) { %update.switches = %update.switches $+ c | inc %switch.selected 1 }
    if ($did(768).state == 1) { %update.switches = %update.switches $+ n | inc %switch.selected 1 }
    if ($did(769).state == 1) { %update.switches = %update.switches $+ t | inc %switch.selected 1 }
    if ($did(770).state == 1) { %update.switches = %update.switches $+ i | inc %switch.selected 1 }
    if ($did(771).state == 1) { %update.switches = %update.switches $+ k | inc %switch.selected 1 }
    if (%switch.selected >= 1) { 
      var %selected.item = $did(761).sel
      .ignore -r $did(761,%selected.item)
      ignore - $+ %update.switches $did(761,%selected.item)
      did -c ignoreListDialog 772
    }    
    else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Update ignore canceled. no ignore type were selcted }
  }
  else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Update ignore canceled. no valid user were selcted }
}

ON *:DIALOG:ignoreListDialog:SCLICK:760:{
  if ($did(772).state == 1) { 
    .ignore on 
    if ($ignore(0) != 0) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Ignore was $+ $cxs(1) Enabled }
  }
  else { 
    if ($ignore(0) != 0) { echo $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Ignore was $+ $cxs(1) Disabled }
    .ignore off 
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
