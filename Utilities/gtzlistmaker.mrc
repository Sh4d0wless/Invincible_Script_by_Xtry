;___________________________________________
; Invincible by Xtry
; List Maker
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias dialist { if ($dialog(list)) dialog -v list | else dialog -m list list }
dialog list {
  size -1 -1 300 251
  title "List Maker"
  icon graph/listm.ico
  button "Close",1, 215 225 75 22, OK
  box "List Maker",2, 5 5 290 215
  box "",3, 15 19 270 66
  text "List Directory:",4, 25 38 70 20
  edit "",5, 101 36 145 20, read autohs
  button "...",6, 250 36 25 20
  text "List Filename:",7, 25 58 70 20
  edit "",8, 101 56 175 20 autohs
  box "",9, 15 82 140 80
  text "File Type:",10, 25 97 55 20
  radio "All Files (*.*)",11, 25 115 77 20
  radio "Specific",12, 25 135 75 20
  text "-->",13, 86 138 20 20
  edit "",14, 106 135 42 20, autohs
  box "",15, 158 82 127 80
  text "Total Directories:",16, 165 97 115 20
  text "Total Files:",17, 165 117 115 20
  button "Goto Directory",18, 169 137 105 21
  button "Start List Maker!",19, 15 225 105 22
  box "",20, 15 160 270 55
  check "Run list file when creation is complete.",21, 25 169 210 20
  text "&Approximate Creation Time:",22, 25 193 245 20
}
on *:dialog:list:sclick:*: {
  if ($did == 6) { setlist }
  if ($did == 18) { .run %listdir }
  if ($did == 11) { set %file.type *.* | did -b $dname 14 | did -ra $dname 14 %file.type }
  if ($did == 12) { did -e $dname 14 }
  if ($did == 19) {
    if (%listdir == $null) || (%list.file == $null) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You must set the list directory and file name first | halt }
    else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Now creating your file list.  This procedure can take a long time depending on the amount of files you have in the directory. %name will temporarily be locked up during this time so Please be patient. | .timer 1 1 listmake }
  }
  if ($did == 21) { if ($did($dname,$did).state == 1) { set %run_list on } | else { set %run_list off } }
}
on *:dialog:list:edit:*: {
  if ($did == 14) { set %file.type $did(14) }
  if ($did == 8) { set %list.file $did(8) }
}
on *:dialog:list:init:0: {
  did -a $dname 5 %listdir
  did -a $dname 8 %list.file
  did -a $dname 14 %file.type
  did -a list 17 Total Files: $findfile(%listdir,*,*) 
  did -a list 16 Total Directories: $finddir(%listdir,*,*) 
  if (%run_list == on) { did -c $dname 21 }
  if (%file.type == *.*) { did -c $dname 11 | did -b $dname 14 }
  if (%file.type != *.*) { did -c $dname 12 | did -e $dname 14 }
  refresh_list
}
alias refresh_list {
  if ($findfile(%listdir,*,*) <= 100) { did -a list 22 &Approximate Creation Time: 25 seconds or less. }
  if ($findfile(%listdir,*,*) > 100) && ($findfile(%listdir,*,*) <= 200) { did -a list 22 &Approximate Creation Time: 50 seconds or less. }
  if ($findfile(%listdir,*,*) > 200) && ($findfile(%listdir,*,*) <= 300) { did -a list 22 &Approximate Creation Time: 1 minute or less. }
  if ($findfile(%listdir,*,*) > 300) && ($findfile(%listdir,*,*) <= 400) { did -a list 22 &Approximate Creation Time: 2 minutes or less. }
  if ($findfile(%listdir,*,*) > 400) && ($findfile(%listdir,*,*) <= 500) { did -a list 22 &Approximate Creation Time: 3 minutes or less. }
  if ($findfile(%listdir,*,*) > 500) && ($findfile(%listdir,*,*) <= 600) { did -a list 22 &Approximate Creation Time: 4 minutes or less. }
  if ($findfile(%listdir,*,*) > 500) && ($findfile(%listdir,*,*) <= 1000) { did -a list 22 &Approximate Creation Time:  5 minutes or less. }
  if ($findfile(%listdir,*,*) > 1000) && ($findfile(%listdir,*,*) <= 2000) { did -a list 22 &Approximate Creation Time:  6 minutes or less. }
  if ($findfile(%listdir,*,*) > 2000) && ($findfile(%listdir,*,*) <= 3000) { did -a list 22 &Approximate Creation Time:  7 minutes or less. }
  if ($findfile(%listdir,*,*) > 3000) { did -a list 22 &Approximate Creation Time: 10 minutes or greater. }
}
alias setlist { .timersetlist -m 1 1 setlist_now }
alias setlist_now { set %listdir $$sdir="Select Directory To Make List From" | did -ra list 5 %listdir | did -a list 17 Total Files: $findfile(%listdir,*,*) | did -a list 16 Total Directories: $finddir(%listdir,*,*) | refresh_list }
alias listmake {
  set %listnum
  write -c %list.file
  write %list.file -
  write %list.file - « « « %name2 List Maker » » »
  write %list.file - 
  write %list.file -  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  write %list.file -
  write %list.file ««[ %listdir $+ %file.type ]»»
  write %list.file -
  :list
  inc %listnum 1
  if ($findfile(%listdir,%file.type,%listnum) == $null)  goto end 
  if ($nofile($findfile(%listdir,%file.type,%listnum)) != %mp3dir) { 
    set %mp3dir $nofile($findfile(%listdir,%file.type,%listnum))
    write %list.file -
    write %list.file ««[ $nofile($findfile(%listdir,%file.type,%listnum)) ]»»
    write %list.file -
  }
  if ($findfile(%listdir,%file.type,%listnum) != $null) { 
    write %list.file $chr(91) $+ $chr(35) $+ %listnum $+ / $+ $round($calc($lof($findfile(%listdir,%file.type,%listnum)) / 1000000),2) $+ mb] $nopath($findfile(%listdir,%file.type,%listnum))
    goto list
  }
  :end
  write %list.file - 
  write %list.file -  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  write %list.file -
  write %list.file « « « %name2 List Maker » » »
  write %list.file -
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Your list is complete.  It has been saved to $+ $cxs(1) $mircdir $+ %list.file
  if (%run_list == on) { run %list.file }
  :end2
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
