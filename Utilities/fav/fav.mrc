;___________________________________________
; Invincible by Xtry
; Favorites
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

; Installation
; Put the fav folder into your mIRC's main directory, open your mIRC and type /load -rs fav/fav.mrc
; If you put the fav folder into your mIRC's sub-directory, you must type /load -rs sub-directory/fav/fav.mrc

; Load event (mIRC 5.71 or higher required)
on *:load:{
  if ($version < 5.71) {
    .unload -rs $shortfn($scriptdir) $+ fav.mrc
    echo -a * Favorites 1.0 require mIRC version 5.71 or higher.
    echo -a * Your mIRC version is $version $+ . Please upgrade your mIRC version.
    echo -a * Installation canceled & script unloaded.
  }
  else {
    write -c $_fav.c
    write -c $_fav.n
    echo -a * Favorites 1.0 has been sucessfully loaded.
    echo -a * Type /fav to open the dialog.
  }
}

; Syntax : /fav
alias fav { if ($dialog(fav)) dialog -v fav | else dialog -m fav fav }

; Local aliases
alias -l _fav.v { return Favorites }
alias -l _fav.dir { return $shortfn($scriptdir) }
alias -l _fav.c { return $shortfn($scriptdirc.txt) }
alias -l _fav.n { return $shortfn($scriptdirn.txt) }
alias -l _fav.load {
  did -r $dname 2
  did -r $dname 8
  loadbuf -ro $dname 2 $_fav.c
  loadbuf -ro $dname 8 $_fav.n
  if ($lines($_fav.c) > 0) { did -e $dname 6 } | else { did -b $dname 6 }
  if ($lines($_fav.n) > 0) { did -e $dname 12 } | else { did -b $dname 12 }
  if ($did($dname,2).sel isnum) { did -e $dname 3,5 } | else { did -b $dname 3,5 }
  if ($did($dname,8).sel isnum) { did -e $dname 9,11 } | else { did -b $dname 9,11 }
  if ($left($did($dname,2).text,1) = $chr(35)) && ($did($dname,2).text != $null) && $mid($did($dname,2).text,2,1 != $null) { did -e $dname 4 } | else { did -b $dname 4 }
  if ($did($dname,8).text != $null) { did -e $dname 10 } | else { did -b $dname 10 }
}

; Dialog
dialog fav {
  ; Title & size
  title $_fav.v
  icon graph/fav.ico
  size -1 -1 495 185

  ; Channel
  box "Favorite Channel :",1,5 5 243 175
  combo 2,15 25 150 150
  button "Join",3,170 25 70 20,disable
  button "Add",4,170 55 70 20,disable
  button "Del",5,170 75 70 20,disable
  button "Clear",6,170 147 70 20,disable

  ; Nickname
  box "Favorite Nickname :",7,247 5 243 175
  combo 8,257 25 150 150
  button "Change",9,412 25 70 20,disable
  button "Add",10,412 55 70 20,disable
  button "Del",11,412 75 70 20,disable
  button "Clear",12,412 147 70 20,disable
}

; Dialog events
on *:dialog:fav:init:*:{ _fav.load }
on *:dialog:fav:edit:*:{
  ; Combo edit for channel
  if ($did = 2) {
    did -b $dname 3,5
    if ($left($did($dname,2).text,1) = $chr(35)) && ($did($dname,2).text != $null) && $mid($did($dname,2).text,2,1 != $null) { did -e $dname 4 }
    else { did -b $dname 4 }
  }
  ; Combo edit for nickname
  if ($did = 8) {
    did -b $dname 9,11
    if ($did($dname,8).text != $null) { did -e $dname 10 }
    else { did -b $dname 10 }
  }
}
on *:dialog:fav:sclick:*:{
  ; Join seelcted channel
  if ($did = 3) { if ($server) { join $did($dname,2) } | else { beep } }
  ; Change to selected nickname
  if ($did = 9) { nick $did($dname,8) }
  ; Add a channel
  if ($did = 4) { if ($did($dname,2).text != $null) { write $_fav.c $did($dname,2).text | _fav.load } | else { beep } }
  ; Add a nickname
  if ($did = 10) { if ($did($dname,8).text != $null) { write $_fav.n $did($dname,8).text | _fav.load } | else { beep } }
  ; Delete selected channel
  if ($did = 5) { write -ds $+ $did($dname,2).text $_fav.c | _fav.load }
  ; Delete selected nickname
  if ($did = 11) { write -ds $+ $did($dname,8).text $_fav.n | _fav.load }
  ; Combo sclick for channel
  if ($did = 2) {
    if ($did($dname,2).sel isnum) { did -e $dname 3,5 }
    else { did -b $dname 3,5 }
  }
  ; Combo sclick for nickname
  if ($did = 8) {
    if ($did($dname,8).sel isnum) { did -e $dname 9,11 }
    else { did -b $dname 9,11 }
  }
  ; Clear channel list
  if ($did = 6) { if ($?!="Are you sure you want to clear Favorite Channel List ?" = $true) { write -c $_fav.c | _fav.load } | else { halt } }
  ; Clear nickname list
  if ($did = 12) { if ($?!="Are you sure you want to clear Favorite Nickname List ?" = $true) { write -c $_fav.n | _fav.load } | else { halt } }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
