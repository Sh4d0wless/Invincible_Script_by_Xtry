;___________________________________________
; Invincible by Xtry
; Personal Status Info
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

dialog status {
  title "Personal Info"
  size -1 -1 167 123
  icon graph/macan.ico
  option dbu
  button "&OK", 1, 126 106 35 12, ok
  box "", 2, 5 5 156 96
  text "Nickname:", 3, 10 15 60 14
  edit "", 4, 40 13 60 10, read
  text "Idle:", 5, 102 15 60 14
  edit "", 6, 115 13 40 10, read
  text "Server:", 7, 10 25 60 14
  edit "", 8, 40 23 115 10, read, autohs
  text "Port:", 9, 115 35 60 14
  edit "", 10, 129 33 26 10, read
  text "Network:", 11, 10 35 60 14
  edit "", 12, 40 33 73 10, read
  text "Local Host:", 13, 10 45 60 14
  edit "", 14, 40 43 115 10, read
  text "IP Address:", 15, 10 55 60 14
  edit "", 16, 40 53 115 10, read
  check "Invisible", 18, 35 75 60 14
  check "Receive Server Notices", 19, 90 75 135 14
  check "Receive Wallops", 20, 35 85 100 14
  check "Receive Global Notices", 21, 90 85 135 14
  text "User Mode:", 22, 10 65 60 14
  edit "", 23, 40 63 26 10, read
}
on *:dialog:status:*:*:{
  if ($devent == init) {
    if ($me) did -ra $dname 4 $me
    did -ra $dname 6 $duration($idle)
    if ($server) did -ra $dname 8 $server | else did -ra $dname 8 Not Connected
    if ($port) did -ra $dname 10 $port | else did -ra $dname 10 n/a
    if ($network) did -ra $dname 12 $network | else did -ra $dname 12 n/a
    if ($host) did -ra $dname 14 $host | else did -ra $dname 14 n/a
    if ($ip) did -ra $dname 16 $ip | else did -ra $dname 16 n/a
    if ($usermode) did -ra $dname 23 $usermode | else did -ra $dname 23 n/a
    if ($server == $null) did -b status 18,19,20,21
    if (i isin $usermode) did -c status 18 | if (s isin $usermode) did -c status 19
    if (w isin $usermode) did -c status 20 | if (g isincs $usermode) did -c status 21
    .timerIDLE 0 1 status-idle
  }
  if ($did == 18) { if ($did(18).state) mode $me +i | else mode $me -i }
  if ($did == 19) { if ($did(19).state) mode $me +s | else mode $me -s }
  if ($did == 20) { if ($did(20).state) mode $me +w | else mode $me -w }
  if ($did == 21) { if ($did(21).state) mode $me +g | else mode $me -g }
}
alias status-idle {
  if ($dialog(status)) { did -ra status 6 $duration($idle) }
  else .timerIDLE off
}
alias status {
  if ($dialog(status)) return
  dialog -mv status status
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
