on *:start:{
  %mp3stuffampwait = 10
  .timer 1 0 stuffamp skin
  if (%mp3stuffcheck) && (* !iswm $k) check
  if (%mp3stuffampdesktop !isnum) %mp3stuffampdesktop = 1
  if (%mp3stuffampstart) stuffamp
  var %this = $script, %x = $script(0)
  while (%x) {
    var %that = $script(%x)
    if ($shortfn(%this) == $shortfn(%that)) && (%this != %that) .unload -rs " $+ %that $+ "
    dec %x
  }
}
on *:load:stuffamp.init
on *:unload:%mp3stuffampunloaded = 1
alias -l n if ($1-) return | return 1
alias stuffamp.init {
  unset %mp3stuffampunloaded
  if ($version < 5.8) {
    e You need mIRC v5.8+ to run Stuffamp.
    unload -rs " $+ $script $+ "
    return
  }
  echo $colour(info) $iif($window(@mp3stuff loaded),@mp3stuff loaded) $iif($k,%mp3stuffbullet,***) $stuffampversion loaded. Read stuffamp.txt for hidden features. $iif(* !iswm $k,Type /stuffamp to open the player.)
  if ($len(%mp3stuffampskin) < 1) {
    if ($k) $k t player mIRC
    %mp3stuffampskin = $sfn($scriptdir) $+ skins\boamp\
  }
  if (%mp3stuffcheck isnum) {
    %mp3stuffampnoinstall = 1
    check
    if ($inmp3) stuffamp
  }
  else {
    %mp3stuffcheck = 1
    %mp3stuffinstall = 1
    stuffamp
  }
}
on *:mp3end:{
  if ($player) && ($k) { }
  elseif (%mp3stuffamprep) splay -p $filename
}
on *:active:@[Stuffamp]title:{
  window -n @[Stuffamp]title
  if ($window(@[Stuffamp])) {
    window -a @[Stuffamp]
    tb
  }
}
on *:active:@[Stuffamp]:if ($window(@[Stuffamp])) tb
;($lactive == @[Stuffamp])
on *:active:*:if ($window(@[Stuffamp])) tb 1
on *:appactive:if ($window(@[Stuffamp])) act
alias stuffampversion var %v = 2002.08.11 | if ($1) return %v | return Stuffamp [[ $+ %v $+ ]]
alias -l player if (%mp3stuffplayer == mirc) return 1
alias splay {
  .timerstuffampsplay -o 1 0 !splay $1-
  .timerstuffampsplay -e
  %mp3stuffamppos = $inmp3.pos
  if ($gettok($1-,-2,32) == seek) %mp3stuffampvbrlength = $calc(%mp3stuffamplength +($inmp3.length -%mp3stuffamplength)*$inmp3.pos /$inmp3.length)
  if (*pause iswm $1-) paused 1
  if ($istok(skip stop resume,$gettok($1-,-1,32),32)) paused
  if ($isid) { }
  elseif (%mp3stuffampnolurk) return
  if ($inmp3) { if (* !iswm $window(@[Stuffamp])) stuffamp }
  if ($window(@[Stuffamp])) {
    draw
    clb
    d
  }
}
alias -l clb {
  var %c = %mp3stuffampclb
  unset %mp3stuffampclb
  %c
}
alias -l k if ($script(mp3stuff.mrc)) return mp3stuff [ $+ [ $1- ] ]
alias -l d drawpic @[Stuffamp]
alias -l sfn return $shortfn($replace($1-,?,$chr(32)))
alias -l p {
  if ($isid) {
    if ($2) var %s = $2
    else var %s = %mp3stuffampskin
    if (%s) return " $+ $instok(%s,$1,0,92) $+ .bmp"
    return " $+ $scriptdir $+ skins\boamp\ $+ $1 $+ .bmp"
  }
  if (* !iswm $window(@[Stuffamp])) stuffamp
  drawpic -cn @[Stuffamp] $1-
}
alias -l checkskin {
  var %d = $1, %x = main balance cbuttons monoster numbers playpaus posbar shufrep text titlebar volume
  while (%x) {
    var %f = $p($gettok(%x,1,32),%d)
    if ($isfile(%f)) { }
    else {
      if (%d == $sfn($scriptdir) $+ skins\boamp\) {
        e File missing: " $+ $longfn(%f) $+ ". Please re-install Stuffamp.
        close -@ @[Stuffamp]
        aboutstuffamp
        halt
      }
      else e File missing: " $+ $longfn(%f) $+ ". Switching to default skin.
      return 1
    }
    %x = $deltok(%x,1,32)
  }
}
alias -l skin {
  if ($isdir(%mp3stuffampskin)) var %d = $sfn(%mp3stuffampskin)
  else var %d = $sfn($scriptdir) $+ skins\boamp\
  if ($1) {
    if ($version > 5.8) %d = $sfn($$sdir(%d,Pick a directory that contains an unzipped Winamp skin.))
    else %d = $sfn($$sdir="Pick a directory that contains an unzipped Winamp skin.") %d
  }
  if ($checkskin(%d)) %d = $sfn($scriptdir) $+ skins\boamp\
  if (* iswm %d) {
    %mp3stuffampskin = %d
    if ($1) stuffamp $xy
  }
}
alias -l fn if ($1) return $replace($longfn($1-),$chr(32),?,??,*,?,$chr(32),*,*?,*,$chr(32))
alias -l xy {
  if ($window(@[Stuffamp]).mdi) return $window(@[Stuffamp]).x $window(@[Stuffamp]).y
  return $window(@[Stuffamp]).dx $window(@[Stuffamp]).dy
}
alias stuffamp {
  if ($1 == splay) return $splay($2-)
  if ($1-) && ($1 !isnum) {
    $1-
    return
  }
  var %s = %mp3stuffampshaded
  %mp3stuffampshaded = 0
  skin
  close -@ @[Stuffamp] @[Stuffamp]title
  win
  drawfill -r @[Stuffamp] 0 0 990 990
  unset %mp3stuffampclb
  main
  shaded %s
  win
}
alias -l win {
  var %o
  if ($window(@[Stuffamp])) {
    if (%mp3stuffampontop) %o = -oa
    else %o = -ua
    if (%mp3stuffampdesktop != 1) %o = %o $+ w
    if (minimized != $window(@[Stuffamp]).state) window %o @[Stuffamp]
  }
  else {
    if (%mp3stuffampdesktop) %o = -iBdnphk0
    else %o = -iBnphk0
    if (* iswm %mp3stuffampxy) var %p = %mp3stuffampxy
    else var %p = -1 -1
    window %o +d @[Stuffamp] %p 275 116
    var %f = $shortfn($scriptdir) $+ stuffamp.ico
    if ($version >= 5.9) && ($isfile(%f)) window @[Stuffamp] %f
    window -a @[Stuffamp]
  }
}
alias -l b return system minimize shade x eq pl cbz cbx cbc cbv cbb cbl shuf rep
alias -l main {
  if ($window(@[Stuffamp])) {
    drawpic -c
    p 0 0 $p(main)
    shaded %mp3stuffampshaded
    tokenize 32 $b
    while ($1) {
      $1
      tokenize 32 $2-
    }
    f
    draw
  }
}
alias -l shaded {
  %mp3stuffampshaded = $1
  tb 1 $2
}
alias -l tb {
  if ($active == @[Stuffamp]) && ($appactive) var %a = 1
  else var %a = 0
  if (%a != %mp3stuffampactive) || ($1) {
    %mp3stuffampactive = %a
    if (%a) || ($1) {
      if (%mp3stuffampontop) || (minimized == $window(@[Stuffamp]).state) { }
      elseif ($version != 6.02) {
        window -o @[Stuffamp]
        window -u @[Stuffamp]
      }
    }
    if (%mp3stuffampshaded) %a = 3 - %a
    elseif (%mp3stuffampllama) %a = 5 - %a
    else %a = 1 - %a
    if (%a) p 0 0 27 $gettok(15 29 42 57 72,%a,32) 275 14 $p(titlebar)
    else p 0 0 27 0 275 14 $p(titlebar)
  }
  if ($2) { }
  else draw
}
alias -l act {
  if ($version == 6.02) return
  %mp3stuffampappactive = $appactive
  if (%mp3stuffampappactive) && (minimized != $window(@[Stuffamp]).state) {
    window -o @[Stuffamp]
    if (%mp3stuffampontop != 1) window -u @[Stuffamp]
  }
}
on *:close:@[Stuffamp]:closeamp
alias -l closeamp {
  if (%mp3stuffampnostop != 1) splay -p stop
  %mp3stuffampwait = 10
  close -@ @[Stuffamp] @[Stuffamp]title
  halt
}
alias -l hlb {
  if ($timer(stuffampmove)) return 1
  if (%mp3stuffampclb) if ($inrect(%x,%y, [ $ [ $+ [ %mp3stuffampclb ] ] ] )) return
  clb
  var %x = $mouse.x, %y = $mouse.y, %n, %c, %i
  if (%mp3stuffampshaded) {
    %c = cbz cbx cbc cbv cbb cbl timedisp system minimize shade x
    %n = 169,4,8,7 177,4,10,7 187,4,9,7 196,4,9,7 205,4,9,7 216,4,9,7 129,4,29,6 6,3,9,9 244,3,9,9 254,3,9,9 264,3,9,9
  }
  else {
    %c = eq pl cbz cbx cbc cbv cbb cbl shuf rep bolt timedisp system minimize shade x
    %n = 219,58,23,13 242,58,23,13 16,88,23,18 39,88,23,18 62,88,23,18 85,88,23,18 108,88,22,18 136,89,22,16 164,89,46,15 210,89,28,15 252,91,14,14 36,26,61,14 6,3,9,9 244,3,9,9 254,3,9,9 264,3,9,9
  }
  %i = $numtok(%n,32)
  while (%i) {
    if ($inrect(%x,%y, [ $gettok(%n,%i,32) ] )) {
      %c = $gettok(%c,%i,32)
      if (%c != %mp3stuffampclb) {
        %c 1
        %mp3stuffampclb = %c
      }
      return
    }
    dec %i
  }
  return 1
}
alias -l nn {
  if (?? iswm $1) return $1
  if (? iswm $1) return 0 $+ $1
  return 00
}
alias -l move {
  if ($1 == pos) {
    if ($inmp3) && ($mouse.key & 1) || ($show != $true) {
      %mp3stuffampclb = pos
      pos
      if (%mp3stuffampshaded) {
        var %l = %mp3stuffamplength, %x = $max(0,$min(14,$calc($mouse.dx -228-$window(@[Stuffamp]).dx))), %p = $max(0,$min(%l,$calc(%x /14*%l)))
        pos $calc(226+$max(1,$min(13,%x)))
        var %n = %mp3stuffampremain, %x = $int($calc(.001*%p)), %f = 5 6 $p(text)
        if (%n) %x = $int($calc(.001*%l -%x))
        var %y = $nn($calc(%x % 60)), %x = $nn($int($calc((%x /60)%100)))
        tokenize 32 $left(%x,1) $right(%x,1) $left(%y,1) $right(%y,1)
        if (%n) p 129 4 75 6 %f
        else p 129 4 150 0 %f
        p 134 4 $calc(5*$1) 6 %f
        p 139 4 $calc(5*$2) 6 %f
        p 147 4 $calc(5*$3) 6 %f
        p 152 4 $calc(5*$4) 6 %f
      }
      else {
        var %l = %mp3stuffamplength, %x = $max(0,$min(219,$calc($mouse.dx -30-$window(@[Stuffamp]).dx))), %p = $max(0,$min(%l,$calc(%x /219*%l)))
        pos $calc(16+%x)
        var %x = $int($calc(.001*%p)), %y = $int($calc(.001*%l))
        title 9 $nn($int($calc((%x /60)%100)))
        title 12 $nn($calc(%x % 60))
        title 15 $nn($int($calc((%y /60)%100)))
        title 18 $nn($calc(%y % 60))
        title 22 $int($calc(100*%p /%l)) $+ % $+ )  
      }
      %mp3stuffampseek = $int($min(%p,%l))
      .timerstuffampmove -o 1 0 stuffamp move pos
    }
    elseif ($inmp3) {
      splay -p seek %mp3stuffampseek
      clb
    }
  }
  elseif ($mouse.key & 1) || ($show != $true) {
    if ($1 == title) {
      %mp3stuffampclb = title 0
      var %w = $window(@[Stuffamp]title).w, %x = $int($calc(($2 -$mouse.dx) % %w))
      if (%x < 0) %mp3stuffampoffset = %x + %w
      else %mp3stuffampoffset = %x
      scroll %mp3stuffampoffset
      %mp3stuffampwait = 10
    }
    elseif ($1 == volume) {
      var %v = $max(0,$min(100,$int($calc(($mouse.dx -113-$window(@[Stuffamp]).dx)/.51))))
      vol -p $int($calc(655.35*%v))
      %mp3stuffampvolume = $vol(mp3)
      %mp3stuffampclb = volume
      volume 1
      if (%v > 99) title 8 100%
      elseif (%v < 10) title 8 %v $+ %  
      else title 8 %v $+ % $+  
      d
    }
    if ($1 == move) {
      var %m = $window(@[Stuffamp]).mdi, %h = $window(@[Stuffamp]).h, %x = $calc($mouse.dx -$2), %y = $calc($mouse.dy -$3)
      if ($mouse.key !& 4) {
        %x = $snap(%x,0)
        %y = $snap(%y,0)
        if (%m) %m = -3
        else %m = -1
        %x = $snap(%x,$calc($window(%m).w -275))
        %y = $snap(%y,$calc($window(%m).h -%h))
        ;desktop
        if (%m == -1) {
          var %wx = $window(-2).x, %wy = $window(-2).y, %ww = $window(-2).w, %wh = $window(-2).h
          if ($inrect(%x,%y,$calc(%wx -291),$calc(%wy -16-%h),$calc(307+%ww),32)) {
            %y = %wy - %h
            %x = $snap(%x,$calc(%wx -275+%ww))
            %x = $snap(%x,%wx)
          }
          elseif ($inrect(%x,%y,$calc(%wx -291),$calc(%wy -16+%wh),$calc(307+%ww),32)) {
            %y = %wy + %wh
            %x = $snap(%x,$calc(%wx -275+%ww))
            %x = $snap(%x,%wx)
          }
          if ($inrect(%x,%y,$calc(%wx -291),$calc(%wy -16-%h),32,$calc(%h +32+%wh))) {
            %x = %wx - 275
            %y = $snap(%y,$calc(%wy -%h +%wh))
            %y = $snap(%y,%wy)
          }
          elseif ($inrect(%x,%y,$calc(%wx -16+%ww),$calc(%wy -16-%h),32,$calc(%h +32+%wh))) {
            %x = %wx + %ww
            %y = $snap(%y,$calc(%wy -%h +%wh))
            %y = $snap(%y,%wy)
          }
        }
      }
      window @[Stuffamp] %x %y
    }
    .timerstuffampmove -o 1 0 stuffamp move $1-
  }
  else {
    %mp3stuffampxy = $window(@[Stuffamp]).x $window(@[Stuffamp]).y
    clb
  }
  d
}
alias -l snap {
  while ($2 isnum) {
    if ($abs($calc($1 -$2)) < 16) return $2
    tokenize 32 $1 $3-
  }
  return $1
}
alias -l system {
  if ($isid) return 6,3,9,9
  if ($1) p 6 3 0 9 9 9 $p(titlebar)
  else p 6 3 0 0 9 9 $p(titlebar)
}
alias -l minimize {
  if ($isid) return 244,3,9,9
  if ($1) p 244 3 9 9 9 9 $p(titlebar)
  else p 244 3 9 0 9 9 $p(titlebar)
}
alias -l shade {
  if ($isid) return 254,3,9,9
  if ($1) var %x = 9
  else var %x = 0
  if (%mp3stuffampshaded) p 254 3 %x 27 9 9 $p(titlebar)
  else p 254 3 %x 18 9 9 $p(titlebar)
}
alias -l x {
  if ($isid) return 264,3,9,9
  if ($1) p 264 3 18 9 9 9 $p(titlebar)
  else p 264 3 18 0 9 9 $p(titlebar)
}
alias -l bolt return 252,91,14,14
alias -l timedisp {
  if (%mp3stuffampshaded) return 129,4,29,6
  return 36,26,61,14
}
alias -l volume {
  if ($isid) return 107,58,68,11
  var %p = $p(volume), %v = $vol(mp3) / 65535
  p 107 57 0 $calc(15*$int($calc(27*%v))) 68 13 %p
  if ($1) p $calc(107+$int($calc(51*%v))) 58 0 422 14 11 %p
  else p $calc(107+$int($calc(51*%v))) 58 15 422 14 11 %p
}
alias -l balance {
  ;  if ($isid) return 177,58,38,11
  var %p = $p(balance)
  p 177 57 9 0 38 13 %p
  if ($1) p 189 58 0 422 14 11 %p
  else p 189 58 15 422 14 11 %p
}
alias -l eq {
  if ($isid) return 219,58,23,13
  if ($1) var %x = 46
  else var %x = 0
  if (%mp3stuffampeq) p 219 58 %x 73 23 12 $p(shufrep)
  else p 219 58 %x 61 23 12 $p(shufrep)
}
alias -l pl {
  if ($isid) return 242,58,23,13
  if ($1) var %x = 69
  else var %x = 23
  if (%mp3stuffamppl) p 242 58 %x 73 23 12 $p(shufrep)
  else p 242 58 %x 61 23 12 $p(shufrep)
}
alias -l cbz {
  if (%mp3stuffampshaded) return 169,4,8,7
  if ($isid) return 16,88,23,18
  if ($1) p 16 88 0 18 23 18 $p(cbuttons)
  else p 16 88 0 0 23 18 $p(cbuttons)
}
alias -l cbx {
  if (%mp3stuffampshaded) return 177,4,10,7
  if ($isid) return 39,88,23,18
  if ($1) p 39 88 23 18 23 18 $p(cbuttons)
  else p 39 88 23 0 23 18 $p(cbuttons)
}
alias -l cbc {
  if (%mp3stuffampshaded) return 187,4,9,7
  if ($isid) return 62,88,23,18
  if ($1) p 62 88 46 18 23 18 $p(cbuttons)
  else p 62 88 46 0 23 18 $p(cbuttons)
}
alias -l cbv {
  if (%mp3stuffampshaded) return 196,4,9,7
  if ($isid) return 85,88,23,18
  if ($1) p 85 88 69 18 23 18 $p(cbuttons)
  else p 85 88 69 0 23 18 $p(cbuttons)
}
alias -l cbb {
  if (%mp3stuffampshaded) return 205,4,9,7
  if ($isid) return 108,88,22,18
  if ($1) p 108 88 92 18 22 18 $p(cbuttons)
  else p 108 88 92 0 22 18 $p(cbuttons)
}
alias -l cbl {
  if (%mp3stuffampshaded) return 216,4,9,7
  if ($isid) return 136,89,22,16
  if ($1) p 136 89 114 16 22 16 $p(cbuttons)
  else p 136 89 114 0 22 16 $p(cbuttons)
}
alias -l shuf {
  if ($isid) return 164,89,46,15
  if ($1) var %x = 15
  else var %x = 0
  if (%mp3stuffampshuf) p 164 89 28 $calc(30+%x) 47 15 $p(shufrep)
  else p 164 89 28 %x 47 15 $p(shufrep)
}
alias -l rep {
  if ($isid) return 210,89,28,15
  if ($1) var %x = 15
  else var %x = 0
  if (%mp3stuffamprep) p 210 89 0 $calc(30+%x) 28 15 $p(shufrep)
  else p 210 89 0 %x 28 15 $p(shufrep)
}
alias -l length {
  if (%mp3stuffampvbr) return %mp3stuffampvbrlength
  return %mp3stuffamplength
}
alias -l pos {
  if (%mp3stuffampshaded) {
    if ($isid) {
      if ($inmp3) return 228,4,15,9
      return 0,0,0,0
    }
    var %p = $p(titlebar)
    p 226 4 0 36 17 7 %p
    if ($inmp3) {
      if ($1) var %x = $int($1)
      else var %x = $int($calc(227+12*$max(0,$min(1,$calc($inmp3.pos /$length)))))
      if (%x < 232) p %x 4 17 36 3 7 %p
      elseif (%x > 234) p %x 4 23 36 3 7 %p
      else p %x 4 20 36 3 7 %p
    }
  }
  else {
    if ($isid) return 17,72,248,10
    var %p = $p(posbar)
    p 16 72 0 0 248 10 %p
    if ($inmp3) {
      if ($1) p $int($1) 72 278 0 29 10 %p
      else p $int($calc(16+219*$max(0,$min(1,$calc($inmp3.pos /$length))))) 72 248 0 29 10 %p
    }
  }
}
alias -l draw {
  if (* !iswm $window(@[Stuffamp])) if (* !iswm $timer(stuffampmove)) || ($1) return
  if ($1) || (* !iswm $timer(mp3stuffamp)) .timermp3stuffamp $iif(%mp3stuffamphigh,-hom,-om) 0 200 if ($window(@[Stuffamp])) stuffamp draw 1 $chr(124) else .timermp3stuffamp off
  %mp3stuffampmove = 0
  tb 0 1
  var %inmp3 = $inmp3, %pos = $inmp3.pos, %fname = $inmp3.fname
  if (%inmp3) if ($isfile(%fname)) if ($sfn(%fname) $file(%fname).size != $sfn(%mp3stuffampfile) %mp3stuffampsize) f
  var %o = $1, %n = %mp3stuffampremain, %x = $int($calc(.001*%pos /$length *%mp3stuffamplength)), %r = $calc(.001*%mp3stuffamplength -%x)
  if (%mp3stuffamppos != %pos) {
    %mp3stuffamppaused = 0
    %mp3stuffamppos = %pos
  }
  var %paused = %mp3stuffamppaused
  if (%paused) && (%mp3stuffampblink > 4) || (%paused != 1) && (%inmp3) {
    if (%n) %x = $int(%r)
    var %y = $nn($calc(%x % 60)), %x = $nn($int($calc((%x /60)%100)))
    tokenize 32 $left(%x,1) $right(%x,1) $left(%y,1) $right(%y,1)
  }
  else {
    %n = 0
    tokenize 32 10 10 10 10
  }
  if (%mp3stuffampshaded) && (%mp3stuffampclb != pos) {
    var %p = 5 6 $p(text)
    if (%n) p 129 4 75 6 %p | else p 129 4 150 0 %p
    if ($1 == 10) p 134 4 150 0 %p | else p 134 4 $calc(5*$1) 6 %p
    if ($2 == 10) p 139 4 150 0 %p | else p 139 4 $calc(5*$2) 6 %p
    if ($3 == 10) p 147 4 150 0 %p | else p 147 4 $calc(5*$3) 6 %p
    if ($4 == 10) p 152 4 150 0 %p | else p 152 4 $calc(5*$4) 6 %p
  }
  else {
    var %p = $p(numbers)
    if (%n) p 38 32 20 6 5 1 %p
    else p 38 32 92 6 5 1 %p
    p 48 26 $calc(9*$1) 0 9 13 %p
    p 60 26 $calc(9*$2) 0 9 13 %p
    p 79 26 $calc(9*$3) 0 9 13 %p
    p 91 26 $calc(9*$4) 0 9 13 %p
  }
  if (%o) && (%paused) %mp3stuffampblink = $calc((1+%mp3stuffampblink) % 12)
  if ($istok(volume balance pos title,$gettok(%mp3stuffampclb,1,32),32)) { }
  else {
    if (* !iswm $window(@[Stuffamp]title)) title
    var %w = $window(@[Stuffamp]title).w
    if (%w > 155) {
      if (%o) {
        if (%mp3stuffampwait > 0) dec %mp3stuffampwait
        elseif (%mp3stuffampnoscroll != 1) inc %mp3stuffampoffset 5
      }
      %mp3stuffampoffset = $int($calc(%mp3stuffampoffset % %w))
      scroll %mp3stuffampoffset
    }
    elseif ($version < 6.02) drawcopy -n @[Stuffamp]title 0 0 $calc($window(@[Stuffamp]title).w -1) 5 @[Stuffamp] 111 27
    else drawcopy -n @[Stuffamp]title 0 0 $window(@[Stuffamp]title).w 6 @[Stuffamp] 111 27
  }
  if (%mp3stuffampclb != pos) pos
  var %p = $p(playpaus), %s = 2
  if (%paused) %s = 1
  elseif (%inmp3) %s = 0
  if (%s) {
    p 26 28 $gettok(9 18,%s,32) 0 9 9 %p
    p 24 28 33 0 2 9 %p
  }
  else {
    p 26 28 0 0 9 9 %p
    if (%r < 2.5) p 24 28 39 0 3 9 %p
    else p 24 28 36 0 3 9 %p
  }
  var %x = $mouse.x, %y = $mouse.y
  if ($dialog(mp3stuffo) != %mp3stuffampeq) {
    %mp3stuffampeq = $dialog(mp3stuffo)
    if ($inrect(%x,%y,219,58,23,13)) && ($mouse.key & 1) eq 1
    else eq
  }
  if ($dialog(mp3stuffs) != %mp3stuffamppl) {
    %mp3stuffamppl = $dialog(mp3stuffs)
    if ($inrect(%x,%y,242,58,23,13)) && ($mouse.key & 1) pl 1
    else pl
  }
  if (%mp3stuffshuf != %mp3stuffampshuf) && ($player) && ($k) {
    %mp3stuffampshuf = %mp3stuffshuf
    if ($inrect(%x,%y,164,89,46,15)) && ($mouse.key & 1) shuf 1
    else shuf
  }
  if (%mp3stuffcont != %mp3stuffamprep) && ($player) && ($k) {
    %mp3stuffamprep = %mp3stuffcont
    if ($inrect(%x,%y,210,89,28,15)) && ($mouse.key & 1) rep 1
    else rep
  }
  if ($timer(stuffampmove)) { }
  elseif ($vol(mp3) != %mp3stuffampvol) {
    %mp3stuffampvol = $vol(mp3)
    volume
  }
  if (%paused) { if ([paused]* !iswm $window(@[Stuffamp]).titlebar) paused 1 }
  elseif ([paused]* iswm $window(@[Stuffamp]).titlebar) paused
  if (%mp3stuffampshaded) && ($window(@[Stuffamp]).h != 14) || (%mp3stuffampshaded != 1 && ($window(@[Stuffamp]).h == 14)) {
    if (%mp3stuffampshaded) window @[Stuffamp] -1 -1 275 14
    else window @[Stuffamp] -1 -1 275 116
  }
  if ($mouse.key !& 1) %mp3stuffampdisable = 0
  if ($version < 5.9) if (%mp3stuffampappactive != $appactive) act
  d
}
alias -l scroll {
  if (* !iswm $window(@[Stuffamp]title)) title
  if ($version < 6.02) var %ww = 153, %hh = 5
  else var %ww = 154, %hh = 6
  var %w = $window(@[Stuffamp]title).w, %a = $min(%ww,$calc(%w -$1))
  drawcopy -n @[Stuffamp]title $1 0 %a %hh @[Stuffamp] 111 27
  if (%a < %ww) drawcopy -n @[Stuffamp]title 0 0 $min($1,$calc(%ww -%a)) %hh @[Stuffamp] $calc(111+%a) 27
}
alias -l min if ($1 < $2) return $1 | return $2
alias -l max if ($1 > $2) return $1 | return $2
alias -l title {
  if ($isid) return 117,24,149,12
  var %c, %w = @[Stuffamp], %f = 5 6 $p(text), %p = 1, %x = 0, %y = 0, %t = $replace($nopath(%mp3stuffampfile),?, ), %l = $int($calc(.001*%mp3stuffamplength))
  if ($1-) {
    %x = $calc(111+5*$1)
    %y = 27
  }
  if (%mp3stuffamp_) var %_ = 90 6
  else var %_ = 150 0
  if ($1-) %t = $2-
  else {
    if (*.mp3 iswm %t) %t = $left(%t,-4)
    %w = @[Stuffamp]title
    close -@ %w
    window -iBph +d %w 0 0 $window(-1).w 6
    if (%t) %t = %t ( $+ $int($calc(%l /60)) $+ : $+ $nn($calc(%l % 60)) $+ )
    else %t = $stuffampversion
    if ($len(%t) > 31) %t =   $+ %t  *** 
    drawpic -cn %w %x %y 111 27 154 6 $p(main)
  }
  while (%p <= $len(%t)) {
    var %c = 0, %l = $mid(%t,%p,1)
    if (%l isin ÆæÀÁÂÃàáâã) %l = a
    if (%l isin ÈÉÊËèéêë) %l = e
    if (%l isin ÌÍÎÏìíîï) %l = i
    if (%l isin ÒÓÔÕòóôõ) %l = o
    if (%l isin ÙÚÛÜùúûü) %l = u
    %l = $replace(%l,ø,0,Ø,0,Ç,c,ç,c,Ð,d,Ñ,n,×,x,Ý,y,ß,b,ð,d,ñ,n,ý,y)
    if (%l isletter) %c = $calc($asc($lower(%l))*5-485) 0
    elseif (%l isnum 0-9) %c = $calc(5*%l) 6
    else {
      %c = $replace(%l,",130 0,.,55 6,:,60 6,$chr(40),65 6,$chr(41),70 6,-,75 6,`,',‘,',’,',´,',',80 6,!,85 6,_,%_,+,95 6,\,100 6,/,105 6,[,110 6,],115 6,^,120 6,&,125 6,%,130 6,$chr(44),135 6,=,140 6,$,145 6,$chr(35),150 6,Å,å,å,0 12,Ö,ö,ö,5 12,Ä,ä,ä,10 12,?,15 12,*,20 12)
      if (%l == @) {
        drawpic -cn %w %x %y 135 0 %f
        inc %x 5
        %c = 140 0
      }
    }
    if (*? ?* !iswm %c) %c = 150 0
    drawpic -cn %w %x %y %c %f
    inc %x 5
    inc %p
  }
  drawpic %w
  if ($1-) return
  window %w -1 -1 $max(154,%x) 6
  if ($1 != 0) {
    %mp3stuffampwait = 5
    %mp3stuffampoffset = 0
  }
  %t = $calc(+%mp3stuffampkbps)
  if (%t < 100) p 111 43 150 0 %f | else p 111 43 $calc(5*$mid(%t,-3,1)) 6 %f
  if (%t < 10) p 116 43 150 0 %f | else p 116 43 $calc(5*$mid(%t,-2,1)) 6 %f
  if (%t) p 121 43 $calc(5*$right(%t,1)) 6 %f | else p 121 43 150 0 %f
  %t = $calc(+%mp3stuffampkhz)
  if (%t < 10) p 156 43 150 0 %f | else p 156 43 $calc(5*$mid(%t,-2,1)) 6 %f
  if (%t) p 161 43 $calc(5*$right(%t,1)) 6 %f | else p 161 43 150 0 %f
  var %p = $p(monoster), %t = %mp3stuffampmonoster
  if (%t == mono) %t = 1 | elseif (%t) %t = 2
  if (%t == 1) p 212 41 29 0 29 12 %p | else p 212 41 29 12 29 12 %p
  if (%t == 2) p 239 41 0 0 29 12 %p | else p 239 41 0 12 29 12 %p
}
alias -l cbuttons {
  var %x = $1, %y = $2
  if ($isfile($f)) || ($inmp3) {
    if ($inrect($1,$2, [ $cbz ] )) push cbz
    elseif ($inrect($1,$2, [ $cbx ] )) push cbx
    elseif ($inrect($1,$2, [ $cbc ] )) push cbc
    elseif ($inrect($1,$2, [ $cbv ] )) push cbv
  }
  elseif ($inrect($1,$2, [ $cbx ] )) && ($mouse.key & 4) push cbl
  if ($inrect($1,$2, [ $cbb ] )) push cbb
  elseif ($inrect($1,$2, [ $cbl ] )) push cbl
}
alias -l push {
  ;%b = button, %s = shift, %f = file
  var %b = $1, %s, %f = $f
  if ($2 isnum) %s = $2
  elseif ($mouse.key & 4) %s = 1
  if (%s) || (* !iswm %f) && (%b == cbx) %b = cbl
  if ($isfile(%f)) || ($inmp3) { }
  elseif ($istok(cbz cbx cbc cbv,%b,32)) return
  if (%b == cbz) {
    if (%s) {
      if ($inmp3) splay -p seek $max(0,$calc($inmp3.pos -5000))
    }
    elseif ($k) {
      $k prev
      %mp3stuffampfile = %mp3stuffmp3
      close -@ @[Stuffamp]title
    }
    elseif (%mp3stuffamppaused) {
      splay -p seek 0
      splay -p resume
    }
    else splay -p $f
  }
  elseif (%b == cbx) {
    if (%mp3stuffamppaused) splay -p resume
    else splay -p " $+ $f $+ "
  }
  elseif (%b == cbc) {
    if (%mp3stuffamppaused) splay -p resume
    elseif ($inmp3) splay -p pause
  }
  elseif (%b == cbv) {
    var %v = $vol(mp3), %t = 2000 + $ticks
    if (%s) && ($inmp3) {
      while ($calc(%t -$ticks) >= 0) { vol -p $calc($ifmatch /2000*%v) }
    }
    vol -p %v
    splay -p stop
    rep
  }
  elseif (%b == cbb) {
    if (%s) {
      if ($inmp3) splay -p seek $min($int($calc($length -1000)),$calc(5000+$inmp3.pos))
    }
    elseif ($k) && ($player) {
      .timermp3stuff1b1 -e
      splay -p stop
      mp3stuff adv
    }
    else splay -p skip
  }
  elseif (%b == cbl) {
    if ($k) && ($player) {
      .timermp3stuff1b1 -e
      if (%mp3stuffplay) mp3stuff pc
      else mp3stuff lc
      %mp3stuffampdisable = 1
    }
    else {
      if ($isdir(%mp3stuffampdir)) var %f = %mp3stuffampdir
      else var %f = $scriptdir $+ *.mp3
      if ($version > 5.8) %f = $sfn($$sfile(%f,Open an mp3))
      else %f = $sfn($$sfile="Open an mp3") %f
      %mp3stuffampdisable = 1
      if ($isfile(%f)) && (*.mp3 iswm %f) {
        %mp3stuffampdir = $nofile(%f)
        splay -p " $+ %f $+ "
      }
    }
  }
  elseif (%b == eq) {
    kprompt
    if ($k) .timer -o 1 0 if ($dialog(mp3stuffo)) dialog -c mp3stuffo $chr(124) else mp3stuffo
  }
  elseif (%b == pl) {
    kprompt
    if ($k) .timer -o 1 0 if ($dialog(mp3stuffs)) dialog -c mp3stuffs $chr(124) else mp3stuff stuff 6
  }
  elseif (%b == shuf) {
    if ($k) && ($player) mp3stuff .t 0 shuf
    else %mp3stuffampshuf = $iif(%mp3stuffampshuf,0,1)
    shuf
  }
  elseif (%b == rep) {
    if ($k) && ($player) mp3stuff .t 0 cont
    else %mp3stuffamprep = $iif(%mp3stuffamprep,0,1)
    rep
  }
  elseif (%b == vol) {
    if ($2) vol -p $min(65535,$calc(1024+$vol(mp3)))
    else vol -p $max(0,$calc($vol(mp3)-1024))
    %mp3stuffampvol = $vol(mp3)
    volume
  }
  elseif (%b == time) %mp3stuffampremain = $iif(%mp3stuffampremain,0,1)
  elseif (%b == shade) shaded $iif(%mp3stuffampshaded,0,1)
}
alias -l kprompt {
  if ($k) return
  var %file = $scriptdir $+ mp3stuff.mrc
  if ($isfile(%file)) .load -rs " $+ %file $+ "
  else {
    .timer -o 1 0 if ($?!="This feature requires mp3stuff to be loaded.  Visit website?") run http://come.to/andys.site/
    halt
  }
}
menu @[Stuffamp] {
  mouse:{
    if ($mouse.key !& 1) || ($timer(stuffampmove)) %mp3stuffampdisable = 0
    elseif (%mp3stuffampdisable) { } | else hlb
    d
  }
  leave:{
    if (* !iswm $timer(stuffampmove))  {
      clb
      d
    }
  }
  sclick:{
    var %x = $mouse.x, %y = $mouse.y
    tb
    if (%mp3stuffampdisable) {
      %mp3stuffampdisable = 0
      d
      return
    }
    if ($inrect(%x,%y, [ $timedisp ] )) push time
    ;volume
    elseif ($inrect(%x,%y,107,58,68,11)) {
      p 111 27 111 27 154 6 $p(main)
      title 0 volume:
      move volume
      return
    }
    elseif ($inrect(%x,%y, [ $pos ] )) {
      if ($inmp3) {
        p 111 27 111 27 154 6 $p(main)
        title 0 seek to:   :  /  :   (
        move pos
        return
      }
    }
    elseif ($inrect(%x,%y,117,24,149,12)) {
      if (* !iswm $window(@[Stuffamp]title)) title
      if ($window(@[Stuffamp]title).w > 155) {
        move title $calc($mouse.dx +%mp3stuffampoffset)
        return
      }
    }
    elseif ($hlb) {
      if ($window(@[Stuffamp]).mdi) move move $calc($mouse.x +$window(-3).x) $calc($mouse.y +$window(-3).y)
      else move move $mouse.x $mouse.y
    }
    elseif (%mp3stuffampshaded) cbuttons %x %y
    draw
  }
  dclick:{
    var %x = $mouse.x, %y = $mouse.y
    if (%mp3stuffampdisable) {
      %mp3stuffampdisable = 0
      return
    }
    if ($inrect(%x,%y,6,3,9,9)) closeamp
    elseif ($hlb) && ($mouse.y < 15) shaded $iif(%mp3stuffampshaded,0,1)
    elseif ($inrect(%x,%y, [ $timedisp ] )) push time
    elseif (%mp3stuffampshaded) cbuttons %x %y
    draw
  }
  uclick:{
    var %x = $mouse.x, %y = $mouse.y
    if ($timer(stuffampmove)) || (@[Stuffamp] != $active) {
      $replace($timer(stuffampmove).com,stuffamp move,stuffamp .move)
      return
    }
    clb
    if (%mp3stuffampdisable) {
      %mp3stuffampdisable = 0
      d
      return
    }
    ;system
    if ($inrect(%x,%y,6,3,9,9)) aboutstuffamp
    elseif ($inrect(%x,%y,244,3,9,9)) window -n @[Stuffamp]
    elseif ($inrect(%x,%y,254,3,9,9)) push shade
    elseif ($inrect(%x,%y,264,3,9,9)) closeamp
    if (%mp3stuffampshaded != 1) {
      cbuttons %x %y
      if ($inrect(%x,%y,219,58,23,13)) push eq
      elseif ($inrect(%x,%y,242,58,23,13)) push pl
      elseif ($inrect(%x,%y,164,89,46,15)) push shuf
      elseif ($inrect(%x,%y,210,89,28,15)) push rep
      elseif ($inrect(%x,%y,252,91,14,14)) aboutstuffamp
    }
    d
  }
  -
  $m0:n
  $m(timedisp,$iif(%mp3stuffampremain,%mp3stuffamp__0,%mp3stuffamp__1),Time &elapsed,    ,(T toggles)):%mp3stuffampremain = 0
  $m(timedisp,$iif(%mp3stuffampremain,%mp3stuffamp__1,%mp3stuffamp__0),Time &remaining, ,(T toggles)):%mp3stuffampremain = 1
  $m(title,$iif(%mp3stuffamp_,%mp3stuffamp_1,%mp3stuffamp_0),Convert &underscores to spaces):%mp3stuffamp_ = $iif(%mp3stuffamp_,0,1) | title
  $m(title,$iif(%mp3stuffampnoscroll,%mp3stuffamp_1,%mp3stuffamp_0),&Autoscroll songname):%mp3stuffampnoscroll = $iif(%mp3stuffampnoscroll,0,1)
  $m(pos,&Rewind 5 seconds,       ,(Left Arrow)):push cbz 1
  $m(pos,&Fastforward 5 seconds, ,(Right Arrow)):push cbb 1
  $m(cbz,Re&start,$str( ,19),(Click)):push cbz 0
  $m(cbz,&Rewind 5 seconds, ,(Shift+Click)):push cbz 1
  $m(cbx,&Play/restart, ,(Click)):push cbx 0
  $m(cbx,Open &file...,  ,(Shift+Click)):push cbl 0
  $m(cbc,Pause/Unpause, ,(Click)):push cbc 0
  $m(cbv,&Stop,$str( ,19),(Click)):push cbv 0
  $m(cbv,Stop w/ &fadeout, ,(Shift+Click)):push cbv 1
  $m(cbb,$iif($k,&Next,&End),$str( ,29),(Click)):push cbb 0
  $m(cbb,&Fastforward 5 seconds, ,(Shift+Click)):push cbb 1
  $m(cbl,Open file..., ,(Click)):push cbl 0
  $m(eq,$iif($dialog(mp3stuffo),%mp3stuffamp_1,%mp3stuffamp_0),&Options Dialog, ,(O)):push eq
  $m(pl,$iif($dialog(mp3stuffs),%mp3stuffamp_1,%mp3stuffamp_0),&Playlist Editor, ,(P)):push pl
  $m(shuf,$iif($iif($player,%mp3stuffshuf,%mp3stuffampshuf),%mp3stuffamp_1,%mp3stuffamp_0),$iif($player,&Shuffle,&Shuffle), ,(S)):push shuf
  $m(rep,$iif($iif($player,%mp3stuffcont,%mp3stuffamprep),%mp3stuffamp_1,%mp3stuffamp_0),$iif($player,&Continuous play,&Repeat), ,(R)):push rep
  $mm(Version):aboutstuffamp
  $mm($iif($isfile($scriptdirstuffamp.txt),View readme)):run $scriptdir $+ stuffamp.txt
  -
  $mm(Change skin):skin 1
  $mm(Settings)
  .$iif(%mp3stuffampdesktop,%mp3stuffamp_1,%mp3stuffamp_0) Desktop:{
    %mp3stuffampdesktop = $iif(%mp3stuffampdesktop,0,1)
    window -h @[Stuffamp]
    close -@ @@stuffamp
    renwin @[Stuffamp] @@stuffamp
    win
    drawcopy @@stuffamp 0 0 275 $window(@[Stuffamp]).h @[Stuffamp] 0 0
    close -@ @@stuffamp
    win
    paused %mp3stuffamppaused
  }
  .$iif(%mp3stuffampdesktop, [ $iif(%mp3stuffampontop,%mp3stuffamp_1,%mp3stuffamp_0) ] On top):{
    %mp3stuffampontop = $iif(%mp3stuffampontop,0,1)
    if (%mp3stuffampontop) window -o @[Stuffamp]
    elseif (minimized == $window(@[Stuffamp]).state) { }
    else window -u @[Stuffamp]
  }
  .-
  .$iif(%mp3stuffamphigh,%mp3stuffamp_1,%mp3stuffamp_0) High-res timer:%mp3stuffamphigh = $iif(%mp3stuffamphigh,0,1) | draw 1
  .$iif(%mp3stuffampstart,%mp3stuffamp_1,%mp3stuffamp_0) Open on startup:%mp3stuffampstart = $iif(%mp3stuffampstart,0,1)
  .-
  .$iif(%mp3stuffampnostop,%mp3stuffamp_0,%mp3stuffamp_1) Stop mp3 on close:%mp3stuffampnostop = $iif(%mp3stuffampnostop,0,1)
  .$iif(%mp3stuffampnolurk,%mp3stuffamp_0,%mp3stuffamp_1) Open on /splay:%mp3stuffampnolurk = $iif(%mp3stuffampnolurk,0,1)
  -
  $iif(%mp3stuffamp_mp3stuff,$pm(Spam play message)):mp3stuff spam
  $iif(%mp3stuffamp_mp3stuff,$pm(Spam options))
  .$iif(%mp3stuffplay,%mp3stuffamp_1,%mp3stuffamp_0) Auto-spam on play:mp3stuff t 0 play
  .-
  .Edit play message...:mp3stuffo 87
  .-
  .$pm(%mp3stuffamp_setchans):mp3stuff setchans
  -
}
alias -l setchans {
  mp3stuff t playto $mp3stuff(_input(Enter channels/queries separated by commas (Use 'all' for all channels)))
  mp3stuff spt
}
alias -l pm {
  if (%mp3stuffampmenu) { }
  elseif (#* iswm $chan(1)) || ($query(1)) && ($server) return $1-
}
alias -l m0 {
  if ($version < 5.9) {
    %mp3stuffamp_0 = [  ] 
    %mp3stuffamp_1 = [×] 
    %mp3stuffamp__0 =    
    %mp3stuffamp__1 = × 
  }
  else {
    unset %mp3stuffamp_0 %mp3stuffamp__0
    %mp3stuffamp_1 = $style(1)
    %mp3stuffamp__1 = $style(1)
  }
  if ($script(mp3stuff.mrc)) %mp3stuffamp_mp3stuff = 1
  else %mp3stuffamp_mp3stuff = 0
  %mp3stuffamp_setchans = Set channels... [[ $+ %mp3stuffplayto $+ ]]
  unset %mp3stuffampmenu
  .timerstuffampmove off
  .timer -o 1 0 unset % $+ mp3stuffamp_?*
}
alias -l m {
  if (%mp3stuffampmenu == $1) return $2-
  if (%mp3stuffampmenu) return
  var %t = $ [ $+ [ $1 ] ]
  if ($numtok(%t,44) == 4) if ($inrect($mouse.x,$mouse.y, [ %t ] )) {
    %mp3stuffampmenu = $1
    return $2-
  }
}
alias -l mm {
  if (%mp3stuffampmenu) { }
  else return $1-
}
on *:keydown:@[Stuffamp]:*:{
  var %k = . $+ $keyval $+ .
  if (%k isin .90.88.67.86.66.76.83.82.79.80.37.38.39.40.84.87.) push $replace($remove(%k,.),90,cbz,88,cbx,67,cbc,86,cbv,66,cbb,76,cbl,83,shuf,82,rep,79,eq,80,pl,37,cbz 1,39,cbb 1,38,vol 1,40,vol 0,84,time,87,shade)
  elseif (%k == .27.) && (%mp3stuffampdesktop) .timer -om 1 200 window -n @[Stuffamp]
}
alias -l paused {
  %mp3stuffamppaused = $1
  if ($window(@[Stuffamp])) {
    if ($1) titlebar @[Stuffamp] [paused]   $replace($nopath($f),?, )
    else titlebar @[Stuffamp]   $replace($nopath($f),?, )
  }
  if ($1) %mp3stuffampblink = 0
}
alias -l f {
  var %f
  if ($inmp3) %f = $fn($inmp3.fname)
  elseif ($isfile(%mp3stuffampfile)) %f = %mp3stuffampfile
  if ($isid) return %f
  %mp3stuffampfile = %f
  volume
  balance
  var %x, %v, %l, %c, %b, %t, %mpeg, %r = 0, %f = $sfn(%f), %s = $file(%f).size
  if ($isfile(%f)) { }
  else {
    unset %mp3stuffampkbps %mp3stuffampkhz %mp3stuffampmonoster
    title
    return
  }
  %mp3stuffampsize = %s
  if ($k) && ($shortfn(%mp3stuffmp3) == %f) && ($len(%mp3stuffbin)) {
    %b = $gettok(%mp3stuffbin,1,32)
    %l = $gettok(%mp3stuffbin,2,32)
    if (%l) %v = 1
    goto d
  }
  elseif ($k) && (%mp3stuffcache) {
    var %d = $shortfn($scriptdir) $+ mp3stuff.dat
    if ($isfile(%d)) {
      %t = $read -w" $+ $nopath(%f) %s *" %d
      if ($len($gettok(%t,3,32)) == 15) {
        %b = $gettok(%t,3,32)
        %l = $gettok(%t,4,32)
        if (%l) %v = 1
        goto d
      }
    }
  }
  %c = 1
  :r
  if (%r > %s) return
  bread %f %r 4096 &x
  %x = 1
  if ($bfind(&x,%x,Xing)) {
    var %v = 1, %n = 0, %m, %o = $ifmatch
    while (%n < 4) {
      %m = %m $+ $base($bvar(&x,$calc(%o +8+%n)),10,2,8)
      inc %n
    }
    %l = $base(%m,2,10)
    %x = 112 + %o
  }
  :f
  %x = 1 + $bfind(&x,%x,255)
  if (%x !isnum 2-4096) {
    inc %r 4095
    goto r
  }
  %t = $calc($bvar(&x,%x))
  if (%t !isnum 224-231) && (%t <= 239) goto f
  var %b, %y 0
  while (%y < 3) {
    %t = $base($bvar(&x,$calc(%x +%y)),10,2,8)
    if (2 == %y) && (*00 !iswm %t) || (0 *00? iswm %y %t) || (1 1111 isin %y %t) || (1 0000 isin %y %t) || (1 *11?? iswm %y %t) goto f
    %b = %b $+ %t
    inc %y
  }
  %b = $mid(%b,4,15)
  :d
  %mp3stuffampframes = %l
  %mp3stuffampmonoster = $replace($mid(%b,14,2),00,stereo,01,joint stereo,10,stereo,11,mono)
  %l = $calc(4-$base($mid(%b,3,2),2,10))
  %mp3stuffamplayer = %l
  %mpeg = $replace($left(%b,2),11,1.0,10,2.0,00,2.5)
  %t = 1 + $base($mid(%b,10,2),2,10)
  if (%mpeg == 1.0) %t = $gettok(44.1 48 32,%t,32)
  elseif (%mpeg == 2.0) %t = $gettok(22.05 24 16,%t,32)
  elseif (%mpeg == 2.5) %t = $gettok(11.025 12 8,%t,32)
  %mp3stuffampkhz = $int(%t)
  %mp3stuffampvbr = %v
  if (%v) {
    if (%mpeg > 1) %mp3stuffampspf = $gettok(192 576 576,%l,32)
    else %mp3stuffampspf = $gettok(384 1152 1152,%l,32)
    %mp3stuffampsamples = $calc(%mp3stuffampspf *%mp3stuffampframes)
    %mp3stuffamplength = $calc(%mp3stuffampsamples /%t)
    %mp3stuffampkbps = $int($calc(8*%mp3stuffampsize /%mp3stuffamplength))
  }
  else {
    %x = $base($mid(%b,6,4),2,10)
    if (%mpeg == 1) {
      if (%l == 1) %x = 32 * %x
      if (%l == 2) %x = $gettok(32 48 56 64 80 96 112 128 160 192 224 256 320 384,%x,32)
      if (%l == 3) %x = $gettok(32 40 48 56 64 80 96 112 128 160 192 224 256 320,%x,32)
    }
    else {
      if (%l == 1) %x = $gettok(32 48 56 64 80 96 112 128 144 160 176 192 224 256,%x,32)
      else %x = $gettok(8 16 24 32 40 48 56 64 80 96 112 128 144 160,%x,32)
    }
    if (%x isin 0 14) %mp3stuffampkbps = 128
    else %mp3stuffampkbps = %x
    %mp3stuffamplength = $calc(8*%mp3stuffampsize /%mp3stuffampkbps)
    %mp3stuffampsamples = %t * %mp3stuffamplength
    %mp3stuffampframes = %mp3stuffampsamples / %mp3stuffampspf
  }
  %mp3stuffampvbrlength = %mp3stuffamplength
  paused %mp3stuffamppaused
  title
}
alias aboutstuffamp {
  if ($dialog(aboutstuffamp)) {
    dialog -ev aboutstuffamp
    return
  }
  if ($dialog(mp3stuffg)) { }
  else {
    if (%mp3stuffampdesktop) var %o = -dm
    else var %o = -m
    if (%mp3stuffampontop) dialog %o $+ o aboutstuffamp aboutstuffamp
    else dialog %o aboutstuffamp aboutstuffamp
  }
}
alias -l e echo $colour(info) -i × $1-
alias -l id if ($istok($1,$did,44)) $2-
on *:dialog:aboutstuffamp:init,sclick:*:{
  var %d = $did
  if ($devent == init) {
    did -a aboutstuffamp 1 $stuffampversion $+ $crlf $+ by Andy Dufilie (^Andy) $+ $crlf $+ E-mail: a_s_d@snet.net $+ $crlf $+ http://come.to/andys.site/ $+ $str($crlf,2) $+ boamp skin by Borut Hrzenjak $+ $crlf $+ (used with permission)
    if (%mp3stuffcheck) did -c aboutstuffamp 5 %mp3stuffcheck | else did -u aboutstuffamp 5 %mp3stuffcheck
    if (%mp3stuffinstall) did -c aboutstuffamp 6 %mp3stuffinstall | else did -u aboutstuffamp 6 %mp3stuffinstall
    check
  }
  elseif (%d == 3) check
  elseif (%d == 4) downloadstuffamp
  elseif (%d == 5) %mp3stuffcheck = $did(5).state
  elseif (%d == 6) %mp3stuffinstall = $did(6).state
  elseif (%d == 97) run mailto:a_s_d@snet.net?subject= $+ $stuffampversion
  elseif (%d == 99) run http://come.to/andys.site/
}
dialog aboutstuffamp {
  title "stuffamp version"
  size -1 -1 160 70
  option dbu
  button "&Close", 98, 61 55 26 12, ok cancel
  edit "", 2, 92 3 64 12, read center
  button "Check for new &version", 3, 92 17 64 12
  button "I&nstall newest version", 4, 92 31 64 12
  check "Auto-&Check", 5, 92 46 40 9
  check "&Auto-Install", 6, 92 58 40 9
  edit "", 1, 3 3 84 50, read multi center
  button "&E-mail", 97, 3 55 26 12
  button "&Website", 99, 31 55 28 12
}
alias -l de {
  if ($dialog(aboutstuffamp)) did -o aboutstuffamp 2 1 $gettok($1-,1,124)
  elseif ($deltok($1-,1,124)) e $ifmatch
}
alias -l check {
  $nodl
  de
  if ($sock(stuffampversion).name) return
  de Checking...
  sockopen stuffampversion pages.cthome.net 80
}
on *:sockopen:stuffampversion:{
  if ($sockerr) {
    de Connection error $sockerr
    return
  }
  sockwrite -n $sockname GET /pdufilie/versions.txt HTTP/1.0
  sockwrite -n $sockname Accept: */*
  sockwrite -n $sockname Host: pages.cthome.net
  sockwrite -n $sockname
}
on *:sockread:stuffampversion:{
  if ($sockerr) {
    de Error $sockerr
    return
  }
  var %d, %v, %m = $stuffampversion(1)
  :x
  sockread %d
  if ($sockbr) {
    if (stuffamp * iswm %d) {
      %v = $gettok(%d,2,32)
      %d = $gettok(%d,3,32)
      if (%m != %v) {
        if (%d > $version) {
          de Newest requires mIRC %d
          return
        }
        de New: [ $+ %v $+ ]|New version of Stuffamp found! (You have version %m $+ ; version %v is the newest)
        if (%mp3stuffampnoinstall) %mp3stuffampnoinstall = 0
        elseif (%mp3stuffinstall) downloadstuffamp
      }
      else de No new version
    }
    goto x
  }
}
on *:sockclose:stuffampversion:%mp3stuffampnoinstall = 0
alias downloadstuffamp {
  $nodl
  if ($k) {
    downloadmp3stuff
    return
  }
  de Downloading...
  dlwin
  sockopen downloadstuffamp pages.cthome.net 80
}
alias -l nodl if ($sock(downloadstuffamp).name) || ($timer(installstuffamp)) return return
alias -l exe return " $+ $scriptdir $+ stuffamp.exe"
on *:sockopen:downloadstuffamp:{
  if ($sockerr) {
    de Connection Error $sockerr |Connection error ( $+ $sockerr $+ ) when downloading Stuffamp
    return
  }
  write -c $exe
  %mp3stuffampdlb = 0
  %mp3stuffampdl = 1
  sockwrite -n $sockname GET /pdufilie/irc/stuffamp.exe HTTP/1.0
  sockwrite -n $sockname Accept: */*
  sockwrite -n $sockname Host: pages.cthome.net
  sockwrite -n $sockname
}
on *:sockread:d*stuffamp:{
  if ($sockerr) {
    de Error $sockerr |Error $sockerr when downloading Stuffamp
    return
  }
  while (%mp3stuffampdlb !isnum 1-) {
    var %d
    sockread %d
    if ($sockbr) {
      if (Content-Length: * iswm %d) %mp3stuffampdl = $gettok(%d,2,32)
      elseif (%d) { }
      else {
        %mp3stuffampdlb = $rand(1,16777215)
        break
      }
    }
  }
  :b
  sockread 4096 &d
  if ($sockbr) {
    dlwin
    bwrite $exe -1 -1 &d
    goto b
  }
}
alias -l dlwin {
  var %@ = @Downloading Stuffamp
  if (* !iswm $window(%@)) window -iBaCdfopk0 +Ldf %@ -1 -1 176 24
  drawrect -frn %@ 0 1 0 0 176 24
  drawrect -rn %@ $calc(+%mp3stuffampdlb) 1 0 0 176 24
  drawrect -frn %@ 7368816 1 1 1 $calc(+$calc(174*$sock(downloadstuffamp).rcvd /%mp3stuffampdl)) 22
  drawtext -rn %@ 12632256 Fixedsys 15 8 4 Downloading Stuffamp
  drawpic %@
}
alias -l movedlwin {
  if ($window(@downloading stuffamp)) {
    window @downloading stuffamp $calc($mouse.dx -$1) $calc($mouse.dy -$2)
    if ($mouse.key & 1) .timerstuffampdlwin -o 1 0 movedlwin $1-
  }
}
menu @downloading stuffamp {
  sclick:movedlwin $calc($mouse.dx -$window(@downloading stuffamp).x) $calc($mouse.dy -$window(@downloading stuffamp).y)
}
on *:sockclose:d*stuffamp:install
alias -l install {
  close -@ @Downloading Stuffamp
  if ($isfile($exe)) {
    de Installing...
    .timerstuffamperror -o 1 0 e Error occured while downloading Stuffamp.
    run $exe
    .timerstuffamperror off
    _load 0
  }
}
alias -l _load {
  if ($isfile($exe) != $true) || ($1 > 20) {
    if ($dialog(aboutstuffamp)) dialog -c aboutstuffamp
    .timer -o 1 0 stuffamp.init
    .reload -rs " $+ $script $+ "
  }
  else .timerstuffamp -om 1 200 _load $calc(1+$1)
}
