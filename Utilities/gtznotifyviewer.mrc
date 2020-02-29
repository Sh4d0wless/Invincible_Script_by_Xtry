;___________________________________________
; Invincible by Xtry
; Notify Viewer
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias -l mdx.n if ($lock(dll)) return | if ($isid) return $dll($mdx.nudll,$1,$iif($2- != $null,$2-,.)) | dll $shortfn($mdx.nudll) $1-
alias -l mdx.nudll return dll/mdx.dll
alias -l mdx.nvdll return dll/views.mdx
alias -l mdx.nbdll return dll/bars.mdx
alias -l pop.ndll return dll/popups.dll
alias -l mdx.set mdx.n SetDialog $dname $1-
alias -l headersizes.n did -i $dname $1 1 header $2-
alias -l new.menu dll $pop.ndll New $1-
alias -l popup.destroy dll $pop.ndll Destroy $$1
alias -l popup.newitem dll $pop.ndll AddItem $$1-
alias -l popup tokenize 32 $dll($pop.ndll,Popup,$1-) | if ($isid) return $1- | $iif($4- != did not select a menu item,$4-)
alias -l mdx.startn {
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll SetControlMDX $dname 4 ListView flatsb report single showsel rowselect grid nosortheader > dll/views.mdx
  dll dll/mdx.dll SetBorderStyle $dname 2 clientedge > dll/bars.mdx
  dll dll/mdx.dll SetFont 2,3,5 13 14 Tahoma
  var %not-a = 1,%not-x = 0
  while (%not-a <= 205) {
    var %not-b = $dll($mdx.nudll,SetFont,$dname %not-a + 13 14 Tahoma)
    if (ERROR isin %not-b) { inc %not-x }
    if (%not-x == 6) { break }
    inc %not-a
  }
}
alias -l tab {
  if ($1- == $null) return $chr(9)
  var %not-list
  var %not-a = 1
  while ( $ [ $+ [ %not-a ] ] != $null ) {
    set %not-list $instok(%not-list, $ [ $+ [ %not-a ] ] ,0,9)
    inc %not-a
  }
  return %not-list
}

alias check.notify {
  if (!$dialog(notify)) { notifylist }
  did -r notify 4
  var %a = 1,%b = 1
  while ($notify(%a)) {
    if ($notify(%a).ison) did -a notify 4 1 $tab($notify(%a),Online,$notify(%a).note,$notify(%a).addr)
    inc %a
  }
  while ($notify(%b)) {
    if (!$notify(%b).ison) did -a notify 4 2 $tab($notify(%b),Offline,$notify(%b).note,$notify(%a).addr)
    inc %b
  }
}
alias add.notify var %not-a = $$?="Enter NickName:",%not-b = $$?="Enter Note For %not-a $+ : " | if (%not-a) .notify %not-a $iif(%not-b,%not-b) | check.notify
alias rem.notify var %not-a = $gettok($gettok($did($dname,4).seltext,1,9),3,32) | if (%not-a) .notify -r %not-a | check.notify
alias notifylist { if ($dialog(notify)) dialog -v notify | else dialog -m notify notify }
dialog notify {
  title "Notify Viewer"
  icon graph/noteview.ico
  size -1 -1 509 220
  box "" 1, 449 180 58 39
  button Done, 2, 453 191 50 23, ok
  check "Open on connect",3,5 187 100 15
  check "Open on user online",5,5 203 120 15
  list 4, 0 2 508 183, size extsel
}
on *:DIALOG:NOTIFY:*:*:{
  if ($devent == init) {
    mdx.startn
    did -i $dname 4 1 headerdims 150:1 70:2 120:3 145:4
    did -i $dname 4 1 headertext +l Nickname $chr(9) Status $chr(9) Note  $chr(9) Address
    did -i $dname 4 1 seticon graph/online.ico
    did -i $dname 4 1 seticon graph/offline.ico
    var %a = $mdx(SetControlMDX,4 listview flatsb report single showsel rowselect grid nosortheader > [ $mdx.nvdll ] ), %a = $mdx(SetBorderStyle,2 clientedge) > [ $mdx.nbdll ] )
    if (%note.oncon = on ) { did -c notify 3 } | else { did -u notify 3 }
    if (%note.onus = on ) { did -c notify 5 } | else { did -u notify 5 }
  }
  if ($devent == sclick) {
    if ($did = 3) { if ($did($dname,$did).state == 1) { set %note.oncon on } | else { set %note.oncon off } }
    if ($did = 5) { if ($did($dname,$did).state == 1) { set %note.onus on } | else { set %note.onus off } }
    if ($did == 4) {
      var %not-a = $gettok($gettok($did($dname,4).seltext,1,9),3,32),%not-b = $gettok($gettok($did($dname,4).seltext,2,9),2-,32)
      if (%not-a) && (%not-b == yes) var %not-wh = w %not-a
      if ($gettok($did($dname,4,1),1,32) != rclick) halt
      new.menu notify 0 8
      if (%not-a) popup.newitem notify end + Whois $cr %not-wh
      if (%not-a) popup.newitem notify end +
      popup.newitem notify end + Add $cr add.notify
      if (%not-a) popup.newitem notify end + Remove $cr rem.notify
      popup.newitem notify end +
      popup.newitem notify end + Refresh $cr check.notify
      popup notify $mouse.dx $mouse.dy
    }
  }
}
on ^1:NOTIFY:{
  if ($dialog(notify)) check.notify
  if (%note.onus = on) { check.notify }
}
on ^1:UNOTIFY: if ($dialog(notify)) check.notify
on *:DISCONNECT: if ($dialog(notify)) check.notify


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
