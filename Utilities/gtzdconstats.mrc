;___________________________________________
; Invincible by Xtry
; Server Info
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias dconstats {
  if ($server = $null) { beep }
  else { if ($dialog(dconstats)) dialog -v dconstats | else dialog -m dconstats dconstats }
}
dialog dconstats {
  title "Server Info"
  icon graph/multi.ico
  size -1 -1 96 53
  option dbu
  button "Close",1,63 40 30 10, ok
  box "",6,61 35 34 17
  box "",3, 1 0 94 37
  button "Lusers",2,3 5 30 10
  button "Motd",4,33 5 30 10
  button "Time",5,63 5 30 10
  button "Version",7,3 15 30 10
  button "Admin",8,33 15 30 10
  button "Up Time",9,63 15 30 10
  button "Motd Serv",10,3 25 30 10
  button "Ports",11,33 25 30 10
  button "Info",12,63 25 30 10
}
on *:dialog:dconstats:sclick:*:{
  if ($did == 2) { lusers }
  if ($did == 4) { motd }
  if ($did == 5) { time }
  if ($did == 7) { version }
  if ($did == 8) { admin }
  if ($did == 9) { stats u }
  if ($did == 10) { motd services.* }
  if ($did == 11) { stats l }
  if ($did == 12) { info }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
