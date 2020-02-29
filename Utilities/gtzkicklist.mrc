;___________________________________________
; Invincible by Xtry
; Kicked User List
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:load: { 
  /write utilities/kick.txt
}
alias kickpl { if ($dialog(kicks)) dialog -v kicks | else dialog -m kicks kicks }
dialog kicks {
  title "Kicked User List"
  size -1 -1 420 279
  icon graph/kickpl.ico
  list 1, 15 25 390 220, hsbar
  box "All the user you have kicked so far :", 2, 5 5 410 240
  box "", 4, 1 282 410 39
  button "Clear List", 9, 5 250 200 25
  button "Close", 7, 215 250 200 25, ok
}
on *:dialog:kicks:init:*:{
  dll $mdllx MarkDialog $dname
  dll $mdllx SetMircVersion $version
  dll dll/mdx.dll SetFont 1,2,7,9 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 7,9 clientedge
  dll $mdllx SetControlMDX $dname 1 listview single  rowselect report flatsb grid labeltip nosortheader > dll/views.mdx
  did -i $dname 1 1 headerdims 700
  did -i $dname 1 1 headertext Kicked User List
  kicklist.init
}
on *:dialog:kicks:sclick:*:{
  if ($did == 1) { did -ra $dname 4 $did(1).seltext }
  if ($did == 5) { $iif($did(3),write utilities/kick.txt $did(3)) | kiclist.init }
  if ($did == 6) { write -ds $+  " $+ $did(1).seltext $+ " utilities/kick.txt | kicklist.init }
  if ($did == 8) { $iif($server,quit $did(1).seltext) }
  if ($did == 9) { $iif($?!="Are you sure you want to clear the kicked People List?" == $false,halt,write -c utilities/kick.txt ) | did -ra $dname 1 | kicklist.init }
}
on *:kick:#: {
  if ($nick == $me) { write utilities/kick.txt $knick in $chan at $time(HH:nn:ss ddd dd mmm yyyy) ( $+ $1- $+ ) }
  else { return }
}
alias kicklist.init {
  set %kix.list 0
  :loop
  inc %kix.list
  if ( %kix.list > $lines(utilities/kick.txt) ) { halt }
  did -a kicks 1 $read(utilities/kick.txt,%kix.list)
  goto loop
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
