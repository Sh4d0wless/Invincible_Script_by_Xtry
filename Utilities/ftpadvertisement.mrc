;___________________________________________
; Invincible by Xtry
; FTP Advertisements
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias ftpad { if ($dialog(ftpad)) dialog -v ftpad | else dialog -m ftpad ftpad }
dialog ftpad {
  size -1 -1 325 220
  title "FTP Advertisement"
  icon graph/explorex.ico
  button "Ok",1, 250 195 65 20, OK
  tab "General",2, 5 5 315 185
  tab "Channels",3,
  box "FTP General Setup",4, 15 35 296 140, tab2
  text "Address:",5, 25 55 50 20, tab2
  edit "",6, 75 53 120 20, tab2 autohs
  check "Auto-Resolve IP",7, 200 53 99 20, tab2
  text "Login:",8, 25 80 50 20, tab2
  edit "",9, 75 78 80 20, tab2 autohs
  text "Pass:",10, 25 100 50 20, tab2
  edit "",11, 75 98 80 20, tab2 autohs
  text "Port:",12, 187 80 50 20, tab2
  edit "",13, 220 78 45 20, tab2 autohs
  text "Max:",14, 187 100 50 20, tab2
  edit "",15, 220 98 45 20, tab2 autohs
  text "users",16, 269 100 35 20, tab2
  check "Ratio:",17, 25 123 50 20, tab2
  edit "",18, 75 123 80 20, tab2 autohs
  text "Delay:",19, 187 125 50 20, tab2
  edit "",20, 220 123 45 20, tab2 autohs
  text "secs",21, 269 125 35 20, tab2
  text "Note:",22, 25 150 45 20, tab2
  edit "",23, 75 148 225 20, tab2 autohs
  box "FTP Channels Setup",24, 15 35 296 140, tab3
  text "Channel 1:",25, 25 55 53 20, tab3 autohs
  edit "",26, 85 53 80 20, tab3 autohs
  text "Channel 2:",27, 25 75 53 20, tab3
  edit "",28, 85 73 80 20, tab3 autohs
  text "Channel 3:",29, 25 95 53 20, tab3
  edit "",30, 85 93 80 20, tab3 autohs
  text "Channel 4:",31, 25 115 53 20, tab3
  edit "",32, 85 113 80 20, tab3 autohs
  text "Channel 5:",33, 25 135 53 20, tab3
  edit "",34, 85 133 80 20, tab3 autohs
  text "Channel 6:",35, 169 55 53 20, tab3
  edit "",36, 225 53 80 20, tab3 autohs
  text "Channel 7:",37, 169 75 53 20, tab3
  edit "",38, 225 73 80 20, tab3 autohs
  text "Channel 8:",39, 169 95 53 20, tab3
  edit "",40, 225 93 80 20, tab3 autohs
  text "Channel 9:",41, 169 115 53 20, tab3
  edit "",42, 225 113 80 20, tab3 autohs
  text "Channel 10:",43, 167 135 58 20, tab3
  edit "",44, 225 133 80 20, tab3 autohs
  button "Start Ad",45, 15 195 65 20
  button "Stop Ad",46, 85 195 65 20
  check "All Channels",47, 25 152 80 20, tab3
  button "Clear All Channels",48, 197 155 110 17, tab3
}
on *:dialog:ftpad:sclick:*: {
  if ($did == 7) { if ($did($dname,$did).state == 1) { set %ftp.resolve on | did -ra $dname 6 $ip | set %ftp.ip $ip } | else { set %ftp.resolve off } }
  if ($did == 17) { if ($did($dname,$did).state == 1) { set %ftp.ratio2 on | did -e $dname 18 } | else { set %ftp.ratio2 off | did -b $dname 18 } }
  if ($did == 48) { unset %ftp.chan* | did -r $dname 26,28,30,32,34,36,38,40,42,44 }
  if ($did == 47) { if ($did($dname,$did).state == 1) { set %ftpad.all on | did -b $dname 26,28,30,32,34,36,38,40,42,44 } | else { set %ftpad.all off | did -e $dname 26,28,30,32,34,36,38,40,42,44 } }
  if ($did == 45) { ftpadOn }
  if ($did == 46) { ftpadOff }
}
on *:dialog:ftpad:edit:*: {
  if ($did == 6) { set %ftp.ip $did(6) }
  if ($did == 9) { set %ftp.login $did(9) }
  if ($did == 11) { set %ftp.pw $did(11) } 
  if ($did == 13) { set %ftp.port $did(13) }
  if ($did == 15) { set %ftp.maxu $did(15) }
  if ($did == 18) { set %ftp.ratio $did(18) }
  if ($did == 20) { set %ftp.delay $did(20) }
  if ($did == 23) { set %ftp.note $did(23) }
  if ($did == 26) { set %ftp.chan1 $did(26) }
  if ($did == 28) { set %ftp.chan2 $did(28) }
  if ($did == 30) { set %ftp.chan3 $did(30) }
  if ($did == 32) { set %ftp.chan4 $did(32) }
  if ($did == 34) { set %ftp.chan5 $did(34) }
  if ($did == 36) { set %ftp.chan6 $did(36) }
  if ($did == 38) { set %ftp.chan7 $did(38) }
  if ($did == 40) { set %ftp.chan8 $did(40) }
  if ($did == 42) { set %ftp.chan9 $did(42) }
  if ($did == 44) { set %ftp.chan10 $did(44) }
}
on *:dialog:ftpad:init:0: {
  if (%ftpad.all == on) { did -b $dname 26,28,30,32,34,36,38,40,42,44 | did -c $dname 47 } 
  if (%ftp.ratio2 == on) { did -c $dname 17 | did -e $dname 18 } 
  if (%ftp.ratio2 != on) { did -b $dname 18 }
  if (%ftp.resolve == on) { did -ra $dname 6 $ip | set %ftp.ip $ip | did -c $dname 7 | goto 2 }
  did -a $dname 6 %ftp.ip
  :2
  did -a $dname 9 %ftp.login
  did -a $dname 11 %ftp.pw
  did -a $dname 13 %ftp.port
  did -a $dname 15 %ftp.maxu
  did -a $dname 18 %ftp.ratio
  did -a $dname 20 %ftp.delay
  did -a $dname 23 %ftp.note
  did -a $dname 26 %ftp.chan1
  did -a $dname 28 %ftp.chan2
  did -a $dname 30 %ftp.chan3
  did -a $dname 32 %ftp.chan4
  did -a $dname 34 %ftp.chan5
  did -a $dname 36 %ftp.chan6
  did -a $dname 38 %ftp.chan7
  did -a $dname 40 %ftp.chan8
  did -a $dname 42 %ftp.chan9
  did -a $dname 44 %ftp.chan10
}
Alias ftpadOn { .timerfAd 0 %ftp.delay /ftpad3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) FTP Advertisement has been started | set %ftpad on | /ftpad3 }
Alias ftpadOff { .timerfAd off | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) FTP Advertisement has been halted. | set %ftpad off | halt }
Alias ftpAd2 { 
  if (%ftp.ratio2 == on) { return (FTP Online) Host: %ftp.ip - Port: %ftp.port - Login/Password: %ftp.login $+ / $+ %ftp.pw - Ratio: %ftp.ratio - Max Users: %ftp.maxu - Note: %ftp.note - %name }
  else { return (FTP Online) Host: %ftp.ip - Port: %ftp.port - Login/Password: %ftp.login $+ / $+ %ftp.pw - Max Users: %ftp.maxu - Note: %ftp.note - %name }
}
alias sayftp { 
  if (%ftp.ratio2 == on) { return (FTP Online) Host: %ftp.ip - Port: %ftp.port - Login/Password: %ftp.login $+ / $+ %ftp.pw - Ratio: %ftp.ratio - Max Users: %ftp.maxu - Note: %ftp.note - %name }
  else { return (FTP Online) Host: %ftp.ip - Port: %ftp.port - Login/Password: %ftp.login $+ / $+ %ftp.pw - Max Users: %ftp.maxu - Note: %ftp.note - %name }
}
alias ftpad3 {
  if (%ftpad.all == on) { amsg $ftpAd2 | goto end }
  if (%ftp.chan1 != $null) && ($chan(%ftp.chan1) != $null) { msg %ftp.chan1 $ftpAd2 }
  if (%ftp.chan2 != $null) && ($chan(%ftp.chan2) != $null) { msg %ftp.chan2 $ftpAd2 }
  if (%ftp.chan3 != $null) && ($chan(%ftp.chan3) != $null) { msg %ftp.chan3 $ftpAd2 }
  if (%ftp.chan4 != $null) && ($chan(%ftp.chan4) != $null) { msg %ftp.chan4 $ftpAd2 }
  if (%ftp.chan5 != $null) && ($chan(%ftp.chan5) != $null) { msg %ftp.chan5 $ftpAd2 }
  if (%ftp.chan6 != $null) && ($chan(%ftp.chan6) != $null) { msg %ftp.chan6 $ftpAd2 }
  if (%ftp.chan7 != $null) && ($chan(%ftp.chan7) != $null) { msg %ftp.chan7 $ftpAd2 }
  if (%ftp.chan8 != $null) && ($chan(%ftp.chan8) != $null) { msg %ftp.chan8 $ftpAd2 }
  if (%ftp.chan9 != $null) && ($chan(%ftp.chan9) != $null) { msg %ftp.chan9 $ftpAd2 }
  if (%ftp.chan10 != $null) && ($chan(%ftp.chan10) != $null) { msg %ftp.chan10 $ftpAd2 }
  :end
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
