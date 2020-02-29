;___________________________________________
; Invincible by Xtry
; IP Scanner
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:load:{
  if ($version < 5.91) {
    erroripgtz | .did -i Erroripgtz 1 1 You need mirc 5.91 | http://www.mirc.co.uk
    unload -rs $script | halt
  }
  dialog -m Ipscanner IpScanner
}

dialog IpScanner {
  title "Ip & Nick Finder "
  icon graph/ipscan.ico
  size -1 -1 300 212
  box "Ip Scan (Find Ip)",2,5 5 290 60
  edit "Nickname",3,10 20 280 20,autohs
  button "Find",4,228 42 60 18
  box "Nick Scan (Find Nick)",5,5 75 290 100
  edit "Hostname",6,10 90 280 20,autohs
  edit "Ip Address ",7,10 110 280 20,autohs
  list 8,10 130 280 30,autovs
  button "Find",9,228 152 60 18
  button "Close",10,9 185 60 18,ok
  box "",11,5 175 68 32
  button "Cancel",12,10 500 10 10,cancel
}
alias erroripgtz { dialog -m erroripgtz erroripgtz }
dialog Erroripgtz {
  title "Error"
  icon graph/ipscan.ico
  size -1 -1 170 50
  edit ,1,10 10 150 20,read,autohs
  button "Close",2,10 30 150 18,ok
}
on *:dialog:Ipscanner:sclick:4:{
  if ($did(IpScanner,3) == $null) { erroripgtz | .did -i Erroripgtz 1 1 No nickname placed | halt }
  if ($server == $null) { erroripgtz | .did -i Erroripgtz 1 1 Not connected | halt }
  if (#whois == enable) { .dns $did(Ipscanner,3) }  
  else { .enable #Whois | .dns $did(Ipscanner,3) }
}
on *:dialog:IpScanner:sclick:9:{
  if ($server == $null) { erroripgtz | .did -i Erroripgtz 1 1 Not connected | halt }
  .did -r Ipscanner 8 | .who $did(IpScanner,6) $did(IpScanner,7)
}
on *:dialog:IpScanner:sclick:10:{
  .disable #Whois
}
on *:dialog:IpScanner:sclick:11:{
  .disable #Whois
}
on *:dialog:IpScanner:sclick:12:{
  .disable #Whois
}
on *:dialog:IpScanner:init:*:{
  .enable #Whois
}

#whois off
raw 352:*:{ did -a IpScanner 8 $6 Channel: $2 }
raw 311:*:{ did -i Iplook 2 2 Name: $6- | did -i Iplook 3 3 User: $3 $+ @ $+ $4 }
raw 312:*:{ did -i Iplook 8 8 Server: $+ $3- }
raw 319:*:{ did -i Iplook 7 7 $3- }
raw 311:*:{ did -a Iplook 3 Name: $6- }
raw 401:*:{ did -i Iplook 1 1 Nick:No Such Nick! | did -i Iplook 2 2 Name:No Such Nick! | did -i Iplook 3 3 Ip:No Such Nick! | did -i Iplook 4 4 Add:No Such Nick! | did -i Iplook 5 5 Resolv:No Such Nick! | did -i Iplook 6 6 No Such Nick! | did -i Iplook 7 7 No Such Nick! | dialog -t Iplook No Such Nick! }
#whois end

alias Ip.scan { if ($dialog(Ipscanner)) dialog -v Ipscanner | else dialog -m Ipscanner Ipscanner }

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
