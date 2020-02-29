;___________________________________________
; Invincible by Xtry
; DALnet Services Options
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;DALnet Chanserv Options
alias gtzdalc { dialog -m gtzdalc gtzdalc }
dialog gtzdalc {
  title Chanserv Options
  icon graph/chanserv.ico
  icon 44,135 110 130 130,graph/dalnet.bmp
  size -1 -1 202 100
  option dbu
  box "",48,65 76 70 20
  button "Close",1,165 80 30 10,ok
  check "Help",50,7 80 30 10,push
  box "",52,5 75 34 17
  box "",43,163 75 34 17
  button "Sop",2,37 14 30 10
  button "Aop",3,67 14 30 10
  button "Founder",6,7 14 30 10
  button "Access",8,7 24 30 10
  button "Why",9,37 24 30 10
  text "Channel Control :",4,5 5 45 7
  box "",5,5 9 94 67
  text "Channel Settings :",7,103 5 60 7
  button "Register",10,67 24 30 10
  button "Drop",11,7 34 30 10
  button "Identify",12,37 34 30 10
  button "Info",13,67 34 30 10
  box "",14,103 9 94 67
  button "MDeop",17,7 44 30 10
  button "MKick",18,37 44 30 10
  button "Sendpass",19,67 44 30 10
  button "Invite",20,7 54 30 10
  button "Unban",21,37 54 30 10
  button "AKick",22,67 54 30 10
  button "Count",23,7 64 30 10
  button "Op",24,37 64 30 10
  button "Deop",25,67 64 30 10
  button "Description",28,105 14 30 10
  button "Ident",29,135 14 30 10
  button "Keeptopic",30,165 14 30 10
  button "Mailblock",31,105 24 30 10
  button "Memo",32,135 24 30 10
  button "Mlock",33,165 24 30 10
  button "Opguard",34,105 34 30 10
  button "Password",35,135 34 30 10
  button "Private",36,165 34 30 10
  button "Restrict",37,105 44 30 10
  button "Topiclock",38,135 44 30 10
  button "Unsecure",39,165 44 30 10
  button "URL",40,105 54 30 10
  button "Verbose",41,135 54 30 10
  button "Web Pass",42,165 54 30 10
  button "Leave Ops",49,105 64 30 10
  edit "",45,7 105 188 60,multi vsbar read
  box "",47,5 100 192 67
}

on *:dialog:gtzdalc:init:*:{
  .loadbuf -o $dname 45 utilities/cshelp.txt
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,50,2,3,6,8,9,4,7,10,11,12,13,17,18,19,20,21,22,23,24,25,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,49,45 12 400 Tahoma
  dll dll/mdx.dll SetBorderStyle $dname 1,2,3,6,8,9,10,11,12,13,17,18,19,20,21,22,23,24,25,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,49,50 clientedge
}

alias gtzdalc.help {
  if ( $did(gtzdalc,50).state == 0 ) {
    dialog -s gtzdalc $dialog(gtzdalc).x $dialog(gtzdalc).y 404 200
    did -h gtzdalc 45,47
  }
  else {
    dialog -s gtzdalc $dialog(gtzdalc).x $dialog(gtzdalc).y 404 343
    did -v gtzdalc 45,47
  }
}

on *:dialog:gtzdalc:sclick:*:{
  if ($did == 2) { dalsopx }
  if ($did == 3) { dalaopx }
  if ($did == 6) { dalfox }
  if ($did == 8) { chanserv acc $$?="Channel :" $$?="Nickname :" }
  if ($did == 9) { chanserv why $$?="Channel :" $$?="Nickname :" }
  if ($did == 10) { chanserv register $$?="Channel to Register :" $$?="Password :" $$?="Description :" }
  if ($did == 11) { daldropx }
  if ($did == 12) { chanserv identify $$?="Channel to Identify :" $$?*="Password :" }
  if ($did == 13) { chanserv info $$?="Channel :" }
  if ($did == 17) { chanserv mdeop $$?="Channel to Mass Deop :" }
  if ($did == 18) { chanserv mkick $$?="Channel to Mass Kick :" }
  if ($did == 19) { chanserv sendpass $$?="Channel to Sendpass :" $$?="Email to sendpass :" }
  if ($did == 20) { chanserv invite $$?="Channel to Invite :" $$?="Nickname to Invite :" }
  if ($did == 21) { dalunbx }
  if ($did == 22) { dalakx }
  if ($did == 23) { chanserv count $$?="Channel to Count :" }
  if ($did == 24) { chanserv op $$?="Channel to Op :" $$?="Nickname :" }
  if ($did == 25) { chanserv deop $$?="Channel to Deop :" $$?="Nickname :" }
  if ($did == 28) { chanserv set $$?="Channel to set Description :" desc $$?="New Description :" }
  if ($did == 29) { chanserv set $$?="Channel to set Ident :" ident $$?="On or Off ?" }
  if ($did == 30) { chanserv set $$?="Channel to set Keeptopic :" keeptopic $$?="On or Off ?" }
  if ($did == 31) { chanserv set $$?="Channel to set Mailblock :" mailblock $$?="On or Off ?" }
  if ($did == 32) { dalmelx }
  if ($did == 33) { chanserv set $$?="Channel to set Mlock :" mlock $$?="Mode(s) :" }
  if ($did == 34) { chanserv set $$?="Channel to set Opguard :" opguard $$?="On or Off ?" }
  if ($did == 35) { chanserv set $$?="Channel to set Password :" passwd $$?="Old/Current Password :" $$?="New Password :" }
  if ($did == 36) { chanserv set $$?="Channel to set Private :" private $$?="On or Off ?" }
  if ($did == 37) { chanserv set $$?="Channel to set Restrict :" restrict $$?="On or Off ?" }
  if ($did == 38) { daltlx }
  if ($did == 39) { chanserv set $$?="Channel to set Unsecure :" unsecure $$?="On or Off ?" }
  if ($did == 40) { chanserv set $$?="Channel to set URL :" url $$?="URL/Website :" }
  if ($did == 41) { chanserv set $$?="Channel to set Verbose :" verbose $$?="On or Off ?" }
  if ($did == 42) { chanserv set $$?="Channel to set Web Password :" webpasswd $$?*="Web Password :" }
  if ($did == 49) { chanserv set $$?="Channel to set Leaveops :" leaveops $$?="On or Off ?" }
  if ($did == 50) { gtzdalc.help }
}

alias dalsopx { if ($dialog(dalsopx)) dialog -v dalsopx | else dialog -m dalsopx dalsopx }
dialog dalsopx {
  title "Sop Options"
  icon graph/chanserv.ico
  size -1 -1 90 37
  option dbu
  button "Close",1,5 22 20 10,ok
  button "Add",2,5 6 20 10
  button "Del",3,25 6 20 10
  button "List",4,45 6 20 10
  button "Wipe",5,65 6 20 10
  box "",6,3 1 84 17
  box "",7,3 17 24 17
}
on *:dialog:dalsopx:sclick:*:{
  if ($did == 2) { chanserv sop $$?="Channel to add Sop :" add $$?="Sop Nickname :" }
  if ($did == 3) { chanserv sop $$?="Channel to del Sop :" del $$?="Sop Nickname :" }
  if ($did == 4) { chanserv sop $$?="Channel to list Sop :" list }
  if ($did == 5) { chanserv sop $$?="Channel to Wipe Sop :" wipe }
}

alias dalaopx { if ($dialog(dalaopx)) dialog -v dalaopx | else dialog -m dalaopx dalaopx }
dialog dalaopx {
  title "Aop Options"
  icon graph/chanserv.ico
  size -1 -1 90 37
  option dbu
  button "Close",1,5 22 20 10,ok
  button "Add",2,5 6 20 10
  button "Del",3,25 6 20 10
  button "List",4,45 6 20 10
  button "Wipe",5,65 6 20 10
  box "",6,3 1 84 17
  box "",7,3 17 24 17
}
on *:dialog:dalaopx:sclick:*:{
  if ($did == 2) { chanserv aop $$?="Channel to add Aop :" add $$?="Aop Nickname :" }
  if ($did == 3) { chanserv aop $$?="Channel to del Aop :" del $$?="Aop Nickname :" }
  if ($did == 4) { chanserv aop $$?="Channel to list Aop :" list }
  if ($did == 5) { chanserv aop $$?="Channel to Wipe Aop :" wipe }
}

alias dalfox { if ($dialog(dalfox)) dialog -v dalfox | else dialog -m dalfox dalfox }
dialog dalfox {
  title "Founder Options"
  icon graph/chanserv.ico
  size -1 -1 110 37
  option dbu
  button "Close",1,5 22 20 10,ok
  button "Change Founder",2,5 6 50 10
  button "Identify as Founder",3,55 6 50 10
  box "",4,3 1 104 17
  box "",5,3 17 24 17
}
on *:dialog:dalfox:sclick:*:{
  if ($did == 2) {
    chanserv identify $$?="Channel :" $$?*="Channel Password :"
    chanserv set $$?="Channel :" founder $$?="New Founder Nickname :"
  }
  if ($did == 3) { chanserv identify $$?="Channel :" $$?*="Channel Password :" }
}

alias dalunbx { if ($dialog(dalunbx)) dialog -v dalunbx | else dialog -m dalunbx dalunbx }
dialog dalunbx {
  title "Unban Options"
  icon graph/chanserv.ico
  size -1 -1 115 37
  option dbu
  button "Close",1,5 22 20 10,ok
  button "Unban Me",2,5 6 35 10
  button "Unban User",3,40 6 35 10
  button "Unban All",4,75 6 35 10
  box "",5,3 1 109 17
  box "",6,3 17 24 17
}
on *:dialog:dalunbx:sclick:*:{
  if ($did == 2) { chanserv unban $$?="Channel to unban :" $me }
  if ($did == 3) { chanserv unban $$?="Channel to unban :" $$?="Nickname to unban :" }
  if ($did == 4) { chanserv unban $$?="Channel to unban :" * }
}

alias dalakx { if ($dialog(dalakx)) dialog -v dalakx | else dialog -m dalakx dalakx }
dialog dalakx {
  title "Akick Options"
  icon graph/chanserv.ico
  size -1 -1 90 37
  option dbu
  button "Close",1,5 22 20 10,ok
  button "Add",2,5 6 20 10
  button "Del",3,25 6 20 10
  button "List",4,45 6 20 10
  button "Wipe",5,65 6 20 10
  box "",6,3 1 84 17
  box "",7,3 17 24 17
}
on *:dialog:dalakx:sclick:*:{
  if ($did == 2) { chanserv akick $$?="Channel to add Akick :" add $$?="Nickname or address :" }
  if ($did == 3) { chanserv akick $$?="Channel to del Akick :" del $$?="Nickname or adddress :" }
  if ($did == 4) { chanserv akick $$?="Channel to list Akick :" list }
  if ($did == 5) { chanserv akick $$?="Channel to Wipe Akick :" wipe }
}

alias dalmelx { if ($dialog(dalmelx)) dialog -v dalmelx | else dialog -m dalmelx dalmelx }
dialog dalmelx {
  title "Memo Level"
  icon graph/chanserv.ico
  size -1 -1 85 43
  option dbu
  text "Set Memo Level To :",7,5 3 60 7
  button "Close",1,5 28 20 10,ok
  button "Founder",2,5 12 25 10
  button "Sop",3,30 12 25 10
  button "None",4,55 12 25 10
  box "",5,3 7 79 17
  box "",6,3 23 24 17
}
on *:dialog:dalmelx:sclick:*:{
  if ($did == 2) { chanserv set $$?="Channel to set Memo Level :" memo founder }
  if ($did == 3) { chanserv set $$?="Channel to set Memo Level :" memo sop }
  if ($did == 4) { chanserv set $$?="Channel to set Memo Level :" memo none }
}

alias daltlx { if ($dialog(daltlx)) dialog -v daltlx | else dialog -m daltlx daltlx }
dialog daltlx {
  title "Topiclock"
  icon graph/chanserv.ico
  size -1 -1 85 43
  option dbu
  text "Set Topiclock To :",7,5 3 60 7
  button "Close",1,5 28 20 10,ok
  button "Founder",2,5 12 25 10
  button "Sop",3,30 12 25 10
  button "None",4,55 12 25 10
  box "",5,3 7 79 17
  box "",6,3 23 24 17
}
on *:dialog:daltlx:sclick:*:{
  if ($did == 2) { chanserv set $$?="Channel to set Topiclock :" topiclock founder }
  if ($did == 3) { chanserv set $$?="Channel to set Topiclock :" topiclock sop }
  if ($did == 4) { chanserv set $$?="Channel to set Topiclock :" topiclock off }
}

alias daldropx { if ($dialog(daldropx)) dialog -v daldropx | else dialog -m daldropx daldropx }
dialog daldropx {
  title "Drop Options"
  icon graph/chanserv.ico
  size -1 -1 110 37
  option dbu
  button "Close",1,5 22 20 10,ok
  button "1st Step",2,5 6 50 10
  button "2nd Step",3,55 6 50 10
  box "",4,3 1 104 17
  box "",5,3 17 24 17
}
on *:dialog:daldropx:sclick:*:{
  if ($did == 2) { chanserv drop $$?="Channel to Drop :" }
  if ($did == 3) { chanserv drop $$?="Channel to Drop :" $$?="Drop Code :" }
}

;DALnet Nickserv Options
alias gtzdaln { dialog -m gtzdaln gtzdaln }
dialog gtzdaln {
  title Nickserv Options
  icon graph/nickserv.ico
  icon 23,135 50 130 130,graph/dalnet.bmp
  size -1 -1 202 70
  option dbu
  box "",24,65 46 70 20
  button "Close",1,165 50 30 10,ok
  check "Help",30,7 50 30 10,push
  box "",31,5 45 34 17
  box "",28,163 45 34 17
  text "Nickname Control :",2,5 5 100 7
  box "",3,5 9 94 37
  button "Access",4,7 14 30 10
  button "Recover",5,37 14 30 10
  button "Release",6,67 14 30 10
  button "Register",8,7 24 30 10
  button "Drop",9,37 24 30 10
  button "Identify",10,67 24 30 10
  button "Info",11,7 34 30 10
  button "Sendpass",7,37 34 30 10
  button "Ghost",12,67 34 30 10
  text "Nickname Settings :",13,103 5 60 7
  button "Password",14,105 14 30 10
  button "Enforce",15,135 14 30 10
  button "URL",16,165 14 30 10
  button "Email",17,105 24 30 10
  button "Show Email",19,135 24 30 10
  button "Mailblock",20,165 24 30 10
  button "No Op",21,105 34 30 10
  button "No Memo",22,135 34 30 10
  box "",18,103 9 94 37
  edit "",25,7 74 188 60,multi vsbar read
  box "",27,5 69 192 67
}

on *:dialog:gtzdaln:init:*:{
  .loadbuf -o $dname 25 utilities/nshelp.txt
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,2,30,4,5,6,8,9,10,11,7,12,13,14,15,16,17,19,20,21,22,25 12 400 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 1,30,4,5,6,8,9,10,11,7,12,14,15,16,17,19,20,21,22 clientedge
}

alias gtzdaln.help {
  if ( $did(gtzdaln,30).state == 0 ) {
    dialog -s gtzdaln $dialog(gtzdaln).x $dialog(gtzdaln).y 404 140
    did -h gtzdaln 25,27
  }
  else {
    dialog -s gtzdaln $dialog(gtzdaln).x $dialog(gtzdaln).y 404 280
    did -v gtzdaln 25,27
  }
}

on *:dialog:gtzdaln:sclick:*:{
  if ($did == 4) { dalacc }
  if ($did == 5) { nickserv recover $$?="Nickname to Recover :" $$?*="Password :" }
  if ($did == 6) { nickserv release $$?="Nickname to Release :" $$?*="Password :" }
  if ($did == 8) { nickserv register $$?="Password :" $$?="Email :" }
  if ($did == 9) { daldropn }
  if ($did == 10) { nickserv identify $$?="Nickname to Identify :" $$?*="Password :" }
  if ($did == 11) { nickserv info $$?="Nickname :" }
  if ($did == 12) { nickserv ghost $$?="Nickname to Ghost :" $$?*="Password :" }
  if ($did == 7) { nickserv sendpass $$?="Nickname to Sendpass :" $$?="Email :" }
  if ($did == 14) { nickserv set passwd $$?*="Old/Current Password :" $$?="New Password :" }
  if ($did == 15) { nickserv set enforce $$?="On or Off ?" }
  if ($did == 16) { nickserv set url $$?="URL/Website :" }
  if ($did == 17) { nickserv set email $$?*="Password :" $$?="New Email :" }
  if ($did == 19) { nickserv set showemail enforce $$?="On or Off ?" }
  if ($did == 20) { nickserv set mailblock $$?="On or Off ?" }
  if ($did == 21) { nickserv set noop $$?="On or Off ?" }
  if ($did == 22) { nickserv set nomemo $$?="On or Off ?" }
  if ($did == 30) { gtzdaln.help }
}

alias dalacc { if ($dialog(dalacc)) dialog -v acc | else dialog -m dalacc dalacc }
dialog dalacc {
  title "Access Options"
  icon graph/nickserv.ico
  size -1 -1 110 37
  option dbu
  button "Close",1,5 22 20 10,ok
  button "Acc",2,5 6 20 10
  button "Add",3,25 6 20 10
  button "Del",4,45 6 20 10
  button "List",5,65 6 20 10
  button "Wipe",8,85 6 20 10
  box "",6,3 1 104 17
  box "",7,3 17 24 17
}
on *:dialog:dalacc:sclick:*:{
  if ($did == 2) { nickserv acc $$?="Nickname to Acc :" }
  if ($did == 3) { nickserv acc add $$?="Nickname or hostname to Add :" }
  if ($did == 4) { nickserv acc del $$?="Nickname or hostname to Del :" }
  if ($did == 5) { nickserv acc list }
  if ($did == 8) { nickserv acc wipe }
}

alias daldropn { if ($dialog(daldropn)) dialog -v daldropn | else dialog -m daldropn daldropn }
dialog daldropn {
  title "Drop Options"
  icon graph/nickserv.ico
  size -1 -1 110 37
  option dbu
  button "Close",1,5 22 20 10,ok
  button "1st Step",2,5 6 50 10
  button "2nd Step",3,55 6 50 10
  box "",4,3 1 104 17
  box "",5,3 17 24 17
}
on *:dialog:daldropn:sclick:*:{
  if ($did == 2) { nickserv drop $$?="Nickname to Drop :" }
  if ($did == 3) { nickserv drop $$?="Nickname to Drop :" $$?="Drop Code :" }
}

alias gtzdals { dialog -m gtzdals gtzdals }
dialog gtzdals {
  title Statserv Options (Normal User)
  icon graph/statserv.ico
  icon 44,39 38 130 130,graph/dalnet.bmp
  size -1 -1 104 81
  option dbu
  button "Close",1,66 65 30 10,ok
  check "Help",50,7 65 30 10,push
  box "",52,5 60 34 17
  box "",43,64 60 34 17
  button "Host",2,37 7 30 10
  button "Hosts",3,67 7 30 10
  button "Domain",6,7 7 30 10
  button "Login",8,7 17 30 10
  button "Netstats",9,37 17 30 10
  button "Servers",10,67 17 30 10
  button "Server",11,7 27 30 10
  button "Stats",12,37 27 30 10
  button "Uptime",13,67 27 30 10
  box "",5,5 2 94 37
  edit "",45,107 6 123 70,multi vsbar read
  box "",47,106 2 125 75
  box "",48,17 40 70 20
}

on *:dialog:gtzdals:init:*:{
  .loadbuf -o $dname 45 utilities/sshelp.txt
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,50,2,3,6,8,9,10,11,12,13,45 12 400 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 1,50,2,3,6,8,9,10,11,12,13 clientedge
}
alias gtzdals.help {
  if ( $did(gtzdals,50).state == 0 ) {
    dialog -s gtzdals $dialog(gtzdals).x $dialog(gtzdals).y 208 162
    did -h gtzdals 45,47
  }
  else {
    dialog -s gtzdals $dialog(gtzdals).x $dialog(gtzdals).y 470 162
    did -v gtzdals 45,47
  }
}
on *:dialog:gtzdals:sclick:*:{
  if ($did == 2) { statserv host $$?="Host :" }
  if ($did == 3) { statserv hosts }
  if ($did == 6) { statserv domain $$?="Domain :" }
  if ($did == 8) { statserv login $$?="Username :" $$?*="Password :" }
  if ($did == 9) { statserv netstats }
  if ($did == 10) { statserv servers }
  if ($did == 11) { statserv server $$?="Server :" }
  if ($did == 12) { statserv stats $$?="Server/Host/Domain :" }
  if ($did == 13) { statserv uptime }
  if ($did == 50) { gtzdals.help }
}

alias gtzdalo { dialog -m gtzdalo gtzdalo }
dialog gtzdalo {
  title Operserv Options
  icon graph/operserv.ico
  icon 44,39 38 130 130,graph/dalnet.bmp
  size -1 -1 104 81
  option dbu
  button "Close",1,66 65 30 10,ok
  check "Help",50,7 65 30 10,push
  box "",52,5 60 34 17
  box "",43,64 60 34 17
  button "Host",2,37 7 30 10
  box "",5,5 2 94 37
  box "",47,106 2 125 75
  box "",48,17 40 70 20
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
