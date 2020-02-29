;___________________________________________
; Invincible by Xtry
; Search System
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias dfsearchf { if ($dialog(fsearchf )) dialog -v fsearchf | else dialog -m fsearchf fsearchf }
dialog fsearchf {
  size -1 -1 350 140
  title "Search system"
  icon graph/fsearchf.ico
  button "cancel" 1, 273 90 50 20,cancel
  box "Enter file name to search:" 2, 10 10 330 120
  edit "" 3, 80 40 190 20
  edit "C:\" 4, 80 65 190 20
  text "Search:" 5, 20 42 60 17
  text "Search in:" 6, 20 67 60 17
  button "browse" 7, 273 65 50 20
  button "search" 8, 273 40 50 20
  icon 9, 30 90 40 40, graph/fsearchf.ico
  text "Show results in a:" 10, 80 100 90 17
  combo 11, 170 97 80 60, drop
}
on *:dialog:fsearchf:init:0: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  did -a $dname 11 dialog
  did -a $dname 11 window
  did -c $dname 11 1
  dll dll/mdx.dll SetControlMDX $dname 12 ContextHelp nocontrol > dll/dialog.mdx
}
on *:dialog:fsearchf:Sclick:1: {
  //close -@ @fsearchf-results
}
on *:dialog:fsearchf:sclick:7: {
  did -ra $dname 4 $sdir(c:\)
}
on *:dialog:fsearchf:sclick:8: {
  if ( $did($dname,3).text != $null && $did($dname,4).text != $null && $did($dname,11).sel == 1 ) { dialog -m results results }
  elseif ( $did($dname,3).text != $null && $did($dname,4).text != $null && $did($dname,11).sel == 2 ) { window -lk @fsearchf-Results 100 100 500 400 | clear @fsearchf-results | fsearchf2 }
}
dialog results {
  size -1 -1 420 250
  icon graph/fsearchf.ico
  title "Search results"
  box "Results" 1, 10 10 302 210
  list 2, 20 25 280 200, sort
  button "close" 3, 323 160 70 20,ok
  box "" 4, 314 10 90 210
  button "New search" 5, 323 90 70 20
  button "Repeat" 6, 323 113 70 20
  text "Results:" 7, 15 225 100 17
  text "" 8, 55 225 40 17
  button "Open file" 9, 323 136 70 20
  icon 10, 338 45 40 40, graph/fsearchf.ico
}
on *:dialog:results:init:0: {
  did -a results 2 Searching...
  .timer 1 1 fsearchf
}
on *:dialog:results:sclick:9: {
  if ( $did(results,2).sel != $null ) { //run $did($dname,2).seltext }
}
on *:dialog:results:sclick:3: {
  dialog -x fsearchf fsearchf
}
on *:dialog:results:sclick:5: {
  dialog -x $dname $dname
}
alias fsearchf2 {
  if ( $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,0) < 165 ) {
    set %results 0  
    set %find 0
    :loop
    inc %find
    if ( %find > $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,0) ) { halt }
    aline @fsearchf-results $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,%find)
    inc %results  
    goto loop
  }
  else { aline @fsearchf-results Too many results came up! | aline @fsearchf-results Try to specify its location better | halt }
}
alias fsearchf {
  if ( $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,0) < 165 ) {
    did -r results 2
    set %results 0  
    set %find 0
    :loop
    inc %find
    if ( %find > $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,0) ) { did -ra results 8 %results | halt }
    did -a results 2 $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,%find)
    inc %results  
    goto loop
  }
  else { did -r results 2 | did -a results 2 Too many results came up! | did -a results 2 Try to specify its location better | halt }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
