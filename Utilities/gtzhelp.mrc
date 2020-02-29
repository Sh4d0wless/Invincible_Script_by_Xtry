;___________________________________________
; Invincible by Xtry
; Help Center
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias gtzhelp { if ($dialog(gtzhelp)) dialog -v gtzhelp | else dialog -m gtzhelp gtzhelp }
dialog gtzhelp {
  title Help Center
  icon graph/help.ico
  size -1 -1 469 237
  button "Close" 1, 11 208 65 20,cancel
  box "",4,7 198 73 33
  tab "Contents" 8, 7 8 453 195
  tab "Commands" 9
  edit "" 3, 153 40 300 149, multi pass autovs vsbar
  list 2, 15 40 138 150, tab 8
  list 10, 15 40 138 150, sort tab 9
  icon 6, 400 5 40 40, graph/help.ico
}
on *:dialog:gtzhelp:init:0: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont $dname 2,3,7,1,4,5,10,9,1 13 14 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 1 clientedge
  did -m $dname 3
  list.help
}
on *:dialog:gtzhelp:Sclick:2: {
  if ( $did(gtzhelp,2).seltext != $null ) { 
    set %x_spec.file utilities\help\ $+ $did($dname,2).seltext $+ .txt 
  }
  else { did -u $dname 2 }
  spec.help
}
on *:dialog:gtzhelp:sclick:10: {
  if ( $did(gtzhelp,10).seltext != $null ) { 
    did -ra $dname 3 $gettok($read(utilities\help\commands.txt,w,* $+ $did(gtzhelp,10).seltext $+ *),2,58)
  }
}
on *:dialog:gtzhelp:sclick:8: spec.help
on *:dialog:gtzhelp:Sclick:9: if ( $did(gtzhelp,10).sel != $null ) { did -ra $dname 3 $gettok($read(utilities\help\commands.txt,w,* $+ $did(gtzhelp,10).seltext $+ *),2,58) }

alias spec.help {
  did -r gtzhelp 3
  set %x_spec 0
  :loop
  inc %x_spec
  if ( %x_spec > $lines(%x_spec.file) ) { did -c gtzhelp 3 1 | halt }
  did -a gtzhelp 3 $read(%x_spec.file,%x_spec)
  did -a gtzhelp 3 $chr(13)
  did -a gtzhelp 3 $chr(10)
  goto loop
}

alias list.help {
  set %x_help 0
  :loop
  inc %x_help
  if ( %x_help > $lines(utilities\help\help.txt) ) { set %x_spec.file utilities\help\intro.txt | list.comm | halt }
  did -a gtzhelp 2 $gettok($read(utilities\help\help.txt,%x_help),1,58)
  goto loop
}

alias list.comm {
  set %x_help 1
  while %x_help <= $lines(utilities\help\commands.txt) {
    did -a gtzhelp 10 $gettok($read(utilities\help\commands.txt,%x_help),1,58)
    inc %x_help
  }
  spec.help
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
