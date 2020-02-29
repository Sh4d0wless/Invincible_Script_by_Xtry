;___________________________________________
; Invincible by Xtry
; Nick Completor
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

dialog nc.pro {
  title "Nick Completor"
  icon graph/f.ico
  size -1 -1 370 250
  button "OK", 1, 300 225 60 20, OK
  button "Help", 2, 230 225 60 20
  box "", 3, 5 5 155 80
  box "", 4, 5 85 155 80
  box "", 5, 170 5 190 160
  box "", 6, 5 165 355 35
  box "", 106, 5 200 200 44

  text "Left part:", 9, 65 20 100 18
  edit "", 10, 115 17 40 22, autohs
  check "Color", 11, 20 40 45 18
  check "Background", 51, 20 62 80 18
  icon 41, 100 43 13 13
  icon 81, 100 65 13 13

  text "Right part:", 13, 60 100 105 18
  edit "", 14, 115 97 40 22, autohs
  check "Color", 15, 20 120 45 18
  check "Background", 55, 20 140 80 18
  icon 42, 100 123 13 13
  icon 82, 100 143 13 13

  text "Middle (nick):", 16, 190 25 100 18
  check "Bold", 17, 185 45 55 20
  check "Underline", 18, 185 65 75 20
  check "Reverse", 19, 185 85 60 20
  radio "Effect 1", 20, 280 45 65 20, group
  radio "Effect 2", 21, 280 65 65 20
  radio "Effect 3", 22, 280 85 65 20
  check "Color", 23, 185 115 55 18
  icon 43, 265 117 13 13
  check "Background", 24, 185 135 80 18
  icon 44, 265 137 13 13

  check "Nick Completor Enabled", 25, 20 177 140 20
  text "Activator(s)", 26, 175 180 80 18
  edit " ", 27, 240 177 50 20

  icon 45, 10 211 110 26
  button "Preview", 28, 125 214 70 20

}

dialog nc.colors {
  title "Colors"
  size -1 -1 170 90
  button "OK", 20, 1 1 1 1, OK, hide
  box "Choose the color", 21, 5 10 160 70
  icon 1, 20 35 14 14
  icon 2, 37 35 14 14
  icon 3, 54 35 14 14
  icon 4, 71 35 14 14
  icon 5, 88 35 14 14
  icon 6, 105 35 14 14
  icon 7, 121 35 14 14
  icon 8, 137 35 14 14
  icon 9, 20 55 14 14
  icon 10, 37 55 14 14
  icon 11, 54 55 14 14
  icon 12, 71 55 14 14
  icon 13, 88 55 14 14
  icon 14, 105 55 14 14
  icon 15, 121 55 14 14
  icon 16, 137 55 14 14
}

on *:dialog:*:*:*: {
  if ($dname == nc.pro) {
    if ($devent == init) {
      nc.draw
      if (%xtncpro-left != $null) { did -ca $dname 10 %xtncpro-left }
      if (%xtncpro-right != $null) { did -ca $dname 14 %xtncpro-right }
      if (%xtncpro-ativa == $null) { set %xtncpro-ativa :; } | did -ca $dname 27 %xtncpro-ativa
      if (%xtncpro-c-11) { did -c $dname 11 } | if (%xtncpro-c-51) { did -c $dname 51 }
      if (%xtncpro-c-15) { did -c $dname 15 } | if (%xtncpro-c-55) { did -c $dname 55 }
      if (%xtncpro-c-23) { did -c $dname 23 } | if (%xtncpro-c-24) { did -c $dname 24 }
      if (%xtncpro-on) { did -c $dname 25 }
      if (%xtncpro-mid > 3) { did -c $dname $calc(%xtncpro-mid + 16) }
      else {
        if ($gettok(%xtncpro-mid,1,32)) { did -c $dname 17 }
        if ($gettok(%xtncpro-mid,2,32)) { did -c $dname 18 }
        if ($gettok(%xtncpro-mid,3,32)) { did -c $dname 19 }
      }
    }
    if ($devent == edit) {
      if ($did == 10) { unset %xtncpro-left | if ($did(10)) { set %xtncpro-left $did(10) } }
      if ($did == 14) { unset %xtncpro-right | if ($did(14)) { set %xtncpro-right $did(14) } }
      if ($did == 27) { if ($did(27)) { set %xtncpro-ativa $did(27) } | else { set %xtncpro-ativa ; } }
    }
    if ($devent == sclick) {
      if ($did == 2) { ncpro.hlp } | if ($did == 28) { nc.preview }
      if ($did isnum 41-44) || ($did isnum 81-82) { nc.cor -gv $dname $did }
      if ($did == 25) { set %xtncpro-on $did(25).state }
      if ($findtok(11 51 15 55 23 24,$did,32)) { set %xtncpro-c-  [ $+ [ $did ] ] $did($did).state }
      if ($did isnum 17-19) {
        if ($did(20).state) || ($did(21).state) || ($did(22).state) {
          did -u $dname 20 | did -u $dname 21 | did -u $dname 22
        }
        set %xtncpro-mid $did(17).state $did(18).state $did(19).state
      }
      if ($did isnum 20-22) {
        if ($did(17).state) || ($did(18).state) || ($did(19).state) {
          did -u $dname 17 | did -u $dname 18 | did -u $dname 19
        }
        set %xtncpro-mid $calc($did - 16)
      }
    }
  }
  if ($dname == nc.colors) {
    if ($devent == init) { nc.colors }
    if ($devent == sclick) {
      if ($calc($did - 1) isnum 0-15) {
        set %xtnc.file graph\ $+ $calc($did - 1) $+ .bmp
        if ($isfile(%xtnc.file)) && ($dialog(%xtnc.dlg)) {
          did %xtnc.pars %xtnc.dlg %xtnc.did %xtnc.file | set %xtncpro-c- [ $+ [ %xtnc.did ] ] $calc($did - 1) | dialog -k $dname
        }
      }
    }
  }
}

alias -l nc.preview {
  if ($dialog(nc.pro)) {
    window -hp +f @nc.preview 0 0 110 26 | clear @nc.preview
    if ($isfile(ncpreviw.bmp)) { .remove ncpreviw.bmp }
    drawfill -r @nc.preview $rgb(face) $rgb(face) 0 0 | drawtext -pb @nc.preview $colour(own) $colour(back) Tahoma 13 3 3 $chr(160) $ncstyle(nick) $chr(160)
    drawsave @nc.preview graph/ncpreview.bmp | window -c @nc.preview
    did -gv nc.pro 45 graph/ncpreview.bmp
  }
}

alias -l ncpro.hlp {
  window -ado +l @NC-pro $nc.center(380,300) Tahoma 10 | clear @nc-pro
  titlebar @NC-pro Nick Completor Help
  aline @nc-pro - Nick Completion pro / Help
  aline @nc-pro -- This addon was created to help
  aline @nc-pro on your talks. If you want to talk with anyone
  aline @nc-pro on channel, if the nick of person is
  aline @nc-pro Beef-bori, use this format:
  aline @nc-pro Beef: hi!
  aline @nc-pro The addon send a mensage:
  aline @nc-pro Beef-bori: hi!
  aline @nc-pro Then the nick will Completion by addon.
  aline @nc-pro The : and the Nick will work with
  aline @nc-pro your configs on dialog. Use : and others
  aline @nc-pro to ACTIVE ( ACTIVATOR(S) ) the nick Completion,
  aline @nc-pro and the addon will ident the nick Completion.
  aline @nc-pro ATTENTION: The BACKGROUND option only work if
  aline @nc-pro you to enable the COLOR option.
  aline @nc-pro ATTENTION 2: If you are using a script with
  aline @nc-pro Nick Completion, please, disabled this, with
  aline @nc-pro the nick Completion of other script, the addon doesn't work!
}

alias ncpro { if ($dialog(nc.pro)) { return } | .timer -m 1 1 dialog -m nc.pro nc.pro }

on *:input:#: { if ($right($1,1) isin $remove(%xtncpro-ativa,$chr(32))) && (%xtncpro-on) { ncomp $1- | return } }

alias -l ncomp {
  set %xtncpro-nick $1 | set %xtncpro-nick $remove($1,$right(%xtncpro-nick,1)) | unset %xtncpro-nicks | set %xtncpro-chan $active | set %xtncpro-msg $2-
  if (%xtncpro-chan !ischan) || (%xtncpro-nick == $null) || (%xtncpro-msg == $null) { return }
  set %xtnc.i 0 | :inck | inc %xtnc.i 1
  if (%xtnc.i > $nick(%xtncpro-chan,0)) { goto fim }
  if ( [ %xtncpro-nick ] isin [ $nick(%xtncpro-chan,%xtnc.i) ] ) || ( [ %xtncpro-nick ] iswm [ $nick(%xtncpro-chan,%xtnc.i) ] ) {
    set %xtncpro-nicks %xtncpro-nicks $nick(%xtncpro-chan,%xtnc.i)
  }
  goto inck
  :fim
  if ($gettok(%xtncpro-nicks,1,32) !ison %xtncpro-chan) { /msg %xtncpro-chan $1- | halt }
  if ($gettok(%xtncpro-nicks,2,32) ison %xtncpro-chan) {
    window -c @NC-NICKS | window -kl +ntbs @NC-NICKS $nc.center(230,160) @NC-NICKS Tahoma 10
    aline @NC-NICKS NICK Completion pro - The addon found
    aline @NC-NICKS these matchs. Choose one nick to
    aline @NC-NICKS the addon complete:
    aline @NC-NICKS $chr(160)
    set %xtncpro-i 0 | :incgt | inc %xtncpro-i 1
    if ($gettok(%xtncpro-nicks,%xtncpro-i,32) == $null) { goto msg }
    aline @NC-NICKS $gettok(%xtncpro-nicks,%xtncpro-i,32) | goto incgt
    :msg | window -b @NC-NICKS | halt
  }
  else {
    if ($me isop $chan) {
      .msg %xtncpro-chan $ncstyle(%xtncpro-nicks) %xtncpro-msg
      echo -t %xtncpro-chan  $+ $_nc.rini(nc,m-) $+ @ $+ $me  $+ $color(own) $+ : $ncstyle(%xtncpro-nicks)  $+ $color(own) $+ %xtncpro-msg
      halt
    }
    if ($me isvo $chan) && ($me !isop $chan) && ($me !isreg $chan) {
      .msg %xtncpro-chan $ncstyle(%xtncpro-nicks) %xtncpro-msg
      echo -t %xtncpro-chan  $+ $_nc.rini(nc,m-) $+ + $+ $me  $+ $color(own) $+ : $ncstyle(%xtncpro-nicks)  $+ $color(own) $+ %xtncpro-msg
      halt
    }
    if ($me !isvo $chan) && ($me !isop $chan) && ($me isreg $chan) {
      .msg %xtncpro-chan $ncstyle(%xtncpro-nicks) %xtncpro-msg
      echo -t %xtncpro-chan  $+ $_nc.rini(nc,m-) $+ $me  $+ $color(own) $+ : $ncstyle(%xtncpro-nicks)  $+ $color(own) $+ %xtncpro-msg
      halt
    }
  }
}

alias -l ncstyle {
  if ($1 != $null) {
    unset %xt-nc-*
    if (%xtncpro-c-11) {
      if (%xtncpro-c-41 isnum 0-15) {
        set %xt-nc-c1 %xtncpro-c-41 | if (%xtncpro-c-81 isnum 0-15) && (%xtncpro-c-51) { set %xt-nc-c1 %xt-nc-c1 $+ , $+ %xtncpro-c-81 }
      }
    }
    if (%xtncpro-c-15) {
      if (%xtncpro-c-42 isnum 0-15) {
        set %xt-nc-c2 %xtncpro-c-42 | if (%xtncpro-c-82 isnum 0-15) && (%xtncpro-c-55) { set %xt-nc-c2 %xt-nc-c2 $+ , $+ %xtncpro-c-82 }
      }
    }
    if (%xtncpro-c-23) {
      if (%xtncpro-c-43 isnum 0-15) {
        set %xt-nc-c3 %xtncpro-c-43 | if (%xtncpro-c-44 isnum 0-15) && (%xtncpro-c-24) { set %xt-nc-c3 %xt-nc-c3 $+ , $+ %xtncpro-c-44 }
      }
    }
    set %xt-nc-e $1
    if ($gettok(%xtncpro-mid,0,32) < 3) {
      if (%xtncpro-mid == 4) { set %xt-nc-e $_nc-e1($1) } | if (%xtncpro-mid == 5) { set %xt-nc-e $_nc-e2($1) }
      if (%xtncpro-mid == 6) { set %xt-nc-e $_nc-e3($1) }
    }
    else {
      if ($gettok(%xtncpro-mid,1,32)) { set %xt-nc-e  $+ %xt-nc-e } | if ($gettok(%xtncpro-mid,2,32)) { set %xt-nc-e  $+ %xt-nc-e }
      if ($gettok(%xtncpro-mid,3,32)) { set %xt-nc-e  $+ %xt-nc-e }
    }
    set %xt-nc-e  $+ %xt-nc-c3 $+ %xt-nc-e $+ 
    if (%xtncpro-left) { set %xt-nc-e  $+ %xt-nc-c1 $+ %xtncpro-left $+  $+ %xt-nc-e } | if (%xtncpro-right) { set %xt-nc-e %xt-nc-e $+  $+ %xt-nc-c2 $+ %xtncpro-right $+  }
  }
  .timer -m 1 100 /unset %xt-nc-* | return %xt-nc-e
}

alias -l _nc-e1 { if ($len($1) < 3) { return  $+ $1 $+  } | return  $+ $left($1,1) $+  $+ $mid($1,2,$calc($len($1) - 2)) $+  $+ $right($1,1) $+  }
alias -l _nc-e2 { if ($len($1) < 3) { return  $+ $1 $+  } | return  $+ $left($1,1) $+  $+ $mid($1,2,$calc($len($1) - 2)) $+  $+ $right($1,1) $+  }
alias -l _nc-e3 { if ($len($1) < 3) { return  $+ $1 $+   } | return  $+ $left($1,1) $+  $+ $mid($1,2,$calc($len($1) - 2)) $+  $+ $right($1,1) $+  }

menu @NC-NICKS {
  dclick { if ($sline($active,1).ln > 4) { /msg %xtncpro-chan $ncstyle($sline($active,1)) %xtncpro-msg | window -c $active | halt } }
  Cancelar:window -c $active
}

alias -l nc.center { return $round( $calc( $calc( $window(-3).w /2) - $calc( $1 /2) ) ,0) $round( $calc( $calc( $window(-3).h /2) - $calc( $2 /2) ) ,0) $1 $2 }
alias -l nc.draw {
  if ($isdir(graph) != $true) { .mkdir graph }
  window -hp +f @nc-pro 0 0 14 14 | set %xtNC.i -1 | :incnc | inc %xtNC.i 1
  if (%xtNC.i > 15) { goto colors }
  set %xtNC.f graph\ $+ %xtNC.i $+ .bmp
  if ($isfile(%xtNC.f)) { .remove %xtNC.f }
  clear @nc-pro | drawfill @nc-pro %xtNC.i %xtNC.i 0 0 | drawsave @nc-pro %xtNC.f | goto incnc
  :colors
  if ($isfile(graph\16.bmp)) { .remove graph\16.bmp }
  window -hp +f @nc-pro 0 0 14 14 | clear @nc-pro | drawfill -r @nc-pro $rgb(face) $rgb(face) 0 0 | drawsave @nc-pro graph\16.bmp
  window -c @nc-pro
  did -gv nc.pro 41 graph\ $+ $iif(%xtncpro-c-41 isnum 0-15,%xtncpro-c-41,16) $+ .bmp
  did -gv nc.pro 81 graph\ $+ $iif(%xtncpro-c-81 isnum 0-15,%xtncpro-c-81,16) $+ .bmp
  did -gv nc.pro 42 graph\ $+ $iif(%xtncpro-c-42 isnum 0-15,%xtncpro-c-42,16) $+ .bmp
  did -gv nc.pro 82 graph\ $+ $iif(%xtncpro-c-82 isnum 0-15,%xtncpro-c-82,16) $+ .bmp
  did -gv nc.pro 43 graph\ $+ $iif(%xtncpro-c-43 isnum 0-15,%xtncpro-c-43,16) $+ .bmp 
  did -gv nc.pro 44 graph\ $+ $iif(%xtncpro-c-44 isnum 0-15,%xtncpro-c-44,16) $+ .bmp 

}
alias -l nc.cor { if ($dialog(nc.colors)) { dialog -k nc.colors } | set %xtnc.pars $1 | set %xtnc.dlg $2 | set %xtnc.did $3 | .timer -m 1 1 dialog -m nc.colors nc.colors }
alias -l nc.colors {
  if ($isfile(graph\0.bmp) == $null) { nc.draw }
  set %xtNC.i -1 | :incnc | inc %xtNC.i 1
  if (%xtNC.i > 15) { unset %xtNC.i %xtNC.f | return }
  set %xtNC.f graph\ $+ %xtNC.i $+ .bmp
  did -gv nc.colors $calc(%xtNC.i + 1) %xtNC.f | goto incnc
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
