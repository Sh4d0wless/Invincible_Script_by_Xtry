;___________________________________________
; Invincible by Xtry
; Lyrics Finder
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias lyrics {
  dialog $iif($dialog(lyr) == $null,-md,-ev) lyr lyr
  var %1 | if ($1 == -a || $1 == -l || $1 == -s) { var %1 = $replace($1,-a,1,-l,2,-s,3) }
  if (%1) { did -c lyr 4 %1 | if ($2) { did -ra lyr 3 $2- | did -r lyr 8 | lyr.end | lyr.search } }
}
dialog lyr {
  title Lyrics Finder (www.lyred.com)
  size -1 -1 315 358
  icon graph/lyric.ico
  option pixels
  button "", 1, 0 0 0 0, hide cancel
  button "", 2, 0 0 0 0, hide
  edit "", 3, 77 10 150 23, autohs
  combo 4, 10 11 65 100, drop
  button "Search...", 5, 230 11 75 21
  button "", 6, 0 0 0 0, hide default
  box "", 7, 10 31 295 8
  list 8, 9 43 297 250, size extsel
  list 9, 9 43 297 273, hide size extsel
  edit "", 16, 9 43 297 273, hide read multi return vsbar center
  list 10, 10 326 295 22, size
  button "", 17, 10 297 4 18, disable
  text "Documents 0-0 of total 0 found.", 11, 20 298 190 15
  text "0 / 0", 12, 241 298 40 16, center
  button "3", 13, 217 297 22 18, disable
  button "4", 14, 283 297 22 18, disable
  box "", 15, 10 314 295 8
}
on *:dialog:lyr:init:0:{
  dll dll/mdx.dll MarkDialog lyr
  dll dll/mdx.dll SetBorderStyle 10 windowedge
  dll dll/mdx.dll SetBorderStyle 12 border
  dll dll/mdx.dll SetFont 13,14 18 400 Webdings
  dll dll/mdx.dll SetColor 16 background $rgb(255,255,255)
  dll dll/mdx.dll SetColor 16 textbg $rgb(255,255,255)
  dll dll/mdx.dll SetColor 16 text $rgb(0,0,0)
  dll dll/mdx.dll SetControlMDX 2 positioner size maxbox minbox > dll/dialog.mdx
  dll dll/mdx.dll SetControlMDX 8,9 listview report rowselect showsel nosortheader single infotip > dll/views.mdx
  dll dll/mdx.dll SetControlMDX 10 statusbar > dll/bars.mdx
  did -ic lyr 4 1 Artist | did -a lyr 4 Album | did -a lyr 4 Song
  did -i lyr 8,9 1 headerdims 276
  did -i lyr 8,9 1 headertext Search results:
  did -o lyr 10 2 Ready.
}
on *:dialog:lyr:sclick:1:{ sockclose lyr.* | unset %lyr.* }
on *:dialog:lyr:sclick:2:{
  tokenize 32 $did(lyr,2,1).text
  var %1 = $dialog(lyr).cw
  var %2 = $dialog(lyr).ch
  if ($1 == sizing) {
    var %1 = $iif($9 < 315,315,$9)
    var %2 = $iif($10 < 358,358,$10)
    did -a lyr 2 setrect c * * %1 %2
  }
  if ($1 == size) {
    var %3 = $replace(5.15 $+ $iif($did(lyr,11).visible,.11.12.13.14.17),$chr(46),$chr(44))
    did -h lyr %3
    dll dll/mdx.dll MoveControl 3 * * $calc(%1 - 165) *
    dll dll/mdx.dll MoveControl 5 $calc(%1 - 85) * * *
    dll dll/mdx.dll MoveControl 7 * * $calc(%1 - 20) *
    dll dll/mdx.dll MoveControl 8 * * $calc(%1 - 18) $calc(%2 - 108)
    dll dll/mdx.dll MoveControl 9 * * $calc(%1 - 18) $calc(%2 - 85)
    dll dll/mdx.dll MoveControl 10 * $calc(%2 - 32) $calc(%1 - 20) *
    dll dll/mdx.dll MoveControl 11 * $calc(%2 - 59) $calc(%1 - 125) *
    dll dll/mdx.dll MoveControl 12 $calc(%1 - 74) $calc(%2 - 60) * *
    dll dll/mdx.dll MoveControl 13 $calc(%1 - 98) $calc(%2 - 61) * *
    dll dll/mdx.dll MoveControl 14 $calc(%1 - 32) $calc(%2 - 61) * *
    dll dll/mdx.dll MoveControl 15 * $calc(%2 - 44) $calc(%1 - 20) *
    dll dll/mdx.dll MoveControl 16 * * $calc(%1 - 18) $calc(%2 - 85)
    dll dll/mdx.dll MoveControl 17 * $calc(%2 - 61) * *
    did -i lyr 8,9 1 headerdims $calc(%1 - 39)
    did -v lyr %3
  }
}
on *:dialog:lyr:sclick:5,6:{
  if ($did(lyr,5).text == Search...) { lyr.search }
  else { did -r lyr 8 | lyr.end }
}
on *:dialog:lyr:dclick:8:{
  set %lyr.get $read($scriptdirlyrics.dat,$calc($did(lyr,8).sel - 1))
  if (* $+ $lyr.indent(*,20) iswm $did(lyr,8).seltext) { var %1 = 4,%2 = 16 }
  elseif (* $+ $lyr.indent(*,10) iswm $did(lyr,8).seltext) { var %1 = 3,%2 = 9 }
  else { var %1 = 2,%2 = 9 }
  sockopen lyr. $+ %1 www.lyred.com 80
  did -h lyr 8,11,12,13,14,17
  did -i lyr 9 1 headertext Search results:
  did -o lyr 10 2 Connecting...
  did -rv lyr %2
}
on *:dialog:lyr:dclick:9:{
  set %lyr.get $read($scriptdirlyrics.dat,$calc($did(lyr,9).sel - 1))
  did -i lyr 9 1 page headertext
  if (*viewing artist:* iswm $did(lyr,9,1).text) { var %1 = 3,%2 = 9 }
  else { var %1 = 4,%2 = 16 }
  sockopen lyr. $+ %1 www.lyred.com 80
  did -h lyr 9,11,12,13,14,17
  did -i lyr 9 1 headertext Search results:
  did -o lyr 10 2 Connecting...
  did -rv lyr %2
}
on *:dialog:lyr:sclick:13,14:{
  tokenize 32 $did(lyr,12).text
  var %1 = $calc($iif($did == 13,$calc($1 - 2),$1) * 20),%2 = $calc($1 $iif($did == 13,-,+) 1)
  set %lyr.get $+(/quicks.php?query=,$replace($did(lyr,3).text,$chr(32),+),&type=,$did(lyr,4).seltext,$+(&count=20&match=,%1,&page=,%2))
  sockopen lyr.1 www.lyred.com 80 | did -r lyr 8 | did -o lyr 10 2 Connecting... | did -b lyr 13,14
}
on *:sockopen:lyr.*:{
  if ($sockerr > 0) { lyr.end Unable to connect. | halt }
  write -c $+(",$scriptdirlyrics.dat,") | did -o lyr 10 2 Connection established! Receiving...
  if ($sockname == lyr.1) { sockwrite -tn $sockname GET $lower(http://www.lyred.com $+ %lyr.get) }
  else {
    sockwrite -tn $sockname GET %lyr.get HTTP/1.0
    sockwrite -tn $sockname Host: www.lyred.com
    sockwrite -tn $sockname Connection: close
    sockwrite -tn $sockname $crlf
  }
  unset %lyr.*
}
on *:sockclose:lyr.*:{ lyr.end Connection closed! }
on *:sockread:lyr.*:{
  var %1 | sockread %1
  var %2 = $replace(%1,<,>),%3
  tokenize 62 %2
  if ($sockname == lyr.1) {
    if (*no search results* iswm %1) { lyr.end No results were found! }
    elseif (*search result* iswm %1) { set %lyr.results $gettok(%1,-3,32) }
    elseif (*viewing * .. * iswm %1) { tokenize 32 $1 | did -ra lyr 11 Documents $+($3,-,$5) of total %lyr.results found. | unset %lyr.results }
    elseif (*&nbsp;&nbsp;* / *&nbsp;&nbsp;* iswm %1) { did -ra lyr 12 $remove($wildtok(%2,* / *,1,62),&nbsp;) }
    if ($did(lyr,4).sel == 1) {
      if (*href="/lyrics/*/">*</a></td></tr>* iswm %1) {
        did -a lyr 8 0 0 0 0 %lyr.last $2
        write $+(",$scriptdirlyrics.dat,") $gettok(%1,2,34)
      }
    }
    else {
      if (*href="/lyrics/*/">*</a> - <a style="font-weight : normal"* iswm %1) {
        did -a lyr 8 0 0 0 0 %lyr.last $2
        write $+(",$scriptdirlyrics.dat,") $gettok(%1,2,34)
        set %lyr.album $true
      }
      elseif (%lyr.album) {
        did -a lyr 8 0 0 0 0 $lyr.indent($2,10)
        write $+(",$scriptdirlyrics.dat,") $gettok(%1,2,34)
        if ($did(lyr,4).sel == 3) { set %lyr.song $true }
        unset %lyr.album
      }
      elseif (%lyr.song) {
        did -a lyr 8 0 0 0 0 $lyr.indent($2,20)
        write $+(",$scriptdirlyrics.dat,") $gettok(%1,2,34)
        unset %lyr.song
      }
    }
    set %lyr.last $2
  }
  elseif ($sockname == lyr.2) {
    if (*<title>* iswm %1) { did -i lyr 9 1 headertext Viewing artist: $remove(%1,<title>lyred.com! -,- lyrics</title>) }
    elseif (*<tr><td>*songs*</td></tr>* iswm %1) {
      tokenize 62 $gettok(%2,-9-,62)
      did -a lyr 9 0 0 0 0 $1 $5 $replace($7,&nbsp;,$chr(32))
      write $+(",$scriptdirlyrics.dat,") $gettok($1-,2,34)
    }
  }
  elseif ($sockname == lyr.3) {
    if (*<title>* iswm %1) { set %lyr.album $remove(%1,<title>lyred.com! - album,- lyrics</title>) }
    elseif (*</a>&nbsp;&nbsp;&nbsp;*</h1>* iswm %1) { did -i lyr 9 1 headertext Viewing album: %lyr.album $remove($4,&nbsp;) | unset %lyr.album }
    elseif (*<tr><td><b>*. </b></td><td>* iswm %1) {
      tokenize 62 $gettok(%2,-9-,62)
      did -a lyr 9 0 0 0 0 $1 $6
      write $+(",$scriptdirlyrics.dat,") $gettok($1-,2,34)
    }
  }
  elseif ($sockname == lyr.4) {
    if (*<title>* iswm %1) { did -a lyr 16 $+($remove(%1,<title>lyred.com! - song:,- lyrics</title>),$crlf,$str(_,44),$crlf,$crlf) }
    elseif (*<p>* iswm %1) { var %3 = $gettok(%2,-2,62) $+ <br> | set %lyr.lyrics $true }
    elseif (%lyr.lyrics) {
      if (*</p>* iswm %1) { did -a lyr 16 $str(_,44) | unset %lyr.lyrics }
      else { var %3 = %1 }
    }
    if (%3) {
      var %3 = $upper($left(%3,1)) $+ $right(%3,-1)
      did -a lyr 16 $remove($replace(%3,<br>,$crlf,&quot;,",&amp;,&),$chr(9))
    }
  }
  if (*</body>* iswm %1) {
    var %3 = $iif($istok(lyr.1 lyr.2 lyr.3,$sockname,32),$+($chr(40),double-click to select,$chr(41)))
    unset %lyr.* | sockclose lyr.* | did -o lyr 10 2 Ready. %3
    tokenize 32 $did(lyr,12).text
    if ($1 > 1) { did -e lyr 13 }
    if ($1 < $3) { did -e lyr 14 }
    if ($1- == 0 / 0) { did -ra lyr 12 1 / 1 }
  }
}
on *:unload:{
  if ($dialog(lyr)) { dialog -c lyr }
  unset %lyr.*
}
alias -l lyr.search {
  var %1 = $len($did(lyr,3).text),%2 = $calc($did(lyr,4).sel + 2)
  if (%1 < %2) { beep | did -fr lyr 3 $input($did(lyr,4).seltext must consist of at least %2 characters!,oh,Error) }
  else {
    set %lyr.get $+(/quicks.php?query=,$replace($did(lyr,3).text,$chr(32),+),&type=,$did(lyr,4).seltext))
    sockopen lyr.1 www.lyred.com 80 | did -b lyr 3,4 | did -ra lyr 5 New search | did -o lyr 10 2 Connecting...
  }
}
alias -l lyr.end {
  sockclose lyr.*
  did -e lyr 3,4 | did -ra lyr 5 Search...
  did -ra lyr 11 Documents 0-0 of total 0 found.
  did -ra lyr 12 0 / 0 | did -b lyr 13,14
  did -rv lyr 8 | did -v lyr 11,12,13,14,17 | did -rh lyr 9,16
  if (!$1) { if ($dialog(lyr)) { did -o lyr 10 2 Ready. } }
  if ($1) { if ($dialog(lyr)) { did -o lyr 10 2 $1- } | .timerlyr 1 3 lyr.timer }
}
alias -l lyr.timer { if ($dialog(lyr)) { did -o lyr 10 2 Ready. } }
alias -l lyr.indent { return $str($chr(160),$2) $+ $1 }

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
