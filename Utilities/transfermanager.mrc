;___________________________________________
; Invincible by Xtry
; File Transfer Manager
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias filetm { if ($dialog(data_manager)) dialog -v data_manager | else dialog -m data_manager data_manager }
dialog data_manager {
  size -1 -1 580 350
  title "File Transfer Manager"
  icon graph/filem.ico
  button "&Done", 500, 478 325 100 22, cancel, default
  tab "      Files Sent      ",91,5 0 570 320
  tab "  Files Received  ",92
  tab "   Failed Sends   ",93
  tab "   Failed Gets   ",94

  box "Sent Files Log:" ,1010,11 30 558 281,tab 91
  text "Nickname:",1011,20 47 50 13,tab 91
  text "Filename:",1012,166 47 60 13,tab 91
  text "Size:",1013,380 47 50 13,tab 91
  text "Date: (mm/dd/yy)",1014,450 47 100 13,tab 91
  list 20, 20 62 149 220,tab 91
  list 21, 166 62 217 220,tab 91
  list 22, 380 62 73 220,tab 91
  list 23, 450 62 110 220,tab 91
  text "Total Files:",1015,20 285 60 13,tab 91
  edit "",24,74 281 44 22, read tab 91
  text "Total Size:",1016,125 285 60 13,tab 91
  edit "",25,180 281 64 22, read tab 91
  button "Run File",26,324 281 75 22,tab 91
  button "Clear Log",27,484 281 75 22,tab 91
  button "Clear File",28,404 281 75 22,tab 91

  box "Received Files Log:" ,1020,11 30 558 281,tab 92
  text "Nickname:",1021,20 47 50 13,tab 92
  text "Filename:",1022,166 47 60 13,tab 92
  text "Size:",1023,380 47 50 13,tab 92
  text "Date: (mm/dd/yy)",1024,450 47 100 13,tab 92
  list 30, 20 62 149 220,tab 92
  list 31, 166 62 217 220,tab 92
  list 32, 380 62 73 220,tab 92
  list 33, 450 62 110 220,tab 92
  text "Total Files:",1025,20 285 60 13,tab 92
  edit "",34,74 281 44 22, read tab 92
  text "Total Size:",1026,125 285 60 13,tab 92
  edit "",35,180 281 64 22, read tab 92
  button "Run File",36,324 281 75 22,tab 92
  button "Clear Log",37,484 281 75 22,tab 92
  button "Clear File",38,404 281 75 22,tab 92

  box "Failed Sends Log:" ,1030,11 30 558 281,tab 93
  text "Nickname:",1031,20 47 50 13,tab 93
  text "Filename:",1032,166 47 60 13,tab 93
  text "Size:",1033,380 47 50 13,tab 93
  text "Date: (mm/dd/yy)",1034,450 47 100 13,tab 93
  list 40, 20 62 149 220,tab 93
  list 41, 166 62 217 220,tab 93
  list 42, 380 62 73 220,tab 93
  list 43, 450 62 110 220,tab 93
  text "Total Files:",1035,20 285 60 13,tab 93
  edit "",44,74 281 44 22, read tab 93
  text "Total Size:",1036,125 285 60 13,tab 93
  edit "",45,180 281 64 22, read tab 93
  button "Run File",46,324 281 75 22,tab 93
  button "Clear Log",47,484 281 75 22,tab 93
  button "Clear File",48,404 281 75 22,tab 93

  box "Failed Gets Log:" ,1040,11 30 558 281,tab 94
  text "Nickname:",1041,20 47 50 13,tab 94
  text "Filename:",1042,166 47 60 13,tab 94
  text "Size:",1043,380 47 50 13,tab 94
  text "Date: (mm/dd/yy)",1044,450 47 100 13,tab 94
  list 50, 20 62 149 220,tab 94
  list 51, 166 62 217 220,tab 94
  list 52, 380 62 73 220,tab 94
  list 53, 450 62 110 220,tab 94
  text "Total Files:",1045,20 285 60 13,tab 94
  edit "",54,74 281 44 22, read tab 94
  text "Total Size:",1046,125 285 60 13,tab 94
  edit "",55,180 281 64 22, read tab 94
  button "Run File",56,324 281 75 22,tab 94
  button "Clear Log",57,484 281 75 22,tab 94
  button "Clear File",58,404 281 75 22,tab 94

}
on *:dialog:data_manager:*:*:{
  if ($devent == sclick || $devent == init) {
    if ($did == 14) {
      var %addy $ulist(*,banned,$did(10).sel)
      var %loop 1
      while ($ulist(*,banned,%loop) != $null) {
        if (%addy == $ulist(*,banned,%loop)) {
          .ruser banned %addy
          unset % [ $+ [ %addy $+ ban ] ]
        }
        inc %loop
      }
    }
    if ($did == 15) {
      while ($ulist(*,banned,1) != $null) {
        echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) FileServer Ban $+ $cxs(1) $gettok(% [ $+ [ $ulist(*,banned,1) $+ ban ] ],1,127)  $+ $cxs(2) $+ has been unbanned
        unset % [ $+ [ $ulist(*,banned,1) $+ ban ] ]
        .ruser banned $ulist(*,banned,1)
      }
    }
    if ($did == 91 || $devent == init) {
      unset %datanum
      did -b $dname 26,28
      did -r $dname 20,21,22,23,24,25
      set %datafile filelogs\filesent.log
      set %datanum 20
      .timer 1 0 /dataload
    }

    if ($did == 92) {
      unset %datanum
      did -b $dname 36,38
      did -r $dname 30,31,32,33,34,35
      set %datafile filelogs\filercvd.log
      set %datanum 30
      .timer 1 0 /dataload
    }

    if ($did == 93) {
      unset %datanum
      did -b $dname 46,48
      did -r $dname 40,41,42,43,44,45
      set %datafile filelogs\failsend.log
      set %datanum 40
      .timer 1 0 /dataload
    }

    if ($did == 94) {
      unset %datanum
      did -b $dname 56,58
      did -r $dname 50,51,52,53,54,55
      set %datafile filelogs\failget.log
      set %datanum 50
      .timer 1 0 /dataload
    }


    if ($did == 10) { did -c $dname 11,12 $did($dname,10).sel }
    if ($did == 11) { did -c $dname 10,12 $did($dname,11).sel }
    if ($did == 12) { did -c $dname 11,10 $did($dname,12).sel }
    if ($did >= 10 && $did <= 12) {
      did -ra $dname 13 $gettok(% [ $+ [ $ulist(*,banned,$did($dname,10).sel) ] $+ ] ban,3,127)
      did -e $dname 14
    }

    if ($did == 20) { did -c $dname 21,22,23 $did($dname,20).sel | did -e $dname 28 }
    if ($did == 21) { did -c $dname 20,22,23 $did($dname,21).sel | did -e $dname 28 }
    if ($did == 22) { did -c $dname 21,20,23 $did($dname,22).sel | did -e $dname 28 }
    if ($did == 23) { did -c $dname 21,22,20 $did($dname,23).sel | did -e $dname 28 }
    if ($did >= 20 && $did <= 23) {
      var %tmp = $read(filelogs\filesent.log,n,$did($dname,20).sel)
      if ($exists($gettok(%tmp,1,127)) == $true) { did -e $dname 26 }
      else { did -b $dname 26 }
    }
    if ($did == 26) { 
      var %tmp = $read(filelogs\filesent.log,n,$did($dname,20).sel)
      .run $gettok(%tmp,1,127)
    }
    if ($did == 27) {
      if ($?!="You are about to PERMANENTLY clear this log file. $crlf $crlf $+ Continue?" == $true) {
        .write -c filelogs\filesent.log
        did -r $dname 20,21,22,23
        did -ra $dname 24,25 0
        did -b $dname 26,28
      }
    }
    if ($did == 28) { 
      .write -dl $did($dname,20).sel filelogs\filesent.log
      unset %datanum
      did -b $dname 26,28
      did -r $dname 20,21,22,23,24,25
      set %datafile filelogs\filesent.log
      set %datanum 20
      .timer 1 0 /dataload      
    }

    if ($did == 30) { did -c $dname 31,32,33 $did($dname,30).sel | did -e $dname 38 }
    if ($did == 31) { did -c $dname 30,32,33 $did($dname,31).sel | did -e $dname 38 }
    if ($did == 32) { did -c $dname 31,30,33 $did($dname,32).sel | did -e $dname 38 }
    if ($did == 33) { did -c $dname 31,32,30 $did($dname,33).sel | did -e $dname 38 }
    if ($did >= 30 && $did <= 33) {
      var %tmp = $read(filelogs\filercvd.log,n,$did($dname,30).sel)
      if ($exists($gettok(%tmp,1,127)) == $true) { did -e $dname 36 }
      else { did -b $dname 36 }
    }
    if ($did == 36) { 
      var %tmp = $read(filelogs\filercvd.log,n,$did($dname,30).sel)
      .run $gettok(%tmp,1,127)
    }
    if ($did == 37) {
      if ($?!="You are about to permanently clear this log file. $crlf $crlf $+ Continue?" == $true) {
        .write -c filelogs\filercvd.log
        did -r $dname 30,31,32,33
        did -ra $dname 34,35 0
        did -b $dname 36,38
      }
    }
    if ($did == 38) { 
      .write -dl $did($dname,30).sel filelogs\filercvd.log
      unset %datanum
      did -b $dname 36,38
      did -r $dname 30,31,32,33,34,35
      set %datafile filelogs\filercvd.log
      set %datanum 30
      .timer 1 0 /dataload      
    }

    if ($did == 40) { did -c $dname 41,42,43 $did($dname,40).sel | did -e $dname 48 }
    if ($did == 41) { did -c $dname 40,42,43 $did($dname,41).sel | did -e $dname 48 }
    if ($did == 42) { did -c $dname 41,40,43 $did($dname,42).sel | did -e $dname 48 }
    if ($did == 43) { did -c $dname 41,42,40 $did($dname,43).sel | did -e $dname 48 }
    if ($did >= 40 && $did <= 43) {
      var %tmp = $read(filelogs\failsend.log,n,$did($dname,40).sel)
      if ($exists($gettok(%tmp,1,127)) == $true) { did -e $dname 46 }
      else { did -b $dname 46 }
    }
    if ($did == 46) { 
      var %tmp = $read(filelogs\failsend.log,n,$did($dname,40).sel)
      .run $gettok(%tmp,1,127)
    }
    if ($did == 47) {
      if ($?!="You are about to PERMANENTLY clear this log file. $crlf $crlf $+ Continue?" == $true) {
        .write -c filelogs\failsend.log
        did -r $dname 40,41,42,43
        did -ra $dname 44,45 0
        did -b $dname 46,48
      }
    }
    if ($did == 48) { 
      .write -dl $did($dname,40).sel filelogs\failsend.log
      unset %datanum
      did -b $dname 46,48
      did -r $dname 40,41,42,43,44,45
      set %datafile filelogs\failsend.log
      set %datanum 40
      .timer 1 0 /dataload      
    }

    if ($did == 50) { did -c $dname 51,52,53 $did($dname,50).sel | did -e $dname 58 }
    if ($did == 51) { did -c $dname 50,52,53 $did($dname,51).sel | did -e $dname 58 }
    if ($did == 52) { did -c $dname 51,50,53 $did($dname,52).sel | did -e $dname 58 }
    if ($did == 53) { did -c $dname 51,52,50 $did($dname,53).sel | did -e $dname 58 }
    if ($did >= 50 && $did <= 53) {
      var %tmp = $read(filelogs\failget.log,n,$did($dname,50).sel)
      if ($exists($gettok(%tmp,1,127)) == $true) { did -e $dname 56 }
      else { did -b $dname 56 }
    }
    if ($did == 56) { 
      var %tmp = $read(filelogs\failget.log,n,$did($dname,50).sel)
      .run $gettok(%tmp,1,127)
    }
    if ($did == 57) {
      if ($?!="You are about to permanently clear this log file. $crlf $crlf $+ Continue?" == $true) {
        .write -c filelogs\failget.log
        did -r $dname 50,51,52,53
        did -ra $dname 54,55 0
        did -b $dname 56,58
      }
    }
    if ($did == 58) { 
      .write -dl $did($dname,50).sel filelogs\failget.log
      unset %datanum
      did -b $dname 56,58
      did -r $dname 50,51,52,53,54,55
      set %datafile filelogs\failget.log
      set %datanum 50
      .timer 1 0 /dataload      
    }

    if ($did == 500) {
      unset %datafile
      unset %datanum
      unset %dataloop
      unset %datasize
    }
  }
}
alias dataload {
  if (%datafile == $null) { halt }
  if (%dataloop == $null) { 
    set %dataloop 1
    set %datasize 0
    did -b data_manager $calc(%datanum)
    did -b data_manager $calc(%datanum + 1)
    did -b data_manager $calc(%datanum + 2)
    did -b data_manager $calc(%datanum + 3)
  }
  var %loop 1
  var %totallines $lines(%datafile)
  while (%dataloop <= %totallines && %loop <= 100) {
    ;    if ($int($calc(%dataloop / 10)) == $calc(%dataloop / 10)) { /rline @Loading 1 $int($calc(%dataloop / %totallines * 100)) $+ % }
    var %tmp = $read(%datafile,n,%dataloop)
    if (%datafile == filelogs\filercvd.log) {
      if ($left(%tmp,8) == Received) {
        did -a data_manager $calc(%datanum) $mid(%tmp,$calc($pos(%tmp,$chr(32) $+ from $+ $chr(32)) + 6),$calc($pos(%tmp,$chr(32) $+ on $+ $chr(32)) - $pos(%tmp,$chr(32) $+ from $+ $chr(32)) - 6))
        did -a data_manager $calc(%datanum + 1) $nopath($mid(%tmp,10,$calc($pos(%tmp,$chr(32) $+ from $+ $chr(32)) - 10)))
        did -a data_manager $calc(%datanum + 2) N/A
        did -a data_manager $calc(%datanum + 3) $mid(%tmp,$calc($pos(%tmp,$chr(32) $+ on $+ $chr(32)) + 7),4) $+ / $+ $mid(%tmp,$calc($pos(%tmp,$chr(32) $+ on $+ $chr(32)) + 12),2) $+ / $+ $right(%tmp,2) $mid(%tmp,$calc($pos(%tmp,$chr(32) $+ on $+ $chr(32)) + 15),5)
      }
      else {
        did -a data_manager $calc(%datanum) $gettok(%tmp,2,127)
        did -a data_manager $calc(%datanum + 1) $nopath($gettok(%tmp,1,127))
        did -a data_manager $calc(%datanum + 2) $size($gettok(%tmp,3,127))
        did -a data_manager $calc(%datanum + 3) $gettok(%tmp,4,127)
        inc %datasize $gettok(%tmp,3,127)
      }
    }
    else {
      if ($left(%tmp,4) == Sent) {
        did -a data_manager $calc(%datanum) $mid(%tmp,$calc($pos(%tmp,$chr(32) $+ to $+ $chr(32)) + 4),$calc($pos(%tmp,$chr(32) $+ on $+ $chr(32)) - $pos(%tmp,$chr(32) $+ to $+ $chr(32)) - 4))
        did -a data_manager $calc(%datanum + 1) $mid(%tmp,6,$calc($pos(%tmp,$chr(32) $+ to $+ $chr(32)) - 6))
        did -a data_manager $calc(%datanum + 2) N/A
        did -a data_manager $calc(%datanum + 3) $mid(%tmp,$calc($pos(%tmp,$chr(32) $+ on $+ $chr(32)) + 7),4) $+ / $+ $mid(%tmp,$calc($pos(%tmp,$chr(32) $+ on $+ $chr(32)) + 12),2) $+ / $+ $right(%tmp,2) $mid(%tmp,$calc($pos(%tmp,$chr(32) $+ on $+ $chr(32)) + 15),5)
      }
      else {
        did -a data_manager $calc(%datanum) $gettok(%tmp,2,127)
        did -a data_manager $calc(%datanum + 1) $nopath($gettok(%tmp,1,127))
        did -a data_manager $calc(%datanum + 2) $size($gettok(%tmp,3,127))
        did -a data_manager $calc(%datanum + 3) $gettok(%tmp,4,127)
        inc %datasize $gettok(%tmp,3,127)
      }
    }
    inc %dataloop
    inc %loop
  }
  if (%dataloop >= %totallines) {
    did -ra data_manager $calc(%datanum + 4) $calc(%dataloop - 1)
    did -ra data_manager $calc(%datanum + 5) $size(%datasize)
    did -e data_manager $calc(%datanum)
    did -e data_manager $calc(%datanum + 1)
    did -e data_manager $calc(%datanum + 2)
    did -e data_manager $calc(%datanum + 3)
    unset %datafile
    unset %dataloop 1
    unset %datasize 0
    unset %datanum
  }
  else { .timer 1 0 /dataload }
}

on *:GETFAIL:*.*: { write $shortfn(filelogs/failget.log) $filename $+ $chr(127) $+ $nick $+ $chr(127) $+ $file($shortfn($filename)).size $+ $chr(127) $+ $asctime(ddd mm/dd/yy HH:nn) }
on *:SENDFAIL:*.*: { write $shortfn(filelogs/failsend.log) $filename $+ $chr(127) $+ $nick $+ $chr(127) $+ $file($shortfn($filename)).size $+ $chr(127) $+ $asctime(ddd mm/dd/yy HH:nn) }
on *:FILESENT:*.*: { write $shortfn(filelogs/filesent.log) $filename $+ $chr(127) $+ $nick $+ $chr(127) $+ $file($shortfn($filename)).size $+ $chr(127) $+ $asctime(ddd mm/dd/yy HH:nn) }
on *:FILERCVD:*.*: { write $shortfn(filelogs/filercvd.log) $filename $+ $chr(127) $+ $nick $+ $chr(127) $+ $file($shortfn($filename)).size $+ $chr(127) $+ $asctime(ddd mm/dd/yy HH:nn) }

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
