on *:load:bigfont.init
on *:start:if (%bigfontnocheck != 1) bigfontcheck 1
alias bigfontversion {
  var %v = 2003.01.04
  if ($1) return %v
  return BigFont [[ $+ %v $+ ]]
}
alias bigfont.init {
  if ($version < 5.71) {
    echo $colour(i) -ai *** BigFont requires mIRC v5.71 or higher:  $+ $colour(h) $+ www.mirc.com
    if ($?!="You need mIRC v5.71 to use BigFont.") .timer -o 1 0 run http://www.mirc.com/
    unload -rs bigfont.mrc
    halt
  }
  var %this = $script, %x = $script(0)
  while (%x) {
    var %that = $script(%x)
    if ($shortfn(%this) == $shortfn(%that)) && (%this != %that) .unload -rs " $+ %that $+ "
    dec %x
  }
  close -@ @BigFont Readme
  window -aCdfkh @BigFont Readme -1 -1 600 250
  var %e = echo @BigFont Readme
  %e 2002.08.28a - Added flood protection
  %e 2002.08.28b - Changed the way draw/erase works
  %e 2002.08.28c - Fixed /bigfont <text> bug (thanks b1z xDDDDDDDDDDDD)
  %e 2002.08.29
  %e - Changed default flood protection delay from 15 to 13.5
  %e - Added an option to change the flood protection delay
  %e - Added an option to change the size of the boxes in the editor
  %e - Stopped double-click from drawing when loading a design
  %e - Added ctrl key for forced draw
  %e 2002.08.29b - Fixed window bugs with older versions of mIRC
  %e 2002.08.29c - Added error checking for editor 'spam' button
  %e 2002.08.29d - Added option to disable automatic erase
  %e 2003.01.04
  %e - Changed default flood protection delay to 12
  %e - It now remembers the previous width/height of the editor window.
  %e - You can make the editor window much larger than you could before.
  %e ======================
  %e To open the editor, type "/bigfont" or "/bigfontedit"
  %e Arrow keys resize the window
}
alias bigfont3 {
  ;For 3x3 font, only supports A-Z
  set -u0 %bigfont3x3 1
  bigfont $lower($1-)
}
alias bigme {
  set -u0 %bigfontcmd me
  bigfont $1-
}
alias bigfont {
  if (* !iswm $1) return $bigfontedit
  var %cmd = msg $active, %@ = @bigfont_data, %f = $scriptdir $+ bigfont.dat
  if (%bigfont3x3) %f = $scriptdir $+ bigfont3.dat
  if (%bigfontcmd) %cmd = %bigfontcmd
  if ($active == Status Window) %cmd = echo -s
  close -@ %@
  if ($isfile(%f) != $true) {
    echo $colour(i) -a *** File missing: %f
    return
  }
  window -hl %@
  var %y = 1, %n, %t, %m = $$1-
  while (%y <= 5) {
    %n = 1
    %t = 0
    while (%n <= $len(%m)) {
      var %r = $read -nw" $+ $asc($mid(%m,%n,1)) $+ *" " $+ %f $+ "
      %t = %t $+ $gettok(%r,$calc(2 + %y),32) $+ 0
      inc %n
    }
    aline %@ %t
    inc %y
  }
  go %cmd
}
alias -l go {
  ; remove extra blank lines on top and bottom
  var %@ = @bigfont_data, %cmd = $$1-
  while ($line(%@,0) && * !iswm $remove($line(%@,1),0)) {
    dline %@ 1
  }
  while ($line(%@,0) && * !iswm $remove($line(%@,$line(%@,0)),0)) {
    dline %@ $line(%@,0)
  }
  var %n = $str(0,$len($line(%@,1)))
  if (%n) {
    iline %@ 1 %n
    aline %@ %n
  }
  ; convert
  window -hl @bigfont
  var %y = 1
  while (%y <= $line(%@,0)) {
    var %x = 1, %l, %o, %p
    while (%x <= $len($line(%@,1))) {
      %p = %l
      %l = $mid($line(%@,%y),%x,1)
      %o = %o $iif(%p == %l,,)
      inc %x
    }
    %o = %o 
    aline @bigfont %cmd %o
    inc %y
  }
  close -@ %@
  if ($line(@bigfont,0)) next
  else close -@ @bigfont
}
alias -l next {
  var %line = $line(@bigfont,1), %delay = 0
  if (%line) {
    %line
    dline @bigfont 1
    var %temp = 12
    if (%bigfontdelay isnum 0-100) %temp = %bigfontdelay
    if (echo * !iswm %line) %delay = $int($calc($len(%line) * %temp))
    .timerbigfont -mo 1 %delay next
  }
  else close -@ @bigfont
}
alias bigfontedit {
  if ($sock(downloadbigfont)) || ($timer(installbigfont)) return
  var %@ = @BigFont Editor
  if ($window(%@)) {
    window -a %@
    return
  }
  if (%bigfontw !isnum 1-850) %bigfontw = 25
  if (%bigfonth !isnum 1-850) %bigfonth = 10
  clr
  adjust
  draw
}
alias -l clr {
  unset %bigfont.data.*
  var %i = %bigfonth
  while (%i) {
    %bigfont.data. [ $+ [ %i ] ] = $str(0,%bigfontw)
    dec %i
  }
}
alias -l adjust {
  var %@ = @BigFont Editor
  if (* !iswm $window(%@)) {
    close -@ %@
    window -BCdfhiknop +fnt %@
  }
  if ($version > 5.8) {
    %bigfont.bg = $colour($colour(background))
    %bigfont.fg = $colour($colour(normal))
  }
  else {
    %bigfont.bg = 0
    %bigfont.fg = 12632256
  }
  %bigfont.w0 = 10
  %bigfont.h0 = 15
  if (* * iswm %bigfontwh) {
    if ($int($gettok(%bigfontwh,1,32)) > 1) %bigfont.w0 = $ifmatch
    if ($int($gettok(%bigfontwh,2,32)) > 1) %bigfont.h0 = $ifmatch
  }
  %bigfont.w1 = %bigfont.w0 + 1
  %bigfont.h1 = %bigfont.h0 + 1
  %bigfont.bottom = %bigfont.h1 * %bigfonth
  %bigfont.right = %bigfont.w1 * %bigfontw
  var %w = 1 + %bigfont.right, %h = 45 + %bigfont.bottom
  if (%w < 166) %w = 166
  window -af %@ -1 -1 %w %h
  draw
}
alias -l draw {
  var %@ = @BigFont Editor
  drawrect -rnf %@ %bigfont.fg 1 0 %bigfont.bottom $window(%@).w 45
  drawrect -rnf %@ %bigfont.bg 1 0 0 $window(%@).w $calc(1+%bigfont.bottom)
  drawrect -rn %@ %bigfont.bg 1  10 $calc(10+%bigfont.bottom) 42 25  62 $calc(10+%bigfont.bottom) 42 25  114 $calc(10+%bigfont.bottom) 42 25
  drawtext -rn %@ %bigfont.bg Fixedsys 15 15 $calc(15+%bigfont.bottom) Load
  drawtext -rn %@ %bigfont.bg Fixedsys 15 67 $calc(15+%bigfont.bottom) Save
  drawtext -rn %@ %bigfont.bg Fixedsys 15 119 $calc(15+%bigfont.bottom) Spam
  var %y = %bigfonth
  while (%y) {
    var %x = %bigfontw
    while (%x) {
      if ($mid(%bigfont.data. [ $+ [ %y ] ] ,%x,1) == 0) drawrect -rfn %@ %bigfont.fg 1 $calc(1 + (%x - 1) * %bigfont.w1) $calc(1 + (%y - 1) * %bigfont.h1) %bigfont.w0 %bigfont.h0
      dec %x
    }
    dec %y
  }
  drawpic %@
}
on *:keydown:@BigFont Editor:37,38,39,40:{
  var %d = $keyval - 37
  if (%d == 0) {
    ;left
    if (%bigfontw < 2) return
    dec %bigfontw
    var %x = %bigfonth
    while (%x) {
      %bigfont.data. [ $+ [ %x ] ] = $left(%bigfont.data. [ $+ [ %x ] ] ,%bigfontw)
      dec %x
    }
  }
  elseif (%d == 1) {
    ;up
    if (%bigfonth < 2) return
    unset %bigfont.data. [ $+ [ %bigfonth ] ]
    dec %bigfonth
  }
  elseif (%d == 2) {
    ;right
    if (%bigfontw > 850) return
    inc %bigfontw
    if ($len(%bigfont.data.1) < %bigfontw) {
      var %x = %bigfonth
      while (%x) {
        var %temp = %bigfont.data. [ $+ [ %x ] ]
        %bigfont.data. [ $+ [ %x ] ] = %temp $+ $str(0,$calc(%bigfontw - $len(%temp)))
        dec %x
      }
    }
  }
  elseif (%d == 3) {
    ;down
    if (%bigfontw > 850) return
    inc %bigfonth
    %bigfont.data. [ $+ [ %bigfonth ] ] = $str(0,%bigfontw)
  }
  adjust
}
alias -l edit {
  var %x = $int($calc($mouse.x / %bigfont.w1)), %y = $int($calc($mouse.y / %bigfont.h1)), %key = $mouse.key
  var %@ = @BigFont Editor
  if (%key !& 1) || (%y >= %bigfonth) || (%x >= %bigfontw) || ($timer(bigfont.noedit)) {
    if (%key !& 1) unset %bigfont.mode
    return
  }
  var %tok = %y + 1, %mid = %x + 1
  ;$1: 1=sclick/dclick, 0=mouse
  if ($1) {
    if (%bigfontshift) {
      if (%key & 4) %bigfont.mode = 0
      else %bigfont.mode = 1
    }
    else %bigfont.mode = $calc(1 - $mid(%bigfont.data. [ $+ [ %tok ] ] ,%mid,1))
  }
  elseif (%bigfont.mode !isnum) return
  if (%key & 4) %bigfont.mode = 0
  elseif (%key & 2) %bigfont.mode = 1
  drawrect -rf %@ $iif(%bigfont.mode,%bigfont.bg,%bigfont.fg) 1 $calc(1+%x *%bigfont.w1) $calc(1+%y *%bigfont.h1) %bigfont.w0 %bigfont.h0
  var %temp = %bigfont.data. [ $+ [ %tok ] ]
  if (%mid == 1) %temp = %bigfont.mode $+ $right(%temp,-1)
  elseif (%mid == %w) %temp = $left(%temp,-1) $+ %temp
  else %temp = $left(%temp,%x) $+ %bigfont.mode $+ $right(%temp,$calc(%w -%mid))
  %bigfont.data. [ $+ [ %tok ] ] = %temp
}
alias -l button {
  var %x = $mouse.x, %y = $mouse.y
  if ($inrect(%x,%y,10,$calc(10+%bigfont.bottom),42,25)) {
    ;load
    var %f = $$dir="Load BigFont design" [ [ $scriptdir ] $+ ] *.bf
    if ($isfile(%f) == $true) && ($lines(%f)) {
      close -@ @bigfont.temp
      window -hl @bigfont.temp
      loadbuf @bigfont.temp " $+ %f $+ "
      unset %bigfont.data.*
      var %temp = $line(@bigfont.temp,1)
      if (* * iswm %temp) {
        ;old format
        var %i = $numtok(%temp,32)
        %bigfonth = %i
        while (%i) {
          %bigfont.data. [ $+ [ %i ] ] = $gettok(%temp,%i,32)
          dec %i
        }
      }
      else {
        var %i = $line(@bigfont.temp,0)
        %bigfonth = %i
        while (%i) {
          %bigfont.data. [ $+ [ %i ] ] = $line(@bigfont.temp,%i)
          dec %i
        }
      }
      %bigfontw = $len(%bigfont.data.1)
      close -@ @bigfont.temp
    }
    adjust
    .timerbigfont.noedit -o 1 0 return
  }
  elseif ($inrect(%x,%y,62,$calc(10+%bigfont.bottom),42,25)) {
    ;save
    var %f = $$dir="Save as..." [ [ $scriptdir ] $+ ] *.bf
    if (*.bf !iswm %f) %f = %f $+ .bf
    close -@ @bigfont.temp
    window -hl @bigfont.temp
    var %i = 1, %n = %bigfonth
    while (%i <= %n) {
      aline @bigfont.temp %bigfont.data. [ $+ [ %i ] ]
      inc %i
    }
    savebuf @bigfont.temp " $+ %f $+ "
    close -@ @bigfont.temp
  }
  elseif ($inrect(%x,%y,114,$calc(10+%bigfont.bottom),42,25)) {
    ;Spam
    var %where = $$?="Where?", %x = 1, %left = %bigfontw, %width = 0, %temp, %@ = @bigfont_data, %query, %status
    if (%where !ischan) && (* !iswm $query(%where)) {
      if ($comchan(%where,1)) %query = 1
      elseif (%where == status window) %status = 1
      else return
    }
    close -@ %@
    window -hl %@
    while (%x <= %bigfonth) {
      %temp = $left(%bigfont.data. [ $+ [ %x ] ] ,%bigfontw)
      aline %@ %temp
      if ($pos(%temp,1,1) < %left) %left = $ifmatch
      if ($pos(%temp,1,$count(%temp,1)) > %width) %width = $ifmatch
      inc %x
    }
    %x = $line(%@,0)
    while (%x) {
      %temp = $line(%@,%x)
      if (* iswm %temp) rline %@ %x 0 $+ $mid($left(%temp,%width),%left) $+ 0
      dec %x
    }
    if ($fline(%@,*1*) > 0) && (%query) query %where
    if (%status) go echo -s
    else go msg %where
  }
}
alias -l menuwh {
  if (* iswm %bigfontwh) return  [ $+ $replace(%bigfontwh,$chr(32),×) $+ ]
  return  [10×15]
}
alias -l menudelay {
  if (%bigfontdelay isnum) return  [ $+ %bigfontdelay $+ ]
  return  [12]
}
menu @BigFont Editor {
  sclick:{
    if ($mouse.y < %bigfont.bottom) edit 1
    else .timer -o 1 0 button
  }
  dclick:{
    if ($mouse.y < %bigfont.bottom) edit 1
    else .timer -o 1 0 button
  }
  mouse:edit
  leave:if ($mouse.key !& 1) unset %bigfont.mode
  Clear:{
    clr
    draw
  }
  -
  Setup
  .Change box size $menuwh:{
    %bigfontwh = $$?="Enter width & height (Default is 10 15)"
    %bigfontwh = $replace(%bigfontwh,$chr(44),$chr(32))
    adjust
  }
  .Change message delay $menudelay:%bigfontdelay = $$?="Enter message delay value $crlf (0 = none, 12 = default)"
  .-
  .$checkbox(Automatic erase (Without shift key),$calc(1 - %bigfontshift)):{
    if (%bigfontshift) unset %bigfontshift
    else %bigfontshift = 1
  }
  -
  Version
  .Check for a new version now:bigfontcheck
  .Install the newest version:downloadbigfont
  .-
  .$checkbox(Check version on startup,$calc(1 - %bigfontnocheck)):{
    if (%bigfontnocheck) unset %bigfontnocheck
    else %bigfontnocheck = 1
  }
  .$checkbox(Automatically install new versions,$calc(1 - %bigfontnoinstall)):{
    if (%bigfontnoinstall) unset %bigfontnoinstall
    else %bigfontnoinstall = 1
  }
  .-
  .Uninstall:if ($?!="Are you sure?") _unload
}
alias -l checkbox {
  if ($version < 5.9) {
    if ($2) return [×]  $1
    return [  ]  $1
  }
  return $style($2) $1
}
on *:close:@BigFont Editor:unset %bigfont.*
on *:unload:_unload 1
alias -l _unload {
  .timerbigfont* off
  unset %bigfont*
  close -@ @bigfont*
  if ($1 != 1) unload -rs bigfont.mrc
}
;-------------------------------------------------------------------------------
alias -l _echo echo $color(info) -qs $bigfontversion $+ : $1-
alias -l error _echo Error: $sock($sockname).wsmsg
alias bigfontcheck {
  if ($sock(bigfontversion)) || ($sock(downloadbigfont)) return
  if ($1) %bigfontsilentcheck = 1
  else _echo Checking...
  sockopen bigfontversion pages.cthome.net 80
}
on *:sockopen:bigfontversion:{
  if ($sockerr) return $error
  sockwrite -n $sockname GET /pdufilie/versions.txt HTTP/1.0
  sockwrite -n $sockname Accept: */*
  sockwrite -n $sockname Host: pages.cthome.net
  sockwrite -n $sockname
}
on *:sockread:bigfontversion:{
  if ($sockerr) return $error
  var %read, %this = $bigfontversion(1)
  if ($sock($sockname)) sockread -f %read
  while ($sockbr) && ($sock($sockname)) {
    tokenize 32 %read
    ; script version mirc
    if ($1 == bigfont) {
      if ($2 != %this) {
        if ($3 > $version) {
          _echo Newest requires mIRC v $+ $3
          return
        }
        _echo New version: [[ $+ $2 $+ ]]
        if (%bigfontnoinstall) _echo Type /downloadbigfont
        else downloadbigfont
      }
      elseif (%bigfontsilentcheck != 1) _echo No new version.
    }
    if ($sockerr) return $error
    if ($sock($sockname)) sockread -f %read
    else return
  }
}
on *:sockclose:bigfontversion:unset %bigfontsilentcheck
alias -l dlwin {
  var %@ = @Downloading BigFont
  if (* !iswm $window(%@)) window -BhaCdfopk +Ldf %@ -1 -1 168 24
  drawrect -frn %@ 0 0 0 0 168 24
  if (%bigfontdlb) drawrect -rn %@ %bigfontdlb 0 0 0 168 24
  if ($calc(166 * $sock(downloadbigfont).rcvd / %bigfontdl)) drawrect -frn %@ 7368816 0 1 1 $ifmatch 22
  drawtext -rn %@ 12632256 Fixedsys 15 8 4 Downloading BigFont
  drawpic %@
}
alias -l movedlwin {
  if ($window(@Downloading BigFont)) {
    window @Downloading BigFont $calc($mouse.dx -$1) $calc($mouse.dy -$2)
    if ($mouse.key & 1) .timerbigfontdlwin -o 1 0 movedlwin $1-
  }
}
menu @Downloading BigFont {
  sclick:movedlwin $calc($mouse.dx -$window(@Downloading BigFont).x) $calc($mouse.dy -$window(@Downloading BigFont).y)
  &Cancel:{
    close -@ @Downloading BigFont
    sockclose downloadbigfont
  }
}
on *:close:@Downloading BigFont:sockclose downloadbigfont
alias downloadbigfont {
  sockclose bigfontversion
  if ($sock(downloadbigfont)) || ($timer(installbigfont)) return
  _echo Downloading...
  sockopen downloadbigfont pages.cthome.net 80
}
on *:sockopen:downloadbigfont:{
  if ($sockerr) return $error
  write -c " $+ $scriptdir $+ bigfont.exe"
  %bigfontdlb = 0
  %bigfontdl = 1
  sockwrite -n $sockname GET /pdufilie/irc/bigfont.exe HTTP/1.0
  sockwrite -n $sockname Accept: */*
  sockwrite -n $sockname Host: pages.cthome.net
  sockwrite -n $sockname
}
on *:sockread:downloadbigfont:{
  var %exe = " $+ $scriptdir $+ bigfont.exe", %read
  while (%bigfontdlb !isnum 1-) && ($sock($sockname)) {
    if ($sockerr) return $error
    if ($sock($sockname)) sockread -f %read
    else return
    tokenize 32 %read
    if ($sockbr) {
      if ($1 == Content-Length:) %bigfontdl = $2
      elseif (* !iswm $1-) {
        %bigfontdlb = $rand(1,16777215)
        break
      }
    }
    else return
  }
  if ($sockerr) return $error
  if ($sock($sockname)) sockread &d
  while ($sockbr) && ($sock($sockname)) {
    bwrite %exe -1 -1 &d
    dlwin
    if ($sockerr) return $error
    if ($sock($sockname)) sockread &d
    else return
  }
}
on *:sockclose:downloadbigfont:install
alias -l install {
  close -@ @Downloading BigFont
  unset %bigfontdl*
  var %exe = " $+ $scriptdir $+ bigfont.exe"
  if ($isfile(%exe)) {
    _echo Installing...
    .timerbigfonterror -o 1 0 echo $colour(i) -s *** Error occured while downloading BigFont.
    run %exe
    .timerbigfonterror off
    _load 0
  }
}
alias -l _load {
  var %f = $scriptdir $+ bigfont.exe
  if ($isfile(%f) != $true) || ($1 > 25) {
    .timer -o 1 0 bigfont.init
    .reload -rs " $+ $script $+ "
  }
  else .timerinstallbigfont -om 1 200 _load $calc(1+$1)
}
alias -l colour return $color($1)
