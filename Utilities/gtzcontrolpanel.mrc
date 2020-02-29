;___________________________________________
; Invincible by Xtry
; Control Panel
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias -l etl echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $1-
alias -l nid cfgtzcp misc icondir $$sdir($left($mircdir,3),- Select Your New Icondir)
alias -l d if (!$1) return | elseif (!$dialog($1)) dialog -m $1 $1
alias -l cfgtzcp .writeini -n utilities/cp/config.ini $$1 $$2 $3-
alias -l _cfgtzcp return $readini utilities/cp/config.ini $$1 $$2
alias -l mdx if ($lock(dll)) return | if ($isid) return $dll($mdx.udll,$1,$iif($2- != $null,$2-,.)) | dll $shortfn($mdx.udll) $1-
alias -l popdll return dll/popups.dll
alias -l mdx.udll return dll/mdx.dll
alias -l mdx.vdll return dll/views.mdx
alias -l mdx.bdll return dll/bars.mdx
alias -l mdx.ddll return dll/dialog.mdx
alias -l mdx.set mdx SetDialog $dname $1-
alias -l movecontrol mdx MoveControl $dname $1-
alias -l headersizes did -i $dname $1 1 header $2-
alias -l new.menu dll $popdll New $1-
alias -l popup.destroy dll $popdll Destroy $$1
alias -l popup.newitem dll $popdll AddItem $$1-
alias -l popup tokenize 32 $dll($popdll,Popup,$1-) | if ($isid) return $1- | $iif($4- != did not select a menu item,$4-)
alias mdx.start {
  mdx MarkDialog $dname
  mdx SetMircVersion $version
  var %a = 1,%x = 0
  while (%a <= 205) {
    var %b = $dll($mdx.udll,SetFont,$dname %a + 13 14 Tahoma)
    if (ERROR isin %b) { inc %x }
    if (%x == 6) { break }
    inc %a
  }
}
alias tab {
  if ($1- == $null) return $chr(9)
  var %list
  var %a = 1
  while ( $ [ $+ [ %a ] ] != $null ) {
    set %list $instok(%list, $ [ $+ [ %a ] ] ,0,9)
    inc %a
  }
  return %list
}
alias cp d cp
alias cpeditor d cpeditor
alias cpabout d about
dialog cp {
  size -1 -1 403 243
  title Control Panel
  button "",1,0 0 0 0, cancel
  button positioner,6, 0 0 0 0
  list 2, 2 2 400 220, size hide
  list 3, 2 2 400 220, size hide
  list 4, 2 2 400 220, size hide
  list 5,2 222 400 20, size
}
alias refresh.panel {
  did -r $dname 2,3,4 | did -i $dname 2,3,4 1 clearicons list
  var %b = $calc($lines(utilities/cp/panel.txt) +2) | var %a = $mdx(SetControlMDX,2 listview autoarange flatsb icon > [ $mdx.vdll ] ),%a = $mdx(SetControlMDX,3 listview autoarange flatsb smallicon > [ $mdx.vdll ] ),%a = $mdx(SetControlMDX,4 listview report flatsb grid noheader > [ $mdx.vdll ] )
  headersizes 4 @150,300 | var %a = 1 | while $read(utilities/cp/panel.txt,%a) { var %b = $read(utilities/cp/panel.txt,%a) | did -i $dname 2,3,4 1 seticon %a, $+ $gettok(%b,1,9) | did -i $dname 5 1 seticon list %a, $+ $gettok(%b,1,9) | did -a $dname 2,3 %a $gettok(%b,2,9) | did -a $dname 4 %a $gettok(%b,2,9) $chr(9) $gettok(%b,3,9) | inc %a }
  did -i $dname 5 2 0 $tab($lines(utilities/cp/panel.txt) Objects Loaded,Control Panel)
}
alias editing.panel { dialog -c $dname | cpeditor }
alias large.view { did -h $dname 3,4 | did -v $dname 2 | cfgtzcp misc panelview large | did -i $dname 5 2 0 $tab($calc($did($dname,2).lines -1) Object(s) Loaded,Control Panel) }
alias small.view { did -h $dname 2,4 | did -v $dname 3 | cfgtzcp misc panelview small | did -i $dname 5 2 0 $tab($calc($did($dname,3).lines -1) Object(s) Loaded,Control Panel) }
alias detials.view { did -h $dname 2,3 | did -v $dname 4 | cfgtzcp misc panelview detials | did -i $dname 5 2 0 $tab($calc($did($dname,4).lines -1) Object(s) Loaded,Control Panel) }
on *:DIALOG:cp:*:*:{
  if ($devent == init) {
    mdx.start | mdx.set icon graph/cp.ico | mdx.set style border title sysmenu minbox
    var %a = $mdx(SetControlMDX,2 listview autoarange flatsb icon > $mdx.vdll ),%a = $mdx(SetControlMDX,3 listview autoarange flatsb smallicon > $mdx.vdll ),%a = $mdx(SetControlMDX,4 listview report flatsb grid noheader > $mdx.vdll ),%a = $mdx(SetControlMDX,5 statusbar > $mdx.bdll ),%a = $mdx(SetBorderStyle,5 windowedge),%a $mdx(SetControlMDX,6 positioner size maxbox minbox > $mdx.ddll )
    headersizes 4 @150,300 $tab(0 T1,T2) | var %a = 1 | while $read(utilities/cp/panel.txt,%a) { var %b = $read(utilities/cp/panel.txt,%a) | did -i $dname 2,3,4 1 seticon %a, $+ $gettok(%b,1,9) | did -i $dname 5 1 seticon list %a, $+ $gettok(%b,1,9) | did -a $dname 2,3 %a $gettok(%b,2,9) | did -a $dname 4 %a $gettok(%b,2,9) $chr(9) $gettok(%b,3,9) | inc %a }
    did -i $dname 5 2 0 $tab($lines(utilities/cp/panel.txt) Object(s) Loaded,Control Panel)
    if ($_cfgtzcp(misc,panelview) == large) { did -h $dname 3,4 | did -v $dname 2 }
    if ($_cfgtzcp(misc,panelview) == small) { did -h $dname 2,4 | did -v $dname 3 }
    if ($_cfgtzcp(misc,panelview) == detials) { did -h $dname 2,3 | did -v $dname 4 }
  }
  if ($devent == sclick) {
    if ($did isnum 2-4) { var %a = $gettok($read(utilities/cp/panel.txt,$calc($did($dname,$did).sel - 1)),2,9) | if (%a) did -i $dname 5 2 $calc($did($dname,$did).sel - 1) $tab(%a,%a) }
    if ($did isnum 2-4) {
      if ($gettok($did($dname,$did,1),1,32) != rclick) || ($did($did).seltext != $null) halt
      new.menu cp 0 8
      new.menu cp.view 10 10
      popup.newitem cp end +> 1 1 Views $cr cp.view
      $iif($_cfgtzcp(misc,panelview) == large,popup.newitem cp.view end +x 0 0 Large Icons,popup.newitem cp.view end + 0 0 Large Icons $cr large.view)
      $iif($_cfgtzcp(misc,panelview) == small,popup.newitem cp.view end +x 0 0 Small Icons,popup.newitem cp.view end + 0 0 Small Icons $cr small.view)
      $iif($_cfgtzcp(misc,panelview) == detials,popup.newitem cp.view end +x 0 0 Details,popup.newitem cp.view end + 0 0 Details $cr detials.view)
      popup.newitem cp end
      popup.newitem cp end 2 2 Refresh $cr refresh.panel
      popup.newitem cp end 3 3 Panel Editor $cr editing.panel
      popup.newitem cp end
      popup.newitem cp end 4 4 Close $cr dialog -c $dname
      popup cp $mouse.dx $mouse.dy
    }
    if ($did == 6) {
      var %a = $gettok($did($dname,6),1,32)
      if (%a == size) {
        var %w = $dialog($dname).cw,%h = $dialog($dname).ch
        movecontrol 2 * * $calc(%w -4) $calc(%h -23)
        movecontrol 3 * * $calc(%w -4) $calc(%h -23)
        movecontrol 4 * * $calc(%w -4) $calc(%h -23)
        movecontrol 5 * $calc(%h -21) $calc(%w -3) *
      }
    }
  }
  if ($devent == dclick) {
    if ($did isnum 2-4) if ($gettok($read(utilities/cp/panel.txt,$calc($did($dname,$did).sel - 1)),3,9)) { $ifmatch }
  }
}
alias paneledit did -r $dname 2 | did -i $dname 2 1 clearicons main | var %a = 1 | while $read(utilities/cp/panel.txt,%a) { var %b = $read(utilities/cp/panel.txt,%a) | did -i $dname 2 1 seticon %a, $+ $gettok(%b,1,9) | did -a $dname 2 %a $tab($gettok(%b,2,9),$gettok(%b,3,9)) | inc %a }
alias clearpanel write -c utilities/cp/panel.txt | paneledit
alias remitem if ($did($dname,2).sel) write -dl $+ $calc($ifmatch - 1) utilities/cp/panel.txt | paneledit
alias additem var %a = $$?="Caption:",%b = $$?="Command:",%c = $$sfile($_cfgtzcp(misc,icondir) $+ \*.ico,Select An Icon,Select) | write utilities/cp/panel.txt $remove(%c,$mircdir) $+ $chr(9) $+ %a $+ $chr(9) $+ %b | did -i $dname 2 1 seticon $did($dname,2).lines, $+ %c | did -a $dname 2 $did($dname,2).lines $tab(%a,%b)
dialog cpeditor {
  title Control Panel Editor
  size -1 -1 300 235
  button Done,1, 248 188 50 23, cancel
  list 2,2 5 296 180,size
}
on *:DIALOG:cpeditor:*:*:{
  if ($devent == init) {
    mdx.start | mdx.set icon graph/cp.ico
    var %a = $mdx(SetControlMDX,2 listview report showsel rowselect flatsb nosortheader single alignleft > [ $mdx.vdll ] ), %a = $mdx(SetBorderStyle,1 clientedge) > [ $mdx.bdll ] )
    headersizes 2 @150,126 $tab(Caption,Command) | paneledit
  }
  if ($devent == sclick) {
    if ($did == 2) {
      if ($gettok($did($dname,2,1),1,32) != rclick) halt
      new.menu cp 0 8
      popup.newitem cp end 1 1 Add $cr additem
      if ($did(2).sel) popup.newitem cp end 2 2 Remove $cr remitem
      popup.newitem cp end
      popup.newitem cp end 3 3 Clear $cr clearpanel
      popup.newitem cp end 4 4 Refresh $cr paneledit
      popup.newitem cp end
      popup.newitem cp end 5 5 Exit $cr dialog -c $dname
      popup cp $mouse.dx $mouse.dy
    }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
