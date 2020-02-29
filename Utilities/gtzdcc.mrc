;___________________________________________
; Invincible by Xtry
; DCC Events
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias setgtzdcc {
  set %rec 0
  set %getsize 0
  set %recf 0
  set %sen 0
  set %senf 0
}

on 1:LOAD:{
  set %alienspeed.packetsize 4096
  set %alienspeed.pdcc 99999999999999
  dccgtz
}

on 1:GETFAIL:*.*:{
  inc %recf 1
  if (%incomfile = on) { splay %failed }
  if (%echox.ft = on) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Transfer receiving $+ $cxs(1) $nopath($filename)  $+ $cxs(2) $+ from $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) was failed }
}

on 1:SENDFAIL:*.*:{
  inc %senf 1
  if (%gtzfails = on) { splay %failed }
  if (%echox.ft = on) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Transfer sending $+ $cxs(1) $nopath($filename)  $+ $cxs(2) $+ to $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) was failed }
}

on 1:FILESENT:*.*:{
  inc %sen 1
  inc %getsize $lof($filename)
  if (%sentfi = on) { splay %sent }
  if (%echox.fs = on) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Transfer sending $+ $cxs(1) $nopath($filename)  $+ $cxs(2) $+ to $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) was completed }
  if ($send($nick).cps >= %top.cps) { set %top.cps $send($nick).cps }
}

on 1:FILERCVD:*.*:{
  inc %rec 1
  inc %getsize $lof($filename)
  if (%receifi = on) { splay %downloaded }
  if (%echox.fr = on) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Transfer receiving $+ $cxs(1) $nopath($filename)  $+ $cxs(2) $+ from $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) was completed }
  if (%autor.dcc = on) {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto running file $+ $cxs(1) $nopath($filename)
    .timerunfi 1 3 .run " $+ $filename $+ "
  }
}

on 1:CHAT:*:{
  if (%incomchat = on) { splay %chat }
  if (%echox.ic = on) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Incoming chat request from $+ $cxs(1) $nick $+ $chr(33) $+ $address }
}

;DCC Controls
alias dccgtz { if ($dialog(dccgtz)) dialog -v dccgtz | else dialog -m dccgtz dccgtz }
dialog dccgtz {
  title "DCC Controls"
  size -1 -1 150 68
  icon graph/dcci.ico
  option dbu
  button "Ok",2,112 51 30 10,ok
  box "",6,110 46 34 17
  list 1, 5 5 140 43, size
  button "Reset Stats",3,7 51 35 10
  box "",4,5 46 74 17
  button "DCC Setup",5,42 51 35 10
}
on *:dialog:dccgtz:init:0:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll dll/mdx.dll SetFont 2,1,3,5 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 2,3,5 clientedge
  dll $mdllx SetControlMDX $dname 1 listview single grid rowselect report > dll/views.mdx
  did -i $dname 1 1 headerdims 74:1 100:2 100:3
  did -i $dname 1 1 headertext + 0 Files $+ $chr(9) $+ + 0 Succeed $+ $chr(9) $+ + 0 Failed
  did -a $dname 1 +0 Send $+ $chr(9) %sen $chr(9) %senf
  did -a $dname 1 +0 Receive $+ $chr(9) %rec $chr(9) %recf
  did -a $dname 1 +0 Total $+ $chr(9) $calc(%rec + %sen) $chr(9) $calc(%recf + %senf)
  did -a $dname 1 +0 Size $+ $chr(9) $left($calc(%getsize / 1000000),4) $+ MB $chr(9) n/a
}
on *:dialog:dccgtz:sclick:*:{
  if ($did = 3) { rdccdial }
  if ($did = 5) { sdccgtz }
}

alias rdccdial { if ($dialog(rdccdial)) dialog -v rdccdial | else dialog -m rdccdial rdccdial }
dialog rdccdial {
  title "Reset Options"
  size -1 -1 106 78
  icon graph/dcci.ico
  option dbu
  button "Ok",1,37 63 30 10,ok
  box "",12,35 58 34 17
  box "",2,5 3 95 57
  button "Sent File",3,7 8 45 10
  button "Received File",4,7 18 45 10
  button "Total Transfered",5,7 28 45 10
  button "Failed Send",6,53 8 45 10
  button "Failed Receive",7,53 18 45 10
  button "Total Failed",8,53 28 45 10
  button "Size Transfered",9,7 38 45 10
  button "Reset All",10,53 38 45 10
  edit "",11,7 48 91 10,multi read
}
on *:dialog:rdccdial:init:0:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll dll/mdx.dll SetBorderStyle $dname 1,3,4,5,6,7,8,9,10,11 clientedge
  dll dll/mdx.dll SetFont 1,3,4,5,6,7,8,9,10,10 400 Tahoma
}
on *:dialog:rdccdial:sclick:*:{
  if ($did = 3) { set %sen 0 | did -r $dname 11 | did -a $dname 11 Sent number reset ( $+ %sen $+ ) }
  if ($did = 4) { set %rec 0 | did -r $dname 11 | did -a $dname 11 Received number reset ( $+ %rec $+ ) }
  if ($did = 5) { set %sen 0 | set % rec 0 | did -r $dname 11 | did -a $dname 11  Total transfered number reset ( $+ $calc(%sen + %rec) $+ ) }
  if ($did = 6) { set %senf 0 | did -r $dname 11 | did -a $dname 11 Failed send number reset ( $+ %senf $+ ) }
  if ($did = 7) { set %recf 0 | did -r $dname 11 | did -a $dname 11 Failed receive number reset ( $+ %recf $+ ) }
  if ($did = 8) { set %senf 0 | set %recf 0 | did -r $dname 11 | did -a $dname 11 Total failed number reset ( $+ $calc(%senf + %recf) $+ ) }
  if ($did = 9) { set %getsize 0 | did -r $dname 11 | did -a $dname 11 Transfered size reset ( $+ $left($calc(%getsize / 1000000),4) $+ MB $+ ) }
  if ($did = 10) { setgtzdcc | did -r $dname 11 | did -a $dname 11 All DCC stats reset }
  if ($did = 1) { dialog -k dccgtz dccgtz | .timer 1 0 dccgtz }
}

alias sdccgtz { if ($dialog(sdccgtz)) dialog -v sdccgtz | else dialog -m sdccgtz sdccgtz }
dialog sdccgtz {
  title "DCC Setup"
  size -1 -1 117 95
  icon graph/dcci.ico
  option dbu
  button "Ok",1, 5 80 35 10,ok
  edit "",2,23 10 50 10,center
  box "",3,3 1 110 35
  text "Dcc :",4,7 12 15 7
  text "Pdcc :",5,7 22 17 7
  edit "",6,23 20 50 10,center
  button "Set Dcc Size",7,73 10 35 10
  button "Set Pdcc",8,73 20 35 10
  check "PowerUp DCC on connect",9,7 40 90 10,left
  check "PowerUp DCC on incoming file",10,7 50 90 10,left
  check "Autorun on file received",13,7 60 90 10,left
  box "",11,3 32 110 45
  box "",12,3 75 39 17
}
on *:dialog:sdccgtz:init:*:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll dll/mdx.dll SetBorderStyle $dname 1,7,8 clientedge
  dll dll/mdx.dll SetFont 1,2,4,5,6,7,8,9,10,12 400 Tahoma
  if (%powdcc.conn = on ) { did -c sdccgtz 9 } | else { did -u sdccgtz 9 }
  if (%powdcc.come = on ) { did -c sdccgtz 10 } | else { did -u sdccgtz 10 }
  if (%autor.dcc = on ) { did -c sdccgtz 13 } | else { did -u sdccgtz 13 }
  did -a $dname 2 %alienspeed.packetsize
  did -a $dname 6 %alienspeed.pdcc
}
on *:dialog:sdccgtz:sclick:*:{
  if ($did = 7) { set %alienspeed.packetsize $?="What is the DCC packet size you want? (Standard size is 4096)" | did -r $dname 2 | did -a $dname 2 %alienspeed.packetsize }
  if ($did = 8) { set %alienspeed.pdcc $?="What is the pdcc you wish to have? (This size is auto set)" | did -r $dname 6 | did -a $dname 6 %alienspeed.pdcc }
  if ($did = 9) { if ($did($dname,$did).state == 1) { set %powdcc.conn on } | else { set %powdcc.conn off } }
  if ($did = 10) { if ($did($dname,$did).state == 1) { set %powdcc.come on } | else { set %powdcc.come off } }
  if ($did = 13) { if ($did($dname,$did).state == 1) { set %autor.dcc on } | else { set %autor.dcc off } }
}

on ^*:NOTICE:DCC SEND*:?:{
  if (%dcciopen = on) { dccinfo }
  if (%powdcc.come = on) { powdcc }
  if (%incomfile = on) { splay %dccsend }
  if (%echox.if = on) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Incoming file $+ $cxs(1) $filename  $+ $cxs(2) $+ from $+ $cxs(1) $nick  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
