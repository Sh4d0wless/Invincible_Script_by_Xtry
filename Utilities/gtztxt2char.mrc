;___________________________________________
; Invincible by Xtry
; Text To Character
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias t2cd {
  if ($dialog(t2c®) == $null) {
    .dopen t2c® 320 290
    RETURN 0;
  }
  elseif ($dialog(t2c®) != $null) {
    dialog -x $ifmatch $ifmatch
    RETURN 0;
  }
}
dialog t2c® {
  title "Text To Char"
  icon graph/font2.ico
  option dbu
  size -1 -1 160 143
  box "", 1, 4 4 152 119
  button "&Ok", 2, 58 127 38 13, ok
  edit "Please write the text you want translated here.", 3, 9 18 144 11, vsbar limit 83
  text "Text:", 4, 9 10 15 8
  edit "", 6, 9 40 144 73, read multi
  button "&Translate It!", 7, 59 30 44 9 default
  link "Clear", 8, 70 114 30 35
}
on *:DIALOG:t2c®:*:*:{
  if ($devent == sclick) {
    if ($did == 7) {
      if ($did($dname,3).text == $null) {
        if ($dialog($dname)) {
          did -a $dname 6 Please Enter your text in translate field! 
          return 
        }
      }
      else {
        var %ttt = $did($dname,3).text
        var %ttt = $txt2chr(%ttt)
        if (%ttt) {
          if ($dialog($dname)) {
            did -r $dname 6 
            did -a $dname 6 %ttt 
          return }
        }
      }
    }
    if ($did == 8) {
      if (($dialog($dname)) && ($did($dname,6).text != $null)) {
        did -r $dname 6
        return
      }
    }
  }
}

alias txt2chr {
  ; /txt2chr TextHere
  ; $txt2chr(TextHere)
  VAR %TXT = $1-
  tokenize 32 %TXT
  IF ($1- == $NULL) {
    IF ($ISID) { 
      ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Too few parameters you can type $+ $cxs(1) $!txt2chr 
      RETURN
    }
    ELSE { 
      ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Too few parameters you can type $+ $cxs(1) /txt2chr
      return
    }
  }
  IF ($LEN($1-) > 45) {
    ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You may use 45 letters max
    RETURN
  }
  VAR %LEN = 1
  WHILE (%LEN <= $LEN(%TXT)) {
    VAR %T2C = %T2C $!+ $!CHR( $+ $ASC($MID($1-,%LEN,1)) $+ )
    INC %LEN
  }
  IF (%T2C) {
    IF ($ISID) RETURN $RIGHT(%T2C,-2)
  }
  IF ($ACTIVE != Status Window) {
    MSG $ACTIVE $RIGHT(%T2C,-2)
  }
  ELSE {
    ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Text to char result for $+ $cxs(1) %txt  $+ $cxs(2) $+ is $+ $cxs(1) $RIGHT(%T2C,-2)
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
