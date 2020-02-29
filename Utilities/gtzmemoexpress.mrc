;___________________________________________
; Invincible by Xtry
; Memo Express
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias /msend a dialog $er(main,scr) smemo smemo
on 1:dialog:newmemo:sclick:2:memos 
on 1:dialog:smemo:*:*:{ if $devent = init { s.send } | if $devent = sclick { if $did = 10 { did -r smemo 1 | did -r smemo 3 | did -r smemo 6 | unset %smemo.to %smemo | ed main cc }
    if $did = 9 { if %smemo { %enc.mode = 1 | a dialog $er(main,scr) enc.win enc.win } | else { a okwin Error No message to encode! } }
    if $did = 8 { if %smemo = $null { a okwin Error No message to send! | goto mend  } | if %smemo.to = $null && $er(main,cc) = $null { a okwin Error No recipients to send to! | goto mend }
      if %smemo.to { set -u0 %sending on | if sop isin %smemo.to { memoserv %smemo.to %smemo } | else { memoserv send %smemo.to %smemo } | ads %smemo.to }
      if $er(main,cc) { %cc.co = 1 | set -u0 %sending on | :loop | if %cc.co > $numtok($er(main,cc),160) { unset %cc.co } | else { ads $gettok($er(main,cc),%cc.co,160) | if sop isin $gettok($er(main,cc),%cc.co,160) { memoserv $gettok($er(main,cc),%cc.co,160) %smemo } 
      else { memoserv send $gettok($er(main,cc),%cc.co,160) %smemo  } | inc %cc.co 1 | goto loop } }
    if %sending = on { mem.lab Transmitting outgoing traffic | a dialog -c smemo } |  :mend   }
    if $did = 14 { if ($did(3).sel = $null) || ($gettok($er(main,cc),0,160) = 1) { ed main cc | did -r smemo 3 } | else { ew main cc $remtok($er(main,cc),$gettok($er(main,cc),$did(3).sel,160),1,160) | did -r smemo 3 $did(3).sel } | recipup | cmemo.u }
    if ($did = 7) && (%smemo.to) { ew main cc $addtok($er(main,cc),%smemo.to,160) | did -c smemo 1 0 | unset %smemo.to | recipup | cmemo.u }
  if ($did = 11) { unset %smemo* | ed main cc | if ($dialog(memos)) { .timersel -m 1 1 did -f memos 3 } } | if $did = 1 { %smemo.to = $did(1,$did(1).sel).text | recipup } }
  if $devent = edit { if $did = 1 { %smemo.to = $did(1).text | recipup } | if $did = 6 {  set -u0 %smemo1 $did(6,1).text $+ $did(6,2).text $+ $did(6,3).text $+ $did(6,4).text $+ $did(6,5).text $+ $did(6,6).text
  if $len(%smemo1) > 255 { did -ra smemo 12 Max | beep 1 1 | goto end } | else { %smemo = %smemo1 } | if %smemo = $null { did -ra smemo 12 0 } | else { did -ra smemo 12 $len(%smemo) } } } | :end
}
on 1:dialog:settings:*:*:{ if $devent = init { settings } | if $devent = edit { if $did = 10 { %mem.x = $did(10).text | if $isalias(%mem.x) = $true { a okwin Conflict %mem.x is an existing alias in $isalias(%mem.x).fname please choose another. } }
    else { %expire = $did(6).text | if ($exp.chk = $false) { beep 1 1 } } } | if ($devent = sclick) { if ($did = 10) { set %mem.x $did(10,$did(10).sel).text
    if ($isalias(%mem.x) = $true) && ($did(10).sel != 1) { a okwin Error %mem.x is already being used by $isalias(%mem.x).fname } | else { if (%mem.x) { alias $gettok($er(main,fkey),1,160) | ew main fkey $instok($remtok($er(main,fkey),%mem.x,1,160),%mem.x,1,160) | alias %mem.x memos } } }
    if ($did = 17) { ew main not 1 } | if ($did = 18) { ew main not 0 } | if ($did = 13) { ew main scr -dm | a okwin Info Please close all MemoExpress dialogs for this to take effect. } | if ($did = 15) { ew main scr -m | a okwin Info Please close all MemoExpress dialogs for this to take effect. }
    if ($did = 8) { ew main mode 0 } | if ($did = 9) { ew main mode 1 } | if ($did = 4) { a wavset } | if ($did = 5) && ($exists($er(main,sound)) = $true) { /.splay $shortfn($er(main,sound))  } | if ($did = 7) { bmemo } | if ($did = 6) { %expire = $remove($did(6,$did(6).sel).text, days) }
    if ($did = 1) { if ($isalias(%mem.x) = $false) && (%mem.x) { ew main fkey $instok($remtok($er(main,fkey),%mem.x,1,160),%mem.x,1,160) | alias %mem.x memos | unset %mem.x } | if ($exp.chk = $true) { ew main expire.lst $instok($remtok($er(main,expire.lst),%expire,1,160),%expire,1,160) | ew main expire %expire | unset %expire }
  if ($dialog(memos)) { did -f memos 3 } } }
}
on 1:dialog:okwin:init:0:a dialog -t okwin MemoExpress %okwin.title | did -a okwin 1 %okwin.text | did -f okwin 2 | unset %okwin.*
on 1:dialog:enc.win:*:*:{ if ($devent = init) { unset %base %offset | enc.setup | %x = 1 | %x.t = $er(encrypt,base) | :loop | if (%x <= $numtok($er(encrypt,base),160)) && ($gettok(%x.t,0,160)) { did -a enc.win 1 $gettok(%x.t,%x,160) | inc %x | goto loop }
  did -c enc.win 1 1 | %base = $did(1,1) | %x = 1 | %x.t = $er(encrypt,offset) | :loop2 | if (%x > 3) { unset %x %x.t | did -c enc.win 2 1 | %offset = 2 } | else { did -a enc.win 2 $gettok(%x.t,%x,160) | inc %x | goto loop2 } }
  if ($devent = sclick) { if ($did = 9) { if ($gettok($er(encrypt,base),1,160) != %base) { a okwin Error Please setup the base number | goto end } | if ($er(encrypt,4) = $null) { a okwin Error Please setup the Algorithm | goto end }
      if (%smemo) && (%enc.mode = 1) && ($dialog(smemo)) { a dialog -c enc.win | set -u0 %smemo.enc $em.enc(%smemo) | did -r smemo 6 | did -a smemo 6 %smemo.enc | %smemo = %smemo.enc }
      if (%v.v.temp) && (%enc.mode = 0) { a dialog -c enc.win | set -u1 %smemo.enc $em.dec($gettok(%v.v.temp,5-,32)) | did -r memos 4 | memcon.v decode | did -a memos 4 %smemo.enc | %dec.msg = %v.v.temp | %dec.pos = $em.pos | write -dl $+ %dec.pos $b | write -il $+ %dec.pos $b $reptok(%dec.msg,$gettok(%v.v.temp,5-,32),%smemo.enc,1,32) | unset %dec.* }
      unset %enc.* 
    } 
    if ($did = 8) { unset %base %offset } | if ($did = 3) { %base = $did(2,$did(3).sel).text } | if ($did = 2) { %offset = $did(2,$did(2).sel).text } | if ($did = 7) {
      if ($gettok($er(encrypt,base),1,160) = %base) && ($gettok($er(encrypt,offset),1,160) = %offset) && ($er(encrypt,4)) { enc.wina No Change | goto end }
    if ($base = $false) { enc.wina Invalid Base number | beep 1 1  | goto end } | if ($offset = $false) { enc.wina Invalid Offset number | beep 1 1 | goto end } | else { enc.wina Setting up Algorithm } | em.code %base %offset }
  }
  if ($devent = edit) { if ($did = 1) { %base = $did(1).text | if ($base = $false) { beep 1 1 | unset %base } }
    if ($did = 2) { %offset = $did(2).text | if ($offset = $false) { beep 1 1 | unset %offset } } 
    :end
} }
on 1:dialog:block.l:*:*:{ if ($devent = init) { s.block } | if ($devent = edit) && ($did = 1) { %blockl = $did(1).text } | if ($devent = sclick) {
    if ($did = 5) && (%blockl) { did -i block.l 1 1 %blockl | ew main blocked $addtok($er(main,blocked),%blockl,160) | unset %blockl | did -u block.l 1 | flushini mirc2.ini }
    if ($did = 4) { unset %blockl | flushini $c | if ($dialog(settings)) { did -f settings 1 } }
    if ($did = 6) { if ($did($dname,1,$did($dname,1).sel) == $null) { var %tmp.dec = $did($dname,1).lines | ed main blocked | while (%tmp.dec > 0) { did -d $dname 1 %tmp.dec | dec %tmp.dec } } | else { if ($did(block.l,1,0).sel > 0) { %del.sel = $gettok($er(main,blocked),$did(block.l,1).sel,160) | if ($gettok($er(main,blocked),0,160) > 1) { ew main blocked $deltok($er(main,blocked),$did(block.l,1).sel,160) } | else { ed main blocked } } | .timerdidsel -m 1 1 did -c block.l 1 $did(block.l,1).sel | did -d block.l 1 $did(block.l,1).sel | did -u block.l 1 | unset %del.sel } }
} }
on 1:dialog:memos:*:*:{ if ($devent = dclick) && ($did = 3) && (%v.v.temp) { %reply = on | msend } | if ($devent = init) { memo.v } | if (%memostatx = on) { did -c memos 40 } | else { did -c memos 41 } | if ($devent = sclick) { if ($did = 21) { a dialog $er(main,scr) mhelp mhelp } | if ($did = 40) { set %memostatx on | .enable #gtzmemoxp | did -u memos 41 } | if ($did = 41) { set %memostatx off | .disable #gtzmemoxp | did -u memos 40 } | if ($did = 23) { msend }
    if (%v.v.temp)  { if ($did = 12) { %enc.mode = 0 | a dialog $er(main,scr) enc.win enc.win } | if ($did = 8) { %reply = on | msend } | if ($did = 9) { %fwd = on | msend } }
    if ($did = 18) { a dialog $er(main,scr) settings settings } | if ($did = 10) && ($did(memos,3).sel > 0) { memos.d | ew main blocked  $addtok($er(main,blocked),$gettok(%v.v.temp,4,32),160) | memo.del | mem.lab Now blocking $gettok(%v.v.temp,4,32) }
  if ($did = 11) && ($did(memos,3).lines > 0) { memo.del } | if ($did = 17) { unset %v.* } | if ($did = 3) { memcon.v $did(memos,3).sel } }
}

#gtzmemoxp on
on ^*:notice:*:*:{ 
  if ($nick = Memoserv) && ($network = DALnet) { 
    if ($er(filter,done) isin $1-) { if (%valmem) { if ($er(main,not) = 0) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You have new memo traffic } | if $dialog(memos) = $null { a dialog $er(main,scr) newmemo newmemo } | nwtrfc | unset %valmem %mem.list } }
    if ($er(filter,new) isin $1-) && (%mem.list != on) { memoserv list | set -u60 %mem.list on | goto end } 
    if ($er(filter,mlist) isin $1-) { set %m.list on | unset %m.q* } 
    if ($er(filter,end) isin $1-) && (%mem.sent != on) { mem.lab Outgoing traffic delivered | set -u60 %mem.sent on | goto end }
    if ($er(filter,mfrom) isin $1-) { %m.who = $remove($4,$chr(46)) | if ($2 = $calc(%m.que - 1)) { memoserv del all | unset %m.qu* }
    set %m.wri on | goto end }
    if (%m.wri = on) { if ($mnick(%m.who)) { mem.store $psn.inc $ctime %m.who $1- | inc %valmem } | unset %m.wri |  goto end }
    if (%m.list = on) { 
      if ($1 = end) { unset %m.list | memoserv read %m.que2 } 
      else { if (%m.que2 = $null) { %m.que2 = %m.que } 
        else { %m.que2 = %m.que2 $+ , $+ %m.que } 
        inc %m.que 1 
      } 
    }
  :end | haltdef }
}
#gtzmemoxp end
dialog Memos {
  title "Memo System "
  icon graph\memox.ico
  icon 21, 15 210 30 30,graph\memox.ico
  size -1 -1 412 248
  list 3, 5 20 100 149
  edit "", 4, 130 20 276 123, left, multi, vsbar
  text "From:", 6, 6 5 60 13, left
  text "Message:", 7, 130 5 100 13, left
  button "&Reply", 8, 111 168 55 22, default
  button "&Forward", 9, 169 168 55 22
  button "&Block", 10, 227 168 55 22
  button "&Delete", 11, 285 168 55 22
  button "&Decode", 12, 343 168 55 22
  box "Selected Memo Control ", 14, 104 150 302 50
  box "Compose", 22, 5 150 90 50
  button "&New", 23, 22 168 55 22, default
  button "&Settings", 18, 250 215 90 20
  button "&OK", 17, 341 215 65 20, ok
  box "", 19, 5 200 180 40, hide
  text "", 20, 8 216 160 20, center, hide
  radio "Enable",40,120 215 50 20,push group
  radio "Disable",41,170 215 50 20,push
}
dialog block.l {
  title "Blocked Names"
  icon graph\memox.ico
  size -1 -1 198 210
  combo 1, 5 35 186 140, edit
  text "Enter name to be blocked:", 2, 6 8 160 13, left
  button "&OK", 4, 5 178 55 23, ok
  button "&Add", 5, 65 179 45 20, default
  button "&Delete", 6, 115 179 45 20
}
dialog newmemo {
  title "MemoExpress" 
  icon graph\memox.ico
  size -1 -1 200 80
  text "You have new memo(s)!",1,10 15 180 30, center
  button "&Open", 2, 20 40 70 30, ok, default
  button "&Close", 3, 110 40 70 30, cancel
}
dialog smemo {
  title "Send Memo"
  icon graph\memox.ico
  size -1 -1 360 205
  combo 1, 18 25 141 171, drop, edit
  box "Recipient", 2, 5 1 350 62
  list  3, 192 19 139 50, sort
  text "Message:", 4, 5 68 50 20, left
  text "Characters:", 5, 265 68 80 20, left
  text "0", 12, 325 68 80 12, left
  edit "" 6, 5 85 350 74, multi
  button ">", 7, 166 26 20 20, default
  button "&Send", 8, 6 168 55 22, ok
  button "&Encode", 9, 64 168 55 22
  button "&Cancel", 11, 122 168 55 22, cancel 
  button "halt", 13, 300 500 5 5, default
  button "-", 14, 336 26 10 20
}
dialog enc.win {
  title "Memo Encode" 
  icon graph\memox.ico
  size -1 -1 125 145
  combo 1, 40 3 80 100, drop, edit
  combo 2, 40 30 80 100, drop, edit
  text "&Base:", 3, 5 6 30 20, left
  text "&Offset:", 4, 5 33 30 20, left
  box "", 5, 4 50 116 25
  text "Standing by", 6, 5 58 113 15, center
  button "&Setup", 7, 4 78 116 20
  button "&Cancel", 8, 4 100 116 20, cancel
  button "&Encode", 9, 4, 122 116 20, default
}
dialog okwin { 
  title "" 
  icon graph\memox.ico
  size -1 -1 200 100 
  edit "", 1, 1 1 199 69, read, multi 
  button "&OK", 2, 72 75 55 22, ok default
}
dialog mHelp {
  title "MemoExpress Help"
  icon graph\memox.ico
  size -1 -1 412 288
  edit "", 1, 5 55 402 200, multi, read, vsbar
  button "&Close", 3, 341 262 65 20, cancel
  button "&Web Page", 6, 257 262 78 20
  button "&Join #MemoExpress", 7, 143 262 108 20
  combo 4, 10 18 200 200, drop
  box "Topic list", 5, 5 1 210 50
  button "&Open MemoExpress", 2, 5 262 132 20, disable, hide
}
alias -l ads ew main send $addtok($remtok($er(main,send),$1-,1,160),$1-,160)
alias -l vw did -c mhelp 1 1 | did -c mhelp 1 $1 
alias -l h.p return $did(mhelp,4,1).sel
alias -l okwin %okwin.title = $1 | %okwin.text = $2- | dialog -mdo okwin okwin 
alias -l recipup %smemo.t2 = 0 | %smemo.t3 = 0 | if (%smemo.to) { %smemo.t2 = 1 } | if ($gettok($er(main,cc),0,160)) { %smemo.t3 = $gettok($er(main,cc),0,160) } | did -a smemo 2 Recipients: $calc(%smemo.t2 + %smemo.t3) 
alias -l s.send { ed main cc | if (%reply = on) { if (user isin $mtype(%v.v.temp)) { set %smemo.to $gettok(%v.v.temp,4,32) | goto next } | if (Sops isin $mtype(%v.v.temp)) { set %smemo.to SendSop $gettok(%v.v.temp,5,32) }
  else { set %smemo.to $gettok(%v.v.temp,5,32) } | :next | ew main send $addtok($remtok($er(main,send),%smemo.to,1,160),%smemo.to,160) }
  if (%fwd = on) { if (sop isin $mtype(%v.v.temp)) { %fwd2 = $gettok(%v.v.temp,5-,32) | goto g } | if (user isin $mtype(%v.v.temp)) { %fwd2 = $gettok(%v.v.temp,4,32) > $gettok(%v.v.temp,5-,32) }
  else { %fwd2 = $gettok(%v.v.temp,4-,32) } | :g | did -a smemo 6 fwd: $left(%fwd2,255) | %smemo = $left(%fwd2,255) | unset %fwd* }
  %x = $numtok($er(main,send),160) | %x.t = $er(main,send) | :loop | if (%x <= 0) || (%x = $null) { unset %x %x.t } | else { did -a smemo 1 $gettok(%x.t,%x,160) | dec %x | goto loop } | if (%reply = on) { did -c smemo 1 1 | unset %reply | recipup }
  did -ra smemo 12 $len(%smemo)
}
alias wavset set -u0 %wt2 $$dir="New traffic received sound" $wavloc | did -ra settings 4 $nopath(%wt2) | ew main sound %wt2
alias -l enc.setup if (%enc.mode = 1) { %enc.title = Memo Encode | %enc.btn = Encode } | else { %enc.title = Memo Decode | %enc.btn = Decode  } | a dialog -t enc.win %enc.title | did -ra enc.win 9 %enc.btn
alias -l enc.wina did -a enc.win 6 $1-
alias -l wavloc if ($er(main,sound) = $null) { return $wavedir*.wav } | else { return $er(main,sound) }
alias -l exp.chk if (%expire = $null) || (%expire !isnum 1-9000) && (%expire != never) { return $false } | else { return $true }
alias -l offset if (%offset = $null) || (%offset !isnum 1-3) { return $false } | else { return $true }
alias -l base if (%base = $null) || (%base !isnum 1-125000) { return $false } | else { return $true }
alias -l nwtrfc if ($exists($er(main,sound)) = $true) && ($er(main,mode) = 1) { /.splay $shortfn($er(main,sound)) }
alias -l a.line2 did -i mhelp 1 $1-
alias memos if ($dialog(memos) = $null) { a dialog $er(main,scr) memos memos }
alias -l m.title dialog -t memos MemoExpress [Unread: %v.unread ][Read: %v.read ][Total: $lines($b) ][Expired: %v.expire ]
alias -l cmemo.u  did -r smemo 3 |  %c.co = 1 | %c.info = $er(main,cc) | :loop | if (%c.co > $gettok(%c.info,0,160)) || ($gettok(%c.info,0,160) = $null) { unset %c.* } | else { did -a smemo 3 $gettok(%c.info,%c.co,160) | inc %c.co | goto loop }
alias -l em.pos return $calc(($lines($b) + 1) - $did(memos,3).sel)
alias -l er return $readini $c $1 $2-
alias -l ew writeini $c $1 $2 $3- 
alias -l ed remini $c $1 $2
alias -l psn.inc ew main psn $calc($er(main,psn) + 1) | return $er(main,psn)
alias -l mnick if ($1 !isin $er(main,blocked)) { return $true }
alias -l mdate set -u1 %mdate $round($calc(($ctime - $1) / 86400),1) | if (%mdate > $er(main,expire)) && ($er(main,expire) != never) { return expired } | else { return $gettok($asctime($1),1-2,32) $+ $gettok($asctime($1),3,32) $civitime($gettok($asctime($1),4,32)) }  
alias -l mtype if (fwd: isin $gettok($1-,5,32)) { return Fwd | goto end } | if ($chr(35) isin $gettok($1-,5,32)) && ($gettok($1-,6,32) = >>) { return %m2 To: Ops $gettok($1-,5,32) | goto end } | if ($chr(35) isin $gettok($1-,5,32)) && (sop isin $gettok($1-,6,32)) { return %m2 To: Sops $gettok($1-,5,32) | goto end } | else { return %m2 User } | :end
alias -l mstat if ($er(read,$1) = on) { return read }
alias -l mem.store write -i1 $b $me $1- | if ($dialog(memos)) { did -i memos 3 1 * $gettok($1-,3,32) | inc %v.unread 1 | m.title } | unset %m.who 
alias -l mem.lab if ($dialog(memos)) { did -v memos 19 | did -v memos 20 | did -ra memos 20 $1- | .timerlab 1 5 mem.labh } | else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $1- }
alias -l mem.labh if ($dialog(memos)) { did -h memos 19 | did -h memos 20 }
alias -l em.enc return $replace($1-,a,$emm(1),b,$emm(2),c,$emm(3),d,$emm(4),e,$emm(5),f,$emm(6),g,$emm(7),h,$emm(8),i,$emm(9),j,$emm(10),k,$emm(11),l,$emm(12),m,$emm(13),n,$emm(14),o,$emm(15),p,$emm(16),q,$emm(17),r,$emm(18),s,$emm(19),t,$emm(20),u,$emm(21),v,$emm(22),w,$emm(23),x,$emm(24),y,$emm(25),z,$emm(26),1,$emm(27),2,$emm(28),3,$emm(29),4,$emm(30),5,$emm(31),6,$emm(32),7,$emm(33),8,$emm(34),9,$emm(35),0,$emm(36),$chr(32),$emm(37),!,$emm(38),?,$emm(39))
alias -l em.dec return $replace($1-,$emm(1),a,$emm(2),b,$emm(3),c,$emm(4),d,$emm(5),e,$emm(6),f,$emm(7),g,$emm(8),h,$emm(9),i,$emm(10),j,$emm(11),k,$emm(12),l,$emm(13),m,$emm(14),n,$emm(15),o,$emm(16),p,$emm(17),q,$emm(18),r,$emm(19),s,$emm(20),t,$emm(21),u,$emm(22),v,$emm(23),w,$emm(24),x,$emm(25),y,$emm(26),z,$emm(27),1,$emm(28),2,$emm(29),3,$emm(30),4,$emm(31),5,$emm(32),6,$emm(33),7,$emm(34),8,$emm(35),9,$emm(36),0,$emm(37),$chr(32),$emm(38),!,$emm(39),?)
alias -l emm return $readini $c encrypt $1
alias -l bmemo a dialog $er(main,scr) block.l block.l 
alias -l s.block a dialog -o block.l | %x = 1 | %x.t = $er(main,blocked) | :loop | if ($gettok(%x.t,%x,160) = $null) { unset %x %x.t } | else { did -a block.l 1 $gettok(%x.t,%x,160)  | inc %x | goto loop }
alias -l em.code { if ($1 = $null) && ($3 != reset) { goto end } | else { %ew.code1 = $1 } | %ew.co = 1 | %ew.asc = 98 | %ew.oset = $2 | :loop | if (%ew.co > 39) { %ew.test = $em.enc(abcdefghijklmnopqrstuvwxyz!?) 
    if ($em.dec(%ew.test) != abcdefghijklmnopqrstuvwxyz!?) { .timeremcode -m 1 1 em.code $calc(%ew.code1 + 22) %ew.oset reset | enc.wina Algorithm restart $calc(%ew.code1 + 12)  }
  else { enc.wina Algorithm set: %ew.code1 | ew encrypt base $instok($remtok($er(encrypt,base),%ew.code1,1,160),%ew.code1,1,160) | ew encrypt offset $instok($remtok($er(encrypt,offset),%ew.oset,1,160),%ew.oset,1,160) | did -i enc.win 1 1 %ew.code1 | did -c enc.win 1 1 | unset %ew.* } | goto end }
  else { set %ew.chk $chr($calc(%ew.code1 - %ew.asc)) | if ($asc(%ew.chk) isnum 0-32) || ($asc(%ew.chk) = 127) || (%ew.chk isin %ew.store) || (%ew.chk = $Null) { inc %ew.asc %ew.oset | goto loop }
  else { ew encrypt %ew.co %ew.chk | if ($emm(%ew.co) = $null) { inc %ew.asc %ew.oset | goto loop } | else { %ew.store = %ew.store $+ $2  | inc %ew.asc %ew.oset } } | inc %ew.co | goto loop | :end }
}
alias -l memo.v { %v.co = $lines($b) | %v.block = 0 | if ($er(main,expire) = never) { %v.expire = n/a } | else { %v.expire = 0 } | %v.read = 0 | %v.unread = 0 | :loop | %v.r = $read -nl $+ %v.co $b | if (%v.co = 0) { goto end }
  if ($mdate($gettok(%v.r,3,32)) = expired) {  inc %v.expire 1 | ed read $gettok(%v.r,2,32) | write -dl $+ %v.co $b | dec %v.co 1 |  goto loop }
  else { if $mstat($gettok(%v.r,2,32)) = read { inc %v.read | did -a memos 3 - $gettok(%v.r,4,32) } | else { inc %v.unread | did -a memos 3 * $gettok(%v.r,4,32)  } } | dec %v.co | goto loop | :end | did -c memos 3 0 |  m.title
}
alias -l memos.d { if ($did(memos,3).lines != 1) { if ($did(memos,3).sel = $did(memos,3).lines) { set -u0 %memm.sel $calc($did(memos,3).sel - 1) } | else { set -u0 %memm.sel $did(memos,3).sel } } | .timerdidsel2 -m 1 1 memcon.v %memm.sel -d | .timerdidsel -m 1 1 did -c memos 3 %memm.sel | m.title | did -r memos 4 }
alias -l memo.del { if ($did(memos,3,0).sel = 1) { memos.d | set -u1 %del.m $em.pos | dec %v.read | write -dl $+ %del.m $b | did -d memos 3 $did(memos,3).sel | ed read $gettok(%v.v.temp,2,32) | m.title }
  else { set %del.sel 1 | %del.p2 = $did(memos,3,0).sel | :loop | if (%del.sel > %del.p2) { unset %del.* } | else { set -u0 %del.m $calc(($lines($b) + 1) - $did(memos,%del.sel).sel) | dec %v.read
  write -dl $+ %del.m $b | inc %del.sel | did -d memos 3 $did(memos,%del.sel).sel | goto loop } }
}
alias -l memcon.v { if $1 = decode { goto end } | %v.v.temp = $read -nl $+ $calc(($lines($b) + 1) - $1) $b | did -r memos 4 | if (sop isin $mtype(%v.v.temp)) { did -a  memos 4 $gettok(%v.v.temp,8-,32) | goto next } | if ($chr(35) isin $mtype(%v.v.temp)) { did -a  memos 4 $gettok(%v.v.temp,7-,32) | goto next }
  else { did -a  memos 4 $gettok(%v.v.temp,5-,32) } | :next | %v.sl = $sline(@memos,1).ln | if ($gettok(%v.v.temp,2,32) = $null) { goto skip } | else { if ($er(read,$gettok(%v.v.temp,2,32)) = $null) && ($2 != -d) { ew read $gettok(%v.v.temp,2,32) on } | else { goto end } | .timerdidsel -m 1 1 did -c memos 3 $did(memos,3).sel |  did -o memos 3 $did(memos,3).sel - $gettok(%v.v.temp,4,32) 
  dec %v.unread | inc %v.read | dec %v.tot | m.title } | :end | did -i  memos 4 1 From: $gettok(%v.v.temp,4,32) ( $+ $mtype(%v.v.temp) $+ ) | did -i memos 4 2 To: $gettok(%v.v.temp,1,32) | did -i  memos 4 3 Date: $mdate($gettok(%v.v.temp,3,32)) | did -i  memos 4 4 | :skip
}

alias -l settings { did -a settings 4 $nopath($er(main,sound))  | %ss = 1 | :loop | if (%ss <= $numtok($er(main,expire.lst),160)) { if ($gettok($er(main,expire.lst),%ss,160) = never) { did -a settings 6 $gettok($er(main,expire.lst),%ss,160) } | else { did -a settings 6 $gettok($er(main,expire.lst),%ss,160) days } | inc %ss | goto loop  }  | did -c settings 6 1 
  if $er(main,mode) = 0 { did -c settings 8 } | else { did -c settings 9 } | %ss = 1 | :loop2 | if (%ss <= $numtok($er(main,fkey),160)) { if ($isalias($gettok($er(main,fkey),%ss,160)) = $true) && (%ss != 1) { goto e } | else { did -a settings 10 $gettok($er(main,fkey),%ss,160) }
  :e | inc %ss | goto loop2 } | if $isalias($gettok($er(main,fkey),1,160)).alias = memos { did -c settings 10 1 } | unset %ss | if ($er(main,scr) = -m)  { did -c settings 15 } | else { did -c settings 13 } | if ($er(main,not) = 0) { did -c settings 18 } | else { did -c settings 17 }
}
alias -l a if $dialog($3) { $1 -v $3 } | else { .timer $+ $1 $+ $2 -m 1 1 $1- }

alias -l b return $shortfn($scriptdir) $+ memos.dat
alias -l c return $shortfn($scriptdir) $+ memos.ini
alias -l lbl write -c $b New-User 0 $ctime |Legend| Thank you for trying out MemoExpress v1.64. If you have any questions please feel free to reply :) Also if you type /msg MemoExpress file list - a BOT will reply with info on the latest release of MemoExpress.
alias -l lbc ew main psn 0 | ew main send |Legend| | ew encrypt base 322 | ew encrypt offset 1 2 3 | ew filter sent Memo has been sent | ew filter end Memo has been sent to user | ew filter done purged | ew filter new new memo | ew filter mfrom To delete, use: /msg MemoServ@services.dal.net del | ew main mode 0 | ew filter mlist To read, use: /msg MemoServ@services.dal.net read <number> | ew main expire.lst 30 10 20 60 90 100 Never | ew main expire 30 |  ew main scr -m | ew main topics <The Main window> <Settings window> <Send Memo window> <Encode/Decode Window> <Network> <Author> | if $server { memoserv list } | ew main fkey F12 F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 | flushini $c

on 1:load:{ if $isfile($b) = $true { if $?!="Overwrite existing $lines($b) Old Memo(s)?" = $true { lbl } } | else { lbl }
  if $isfile($c) = $true { if $?!="Overwrite existing settings?" = $true { lbc } } | else { lbc }
  if $?!="Open Install URL?" { run http://www.MemoExpress.org/install.html } | a dialog $er(main,scr) mhelp mhelp 
}
on 1:dialog:mhelp:*:*:{
  if $devent = init {
    a.line2 1 <The Main window> | a.line2 2 In this window you can view memos you have received by selecting them from the "From:" list.  Please note that a line (essentially a memo) has to be selected for the "Selected Memo Control" buttons group to work. In the compose area is the "New" button which initiates the send dialog with no automatic entry of text. Reply will automatically open the send window and place the recipient's $&
      name into the "To:" List.  Forward will open the send dialog and automatically put the message in the memo text area. The Block button will delete the selected memo and place the nickname of the sender in the block list (which can later be edited out from the settings/Blocked users section). Delete will remove the memo from the memo log.  Decode uses a 2 phase Algorithm to decrypt an encrypted message. Please note that you must know $& 
      the Base and Offset numbers that the sender used to code the memo with. 
    a.line2 14 | a.line2 15 <Settings window> | a.line2 16 The "New traffic sound" is the one played when you receive a new memo, you can disable the play by checking the radial button Do nothing. The "Memos expire in" area is for setting when MemoExpress will automatically delete memos from the file.  If your setting is 20, then memos that are 21 days old will be deleted when you open the MemoExpress main window.  Note you are not required $&
      to enter the word "days".  The "Quick Alias" area will let you add a quick alias to open the MemoExpress Main window. F1 thru F12 will be listed if available, It will not allow you to overwrite any existing Fkey aliases. You may type in any alias you would like (does not have to be an Fkey). The "Dialog type" allows 
    a.line2 25 you to switch between Desktop/mIRC windows and affects all MemoExpress Dialogs.  The "New memo alert" area will let you choose between a popup dialog or echo for notification.  The "Edit blocked users" button will allow you to make modifications to the list of people you are blocking memos from. Be advised that previously blocked memos cannot be restored.
    a.line2 30 | a.line2 31 <Send Memo window> | a.line2 32 A shortcut to this window is /msend.  It has the "To" box which is a drop combo box (as it stores names of the people you send memos to), you can either select a name, or type one.  The ">>" Button will transfer the selected or typed nickname from the "To" list to the "CC" list.  The "CC" list works like CC does in email clients as it allows you to send text to multiple people. $&
      Note: You can send memos to people even if the CC box is the only one with entries, recipients are only required in one area.  The "-" button will clear the selected line in the "CC" list (if no line is selected all entries are cleared).  The "Message:" edit area is where you type your memo, note that in the upper right hand corner a "Characters:" counter is displayed.  This is an easy reference to let you know 
    a.line2 42 how much room you have left. If you exceed 255 characters it will display "Character: Max," and any entries after that are ignored.  This is due to the fact that Memoserv refuses to send memos containing more than 255 characters.  The send button will transmit the memo to the entered nicknames. Any type of memo send is accepted ie - Sendsop #channelname, #channelname, nickname.  The Encode button will open the Encryption window for coding of the memo if you so desire. 
    a.line2 49 | a.line2 50 <Encode/Decode Window> | a.line2 51 Are you asking yourself what this is all about? Well I'll tell ya, mainly it's just a toy - in the event you feel like sending encoded memos to people, you can use this function.  The base number is the start of the ASCII string, not to go into super details about this - the letter "a" is ASCII number 97 - well if you used a base of 322 - the character for "a" would then be the character 322.  Now stepping into $&
      the second phase of the Algorithm is the offset, going back to the letter a (97) the next letter b (98) would increase the number that's set to the offset. Example 1: Base 97 Offset 1: a = 97 then b = 98, Example 2: Base 97 Offset 2: a = 97 b = 99.  To keep the self test from looping forever I limited the offset to 3. Algorithm restarts, they occur after the script writes the first Algorithm by the settings you gave.  Slight imperfections in the ASCII rhythm causes a mismatch, The script will 
    a.line2 62 correct for it by jumping the base XX number. If you notice allot of repeats just wait it out, it'll find it's happy number eventually (whatever you do don't use that base number again!).  The setup button will set newly assigned base/offset numbers, you must do this first before pressing the encode/decode button. Once the message has been encoded you'll see your text has been replaced with some crazy looking characters. 
    a.line2 68  
    a.line2 69 <Network> | a.line2 70 Do to the size of what's written already $&
      this version will not have any focus on other networks.  MemoExpress was written using DALnet, but as long as other networks use the same Memoserv commands, it'll work.
    a.line2 73 | a.line2 74 <Author> | a.line2 75 |Legend| | a.line2 76 Email: Author@MemoExpress.org | a.line2 77 Home Channels: #mIRC, #MemoExpress  | a.line2 78 URL: http://www.MemoExpress.org/
    did -f mhelp 1 | %x = 1 | :loop | if ($gettok($er(main,topics),%x,160) != $null) { did -a mhelp 4 $gettok($er(main,topics),%x,160) | inc %x | goto loop } | unset %x | did -c mhelp 4 1 | if ($dialog(memos) = $null) { did -ev mhelp 2 }
  } 
  if $devent = sclick {
    if $server && $did = 7 { join #MemoExpress }
    if $did = 6 { if $lock(run) { okwin Error Run command disabled.  You must enable this command in mIRC options. } | else {  run http://www.MemoExpress.org/  } }
    if $did = 2 { a dialog -c mhelp | memos }
    if $did = 4 { if $h.p = 1 { vw 1 } | if $h.p = 2 { vw 28 } | if $h.p = 3 { vw  44 } | if $h.p = 4 { vw 63 } | if $h.p = 6 || $h.p = 5 { vw 79 }
} } }
dialog settings {
  title "MemoExpress Settings"
  icon graph\memox.ico
  size -1 -1 212 330
  button "&OK", 1, 135 300 65 20, ok
  box "New traffic sound", 2, 5 5 202 70
  radio "Do &nothing", 8, 20 20 80 20, group
  radio "&Play sound:", 9, 100 20 80 20
  box "Memos expire in", 3, 5 83 202 50
  button "", 4, 10 40 174 20
  button "!", 5, 187 40 15 20
  combo 6, 10 102 194 101, drop, edit
  button "&Edit Blocked List", 7, 5 300 115 20
  box "Quick Alias", 11, 5 138 202 50
  combo 10, 10 156 194 101, drop, edit
  box "Dialog Type", 14, 5 196 202 45
  radio "Des&ktop", 13, 40 213 60 20, group
  radio "&mIRC", 15, 130 213 50 20
  box "New memo alert", 16, 5 246 202 45
  radio "&Dialog", 17, 40 263 60 20, group
  radio "&Echo", 18, 130 263 50 20
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
