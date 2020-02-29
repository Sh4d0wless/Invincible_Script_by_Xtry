;___________________________________________
; Invincible by Xtry
; File Server
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias fservx { if ($dialog(fserve1)) dialog -v fserve1 | else dialog -m fserve1 fserve1 }
dialog fserve1 {
  size -1 -1 580 390
  title "File Server Setup"
  icon graph/down.ico
  button "OK",1, 30 362 85 20, OK
  check "Enable on Start-Up",2, 15 338 115 20
  button "Start Fserve",3, 400 340 75 20
  button "Stop Fserve",4, 495 340 75 20
  button "Run Silent",444, 400 360 75 20
  button "Say Ad",445, 495 360 75 20
  button "Setup File Server Colors",446, 170 340 162 20
  button "Clear All File Server Info",447, 170 360 162 20
  tab "General",6, 15 15 550 320
  tab "Stats",7
  tab "Multiple Drives",8
  box "",10, 35 50 270 80, tab6  
  text "Max Sends",13, 60 72 100 20, tab6
  edit "",14, 125 70 30 20, tab6
  text "Max Queues",17, 170 72 100 20, tab6
  edit "",18, 245 70 30 20, tab6
  button "Open Queue Manager",188, 90 100 165 20, tab6
  box "Trigger Format and Slot Announcer",23, 35 137 270 40, tab6  
  radio "!Trigger",24, 55 155 65 15, tab6 check group
  radio "/Ctcp",25, 125 155 65 15, tab6 check
  check "Slot Announcer",256, 199 153 97 20, tab6
  ;button "Trigger 1",880, 45 192 60 18, tab6
  ;button "Trigger 2",881, 106 192 60 18, tab6
  ;button "Trigger 3",882, 167 192 60 18, tab6
  ;button "Trigger 4",883, 228 192 60 18, tab6
  ;button "Trigger 5",884, 289 192 60 18, tab6
  text "Trigger",26, 45 192 55 20, tab6  
  edit "",27, 120 190 230 20, tab6 autohs
  text "Note:",28, 45 212 100 20, tab6
  edit "",29, 120 210 230 20, tab6 autohs
  text "Directory",30, 45 232 55 20, tab6
  icon 31, 350 230 35 20, graph/browx.jpg, tab6
  edit "",32, 120 230 230 20, tab6 autohs
  text "Welcome",33, 45 252 55 20, tab6
  icon 34, 350 250 35 20, graph/browx.jpg, tab6
  edit "",35, 120 250 190 20, tab6 autohs
  button "Create",542, 310 250 40 20, tab6
  box "Channel Advertising",36, 325 50 200 130, tab6
  edit "",500, 335 70 125 20, autohs tab6  
  list 501, 335 90 125 75, tab6 vsbar 
  button "Add",38, 465 70 45 20, tab6
  button "Rem",40, 465 95 45 20, tab6
  button "Clear All",41, 465 130 45 20, tab6
  check "Advertise in All Channels",42, 355 155 135 20, tab6 
  box "",43, 25 40 530 285, tab6
  box "",44, 35 180 350 100, tab6
  box "",45, 395 180 150 100, tab6
  check "Min CPS",46, 405 207 65 20, tab6
  edit "",47, 485 205 45 20, tab6 autohs
  text "Max Users",48, 405 227 65 20, tab6
  edit "",49, 485 225 45 20, tab6 autohs
  text "Ad Delay (secs)",50, 405 247 100 20, tab6
  edit "",51, 485 245 45 20, tab6 autohs
  box "",75, 30 50 520 220, tab7
  text "Accessed:",76, 75 99 65 20, tab7
  edit "",77, 145 97 135 20, tab7 center autohs read
  text "Files Sent:",78, 75 122 65 20, tab7
  edit "",79, 145 120 135 20, tab7 center autohs read
  text "Failed Sends:",82, 75 145 65 20, tab7
  edit "",83, 145 143 135 20, tab7 center autohs read
  text "Bytes Sent:",99, 75 169 65 20, tab7
  edit "",100, 145 167 135 20, tab7 center autohs read
  text "Top CPS:",101, 75 192 65 20, tab7
  edit "",102, 145 190 135 20, tab7 center autohs read
  box "Statistics",103, 55 75 250 150, tab7
  box "Reset Stats",109, 360 75 150 150, tab7
  button "Accessed",84, 390 97 90 20, tab7
  button "Files Sent",85, 390 120 90 20, tab7
  button "Failed Sends",86, 390 143 90 20, tab7
  button "Bytes Sent",87, 390 167 90 20, tab7
  button "Top CPS",88, 390 190 90 20, tab7
  box "Ad Appearance",91, 35 280 510 40, tab6
  radio "Inv1 Style",92, 95 295 75 20, tab6 group
  radio "Inv2 Style",93, 185 295 105 20, tab6
  radio "Inv3 Style",94, 305 295 105 20, tab6
  radio "Inv4 Style",95, 425 295 105 20, tab6
  box "Multiple Drive Settings",200, 30 50 525 250, tab8
  box "Drive Setup",201, 41 72 296 223, tab8
  box "Description",555, 341 72 207 223, tab8
  check "Drive 1",202, 65 90 55 20, tab8
  edit "",203, 135 90 160 20, tab8 read
  icon 204, 300 90 25 20, graph/browx.jpg, tab8
  check "Drive 2",205, 65 110 55 20, tab8
  edit "",206, 135 110 160 20, tab8 read
  icon 207, 300 110 25 20, graph/browx.jpg, tab8
  check "Drive 3",208, 65 130 55 20, tab8
  edit "",209, 135 130 160 20, tab8 read
  icon 210, 300 130 25 20, graph/browx.jpg, tab8
  check "Drive 4",211, 65 150 55 20, tab8
  edit "",212, 135 150 160 20, tab8 read
  icon 213, 300 150 25 20, graph/browx.jpg, tab8
  check "Drive 5",214, 65 170 55 20, tab8
  edit "",215, 135 170 160 20, tab8 read
  icon 216, 300 170 25 20, graph/browx.jpg, tab8
  check "Drive 6",218, 65 190 55 20, tab8
  edit "",219, 135 190 160 20, tab8 read
  icon 220, 300 190 25 20, graph/browx.jpg, tab8
  check "Drive 7",221, 65 210 55 20, tab8
  edit "",222, 135 210 160 20, tab8 read
  icon 223, 300 210 25 20, graph/browx.jpg, tab8
  check "Drive 8",224, 65 230 55 20, tab8
  edit "",225, 135 230 160 20, tab8 read
  icon 226, 300 230 25 20, graph/browx.jpg, tab8
  check "Drive 9",227, 65 250 55 20, tab8
  edit "",228, 135 250 160 20, tab8 read
  icon 229, 300 250 25 20, graph/browx.jpg, tab8
  check "Drive 10",230, 65 270 58 20, tab8
  edit "",231, 135 270 160 20, tab8 read
  icon 232, 300 270 25 20, graph/browx.jpg, tab8
  check "Enable Multi-Drive",217, 65 308 120 20, tab8
  edit "",235, 346 90 153 20, autohs tab8 read
  edit "",236, 346 110 153 20, autohs tab8 read
  edit "",237, 346 130 153 20, autohs tab8 read
  edit "",238, 346 150 153 20, autohs tab8 read
  edit "",239, 346 170 153 20, autohs tab8 read
  edit "",240, 346 190 153 20, autohs tab8 read
  edit "",241, 346 210 153 20, autohs tab8 read
  edit "",242, 346 230 153 20, autohs tab8 read
  edit "",243, 346 250 153 20, autohs tab8 read
  edit "",244, 346 270 153 20, autohs tab8 read
  button "Change",245, 501 90 42 20, tab8 read
  button "Change",246, 501 110 42 20, tab8
  button "Change",247, 501 130 42 20, tab8
  button "Change",248, 501 150 42 20, tab8
  button "Change",249, 501 170 42 20, tab8
  button "Change",250, 501 190 42 20, tab8
  button "Change",251, 501 210 42 20, tab8
  button "Change",252, 501 230 42 20, tab8
  button "Change",253, 501 250 42 20, tab8
  button "Change",254, 501 270 42 20, tab8
  button "Clear Drives",355, 346 308 100 20, tab8
  button "Clear Descriptions",356, 446 308 100 20, tab8
}
on *:DIALOG:fserve1:init:0: {
  if (%auto.fserve == on) { did -c $dname 2 }
  did -o fserve1 203 1 %fserve.drive1 $did(203)
  did -o fserve1 206 1 %fserve.drive2 $did(206)
  did -o fserve1 209 1 %fserve.drive3 $did(209)
  did -o fserve1 212 1 %fserve.drive4 $did(212)
  did -o fserve1 215 1 %fserve.drive5 $did(215)
  if (%f.minc == off) || (%f.minc == $null) { did -b fserve1 47 }
  if (%f.minc == on) { did -c fserve1 46 | did -e $dname 47 }
  if (%fserve.multidrive == On) { did -c $dname 217 }
  if (%mdrive1 == On) { did -c $dname 202  }
  if (%mdrive2 == On) { did -c $dname 205  }
  if (%mdrive3 == On) { did -c $dname 208 }
  if (%mdrive4 == On) { did -c $dname 211  }
  if (%mdrive5 == On) { did -c $dname 214  }
  if (%mdrive6 == On) { did -c $dname 218 }
  if (%mdrive7 == On) { did -c $dname 221 }
  if (%mdrive8 == On) { did -c $dname 224 }
  if (%mdrive9 == On) { did -c $dname 227 }
  if (%mdrive10 == On) { did -c $dname 230 }
  did -a fserve1 235 %fserve.drive1.desc 
  did -a fserve1 236 %fserve.drive2.desc 
  did -a fserve1 237 %fserve.drive3.desc 
  did -a fserve1 238 %fserve.drive4.desc 
  did -a fserve1 239 %fserve.drive5.desc 
  did -a fserve1 240 %fserve.drive6.desc 
  did -a fserve1 241 %fserve.drive7.desc 
  did -a fserve1 242 %fserve.drive8.desc 
  did -a fserve1 243 %fserve.drive9.desc 
  did -a fserve1 244 %fserve.drive10.desc 
  if (%fserve.adtype == Inv1) { did -c $dname 92 }
  if (%fserve.adtype == Inv2) { did -c $dname 93 }
  if (%fserve.adtype == Inv3) { did -c $dname 94 }
  if (%fserve.adtype == Inv4) { did -c $dname 95 }
  if (%offer == $null) { set %offer I'm using %name by %auname }
  did -o fserve1 18 1 %total.queue $did(18)
  did -o fserve1 14 1 %total.sends $did(14)
  did -o fserve1 27 1 %trigger $did(27)
  did -o fserve1 29 1 %offer $did(29)
  did -o fserve1 32 1 %fserv.dir $did(32)
  did -o fserve1 35 1 %fserv.wf $did(35) 
  did -o fserve1 47 1 %min.cps $did(47)
  did -o fserve1 49 1 %max.users $did(49)
  did -o fserve1 51 1 %fserv.delay $did(51)
  did -m fserve1 203 %fserve.drive1 
  did -m fserve1 206 %fserve.drive2 
  did -m fserve1 209 %fserve.drive3 
  did -m fserve1 212 %fserve.drive4 
  did -m fserve1 215 %fserve.drive5 
  did -a fserve1 219 %fserve.drive6
  did -a fserve1 222 %fserve.drive7
  did -a fserve1 225 %fserve.drive8
  did -a fserve1 228 %fserve.drive9
  did -a fserve1 231 %fserve.drive10
  if (%top.cps == $null) && (%ptop.cps == $null) { set %top.cps n/a | set %ptop.cps n/a }
  did -o fserve1 102 1 %top.cps cps by %Ptop.cps $did(102)
  if (%fs.slot == on) { did -c fserve1 256 1 %fs.slot }
  if (%users.served == $null) { set %users.served 0 }
  did -o fserve1 77 1 %users.served $did(77)
  if (%sent2 == $null) { set %sent2 0 }
  did -o fserve1 100 1 %sent2 $did(100)
  if (%send.fail == $null) { set %send.fail 0 }
  did -a fserve1 83 %send.fail 
  if (%files.sent == $null) { set %files.sent 0 }  
  did -o fserve1 79 1 %files.sent $did(79)
  did -m fserve1 102 1 %stats.cps $did(102)
  did -m fserve1 32 1 %fserv.dir $did(32)
  did -m fserve1 35 1 %fserv.wf $did(35)
  if (%fserv.all == off) { did -e $dname 500,501,40,41,38 }
  if (%fserv.all == on) { did -b $dname 500,501,40,41,38 | did -c $dname 42 }
  if (%fse == $null) { set %fse 0 }
  if (%trig.type == !Trigger) { did -c fserve1 24 1 %trig.type $did(24) }
  if (%trig.type == /ctcp) { did -c fserve1 25 1 %trig.type $did(25) }
  /set %z 0
  :loop
  /inc %z 1
  if ($read -l [ $+ [ %z ] ] utilities/fservchan.txt == $null) { goto end }
  else { /did -a fserve1 501 $read -l $+ %z utilities/fservchan.txt | goto loop }
  :end
}
on *:dialog:fserve1:edit:*:{
  if ($did == 14) { set %total.sends $did(14) }
  if ($did == 18) { set %total.queue $did(18) }
  if ($did == 27) { set %trigger $did(27) }
  if ($did == 29) { set %offer $did(29) }
  if ($did == 32) { set %fserv.dir $did(32) }
  if ($did == 35) { set %fserve.wf $did(35) }
  if ($did == 47) { set %min.cps $did(47) }
  if ($did == 49) { set %max.users $did(49) }
  if ($did == 51) { set %fserv.delay $did(51) }
}
on *:dialog:fserve1:sclick:*: {
  if ($did == 542) { run Fserve_welcome.txt | set %fserv.wf fserve_welcome.txt | did -a fserve1 35 %fserv.wf }
  if ($did == 2) { if ($did($dname,$did).state == 1) { set %auto.fserve On } | else { set %auto.fserve Off } }
  if ($did == 202) { if ($did($dname,$did).state == 1) { set %mdrive1 On } | else { set %mdrive1 Off } }
  if ($did == 205) { if ($did($dname,$did).state == 1) { set %mdrive2 On } | else { set %mdrive2 Off } }
  if ($did == 208) { if ($did($dname,$did).state == 1) { set %mdrive3 On } | else { set %mdrive3 Off } }
  if ($did == 211) { if ($did($dname,$did).state == 1) { set %mdrive4 On } | else { set %mdrive4 Off } }
  if ($did == 214) { if ($did($dname,$did).state == 1) { set %mdrive5 On } | else { set %mdrive5 Off } }
  if ($did == 218) { if ($did($dname,$did).state == 1) { set %mdrive6 On } | else { set %mdrive6 Off } }
  if ($did == 221) { if ($did($dname,$did).state == 1) { set %mdrive7 On } | else { set %mdrive7 Off } }
  if ($did == 224) { if ($did($dname,$did).state == 1) { set %mdrive8 On } | else { set %mdrive8 Off } }
  if ($did == 227) { if ($did($dname,$did).state == 1) { set %mdrive9 On } | else { set %mdrive9 Off } }
  if ($did == 230) { if ($did($dname,$did).state == 1) { set %mdrive10 On } | else { set %mdrive10 Off } }
  if ($did == 217) { if ($did($dname,$did).state == 1) { set %fserve.multidrive On } | else { set %fserve.multidrive off } }
  if ($did == 355) { unset %fserve.drive1 | unset %fserve.drive2 | unset %fserve.drive3 | unset %fserve.drive4 | unset %fserve.drive5 | unset %fserve.drive6 | unset %fserve.drive7 | unset %fserve.drive8 | unset %fserve.drive9 | unset %fserve.drive10 | set %mdrive1 Off | set %mdrive2 Off | set %mdrive3 Off | set %mdrive4 Off | set %mdrive5 Off | set %mdrive6 Off | set %mdrive7 Off | set %mdrive8 Off | set %mdrive9 Off | set %mdrive10 Off | did -r $dname 203,206,209,212,215,219,222,225,228,231 | did -u $dname 202,205,208,211,214,218,221,224,227,230 }
  if ($did == 356) { unset %fserve.drive1.desc | unset %fserve.drive2.desc | unset %fserve.drive3.desc | unset %fserve.drive4.desc | unset %fserve.drive5.desc | unset %fserve.drive6.desc | unset %fserve.drive7.desc | unset %fserve.drive8.desc | unset %fserve.drive9.desc | unset %fserve.drive10.desc | did -r $dname 235,236,237,238,239,240,241,242,243,244 }
  if ($did == 24) { set %trig.type !Trigger }
  if ($did == 25) { set %trig.type /ctcp }
  if ($did == 880) { dialog -m trig1 trig1 }
  if ($did == 881) { dialog -m trig2 trig2 }
  if ($did == 882) { dialog -m trig3 trig3 }
  if ($did == 883) { dialog -m trig4 trig4 }
  if ($did == 884) { dialog -m trig5 trig5 }
  if ($did == 188) { dialog -m queues queues }
  if ($did == 92) { set %fserve.adtype Inv1 | echoInv1 }
  if ($did == 93) { set %fserve.adtype Inv2 | echoInv2 }
  if ($did == 94) { set %fserve.adtype Inv3 | echoInv3 }
  if ($did == 95) { set %fserve.adtype Inv4 | echoInv4 }
  if ($did == 3) { if (%trig.type == $null) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You must set the Trigger type first | halt } | else { set %fs On | /fservestart | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Server has been started. | .timercps 0 60 Checkcps } }
  if ($did == 4) { set %fs Off | /fservestop | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Server has been halted | .timercps off } 
  if ($did == 31) { setdir }
  if ($did == 34) { setdir2 }
  if ($did == 204) { setm1 }
  if ($did == 207) { setm2 }
  if ($did == 210) { setm3 }
  if ($did == 213) { setm4 }
  if ($did == 216) { setm5 }
  if ($did == 220) { setm6 }
  if ($did == 223) { setm7 }
  if ($did == 226) { setm8 }
  if ($did == 229) { setm9 }
  if ($did == 232) { setm10 }
  if ($did == 245) { .timer -m 1 1 changedesc1 }
  if ($did == 246) { .timer -m 1 1 changedesc2 }
  if ($did == 247) { .timer -m 1 1 changedesc3 }
  if ($did == 248) { .timer -m 1 1 changedesc4 }
  if ($did == 249) { .timer -m 1 1 changedesc5 }
  if ($did == 250) { .timer -m 1 1 changedesc6 }
  if ($did == 251) { .timer -m 1 1 changedesc7 }
  if ($did == 252) { .timer -m 1 1 changedesc8 }
  if ($did == 253) { .timer -m 1 1 changedesc9 }
  if ($did == 254) { .timer -m 1 1 changedesc10 }
  if ($did == 24) { set %trig.type !Trigger }
  if ($did == 25) { set %trig.type /ctcp }
  if ($did == 311) { unset %fserv.dir | did -o fserve1 32 1 %fserv.dir }
  if ($did == 312) { unset %fserv.wf | did -o fserve1 35 1 %fserv.wf }
  if ($did == 84) { unset %users.served | did -r fserve1 77 1 did(77) }
  if ($did == 85) { unset %files.sent | did -r fserve1 79 }
  if ($did == 86) { unset %send.fail | did -r fserve1 83 1 $did(83) }
  if ($did == 42) { if ($did($dname,$did).state == 1) { did -b $dname 500,501,40,41,38 | set %fserv.all on } | else { did -e $dname 500,501,40,41,38 | set %fserv.all off } } 
  if ($did == 85) { unset %sent | did -r fserve1 79 1 $did(79) }
  if ($did == 88) { unset %top.cps | unset %ptop.cps | did -r fserve1 102 1 n/a $did(102) }
  if ($did == 87) { unset %sent2 | did -r fserve1 100 1 $did(100) }
  if ($did == 444) { set %fs On | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Server has been started silently }
  if ($did == 445) { msg $active $fservead2 }
  if ($did == 446) { dialog -m colors colors }
  if ($did == 447) { unset %total.sends | unset %total.queue unset %fserv.wf | unset %trigger | unset %offer | unset %fserv.dir | unset %fserve.wf | unset %min.cps | unset %max.users | unset %fserv.delay | did -o fserve1 14 1 %total.sends | did -o fserve1 18 1 %total.queue | did -o fserve1 27 1 %trigger | did -o fserve1 29 1 %offer | did -o fserve1 32 1 %fserv.dir | did -o fserve1 35 1 %fserv.wf | did -o fserve1 47 1 %min.cps | did -o fserve1 49 1 %max.users | did -o fserve1 51 1 %fserv.delay | /write -c utilities/fservchan.txt | unset %fservc.* | did -r fserve1 501 $did(500).text | set %fse 0 | did -r fserve1 35 }
  if ($did == 46) { if ($did($dname,$did).state == 1) { did -e $dname 47 | set %f.minc on } | else { did -b $dname 47 | set %f.minc off } }
  if ($did == 256) { if ($did($dname,$did).state == 1) { set %fs.slot on } | else { set %fs.slot off } }
  if ($did == 38) {
    inc %fse 1    
    /write utilities/fservchan.txt $did(500).text
    /set %fservc. $+ %fse $did(500).text
    /did -a fserve1 501 $did(500).text
    did -r fserve1 500
  }
  if ($did == 40) {
    dec %fse 1
    /write -ds [ $+ [ $did($dname,501,$did(501).sel).text ]  ] utilities/fservchan.txt  
    /unset %fservc. [ $+ [ $did(501).sel ] ]
    /did -d fserve1 501 $did(501).sel
  }
  if ($did == 41) {
    /write -c utilities/fservchan.txt
    /unset %fservc.*
    /did -r fserve1 501 $did(500).text
    /set %fse 0
  }
}
alias echoInv1 { .echo -a Example : 10.:4File Server Online10:.:Trigger04 ! $+ %name $+ 10:.:Accessed04 103 times $+ 10:.:Total Files04 1194 $+ 10:.:Min CPS04 10000 $+ 10:.:Top CPS04 23592 cps set by %auname $+ 10:.:Online04 0/5 $+ 10:.:Sends04 1/3 $+ 10:.:Queues04 0/8 $+ 10:.:Note04 I'm using %name by %auname $+ 10:. %name }
alias echoInv2 { .echo -a Example : 11,5«0File Server Online11» «0Trigger08 ! $+ %name $+ 11» «0Accessed08 103 times $+ 11» «0ToTal Files08 1194 $+ 11» «0Min CPS08 10000 $+ 11» «0Top CPS08 23592 cps set by %auname $+ 11» «0Online08 0/5 $+ 11» «0Sends08 1/3 $+ 11» «0Queues08 0/8 $+ 11» «0Note08 I'm using %name by %auname $+ 11» %name }
alias echoInv3 { .echo -a Example : 14[4File Server Online14][Trigger04 ! $+ %name $+ 14][Accessed04 103 times $+ 14][Total Files04 1194 $+ 14][Min CPS04 10000 $+ 14][Top CPS04 23592 cps set by %auname $+ 14][Online04 0/5 $+ 14][Sends04 1/3 $+ 14][Queues04 0/8 $+ 14][Note04 I'm using %name by %auname $+ 14] %name }
alias echoInv4 { .echo -a Example : 0,10[4File Server Online0][Trigger04 ! $+ %name $+ 0][Accessed04 103 times $+ 0][Total Files04 1194 $+ 0][Min CPS04 10000 $+ 0][Top CPS04 23592 cps set by %auname $+ 0][Online04 0/5 $+ 0][Sends04 1/3 $+ 0][Queues04 0/8 $+ 0][Note04 I'm using %name by %auname $+ 0] %name }
alias setdir { .timersetdir -m 1 1 setdir_now }
alias setdir_now { set %fserv.dir $$sdir="Select Fserve Directory" | did -o fserve1 32 1 %fserv.dir }
alias setdir2 { .timersetdir2 -m 1 1 setdir_now2 }
alias setdir_now2 { set %fserve.wf $dir="Select Welcome File" | did -o fserve1 35 1 %fserve.wf }
alias fservesilent { set %fs On }
alias checkcps {
  if (%min.cps = off) /halt
  /set %y 0
  /set %y2 $send(0)
  :nextu
  if (%y >= %y2) /halt
  /inc %y 1
  if ($send(%y).cps = n/a) { goto nextu }
  if (($send(%y) != $null) && ($send(%y).cps < %min.cps)) {
    if (($fserv($send(%y)) != $null) && ($fserv($send(%y)).status != inactive) && ($fserv($send(%y)).status != waiting)) {
      /msg = $+ $send(%y) (File Server) Sorry, your send has been less than the minimum cps of %min.cps $+ .Your send has been cancelled
      /close -s $send(%y) | .timer 1 1 Queue.Send 
      goto nextu
    }
    notice.p $send(%y) (File Server) Sorry, your send has been less than the minimum cps of %min.cps $+ .Your send has been cancelled
    /close -s $send(%y) | .timer 1 1 Queue.Send 
  }
  goto nextu
}
on *:SERV:*: {
  if ($1 == !Home) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Home Drive...) | close -f $nick | .timer 1 3 fserve $nick 1 %fserv.dir | halt }
  if ($1 == !Drive1) && (%mdrive1 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 1...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive1 | halt }
  if ($1 == !Drive2) && (%mdrive2 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 2...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive2 | halt }
  if ($1 == !Drive3) && (%mdrive3 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 3...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive3 | halt }
  if ($1 == !Drive4) && (%mdrive4 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 4...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive4 | halt }
  if ($1 == !Drive5) && (%mdrive5 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 5...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive5 | halt }
  if ($1 == !Drive1) && (%mdrive6 == off) { msg =$nick $color(Multi-Drive 1 Is Currently) Off | halt }
  if ($1 == !Drive2) && (%mdrive7 == off) { msg =$nick $color(Multi-Drive 2 Is Currently) Off | halt }
  if ($1 == !Drive3) && (%mdrive8 == off) { msg =$nick $color(Multi-Drive 3 Is Currently) Off | halt }
  if ($1 == !Drive4) && (%mdrive9 == off) { msg =$nick $color(Multi-Drive 4 Is Currently) Off | halt }
  if ($1 == !Drive5) && (%mdrive10 == off) { msg =$nick $color(Multi-Drive 5 Is Currently) Off | halt }
  if ($1 == !Drive6) && (%mdrive6 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 6...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive6 | halt }
  if ($1 == !Drive7) && (%mdrive7 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 7...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive7 | halt }
  if ($1 == !Drive8) && (%mdrive8 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 8...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive8 | halt }
  if ($1 == !Drive9) && (%mdrive9 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 9...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive9 | halt }
  if ($1 == !Drive10) && (%mdrive10 == on) && (%fserve.multidrive == on) { msg =$nick $color(Changing to Drive 10...) | close -f $nick | .timer 1 2 fserve $nick 1 %fserve.drive10 | halt }
  if ($1 == !Drive6) && (%mdrive6 == off) { msg =$nick $color(Multi-Drive 6 Is Currently) Off | halt }
  if ($1 == !Drive7) && (%mdrive7 == off) { msg =$nick $color(Multi-Drive 7 Is Currently) Off | halt }
  if ($1 == !Drive8) && (%mdrive8 == off) { msg =$nick $color(Multi-Drive 8 Is Currently) Off | halt }
  if ($1 == !Drive9) && (%mdrive9 == off) { msg =$nick $color(Multi-Drive 9 Is Currently) Off | halt }
  if ($1 == !Drive10) && (%mdrive10 == off) { msg =$nick $color(Multi-Drive 10 Is Currently) Off | halt }
  if ($1 = !Drive1) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
  if ($1 = !Drive2) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
  if ($1 = !Drive3) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
  if ($1 = !Drive4) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
  if ($1 = !Drive5) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
  if ($1 = !Drive6) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
  if ($1 = !Drive7) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
  if ($1 = !Drive8) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
  if ($1 = !Drive9) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
  if ($1 = !Drive10) && (%fserve.multidrive == off) { msg =$nick $color(Multi-Drive Is Currently) Off | halt }
}

alias f.color { if ($dialog(colors)) dialog -v colors | else dialog -m colors colors }
dialog colors {
  size -1 -1 350 325
  title "Setup Fserve add Colors"
  icon graph/down.ico
  button "Ok",1, 284 292 65 30, OK
  box "Script Color Settings",2, 5 5 340 280
  text "Primary Color:",3, 40 31 65 20
  list 4, 40 50 120 100, drop  vsbar 
  text "Secondary Color:",5, 200 31 85 20
  list 6, 200 50 120 100, drop vsbar 
  button "&Random Colors",7, 230 155 95 30
  text "These are the colors that you can set to change the appearance of many ads in the channels.  Choose a primary and a secondary, and keep in mind that many people use black backgrounds.",8, 16 227 325 60
  box "",9, 10 215 330 60
  box "",10, 20 20 310 125
  icon 15, 30 142 175 80, graph/colx.jpg
  check "Disable Colors",16, 230 195 95 20
}
on *:dialog:colors:init:0: {
  did -o Colors 4 1 00 - White
  did -o Colors 4 2 01 - Black
  did -o Colors 4 3 02 - Blue
  did -o Colors 4 4 03 - Green
  did -o Colors 4 5 04 - Red
  did -o Colors 4 6 05 - Brown
  did -o Colors 4 7 06 - Purple
  did -o Colors 4 8 07 - Orange
  did -o Colors 4 9 08 - Yellow
  did -o Colors 4 10 09 - Light Green
  did -o Colors 4 11 10 - Cyan
  did -o Colors 4 12 11 - Light Cyan
  did -o Colors 4 13 12 - Royal Blue
  did -o Colors 4 14 13 - Pink
  did -o Colors 4 15 14 - Grey
  did -o Colors 4 16 15 - Light Grey
  did -o Colors 6 1 00 - White
  did -o Colors 6 2 01 - Black
  did -o Colors 6 3 02 - Blue
  did -o Colors 6 4 03 - Green
  did -o Colors 6 5 04 - Red
  did -o Colors 6 6 05 - Brown
  did -o Colors 6 7 06 - Purple
  did -o Colors 6 8 07 - Orange
  did -o Colors 6 9 08 - Yellow
  did -o Colors 6 10 09 - Light Green
  did -o Colors 6 11 10 - Cyan
  did -o Colors 6 12 11 - Light Cyan
  did -o Colors 6 13 12 - Royal Blue
  did -o Colors 6 14 13 - Pink
  did -o Colors 6 15 14 - Grey
  did -o Colors 6 16 15 - Light Grey
  if (%c1 == 00) { /did -c colors 4 1 }
  if (%c1 == 01) { /did -c colors 4 2 }
  if (%c1 == 02) { /did -c colors 4 3 }
  if (%c1 == 03) { /did -c colors 4 4 }
  if (%c1 == 04) { /did -c colors 4 5 }
  if (%c1 == 05) { /did -c colors 4 6 }
  if (%c1 == 06) { /did -c colors 4 7 }
  if (%c1 == 07) { /did -c colors 4 8 }
  if (%c1 == 08) { /did -c colors 4 9 }
  if (%c1 == 09) { /did -c colors 4 10 }
  if (%c1 == 10) { /did -c colors 4 11 }
  if (%c1 == 11) { /did -c colors 4 12 }
  if (%c1 == 12) { /did -c colors 4 13 }
  if (%c1 == 13) { /did -c colors 4 14 }
  if (%c1 == 14) { /did -c colors 4 15 }
  if (%c1 == 15) { /did -c colors 4 16 }
  if (%c2 == 00) { /did -c colors 6 1 }
  if (%c2 == 01) { /did -c colors 6 2 }
  if (%c2 == 02) { /did -c colors 6 3 }
  if (%c2 == 03) { /did -c colors 6 4 }
  if (%c2 == 04) { /did -c colors 6 5 }
  if (%c2 == 05) { /did -c colors 6 6 }
  if (%c2 == 06) { /did -c colors 6 7 }
  if (%c2 == 07) { /did -c colors 6 8 }
  if (%c2 == 08) { /did -c colors 6 9 }
  if (%c2 == 09) { /did -c colors 6 10 }
  if (%c2 == 10) { /did -c colors 6 11 }
  if (%c2 == 11) { /did -c colors 6 12 }
  if (%c2 == 12) { /did -c colors 6 13 }
  if (%c2 == 13) { /did -c colors 6 14 }
  if (%c2 == 14) { /did -c colors 6 15 }
  if (%c2 == 15) { /did -c colors 6 16 }
}
on *:dialog:colors:sclick:*: {
  if ($did == 16) { if ($did($dname,$did).state == 1) { set %col.check on | did -b $dname 4,6 | unset %c1 | unset %c2 } | else { set %col.check off | did -e $dname 4,6 | set %c1  $+ $gettok($did($dname,4,$did($dname,4).sel).text,1,45) | set %c2  $+ $gettok($did($dname,6,$did($dname,6).sel).text,1,45) } }
  if ($did == 7) { did -c $dname 4 $gettok(3 4 5 6 7 8 9 10 11 13 14 15,$rand(1,10),32) | did -c $dname 6 $gettok(3 4 5 6 7 8 9 10 11 13 14 15,$rand(1,10),32) }
  if ($did == 4) { set %c1  $+ $gettok($did($dname,4,$did($dname,4).sel).text,1,45) }
  if ($did == 6) { set %c2  $+ $gettok($did($dname,6,$did($dname,6).sel).text,1,45) }
}

;Queue Manager
alias quex { if ($dialog(queues)) dialog -v queues | else dialog -m queues queues }
dialog queues {
  size -1 -1 455 170
  title "Queue Manager"
  icon graph/down.ico
  button "Ok",1, 384 148 65 20, OK
  box "Queue Manager",2, 5 5 445 140
  list 3, 20 25 360 120
  button "Delete",4, 385 50 55 30
  button "Refresh",5, 385 80 55 30
}
on *:dialog:queues:init:0: {
  load_queues
}
alias load_queues { 
  if (%Que.1 == $null) { goto end }
  set %que.temp 0
  :loop
  inc %que.temp 1
  did -a queues 3 %Que. [ $+ [ %que.temp ] ] 
  if (%Que. [ $+ [ %que.temp ] ] != $null) { goto loop }
  :end
}
on *:dialog:queues:sclick:*: {
  if ($did == 4) && ($did($dname,3).sel isnum) { did -d $dname 3 $did($dname,3).sel | Que.Del $did($dname,3).sel }
  if ($did == 5) { load_queues }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
