;___________________________________________
; Invincible by Xtry
; Nickname List Colors
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

; Installation
; Put the nc folder into your mIRC's main directory, open your mIRC and type /load -rs nc/nc.mrc
; If you put the nc folder into your mIRC's sub-directory, you must type /load -rs sub-directory/nc/nc.mrc

; Load event (mIRC 5.71 or higher required)
on *:load:{
  if ($version < 5.71) {
    .unload -rs $shortfn($scriptdir) $+ ghost.mrc
    echo -a * Nickname List Colors 1.0 require mIRC version 5.71 or higher.
    echo -a * Your mIRC version is $version $+ . Please upgrade your mIRC version.
    echo -a * Installation canceled & script unloaded.
  }
  else {
    _nc.set
    echo -a * Nickname List Colors 1.0 has been sucessfully loaded.
    echo -a * Type /nlc to open the dialog.
  }
}

; Syntax /nlc
alias nlc { if ($dialog(nc)) dialog -v nc | else dialog -m nc nc }

; Create 15 colors in .bmp
alias -l _nc.set {
  window -hp +f @col 0 0 18 18
  ; 00
  drawfill @col 00 00 0 0
  drawsave @col $_nc.dirc $+ \00.bmp
  clear @col
  ; 01
  drawfill @col 01 01 0 0
  drawsave @col $_nc.dirc $+ \01.bmp
  clear @col
  ; 02
  drawfill @col 02 02 0 0
  drawsave @col $_nc.dirc $+ \02.bmp
  clear @col
  ; 03
  drawfill @col 03 03 0 0
  drawsave @col $_nc.dirc $+ \03.bmp
  clear @col
  ; 04
  drawfill @col 04 04 0 0
  drawsave @col $_nc.dirc $+ \04.bmp
  clear @col
  ; 05
  drawfill @col 05 05 0 0
  drawsave @col $_nc.dirc $+ \05.bmp
  clear @col
  ; 06
  drawfill @col 06 06 0 0
  drawsave @col $_nc.dirc $+ \06.bmp
  clear @col
  ; 07
  drawfill @col 07 07 0 0
  drawsave @col $_nc.dirc $+ \07.bmp
  clear @col
  ; 08
  drawfill @col 08 08 0 0
  drawsave @col $_nc.dirc $+ \08.bmp
  clear @col
  ; 09
  drawfill @col 09 09 0 0
  drawsave @col $_nc.dirc $+ \09.bmp
  clear @col
  ; 10
  drawfill @col 10 10 0 0
  drawsave @col $_nc.dirc $+ \10.bmp
  clear @col
  ; 11
  drawfill @col 11 11 0 0
  drawsave @col $_nc.dirc $+ \11.bmp
  clear @col
  ; 12
  drawfill @col 12 12 0 0
  drawsave @col $_nc.dirc $+ \12.bmp
  clear @col
  ; 13
  drawfill @col 13 13 0 0
  drawsave @col $_nc.dirc $+ \13.bmp
  clear @col
  ; 14
  drawfill @col 14 14 0 0
  drawsave @col $_nc.dirc $+ \14.bmp
  clear @col
  ; 15
  drawfill @col 15 15 0 0
  drawsave @col $_nc.dirc $+ \15.bmp
  clear @col
}

; Aliases
alias -l _nc.v { return Nickname List Colors 1.0 }
alias -l _nc.dir { return $shortfn($scriptdir) }
alias -l _nc.dirc { return $shortfn($scriptdirc) }
alias -l _nc.ini { return $shortfn($scriptdirnc.ini) }
alias _nc.wini { writeini -n $_nc.ini $1 $2 $3 | writeini -n $_nc.ini $1 $4 $5 }
alias -l _nc.wini_ { writeini -n $_nc.ini $1 $2 $3 }
alias _nc.rini { return $readini($_nc.ini,$1,$2) }
alias -l _nc.don { _nc.wini_ nc s on | .enable #nc }
alias -l _nc.doff { _nc.wini_ nc s off | .disable #nc }

; Enabled
alias -l _nc.on {
  set -u0 %_nc 1
  while (%_nc <= $chan(0)) {
    set -u0 %_nc_ 1
    while (%_nc_ <= $nick($chan(%_nc),0)) {
      if ($nick($chan(%_nc),%_nc_) isreg $chan(%_nc)) { cline $_nc.rini(nc,r-) $chan(%_nc) $nick($chan(%_nc),%_nc_)) }
      if ($nick($chan(%_nc),%_nc_) isvo $chan(%_nc)) { cline $_nc.rini(nc,v-) $chan(%_nc) $nick($chan(%_nc),%_nc_)) }
      if ($nick($chan(%_nc),%_nc_) ishelp $chan(%_nc)) { cline $_nc.rini(nc,h-) $chan(%_nc) $nick($chan(%_nc),%_nc_)) }
      if ($nick($chan(%_nc),%_nc_) isop $chan(%_nc)) { cline $_nc.rini(nc,o-) $chan(%_nc) $nick($chan(%_nc),%_nc_)) }
      if ($nick($chan(%_nc),%_nc_) == $me) { cline $_nc.rini(nc,m-) $chan(%_nc) $nick($chan(%_nc),%_nc_)) }
      if ($nick($chan(%_nc),%_nc_) isnotify) { cline $_nc.rini(nc,n-) $chan(%_nc) $nick($chan(%_nc),%_nc_)) }
      if ($nick($chan(%_nc),%_nc_) $+ !*@* isignore) { cline $_nc.rini(nc,i-) $chan(%_nc) $nick($chan(%_nc),%_nc_)) }
      inc %_nc_
    }
    inc %_nc
  }
}

; Disabled
alias -l _nc.off { 
  set -u0 %_nc 1
  while (%_nc <= $chan(0)) {
    set -u0 %_nc_ 1
    while (%_nc_ <= $nick($chan(%_nc),0)) { 
      if ($nick($chan(%_nc),%_nc_) ison $chan(%_nc)) { cline $color(listbox text) $chan(%_nc) $nick($chan(%_nc),%_nc_)) }
      inc %_nc_
    }
    inc %_nc
  }
}

; Nickname List Colors 1.0 Dialog
dialog nc {
  ; Title,Size & Icon
  title Nickname List Colors
  size -1 -1 465 280
  icon graph\colors.ico

  ; Boxes
  box "",800,15 6 435 38
  box "",801,15 36 435 38
  box "",802,15 66 435 38
  box "",803,15 96 435 38
  box "",804,15 126 435 38
  box "",805,15 156 435 38
  box "",806,15 186 435 38
  box "",807,15 216 435 52

  ; Buttons
  radio "Enable",808,25 235 70 20,group push
  radio "Disable",809,95 235 70 20,group push
  button "Close",810,368 235 70 20,ok

  ; Me
  text "Me",1,50 20 50 20
  icon 2,25 18 18 18
  icon 3,120 18 18 18
  icon 4,140 18 18 18
  icon 5,160 18 18 18
  icon 6,180 18 18 18
  icon 7,200 18 18 18
  icon 8,220 18 18 18
  icon 9,240 18 18 18
  icon 10,260 18 18 18
  icon 11,280 18 18 18
  icon 12,300 18 18 18
  icon 13,320 18 18 18
  icon 14,340 18 18 18
  icon 15,360 18 18 18
  icon 16,380 18 18 18
  icon 17,400 18 18 18
  icon 18,420 18 18 18

  ; Notify
  text "Notify",200,50 50 50 20
  icon 19,25 48 18 18
  icon 20,120 48 18 18
  icon 21,140 48 18 18
  icon 22,160 48 18 18
  icon 23,180 48 18 18
  icon 24,200 48 18 18
  icon 25,220 48 18 18
  icon 26,240 48 18 18
  icon 27,260 48 18 18
  icon 28,280 48 18 18
  icon 29,300 48 18 18
  icon 30,320 48 18 18
  icon 31,340 48 18 18
  icon 32,360 48 18 18
  icon 33,380 48 18 18
  icon 34,400 48 18 18
  icon 35,420 48 18 18

  ; Ignore
  text "Ignore",300,50 80 50 20
  icon 36,25 78 18 18
  icon 37,120 78 18 18
  icon 38,140 78 18 18
  icon 39,160 78 18 18
  icon 40,180 78 18 18
  icon 41,200 78 18 18
  icon 42,220 78 18 18
  icon 43,240 78 18 18
  icon 44,260 78 18 18
  icon 45,280 78 18 18
  icon 46,300 78 18 18
  icon 47,320 78 18 18
  icon 48,340 78 18 18
  icon 49,360 78 18 18
  icon 50,380 78 18 18
  icon 51,400 78 18 18
  icon 52,420 78 18 18

  ; Op
  text "Op",400,50 110 50 20
  icon 53,25 108 18 18
  icon 54,120 108 18 18
  icon 55,140 108 18 18
  icon 56,160 108 18 18
  icon 57,180 108 18 18
  icon 58,200 108 18 18
  icon 59,220 108 18 18
  icon 60,240 108 18 18
  icon 61,260 108 18 18
  icon 62,280 108 18 18
  icon 63,300 108 18 18
  icon 64,320 108 18 18
  icon 65,340 108 18 18
  icon 66,360 108 18 18
  icon 67,380 108 18 18
  icon 68,400 108 18 18
  icon 69,420 108 18 18

  ; Help
  text "Help",500,50 140 50 20
  icon 70,25 138 18 18
  icon 71,120 138 18 18
  icon 72,140 138 18 18
  icon 73,160 138 18 18
  icon 74,180 138 18 18
  icon 75,200 138 18 18
  icon 76,220 138 18 18
  icon 77,240 138 18 18
  icon 78,260 138 18 18
  icon 79,280 138 18 18
  icon 80,300 138 18 18
  icon 81,320 138 18 18
  icon 82,340 138 18 18
  icon 83,360 138 18 18
  icon 84,380 138 18 18
  icon 85,400 138 18 18
  icon 86,420 138 18 18

  ; Voice
  text "Voice",600,50 170 50 20
  icon 87,25 168 18 18
  icon 88,120 168 18 18
  icon 89,140 168 18 18
  icon 90,160 168 18 18
  icon 91,180 168 18 18
  icon 92,200 168 18 18
  icon 93,220 168 18 18
  icon 94,240 168 18 18
  icon 95,260 168 18 18
  icon 96,280 168 18 18
  icon 97,300 168 18 18
  icon 98,320 168 18 18
  icon 99,340 168 18 18
  icon 100,360 168 18 18
  icon 101,380 168 18 18
  icon 102,400 168 18 18
  icon 103,420 168 18 18

  ; Regular
  text "Regular",700,50 200 50 20
  icon 104,25 198 18 18
  icon 105,120 198 18 18
  icon 106,140 198 18 18
  icon 107,160 198 18 18
  icon 108,180 198 18 18
  icon 109,200 198 18 18
  icon 110,220 198 18 18
  icon 111,240 198 18 18
  icon 112,260 198 18 18
  icon 113,280 198 18 18
  icon 114,300 198 18 18
  icon 115,320 198 18 18
  icon 116,340 198 18 18
  icon 117,360 198 18 18
  icon 118,380 198 18 18
  icon 119,400 198 18 18
  icon 120,420 198 18 18
}
; Init events in dialog
on *:dialog:nc:init:*:{

  ; Create .bmp colors
  _nc.set

  ; Placing all 15 colors
  did -gv $dname 3,20,37,54,71,88,105 $_nc.dirc $+ \00.bmp
  did -gv $dname 4,21,38,55,72,89,106 $_nc.dirc $+ \01.bmp
  did -gv $dname 5,22,39,56,73,90,107 $_nc.dirc $+ \02.bmp
  did -gv $dname 6,23,40,57,74,91,108 $_nc.dirc $+ \03.bmp
  did -gv $dname 7,24,41,58,75,92,109 $_nc.dirc $+ \04.bmp
  did -gv $dname 8,25,42,59,76,93,110 $_nc.dirc $+ \05.bmp
  did -gv $dname 9,26,43,60,77,94,111 $_nc.dirc $+ \06.bmp
  did -gv $dname 10,27,44,61,78,95,112 $_nc.dirc $+ \07.bmp
  did -gv $dname 11,28,45,62,79,96,113 $_nc.dirc $+ \08.bmp
  did -gv $dname 12,29,46,63,80,97,114 $_nc.dirc $+ \09.bmp
  did -gv $dname 13,30,47,64,81,98,115 $_nc.dirc $+ \10.bmp
  did -gv $dname 14,31,48,65,82,99,116 $_nc.dirc $+ \11.bmp
  did -gv $dname 15,32,49,66,83,100,117 $_nc.dirc $+ \12.bmp
  did -gv $dname 16,33,50,67,84,101,118 $_nc.dirc $+ \13.bmp
  did -gv $dname 17,34,51,68,85,102,119 $_nc.dirc $+ \14.bmp
  did -gv $dname 18,35,52,69,86,103,120 $_nc.dirc $+ \15.bmp

  ; Checking setting
  if ($_nc.rini(nc,s) = on) && ($group(#nc) = on) { did -c $dname 808 | did -u $dname 809 }
  else { did -u $dname 808 | did -c $dname 809 }

  ; Fill the options colors
  did -gv $dname 2 $_nc.dirc $+ \ $+ $_nc.rini(nc,m)
  did -gv $dname 19 $_nc.dirc $+ \ $+ $_nc.rini(nc,n)
  did -gv $dname 36 $_nc.dirc $+ \ $+ $_nc.rini(nc,i)
  did -gv $dname 53 $_nc.dirc $+ \ $+ $_nc.rini(nc,o)
  did -gv $dname 70 $_nc.dirc $+ \ $+ $_nc.rini(nc,h)
  did -gv $dname 87 $_nc.dirc $+ \ $+ $_nc.rini(nc,v)
  did -gv $dname 104 $_nc.dirc $+ \ $+ $_nc.rini(nc,r)
}

; Sclick event in dialog
on *:dialog:nc:sclick:*:{

  ; Enable
  if ($did = 808) { _nc.don | did -u $dname 809 | .timer 3 1 _nc.on }

  ; Disable
  if ($did = 809) { _nc.doff | did -u $dname 808 | _nc.off }

  ; Me
  if ($did = 3) { did -gv $dname 2 $_nc.dirc $+ \00.bmp | _nc.wini nc m 00.bmp m- 00 }
  if ($did = 4) { did -gv $dname 2 $_nc.dirc $+ \01.bmp | _nc.wini nc m 01.bmp m- 01 }
  if ($did = 5) { did -gv $dname 2 $_nc.dirc $+ \02.bmp | _nc.wini nc m 02.bmp m- 02 }
  if ($did = 6) { did -gv $dname 2 $_nc.dirc $+ \03.bmp | _nc.wini nc m 03.bmp m- 03 }
  if ($did = 7) { did -gv $dname 2 $_nc.dirc $+ \04.bmp | _nc.wini nc m 04.bmp m- 04 }
  if ($did = 8) { did -gv $dname 2 $_nc.dirc $+ \05.bmp | _nc.wini nc m 05.bmp m- 05 }
  if ($did = 9) { did -gv $dname 2 $_nc.dirc $+ \06.bmp | _nc.wini nc m 06.bmp m- 06 }
  if ($did = 10) { did -gv $dname 2 $_nc.dirc $+ \07.bmp | _nc.wini nc m 07.bmp m- 07 }
  if ($did = 11) { did -gv $dname 2 $_nc.dirc $+ \08.bmp | _nc.wini nc m 08.bmp m- 08 }
  if ($did = 12) { did -gv $dname 2 $_nc.dirc $+ \09.bmp | _nc.wini nc m 09.bmp m- 09 }
  if ($did = 13) { did -gv $dname 2 $_nc.dirc $+ \10.bmp | _nc.wini nc m 10.bmp m- 10 }
  if ($did = 14) { did -gv $dname 2 $_nc.dirc $+ \11.bmp | _nc.wini nc m 11.bmp m- 11 }
  if ($did = 15) { did -gv $dname 2 $_nc.dirc $+ \12.bmp | _nc.wini nc m 12.bmp m- 12 }
  if ($did = 16) { did -gv $dname 2 $_nc.dirc $+ \13.bmp | _nc.wini nc m 13.bmp m- 13 }
  if ($did = 17) { did -gv $dname 2 $_nc.dirc $+ \14.bmp | _nc.wini nc m 14.bmp m- 14 }
  if ($did = 18) { did -gv $dname 2 $_nc.dirc $+ \15.bmp | _nc.wini nc m 15.bmp m- 15 }

  ; Notify
  if ($did = 20) { did -gv $dname 19 $_nc.dirc $+ \00.bmp | _nc.wini nc n 00.bmp n- 00 }
  if ($did = 21) { did -gv $dname 19 $_nc.dirc $+ \01.bmp | _nc.wini nc n 01.bmp n- 01 }
  if ($did = 22) { did -gv $dname 19 $_nc.dirc $+ \02.bmp | _nc.wini nc n 02.bmp n- 02 }
  if ($did = 23) { did -gv $dname 19 $_nc.dirc $+ \03.bmp | _nc.wini nc n 03.bmp n- 03 }
  if ($did = 24) { did -gv $dname 19 $_nc.dirc $+ \04.bmp | _nc.wini nc n 04.bmp n- 04 }
  if ($did = 25) { did -gv $dname 19 $_nc.dirc $+ \05.bmp | _nc.wini nc n 05.bmp n- 05 }
  if ($did = 26) { did -gv $dname 19 $_nc.dirc $+ \06.bmp | _nc.wini nc n 06.bmp n- 06 }
  if ($did = 27) { did -gv $dname 19 $_nc.dirc $+ \07.bmp | _nc.wini nc n 07.bmp n- 07 }
  if ($did = 28) { did -gv $dname 19 $_nc.dirc $+ \08.bmp | _nc.wini nc n 08.bmp n- 08 }
  if ($did = 29) { did -gv $dname 19 $_nc.dirc $+ \09.bmp | _nc.wini nc n 09.bmp n- 09 }
  if ($did = 30) { did -gv $dname 19 $_nc.dirc $+ \10.bmp | _nc.wini nc n 10.bmp n- 10 }
  if ($did = 31) { did -gv $dname 19 $_nc.dirc $+ \11.bmp | _nc.wini nc n 11.bmp n- 11 }
  if ($did = 32) { did -gv $dname 19 $_nc.dirc $+ \12.bmp | _nc.wini nc n 12.bmp n- 12 }
  if ($did = 33) { did -gv $dname 19 $_nc.dirc $+ \13.bmp | _nc.wini nc n 13.bmp n- 13 }
  if ($did = 34) { did -gv $dname 19 $_nc.dirc $+ \14.bmp | _nc.wini nc n 14.bmp n- 14 }
  if ($did = 35) { did -gv $dname 19 $_nc.dirc $+ \15.bmp | _nc.wini nc n 15.bmp n- 15 }

  ; Ignore
  if ($did = 37) { did -gv $dname 36 $_nc.dirc $+ \00.bmp | _nc.wini nc i 00.bmp i- 00 }
  if ($did = 38) { did -gv $dname 36 $_nc.dirc $+ \01.bmp | _nc.wini nc i 01.bmp i- 01 }
  if ($did = 39) { did -gv $dname 36 $_nc.dirc $+ \02.bmp | _nc.wini nc i 02.bmp i- 02 }
  if ($did = 40) { did -gv $dname 36 $_nc.dirc $+ \03.bmp | _nc.wini nc i 03.bmp i- 03 }
  if ($did = 41) { did -gv $dname 36 $_nc.dirc $+ \04.bmp | _nc.wini nc i 04.bmp i- 04 }
  if ($did = 42) { did -gv $dname 36 $_nc.dirc $+ \05.bmp | _nc.wini nc i 05.bmp i- 05 }
  if ($did = 43) { did -gv $dname 36 $_nc.dirc $+ \06.bmp | _nc.wini nc i 06.bmp i- 06 }
  if ($did = 44) { did -gv $dname 36 $_nc.dirc $+ \07.bmp | _nc.wini nc i 07.bmp i- 07 }
  if ($did = 45) { did -gv $dname 36 $_nc.dirc $+ \08.bmp | _nc.wini nc i 08.bmp i- 08 }
  if ($did = 46) { did -gv $dname 36 $_nc.dirc $+ \09.bmp | _nc.wini nc i 09.bmp i- 09 }
  if ($did = 47) { did -gv $dname 36 $_nc.dirc $+ \10.bmp | _nc.wini nc i 10.bmp i- 10 }
  if ($did = 48) { did -gv $dname 36 $_nc.dirc $+ \11.bmp | _nc.wini nc i 11.bmp i- 11 }
  if ($did = 49) { did -gv $dname 36 $_nc.dirc $+ \12.bmp | _nc.wini nc i 12.bmp i- 12 }
  if ($did = 50) { did -gv $dname 36 $_nc.dirc $+ \13.bmp | _nc.wini nc i 13.bmp i- 13 }
  if ($did = 51) { did -gv $dname 36 $_nc.dirc $+ \14.bmp | _nc.wini nc i 14.bmp i- 14 }
  if ($did = 52) { did -gv $dname 36 $_nc.dirc $+ \15.bmp | _nc.wini nc i 15.bmp i- 15 }

  ; Op
  if ($did = 54) { did -gv $dname 53 $_nc.dirc $+ \00.bmp | _nc.wini nc o 00.bmp o- 00 }
  if ($did = 55) { did -gv $dname 53 $_nc.dirc $+ \01.bmp | _nc.wini nc o 01.bmp o- 01 }
  if ($did = 56) { did -gv $dname 53 $_nc.dirc $+ \02.bmp | _nc.wini nc o 02.bmp o- 02 }
  if ($did = 57) { did -gv $dname 53 $_nc.dirc $+ \03.bmp | _nc.wini nc o 03.bmp o- 03 }
  if ($did = 58) { did -gv $dname 53 $_nc.dirc $+ \04.bmp | _nc.wini nc o 04.bmp o- 04 }
  if ($did = 59) { did -gv $dname 53 $_nc.dirc $+ \05.bmp | _nc.wini nc o 05.bmp o- 05 }
  if ($did = 60) { did -gv $dname 53 $_nc.dirc $+ \06.bmp | _nc.wini nc o 06.bmp o- 06 }
  if ($did = 61) { did -gv $dname 53 $_nc.dirc $+ \07.bmp | _nc.wini nc o 07.bmp o- 07 }
  if ($did = 62) { did -gv $dname 53 $_nc.dirc $+ \08.bmp | _nc.wini nc o 08.bmp o- 08 }
  if ($did = 63) { did -gv $dname 53 $_nc.dirc $+ \09.bmp | _nc.wini nc o 09.bmp o- 09 }
  if ($did = 64) { did -gv $dname 53 $_nc.dirc $+ \10.bmp | _nc.wini nc o 10.bmp o- 10 }
  if ($did = 65) { did -gv $dname 53 $_nc.dirc $+ \11.bmp | _nc.wini nc o 11.bmp o- 11 }
  if ($did = 66) { did -gv $dname 53 $_nc.dirc $+ \12.bmp | _nc.wini nc o 12.bmp o- 12 }
  if ($did = 67) { did -gv $dname 53 $_nc.dirc $+ \13.bmp | _nc.wini nc o 13.bmp o- 13 }
  if ($did = 68) { did -gv $dname 53 $_nc.dirc $+ \14.bmp | _nc.wini nc o 14.bmp o- 14 }
  if ($did = 69) { did -gv $dname 53 $_nc.dirc $+ \15.bmp | _nc.wini nc o 15.bmp o- 15 }

  ; Help
  if ($did = 71) { did -gv $dname 70 $_nc.dirc $+ \00.bmp | _nc.wini nc h 00.bmp h- 00 }
  if ($did = 72) { did -gv $dname 70 $_nc.dirc $+ \01.bmp | _nc.wini nc h 01.bmp h- 01 }
  if ($did = 73) { did -gv $dname 70 $_nc.dirc $+ \02.bmp | _nc.wini nc h 02.bmp h- 02 }
  if ($did = 74) { did -gv $dname 70 $_nc.dirc $+ \03.bmp | _nc.wini nc h 03.bmp h- 03 }
  if ($did = 75) { did -gv $dname 70 $_nc.dirc $+ \04.bmp | _nc.wini nc h 04.bmp h- 04 }
  if ($did = 76) { did -gv $dname 70 $_nc.dirc $+ \05.bmp | _nc.wini nc h 05.bmp h- 05 }
  if ($did = 77) { did -gv $dname 70 $_nc.dirc $+ \06.bmp | _nc.wini nc h 06.bmp h- 06 }
  if ($did = 78) { did -gv $dname 70 $_nc.dirc $+ \07.bmp | _nc.wini nc h 07.bmp h- 07 }
  if ($did = 79) { did -gv $dname 70 $_nc.dirc $+ \08.bmp | _nc.wini nc h 08.bmp h- 08 }
  if ($did = 80) { did -gv $dname 70 $_nc.dirc $+ \09.bmp | _nc.wini nc h 09.bmp h- 09 }
  if ($did = 81) { did -gv $dname 70 $_nc.dirc $+ \10.bmp | _nc.wini nc h 10.bmp h- 10 }
  if ($did = 82) { did -gv $dname 70 $_nc.dirc $+ \11.bmp | _nc.wini nc h 11.bmp h- 11 }
  if ($did = 83) { did -gv $dname 70 $_nc.dirc $+ \12.bmp | _nc.wini nc h 12.bmp h- 12 }
  if ($did = 84) { did -gv $dname 70 $_nc.dirc $+ \13.bmp | _nc.wini nc h 13.bmp h- 13 }
  if ($did = 85) { did -gv $dname 70 $_nc.dirc $+ \14.bmp | _nc.wini nc h 14.bmp h- 14 }
  if ($did = 86) { did -gv $dname 70 $_nc.dirc $+ \15.bmp | _nc.wini nc h 15.bmp h- 15 }

  ; Voice
  if ($did = 88) { did -gv $dname 87 $_nc.dirc $+ \00.bmp | _nc.wini nc v 00.bmp v- 00 }
  if ($did = 89) { did -gv $dname 87 $_nc.dirc $+ \01.bmp | _nc.wini nc v 01.bmp v- 01 }
  if ($did = 90) { did -gv $dname 87 $_nc.dirc $+ \02.bmp | _nc.wini nc v 02.bmp v- 02 }
  if ($did = 91) { did -gv $dname 87 $_nc.dirc $+ \03.bmp | _nc.wini nc v 03.bmp v- 03 }
  if ($did = 92) { did -gv $dname 87 $_nc.dirc $+ \04.bmp | _nc.wini nc v 04.bmp v- 04 }
  if ($did = 93) { did -gv $dname 87 $_nc.dirc $+ \05.bmp | _nc.wini nc v 05.bmp v- 05 }
  if ($did = 94) { did -gv $dname 87 $_nc.dirc $+ \06.bmp | _nc.wini nc v 06.bmp v- 06 }
  if ($did = 95) { did -gv $dname 87 $_nc.dirc $+ \07.bmp | _nc.wini nc v 07.bmp v- 07 }
  if ($did = 96) { did -gv $dname 87 $_nc.dirc $+ \08.bmp | _nc.wini nc v 08.bmp v- 08 }
  if ($did = 97) { did -gv $dname 87 $_nc.dirc $+ \09.bmp | _nc.wini nc v 09.bmp v- 09 }
  if ($did = 98) { did -gv $dname 87 $_nc.dirc $+ \10.bmp | _nc.wini nc v 10.bmp v- 10 }
  if ($did = 99) { did -gv $dname 87 $_nc.dirc $+ \11.bmp | _nc.wini nc v 11.bmp v- 11 }
  if ($did = 100) { did -gv $dname 87 $_nc.dirc $+ \12.bmp | _nc.wini nc v 12.bmp v- 12 }
  if ($did = 101) { did -gv $dname 87 $_nc.dirc $+ \13.bmp | _nc.wini nc v 13.bmp v- 13 }
  if ($did = 102) { did -gv $dname 87 $_nc.dirc $+ \14.bmp | _nc.wini nc v 14.bmp v- 14 }
  if ($did = 103) { did -gv $dname 87 $_nc.dirc $+ \15.bmp | _nc.wini nc v 15.bmp v- 15 }

  ; Regular
  if ($did = 105) { did -gv $dname 104 $_nc.dirc $+ \00.bmp | _nc.wini nc r 00.bmp r- 00 }
  if ($did = 106) { did -gv $dname 104 $_nc.dirc $+ \01.bmp | _nc.wini nc r 01.bmp r- 01 }
  if ($did = 107) { did -gv $dname 104 $_nc.dirc $+ \02.bmp | _nc.wini nc r 02.bmp r- 02 }
  if ($did = 108) { did -gv $dname 104 $_nc.dirc $+ \03.bmp | _nc.wini nc r 03.bmp r- 03 }
  if ($did = 109) { did -gv $dname 104 $_nc.dirc $+ \04.bmp | _nc.wini nc r 04.bmp r- 04 }
  if ($did = 110) { did -gv $dname 104 $_nc.dirc $+ \05.bmp | _nc.wini nc r 05.bmp r- 05 }
  if ($did = 111) { did -gv $dname 104 $_nc.dirc $+ \06.bmp | _nc.wini nc r 06.bmp r- 06 }
  if ($did = 112) { did -gv $dname 104 $_nc.dirc $+ \07.bmp | _nc.wini nc r 07.bmp r- 07 }
  if ($did = 113) { did -gv $dname 104 $_nc.dirc $+ \08.bmp | _nc.wini nc r 08.bmp r- 08 }
  if ($did = 114) { did -gv $dname 104 $_nc.dirc $+ \09.bmp | _nc.wini nc r 09.bmp r- 09 }
  if ($did = 115) { did -gv $dname 104 $_nc.dirc $+ \10.bmp | _nc.wini nc r 10.bmp r- 10 }
  if ($did = 116) { did -gv $dname 104 $_nc.dirc $+ \11.bmp | _nc.wini nc r 11.bmp r- 11 }
  if ($did = 117) { did -gv $dname 104 $_nc.dirc $+ \12.bmp | _nc.wini nc r 12.bmp r- 12 }
  if ($did = 118) { did -gv $dname 104 $_nc.dirc $+ \13.bmp | _nc.wini nc r 13.bmp r- 13 }
  if ($did = 119) { did -gv $dname 104 $_nc.dirc $+ \14.bmp | _nc.wini nc r 14.bmp r- 14 }
  if ($did = 120) { did -gv $dname 104 $_nc.dirc $+ \15.bmp | _nc.wini nc r 15.bmp r- 15 }
}

; Events when the Nickname List Colors works
#nc on
on *:join:#:{
  if ($nick == $me) { .timer 3 1 _nc.on }
  else { 
    if ($nick isreg $chan) { cline $_nc.rini(nc,r-) $chan $nick }
    if ($nick isvo $chan) { cline $_nc.rini(nc,v-) $chan $nick }
    if ($nick ishelp $chan) { cline $_nc.rini(nc,h-) $chan $nick }
    if ($nick isop $chan) { cline $_nc.rini(nc,o-) $chan $nick }
    if ($nick == $me) { cline $_nc.rini(nc,m-) $chan $nick }
    if ($nick isnotify) { cline $_nc.rini(nc,n-) $chan $nick }
    if ($nick $+ !*@* isignore) { cline $_nc.rini(nc,i-) $chan $nick } 
  }
}
on *:op:#:{
  if ($opnick == $me) { cline $_nc.rini(nc,m-) $chan $opnick | halt }
  if ($opnick isnotify) { cline $_nc.rini(nc,n-) $chan $opnick | halt }
  if ($opnick $+ !*@* isignore) { cline $_nc.rini(nc,i-) $chan $opnick | halt }
  cline $_nc.rini(nc,o-) $chan $opnick 
}
on *:serverop:#:{
  if ($opnick == $me) { cline $_nc.rini(nc,m-) $chan $opnick | halt }
  if ($opnick isnotify) { cline $_nc.rini(nc,n-) $chan $opnick | halt }
  if ($opnick $+ !*@* isignore) { cline $_nc.rini(nc,i-) $chan $opnick | halt }
  cline $_nc.rini(nc,o-) $chan $opnick 
}
on *:deop:#:{
  if ($opnick == $me) { cline $_nc.rini(nc,m-) $chan $opnick | halt }
  if ($opnick ishelp $chan) { cline $_nc.rini(nc,v-) $chan $opnick | halt }
  if ($opnick isvo $chan) { cline $_nc.rini(nc,v-) $chan $opnick | halt }
  if ($opnick isnotify) { cline $_nc.rini(nc,n-) $chan $opnick | halt }
  if ($opnick $+ !*@* isignore) { cline $_nc.rini(nc,i-) $chan $opnick | halt }
  cline $_nc.rini(nc,r-) $chan $opnick 
}

on *:help:#:{
  if ($hnick == $me) { cline $_nc.rini(nc,m-) $chan $hnick | halt }
  if ($hnick isnotify) { cline $_nc.rini(nc,n-) $chan $hnick | halt }
  if ($hnick $+ !*@* isignore) { cline $_nc.rini(nc,i-) $chan $hnick | halt }
  if ($hnick isop $chan) { cline $_nc.rini(nc,o-) $chan $hnick | halt }
  cline $_nc.rini(nc,h-) $chan $hnick 
}
on *:dehelp:#:{
  if ($hnick == $me) { cline $_nc.rini(nc,m-) $chan $hnick | halt }
  if ($hnick isop $chan) { cline $_nc.rini(nc,o-) $chan $hnick | halt }
  if ($hnick isnotify) { cline $_nc.rini(nc,n-) $chan $hnick | halt }
  if ($hnick $+ !*@* isignore) { cline $_nc.rini(nc,i-) $chan $hnick | halt }
  if ($hnick isvo $chan) { cline $_nc.rini(nc,v-) $chan $hnick | halt }
  cline $_nc.rini(nc,r-) $chan $hnick 
}
on *:voice:#:{
  if ($vnick == $me) { cline $_nc.rini(nc,m-) $chan $vnick | halt }
  if ($vnick isnotify) { cline $_nc.rini(nc,n-) $chan $vnick | halt }
  if ($vnick $+ !*@* isignore) { cline $_nc.rini(nc,i-) $chan $vnick | halt }
  if ($vnick isop $chan) { cline $_nc.rini(nc,o-) $chan $vnick | halt }
  if ($vnick ishelp $chan) { cline $_nc.rini(nc,h-) $chan $vnick | halt }
  cline $_nc.rini(nc,v-) $chan $vnick 
}
on *:devoice:#:{
  if ($vnick == $me) { cline $_nc.rini(nc,m-) $chan $vnick | halt }
  if ($vnick isnotify) { cline $_nc.rini(nc,n-) $chan $vnick | halt }
  if ($vnick $+ !*@* isignore) { cline $_nc.rini(nc,i-) $chan $vnick | halt }
  if ($vnick isop $chan) { cline $_nc.rini(nc,o-) $chan $vnick | halt }
  if ($vnick ishelp $chan) { cline $_nc.rini(nc,h-) $chan $vnick | halt }
  cline $_nc.rini(nc,r-) $chan $vnick 
}
#nc end


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
