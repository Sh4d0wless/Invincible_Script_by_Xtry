;___________________________________________
; Invincible by Xtry
; Connections History
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

; Syntax : /connexhis
alias connexhis { if ($dialog(ch)) dialog -v ch | else dialog -m ch ch }

; Aliases
; Version
alias -l _ch.v { return Connections History 1.0 }
alias -l _ch.dir { return $shortfn($scriptdir) }
alias -l _ch.ini { return $shortfn($scriptdirch.ini) }
alias _ch.wini { writeini -n $_ch.ini $1 $2 $3- }
alias -l _ch.cini { writeini -c $_ch.ini $1 $2 $3- }
alias -l _ch.mini { remini $_ch.ini $1 $2- }
alias _ch.rini { return $readini($_ch.ini,$1,$2-) }
alias -l _ch.txt { return $shortfn($scriptdirch.txt) }
alias -l _ch.wtxt { write $_ch.txt $1- }
alias -l _ch.rtxt { return $read($_ch.txt,$1) }
alias -l _ch.tok { return $gettok($1,$2,$3-) }
alias -l _ch.wtxt_ { write $1 $_ch.txt }
alias -l _ch.clines { return $lines($_ch.txt) }
alias -l _ch.mdx { return dll/mdx.dll }
alias -l _ch.vmdx { return dll/views.mdx }
alias _ch.write { _ch.wtxt $_ch.rini(ch,m) $+ * $+ $_ch.rini(ch,c) $+ * $+ $_ch.rini(ch,n) $+ * $+ $_ch.rini(ch,s:p) $+ * $+ $_ch.rini(ch,d) $+ * $+ $_ch.rini(ch,o) }
; DLL
alias -l _ch.dinit {
  dll $_ch.mdx SetMircVersion $version
  dll $_ch.mdx MarkDialog $dname
  dll $_ch.mdx SetControlMDX $dname 1 listview nosortheader flatsb rowselect report single grid > $_ch.vmdx
  did -i $dname 1 1 headerdims 100 145 80 170 145 140
  did -i $dname 1 1 headertext Nickname $tab Connect Time $tab Network $tab Server:Port $tab Disconnect Time $tab Online Time
}
; Clear
alias -l _ch.clear {
  _ch.wtxt_ -c
  did -r $dname 1
  _ch.dlist
}
; Listing
alias -l _ch.dlist {
  var %_ch = 0
  while %_ch <= $_ch.clines {
    did -a ch 1 $_ch.tok($_ch.rtxt(%_ch),1,42) $tab $_ch.tok($_ch.rtxt(%_ch),2,42) $tab $_ch.tok($_ch.rtxt(%_ch),3,42) $tab $_ch.tok($_ch.rtxt(%_ch),4,42) $tab $_ch.tok($_ch.rtxt(%_ch),5,42) $tab $_ch.tok($_ch.rtxt(%_ch),6,42)
    inc %_ch
  }
  did -d ch 1 2
  halt
}

; Dialog
dialog ch {
  ; Title & Size
  title Connections History
  size -1 -1 795 270
  icon graph/conh.ico
  ; Connections History list
  list 1,5 5 785 250
  ; Enable & Disable
  check "Enable",2,5 245 60 20,push
  check "Disable",3,65 245 60 20,push
  ; Buttons
  button "Close",4,730 245 60 20,ok
  button "Clear",5,670 245 60 20
}
; Init event for ch dialog
on *:dialog:ch:init:*:{
  ; Checking if the Connections History is enabled or disabled
  if ($_ch.rini(ch,ch) = on) { did -c $dname 2 | did -u $dname 3 } | else { did -u $dname 2 | did -c $dname 3 }
  ; DLL
  _ch.dinit
  ; Listing
  _ch.dlist
}
; Sclick event for ch dialog
on *:dialog:ch:sclick:*:{
  ; Enable
  if ($did = 2) {
    if ($did($dname,$did).state = 1) { _ch.wini ch ch on | did -u $dname 3 }
    else { _ch.wini ch ch off | did -c $dname 3 }
  }
  ; Disable
  if ($did = 3) {
    if ($did($dname,$did).state = 1) { _ch.wini ch ch off | did -u $dname 2 }
    else { _ch.wini ch ch on | did -c $dname 2 }
  }
  ; Clear
  if ($did = 5) {
  if ($?!="Are you sure you want to clear Connections History ?" = $true) { _ch.clear } | else { halt } }
}


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
