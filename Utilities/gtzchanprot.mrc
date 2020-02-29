;___________________________________________
; Invincible by Xtry
; Channel Protection
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias akick { if ($dialog(akick)) dialog -v akick | else dialog -m akick akick }
dialog akick {
  title "Channel Protection"
  icon graph/protx.ico
  size -1 -1 480 225

  box "",67,395 3 80 77
  box "",68,395 184 80 34
  box "",70,395 78 80 77
  button "Close",1, 400 194 70 20, ok
  button "Default",64, 400 55 70 20
  button "Enable All",65, 400 15 70 20
  button "Disable All",66, 400 35 70 20
  button "Channels",69, 400 90 70 20
  button "Ban Timer",71, 400 110 70 20
  button "Settings",72, 400 130 70 20

  box "",2,5 3 195 215
  text "Unacceptable Nicks",3, 10 15 150 13
  radio "On",4, 115 15 40 17, push group
  radio "Off",5, 155 15 40 17, push
  text "Revolving Door",6, 10 35 150 13
  radio "On",7, 115 35 40 17, push group
  radio "Off",8, 155 35 40 17, push
  text "Mass Inviting",9, 10 55 150 13
  radio "On",10, 115 55 40 17, push group
  radio "Off",11, 155 55 40 17, push
  text "Offensive Language",12, 10 75 150 13
  radio "On",13, 115 75 40 17, push group
  radio "Off",14, 155 75 40 17, push
  text "Channel Advertising",15, 10 95 150 13
  radio "On",16, 115 95 40 17, push group
  radio "Off",17, 155 95 40 17, push
  text "Repeating Kick",18, 10 115 150 13
  radio "On",19, 115 115 40 17, push group
  radio "Off",20, 155 115 40 17, push
  text "Text Flood",21, 10 135 150 13
  radio "On",22, 115 135 40 17, push group
  radio "Off",23, 155 135 40 17, push
  text "Nick Flood",24, 10 155 150 13
  radio "On",25, 115 155 40 17, push group
  radio "Off",26, 155 155 40 17, push
  text "CTCP Flood",27, 10 175 150 13
  radio "On",28, 115 175 40 17, push group
  radio "Off",29, 155 175 40 17, push
  text "Kick Virus Senders",30, 10 195 150 13
  radio "On",31, 115 195 40 17, push group
  radio "Off",32, 155 195 40 17, push

  box "",63,198 3 192 215
  text "English Fonts Only",33, 205 15 150 13
  radio "On",34, 305 15 40 17, push group
  radio "Off",35, 345 15 40 17, push
  text "Trout Slap",39, 205 35 150 13
  radio "On",40, 305 35 40 17, push group
  radio "Off",41, 345 35 40 17, push
  text "Clones Detection",42, 205 55 150 13
  radio "On",43, 305 55 40 17, push group
  radio "Off",44, 345 55 40 17, push
  text "Control Codes",45, 205 75 150 13
  radio "On",46, 305 75 40 17, push group
  radio "Off",47, 345 75 40 17, push
  text "Long Text Flood",48, 205 95 150 13
  radio "On",49, 305 95 40 17, push group
  radio "Off",50, 345 95 40 17, push
  text "Excess Caps",51, 205 115 150 13
  radio "On",52, 305 115 40 17, push group
  radio "Off",53, 345 115 40 17, push
  text "Mass Notices",54, 205 135 150 13
  radio "On",55, 305 135 40 17, push group
  radio "Off",56, 345 135 40 17, push
  text "Private Advertising",57, 205 155 150 13
  radio "On",58, 305 155 40 17, push group
  radio "Off",59, 345 155 40 17, push
  text "Greeting via notice",60, 205 175 150 13
  radio "On",61, 305 175 40 17, push group
  radio "Off",62, 345 175 40 17, push

}
on 1:dialog:akick:init:0: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 1,64,65,66,69,71,72,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 1,64,65,66,69,71,72 clientedge
  if ( %cpro.badnick == on ) { did -c akick 4 } 
  else { did -c akick 5 }
  if ( %cpro.rdoor == on ) { did -c akick 7 }
  else { did -c akick 8 }
  if ( %cpro.invite == on ) { did -c akick 10 }
  else { did -c akick 11 }
  if ( %cpro.swear == on ) { did -c akick 13 }
  else { did -c akick 14 }
  if ( %cpro.advertise == on ) { did -c akick 16 }
  else { did -c akick 17 }
  if ( %cpro.repeat == on ) { did -c akick 19 }
  else { did -c akick 20 }
  if ( %cpro.flood == on ) { did -c akick 22 }
  else { did -c akick 23 }
  if ( %cpro.nickflood == on ) { did -c akick 25 }
  else { did -c akick 26 }
  if ( %cpro.ctcpflood == on ) { did -c akick 28 }
  else { did -c akick 29 }
  if ( %cpro.filekick == on ) { did -c akick 31 }
  else { did -c akick 32 }
  if ( %cpro.arabkicker == on ) { did -c akick 34 }
  else { did -c akick 35 }
  if ( %cpro.troutslap == on ) { did -c akick 40 }
  else { did -c akick 41 }
  if ( %cpro.clonekick == on ) { did -c akick 43 }
  else { did -c akick 44 }
  if ( %cpro.ccodes == on ) { did -c akick 46 }
  else { did -c akick 47 }
  if ( %cpro.longtext == on ) { did -c akick 49 }
  else { did -c akick 50 }
  if ( %cpro.caps == on ) { did -c akick 52 }
  else { did -c akick 53 }
  if ( %cpro.massn == on ) { did -c akick 55 }
  else { did -c akick 56 }
  if ( %cpro.prvkick == on ) { did -c akick 58 | .enable #channelrpv }
  else { did -c akick 59 | .disable #channelprv }
  if ( %cpro.prvnkick == on ) { did -c akick 61 | .enable #noticecheck }
  else { did -c akick 62 | .disable #noticecehck }
}
on 1:dialog:akick:sclick:*: {
  if ( $did = 4 ) { set %cpro.badnick on }
  if ( $did = 5 ) { set %cpro.badnick OFF }
  if ( $did = 7 ) { set %cpro.rdoor on }
  if ( $did = 8 ) { set %cpro.rdoor OFF }
  if ( $did = 10 ) { set %cpro.invite on }
  if ( $did = 11 ) { set %cpro.invite OFF }
  if ( $did = 13 ) { set %cpro.swear on }
  if ( $did = 14 ) { set %cpro.swear OFF }
  if ( $did = 16 ) { set %cpro.advertise on }
  if ( $did = 17 ) { set %cpro.advertise OFF }
  if ( $did = 19 ) { set %cpro.repeat on }
  if ( $did = 20 ) { set %cpro.repeat OFF }
  if ( $did = 22 ) { set %cpro.flood on }
  if ( $did = 23 ) { set %cpro.flood OFF }
  if ( $did = 25 ) { set %cpro.nickflood on }
  if ( $did = 26 ) { set %cpro.nickflood OFF }
  if ( $did = 28 ) { set %cpro.ctcpflood on }
  if ( $did = 29 ) { set %cpro.ctcpflood OFF }
  if ( $did = 31 ) { set %cpro.filekick on }
  if ( $did = 32 ) { set %cpro.filekick OFF }
  if ( $did = 34 ) { set %cpro.arabkicker on }
  if ( $did = 35 ) { set %cpro.arabkicker OFF }
  if ( $did = 40 ) { set %cpro.troutslap on }
  if ( $did = 41 ) { set %cpro.troutslap OFF }
  if ( $did = 43 ) { set %cpro.clonekick on }
  if ( $did = 44 ) { set %cpro.clonekick OFF }
  if ( $did = 46 ) { set %cpro.ccodes on }
  if ( $did = 47 ) { set %cpro.ccodes OFF }
  if ( $did = 49 ) { set %cpro.longtext on }
  if ( $did = 50 ) { set %cpro.longtext OFF }
  if ( $did = 52 ) { set %cpro.caps on }
  if ( $did = 53 ) { set %cpro.caps OFF }
  if ( $did = 55 ) { set %cpro.massn on }
  if ( $did = 56 ) { set %cpro.massn OFF }
  if ( $did = 58 ) { set %cpro.prvkick on | .enable #channelprv }
  if ( $did = 59 ) { set %cpro.prvkick OFF | .disable #channelprv }
  if ( $did = 61 ) { set %cpro.prvnkick on | .enable #noticecheck }
  if ( $did = 62 ) { set %cpro.prvnkick OFF | .disable #noticecheck }
  if ( $did = 69 ) { gtzakickchan }
  if ( $did = 71 ) { gtzakicktime }
  if ( $did = 72 ) { gtzakickextra }
  if ( $did = 65 ) {
    set %cpro.badnick ON | did -c akick 4 | did -u akick 5
    set %cpro.clonekick ON | did -c akick 7 | did -u akick 8
    set %cpro.rdoor ON | did -c akick 10 | did -u akick 11
    set %cpro.invite ON | did -c akick 13 | did -u akick 14
    set %cpro.swear ON | did -c akick 16 | did -u akick 17
    set %cpro.advertise ON | did -c akick 19 | did -u akick 20
    set %cpro.longtext ON | did -c akick 22 | did -u akick 23
    set %cpro.ccodes ON | did -c akick 25 | did -u akick 26
    set %cpro.caps ON | did -c akick 28 | did -u akick 29
    set %cpro.repeat ON | did -c akick 31 | did -u akick 32
    set %cpro.flood ON | did -c akick 34 | did -u akick 35
    set %cpro.nickflood ON | did -c akick 40 | did -u akick 41
    set %cpro.filekick ON | did -c akick 43 | did -u akick 44
    set %cpro.troutslap ON | did -c akick 46 | did -u akick 47
    set %cpro.arabkicker ON | did -c akick 49 | did -u akick 50
    set %cpro.ctcpflood ON | did -c akick 52 | did -u akick 53
    set %cpro.prvkick ON | did -c akick 58 | did -u akick 59 | .enable #channelprv
    set %cpro.massn ON | did -c akick 55 | did -u akick 56
    set %cpro.prvnkick ON | did -c akick 61 | did -u akick 62 | .enable #noticecheck
  }
  if ( $did = 66 ) {
    set %cpro.badnick OFF | did -u akick 4 | did -c akick 5
    set %cpro.clonekick OFF | did -u akick 7 | did -c akick 8
    set %cpro.rdoor OFF | did -u akick 10 | did -c akick 11
    set %cpro.invite OFF | did -u akick 13 | did -c akick 14
    set %cpro.swear OFF | did -u akick 16 | did -c akick 17
    set %cpro.advertise OFF | did -u akick 19 | did -c akick 20
    set %cpro.longtext OFF | did -u akick 22 | did -c akick 23
    set %cpro.ccodes OFF | did -u akick 25 | did -c akick 26
    set %cpro.caps OFF | did -u akick 28 | did -c akick 29
    set %cpro.repeat OFF | did -u akick 31 | did -c akick 32
    set %cpro.flood OFF | did -u akick 34 | did -c akick 35
    set %cpro.nickflood OFF | did -u akick 40 | did -c akick 41
    set %cpro.filekick OFF | did -u akick 43 | did -c akick 44
    set %cpro.troutslap OFF | did -u akick 46 | did -c akick 47
    set %cpro.arabkicker OFF | did -u akick 49 | did -c akick 50
    set %cpro.ctcpflood OFF | did -u akick 52 | did -c akick 53
    set %cpro.prvkick OFF | did -u akick 58 | did -c akick 59 | .disable #channelprv
    set %cpro.massn OFF | did -u akick 55 | did -c akick 56
    set %cpro.prvnkick OFF | did -u akick 61 | did -c akick 62 | .disable #noticecheck
  }
  if ( $did = 64 ) {
    did -c akick 4 | set %cpro.badnick on | did -u akick 5
    did -c akick 7 | set %cpro.rdoor on | did -u akick 8
    did -c akick 10 | set %cpro.invite on | did -u akick 11
    did -c akick 13 | set %cpro.swear on | did -u akick 14
    did -c akick 16 | set %cpro.advertise on | did -u akick 17
    did -c akick 19 | set %cpro.repeat on | did -u akick 20
    did -c akick 22 | set %cpro.flood on | did -u akick 23
    did -c akick 25 | set %cpro.nickflood on | did -u akick 26
    did -c akick 28 | set %cpro.ctcpflood on | did -u akick 29
    did -c akick 31 | set %cpro.filekick on | did -u akick 32
    did -c akick 35 | set %cpro.arabkicker OFF | did -u akick 34
    did -c akick 41 | set %cpro.troutslap OFF | did -u akick 40
    did -c akick 44 | set %cpro.clonekick OFF | did -u akick 43
    did -c akick 47 | set %cpro.ccodes OFF | did -u akick 46
    did -c akick 50 | set %cpro.longtext OFF | did -u akick 49
    did -c akick 53 | set %cpro.caps OFF | did -u akick 52
    did -c akick 55 | set %cpro.massn on | did -u akick 56
    did -c akick 58 | set %cpro.prvkick on | did -u akick 59 | .enable #channelprv
    did -c akick 61 | set %cpro.prvnkick on | did -u akick 62 | .enable #noticecheck
  }
}

alias gtzakickchan { if ($dialog(gtzakickchan)) dialog -v gtzakickchan | else dialog -m gtzakickchan gtzakickchan }
dialog gtzakickchan {
  title "Channel Protection (Channel Setting)"
  icon graph/protx.ico
  size -1 -1 590 207

  box "",6, 5 3 231 198

  text "Unacceptable Nicks",7, 10 19 150 13
  edit %cpro.channelbadnick,8, 115 15 70 20, read, autohs
  button "Edit",9, 186 15 45 20
  text "Revolving Door",10, 10 39 150 13
  edit %cpro.channelrevolv,11, 115 35 70 20, read, autohs
  button "Edit",12, 186 35 45 20
  text "Mass Inviting",13, 10 59 150 13
  edit %cpro.channelmass,14, 115 55 70 20, read, autohs
  button "Edit",15, 186 55 45 20
  text "Offensive Language",16, 10 79 150 13
  edit %cpro.channelswear,17, 115 75 70 20, read, autohs
  button "Edit",18, 186 75 45 20
  text "Channel Advertising",19, 10 99 150 13
  edit %cpro.channeladver,20, 115 95 70 20, read, autohs
  button "Edit",21, 186 95 45 20
  text "Repeating Kick",22, 10 119 150 13
  edit %cpro.channelrepeat,23, 115 115 70 20, read, autohs
  button "Edit",24, 186 115 45 20
  text "Text Flood",25, 10 139 150 13
  edit %cpro.channelflood,26, 115 135 70 20, read, autohs
  button "Edit",27, 186 135 45 20
  text "Nick Flood",28, 10 159 150 13
  edit %cpro.channelnickflood,29, 115 155 70 20, read, autohs
  button "Edit",30, 186 155 45 20
  text "CTCP Flood",31, 10 179 150 13
  edit %cpro.channelctcp,32, 115 175 70 20, read, autohs
  button "Edit",33, 186 175 45 20

  box "",121,234 3 237 198
  text "Kick Virus Senders",34, 240 19 150 13
  edit %cpro.channelvirus,35, 350 15 70 20, read, autohs
  button "Edit",36, 421 15 45 20
  text "English Fonts Only",37, 240 39 150 13
  edit %cpro.channelarabic,38, 350 35 70 20, read, autohs
  button "Edit",39, 421 35 45 20
  text "Trout Slap",40, 240 59 150 13
  edit %cpro.channelslap,41, 350 55 70 20, read, autohs
  button "Edit",42, 421 55 45 20
  text "Clones Detection",43, 240 79 150 13
  edit %cpro.channelclone,44, 350 75 70 20, read, autohs
  button "Edit",45, 421 75 45 20
  text "Control Codes",46, 240 99 150 13
  edit %cpro.channelccodes,47, 350 95 70 20, read, autohs
  button "Edit",48, 421 95 45 20
  text "Long Text Flood",49, 240 119 150 13
  edit %cpro.channellongtxt,50, 350 115 70 20, read, autohs
  button "Edit",51, 421 115 45 20
  text "Excess Caps",52, 240 139 150 13
  edit %cpro.channelcaps,53, 350 135 70 20, read, autohs
  button "Edit",54, 421 135 45 20
  text "Mass Notices",55, 240 159 150 13
  edit %cpro.channelmassn,56, 350 155 70 20, read, autohs
  button "Edit",57, 421 155 45 20
  text "Greetings via notice",58, 240 179 150 13
  edit %cpro.channelprvn,59, 350 175 70 20, read, autohs
  button "Edit",60, 421 175 45 20

  button "Add To All",117, 477 15 100 20
  edit "",118, 477 35 100 20, autohs
  button "Remove From All",119, 477 75 100 20
  edit "",120, 477 95 100 20, autohs
  button "Close",122, 477 175 100 20,ok
  box "",123,469 3 115 198
}
on 1:dialog:gtzakickchan:sclick:*: {
  if ( $did = 9 ) { set %cpro.chng1 1 | gtzchantoprot }
  if ( $did = 12 ) { set %cpro.chng1 2 | gtzchantoprot }
  if ( $did = 15) { set %cpro.chng1 3 | gtzchantoprot }
  if ( $did = 18 ) { set %cpro.chng1 4 | gtzchantoprot }
  if ( $did = 21 ) { set %cpro.chng1 5 | gtzchantoprot }
  if ( $did = 24 ) { set %cpro.chng1 6 | gtzchantoprot }
  if ( $did = 27 ) { set %cpro.chng1 7 | gtzchantoprot }
  if ( $did = 30 ) { set %cpro.chng1 8 | gtzchantoprot }
  if ( $did = 33 ) { set %cpro.chng1 9 | gtzchantoprot }
  if ( $did = 36 ) { set %cpro.chng1 10 | gtzchantoprot }
  if ( $did = 39 ) { set %cpro.chng1 11 | gtzchantoprot }
  if ( $did = 42 ) { set %cpro.chng1 12 | gtzchantoprot }
  if ( $did = 45 ) { set %cpro.chng1 13 | gtzchantoprot }
  if ( $did = 48 ) { set %cpro.chng1 14 | gtzchantoprot }
  if ( $did = 51 ) { set %cpro.chng1 15 | gtzchantoprot }
  if ( $did = 54 ) { set %cpro.chng1 16 | gtzchantoprot }
  if ( $did = 57 ) { set %cpro.chng1 17 | gtzchantoprot }
  if ( $did = 60 ) { set %cpro.chng1 18 | gtzchantoprot }
  if ( $did = 117 ) { addtoallgtz }
  if ( $did = 119 ) { remallgtz }
}
on 1:dialog:gtzakickchan:init:0: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,117,118,119,120,122,123 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 117,119,122,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60 clientedge
}
on 1:dialog:gtzakickchan:edit:*: {
  if ( $did = 118 ) {
    if ( $left($did(118).text,1) != $chr(35) ) && ( $left($did(118).text,1) != a ) { set %cpro.no.2 118 | akickerrorgtz }
    if ( $left($did(118).text,1) = $chr(35) ) || ( $left($did(118).text,1) = a ) { set %cpro.chan.temp $did(118).text }
  }
  if ( $did = 120 ) {
    if ( $left($did(120).text,1) != $chr(35) ) && ( $left($did(120).text,1) != a ) { set %cpro.no.2 120 | akickerrorgtz }
    if ( $left($did(120).text,1) = $chr(35) ) || ( $left($did(120).text,1) = a ) { set %cpro.chan.temp $did(120).text }
  }
}
alias gtzchantoprot { if ($dialog(gtz.chantoprot)) dialog -v gtz.chantoprot | else dialog -mo gtz.chantoprot gtz.chantoprot }
dialog gtz.chantoprot {
  title "Channel(s) To Protect"
  icon graph/protx.ico
  size -1 -5 231 150
  button "Add",1, 150 10 70 20
  combo 2, 10 10 130 139, edit
  button "Del",3, 150 30 70 20
  button "Ok",4, 150 119 70 20, Cancel
  box "",5,146 0 78 54
  box "",6,6 0 138 143
  box "",7,146 109 78 34
}
on 1:dialog:gtz.chantoprot:init:0: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 2,1,3,4 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 1,3,4 clientedge
  if ( %cpro.chng1 = 1 ) { 
    set %cpro.temp.total $count(%cpro.channelbadnick,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelbadnick,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 2 ) { 
    set %cpro.temp.total $count(%cpro.channelrevolv,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelrevolv,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 3 ) { 
    set %cpro.temp.total $count(%cpro.channelmass,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelmass,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 4 ) { 
    set %cpro.temp.total $count(%cpro.channelswear,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelswear,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 5 ) { 
    set %cpro.temp.total $count(%cpro.channeladver,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channeladver,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 6 ) { 
    set %cpro.temp.total $count(%cpro.channelrepeat,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelrepeat,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 7 ) { 
    set %cpro.temp.total $count(%cpro.channelflood,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelflood,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 8 ) { 
    set %cpro.temp.total $count(%cpro.channelnickflood,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelnickflood,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 9 ) { 
    set %cpro.temp.total $count(%cpro.channelctcp,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelctcp,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 10 ) { 
    set %cpro.temp.total $count(%cpro.channelvirus,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelvirus,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 11 ) { 
    set %cpro.temp.total $count(%cpro.channelarabic,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelarabic,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 12 ) { 
    set %cpro.temp.total $count(%cpro.channelslap,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelslap,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 13 ) { 
    set %cpro.temp.total $count(%cpro.channelclone,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelclone,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 14 ) { 
    set %cpro.temp.total $count(%cpro.channelccodes,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelccodes,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 15 ) { 
    set %cpro.temp.total $count(%cpro.channellongtxt,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channellongtxt,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 16 ) { 
    set %cpro.temp.total $count(%cpro.channelcaps,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelcaps,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 17 ) { 
    set %cpro.temp.total $count(%cpro.channelmassn,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelmassn,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
  if ( %cpro.chng1 = 18 ) { 
    set %cpro.temp.total $count(%cpro.channelprvn,$chr(44))
    set %cpro.temp.count 0
    set %cpro.temp.total %cpro.temp.total + 1
    :start
    inc %cpro.temp.count 1
    did -a gtz.chantoprot 2 $gettok(%cpro.channelprvn,%cpro.temp.count,44)
    if (%cpro.temp.count < %cpro.temp.total) { goto start }
  }
}
on 1:dialog:gtz.chantoprot:edit:*: {
  if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
}
on 1:dialog:gtz.chantoprot:sclick:*: {
  if ( %cpro.chng1 = 1 ) {
    if ( $did = 1 ) { set %cpro.channelbadnick $addtok(%cpro.channelbadnick,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 8 | did -a gtzakickchan 8 %cpro.channelbadnick }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelbadnick $remtok(%cpro.channelbadnick,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelbadnick,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelbadnick,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 8 | did -a gtzakickchan 8 %cpro.channelbadnick
    }
  }
  if ( %cpro.chng1 = 2 ) {
    if ( $did = 1 ) { set %cpro.channelrevolv $addtok(%cpro.channelrevolv,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 11 | did -a gtzakickchan 11 %cpro.channelrevolv }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelrevolv $remtok(%cpro.channelrevolv,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelrevolv,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelrevolv,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 11 | did -a gtzakickchan 11 %cpro.channelrevolv
    }
  }
  if ( %cpro.chng1 = 3 ) {
    if ( $did = 1 ) { set %cpro.channelmass $addtok(%cpro.channelmass,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 14 | did -a gtzakickchan 14 %cpro.channelmass }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelmass $remtok(%cpro.channelmass,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelmass,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelmass,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 14 | did -a gtzakickchan 14 %cpro.channelmass
    }
  }
  if ( %cpro.chng1 = 4 ) {
    if ( $did = 1 ) { set %cpro.channelswear $addtok(%cpro.channelswear,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 17 | did -a gtzakickchan 17 %cpro.channelswear }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelswear $remtok(%cpro.channelswear,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelswear,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelswear,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 17 | did -a gtzakickchan 17 %cpro.channelswear
    }
  }
  if ( %cpro.chng1 = 5 ) {
    if ( $did = 1 ) { set %cpro.channeladver $addtok(%cpro.channeladver,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 20 | did -a gtzakickchan 20 %cpro.channeladver }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channeladver $remtok(%cpro.channeladver,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channeladver,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channeladver,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 20 | did -a gtzakickchan 20 %cpro.channeladver
    }
  }
  if ( %cpro.chng1 = 6 ) {
    if ( $did = 1 ) { set %cpro.channelrepeat $addtok(%cpro.channelrepeat,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 23 | did -a gtzakickchan 23 %cpro.channelrepeat }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelrepeat $remtok(%cpro.channelrepeat,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelrepeat,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelrepeat,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 23 | did -a gtzakickchan 23 %cpro.channelrepeat
    }
  }
  if ( %cpro.chng1 = 7 ) {
    if ( $did = 1 ) { set %cpro.channelflood $addtok(%cpro.channelflood,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 26 | did -a gtzakickchan 26 %cpro.channelflood }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelflood $remtok(%cpro.channelflood,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelflood,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelflood,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 26 | did -a gtzakickchan 26 %cpro.channelflood
    }
  }
  if ( %cpro.chng1 = 8 ) {
    if ( $did = 1 ) { set %cpro.channelnickflood $addtok(%cpro.channelnickflood,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 29 | did -a gtzakickchan 29 %cpro.channelnickflood }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelnickflood $remtok(%cpro.channelnickflood,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelnickflood,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelnickflood,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 29 | did -a gtzakickchan 29 %cpro.channelnickflood
    }
  }
  if ( %cpro.chng1 = 9 ) {
    if ( $did = 1 ) { set %cpro.channelctcp $addtok(%cpro.channelctcp,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 32 | did -a gtzakickchan 32 %cpro.channelctcp }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelctcp $remtok(%cpro.channelctcp,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelctcp,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelctcp,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 32 | did -a gtzakickchan 32 %cpro.channelctcp
    }
  }
  if ( %cpro.chng1 = 10 ) {
    if ( $did = 1 ) { set %cpro.channelvirus $addtok(%cpro.channelvirus,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 35 | did -a gtzakickchan 35 %cpro.channelvirus }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelvirus $remtok(%cpro.channelvirus,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelvirus,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelvirus,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 35 | did -a gtzakickchan 35 %cpro.channelvirus
    }
  }
  if ( %cpro.chng1 = 11 ) {
    if ( $did = 1 ) { set %cpro.channelarabic $addtok(%cpro.channelarabic,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 38 | did -a gtzakickchan 38 %cpro.channelarabic }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelarabic $remtok(%cpro.channelarabic,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelarabic,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelarabic,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 38 | did -a gtzakickchan 38 %cpro.channelarabic
    }
  }
  if ( %cpro.chng1 = 12 ) {
    if ( $did = 1 ) { set %cpro.channelslap $addtok(%cpro.channelslap,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 41 | did -a gtzakickchan 41 %cpro.channelslap }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelslap $remtok(%cpro.channelslap,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelslap,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelslap,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 41 | did -a gtzakickchan 41 %cpro.channelslap
    }
  }
  if ( %cpro.chng1 = 13 ) {
    if ( $did = 1 ) { set %cpro.channelclone $addtok(%cpro.channelclone,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 44 | did -a gtzakickchan 44 %cpro.channelclone }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelclone $remtok(%cpro.channelclone,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelclone,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelclone,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 44 | did -a gtzakickchan 44 %cpro.channelclone
    }
  }
  if ( %cpro.chng1 = 14 ) {
    if ( $did = 1 ) { set %cpro.channelccodes $addtok(%cpro.channelccodes,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 47 | did -a gtzakickchan 47 %cpro.channelccodes }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelccodes $remtok(%cpro.channelccodes,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelccodes,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelccodes,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 47 | did -a gtzakickchan 47 %cpro.channelccodes
    }
  }
  if ( %cpro.chng1 = 15 ) {
    if ( $did = 1 ) { set %cpro.channellongtxt $addtok(%cpro.channellongtxt,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 50 | did -a gtzakickchan 50 %cpro.channellongtxt }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channellongtxt $remtok(%cpro.channellongtxt,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channellongtxt,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channellongtxt,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 50 | did -a gtzakickchan 50 %cpro.channellongtxt
    }
  }
  if ( %cpro.chng1 = 16 ) {
    if ( $did = 1 ) { set %cpro.channelcaps $addtok(%cpro.channelcaps,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 53 | did -a gtzakickchan 53 %cpro.channelcaps }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelcaps $remtok(%cpro.channelcaps,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelcaps,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelcaps,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 53 | did -a gtzakickchan 53 %cpro.channelcaps
    }
  }
  if ( %cpro.chng1 = 17 ) {
    if ( $did = 1 ) { set %cpro.channelmassn $addtok(%cpro.channelmassn,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 56 | did -a gtzakickchan 56 %cpro.channelmassn }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelmassn $remtok(%cpro.channelmassn,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelmassn,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelmassn,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 56 | did -a gtzakickchan 56 %cpro.channelmassn
    }
  }
  if ( %cpro.chng1 = 18 ) {
    if ( $did = 1 ) { set %cpro.channelprvn $addtok(%cpro.channelprvn,%cpro.channel.temp,44) | did -a gtz.chantoprot 2 %cpro.channel.temp | did -r gtzakickchan 59 | did -a gtzakickchan 59 %cpro.channelprvn }
    if ( $did = 2 ) { set %cpro.channel.temp $did(2).text }
    if ( $did = 3 ) { 
      did -r gtz.chantoprot 2
      set %cpro.channelprvn $remtok(%cpro.channelprvn,%cpro.channel.temp,44) 
      set %cpro.temp.total $count(%cpro.channelprvn,$chr(44))
      set %cpro.temp.count 0
      set %cpro.temp.total %cpro.temp.total + 1
      :start
      inc %cpro.temp.count 1
      did -a gtz.chantoprot 2 $gettok(%cpro.channelprvn,%cpro.temp.count,44)
      if (%cpro.temp.count < %cpro.temp.total) { goto start }
      did -r gtzakickchan 59 | did -a gtzakickchan 59 %cpro.channelprvn
    }
  }
}

alias addtoallgtz {
  set %cpro.channelbadnick $addtok(%cpro.channelbadnick,%cpro.chan.temp,44) | did -r gtzakickchan 8 | did -a gtzakickchan 8 %cpro.channelbadnick
  set %cpro.channelrevolv $addtok(%cpro.channelrevolv,%cpro.chan.temp,44) | did -r gtzakickchan 11 | did -a gtzakickchan 11 %cpro.channelrevolv
  set %cpro.channelmass $addtok(%cpro.channelmass,%cpro.chan.temp,44) | did -r gtzakickchan 14 | did -a gtzakickchan 14 %cpro.channelmass
  set %cpro.channelswear $addtok(%cpro.channelswear,%cpro.chan.temp,44) | did -r gtzakickchan 17 | did -a gtzakickchan 17 %cpro.channelswear
  set %cpro.channeladver $addtok(%cpro.channeladver,%cpro.chan.temp,44) | did -r gtzakickchan 20 | did -a gtzakickchan 20 %cpro.channeladver
  set %cpro.channelrepeat $addtok(%cpro.channelrepeat,%cpro.chan.temp,44) | did -r gtzakickchan 23 | did -a gtzakickchan 23 %cpro.channelrepeat
  set %cpro.channelflood $addtok(%cpro.channelflood,%cpro.chan.temp,44) | did -r gtzakickchan 26 | did -a gtzakickchan 26 %cpro.channelflood
  set %cpro.channelnickflood $addtok(%cpro.channelnickflood,%cpro.chan.temp,44) | did -r gtzakickchan 29 | did -a gtzakickchan 29 %cpro.channelnickflood
  set %cpro.channelctcp $addtok(%cpro.channelctcp,%cpro.chan.temp,44) | did -r gtzakickchan 32 | did -a gtzakickchan 32 %cpro.channelctcp
  set %cpro.channelvirus $addtok(%cpro.channelvirus,%cpro.chan.temp,44) | did -r gtzakickchan 35 | did -a gtzakickchan 35 %cpro.channelvirus
  set %cpro.channelarabic $addtok(%cpro.channelarabic,%cpro.chan.temp,44) | did -r gtzakickchan 38 | did -a gtzakickchan 38 %cpro.channelarabic
  set %cpro.channelslap $addtok(%cpro.channelslap,%cpro.chan.temp,44) | did -r gtzakickchan 41 | did -a gtzakickchan 41 %cpro.channelslap
  set %cpro.channelclone $addtok(%cpro.channelclone,%cpro.chan.temp,44) | did -r gtzakickchan 44 | did -a gtzakickchan 44 %cpro.channelclone
  set %cpro.channelccodes $addtok(%cpro.channelccodes,%cpro.chan.temp,44) | did -r gtzakickchan 47 | did -a gtzakickchan 47 %cpro.channelccodes
  set %cpro.channellongtxt $addtok(%cpro.channellongtxt,%cpro.chan.temp,44) | did -r gtzakickchan 50 | did -a gtzakickchan 50 %cpro.channellongtxt
  set %cpro.channelcaps $addtok(%cpro.channelcaps,%cpro.chan.temp,44) | did -r gtzakickchan 53 | did -a gtzakickchan 53 %cpro.channelcaps
  set %cpro.channelmassn $addtok(%cpro.channelmassn,%cpro.chan.temp,44) | did -r gtzakickchan 56 | did -a gtzakickchan 56 %cpro.channelmassn
  set %cpro.channelprvn $addtok(%cpro.channelprvn,%cpro.chan.temp,44) | did -r gtzakickchan 59 | did -a gtzakickchan 59 %cpro.channelprvn
  unset %cpro.chan.temp
}
alias remallgtz {
  set %cpro.channelbadnick $remtok(%cpro.channelbadnick,%cpro.chan.temp,44) | did -r gtzakickchan 8 | did -a gtzakickchan 8 %cpro.channelbadnick
  set %cpro.channelrevolv $remtok(%cpro.channelrevolv,%cpro.chan.temp,44) | did -r gtzakickchan 11 | did -a gtzakickchan 11 %cpro.channelrevolv
  set %cpro.channelmass $remtok(%cpro.channelmass,%cpro.chan.temp,44) | did -r gtzakickchan 14 | did -a gtzakickchan 14 %cpro.channelmass
  set %cpro.channelswear $remtok(%cpro.channelswear,%cpro.chan.temp,44) | did -r gtzakickchan 17 | did -a gtzakickchan 17 %cpro.channelswear
  set %cpro.channeladver $remtok(%cpro.channeladver,%cpro.chan.temp,44) | did -r gtzakickchan 20 | did -a gtzakickchan 20 %cpro.channeladver
  set %cpro.channelrepeat $remtok(%cpro.channelrepeat,%cpro.chan.temp,44) | did -r gtzakickchan 23 | did -a gtzakickchan 23 %cpro.channelrepeat
  set %cpro.channelflood $remtok(%cpro.channelflood,%cpro.chan.temp,44) | did -r gtzakickchan 26 | did -a gtzakickchan 26 %cpro.channelflood
  set %cpro.channelnickflood $remtok(%cpro.channelnickflood,%cpro.chan.temp,44) | did -r gtzakickchan 29 | did -a gtzakickchan 29 %cpro.channelnickflood
  set %cpro.channelctcp $remtok(%cpro.channelctcp,%cpro.chan.temp,44) | did -r gtzakickchan 32 | did -a gtzakickchan 32 %cpro.channelctcp
  set %cpro.channelvirus $remtok(%cpro.channelvirus,%cpro.chan.temp,44) | did -r gtzakickchan 35 | did -a gtzakickchan 35 %cpro.channelvirus
  set %cpro.channelarabic $remtok(%cpro.channelarabic,%cpro.chan.temp,44) | did -r gtzakickchan 38 | did -a gtzakickchan 38 %cpro.channelarabic
  set %cpro.channelslap $remtok(%cpro.channelslap,%cpro.chan.temp,44) | did -r gtzakickchan 41 | did -a gtzakickchan 41 %cpro.channelslap
  set %cpro.channelclone $remtok(%cpro.channelclone,%cpro.chan.temp,44) | did -r gtzakickchan 44 | did -a gtzakickchan 44 %cpro.channelclone
  set %cpro.channelccodes $remtok(%cpro.channelccodes,%cpro.chan.temp,44) | did -r gtzakickchan 47 | did -a gtzakickchan 47 %cpro.channelccodes
  set %cpro.channellongtxt $remtok(%cpro.channellongtxt,%cpro.chan.temp,44) | did -r gtzakickchan 50 | did -a gtzakickchan 50 %cpro.channellongtxt
  set %cpro.channelcaps $remtok(%cpro.channelcaps,%cpro.chan.temp,44) | did -r gtzakickchan 53 | did -a gtzakickchan 53 %cpro.channelcaps
  set %cpro.channelmassn $remtok(%cpro.channelmassn,%cpro.chan.temp,44) | did -r gtzakickchan 56 | did -a gtzakickchan 56 %cpro.channelmassn
  set %cpro.channelprvn $remtok(%cpro.channelprvn,%cpro.chan.temp,44) | did -r gtzakickchan 59 | did -a gtzakickchan 59 %cpro.channelprvn
  unset %cpro.chan.temp
}
alias akickerrorgtz2 { if ($dialog(akick.error2)) dialog -v akick.error2 | else dialog -m akick.error2 akick.error2 }
dialog akick.error2 {
  title "Error"
  icon graph/protx.ico
  size -1 -1 140 60
  text "Numbers Only !",1, 10 10 130 30
  button "Ok",2, 80 35 50 20, OK
}
on 1:dialog:akick.error2:sclick:2: {
  did -r gtzakicktime %cpro.no.1
  did -f gtzakicktime %cpro.no.1
  unset %cpro.no.1
}

alias akickerrorgtz { if ($dialog(akick.error)) dialog -v akick.error | else dialog -m akick.error akick.error }
dialog akick.error {
  title "Error"
  size -1 -1 140 60
  icon graph/protx.ico
  text "Channels start with #",1, 10 10 130 30
  button "Ok",2, 80 35 50 20, OK
}
on 1:dialog:akick.error:sclick:2: {
  did -r gtzakickchan %cpro.no.2
  did -f gtzakickchan %cpro.no.2
  unset %cpro.no.1
}

alias gtzakicktime { if ($dialog(gtzakicktime)) dialog -v gtzakicktime | else dialog -m gtzakicktime gtzakicktime }
dialog gtzakicktime {
  title "Channel Protection (Ban Setting)"
  icon graph/protx.ico
  size -1 -1 412 257

  box "",6, 5 3 200 198
  box "",137, 5 3 400 198
  box "",138, 5 215 78 34

  text "Unacceptable Nicks",66, 10 19 150 13
  edit "",67, 120 15 50 20, autohs
  text "Secs",68, 173 19 45 18
  text "Revolving Door",69, 10 39 150 13
  edit "",70, 120 35 50 20, autohs
  text "Secs",71, 173 39 45 18
  text "Mass Inviting",72, 10 59 150 13
  edit "",73, 120 55 50 20, autohs
  text "Secs",74, 173 59 45 20
  text "Offensive Language",75, 10 79 150 13
  edit "",76, 120 75 50 20, autohs
  text "Secs",77, 173 79 45 20
  text "Channel Advertising",78, 10 99 150 13
  edit "",79, 120 95 50 20, autohs
  text "Secs",80, 173 99 45 20
  text "Repeating Kick",81, 10 119 150 13
  edit "",82, 120 115 50 20, autohs
  text "Secs",83, 173 119 45 20
  text "Text Flood",84, 10 139 150 13
  edit "",85, 120 135 50 20, autohs
  text "Secs",86, 173 139 45 20
  text "Nick Flood",87, 10 159 150 13
  edit "",88, 120 155 50 20, autohs
  text "Secs",89, 173 159 45 20
  text "CTCP Flood",90, 10 179 150 13
  edit "",91, 120 175 50 20, autohs
  text "Secs",92, 173 179 45 20

  text "Kick Virus Senders",93, 210 19 150 13
  edit "",94, 320 15 50 20, autohs
  text "Secs",95, 373 19 45 20
  text "English Fonts Only",96, 210 39 150 13
  edit "",97, 320 35 50 20, autohs
  text "Secs",98, 373 39 45 20
  text "Trout Slap",99, 210 59 150 13
  edit "",100, 320 55 50 20, autohs
  text "Secs",101, 373 59 45 20
  text "Clones Detection",102, 210 79 150 13
  edit "",103, 320 75 50 20, autohs
  text "Secs",104, 373 79 45 20
  text "Control Codes",105, 210 99 150 13
  edit "",106, 320 95 50 20, autohs
  text "Secs",107, 373 99 45 20
  text "Long Text Flood",108, 210 119 150 13
  edit "",109, 320 115 50 20, autohs
  text "Secs",110, 373 119 45 20
  text "Excess Caps",111, 210 139 150 13
  edit "",112, 320 135 50 20, autohs
  text "Secs",113, 373 139 45 20
  text "Mass Notices",114, 210 159 150 13
  edit "",115, 320 155 50 20, autohs
  text "Secs",116, 373 159 45 20

  text "Note : You can put 0 (zero) if you don't want any ban to be placed when kicking",136, 15 205 400 15

  button "Default",121, 9 225 70 20
  button "Close",139,330 225 70 20,ok
  box "",140, 326 215 78 34
}
on 1:dialog:gtzakicktime:edit:*: {
  if ( $did = 67 ) {
    if ( $right($did(67).text,1) !isin 0123456789 ) { set %cpro.no.1 67 | akickerrorgtz2 } 
    if ( $right($did(67).text,1) isin 0123456789 ) { set %cpro.nickbad -u $+ $did(67).text | set %cpro.nickbad1 $did(67).text }
  }
  if ( $did = 70 ) { 
    if ( $right($did(70).text,1) !isin 0123456789 ) { set %cpro.no.1 70 | akickerrorgtz2 } 
    if ( $right($did(70).text,1) isin 0123456789 ) { set %cpro.revolvtime -u $+ $did(70).text | set %cpro.revolvtime1 $did(70).text }
  }    
  if ( $did = 73 ) { 
    if ( $right($did(73).text,1) !isin 0123456789 ) { set %cpro.no.1 73 | akickerrorgtz2 } 
    if ( $right($did(73).text,1) isin 0123456789 ) { set %cpro.massban -u $+ $did(73).text | set %cpro.massban1 $did(73).text }
  } 
  if ( $did = 76 ) { 
    if ( $right($did(76).text,1) !isin 0123456789 ) { set %cpro.no.1 76 | akickerrorgtz2 } 
    if ( $right($did(76).text,1) isin 0123456789 ) { set %cpro.langban -u $+ $did(76).text | set %cpro.langban1 $did(76).text }
  } 
  if ( $did = 79 ) { 
    if ( $right($did(79).text,1) !isin 0123456789 ) { set %cpro.no.1 79 | akickerrorgtz2 } 
    if ( $right($did(79).text,1) isin 0123456789 ) { set %cpro.adverban -u $+ $did(79).text | set %cpro.adverban1 $did(79).text }
  } 
  if ( $did = 82 ) { 
    if ( $right($did(82).text,1) !isin 0123456789 ) { set %cpro.no.1 82 | akickerrorgtz2 } 
    if ( $right($did(82).text,1) isin 0123456789 ) { set %cpro.repeatban -u $+ $did(82).text | set %cpro.repeatban1 $did(82).text }
  } 
  if ( $did = 85 ) { 
    if ( $right($did(85).text,1) !isin 0123456789 ) { set %cpro.no.1 85 | akickerrorgtz2 } 
    if ( $right($did(85).text,1) isin 0123456789 ) { set %cpro.floodban -u $+ $did(85).text | set %cpro.floodban1 $did(85).text }
  } 
  if ( $did = 88 ) { 
    if ( $right($did(88).text,1) !isin 0123456789 ) { set %cpro.no.1 88 | akickerrorgtz2 } 
    if ( $right($did(88).text,1) isin 0123456789 ) { set %cpro.nickfloodban -u $+ $did(88).text | set %cpro.nickfloodban1 $did(88).text }
  } 
  if ( $did = 91 ) { 
    if ( $right($did(91).text,1) !isin 0123456789 ) { set %cpro.no.1 91 | akickerrorgtz2 } 
    if ( $right($did(91).text,1) isin 0123456789 ) { set %cpro.ctcpfloodban -u $+ $did(91).text | set %cpro.ctcpfloodban1 $did(91).text }
  } 
  if ( $did = 94 ) { 
    if ( $right($did(94).text,1) !isin 0123456789 ) { set %cpro.no.1 94 | akickerrorgtz2 } 
    if ( $right($did(94).text,1) isin 0123456789 ) { set %cpro.fileban -u $+ $did(94).text | set %cpro.fileban1 $did(94).text }
  } 
  if ( $did = 97 ) { 
    if ( $right($did(97).text,1) !isin 0123456789 ) { set %cpro.no.1 97 | akickerrorgtz2 } 
    if ( $right($did(97).text,1) isin 0123456789 ) { set %cpro.araban -u $+ $did(97).text | set %cpro.araban1 $did(97).text }
  } 
  if ( $did = 100 ) { 
    if ( $right($did(100).text,1) !isin 0123456789 ) { set %cpro.no.1 100 | akickerrorgtz2 } 
    if ( $right($did(100).text,1) isin 0123456789 ) { set %cpro.troutban -u $+ $did(100).text | set %cpro.troutban1 $did(100).text }
  } 
  if ( $did = 103 ) { 
    if ( $right($did(103).text,1) !isin 0123456789 ) { set %cpro.no.1 103 | akickerrorgtz2 } 
    if ( $right($did(103).text,1) isin 0123456789 ) { set %cpro.clonetime -u $+ $did(103).text | set %cpro.clonetime1 $did(103).text }
  } 
  if ( $did = 106 ) { 
    if ( $right($did(106).text,1) !isin 0123456789 ) { set %cpro.no.1 106 | akickerrorgtz2 } 
    if ( $right($did(106).text,1) isin 0123456789 ) { set %cpro.Excessiveban -u $+ $did(106).text | set %cpro.Excessiveban1 $did(106).text }
  } 
  if ( $did = 109 ) { 
    if ( $right($did(109).text,1) !isin 0123456789 ) { set %cpro.no.1 109 | akickerrorgtz2 } 
    if ( $right($did(109).text,1) isin 0123456789 ) { set %cpro.longtxtban -u $+ $did(109).text | set %cpro.longtxtban1 $did(109).text }
  } 
  if ( $did = 112 ) { 
    if ( $right($did(112).text,1) !isin 0123456789 ) { set %cpro.no.1 112 | akickerrorgtz2 } 
    if ( $right($did(112).text,1) isin 0123456789 ) { set %cpro.capban -u $+ $did(112).text | set %cpro.capban1 $did(112).text }
  } 
  if ( $did = 115 ) { 
    if ( $right($did(115).text,1) !isin 0123456789 ) { set %cpro.no.1 115 | akickerrorgtz2 } 
    if ( $right($did(115).text,1) isin 0123456789 ) { set %cpro.massnban -u $+ $did(115).text | set %cpro.massnban1 $did(115).text }
  } 
}

on 1:dialog:gtzakicktime:init:0: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 136,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,103,104,105,106,107,108,109,110,111,112,113,114,115,121,139,116 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 121,139 clientedge
  did -a gtzakicktime 67 %cpro.nickbad1
  did -a gtzakicktime 70 %cpro.revolvtime1
  did -a gtzakicktime 73 %cpro.massban1
  did -a gtzakicktime 76 %cpro.langban1
  did -a gtzakicktime 79 %cpro.adverban1
  did -a gtzakicktime 82 %cpro.repeatban1
  did -a gtzakicktime 85 %cpro.floodban1
  did -a gtzakicktime 88 %cpro.nickfloodban1
  did -a gtzakicktime 91 %cpro.ctcpfloodban1
  did -a gtzakicktime 94 %cpro.fileban1
  did -a gtzakicktime 97 %cpro.araban1
  did -a gtzakicktime 100 %cpro.troutban1
  did -a gtzakicktime 103 %cpro.clonetime1
  did -a gtzakicktime 106 %cpro.Excessiveban1
  did -a gtzakicktime 109 %cpro.longtxtban1
  did -a gtzakicktime 112 %cpro.capban1
  did -a gtzakicktime 115 %cpro.massnban1
}

on 1:dialog:gtzakicktime:sclick:*: {
  if ( $did = 121 ) { defgtztime }
}

alias defgtztime {
  set %cpro.nickbad -u50
  set %cpro.nickbad1 50 | did -r gtzakicktime 67 | did -a gtzakicktime 67 %cpro.nickbad1
  set %cpro.clonetime -u120
  set %cpro.clonetime1 120 | did -r gtzakicktime 103 | did -a gtzakicktime 103 %cpro.clonetime1
  set %cpro.revolvtime -u90
  set %cpro.revolvtime1 90 | did -r gtzakicktime 70 | did -a gtzakicktime 70 %cpro.revolvtime1
  set %cpro.massban -u100
  set %cpro.massban1 100 | did -r gtzakicktime 73 | did -a gtzakicktime 73 %cpro.massban1
  set %cpro.langban -u120
  set %cpro.langban1 120 | did -r gtzakicktime 76 | did -a gtzakicktime 76 %cpro.langban1
  set %cpro.adverban -u85
  set %cpro.adverban1 85 | did -r gtzakicktime 79 | did -a gtzakicktime 79 %cpro.adverban1
  set %cpro.longtxtban -u40
  set %cpro.longtxtban1 40 | did -r gtzakicktime 109 | did -a gtzakicktime 109 %cpro.longtxtban1
  set %cpro.Excessiveban -u40
  set %cpro.Excessiveban1 40 | did -r gtzakicktime 106 | did -a gtzakicktime 106 %cpro.Excessiveban1
  set %cpro.capban -u70
  set %cpro.capban1 70 | did -r gtzakicktime 112 | did -a gtzakicktime 112 %cpro.capban1
  set %cpro.repeatban -u60
  set %cpro.repeatban1 60 | did -r gtzakicktime 82 | did -a gtzakicktime 82 %cpro.repeatban1
  set %cpro.floodban -u90
  set %cpro.floodban1 90 | did -r gtzakicktime 85 | did -a gtzakicktime 85 %cpro.floodban1
  set %cpro.nickfloodban -u90
  set %cpro.nickfloodban1 90 | did -r gtzakicktime 88 | did -a gtzakicktime 88 %cpro.nickfloodban1
  set %cpro.ctcpfloodban -u150
  set %cpro.ctcpfloodban1 150 | did -r gtzakicktime 91 | did -a gtzakicktime 91 %cpro.ctcpfloodban1
  set %cpro.fileban -u80
  set %cpro.fileban1 80 | did -r gtzakicktime 94 | did -a gtzakicktime 94 %cpro.fileban1
  set %cpro.troutban -u120
  set %cpro.troutban1 120 | did -r gtzakicktime 100 | did -a gtzakicktime 100 %cpro.troutban1
  set %cpro.araban -u240
  set %cpro.araban1 240 | did -r gtzakicktime 97 | did -a gtzakicktime 97 %cpro.araban1
  set %cpro.massnban -u160
  set %cpro.massnban1 160 | did -r gtzakicktime 115 | did -a gtzakicktime 115 %cpro.massnban1
}

alias gtzakickextra { if ($dialog(gtzakickextra)) dialog -v gtzakickextra | else dialog -m gtzakickextra gtzakickextra }
dialog gtzakickextra {
  title "Channel Protection (Extra Setting)"
  icon graph/protx.ico
  size -1 -1 545 185

  button "Close",5,465 155 70 20,ok
  box "",6,461 145 77 34

  box "",150,5 3 152 142
  text "Max Clones",123, 12 19 150 13
  edit "",124, 100 15 50 20, autohs
  text "Max Ctrl Codes",125, 12 49 150 13
  edit "",126, 100 45 50 20
  text "Max Text Letters",127, 12 79 190 13
  edit "",128, 100 75 50 20
  text "Max Caps",129, 12 109 150 13
  edit "",130, 100 105 50 20

  button "Default",131, 9 155 70 20
  box "",8,5 145 77 34

  box "",3,155 3 193 142
  text "Offensive Words :",133,165 15 150 13
  combo 134, 165 35 120 110
  button "Add",137, 290 35 50 20
  button "Del",138, 290 55 50 20
  button "Clear",139, 290 75 50 20

  text "Offensive Nicks :",141,355 15 150 13
  combo 142, 355 35 120 110
  button "Add",143, 480 35 50 20
  button "Del",144, 480 55 50 20
  button "Clear",145, 480 75 50 20
  box "",4,346 3 193 142
}

on 1:dialog:gtzakickextra:init:0: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 5,123,124,125,126,127,128,129,130,131,133,134,137,138,139,141,142,143,144,145 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 5,131,137,138,139,143,144,145 clientedge
  did -a gtzakickextra 124 %cpro.maxclones
  did -a gtzakickextra 126 %cpro.maxcodes
  did -a gtzakickextra 128 %cpro.lenmax
  did -a gtzakickextra 130 %cpro.maxcaps
  set %cpro.tempcount 0
  set %cpro.tempreal $count(%cpro.swearwords,$chr(44)) + 1
  :start
  inc %cpro.tempcount
  did -a gtzakickextra 134 $gettok(%cpro.swearwords,%cpro.tempcount,44)
  if ( %cpro.tempcount >= %cpro.tempreal ) { goto alrite }
  goto start
  :alrite
  set %cpro.tempcount1 0
  set %cpro.tempreal1 $count(%cpro.badnicks,$chr(44)) + 1
  :start1
  inc %cpro.tempcount1
  did -a gtzakickextra 142 $gettok(%cpro.badnicks,%cpro.tempcount1,44)
  if ( %cpro.tempcount1 >= %cpro.tempreal1 ) { halt }
  goto start1
}

on 1:dialog:gtzakickextra:edit:*: {
  if ( $did = 124 ) { set %cpro.maxclones $did(124).text }
  if ( $did = 126 ) { set %cpro.maxcodes $did(126).text }
  if ( $did = 128 ) { set %cpro.lenmax $did(128).text }
  if ( $did = 130 ) { set %cpro.maxcaps $did(130).text }
  if ( $did = 134 ) { set %cpro.word.temp $did(134).text }
  if ( $did = 142 ) { set %cpro.nick.temp $did(142).text }
}

on 1:dialog:gtzakickextra:sclick:*: {
  if ( $did = 131 ) { defextragtz }
  if ( $did = 137 ) {
    set %cpro.swearwords $addtok(%cpro.swearwords,%cpro.word.temp,44)
    did -r gtzakickextra 134
    set %cpro.tempcount 0
    set %cpro.tempreal $count(%cpro.swearwords,$chr(44)) + 1
    :start
    inc %cpro.tempcount
    did -a gtzakickextra 134 $gettok(%cpro.swearwords,%cpro.tempcount,44)
    if ( %cpro.tempcount >= %cpro.tempreal ) { halt }
    goto start
  }
  if ( $did = 138 ) {
    set %cpro.swearwords $remtok(%cpro.swearwords,%cpro.word.temp,44)
    did -r gtzakickextra 134
    set %cpro.tempcount 0
    set %cpro.tempreal $count(%cpro.swearwords,$chr(44)) + 1
    :start
    inc %cpro.tempcount
    did -a gtzakickextra 134 $gettok(%cpro.swearwords,%cpro.tempcount,44)
    if ( %cpro.tempcount >= %cpro.tempreal ) { halt }
    goto start
  }
  if ( $did = 134 ) { set %cpro.word.temp $did(134).text }
  if ( $did = 139 ) { set %cpro.swearwords "" | did -r gtzakickextra 134 }
  if ( $did = 143 ) {
    set %cpro.badnicks $addtok(%cpro.badnicks,%cpro.nick.temp,44)
    did -r gtzakickextra 142
    set %cpro.tempcount 0
    set %cpro.tempreal $count(%cpro.badnicks,$chr(44)) + 1
    :start
    inc %cpro.tempcount
    did -a gtzakickextra 142 $gettok(%cpro.badnicks,%cpro.tempcount,44)
    if ( %cpro.tempcount >= %cpro.tempreal ) { halt }
    goto start
  }
  if ( $did = 144 ) {
    set %cpro.badnicks $remtok(%cpro.badnicks,%cpro.nick.temp,44)
    did -r gtzakickextra 142
    set %cpro.tempcount 0
    set %cpro.tempreal $count(%cpro.badnicks,$chr(44)) + 1
    :start
    inc %cpro.tempcount
    did -a gtzakickextra 142 $gettok(%cpro.badnicks,%cpro.tempcount,44)
    if ( %cpro.tempcount >= %cpro.tempreal ) { halt }
    goto start
  }
  if ( $did = 142 ) { set %cpro.nick.temp $did(142).text }
  if ( $did = 145 ) { set %cpro.badnicks "" | did -r gtzakickextra 142 }
}
alias defextragtz {
  set %cpro.maxclones 3 | did -r gtzakickextra 124 | did -a gtzakickextra 124 %cpro.maxclones
  set %cpro.maxcodes 25 | did -r gtzakickextra 126 | did -a gtzakickextra 126 %cpro.maxcodes
  set %cpro.lenmax 350 | did -r gtzakickextra 128 | did -a gtzakickextra 128 %cpro.lenmax
  set %cpro.maxcaps 40 | did -r gtzakickextra 130 | did -a gtzakickextra 130 %cpro.maxcaps
  set %cpro.swearwords fuck,bitch,biatch,asshole,whore,prick,bastard,horney,horny,orgasm,orgy,pussy,cunt,cock,slut 
  did -r gtzakickextra 134
  set %cpro.tempcount 0
  set %cpro.tempreal $count(%cpro.swearwords,$chr(44)) + 1
  :start
  inc %cpro.tempcount
  did -a gtzakickextra 134 $gettok(%cpro.swearwords,%cpro.tempcount,44)
  if ( %cpro.tempcount >= %cpro.tempreal ) { goto alrite }
  goto start
  :alrite
  set %cpro.badnicks fuck,bitch,biatch,asshole,whore,prick,bastard,horney,horny,orgasm,orgy,pussy,cunt,cock,slut,pimp,nigger,nigga
  did -r gtzakickextra 142
  set %cpro.tempcount1 0
  set %cpro.tempreal1 $count(%cpro.badnicks,$chr(44)) + 1
  :start1
  inc %cpro.tempcount1
  did -a gtzakickextra 142 $gettok(%cpro.badnicks,%cpro.tempcount1,44)
  if ( %cpro.tempcount1 >= %cpro.tempreal1 ) { halt }
  goto start1
}

on 1:JOIN:#: {
  if ( $me !isop $chan ) { goto end }
  if ( %cpro.badnick == ON ) {
    if ( $istok(%cpro.channelbadnick,all,44) == $true ) { goto badnick }
    elseif ( $istok(%cpro.channelbadnick,$chan,44) == $true ) { goto badnick } 
    elseif ( $istok(%cpro.channelbadnick,$chan,44) == $false ) { goto clones }
    else { goto clones }
    :badnick
    set %cpro.temp.count.swear 0
    set %cpro.temp.real $count(%cpro.badnicks,$chr(44)) + 1
    :badnickstart
    inc %cpro.temp.count.swear
    if ( $gettok(%cpro.badnicks,%cpro.temp.count.swear,44) isin $nick ) {
      if ( $remove(%cpro.nickbad,-u) > 0 ) { mode $chan +b * $+ $nick $+ *!*@* }
      kick $chan $nick Unacceptable Nick - %name
      goto end
    }
    if ( %cpro.temp.count.swear >= %cpro.temp.real ) { unset %cpro.temp.count.swear | unset %cpro.temp.real | goto clones }
    if ( %cpro.temp.count.swear < %cpro.temp.real ) { goto badnickstart }
  }
  else { goto clones } 
  :clones
  if ( %cpro.clonekick == ON ) {
    if ( $ialchan($address($nick,2),$chan,0) > %cpro.maxclones ) {
      %cpro.clone.which = 0
      %cpro.clone.total = $ialchan($address($nick,2),$chan,0)
      goto clonelist
    }
    else { goto revolve }
  }
  else { goto revolve }
  :clonelist 
  inc %cpro.clone.which 1
  if ( %cpro.clone.which > %cpro.clone.total ) { goto cloneopcheck }
  else { 
    %cpro.clone.nicks = %cpro.clone.nicks $gettok($ialchan($address($nick,2),$chan,%cpro.clone.which),1,33)
    goto clonelist
  }
  :cloneopcheck
  %cpro.clone.which = 0
  %cpro.clone.total = $ialchan($address($nick,2),$chan,0)
  goto cloneopcheckloop
  :cloneopcheckloop
  inc %cpro.clone.which 1
  if ( %cpro.clone.which > %cpro.clone.total ) { goto clonekick }
  elseif ( $gettok($ialchan($address($nick,2),$chan,%cpro.clone.which),1,33) isop $chan ) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Opped Clones in $+ $cxs(1) $chan  $+ $cxs(3) $+ : $+ $cxs(1) %cpro.clone.nicks  $+ $cxs(3) $+ ( $+ $cxs(1) $+ $gettok($address($nick,2),2,64) $+  $+ $cxs(3) $+ ) | goto revolve }
  else { goto cloneopcheckloop }
  :clonekick
  if ( $istok(%cpro.channelclone,all,44) == $true ) { goto clonekick2 }
  elseif ( $istok(%cpro.channelclone,$chan,44) == $true ) { goto clonekick2 }
  elseif ( $istok(%cpro.channelclone,$chan,44) == $false ) { goto end }
  :clonekick2
  if ( $nick ison $chan ) && ( $nick !isop $chan ) && ( $remove(%cpro.bantime,-u) > 0 ) { ban %cpro.clonetime $chan $nick 2 }
  if ( $nick ison $chan ) && ( $nick !isop $chan ) { kick $chan $nick Clones Detected %cpro.clone.nicks ( $+ $gettok($address($nick,2),2,64) $+ ) - %name }
  else { goto end }
  goto end
  :revolve
  if ( %cpro.rdoor = ON ) {
    if ( %cpro.revolve. [ $+ [ $wildsite ] ] == $null ) { set %cpro.revolve. [ $+ [ $wildsite ] ] 1 | .timer 1 5 unset %cpro.revolve. [ $+ [ $wildsite ] ] | goto end }
    elseif ( %cpro.revolve. [ $+ [ $wildsite ] ] isnum 1-3 ) { inc %cpro.revolve. [ $+ [ $wildsite ] ] 1 | .timer 1 5 unset %cpro.revolve. [ $+ [ $wildsite ] ] | goto end }
    elseif ( %cpro.revolve. [ $+ [ $wildsite ] ] == 4 ) {
      if ( $istok(%cpro.channelrevolv,all,44) == $true ) { goto revolvekick }
      elseif ( $istok(%cpro.channelrevolv,$chan,44) == $true ) { goto revolvekick }
      elseif ( $istok(%cpro.channelrevolv,$chan,44) == $false ) { goto end }
      :revolvekick
      if ( $remove(%cpro.bantime,-u) > 0 ) { ban %cpro.revolvtime $chan $nick 2 }
      .timer 1 05 if ( $nick ison $chan ) { kick $chan $nick Revolving Door Flood - %name
        unset %cpro.revolve. [ $+ [ $wildsite ] ] 
        goto end 
      }
      else { goto end }
    } 
    :end
    unset %cpro.clone.*
  }
}
on 3:PART:#: {
  if ( $me !isop $chan ) { goto end }
  if ( %cpro.rdoor == ON ) {
    if ( $istok(%cpro.channelrevolv,all,44) == $true ) { goto ana }
    elseif ( $istok(%cpro.channelrevolv,$chan,44) == $true ) { goto ana }
    elseif ( $istok(%cpro.channelrevolv,$chan,44) == $false ) { goto end }
    :ana
    if ( %cpro.revolve. [ $+ [ $wildsite ] ] == $null ) { set %cpro.revolve. [ $+ [ $wildsite ] ] 1 | .timer 1 5 unset %cpro.revolve. [ $+ [ $wildsite ] ] | goto end }
    elseif ( %cpro.revolve. [ $+ [ $wildsite ] ] isnum 1-3 ) { inc %cpro.revolve. [ $+ [ $wildsite ] ] 1 | .timer 1 5 unset %cpro.revolve. [ $+ [ $wildsite ] ] | goto end }
    elseif ( %cpro.revolve. [ $+ [ $wildsite ] ] == 4 ) { 
      if ( $remove(%cpro.bantime,-u) > 0 ) { ban %cpro.revolvtime $chan $nick 2 }
      .timer 1 05 if ( $nick ison $chan ) { kick $chan $nick Revolving Door Flood - %name }
      unset %cpro.revolve. [ $+ [ $wildsite ] ] 
      goto end 
    }
    else { goto end } 
  }
  else { goto end }
  :end
}
on 1:NICK: {
  if ( %cpro.badnick == ON ) { goto badnick }
  else { goto nickflood }
  :badnick
  set %cpro.temp.count.nick 0
  set %cpro.temp.real1 $count(%cpro.badnicks,$chr(44)) + 1
  :badnickstart
  inc %cpro.temp.count.nick
  if ( $gettok(%cpro.badnicks,%cpro.temp.count.nick,44) isin $newnick ) {
    set %cpro.badnick.total $comchan($newnick,0)
    set %cpro.badnick.which 0
    goto { kicknick }
  }
  if ( %cpro.temp.count.nick >= %cpro.temp.real1 ) { unset %cpro.temp.count.nick | unset %cpro.temp.real1 | goto nickflood }
  if ( %cpro.temp.count.nick < %cpro.temp.real1 ) { goto badnickstart }
  else { goto nickflood }
  :kicknick
  if ( %cpro.badnick.which > %cpro.badnick.total ) { goto end }
  else {
    inc %cpro.badnick.which 1
    if ( $me isop $comchan($newnick,%cpro.badnick.which)) && ( $newnick !isop $comchan($newnick,%cpro.badnick.which)) {
      inc %cpro.knum 1
      set %cpro.chancom $comchan($newnick,%cpro.badnick.which))
      if ( $istok(%cpro.channelbadnick,all,44) == $true ) { goto ana1 }
      elseif ( $istok(%cpro.channelbadnick,%cpro.chancom,44) == $true ) { goto ana1 }
      elseif ( $istok(%cpro.channelbadnick,%cpro.chancom,44) == $false ) { goto kicknick }
      :ana1
      if ( $remove(%cpro.nickbad,-u) > 0 ) { mode $comchan($newnick,%cpro.badnick.which)) +b * $+ $newnick $+ *!*@* }
      kick $comchan($newnick,%cpro.badnick.which)) $nick Unacceptable Nick Change - %name
      goto kicknick
    } 
    else { goto kicknick } 
  }
  :nickflood
  if (( %cpro.nickflood [ $+ [ $wildsite ] ] == $null ) && ( %cpro.nickflood == ON )) { set %cpro.nickflood [ $+ [ $wildsite ] ] 1 | .timer 1 5 unset %cpro.nickflood [ $+ [ $wildsite ] ] | goto end }
  elseif (( %cpro.nickflood [ $+ [ $wildsite ] ] >= 1 ) && ( %cpro.nickflood [ $+ [ $wildsite ] ] <= 2 ) && ( %cpro.nickflood == ON )) { inc %cpro.nickflood [ $+ [ $wildsite ] ] 1 | .timer 1 5 unset %cpro.nickflood [ $+ [ $wildsite ] ] | goto end }
  elseif (( %cpro.nickflood [ $+ [ $wildsite ] ] == 3 ) && ( %cpro.nickflood == ON )) { 
    set %cpro.floodnick.total $comchan($newnick,0)
    set %cpro.floodnick.which 0
    goto { floodkick }
  }
  else { goto end }
  :floodkick
  if ( %cpro.floodnick.which > %cpro.floodnick.total ) { goto end }
  else {
    inc %cpro.floodnick.which 1
    if ( $me isop $comchan($newnick,%cpro.floodnick.which)) && ( $newnick !isop $comchan($newnick,%cpro.floodnick.which)) {
      inc %cpro.knum 1
      set %cpro.chancom $comchan($newnick,%cpro.floodnick.which))
      if ( $istok(%cpro.channelnickflood,all,44) == $true ) { goto ana2 }
      elseif ( $istok(%cpro.channelnickflood,%cpro.chancom,44) == $true ) { goto ana2 }
      elseif ( $istok(%cpro.channelnickflood,%cpro.chancom,44) == $false ) { goto floodkick }
      :ana2
      if ( $remove(%cpro.nickfloodban,-u) > 0 ) { mode $comchan($newnick,%cpro.floodnick.which)) +b $wildsite | .timer 1 $remove(%cpro.nickfloodban,-u) mode $comchan($newnick,%cpro.floodnick.which)) -b $wildsite  }
      kick $comchan($newnick,%cpro.floodnick.which)) $nick Nick Flood - %name
      goto floodkick
    } 
    else { goto floodkick } 
  }
  :end
  unset %cpro.badnick.*
  unset %cpro.floodnick.*
}
on 1:INVITE:#: {
  if ( %cpro.invite == ON ) { 
    set %cpro.invite.total $comchan($nick,0)
    set %cpro.invite.which 0  
    goto invite 
  }
  else { goto end }
  :invite
  if ( %cpro.invite.which > %cpro.invite.total ) { goto end }
  else {
    inc %cpro.invite.which 1
    if ( $me isop $comchan($nick,%cpro.invite.which)) && ( $nick !isop $comchan($nick,%cpro.invite.which)) {
      inc %cpro.knum 1
      set %cpro.chancom $comchan($nick,%cpro.invite.which))
      if ( $istok(%cpro.channelmass,all,44) == $true ) { goto ana3 }
      elseif ( $istok(%cpro.channelmass,%cpro.chancom,44) == $true ) { goto ana3 }
      elseif ( $istok(%cpro.channelmass,%cpro.chancom,44) == $false ) { goto invite }
      :ana3
      if ( $remove(%cpro.massban1,-u) > 0 ) { ban %cpro.massban $comchan($nick,%cpro.invite.which)) $nick 2 }
      kick $comchan($nick,%cpro.invite.which)) $nick Mass Invite - %name
      goto invite
    }
    else { goto invite } 
  }
  :end
  unset %cpro.invite.*
}
on 1:NOTICE:*:#: {
  if ( $nick isop $chan ) || ( $me !isop $chan ) || ($nick !ison $chan) { goto end }
  if ( %cpro.ad1 isin $strip($1-)) || ( %cpro.ad2 isin $strip($1-)) || ( %cpro.ad3 isin $strip($1-)) || ( %cpro.ad4 isin $strip($1-)) || ( %cpro.ad5 isin $strip($1-)) || ( %cpro.ad6 isin $strip($1-)) && ( $chan !isin $strip($1-)) && ( %cpro.advertise == ON ) {
    if ( $istok(%cpro.channeladver,all,44) == $true ) { goto ana1 }
    elseif ( $istok(%cpro.channeladver,%cpro.chancom,44) == $true ) { goto ana1 }
    elseif ( $istok(%cpro.channeladver,%cpro.chancom,44) == $false ) { goto end}
      :ana1
      if ( $remove(%cpro.adverban,-u) > 0 ) { ban %cpro.adverban $chan $nick 2 }
      kick $chan $nick Mass Notice Advertising - %name
      goto end
    }
  }
  else { goto massn }
  :massn
  if ($nick isop $chan) || (%cpro.MassN == OFF) || ($me !isop $chan ) || ( $nick == ChanServ ) || ( $nick == NickServ ) || ( $nick == MemoServ ) || ( $nick isvo $chan ) { return } else {
    if ( $istok(%cpro.channelmassn,all,44) == $true ) { goto ana7 }
    elseif ( $istok(%cpro.channelmassn,$chan,44) == $true ) { goto ana7 }
    elseif ( $istok(%cpro.channelmassn,$chan,44) == $false ) { goto end }
    :ana7
    ban %cpro.massnban $chan $nick 2 | kick $chan $nick Mass Notice - %name
  }
  :end
}
on 1:TEXT:*:#: {
  if ( $nick isop $chan ) || ( $me !isop $chan ) { goto end }
  else { goto swear }
  :swear
  set %cpro.temp.count.swear 0
  set %cpro.temp.real $count(%cpro.swearwords,$chr(44)) + 1
  :swearstart
  inc %cpro.temp.count.swear
  if ( $gettok(%cpro.swearwords,%cpro.temp.count.swear,44) isin $strip($1-) ) && ( %cpro.swear == ON ) && ( .wav !isin $strip($1-)) {
    if ( $istok(%cpro.channelswear,all,44) == $true ) { goto ana1 }
    elseif ( $istok(%cpro.channelswear,$chan,44) == $true ) { goto ana1 }
    elseif ( $istok(%cpro.channelswear,$chan,44) == $false ) { goto advertise }
    :ana1
    if ( $remove(%cpro.langban,-u) > 0 ) { ban %cpro.langban $chan $nick 2 }
    kick $chan $nick Offensive Language - %name
    goto end
  }
  if ( %cpro.temp.count.swear >= %cpro.temp.real ) { unset %cpro.temp.count.swear | unset %cpro.temp.real | goto advertise }
  if ( %cpro.temp.count.swear < %cpro.temp.real ) { goto swearstart }
  :advertise
  if ( %cpro.ad1 isin $strip($1-)) || ( %cpro.ad2 isin $strip($1-)) || ( %cpro.ad3 isin $strip($1-)) || ( %cpro.ad4 isin $strip($1-)) || ( %cpro.ad5 isin $strip($1-)) || ( %cpro.ad6 isin $strip($1-)) || ( %cpro.ad7 isin $strip($1-)) && ( $chan !isin $strip($1-)) && ( %cpro.advertise == ON ) {
    if ( $istok(%cpro.channeladver,all,44) == $true ) { goto ana2 }
    elseif ( $istok(%cpro.channeladver,$chan,44) == $true ) { goto ana2 }
    elseif ( $istok(%cpro.channeladver,$chan,44) == $false ) { goto longtext }
    :ana2
    if ( $remove(%cpro.adverban,-u) > 0 ) { ban %cpro.adverban $chan $nick 2 }
    kick $chan $nick Channel Advertising - %name
    goto end     
  }
  else { goto longtext }
  :longtext
  if ( $len($strip($1-)) >= %cpro.lenmax ) && ( %cpro.longtext == ON ) {
    if ( $istok(%cpro.channellongtxt,all,44) == $true ) { goto ana3 }
    elseif ( $istok(%cpro.channellongtxt,$chan,44) == $true ) { goto ana3 }
    elseif ( $istok(%cpro.channellongtxt,$chan,44) == $false ) { goto ccodes }
    :ana3
    if ( $remove(%cpro.longtxtban,-u) > 0 ) { ban %cpro.longtxtban $chan $nick 2 }
    kick $chan $nick Long Text Flood - %name
    goto end
  } 
  else { goto ccodes }
  :ccodes
  if ( %cpro.ccodes == ON ) {
    if ( $istok(%cpro.channelccodes,all,44) == $true ) { goto ana4 }
    elseif ( $istok(%cpro.channelccodes,$chan,44) == $true ) { goto ana4 }
    elseif ( $istok(%cpro.channelccodes,$chan,44) == $false ) { goto caps }
    :ana4
    %cpro.ccodes.text = $1-
    %cpro.ccodes.total = $count(%cpro.ccodes.text,)
    %cpro.ccodes.total = $calc(%cpro.ccodes.total + $count(%cpro.ccodes.text,))
    %cpro.ccodes.total = $calc(%cpro.ccodes.total + $count(%cpro.ccodes.text,))
    %cpro.ccodes.total = $calc(%cpro.ccodes.total + $count(%cpro.ccodes.text,))
    if ( %cpro.ccodes.total > %cpro.maxcodes ) {
      if ( $remove(%cpro.Excessiveban,-u) > 0 ) { ban %cpro.Excessiveban $chan $nick 2 }
      kick $chan $nick Excessive Ctrl Codes - %name
      unset %cpro.ccodes.*
      goto end
    }
    else { unset %cpro.ccodes.* | goto caps }
  }
  else { goto caps }
  :caps
  if ( %cpro.caps == ON ) {
    if ( $istok(%cpro.channelcaps,all,44) == $true ) { goto ana5 }
    elseif ( $istok(%cpro.channelcaps,$chan,44) == $true ) { goto ana5 }
    elseif ( $istok(%cpro.channelcaps,$chan,44) == $false ) { goto repeat }
    :ana5
    .set %cpro.caps.len $len($strip($1-))
    .set %cpro.caps.num 0
    .set %cpro.caps.check 0
    :capscheck
    .inc %cpro.caps.check 1
    if ( %cpro.caps.num >= %cpro.maxcaps ) { goto capskick }
    if ( %cpro.caps.check >= %cpro.caps.len ) { goto capsdone }
    if $asc($mid(%cpro.caps.check, 1, $strip($1-))) isnum 65-90 { inc %cpro.caps.num 1 }
    goto capscheck
    :capskick
    if ( %cpro.capswarn. [ $+ [ $chan [ $+ [ $nick ] ] ] ] == YES ) {
      if ( $remove(%cpro.capban,-u) > 0 ) { ban %cpro.capban $chan $nick 2 }
      kick $chan $nick Excessive Caps - %name
      .unset %cpro.caps.*
      .unset %cpro.capswarn. [ $+ [ $chan [ $+ [ $nick ] ] ] ]
      halt
    }
    else {
      .set %cpro.capswarn. [ $+ [ $chan [ $+ [ $nick ] ] ] ] YES
      .timer 1 600 unset %cpro.capswarn. [ $+ [ $chan [ $+ [ $nick ] ] ] ]
      .unset %cpro.caps.*
    }
  }
  else goto repeat
  :capsdone
  .unset %cpro.caps.*
  :repeat
  if (( %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ] = $null ) && ( %cpro.repeat == ON )) { set %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ] $strip($1-) | /.timer 1 5 unset %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ] | goto flood }
  elseif (( %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ] == $strip($1-)) && ( %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ] == $null ) && ( %cpro.repeat == ON )) { set %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ] $strip($1-) | /.timer 1 5 unset %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ] | goto flood }
  elseif (( %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ] == $strip($1-)) && ( %cpro.repeat == ON )) { 
    inc %cpro.knum 1 
    if (( $istok(%cpro.channelrepeat,all,44) == $true ) && ( $me isop $chan )) { goto ana6 } 
    elseif (( $istok(%cpro.channelrepeat,$chan,44) == $true ) && ( $me isop $chan )) { goto ana6 }
    elseif ( $istok(%cpro.channelrepeat,$chan,44) == $false ) { goto flood }
    :ana6
    if ( $remove(%cpro.repeatban,-u) > 0 ) { ban %cpro.repeatban $chan $nick 2 }
    kick $chan $nick Repeat Flood - %name
    unset %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ]
    unset %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ]
    goto end 
  }
  else { goto flood }
  :flood
  if (( %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] == $null ) && ( %cpro.flood == ON )) { set %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] 1 | .timer 1 7 unset %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] | goto end }
  elseif (( %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] >= 1 ) && ( %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] <= 5 ) && ( %cpro.flood == ON )) { inc %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] 1 | .timer 1 7 unset %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] | goto end }
  elseif ( %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] >= 6 ) {
    inc %cpro.knum 1 
    if (( $istok(%cpro.channelflood,all,44) == $true ) && ( $me isop $chan )) { goto ana7 }
    elseif (( $istok(%cpro.channelflood,$chan,44) == $true ) && ( $me isop $chan )) { goto ana7 }
    elseif ( $istok(%cpro.channelflood,$chan,44) == $false ) { goto end }
    :ana7
    if ( $remove(%cpro.floodban,-u) > 0 ) { ban %cpro.floodban $chan $nick 2 }
    kick $chan $nick Text Flood - %name
    unset %cpro.floodcheck [ $+ [ $nick [ $+ [ $chan ] ] ] ]
    goto end 
    else { goto end }
    :end
  }   
}
on 1:ACTION:*slaps*trout*:#: {
  if ( $nick isop $chan ) || ( $me !isop $chan ) { goto end }
  elseif ( %cpro.troutslap == ON ) && ( $me isin $strip($1-)) {
    if (( $istok(%cpro.channelslap,all,44) == $true ) && ( $me isop $chan )) { goto ana }
    elseif ( $istok(%cpro.channelslap,$chan,44) == $true ) && ( $me isop$chan )) { goto ana }
    elseif ( $istok(%cpro.channelslap,$chan,44) == $false ) { goto end } 
    :ana  
    if ( $remove(%cpro.troutban,-u) > 0 ) { ban %cpro.troutban $chan $nick 2 }
    kick $chan $nick Trout Slap - %name
    goto end
  }
  else { goto end }
  :end
}
on 1:ACTION:*:#: {
  if (( $nick isop $chan ) || ( $me !isop $chan )) { goto end }
  else { goto swear }
  :swear
  set %cpro.temp.count.swear 0
  set %cpro.temp.real $count(%cpro.swearwords,$chr(44)) + 1
  :swearstart
  inc %cpro.temp.count.swear
  if ( $gettok(%cpro.swearwords,%cpro.temp.count.swear,44) isin $strip($1-) ) && ( %cpro.swear == ON ) && ( .wav !isin $strip($1-)) {
    if ( $istok(%cpro.channelswear,all,44) == $true ) { goto ana1 }
    elseif ( $istok(%cpro.channelswear,$chan,44) == $true ) { goto ana1 }
    elseif ( $istok(%cpro.channelswear,$chan,44) == $false ) { goto advertise }
    :ana1
    if ( $remove(%cpro.langban,-u) > 0 ) { ban %cpro.langban $chan $nick 2 }
    kick $chan $nick Offensive Language - %name
    goto end
  }
  if ( %cpro.temp.count.swear >= %cpro.temp.real ) { unset %cpro.temp.count.swear | unset %cpro.temp.real | goto advertise }
  if ( %cpro.temp.count.swear < %cpro.temp.real ) { goto swearstart }
  :advertise
  if ( %cpro.ad1 isin $strip($1-)) || ( %cpro.ad2 isin $strip($1-)) || ( %cpro.ad3 isin $strip($1-)) || ( %cpro.ad4 isin $strip($1-)) || ( %cpro.ad5 isin $strip($1-)) || ( %cpro.ad6 isin $strip($1-)) || ( %cpro.ad7 isin $strip($1-)) && ( $chan !isin $strip($1-)) && ( %cpro.advertise == ON ) {
    if ( $istok(%cpro.channeladver,all,44) == $true ) { goto ana2 }
    elseif ( $istok(%cpro.channeladver,$chan,44) == $true ) { goto ana2 }
    elseif ( $istok(%cpro.channeladver,$chan,44) == $false ) { goto longtext }
    :ana2
    if ( $remove(%cpro.adverban,-u) > 0 ) { ban %cpro.adverban $chan $nick 2 }
    kick $chan $nick Channel Advertising - %name
    goto end     
  }
  else { goto longtext }
  :longtext
  if ( $len($strip($1-)) >= %cpro.lenmax ) && ( %cpro.longtext == ON ) {
    if ( $istok(%cpro.channellongtxt,all,44) == $true ) { goto ana3 }
    elseif ( $istok(%cpro.channellongtxt,$chan,44) == $true ) { goto ana3 }
    elseif ( $istok(%cpro.channellongtxt,$chan,44) == $false ) { goto ccodes }
    :ana3
    if ( $remove(%cpro.longtxtban,-u) > 0 ) { ban %cpro.longtxtban $chan $nick 2 }
    kick $chan $nick Long Text Flood - %name
    goto end
  } 
  else { goto ccodes }
  :ccodes
  if ( %cpro.ccodes == ON ) {
    if ( $istok(%cpro.channelccodes,all,44) == $true ) { goto ana4 }
    elseif ( $istok(%cpro.channelccodes,$chan,44) == $true ) { goto ana4 }
    elseif ( $istok(%cpro.channelccodes,$chan,44) == $false ) { goto caps }
    :ana4
    %cpro.ccodes.text = $1-
    %cpro.ccodes.total = $count(%cpro.ccodes.text,)
    %cpro.ccodes.total = $calc(%cpro.ccodes.total + $count(%cpro.ccodes.text,))
    %cpro.ccodes.total = $calc(%cpro.ccodes.total + $count(%cpro.ccodes.text,))
    %cpro.ccodes.total = $calc(%cpro.ccodes.total + $count(%cpro.ccodes.text,))
    if ( %cpro.ccodes.total > %cpro.maxcodes ) {
      if ( $remove(%cpro.Excessiveban,-u) > 0 ) { ban %cpro.Excessiveban $chan $nick 2 }
      kick $chan $nick Excessive Ctrl Codes - %name
      unset %cpro.ccodes.*
      goto end
    }
    else { unset %cpro.ccodes.* | goto caps }
  }
  else { goto caps }
  :caps
  if ( %cpro.caps == ON ) {
    if ( $istok(%cpro.channelcaps,all,44) == $true ) { goto ana5 }
    elseif ( $istok(%cpro.channelcaps,$chan,44) == $true ) { goto ana5 }
    elseif ( $istok(%cpro.channelcaps,$chan,44) == $false ) { goto repeat }
    :ana5 
    .set %cpro.caps.len $len($strip($1-))
    .set %cpro.caps.num 0
    .set %cpro.caps.check 0
    :capscheck
    .inc %cpro.caps.check 1
    if ( %cpro.caps.num >= %cpro.maxcaps ) { goto capskick }
    if ( %cpro.caps.check >= %cpro.caps.len ) { goto capsdone }
    if $asc($mid(%cpro.caps.check, 1, $strip($1-))) isnum 65-90 { inc %cpro.caps.num 1 }
    goto capscheck
    :capskick
    if ( %cpro.capswarn. [ $+ [ $chan [ $+ [ $nick ] ] ] ] == YES ) {
      if ( $remove(%cpro.capban,-u) > 0 ) { ban %cpro.capban $chan $nick 2 }
      kick $chan $nick Excessive Caps - %name
      .unset %cpro.caps.*
      .unset %cpro.capswarn. [ $+ [ $chan [ $+ [ $nick ] ] ] ]
      halt
    }
    else {
      .set %cpro.capswarn. [ $+ [ $chan [ $+ [ $nick ] ] ] ] YES
      .timer 1 600 unset %cpro.capswarn. [ $+ [ $chan [ $+ [ $nick ] ] ] ]
      .unset %cpro.caps.*
    }
    else { goto repeat }
    :capsdone
    .unset %cpro.caps.*
  }
  :repeat
  if (( %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ] = $null ) && ( %cpro.repeat == ON )) { set %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ] $strip($1-) | /.timer 1 5 unset %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ] | goto flood }
  elseif (( %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ] == $strip($1-)) && ( %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ] == $null ) && ( %cpro.repeat == ON )) { set %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ] $strip($1-) | /.timer 1 5 unset %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ] | goto flood }
  elseif (( %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ] == $strip($1-)) && ( %cpro.repeat == ON )) { 
    inc %cpro.knum 1 
    if ( $istok(%cpro.channelrepeat,all,44) == $true ) { goto ana6 }
    elseif ( $istok(%cpro.channelrepeat,$chan,44) == $true ) { goto ana6 }
    elseif ( $istok(%cpro.channelrepeat,$chan,44) == $false ) { goto flood }
    :ana6
    if ( $remove(%cpro.repeatban,-u) > 0 ) { ban %cpro.repeatban $chan $nick 2 }
    kick $chan $nick Repeat Flood - %name
    unset %cpro.lineone [ $+ [ $chan $+ - $+ [ $nick ] ] ]
    unset %cpro.line2 [ $+ [ $chan $+ - $+ [ $nick ] ] ]
    goto end 
  }
  else { goto flood }
  :flood
  if (( %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] == $null ) && ( %cpro.flood == ON )) { set %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] 1 | .timer 1 5 unset %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] | goto end }
  elseif (( %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] >= 1 ) && ( %cpro.flood == ON ) && ( %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] <= 5 )) { inc %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] 1 | .timer 1 5 unset %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] | goto end }
  elseif (( %cpro.floodcheck [ $+ [ $chan $+ - $+ [ $nick ] ] ] == 6 ) && ( %cpro.flood == ON )) {
    inc %cpro.knum 1 
    if ( $istok(%cpro.channelflood,all,44) == $true ) { goto ana7 }
    elseif ( $istok(%cpro.channelflood,$chan,44) == $true ) { goto ana7 }
    elseif ( $istok(%cpro.channelflood,$chan,44) == $false ) { goto end }
    :ana7
    if ( $remove(%cpro.floodban,-u) > 0 ) { ban %cpro.floodban $chan $nick 2 }
    kick $chan $nick Text Flood - %name
    unset %cpro.floodcheck [ $+ [ $nick [ $+ [ $chan ] ] ] ]
    goto end 
  }
  else { goto end }
  :end
}
on @1:TEXT:*:#: {
  if ( $nick isop $chan ) { goto end }
  :arabic
  if ( æ isin $strip($1-)) || ( Ê isin $strip($1-)) || ( Ô isin $strip($1-)) || ( Ï isin $strip($1-)) || ( ã isin $strip($1-)) || ( Ç isin $strip($1-)) || ( Ó isin $strip($1-)) && ( %cpro.arabkicker == ON ) && ( .wav !isin $strip($1-)) {
    if ( $istok(%cpro.channelarabic,all,44) == $true ) { goto ana1 }
    elseif ( $istok(%cpro.channelarabic,$chan,44) == $true ) { goto ana1 }
    elseif ( $istok(%cpro.channelarabic,$chan,44) == $false ) { goto end }
    :ana1
    if ( $remove(%cpro.araban,-u) > 0 ) { ban %cpro.araban $chan $nick 2 }
    kick $chan $nick English Fonts Only - %name
    goto end
  }
  :end
}
#channelprv on
on 1:OPEN:?: {
  if ( $nick !isop $comchan($nick,1)) && ( $me isop $comchan($nick,1)) && (( $chr(35) isin $1- ) {
    .timer 1 3 ban $comchan($nick,1)) $nick $+ !*@*
    .timer 1 3 kick $comchan($nick,1)) $nick Private Advertising - %name
  }
}
#channelprv end
on *:join:#: {
  if ( $nick == $me ) && ( %cpro.prvkick == ON ) {
    echo -a $cxs(3) $+  $+ %xsbrack $cxs(1) $nick  $+ $cxs(2) $+ checking for private invitors... 
    .timer 1 10 /echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Done checking for private invitors
    /enable #channelprv
    .timer333 1 10 /disable #channelprv
    else { goto start }
  }
  :start
  if ($nick == $me) && ( %cpro.prvnkick == ON ) { .timer 1 0 /enable #noticecheck | .timer 1 10 /disable #noticecheck | .timer 1 10 /echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Done checking for notice lamers | /echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Checking notice lamers }
}
#noticecheck on
on 1:NOTICE:*:*: {
  set %cpro.channelnoticenow $comchan($nick,1))
  if ( DCC isin $1- ) { goto end }
  if ($me isop $comchan($nick,1)) && ($nick !isop $comchan($nick,1)) { 
    if ( $istok(%cpro.channelprvn,all,44) == $true ) { goto kick }
    elseif ( $istok(%cpro.channelprvn,%cpro.channelnoticenow,44) == $true ) { goto kick } 
    elseif ( $istok(%cpro.channelprvn,%cpro.channelnoticenow,44) == $false ) { halt }
    :kick
    ban %cpro.noticeban $comchan($nick,1) $nick 2
    .timer 1 5 kick $comchan($nick,1) $nick Notice Greeting - %name
  }
  else goto end
  :end
}
#noticecheck end


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
