;___________________________________________
; Invincible by Xtry
; Sketch
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

menu @sketch {
  mouse:{
    if (%skpd.xy == Hide) {
      if ( Copy isin %skpd.draw) && (%skpd.ucx) titlebar @sketch Copy to - X: $+ $mouse.x Y: $+ $mouse.y
      else if ( Load isin %skpd.draw) && (%skpd.ucx) titlebar @sketch Load to - X: $+ $mouse.x Y: $+ $mouse.y
      else titlebar @sketch - %skpd.draw  X: $+ $mouse.x Y: $+ $mouse.y
    }
    if ($window(@zoom)) {
      drawcopy @sketch $calc($mouse.x - 8) $calc($mouse.y - 4) 16 8 @zoom 0 0 169 89
      drawrect -i @zoom $rgb(1) 1 80 40 10 10
    }
    if (%skpd.draw == Freehand) && ($mouse.key & 1) {
      if (%skpd.prevx) set %skpd.udraw drawline @sketch $rgb(%skpd.cl) %skpd.tk %skpd.prevx %skpd.prevy $mouse.x $mouse.y
      else set %skpd.udraw drawline @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $mouse.x $mouse.y
      %skpd.udraw | udraw
      if (%skpd.session == End) write temp.ssn %skpd.udraw
    }
    else if (%skpd.draw == Line) && ($mouse.key & 1) {
      if (%skpd.prevx) drawline -i @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty %skpd.prevx %skpd.prevy
      drawline -i @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $mouse.x $mouse.y
    }
    else if ( Rectangle isin %skpd.draw ) && ($mouse.key & 1) {
      if (%skpd.prevx) drawrect -i @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc(%skpd.prevx - %skpd.lastx) $calc(%skpd.prevy - %skpd.lasty)
      drawrect -i @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc($mouse.x - %skpd.lastx) $calc($mouse.y - %skpd.lasty)
    }
    else if ( Ellipse isin %skpd.draw ) && ($mouse.key & 1) {
      if (%skpd.prevx) drawrect -ie @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc(%skpd.prevx - %skpd.lastx) $calc(%skpd.prevy - %skpd.lasty)
      drawrect -ie @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc($mouse.x - %skpd.lastx) $calc($mouse.y - %skpd.lasty)
    }
    else if (%skpd.ucx) && ($mouse.key !& 1) {
      if (%skpd.prevx) drawrect -i @sketch $rgb(1) 1 %skpd.prevx %skpd.prevy %skpd.ucx %skpd.ucy
      drawrect -i @sketch $rgb(1) 1 $mouse.x $mouse.y %skpd.ucx %skpd.ucy
    }
    set %skpd.prevx $mouse.x | set %skpd.prevy $mouse.y
  }
  sclick:{
    set %skpd.udraw drawsave @sketch graph/sketch/undo.bmp | %skpd.udraw | udraw
    if (%skpd.ucx) {
      if (.ssn isin $titlebar) && (Load isin %skpd.draw) %skpd.emsg = $input(Still converting last loaded pic,260,Disabled)
      else {
        if (%skpd.prevx) drawrect -i @sketch $rgb(1) 1 %skpd.prevx %skpd.prevy %skpd.ucx %skpd.ucy
        set %skpd.udraw drawsave @sketch graph/sketch/undo.bmp | %skpd.udraw | udraw
        set %skpd.lastx $mouse.x | set %skpd.lasty $mouse.y
        if (%skpd.tp) { drawpic -ct @sketch %skpd.tp %skpd.lastx %skpd.lasty %skpd.load | set %skpd.udraw drawpic -ct @sketch %skpd.tp %skpd.lastx %skpd.lasty %skpd.uload | udraw }
        else { drawpic -c @sketch %skpd.lastx %skpd.lasty %skpd.load | set %skpd.udraw drawpic -c @sketch %skpd.lastx %skpd.lasty %skpd.uload | udraw }
        set %skpd.nomore on | set %skpd.bug no | .timer 1 2 set %skpd.bug ok
      }
    }
    else if Fill isin %skpd.draw {
      if ( .ssn isin $titlebar ) && (%skpd.bmp) %skpd.emsg = $input(Not available while converting an image,260,Disabled)
      else {
        set %skpd.gd $getdot(@sketch,$mouse.x,$mouse.y) | set %skpd.lastx $mouse.x | set %skpd.lasty $mouse.y
        set %skpd.udraw drawfill -rs @sketch $colour(%skpd.cl) %skpd.gd %skpd.lastx %skpd.lasty %skpd.bmp | %skpd.udraw | udraw
        if (%skpd.session == End) write temp.ssn %skpd.udraw
      }
    }
    else { set %skpd.lastx $mouse.x | set %skpd.lasty $mouse.y }
  }
  uclick:{
    if (%skpd.draw == Freehand) && ($mouse.x == %skpd.lastx) && ($mouse.y == %skpd.lasty) { set %skpd.udraw drawdot @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
    else if (%skpd.draw == Line) { set %skpd.udraw drawline @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $mouse.x $mouse.y | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
    var %thisx = $mouse.x | var %thisy = $mouse.y
    if (%skpd.lastx > %thisx) { var %thisx = %skpd.lastx | set %skpd.lastx $mouse.x }
    if (%skpd.lasty > %thisy) { var %thisy = %skpd.lasty | set %skpd.lasty $mouse.y }
    if Rectangle isin %skpd.draw {
      if Outline isin %skpd.draw { set %skpd.udraw drawrect @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
      else if Solid isin %skpd.draw { set %skpd.udraw drawrect -f @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
      else if Shaded isin %skpd.draw {
        drawrect -i @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty)
        set %skpd.udraw drawrect -c @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw
        if (%skpd.session == End) write temp.ssn %skpd.udraw
      }
    }
    else if Ellipse isin %skpd.draw {
      if Outline isin %skpd.draw { set %skpd.udraw drawrect -e @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
      else if Solid isin %skpd.draw { set %skpd.udraw drawrect -ef @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
    }
    else if Save isin %skpd.draw {
      window -ph +dl @Temp 0 0 $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty)
      drawcopy @sketch %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) @temp 0 0 
      drawsave @temp graph/sketch/ $+ $$?="Save name (no extension):" $+ .bmp
      window -c @temp
    }
    else if ( Copy isin %skpd.draw) && (%skpd.bug == ok) && (%skpd.nomore == off) {
      set %skpd.ucx $calc(%thisx - %skpd.lastx) | set %skpd.ucy $calc(%thisy - %skpd.lasty)
      titlebar @sketch - Copy to?
      window -ph +dl @Copy $window(@sketch).x $window(@sketch).y %skpd.ucx %skpd.ucy
      set %skpd.udraw window -ph +dl @Ucopy $window(@sketch).x $window(@sketch).y %skpd.ucx %skpd.ucy | udraw
      drawcopy @sketch %skpd.lastx %skpd.lasty %skpd.ucx %skpd.ucy @copy 0 0
      set %skpd.udraw drawcopy @sketch %skpd.lastx %skpd.lasty %skpd.ucx %skpd.ucy @ucopy 0 0 | udraw
      set %skpd.load copy.bmp | set %skpd.uload ucopy.bmp
      drawsave @copy graph/sketch/ $+ %skpd.load
      set %skpd.udraw drawsave @ucopy graph/sketch/ $+ %skpd.uload | udraw
      window -c @copy
      set %skpd.udraw window -c @ucopy | udraw
    }
    if ($window(@zoom)) {
      drawcopy @sketch $calc($mouse.x - 8) $calc($mouse.y - 4) 16 8 @zoom 0 0 169 89
      drawrect -i @zoom $rgb(1) 1 80 40 10 10
    }
    unset %skpd.prevx
  }
  leave:{
    if ($mouse.key & 1) && (( Rectangle isin %skpd.draw ) || ( Ellipse isin %skpd.draw )) {
      if ($exists(undo.bmp)) { set %skpd.udraw drawpic @sketch 0 0 undo.bmp | %skpd.udraw | udraw }
      unset %skpd.prevx
    }
    elseif (%skpd.ucx) {
      if (%skpd.prevx) drawrect -i @sketch $rgb(1) 1 %skpd.prevx %skpd.prevy %skpd.ucx %skpd.ucy
      set %skpd.nomore off | unset %skpd.ucx %skpd.load | set %skpd.udraw drawpic -c | %skpd.udraw | udraw
      if (%skpd.draw == Load) set %skpd.draw Freehand
    }
    entitle
  }
  lbclick:{
    set %skpd.cl $sline(@sketch,1).ln
    if Fill isin %skpd.draw { set %skpd.draw Fill ( $+ $sline(@sketch,1) $+ ) | entitle | unset %skpd.bmp }
  }
  $iif($mouse.lb,$iif(%skpd.tp != $null,&No Transparency)):{
    unset %skpd.tp | set %skpd.copy Copy: Transparency is off
    if ( Copy isin %skpd.draw) { set %skpd.draw %skpd.copy | titlebar @sketch - %skpd.copy }
  }
  $iif($mouse.lb,$iif(%skpd.tp == $colour(%skpd.cl),$style(2),Set) $sline(@sketch,1) $iif(%skpd.tp == $colour(%skpd.cl),is,as) &Transparent):{
    set %skpd.tp $colour(%skpd.cl) | set %skpd.copy Copy: $sline(@sketch,1) is transparent
    if ( Copy isin %skpd.draw) { set %skpd.draw %skpd.copy | titlebar @sketch - %skpd.copy }
  }
  $iif($mouse.lb,$iif(%skpd.bg == $colour(%skpd.cl),$style(2),Change) &Background $iif(%skpd.bg == $colour(%skpd.cl),is,to) $sline(@sketch,1)):{
    set %skpd.udraw drawreplace -r @sketch %skpd.bg $colour(%skpd.cl) | %skpd.udraw | udraw
    if (%skpd.session == End) write graph/sketch/temp.ssn %skpd.udraw
    set %skpd.bg $colour(%skpd.cl)
  }
  $iif(!$mouse.lb,&Draw)
  .$iif(%skpd.draw == Freehand,$style(1)) Freehand:{ set %skpd.draw Freehand | entitle }
  .$iif(%skpd.draw == Line,$style(1)) Line:{ set %skpd.draw Line | entitle }
  .$iif(Rectangle isin %skpd.draw,$style(1)) Rectangle
  ..$iif((Outline isin %skpd.draw) && (Rectangle isin %skpd.draw),$style(1)) Outline:{ set %skpd.draw Rectangle (Outline) | entitle }
  ..$iif((Solid isin %skpd.draw) && (Rectangle isin %skpd.draw),$style(1)) Solid:{ set %skpd.draw Rectangle (Solid) | entitle }
  ..$iif((Shaded isin %skpd.draw),$style(1)) Shaded (Outline):{ set %skpd.draw Rectangle (Shaded) | entitle }
  .$iif(Ellipse isin %skpd.draw,$style(1)) Ellipse
  ..$iif((Outline isin %skpd.draw) && (Ellipse isin %skpd.draw),$style(1)) Outline:{ set %skpd.draw Ellipse (Outline) | entitle }
  ..$iif((Solid isin %skpd.draw) && (Ellipse isin %skpd.draw),$style(1)) Solid:{ set %skpd.draw Ellipse (Solid) | entitle }
  .$iif(Fill isin %skpd.draw,$style(1)) Fill:{
    if (!%skpd.bmp) set %skpd.draw Fill ( $+ $sline(@sketch,1) $+ )
    else set %skpd.draw Fill ( $+ $left(%skpd.bmp,-4) $+ )
    entitle
  }
  $iif(!$mouse.lb,&Thickness ( $+ %skpd.tk $+ )):{ set %skpd.tk $$?="Set thickness (1 = thinnest) :" | while (%skpd.tk !isnum 1-) { set %skpd.tk $$?="Set thickness (1 = thinnest) :" } }
  $iif(!$mouse.lb,&File)
  .$iif((%skpd.session == End) || ( .ssn isin $titlebar ),$style(2)) Load:{
    set %skpd.load $nopath($sfile(%skpd.dir,Choose a 16 colour bitmap image,Load))
    set %skpd.uload %skpd.load
    if ($isfile(%skpd.load)) && ($chr(32) !isin %skpd.load ) && ($right(%skpd.load,4) == .bmp ) {
      set %skpd.pw $pic(%skpd.load).width | set %skpd.ph $pic(%skpd.load).height
      if (%skpd.ph >= $window(@sketch).bh) { set %skpd.udraw window @sketch $window(@sketch).x $window(@sketch).y $window(@sketch).w $calc(%skpd.ph + $calc($window(@sketch).h - $window(@sketch).bh)) | %skpd.udraw | udraw | set %skpd.lasty 0 }
      if (%skpd.pw >= $window(@sketch).bw) { set %skpd.udraw window @sketch $window(@sketch).x $window(@sketch).y $calc(%skpd.pw + $calc($window(@sketch).w - $window(@sketch).bw)) $window(@sketch).h | %skpd.udraw | udraw | set %skpd.lastx 0 }
      if (%skpd.lastx == 0) || (%skpd.lasty == 0) {
        if (%skpd.tp) { drawpic -t @sketch %skpd.tp %skpd.lastx %skpd.lasty %skpd.load | set %skpd.udraw drawpic -t @sketch %skpd.tp %skpd.lastx %skpd.lasty %skpd.uload | udraw }
        else { drawpic @sketch %skpd.lastx %skpd.lasty %skpd.load | set %skpd.udraw drawpic @sketch %skpd.lastx %skpd.lasty %skpd.uload | udraw }
      }
      else { set %skpd.ucx $pic(%skpd.load).width | set %skpd.ucy $pic(%skpd.load).height | set %skpd.draw Load | drawpic -c | titlebar @sketch - Load to? ( $+ $right(%skpd.copy,-6) $+ ) | unset %skpd.prevx }
    }
    else if (%skpd.load) { unset %skpd.load %skpd.uload | set %skpd.txt File must be bitmap. | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
  }
  .Sessions
  .. $+ %skpd.session Session:{
    if (%skpd.session == Begin) {
      set %skpd.session End
      write graph/sketch/temp.ssn window @sketch $window(@sketch).x $window(@sketch).y $window(@sketch).w $window(@sketch).h
      write graph/sketch/temp.ssn drawreplace -r @sketch $eval(%skpd.bg,0) %skpd.bg
    }
    else { .copy graph/sketch/temp.ssn graph/sketch/ $+ $$?="Session name (no extension):" $+ .ssn | .remove graph/sketch/temp.ssn | set %skpd.session Begin }
  }
  ..$iif((%skpd.session == End) || ( .ssn isin $titlebar ),$style(2)) Playback Session:{
    set %skpd.ssn $nopath($sfile($mircdirgraph/sketch/ $+ *.ssn,Choose a Session,Playback))
    if ($isfile(%skpd.ssn)) && ($chr(32) !isin %skpd.ssn ) && ($right(%skpd.ssn,4) == .ssn ) {
      .play -sc %skpd.ssn 0
      if ($server) {
        var %un = 1 | set %skpd.user $ulist(*,86,%un) | titlebar Playing %skpd.ssn to %skpd.user
        while (%skpd.user) { var %sl = 1 | while ($read(%skpd.ssn,%sl)) && ($window(@sketch)) && ($chat(%skpd.user)) { .msg = $+ %skpd.user $read(%skpd.ssn,%sl) | inc %sl 1 } | inc %un | set %skpd.user $ulist(*,86,%un) | if (%skpd.user) titlebar Playing %skpd.ssn to %skpd.user }
        unset %un | titlebar
      }
    }
    else if (%skpd.ssn) { unset %skpd.ssn | set %skpd.txt File must be a previously recorded sketch session. | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
  }
  .$iif(%skpd.session == End,$style(2)) $iif(.ssn isin $titlebar,Abort Conversion,Convert) :{
    if ( .ssn isin $titlebar ) { .timerconvert off | unset %skpd.bx %skpd.by %skpd.bc %skpd.pw %skpd.ph %skpd.tonick | if ($hget(buffer)) .hfree buffer | window -c @tempic | titlebar | if ($exists(%skpd.ssn)) .remove %skpd.ssn }
    else {
      set %skpd.load $nopath($sfile(%skpd.dir,Select a 16 colour bitmap image to become a session,Convert))
      if ($isfile(%skpd.load)) && ($chr(32) !isin %skpd.load ) && ($right(%skpd.load,4) == .bmp ) {
        set %skpd.ssn $left(%skpd.load,-3) $+ ssn | set %skpd.pw $pic(%skpd.load).width | set %skpd.ph $pic(%skpd.load).height
        set %skpd.progress PLEASE WAIT... | titlebar %skpd.progress | window -ph +dl @Tempic 0 0 %skpd.pw %skpd.ph | drawfill -rs @tempic %skpd.bg $getdot(@tempic,1,1) 1 1
        if (%skpd.tp) drawpic -t @tempic %skpd.tp 0 0 %skpd.load
        else drawpic @tempic 0 0 %skpd.load
        write %skpd.ssn window @sketch $window(@sketch).x $window(@sketch).y $calc(%skpd.pw + $calc($window(@sketch).w - $window(@sketch).bw)) $calc(%skpd.ph + $calc($window(@sketch).h - $window(@sketch).bh))
        write %skpd.ssn drawreplace -r @sketch $eval(%skpd.bg,0) %skpd.bg
        set %skpd.bx 0 | set %skpd.by 0 | unset %skpd.tonick | convert 0 0
      }
      else if (%skpd.load) { unset %skpd.load %skpd.uload | set %skpd.txt File must be 16 colour bitmap. | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
    }
  }
  .Save
  ..Whole Window:drawsave @sketch graph/sketch/ $+ $$?="Save name (no extension):" $+ .bmp
  ..Selected Area:{ set %skpd.draw Save Area? | entitle }
  .Exit:if ($$?!"Are you sure?") closall
  $iif(!$mouse.lb,&Edit)
  .$iif(%skpd.session == End,$style(2)) Undo:if ($exists(undo.bmp)) { set %skpd.udraw drawpic @sketch 0 0 undo.bmp | %skpd.udraw | udraw }
  .$iif(%skpd.session == End,$style(2)) Copy:{ set %skpd.draw %skpd.copy | entitle | set %skpd.nomore off | unset %skpd.ucx | drawpic -c }
  .$iif($sline(@sketch,1),Change $ifmatch to)
  ..$iif(%skpd.cl != 1,Black) :c 1
  ..$iif(%skpd.cl != 2,Dk Blue) :c 2
  ..$iif(%skpd.cl != 3,Green) :c 3
  ..$iif(%skpd.cl != 4,Red) :c 4
  ..$iif(%skpd.cl != 5,Brown) :c 5
  ..$iif(%skpd.cl != 6,Purple) :c 6
  ..$iif(%skpd.cl != 7,Orange) :c 7
  ..$iif(%skpd.cl != 8,Yellow) :c 8
  ..$iif(%skpd.cl != 9,Lt Green) :c 9
  ..$iif(%skpd.cl != 10,Dk Cyan) :c 10
  ..$iif(%skpd.cl != 11,Cyan) :c 11
  ..$iif(%skpd.cl != 12,Blue) :c 12
  ..$iif(%skpd.cl != 13,Pink) :c 13
  ..$iif(%skpd.cl != 14,Grey) :c 14
  ..$iif(%skpd.cl != 15,Lt Grey) :c 15
  ..$iif(%skpd.cl != 16,White) :c 16
  .$iif(%skpd.session == End,$style(2)) Clear:{ set %skpd.udraw drawsave @sketch graph/sketch/ $+ undo.bmp | %skpd.udraw | clear | drawfill -rs @sketch %skpd.bg $getdot(@sketch,5,5) 5 5 }
  $iif(!$mouse.lb,&Display)
  .$iif($window(@zoom),$style(1)) Zoom:{
    if ($window(@zoom)) window -c @zoom
    else {
      if ($window(@pattern)) && ($window(@sketch).w < 300) { window -p +dl @Zoom $calc($window(@pattern).x - 254) $calc($window(@pattern).y - 32) 172 92 | window -a @sketch }
      else { window -p +dl @Zoom $window(@sketch).x $calc($window(@sketch).y - 92) 172 92 | window -a @sketch }
    }
  }
  . $+ %skpd.xy x,y position:{
    if (%skpd.xy == Show) set %skpd.xy Hide
    else set %skpd.xy Show
  }
  . $+ %skpd.show pattern:{
    if (%skpd.show == Show) {
      if ( .ssn isin $titlebar) %skpd.emsg = $input(Not available while converting an image,260,Disabled)
      else {
        window -apk0 +l @Pattern $calc($window(@sketch).x + $window(@sketch).w - 60) $calc($window(@sketch).y - 60) 60 60
        if ($window(@zoom)) && ($window(@sketch).w < 300) {
          window -c @zoom
          window -p +dl @Zoom $calc($window(@pattern).x - 254) $calc($window(@pattern).y - 32) 172 92
        }
        if (%skpd.pattern) drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 %skpd.pattern
        window -a @sketch | set %skpd.show Hide
      }
    }
    else { window -c @pattern | set %skpd.show Show | window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp }
  }
  .$iif(%skpd.session == End,$style(2)) Original Size/Position:{
    window @sketch $calc($window(-3).dw - 340) $calc($window(-3).dh - 267) 340 267
    if ($window(@pattern)) window @pattern $calc($window(@sketch).x + $window(@sketch).w - 60) $calc($window(@sketch).y - 60) 60 60
    if ($window(@edit)) window @edit $calc($window(@pattern).x - 83) $calc($window(@pattern).y - 22) 82 82
    if ($window(@zoom)) window @zoom $window(@sketch).x $iif($calc($window(@sketch).y - 92) < 0,0,$calc($window(@sketch).y - 92)) 172 92
    window -a @sketch
  }
}
alias 6721 { 
  set %styletype Secret - Sephiroth | background -h egg\Sephiroth.jpg | background -l egg\Sephiroth.jpg | background -m egg\Sephiroth.jpg | set %co1 7 | set %co3 15 | set %co1 7 | set %co2 14 | set %co3 15 | set %br1 « | set %br2 < | set %br3 > | set %br4 » | set %vers 7Š8én7T8ì7N€L 
  set %secret6 found
  /color background 1
  /color action text 7
  /color ctcp text 7
  /color highlight text 7
  /color info text 7
  /color info2 text 7
  /color invite text 7
  /color join text 0
  /color kick text 7
  /color mode text 7
  /color nick text 7
  /color normal text 0
  /color notice text 7
  /color notify text 7
  /color other text 0
  /color own text 0
  /color part text 7
  /color quit text 7
  /color topic text 0
  /color wallops text 7
  /color whois text 7
  /color editbox text 7
  /color editbox 1
  /color listbox text 7
  /color grayed text 14
  /color listbox 1
}

alias -l c {
  set %skpd.udraw drawreplace -r @sketch $colour(%skpd.cl) $colour($1)
  %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw
}
menu @pattern {
  sclick:{
    window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp
    if (!%skpd.pattern) || ( Fill !isin %skpd.draw) || ($left(%skpd.bmp,-4) isin %skpd.draw) {
      clear | set %skpd.pattern $nopath($sfile(%skpd.dir,Choose a pattern,Use))
      if ($isfile(%skpd.pattern)) && ($file(%skpd.pattern).size < 1600) && ($chr(32) !isin %skpd.pattern ) && ($right(%skpd.pattern,4) == .bmp ) drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 %skpd.pattern
      else if (%skpd.pattern) { unset %skpd.pattern | set %skpd.txt Pattern file must be 8 X 8 bitmap (under 1600 bytes). | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
      unset %skpd.bmp
    }
    if (( Fill isin %skpd.draw ) && ( .ssn !isin $titlebar )) { set %skpd.bmp %skpd.pattern | set %skpd.draw Fill ( $+ $left(%skpd.bmp,-4) $+ ) | entitle }
  }
  rclick
  Load Pattern:{
    window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp
    clear | set %skpd.pattern $nopath($sfile(%skpd.dir,Choose a pattern,Use))
    if ($isfile(%skpd.pattern)) && ($file(%skpd.pattern).size < 1600) && ($chr(32) !isin %skpd.pattern ) && ($right(%skpd.pattern,4) == .bmp ) drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 %skpd.pattern
    else if (%skpd.pattern) { unset %skpd.pattern | set %skpd.txt Pattern file must be 8 X 8 bitmap (under 1600 bytes). | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
    unset %skpd.bmp
  }
  Edit %skpd.pattern:{
    window -ap +dl @Edit $calc($window(@pattern).x - 83) $calc($window(@pattern).y - 22) 82 82
    window -ph +dl @Temp 500 10 8 8
    drawcopy @pattern 0 0 7 7 @edit 0 0 79 79
    drawcopy @pattern 0 0 7 7 @temp 0 0 7 7
  }
  Create New Pattern:{
    clear | unset %skpd.bmp %skpd.pattern
    window -ap +dl @Edit $calc($window(@pattern).x - 83) $calc($window(@pattern).y - 22) 82 82
    window -ph +dl @Temp 500 10 8 8
    drawcopy @pattern 0 0 7 7 @edit 0 0 79 79
    drawcopy @pattern 0 0 7 7 @temp 0 0 7 7
  }
  Close:{ set %skpd.show Show | window -c @pattern | window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp }
}
menu @edit {
  sclick:{
    %skpd.px = 0 | %skpd.py = 0
    while (%skpd.py != 8) {
      while (%skpd.px != 8) {
        if ($inrect($mouse.x,$mouse.y,$calc(%skpd.px * 10),$calc(%skpd.py * 10),10,10)) {
          drawrect -f @edit $rgb(%skpd.cl) %skpd.tk $calc(%skpd.px * 10) $calc(%skpd.py * 10) 10 10
          drawdot @temp $rgb(%skpd.cl) 1 %skpd.px %skpd.py | drawsave @temp draw/img $+ temp.bmp | clear @pattern
          drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 temp.bmp
        }
        inc %skpd.px
      }
      %skpd.px = 0 | inc %skpd.py
    }
  }
  rclick
  Clear:{ clear | clear @temp | clear @pattern }
  Revert:{
    clear @pattern
    if (%skpd.pattern) drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 %skpd.pattern
    clear @edit | clear @temp | drawcopy @pattern 0 0 7 7 @edit 0 0 79 79 | drawcopy @pattern 0 0 7 7 @temp 0 0 7 7
  }
  Done:{
    if (%skpd.pattern) drawsave @temp draw/img/ $+ %skpd.pattern
    else drawsave @temp graph/sketch/ $+ $$?="Save name (no extension):" $+ .bmp
    window -c @edit | window -c @temp | if ($exists(graph/sketch/temp.bmp)) .remove graph/sketch/temp.bmp
  }
}
menu @zoom {
  sclick:window -c @zoom
}
on *:text:!get sketchpad:*:dcc send -c $nick $script
on *:notice:wants to 12sketch with you.*:*: {
  set %skpd.user $nick | .timer 1 0 confirm
}
alias -l confirm {
  if ($$?!="Accept Sketch request?") { .creq +m auto | sketch | .auser 86 %skpd.user | notice.p %skpd.user has accepted your 12sketch request. | .timer 1 60 .creq +m ask }
  else notice.p %skpd.user has refused your 12sketch request.
}
on *:notice:has accepted your 12sketch request.:*:.sketch $nick
on ^86:chat:*: {
  if ($regex($1,^draw(dot|line|rect|replace)$) == 1) { $1- | if (%skpd.session == End) write graph/sketch/temp.ssn $1- }
  else if ($1 == window) || ($1 == drawcopy) || ($1 == drawsave) $1-
  else if ($1 == drawfill) {
    if (%skpd.session == End) write temp.ssn $1-
    if (!$8) || ($isfile($8)) $1-
    else .msg = $+ $nick unknown pattern $8
  }
  else if ($1 == drawpic) {
    if ($isfile($6)) || ($isfile($7)) || ($5 == undo.bmp) || (($2 == -c) && (!$3)) $1-
    else if (!$7) .msg = $+ $nick unknown file $6
    else if (!$8) .msg = $+ $nick unknown file $7
  }
  else if ($1 == !end) { .ruser 86 $nick | close -c $nick }
  else if ($1 == unknown) {
    if ($2 == pattern) && ($isfile($3)) {
      window -ph +dl @Temp 500 10 8 8
      .msg = $+ $nick window -ph +dl @Utemp 500 10 8 8
      drawpic -c @temp 0 0 $3
      var %bx = 0 | var %by = 0 | if (!$hget(buffer)) .hmake buffer 4
      while (%by < 8) {
        while (%bx < 8) { var %bd = $getdot(@temp,%bx,%by) | hadd buffer %bd $hget(buffer,%bd) %bx %by | inc %bx 1 }
        var %bx = 0 | inc %by 1
      }
      var %bc = 1
      while (%bc < 17) {
        if ($hget(buffer,$colour(%bc))) .msg = $+ $nick drawdot @utemp $rgb(%bc) 1 $hget(buffer,$colour(%bc))
        hdel buffer $colour(%bc) | inc %bc 1
      }
      unset %bx %by %bc | if ($hget(buffer)) .hfree buffer
      .msg = $+ $nick drawsave @utemp $3 | .msg = $+ $nick window -c @utemp | window -c @temp
      .msg = $+ $nick drawfill -rs @sketch $colour(%skpd.cl) %skpd.gd %skpd.lastx %skpd.lasty $3
    }
    else if ($2 == file) && ($isfile($3)) {
      if ( .ssn isin $titlebar ) { msg = $+ $nick 4Failed to transfer $3 to your sketchpad | halt }
      set %skpd.ssn $left($3,-3) $+ ssn
      if (!$isfile(%skpd.ssn)) {
        set %skpd.pw $pic($3).width | set %skpd.ph $pic($3).height
        if (%skpd.ph >= $window(@sketch).bh) { window @sketch $window(@sketch).x $window(@sketch).y $window(@sketch).w $calc(%skpd.ph + $calc($window(@sketch).h - $window(@sketch).bh)) | set %skpd.lasty 0 }
        if (%skpd.pw >= $window(@sketch).bw) { window @sketch $window(@sketch).x $window(@sketch).y $calc(%skpd.pw + $calc($window(@sketch).w - $window(@sketch).bw)) $window(@sketch).h | set %skpd.lastx 0 }
        set %skpd.progress PLEASE WAIT... | titlebar %skpd.progress | window -ph +dl @Tempic 0 0 %skpd.pw %skpd.ph | drawfill -rs @tempic %skpd.bg $getdot(@tempic,1,1) 1 1
        if (%skpd.tp) drawpic -t @tempic %skpd.tp 0 0 $3
        else drawpic @tempic 0 0 $3
        set %skpd.bx 0 | set %skpd.by 0 | set %skpd.tonick $nick | convert %skpd.lastx %skpd.lasty
      }
      else { var %sf = 1
        while ($read(%skpd.ssn,%sf)) && ($window(@sketch)) && ($chat($nick)) { .msg = $+ $nick $read(%skpd.ssn,%sf) | inc %sf 1 }
      }
    }
  }
  else return
  halt
}
alias sketch {
  if ($1) && ($server) {
    if ($show) { echo -a Sending 12sketch request to $1 $+ ... | notice.p $1 wants to 12sketch with you. Type 12!get sketchpad if you don't already have it. | return }
    else { .dcc chat $1 | .auser 86 $1 | window -n "Chat $1 $+ " }
  }
  if ($window(@sketch)) return
  else {
    set %skpd.cl 1 | set %skpd.tk 2 | set %skpd.draw Freehand | set %skpd.bug ok
    set %skpd.xy Show | set %skpd.show Show | set %skpd.session Begin
    set %skpd.dir $nofile($mircexe) $+ *.bmp
    set %skpd.tp $colour(16) | set %skpd.bg $colour(16)
    set %skpd.copy Copy: White is transparent
    set %skpd.msg Also, there must not be spaces in the filename, and it must be in the following directory: $+ $crlf $+ $mircdir
    if ($hget(buffer)) .hfree buffer | window -aBk0l8p +st @Sketch $calc($window(-3).dw - 340) $calc($window(-3).dh - 267) 340 267 fixedsys
    drawfill -rs @sketch %skpd.bg $getdot(@sketch,5,5) 5 5 | entitle
    var %line = 1
    while (%line < 16) { aline -l %line @sketch $gettok(Black.Dk Blue.Green.Red.Brown.Purple.Orange.Yellow.Lt Green.Dk Cyan.Cyan.Blue.Pink.Grey.Lt Grey,%line,46) | inc %line 1 }
    unset %line | aline -l 1 @sketch White | sline -l @sketch 1
  }
}
alias -l udraw {
  if ($server) {
    var %un = 1 | set %skpd.user $ulist(*,86,%un)
    while (%skpd.user) { .msg = $+ %skpd.user %skpd.udraw | inc %un | set %skpd.user $ulist(*,86,%un) }
    unset %un
  }
}
alias -l closall {
  if ($window(@sketch)) window -c @sketch
  if ($window(@pattern)) { window -c @pattern | window -c @edit | window -c @temp }
  if ($window(@zoom)) window -c @zoom
  .play stop | var %un = 1 | set %skpd.user $ulist(*,86,%un)
  while (%skpd.user) {
    .ruser 86 %skpd.user
    if ($server) && ($chat(%skpd.user)) { .msg = $+ %skpd.user !end | close -c %skpd.user }
    inc %un | set %skpd.user $ulist(*,86,%un)
  }
  if (%skpd.session == End) { set %skpd.session == Begin | .copy temp.ssn $$?="Session name (no extension):" $+ .ssn | .remove temp.ssn }
  if ( .ssn isin $titlebar ) { .timerconvert off | if ($exists(%skpd.ssn)) .remove %skpd.ssn | window -c @tempic | titlebar }
  unset %skpd.*
  if ($hget(buffer)) .hfree buffer
  if ($exists(graph/sketch/undo.bmp)) .remove graph/sketch/undo.bmp
  if ($exists(graph/sketch/copy.bmp)) .remove graph/sketch/copy.bmp
  if ($exists(graph/sketch/temp.bmp)) .remove graph/sketch/temp.bmp
  if ($exists(graph/sketch/ucopy.bmp)) .remove graph/sketch/ucopy.bmp
  if ($exists(graph/sketch/utemp.bmp)) .remove graph/sketch/utemp.bmp
  if ($exists(graph/sketch/temp.ssn)) .remove graph/sketch/temp.ssn
}
alias -l entitle titlebar @sketch - %skpd.draw
on 1:CLOSE:@:{
  if ($target == @pattern) {
    set %skpd.show Show | window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp
    if ($window(@zoom)) && ($window(@zoom).x != $window(@sketch).x) { window @zoom $window(@sketch).x $calc($window(@sketch).y - 92) 172 92 | window -a @sketch }
  }
  else if ($target == @sketch) closall
}
on 1:EXIT:closall
alias -l convert {
  if (!$hget(buffer)) .hmake buffer 4
  while (%skpd.bx < %skpd.pw) {
    var %bd = $getdot(@tempic,%skpd.bx,%skpd.by)
    if (%bd != %skpd.tp) {
      hadd buffer %bd $hget(buffer,%bd) $calc($1 + %skpd.bx) $calc($2 + %skpd.by)
      if ($len($hget(buffer,%bd)) > 890) {
        write %skpd.ssn drawdot -r @sketch %bd 1 $hget(buffer,%bd)
        hdel buffer %bd
      }
    }
    inc %skpd.bx 1
  }
  if ($calc($round($calc(%skpd.by * 100 / %skpd.ph),0) / 5) == $round($calc($round($calc(%skpd.by * 100 / %skpd.ph),0) / 5),0)) { set %skpd.progress %skpd.ssn $round($calc(%skpd.by * 100 / %skpd.ph),0) $+ $chr(37) Complete | titlebar %skpd.progress }
  set %skpd.bx 0 | inc %skpd.by 1
  if (%skpd.tonick) && (!$chat(%skpd.tonick)) { unset %skpd.bx %skpd.by %skpd.bc %skpd.pw %skpd.ph %skpd.tonick | if ($hget(buffer)) .hfree buffer | window -c @tempic | titlebar | .remove %ssn }
  else if (%skpd.by < %skpd.ph) .timerconvert -m 1 10 convert $1-
  else {
    var %bc = 1
    while (%bc < 17) {
      if ($hget(buffer,$colour(%bc))) write %skpd.ssn drawdot @sketch $rgb(%bc) 1 $hget(buffer,$colour(%bc))
      hdel buffer $colour(%bc) | inc %bc 1
    }
    set %skpd.progress %skpd.ssn 100 $+ $chr(37) Complete | titlebar %skpd.progress | beep
    unset %skpd.bx %skpd.by %bc %skpd.pw %skpd.ph | if ($hget(buffer)) .hfree buffer | window -c @tempic | titlebar
    if (%skpd.tonick) { titlebar Playing %skpd.ssn to %skpd.tonick | var %sf = 1 | while ($read(%skpd.ssn,%sf)) && ($window(@sketch)) && ($chat(%skpd.tonick)) { .msg = $+ %skpd.tonick $read(%skpd.ssn,%sf) | inc %sf 1 } }
    unset %skpd.tonick | titlebar
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
