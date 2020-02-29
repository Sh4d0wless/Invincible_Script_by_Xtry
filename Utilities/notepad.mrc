;___________________________________________
; Invincible by Xtry
; Notepad
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias padnote { if ($dialog(notepad)) dialog -v notepad | else dialog -md notepad notepad }
dialog notepad {
  title "Notepad"
  size -1 -1 400 300
  icon graph/notpadx.ico
  button ok,1, 0 0 0 0,cancel
  edit "",2, 3 3 394 276, multi, autovs, vsbar, return
  menu &File,3
  item &New,4,3
  item break,5,3
  item &Open...,6,3
  item &Save As...,7,3
  item break,8,3
  item &Exit,9,3
  button positioner,10, 0 0 0 0
}
on *:dialog:notepad:sclick:10:{
  var %action = $gettok($did($dname,10),1,32)
  if (%action == size) {
    var %w = $dialog($dname).cw,%h = $dialog($dname).ch
    dll dll/mdx.dll MoveControl $dname 2 * * $calc(%w -6) $calc(%h -6)
  }
}

on *:dialog:notepad:menu:4:did -r $dname 2
on *:dialog:notepad:menu:6:did -r $dname 2 | loadbuf -o $dname 2 $$sfile(*.txt,Select a .txt file,Load)
on *:dialog:notepad:menu:7:savebuf -o $dname 2 $sdir(Select a directory) $+ $$?="Enter filename:"
on *:dialog:notepad:menu:9:savebuf -o $dname 2 utilities\notepad.txt | dialog -x $dname
on *:dialog:notepad:init:*:{

  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname

  dll dll/mdx.dll SetControlMDX $dname 10 positioner size minbox maxbox > dll/dialog.mdx

  ;dll dll/mdx.dll SetDialog $dname style border title sysmenu minbox
  ;dll dll/mdx.dll SetControlMDX $dname 10 positioner size maxbox > dll/dialog.mdx

  if ($isfile(utilities\notepad.txt)) loadbuf -o $dname 2 utilities\notepad.txt
}
on *:dialog:notepad:sclick:1:savebuf -o $dname 2 utilities\notepad.txt

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
