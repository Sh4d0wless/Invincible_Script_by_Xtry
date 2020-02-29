;___________________________________________
; Invincible by Xtry
; System Info
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias sysi { if ($dialog(sysi)) dialog -v sysi | else dialog -m sysi sysi }
dialog sysi {
  title "System Info"
  icon graph/kompi.ico
  size -1 -1 234 92
  option dbu
  list 1, 3 4 228 68, size
  box "", 2, 2 0 230 73
  box "",6,188 73 44 17
  button "Close", 3, 190 78 40 10,ok
  box "",4,2 73 44 17
  button "Send To Active",5,4 78 40 10
}
on *:DIAlOG:sysi:init:0:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll $mdllx SetControlMDX $dname 1 listview single grid rowselect report > dll/views.mdx
  did -i $dname 1 1 headerdims 120:1 330:2
  did -i $dname 1 1 headertext + 0 System $+ $chr(9) $+ + 0 Info
  did -a $dname 1 +0 Operating System $+ $chr(9) $+ +0 $dll(dll/moo.dll,osinfo,_)
  did -a $dname 1 +0 Central Procesing Unit $+ $chr(9) $+ +0 $dll(dll/moo.dll,cpuinfo,_)
  did -a $dname 1 +0 Memory $+ $chr(9) $+ +0 $dll(dll/moo.dll,meminfo,_)
  did -a $dname 1 +0 Disk Capacity $+ $chr(9) $+ +0 $dll(dll/moo.dll,diskcapacity,_)
  did -a $dname 1 +0 Screen Resolution $+ $chr(9) $+ +0 $dll(dll/moo.dll,screeninfo,_)
  did -a $dname 1 +0 Network Interface $+ $chr(9) $+ +0 $dll(dll/moo.dll,interfaceinfo,_)
  did -a $dname 1 +0 mIRC Version $+ $chr(9) $+ +0 mIRC $+ $bits $version
  did -a $dname 1 +0 Up Time $+ $chr(9) $+ +0 $dll(dll/moo.dll,uptime,_)
}
on *:DIAlOG:sysi:sclick:5:{
  if ($active = $chan) { _xmsg.c (System info) OS: $+ $dll(dll/moo.dll,osinfo,_) CPU: $+ $dll(dll/moo.dll,cpuinfo,_) Memory: $+ $dll(dll/moo.dll,meminfo,_) Disk Capacity: $+ $dll(dll/moo.dll,diskcapacity,_) Screen Resolution: $+ $dll(dll/moo.dll,screeninfo,_) Network Interface: $+ $dll(dll/moo.dll,interfaceinfo,_) mIRC Version: $+ mIRC $+ $bits $version Up Time: $+ $dll(dll/moo.dll,uptime,_) - %name }
  else {
    if (!$server) {  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) System info - OS: $+ $cxs(1) $+ $dll(dll/moo.dll,osinfo,_) $cxs(2) $+ CPU: $+ $cxs(1) $+ $dll(dll/moo.dll,cpuinfo,_) $cxs(2) $+ Memory: $+ $cxs(1) $+ $dll(dll/moo.dll,meminfo,_) $cxs(2) $+ Disk Capacity: $+ $cxs(1) $+ $dll(dll/moo.dll,diskcapacity,_) $cxs(2) $+ Screen Resolution: $+ $cxs(1) $+ $dll(dll/moo.dll,screeninfo,_) $cxs(2) $+ Network Interface: $+ $cxs(1) $+ $dll(dll/moo.dll,interfaceinfo,_) $cxs(2) $+ mIRC Version: $+ $cxs(1) $+ mIRC $+ $bits $version $cxs(2) $+ Up Time: $+ $cxs(1) $+ $dll(dll/moo.dll,uptime,_) $+  | halt }
  _xmsg.q (System info) OS: $+ $dll(dll/moo.dll,osinfo,_) CPU: $+ $dll(dll/moo.dll,cpuinfo,_) Memory: $+ $dll(dll/moo.dll,meminfo,_) Disk Capacity: $+ $dll(dll/moo.dll,diskcapacity,_) Screen Resolution: $+ $dll(dll/moo.dll,screeninfo,_) Network Interface: $+ $dll(dll/moo.dll,interfaceinfo,_) mIRC Version: $+ mIRC $+ $bits $version Up Time: $+ $dll(dll/moo.dll,uptime,_) - %name }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
