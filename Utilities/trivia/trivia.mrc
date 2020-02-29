;___________________________________________
; Invincible by Xtry
; Trivia
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias triv.process { if ($2- == %triv.answer && %triv.inQuestion == $true) { triv.correct $$1 } }
alias -l triv.newChan { set %triv.currChan $$1 }
alias -l triv.msg { _xmsg.c %triv.currChan (Trivia) $1- }
alias -l triv.timeUp {  triv.msg Time's up on that one! The answer was:  $+ %triv.answer | triv.next }
alias -l triv.hint { triv.msg No one has gotten it yet! Here's a hint:  $+ %triv.hint }
alias -l triv.numQuestions { return $lines(trivia.txt)  } 
alias -l triv.version { return 1.0 }
;===========================
alias triv.correct { 
  var %triv.right = $triv.ini(right,$$1)
  var %triv.longStreak = $triv.ini(longStreak,$$1)
  if (%triv.longStreak == $null) { var %triv.longStreak = 1 }
  inc %triv.right 1
  triv.ini right $$1 %triv.right
  if (%triv.currStreak == $$1) {
    inc %triv.currStreakCount 1
    if (%triv.currStreakCount > %triv.longStreak) { triv.ini longStreak $$1 %triv.currStreakCount | var %triv.longStreak = %triv.currStreakCount }
  }
  else {
    %triv.currStreakCount = 1
    %triv.currStreak = $$1
  }
  triv.msg The correct answer is: %triv.answer $+ . Well done $$1 $+ !! - %triv.right total correct answers - longest streak: %triv.longStreak $iif($$1 == %triv.currStreak, Current Streak: %triv.currStreakCount)
  triv.next
}
alias -l triv.next {
  .timertrivHint off
  .timertrivTimeUp off
  %triv.inQuestion = $false
  triv.setQuestionVars
  .timernextQuestion 1 $triv.ini(settings,pauseBetweenQuestions) triv.askQuestion
}
;;-------------------
alias -l triv.askQuestion {
  triv.msg Question %triv.last / $triv.numQuestions :  $+ %triv.question $+ ? You have $duration($triv.ini(settings,answerTime)) to answer.
  %triv.inQuestion = $true
  .timertrivTimeUp 1 $triv.ini(settings,answerTime) triv.timeUp
  .timertrivHint 1 $triv.ini(settings,hintTime) triv.hint
}
;;-------------------
alias triv.ini {
  if ($isid) { 
    set %stmp $readini(utilities/trivia/trivia.ini,n,$$1, $$2)
    return $replace(%stmp,&&_u,,&&_b,,&&_k,)
  } 
  else {
    if ($3- !== $null) { writeini utilities/trivia/trivia.ini $$1 $$2 $replace($3-,,&&_b,,&&_u,,&&_k) }
  }
}
;--------------
alias triv.setQuestionVars {
  ;---- question°answer°hint ( ° == $asc(176) )
  inc %triv.last 1
  if ($triv.numQuestions < %triv.last) { %triv.last = 1 }
  %triv.line = $read(utilities/trivia/trivia.txt, %triv.last)
  %triv.question = $gettok(%triv.line,1,176)
  %triv.answer = $gettok(%triv.line,2,176)
  %triv.hint = $gettok(%triv.line,3,176)
}

alias triv.on {
  if (%triv.last == $null) { %triv.last = 0 }
  .enable #triv
  triv.msg Trivia ON - Invincible
  triv.next  
  triv.newChan $1
}

alias triv.off {
  triv.msg Trivia OFF - Invincible
  .disable #triv
  .timertrivTimeUp off
  .timerNextQuestion off
  .timertrivHint off
}

;-------------------------
#triv off
on *:text:*:%triv.currChan: { triv.process $nick $1- }
#triv end
;;===================================================
dialog triv {
  option dbu
  title "Trivia Configuration"
  icon graph/triv.ico
  size -1 -1 305 200

  tab "Questions", 70, 5 5 295 190
  tab "Settings", 71, 5 5 295 190

  list 1, 10 30 285 100,tab70

  button "&Up", 91, 270 130 20 10,tab70
  button "&Down", 92, 247 130 20 10,tab70
  button "D&elete Question", 99, 190 130 50 10,tab70

  text "", 20, 30 132 150 10,tab70
  text "Question:",21, 10 150 35 10,tab70
  text "Answer:", 22, 10 160 35 10,tab70
  text "Hint:", 23, 10 170 35 10,tab70

  edit "", 11, 45 150 250 10,tab70
  edit "", 12, 45 160 250 10,tab70
  edit "", 13, 45 170 250 10,tab70


  button "&Save Question", 93, 45 182 55 10,tab70
  button "&Clear Question", 94, 110 182 55 10,tab70
  button "&Add Question", 95, 175 182 55 10,tab70
  ;-----
  text "Number of seconds to pause between questions: ", 31, 10 30 150 10,tab71
  text "Number of seconds to let players attempt to answer: ", 32, 10 40 150 10,tab71
  text "Number of seconds until hint is given: ", 33, 10 50 140 10,tab71
  text "Trivia Channel: ", 34, 10 60 140 10,tab71
  text "**Set hint time higher than attempt time to disable hints.**", 35, 10 71 170 10,tab71
  ;--
  edit "", 41, 165 28 55 10,tab71
  edit "", 42, 165 38 55 10,tab71
  edit "", 43, 165 48 55 10,tab71
  edit %triv.currChan, 44, 165 58 55 10,tab71
  button "Save", 96, 165 69 55 10,tab71
  ;--
  button "Close", 90, 240 182 55 10, cancel
}
alias -l triv.status { did -ra triv 20 $1- }
alias triv.dlg { dialog -dm triv triv }
;-----------------------------------
on *:dialog:triv:init:0: {  
  loadbuf -o triv 1 utilities/trivia/trivia.txt 
  did -ra triv 41 $triv.ini(settings,pauseBetweenQuestions)
  did -ra triv 42 $triv.ini(settings,answerTime)
  did -ra triv 43 $triv.ini(settings,hintTime)
}
on *:dialog:triv:sclick:*: {
  if ($did == 1) { triv.showQuestion $did(triv,1).sel }
  if ($did == 91) { triv.moveUp $did(triv,1).sel }
  if ($did == 92) { triv.moveDown $did(triv,1).sel }
  if ($did == 93) { triv.saveQuestion $did(triv,1).sel }
  if ($did == 94) { triv.clearQuestion }
  if ($did == 95) { triv.addQuestion }
  if ($did == 96) { triv.saveSettings }
  if ($did == 99) { triv.delQuestion $did(triv,1).sel }
}
alias -l triv.saveSettings {
  triv.ini settings pauseBetweenQuestions $did(triv,41)
  triv.ini settings answerTime $did(triv,42)
  triv.ini settings hintTime $did(triv,43)
  set %triv.currChan $did(triv,44)
}
;---
alias -l triv.moveUp {
  var %temp = $did(triv,1).seltext
  if ($$1 <= 1 || %temp == $null) return
  var %new = $calc($$1 - 1)
  write -l $+ [ $$1 ] utilities/trivia/trivia.txt $did(triv,1,%new)
  write -l $+ [ %new ] utilities/trivia/trivia.txt %temp
  did -o triv 1 $$1 $did(triv,1,%new)
  did -o triv 1 %new %temp 
  did -c triv 1 %new
  triv.status Quesiton number %new of $did(triv,1).lines $+ .
}
;--
alias -l triv.moveDown {
  var %temp = $did(triv,1).seltext
  if ($$1 > $did(triv,1).lines || %temp == $null) return
  var %new = $calc($$1 + 1)
  write -l $+ [ $$1 ] utilities/trivia/trivia.txt $did(triv,1,%new)
  write -l $+ [ %new ] utilities/trivia/trivia.txt %temp
  did -o triv 1 $$1 $did(triv,1,%new)
  did -o triv 1 %new %temp 
  did -c triv 1 %new
  triv.status Quesiton number %new of $did(triv,1).lines $+ .

}
alias -l triv.showQuestion {
  triv.status Quesiton number $$1 of $did(triv,1).lines $+ .
  triv.editQuestionVars $$1
  did -ra triv 11 %triv.edit.question
  did -ra triv 12 %triv.edit.answer
  did -ra triv 13 %triv.edit.hint
}
alias -l triv.saveQuestion {
  write -l $+ [ $$1 ] utilities/trivia/trivia.txt $did(triv,11) $+ ° $+ $did(triv,12) $+ ° $+ $did(triv,13)
  did -o triv 1 $$1 $did(triv,11) $+ ° $+ $did(triv,12) $+ ° $+ $did(triv,13)
  triv.status Question Saved!
}
alias -l triv.addQuestion {
  write utilities/trivia/trivia.txt $did(triv,11) $+ ° $+ $did(triv,12) $+ ° $+ $did(triv,13)
  did -a triv 1 $did(triv,11) $+ ° $+ $did(triv,12) $+ ° $+ $did(triv,13)
  triv.clearQuestion
  triv.status Question Added!
}
alias -l triv.delQuestion {
  write -dl $+ [ $$1 ] utilities/trivia/trivia.txt 
  did -d triv 1 $$1
  triv.status Question Deleted..
}
alias -l triv.clearQuestion { did -r triv 11,12,13 | triv.status }
;--

alias triv.editQuestionVars {
  ;---- question°answer°hint ( ° == $asc(176) )
  %triv.line = $read(utilities/trivia/trivia.txt, $$1)
  %triv.edit.question = $gettok(%triv.line,1,176)
  %triv.edit.answer = $gettok(%triv.line,2,176)
  %triv.edit.hint = $gettok(%triv.line,3,176)
}
;===========================================================
on *:load: {
  if ($version < 5.9) {
    echo 4 -a ERROR: Trivia Pimp requires mIRC version 5.9 or better, you currently are using version $version $+ .
    echo 4 -a Visit www.mirc.com to download the latest version... Unloading Trivia Pimp v $+ $triv.version
    .timer 1 0 unload -rs $script
  }
  if ($isfile(utilities/trivia/trivia.ini) == $false) {
    write utilities/trivia/trivia.txt What is the name of this script°Trivia Pimp°..rivia..
    triv.ini settings pauseBetweenQuestions 5
    triv.ini settings answerTime 30
    triv.ini settings hintTime 20
  }
  else { echo 3 -a Date File exists.. retaining previous data.... }
  echo 3 -a Trivia Pimp version $triv.version loaded!
  .timer 1 0 triv.hlp.ask
}
;----------
alias -l triv.remove {
  if ($input(Sure you want to remove?,8) == $true) {
    unload -rs $script
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
