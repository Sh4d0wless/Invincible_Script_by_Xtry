;___________________________________________
; Invincible by Xtry
; Email Client
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias emailer { if ($dialog(email)) dialog -v email | else dialog -md email email }
dialog email { 
  title Email Client
  size -1 -1 320 405
  icon graph/emailerz.ico
  icon 1, 5 365 36 36,graph\emailerz.ico
  text %name2 Email Client , 2, 45 370 200 20
  text By %auname, 3, 45 385 200 20
  box ""            ,10,5 0 310 70
  icon               11,40 15 32 32,  utilities/emailer/setupmail.ico
  icon               12,110 15 32 32, utilities/emailer/mail - inbox.ico
  icon               13,180 15 32 32, utilities/emailer/mail - outbox.ico
  icon               14,250 15 32 32, utilities/emailer/exitmail.ico
  text "Settings"   ,15,35 50 42 15,center
  text "In Box"     ,16,105 50 42 15,center
  text "Out Box"    ,17,175 50 42 15,center
  text "Exit"       ,18,245 50 42 15,center
  text "Sender:"    ,301,10  84 40 15
  text "To:"        ,302,10 104 40 15
  text "Subject:"   ,303,10 124 40 15
  edit ""           ,304,55  80 180 20
  edit ""           ,305,55 100 180 20
  edit ""           ,306,55 120 180 20
  edit ""           ,307,10 150 300 160,multi vsbar return
  icon               308,260  85 32 32, utilities/emailer/mail - send.ico
  text "Send Mail"  ,309,252 120 48 15,center
  box "Status"      ,20,5 315 310 40
  text ""           ,21,15 332 290 15
  text ""           ,50,15 90 290 200
  box "Account Info" ,110,5 100 310 190
  text "Email:"      ,100,30 134 70 15
  text "Username:"   ,101,30 154 70 15
  text "POP3 Server:",102,30 174 70 15
  text "Password:"   ,103,30 194 70 15
  text "SMTP Server:",104,30 214 70 15
  edit ""            ,105,100 130 180 20
  edit ""            ,106,100 150 180 20
  edit ""            ,107,100 170 180 20
  edit ""            ,108,100 190 180 20,passwd
  edit ""            ,109,100 210 180 20
  button "Save"      ,111, 20 250  80 25
  button "Restore"   ,112,120 250  80 25
  button "Clear All" ,113,220 250  80 25

  text "From:"       ,201,10  84 40 15
  text "Subject:"    ,202,10 104 40 15
  text "Content:"    ,203,10 124 40 15
  text "X-Mailer:"   ,204,10 144 40 15
  text "Date:"       ,205,10 164 40 15
  edit ""            ,206,55  80 180 20,autohs
  edit ""            ,207,55 100 180 20,autohs
  edit ""            ,208,55 120 180 20,autohs
  edit ""            ,209,55 140 180 20,autohs
  edit ""            ,210,55 160 180 20,autohs
  edit ""            ,211,10 190 300 118,multi vsbar return
  icon                212,260  85 32 32, utilities/emailer/mail - check.ico
  text "Check Mail"  ,213,249 120 54 15,center
  icon                  214,260 110 32 32, utilities/emailer/mail - exit.ico
  text "Get This Mail" ,215,244 145 64 15,center
  combo                 216,245  80 70 90,sort,extsel,size,vsbar,drop
  button "Close Mailbox"217,240 160 75 20
  button "Close"     ,99,260 370 50 25 
  button "Ok Hidden" ,98,400 400 10 10, OK
}


on *:DIALOG:email:init:*: {
  if (%Group.sounds == On) { /.splay -q SSClick1.wav }
  did -t email 99 | did -f email 11
  did -h email 98
  .sockclose email
  .sockclose emailchk
  did -m email 206,207,208,209,210,211
  Set %SSmail.Working No
  did -h email 100,101,102,103,104,105,106,107,108,109,110,111,112,113,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,301,302,303,304,305,306,307,308,309
  if (%SSMail.Email == $null) || (%SSMail.Username == $null) || (%SSMail.POP3 == $null) || (%SSMail.Password == $null) || (%SSMail.SMTP == $null) {
    did -a email 50 Welcome To Email Client. $crlf $crlf Warning, some account info are not correctly setted. $crlf $crlf Please go to Settings and complete them. $crlf $crlf Thanks. 
  } 
  else { did -a email 50 Welcome To SS Email Client 1.0. $crlf $crlf Hello %SSMail.Email $+ , you have successfully $crlf completed your account info. $crlf $crlf Now, you can start to use this Email Client. $crlf $crlf Enjoy It!. }
  did -a email 105 %SSMail.Email | did -a email 106 %SSMail.Username | did -a email 107 %SSMail.POP3 | did -a email 108 %SSMail.Password | did -a email 109 %SSMail.SMTP | did -a email 304 %SSMail.Email
}

on *:DIALOG:email:sclick:*: {
  if ($did == 99) { 
    if (%SSMail.Working == Yes) { halt } 
    did -a email 21 Good Bye!!!... | sockclose email | sockclose emailchk | dialog -x email email
  }
  if ($did == 11) && (%SSMail.Working != Yes) { did -v email 100,101,102,103,104,105,106,107,108,109,110,111,112,113 | did -h email 50,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,301,302,303,304,305,306,307,308,309 }
  if ($did == 12) && (%SSMail.Working != Yes) { did -h email 50,100,101,102,103,104,105,106,107,108,109,110,111,112,113,301,302,303,304,305,306,307,308,309 | did -v email 201,202,203,204,205,206,207,208,209,210,211,212,213 }
  if ($did == 13) && (%SSMail.Working != Yes) { did -h email 50,100,101,102,103,104,105,106,107,108,109,110,111,112,113,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217 | did -v email 301,302,303,304,305,306,307,308,309 }
  if ($did == 14) && (%SSMail.Working != Yes) { did -a email 21 Good Bye!!!... | dialog -x email email | sockclose mail }
  if ($did == 111) { 
    set %SSMail.Email $did(email,105).text | set %SSMail.Username $did(email,106).text | set %SSMail.POP3 $did(email,107).text 
    set %SSMail.Password $did(email,108).text | set %SSMail.SMTP $did(email,109).text | did -a email 21 Almost Saved... | did -r email 304 | did -a email 304 %SSMail.Email
  }
  if ($did == 112) {
    did -r email 105,106,107,108,109 | did -a email 105 %SSMail.Email | did -a email 106 %SSMail.Username 
    did -a email 107 %SSMail.POP3 | did -a email 108 %SSMail.Password | did -a email 109 %SSMail.SMTP 
    did -a email 21 Last Saved Configuration Restored... | did -r email 304 | did -a email 304 %SSMail.Email
  }
  if ($did == 113) { did -r email 105,106,107,108,109 | did -a email 21 Almost Cleared... }
  if ($did == 308) && (%SSMail.Working != Yes) {
    if ($did(email,305).text == $null) { error Recipient Missing | halt }
    if ($did(email,306).text == $null) { error Subject Missing | halt }
    if ($did(email,307).text == $null) { error Message or Data Missing | halt }
    if (%SSMail.Email == $null) || (%SSMail.Username == $null) || (%SSMail.POP3 == $null) || (%SSMail.Password == $null) || (%SSMail.SMTP == $null) { error Some account info are not setted correctly. | halt }
    did -b email 304,305,306,307,99 | Set %SSmail.Working Yes | unset %SSmail.temp
    sockopen email %SSmail.SMTP 25 | did -a email 21 Sending Mail... | halt
  }
  if ($did == 212) && (%SSMail.Working != Yes) { 
    if (%SSMail.Email == $null) || (%SSMail.Username == $null) || (%SSMail.POP3 == $null) || (%SSMail.Password == $null) || (%SSMail.SMTP == $null) { error Some account info are not setted correctly. | halt }
    did -h email 212,213 | did -b email 99 | set %SSmail.Working Yes | set %SSmail.Action Login | unset %SSMail.tmp | unset %SSMail.temp
    sockopen emailchk %SSmail.POP3 110 | did -a email 21 Checking Mail... | halt
  }
  if ($did == 214) && (%SSMail.Reading != On) {
    if ($did(email,216).text == $null) { error Select a message number from the combo box | halt }
    if ($did(email,216).text != $null) { did -r email 206,207,208,209,210,211 | sockwrite -n emailchk retr $gettok($did(email,216).text,1,120) | did -b email 216 | set %SSMail.Reading On | did -a email 21 Retriving mail number $gettok($did(email,216).text,1,120) of $gettok($did(email,216).text,2,120) Bytes... }
  }
  if ($did == 217) { sockclose emailchk | beep | did -v email 212,213 | Set %SSmail.Working No | did -h email 214,215,216,217 | did -a email 21 Mailbox Closed... | did -e email 99 } 
}

on *:sockopen:emailchk: { 
  if ($sockerr == 4) { did -a email 21 Error while checking mail: Connection refused. | sockclose emailchk | beep | did -v email 212,213 | Set %SSmail.Working No | halt } 
  if ($sockerr == 3) { did -a email 21 Error while checking mail: Unable to connect. | sockclose emailchk | beep | did -v email 212,213 | Set %SSmail.Working No | halt } 
}

on *:sockread:emailchk:{
  if ($sockerr > 0) return
  :loop
  sockread %SSMail.temp
  if ($sockbr == 0) return
  if (%SSMail.temp == $null) { %SSmail.temp = - }
  SSMail.Check %SSMail.temp 
  goto loop
}


alias SSmail.Check {
  if ($1 == -ERR) { did -a email 21 Server error: $2- | sockclose emailchk | beep | did -v email 212,213 | Set %SSmail.Working No | halt } 
  if (%SSmail.Action == Login) { 
    if ($1 == +OK) {
      inc %SSMail.tmp 1
      if (%SSmail.tmp == 1) { sockwrite -n emailchk user %SSMail.username | did -a email 21 Sending username... }
      if (%SSmail.tmp == 2) { sockwrite -n emailchk pass %SSMail.password | did -a email 21 Sending password... }
      if (%SSmail.tmp == 3) { sockwrite -n emailchk stat | did -a email 21 Retriving mailbox info... } 
      if (%SSmail.tmp == 4) {  
        if ($2 == 0) { did -a email 21 You dont have any emails... | sockclose emailchk | beep | did -v email 212,213 | Set %SSmail.Working No | did -e email 99 | unset %SSmail.tmp | halt } 
        else { did -a email 21 Retriving info of $2 mails and $3 bytes | set %SSmail.Action LIST | sockwrite -n emailchk list | unset %SSmail.tmp } 
      }
    }
  }
  if (%SSmail.Action == LIST) { 
    if ($1 == $chr(46)) { did -a email 21 Finished getting mailbox info, choose a mail to read... | set %SSmail.Action READ | did -h email 212,213 | did -v email 214,215,216,217 }
    else { if ($1 isnum) { did -a email 216 $1 x $2 } }
  }
  if (%SSmail.Action == READ) { 
    if ($1 == $chr(46)) { did -a email 21 Finished retriving this message | unset %SSmail.retr* | did -e email 216 | set %SSMail.Reading Off } 
    if ($1 == From $+ $chr(58)) { did -o email 206 1 $2- | did -a email 21 Retriving Message Body... }
    if ($1 == Subject $+ $chr(58)) { did -o email 207 1 $2- }
    if ($1 == Content-Type $+ $chr(58)) { did -o email 208 1 $2- }
    if ($1 == X-Mailer $+ $chr(58)) { did -o email 209 1 $2- }
    if ($1 == Date $+ $chr(58)) { did -o email 210 1 $2- }
    if (%SSmail.retrmsg == on) { 
      inc %SSmail.retrline 1
      did -i email 211 %SSmail.retrline $1-
    }
    if ($1 == Status $+ $chr(58)) { set %SSmail.Retrmsg on | did -a email 21 Retrieving Message... }
  }
}



on *:sockopen:email:{
  if ( $sockerr > 0 ) { did -a email 21 Error while sending mail. | sockclose mail | beep | did -e email 304,305,306,307,99 | Set %SSmail.Working No | halt }
  set %SSMail.i 0
}
on *:sockread:email:{
  sockread %SSMail
  SSMail.Read %SSMail
}


alias SSMail.Read {
  inc %SSMail.i
  set %SSMail.raw $left($1,3)
  if (%SSMail.i == 1) && (%SSMail.raw != 220) { did -a email 21 Error while sending mail. | sockclose email | beep | did -e email 304,305,306,307,99 | Set %SSmail.Working No | halt }
  if ($left(%SSMail.,1) == 5) { did -a email 21 Error while sending: $1- | sockclose email | beep | did -e email 304,305,306,307,99 | Set %SSmail.Working No | halt }
  if (%SSMail.raw == 220) && (%SSMail.i == 1) {
    did -a email 21 Connected...
    sockwrite -n email HELO $host
  }
  if (%SSMail.i == 2) { sockwrite -n email MAIL FROM: %SSMail.Email }
  if (%SSMail.i == 3) { sockwrite -n email RCPT TO: $did(email,305).text }
  if (%SSMail.i == 4) {
    sockwrite -n email DATA
    sockwrite -n email X-Mailer: %name2 Email Client
    sockwrite -n email FROM: %SSMail.Email    
    sockwrite -n email TO: $did(email,305).text  
    sockwrite -n email Subject: $did(email,306).text
    :loop
    inc %SSMail.temp 1
    if (%SSMail.temp > 100) { goto end }
    if ($did(email,307,%SSMail.temp) != $null) { sockwrite -n email $did(email,307,%SSMail.temp) }
    goto loop
    :end
    sockwrite -n email .
    .timer 1 1 sockclose email
    did -a email 21 Mail successfully sent!
    did -e email 304,305,306,307,99 | Set %SSmail.Working No | unset %SSmail.temp
  }
  if (%SSMail.i == 5) sockwrite -n email QUIT
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
