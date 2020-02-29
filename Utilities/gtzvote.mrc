;___________________________________________
; Invincible by Xtry
; Vote Machine
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on 1:START:{ set %gtzvoting.stations CLOSED }

alias votebox {
  set %gtznooo 1
  set %gtzvote.chan $1
  dialog -md votebox votebox
}

alias VOTE {
  if ( %gtzvoting.stations != OPEN ) {
    set %gtzstatusindex 53
    set %gtzmakeSure 0
    if ($did(votebox,32).state == 1) { set %gtzmyVote abs }
    if ($did(votebox,33).state == 1) { set %gtzmyVote yes }
    if ($did(votebox,34).state == 1) { set %gtzmyVote no }
    if ($did(votebox,28).state == 1) { set %gtzhalfway 1 }
    else { set %gtzhalfway 0 }
    if ($did(votebox,29).state == 1) { set %gtzusecommand 1 }
    else { set %gtzusecommand 0 }
    set %gtzvote.chan $did(votebox,20)
    set %gtzvote.question $did(votebox,22)
    set %gtzbefore $calc(%gtztime / 2)
    set %gtzafter $calc(%gtztime / 2)
    set %gtzchoice1 $did(votebox,26)
    set %gtzchoice2 $did(votebox,35)
    _xmsg.c3 %gtzvote.chan (Vote Machine) Question : %gtzvote.question
    _xmsg.c3 %gtzvote.chan (Vote Machine) Answer : Type %gtzchoice1 or %gtzchoice2 on a single line.
    _xmsg.c3 %gtzvote.chan (Vote Machine) Time : %gtztime Secs remain for registering your vote.
    set %gtzvoting.stations OPEN
    .timer6 1 %gtzbefore halfway
    set %gtzvoted.agree 0
    set %gtzvoted.disagree 0
    set %gtzvoted.people 0
    if ( %gtzmyVote == yes ) {
      inc %gtzvoted.agree
      inc %gtzvoted.people
    }
    else if ( %gtzmyVote == no ) {
      inc %gtzvoted.disagree
      inc %gtzvoted.people
    }
  }
}

on *:TEXT:*Secs remain*vote*:{
  set %gtznotNow 1
  .timer 1 $1 set %gtznotNow 0
}

on 1:TEXT:%gtzchoice1:*:{
  if (%gtzvoting.stations == OPEN) {
    notice.p $nick (Vote Machine) You Voted %gtzchoice1
    .auser 2 $wildsite
    inc %gtzvoted.people
    inc %gtzvoted.agree
    inc %gtzstatusindex
    if ( %gtzstatusindex > 57 ) { set %gtzstatusindex 54 | did -r votebox 54,55,56,57 1 }
    if ( %gtzmakeSure != 1 ) { did -o votebox %gtzstatusindex 1 $nick voted %gtzchoice1 | initialise }
  }
  else { notice.p $nick (Vote Machine) Vote stations are closed }
}

on 3:TEXT:*:*:{
  if (%gtzchoice1 isin $1) {
    notice.p $nick (Vote Machine) You Changed your vote to %gtzchoice1
    .auser 2 $wildsite
    inc %gtzvoted.agree
    dec %gtzvoted.disagree
    inc %gtzstatusindex
    if ( %gtzstatusindex > 57 ) { set %gtzstatusindex 54 | did -r votebox 54,55,56,57 1 }
    if ( %gtzmakeSure != 1 ) { did -o votebox %gtzstatusindex 1 $nick voted %gtzchoice1 | initialise }
  }
  if (%gtzchoice2 isin $1) { notice.p $nick (Vote Machine) You've already voted }
}

on 2:TEXT:*:*:{
  if (%gtzchoice2 isin $1) {
    notice.p $nick (Vote Machine) You Changed your vote to %gtzchoice2
    .auser 3 $wildsite
    dec %gtzvoted.agree
    inc %gtzvoted.disagree
    set %gtznick $nick
    inc %gtzstatusindex
    if ( %gtzstatusindex > 57 ) { set %gtzstatusindex 54 | did -r votebox 54,55,56,57 1 }
    if ( %gtzmakeSure != 1 ) { did -o votebox %gtzstatusindex 1 $nick voted %gtzchoice2 | initialise }
  }
  if (%gtzchoice1 isin $1) { notice.p $nick (Vote Machine) You've already voted }
}

on 1:TEXT:%gtzchoice2:*:{
  if (%gtzvoting.stations == OPEN) {
    notice.p $nick (Vote Machine) You voted %gtzchoice2
    .auser 3 $wildsite
    inc %gtzvoted.disagree
    inc %gtzvoted.people
    inc %gtzstatusindex
    if ( %gtzstatusindex > 57 ) { set %gtzstatusindex 54 | did -r votebox 54,55,56,57 1 }
    if ( %gtzmakeSure != 1 ) { did -o votebox %gtzstatusindex 1 $nick voted %gtzchoice2 | initialise }
  }
  else { notice.p $nick (Vote Machine) Vote stations are closed }
}
alias halfway {
  if ( %gtzhalfway == 1 ) {
    _xmsg.c3 %gtzvote.chan (Vote Machine) Closed : in %gtzafter Secs
    _xmsg.c3 %gtzvote.chan (Vote Machine) Question : %gtzvote.question
    _xmsg.c3 %gtzvote.chan (Vote Machine) Votes : %gtzchoice1 - %gtzvoted.agree
    _xmsg.c3 %gtzvote.chan (Vote Machine) Votes : %gtzchoice2 - %gtzvoted.disagree
  }
  .timer7 1 %gtzafter closed
}


alias closed {
  .rlevel 1
  .rlevel 2
  .rlevel 3
  set %gtzvoting.stations CLOSED
  set %gtzvote.perc.voted $calc((%gtzvoted.people / $nick(%gtzvote.chan,0)) * 100)
  set %gtzvoted.perc.agree $calc((%gtzvoted.agree / %gtzvoted.people) * 100)
  set %gtzvoted.perc.disagree $calc((%gtzvoted.disagree / %gtzvoted.people) * 100)
  _xmsg.c3 %gtzvote.chan (Vote Machine) Percentages : %gtzvote.perc.voted $+ % of  %gtzvote.chan voted.
  _xmsg.c3 %gtzvote.chan (Vote Machine) Total : %gtzchoice1 - %gtzvoted.agree ( $+ %gtzvoted.perc.agree $+ % $+ )
  _xmsg.c3 %gtzvote.chan (Vote Machine) Total : %gtzchoice2 - %gtzvoted.disagree ( $+ %gtzvoted.perc.disagree $+ % $+ )
  results 
}

alias results {
  if (%gtzvoted.agree > %gtzvoted.disagree) {
    _xmsg.c3 %gtzvote.chan (Vote Machine) Consensus : %gtzchoice1 on %gtzvote.question
    if (%gtzusecommand = 1) {
      %gtzvote.question
    }
  }
  if (%gtzvoted.agree < %gtzvoted.disagree) {
    _xmsg.c3 %gtzvote.chan (Vote Machine) Consensus : %gtzchoice2 on %gtzvote.question
  }
  if (%gtzvoted.agree == %gtzvoted.disagree) {
    _xmsg.c3 %gtzvote.chan (Vote Machine) Consensus : Equal on %gtzvote.question
  }
}

dialog votebox {
  title "Vote Machine"
  icon graph/vote.ico
  size -1 -1 129 144
  option dbu
  tab "Vote Section",202,2 0 124 125

  box "",19,5 13 118 48,tab 202
  box "",60,5 57 118 30,tab 202
  box "",61,5 83 118 20,tab 202

  edit "%gtzvote.chan",20,50 18 70 10,tab 202
  text "Vote Channel :",21,8 20 35 10,tab 202 autohs

  edit "",22,50 28 70 10,tab 202 autohs
  text "Vote Question :",23,8 30 37 10,tab 202

  edit "",24,50 38 30 10,tab 202
  text "Time Limit :",25,8 40 35 10,tab 202
  text "Secs",67,82 40 15 10,tab 202

  check "Enable mid-way tally",28,8 62 70 10,tab 202 group right
  check "Execute my vote string as a command",29,8 70 100 10,tab 202 group right
  text "if vote is agreed",30,17 78 50 10,tab 202

  edit "",26,50 48 30 10,tab 202
  edit "",35,90 48 30 10,tab 202
  text "Answer Options :",27,8 50 40 10,tab 202
  text "or",64, 82 50 7 10,tab 202

  text "My Own Vote :",31,8 92 40 10,tab 202
  radio "Abstain",32,50 90 23 10,tab 202 group push
  radio "Yes",33,73 90 23 10,tab 202 push
  radio "No",34,96 90 23 10,tab 202 push

  button "V&ote",102,50 108 35 12,tab 202
  box "",62,48 103 39 19,tab 202

  tab "Result Section",203
  box "",50,5 13 118 33,tab 203

  edit "%gtzchoice1",68,20 20 30 10,tab 203 autohs
  text ":",69,51 22 5 10,tab 203
  edit "%gtzvoted.agree",70,53 20 30 10,tab 203 autohs
  edit "%gtzvoted.perc.agree $+ %",71,83 20 25 10,tab 203
  edit "%gtzchoice2",72,20 32 30 10,tab 203 autohs
  text ":",73,51 34 5 10,tab 203
  edit "%gtzvoted.disagree",74,53 32 30 10,tab 203 autohs
  edit "%gtzvoted.perc.disagree $+ %",75,83 32 25 10,tab 203
  text %gtzchoice1 : %gtzvoted.agree,52,15 50 110 10,tab 203
  text %gtzchoice2 : %gtzvoted.disagree,53,15 60 110 10,tab 203
  text "",54,15 70 110 10,tab 203
  text "",55,15 80 110 10,tab 203
  text "",56,15 90 110 10,tab 203
  text "",57,15 100 110 8,tab 203

  button "&Apply",101,4 130 30 10
  box "",63,2 125 34 17
  button "&Close",120,94 130 30 10,ok
  box "",65,92 125 34 17
}

alias saveIt {
  if ($did(votebox,32).state == 1) { set %gtzmyVote abs }
  if ($did(votebox,33).state == 1) { set %gtzmyVote yes }
  if ($did(votebox,34).state == 1) { set %gtzmyVote no }
  if ($did(votebox,28).state == 1) { set %gtzhalfway 1 }
  else { set %gtzhalfway 0 }
  if ($did(votebox,29).state == 1) { set %gtzusecommand 1 }
  else { set %gtzusecommand 0 }
  set %gtzvote.chan $did(votebox,20)
  set %gtzvote.question $did(votebox,22)
  set %gtztime $did(votebox,24)
  set %gtzchoice1 $did(votebox,26)
  set %gtzchoice2 $did(votebox,35)
}

alias initialise {
  did -o votebox 68 1 %gtzchoice1
  did -o votebox 70 1 %gtzvoted.agree
  did -o votebox 71 1 %gtzvoted.perc.agree $+ %
  did -o votebox 72 1 %gtzchoice2
  did -o votebox 74 1 %gtzvoted.disagree
  did -o votebox 75 1 %gtzvoted.perc.disagree $+ %
  did -o votebox 20 1 %gtzvote.chan
  did -o votebox 22 1 %gtzvote.question
  did -o votebox 24 1 %gtztime
  did -o votebox 33 1 %gtzchoice1
  did -o votebox 34 1 %gtzchoice2
  did -o votebox 26 1 %gtzchoice1
  did -o votebox 35 1 %gtzchoice2
  set %gtznooo 0
  if ( %gtzhalfway == 1 ) { did -c votebox 28 }
  else { did -u votebox 28 }
  if ( %gtzusecommand == 1 ) { did -c votebox 29 }
  else { did -u votebox 29 }
  if ( %gtzmyVote == yes ) { did -c votebox 33 }
  if ( %gtzmyVote == abs ) { did -c votebox 32 }
  if ( %gtzmyVote == no ) { did -c votebox 34 }
}

On *:DIALOG:votebox:init:0:{ initialise }

On *:DIALOG:votetbox:sclick:100:{ saveIt }
on *:DIALOG:votebox:sclick:120:{ set %gtzmakeSure 1 }

On *:DIALOG:votebox:sclick:102:{ did -f votebox 203 | VOTE | initialise }

On *:DIALOG:votebox:sclick:101:{ did -o votebox 33 1 $did(votebox,26) | did -o votebox 34 1 $did(votebox,35) | did -o votebox 68 1 $did(votebox,26) | did -o votebox 72 1 $did(votebox,35) | saveIt }

On *:DIALOG:votebox:edit:26:{
  did -o votebox 68 1 $did(votebox,26)
  if ( %gtznooo != 1 ) {
    did -o votebox 33 1 $did(votebox,26)
  }
  else {
    .timer 1 3 did -o votebox 33 1 %gtzchoice1
  }
}

On *:DIALOG:votebox:edit:35:{
  did -o votebox 72 1 $did(votebox,35)
  if ( %gtznooo != 1 ) {
    did -o votebox 34 1 $did(votebox,35)
  }
  else {
    .timer 1 3 did -o votebox 34 1 %gtzchoice2
  }
}


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
