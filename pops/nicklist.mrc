;___________________________________________
; Invincible by Xtry
; Nicklist Popups
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

menu nicklist {
  Whois:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { whois $snick(#,%t2) | inc %t2 1 } }
  Whois idle:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { whois $snick(#,%t2) $snick(#,%t2) | inc %t2 1 } }
  -
  Info
  .Nickname $chr(160) $$1:halt
  .Hostname $chr(160) $remove($address($$1,2),*!*@):halt
  .Idle $chr(160) $duration($nick($chan,$$1).idle):halt
  .-
  .UCentral:uwho $$1
  .DNS:.dns $$1
  .Trace:trace $$1
  .Userhost:userhost $$1
  Notice
  .Private:notice.p $$1 $$?="Notice to $$1 :"
  .-
  .Op Notice:onot
  .Op && Voice Notice $chr(160) F9:ovnot
  .Voice Notice:vnot
  .-
  .Channel Notice:gnot
  Msg && Query
  .Msg:msg $1 $$?="Message to $1 :"
  .Query:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { query $snick(#,%t2) | inc %t2 1 } }
  .-
  .Op Message:PRIVMSG @ $+ # (Op $+ $nick(#,0,o) $+ ( $+ $round($calc($nick(#,0,o) / $nick(#,0) * 100),0) $+ % $+ )) $$?="Op( $+ $opnick(#,0) $+ ) Message to $chan :"
  .Op && Voice Message:PRIVMSG @ $+ + $+ # (Op $+ $nick(#,0,o) $+ ( $+ $round($calc($nick(#,0,o) / $nick(#,0) * 100),0) $+ % $+ )Vo $+ $nick(#,0,v) $+ ( $+ $round($calc($nick(#,0,v) / $nick(#,0) * 100),0) $+ % $+ )) $$?="Op( $+ $opnick(#,0) $+ ) & Voice( $+ $vnick(#,0) $+ ) Message to $chan :"
  .Voice Message:PRIVMSG + $+ # (Vo $+ $nick(#,0,v) $+ ( $+ $round($calc($nick(#,0,v) / $nick(#,0) * 100),0) $+ % $+ )) $$?="Voice( $+ $vnick(#,0) $+ ) Message to $chan :"
  -
  $iif($me !isop #,$style(2)) ±o:{
    if ($1 isop #) { tokenize 44 $1- | mode # -oooooooooooooooooooo $1-20 }
    else { tokenize 44 $1- | mode # +oooooooooooooooooooo $1-20 }
  }
  $iif($me !isop #,$style(2)) ±v:{
    if ($1 isvo #) { tokenize 44 $1- | mode # -vvvvvvvvvvvvvvvvvvvv $1-20 }
    else { tokenize 44 $1- | mode # +vvvvvvvvvvvvvvvvvvvv $1-20 }
  }
  $iif($me !isop #,$style(2)) -o+v:mode $chan -o+v $1 $1
  -
  $iif($me !isop #,$style(2)) Kicks
  .Kick Only:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { kick # $snick(#,%t2) - %name | inc %t2 1 } }
  .Kick Why:kick # $$1 $$?="Kick reason to $$1 :" - %name
  .-
  .Specified
  ..Advertising:kick # $$1 %kix.ad - %name
  ..Flood:kick # $$1 %kix.fl - %name
  ..Repeat:kick # $$1 %kix.re - %name
  ..Begging:kick # $$1 %kix.be - %name
  ..Idling:kick # $$1 %kix.id - %name
  ..Bad Language:kick # $$1 %kix.la - %name
  ..Bad Nickname:kick # $$1 %kix.ni - %name
  ..Bad Ident:kick # $$1 %kix.idt - %name
  ..Bad Script:kick # $$1 %kix.sc - %name
  ..Clones:kick # $$1 %kix.cl - %name
  ..Infected:kick # $$1 %kix.in - %name
  ..Harrassment:kick # $$1 %kix.ha - %name
  ..Annoying:kick # $$1 %kix.an - %name
  ..Swearing:kick # $$1 %kix.sw - %name
  ..Lamer:kick # $$1 %kix.lam - %name
  ..Warned:kick # $$1 %kix.wa - %name
  ..Inviting:kick # $$1 %kix.inv - %name
  ..-
  ..Setup:kixset
  $iif($me !isop #,$style(2)) Bans
  .Ban Only:/ban $$1 3
  .Ban Kick Why:/ban $$1 3 | .timer 1 1 /kick # $$1 $$?=" Kickban reason to $$1 :" - %name
  .-
  .Timed Bans
  ..Specified:{
    set %tis.ban $?="Seconds For Ban :"
    ban -u $+ %tis.ban $$1 3
    kick $chan $$1 %tis.ban Secs Ban - %name
    unset %tis.ban
  }
  ..-
  ..3 Mins:/ban -u180 $$1 | kick # $$1 3 Mins Ban - %name
  ..5 Mins:/ban -u300 $$1 | kick # $$1 5 Mins Ban - %name
  ..15 Mins:/ban -u900 $$1 | kick # $$1 15 Mins Ban - %name
  ..30 Mins:/ban -u1800 $$1 | kick # $$1 30 Mins Ban - %name
  ..1 Hour:/ban -u3600 $$1 | kick # $$1 1 Hour Ban - %name
  ..3 Hours:/ban -u10800 $$1 | kick # $$1 3 Hours Ban - %name
  ..6 Hours:/ban -u21600 $$1 | kick # $$1 6 Hours Ban - %name
  ..12 Hours:/ban -u43200 $$1 | kick # $$1 12 Hours Ban - %name
  ..1 Day:/ban -u86400 $$1 | kick # $$1 1 Day Ban - %name
  ..3 Days:/ban -u259200 $$1 | kick # $$1 3 Days Ban - %name
  ..1 Week:/ban -u604800 $$1 | kick # $$1 1 Week Ban - %name
  ..1 Month:/ban -u2419200 $$1 | kick # $$1 1 Month Ban - %name
  .Specified
  ..Advertising:ban $$1 3 | kick # $$1 %kix.ad - %name
  ..Flood:ban $$1 3 | kick # $$1 %kix.fl - %name
  ..Repeat:ban $$1 3 | kick # $$1 %kix.re - %name
  ..Begging:ban $$1 3 | kick # $$1 %kix.be  - %name
  ..Idling:ban $$1 3 | kick # $$1 %kix.id - %name
  ..Bad Language:ban $$1 3 | kick # $$1 %kix.la - %name
  ..Bad Nickname:ban $$1 3 | kick # $$1 %kix.ni - %name
  ..Bad Ident:ban $$1 3 | kick # $$1 %kix.idt - %name
  ..Bad Script:ban $$1 3 | kick # $$1 %kix.sc - %name
  ..Clones:ban $$1 3 | kick # $$1 %kix.cl - %name
  ..Infected:ban $$1 3 | kick # $$1 %kix.in - %name
  ..Harrassment:ban $$1 3 | kick # $$1 %kix.ha - %name
  ..Annoying:ban $$1 3 | kick # $$1 %kix.an - %name
  ..Swearing:ban $$1 3 | kick # $$1 %kix.sw - %name
  ..Lamer:ban $$1 3 | kick # $$1 %kix.lam - %name
  ..Warned:ban $$1 3 | kick # $$1 %kix.wa - %name
  ..Inviting:ban $$1 3 | kick # $$1 %kix.inv - %name
  ..-
  ..Setup:kixset
  .Triple Bans Kick
  ..Triple Bans Only:tb $1
  ..Triple Bans Kick:tbk $1 %name
  $iif($me !isop #,$style(2)) Instant Kick:kick # $$1 Instant Kick - %name
  $iif($me !isop #,$style(2)) Instant Kick Ban $chr(160) F4:mode $chan -o+b $1 $address($1,2) | kick $chan $1 Instant Kick Ban - %name
  -
  Control
  .$iif($1 == $me,$style(2)) Ignores
  ..All:.ignore $$1 3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to ignore list (All)
  ..-
  ..All But Channel:.ignore -pnti $$1 3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to ignore list (All but channel)
  ..Query:.ignore -p $$1 3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to ignore list (Query)
  ..Ctcp:.ignore -t $$1 3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to ignore list (CTCP)
  ..Dcc:.ignore -d $$1 3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to ignore list (DCC)
  ..Channels:.ignore -c $$1 3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to ignore list (Channel)
  ..Notice:.ignore -n $$1 3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to ignore list (Notice)
  ..Invite:.ignore -i $$1 3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to ignore list (Invite)
  ..-
  ..Unignore:.ignore -r $$1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Removed $+ $cxs(1) $1  $+ $cxs(2) $+ from ignore list
  .$iif($1 == $me,$style(2)) Silence
  ..Silence:.silence + $+ $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to silence list
  ..Unsilence:.silence - $+ $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Removed $+ $cxs(1) $1  $+ $cxs(2) $+ from silence list
  .Notify
  ..Add:.notify $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ too notify list
  ..Remove:.notify -r $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Removed $+ $cxs(1) $1  $+ $cxs(2) $+ from notify list
  ..-
  ..Make Note For $snick(#,1):.notify -r $1 | .notify $1 $?"Notify note to $1 :" | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to notify list $cxs(3) $+ ( $+ $cxs(2) $+ Note $+ $cxs(3) $+ )
  ..Whois On Notify $snick(#,1):.notify -r $1 | .notify + $+ $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to notify list $cxs(3) $+ ( $+ $cxs(2) $+ Whois on notify $+ $cxs(3) $+ )
  ..-
  ..Show Notify List:/notify -s
  ..Echo Notify List:/notify -h
  .-
  .Invite:invite $* $$?="Invite to channel :"
  CTCP
  .Ping:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { ctcb $snick(#,%t2) ping | inc %t2 1 } }
  .Chat:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { ctcb $snick(#,%t2) chat | inc %t2 1 } }
  .Page:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { ctcb $snick(#,%t2) page | inc %t2 1 } }
  .-
  .Time:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { ctcb $snick(#,%t2) time | inc %t2 1 } }
  .Version:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { ctcb $snick(#,%t2) version | inc %t2 1 } }
  .Userinfo:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { ctcb $snick(#,%t2) userinfo | inc %t2 1 } }
  .Clientinfo:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { ctcb $snick(#,%t2) clientinfo | inc %t2 1 } }
  .Finger:{ var %t = $snick(#,0) | var %t2 = 1 | while (%t2 <= %t) { ctcb $snick(#,%t2) finger | inc %t2 1 } }
  .-
  .Custom:ctcp $1 $$?="CTCP to $$1 :"
  $iif($1 == $me,$style(2)) DCC
  .Send:dcc send $$*
  .Chat:dcc chat $$*
  .-
  .Allow:dccallow + $+ $$1
  .Disallow:dccallow - $+ $$1
  $iif(.dal.net isin $server,DALnet)
  .Chanserv
  ..Options Dialog:gtzdalc
  ..-
  ..Why:chanserv why # $$1
  ..Access:chanserv acc # $$1
  ..-
  ..Op - Deop
  ...Op:chanserv op # $$1
  ...Deop:chanserv deop # $$1
  ..SOP
  ...Add:/chanserv sop # add $$1
  ...Del:/chanserv sop # del $$1
  ..AOP
  ...Add:/chanserv aop # add $$1
  ...Del:/chanserv aop # del $$1
  ..Akick
  ...$iif($1 == $me,$style(2)) Add:chanserv akick # add $address($1,2)
  ...Del:chanserv akick # del $address($1,2)
  .Nickserv
  ..Options Dialog:gtzdaln
  ..-
  ..Access:nickserv acc $$1
  ..Info:nickserv info $$1 all
  ..-
  ..$iif($1 == $me,$style(2)) Ghost:/nickserv ghost $$1 $$?*="Password to ghost $$1 :"
  ..$iif($1 == $me,$style(2)) Recover:/nickserv recover $$1 $$?*="Password to recover $$1 :"
  .Memoserv
  ..Send:/memoserv send $$1 $$?="Memo message to $$1 :"
  -
  User List $chr(160) sF3
  .View User List:userlist
  .$iif($1 != $me,$iif($ulist($_a($$1,5)) != $nulll,rem $1,add $1)):if ($ulist($_a($1,5))) { .ruser $ifmatch } | else user.new $iif($_a($1,5) != $null,$_a($1,5),$1 $+ !*@*)
  .-
  .$iif($1 != $me,$iif($level($_a($$1,5)) == 1,1 (normal),$iif($level($_a($1,5)) == 50,50 (shitlisted),$iif($level($_a($1,5)) == 100,100 (auto voice),$iif($level($_a($1,5)) == 150,150 (auto op),$iif($level($_a($1,5)) == 999,999 (protected))))))):echo -a :n: $1 level is $iif($level($_a($1,5)) == 1,1 (normal),$iif($level($_a($1,5)) == 50,50 (shitlisted),$iif($level($_a($1,5)) == 100,100 (auto voice),$iif($level($_a($1,5)) == 150,150 (auto op),$iif($level($_a($1,5)) == 999,999 (protected))))))
  .-
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 1,Normal (1))):.auser 1 $1 $+ !*@*
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 50,DeathList (50))):.auser 50 $1 $+ !*@* | .mode # -o+b  $1 $1 $+ !*@* | kick # $1 Death Listed - %name
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 100,Auto Voice (100))):.auser 100 $1 $+ !*@* | .mode # +v $1
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 150,Auto Op (150))):.auser 150 $1 $+ !*@* | .mode # +o $1
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 999,Protect (999))):.auser 999 $1 $+ !*@*
  Entertainmaent
  .Love Meter:set %kira-cinta1 $$1 | set %kira-cinta2 $2 | lovemnl
  .-
  .Mimic
  ..Start Mimic To $$1 :mimicon
  ..Stop Mimic To $$1 :mimicoff
  .Fun Stuffs
  ..Greetings
  ...hi:_xmsg.c 1,1---6,6-0,6H6,6-4,4-0,4E4,4-8,8-1,8L8,8-9,9-1,9L9,9-3,3-0,3O3,3-0,4 $1 4,4-8,8-1,8 $1 12,12-1,12 $1
  ...hello:_xmsg.c 0,1¤8,14¤7,15¤15,10¤4,8¤12,9¤13,11¤11,12¤10,13¤2,48,14¤7,15¤15,10¤4,8¤12,9¤13,11¤11,12¤10,13¤2,48,10 HELLO $1 2,410,13¤11,12¤13,11¤12,9¤4,8¤15,10¤7,15¤8,14¤2,410,13¤11,12¤13,11¤12,9¤4,8¤15,10¤7,15¤8,14¤0,1¤
  ...hiya:_xact.c 0,12 H 0,4 i 0,3 Y 1,8 a 1,9 . 0,13 . 0,12 . 4 $1 !!
  ...Hello:_xmsg.c 11,2!2,11¡11,2!2,11 H 11,2 £ 2,11 L 11,2 L 2,11 Ò 13{§{*2 $upper( $$1 ) 13*}§}2,11 H 11,2 £ 2,11 L 11,2 L 2,11 Ò 11,2!2,11¡11,2!
  ...roseHi!:_xact.c says 3»4®3»4®3»4®3»12{3H12}8*12{3E12}8*12{3L12}8*12{3L12}8*12{3O12}3»4®3»4®3»4®12{3T12}8*12{3O12} 3»4®3»4®3»4®»8*12{4 $$1 12}8*123»4®3»4®3»4®3
  ...hi:_xact.c 0.8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*4{{8° $+ 12 $+ $$1 $+ 8°4}}9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°4 | _xact.c 9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*4{{8° $+ 12 $+ $$1 $+ 8°4}}9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*4 | _xact.c 0*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*4{{8° $+ 12 $+ $$1 $+ 8°4}}9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°9*8°
  ...colhi!:_xact.c 4,1/8/9/3/12/6/13/4/8/9/3/12/6/13/0,1HI8° $$1 8°0,1HI4\8\9\3\12\6\13\4\8\9\3\12\6\13\
  ...hiya!:_xact.c 4,1(_.·´¯)1~~~~~~~3.·´¯) 12)13¤¤12( 3(¯`·.1~~~~~~~4(¯`·._) | _xact.c 1,1~~~~~8.·´¯) 3.·´1~~~12.·´1~~~~12`·.1~~~3`·. 8(¯`·.1~~~~~ | _xact.c 8,1(_.·´1~~~3.·´1~~~12.·´1~ 9(13Hï¥å9)1~ 12`·.1~~~3`·.1~~~8`·._) | _xact.c 1,1~~~3(_.·´ 12(_.·´ 13`·._)9`··´13(_.·´ 12`·._) 3`·._)1~~~ | _xact.c 0. | _xact.c 0,0~~~~~~~~~12(_.·´¯)13¤9 $$1 13¤12(¯`·._)
  ...hibooks!:_xact.c 1,15||4«»1|4«»1||8«»1|8«»1||3«»1|3«»1||12«»1|12«»1||6«»1|6«»1|| | _xact.c 1,15||2.·°·.1||2.·°·.1||2.·°·.1||2.·°·.1||2.·°·.1|| | _xact.c 1,15||0,0--0,4H0,0..1,15|| 0,0-1,8E0,0..1,15|| 0,0-0,3L0,0..1,15||0,0.-0,12L0,0..1,15||0,0.-0,6O0,0..1,15|| | _xact.c 1,15||2·._.·1||2·._.·1||2·._.·1||2·._.·1||2·._.·1|| | _xact.c 1,15||4«»1|4«»1||8«»1|8«»1||3«»1|3«»1||12«»1|12«»1||6«»1|6«»1||
  ...myfriend:_xact.c 13,1WÅv£§... 11,1HË££õ $$1 M¥ F®Ï£ÑÐ!¡!
  ...kewlhi!:_xact.c 4,1/8/9/3/12/6/13/4/8/9/3/12/6/13/4/8/9/1,1 $$1 12\6\13\4\8\9\3\12\6\13\4\8\9\3\12\6\13\ | _xact.c 1,1.6,15H1,1.9,14I1,1.8,13Y1,1.0,12A8,1*6,11H1,1.9,10I1,1.8,13Y1,1-6,15A8,1| $$1 |6,15H1,1-9,13I1,1.8,10Y1,1.6,11A8,1*0,12H1,1.9,13I1,1.8,14Y1,1.6,15A1,1. | _xact.c 12,1\6\13\4\8\9\3\12\6\13\4\8\9\3\12\6\13\1,1 $$1 4,1/8/9/3/12/6/13/4/8/9/3/12/6/13/4/8/9/8
  ...rseblk:_xact.c 9,1 »4,1®9,1»4,1®9,1»4,1®9,1»{16,1H9,1}{16,1E9,1}{16,1L9,1}{16,1L9,1}{16,1O9,1}»4,1®9,1»4,1®9,1»4,1®9,1{16,1T9,1}{16,1O9,1}»4,1®9,1»4,1®9,1»4,1®9,1»{16,1 $$1 9,1}»4,1®9,1»4,1®9,1»4,1®9,1»
  ...welcome back:_xmsg.c 12,15--11--==13>3>8>13>4WE3LC12OME4> $$1 <12B3A4CK13<8<3<13<11==--12-- | _xmsg.c 12,14--11--==13>3>8>13>4WE8LC12OME4> $$1 <12B8A4CK13<8<3<13<11==--12-- | _xmsg.c 12,1--11--==13>3>8>13>4WE3LC12OME4> $$1 <12B3A4CK13<8<3<13<11==--12--
  ...welcome back2:_xact.c 15,1Wß Wß Wß Wß Wß $$1 Wß Wß Wß Wß Wß | _xact.c  14,1Wß Wß Wß Wß Wß $$1 Wß Wß Wß Wß Wß | _xact.c  0,1Wß Wß Wß Wß Wß $$1 Wß Wß Wß Wß Wß 
  ...welcome back3:_xmsg.c 0,4G0,1L0,4A0,1D4,4,0,1Y0,4O0,1U8,4 $$1 0,1A0,4R0,1E4,4,0,1B0,4A0,1C0,4K | _xmsg.c 0,4W0,1E4,4,0,1R0,4E0,1A0,4L0,1Y8,4 $$1 0,1M0,4I0,1S0,4S0,1E0,4D1,1,0,4U
  ...welcome back4!:_xact.c 10,1“1,0W9,1“1,0E8,1“1,0L4,1“1,0C3,1“1,0O13,1“1,0M12,1“1,0E10,1“0¤9,1“1,0B8,1“1,0A12,1“1,0C4,1“1,0K3,1“1,0!13,1“9,1“1,0!12,1“0,1 $$1 12,1“1,0!
  ...goodbye:_xmsg.c 8,1G1,8o8,1O1,8d8,1B1,8y8,1E16,4 $$1  8,1G1,8o8,1O1,8d8,1B1,8y8,1E
  ...missyou:_xmsg.c 3¬¬«{{4@3}}»¬¬ 0,2W0,12E2,2,0,12W0,2I0,12L0,2L8,4 $$1 0,2M0,12I0,2S0,12S2,2,0,12Y0,2O0,12U 3¬¬«{{4@3}}»¬¬
  ...later:_xact.c 0,00,1\ïÏï/4,4i1,4Later0,1 $1 1,4Take 4,1Care1,4!¡4,40,1\ïÏï/
  ...Hello:_xmsg.c 4«6æ2§4²3°4²2§6æ4»6°3æ6°4«6æ2§4²3°4²2§6æ4»6 $$1 4«6æ2§4²3°4²2§6æ4»6°3æ6°4«6æ2§4²3°4²2§6æ4»
  ...Angels:_xmsg.c 3 $me sends 4Guardian Angels to watch over  4~Å~8 ~Å~6 ~Å~13 ~Å~ 12~Å~2  $$1 9~Å~2 ~Å~8 ~Å~4 ~Å~6  $$1  13~Å~12 ~Å~11 ~Å~9 ~Å~3  $$1 8~Å~ 4~Å~6 ~Å~ 2~Å~13 ~Å~12  $$1  9~Å~10 ~Å~2 ~Å~4 ~Å~8 ~Å~
  ...PrettyGreet:_xmsg.c 0,0... 3^~+*<{13@3 ^~+*<{13@6  $$1  13@3}>*+~^13 @3}>*+~^
  ...Beer For Everyone:_xmsg.c 0,12o°°o0,12o°°o0,12o°°o0,12o°°o0,12o°°o0,12o°°o0,12o°°o12. | _xmsg.c 0,12 0,8||0,12] 0,8||0,12] 0,8||0,12] 0,8||0,12] 0,8||0,12] 0,8||0,12] 0,8||0,12]  | _xmsg.c 0,12¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ | _xmsg.c 0,4 Tiny Frosty Beers for All!4..
  ...-
  ...WelcomeBack:_xmsg.c 4WeLCoMe BaCK10 $$1 4!!! 
  ...Symbols:_xmsg.c 14,14i4,14««««1,14||16,14§§4,14ºº16,14§§1,14||4,14»»»»1,14   $$1  4,14««««1,14||16,14§§4,14ºº16,14§§1,14||4,14»»»»14,14i
  ...Multi-Names:_xmsg.c 12It's13 $1 !6 $1 !9 $1 !12 $1 ! | _xmsg.c 12It's13 $1 !6 $1 !9 $1 !12 $1 ! | _xmsg.c 12It's13 $1 !6 $1 !9 $1 !12 $1 !
  ...Confetti!:_xact.c Hugs and confetti for $$1 ¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨Confetti¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°¨¨¨¨°º©o¿,,¿o©º°
  ...Hello Confetti!:_xmsg.c 6,15_,.-~H~-.,_,.-~E~-.,_,.-~L~-.,_,.-~L~-.,_,.-~O~-.,_ | _xmsg.c 6,15 _,.-~*~-.,_,.-~*~-., $$1 _,.-~*~-.,_,.-~*~-.,_
  ...Pretty Wave1!:_xact.c (¯`·.,¸¸.·´¯`·.¸¸.->   $$1  <-.¸.Hello:
  ...Kewlest:_xact.c 4 Welcomes12 "¨¨°º©o.,13 $$1 12,.o©º°¨¨" 4 to the Kewlest Pte chat in Town!
  ...HowareYou:_xmsg.c Hey $$1 how are you today, hope you enjoy your stay here with us here at $chan ...:)
  ...Camera!:_xact.c blinds the channel with camera flash catching $$1 's show......;)
  ...Faces!:_xact.c thinks $1 is a person of many faces (ê¿ê) *¿* ()¿() {Ö¿Ö} ô¿ô «©¿©» õ¿õ
  ...razzberry:_xact.c sticks out his tongue at $$1 and blows a huge razzberry!:Þ
  ...banner:_xact.c  rolls out the banner! ·´||`·.¸ $$1 ¸.·´||`·.¸¸.·´||`·.¸ $$1 ¸.·´||`·.¸¸.·´||`·. $$1 ¸.·´||`·.¸¸.·||`·.¸ $$1 ¸.·´||`·.¸¸.·´||`·.¸ $$1 ¸.·´||`·.¸¸.·´
  ...glitter:_xact.c sprinkles glitter all over $$1 ¯°¹ª°¯°¹ª°¯°¹ª°¯°¹ª°¯°¹ $$1 ª°¯°¹ª°¯°¹ª°¯°¹ª°¯°¹ª°¯°¹ $$1 ª°¯°¹ª°¯°¹ª°¯° ¹ª°¯°¹ª°¯°¹ $$1 ª°¯°¹ª°¯°¹ª°¯°¹ª°¯°¹ª°¯°¹ 
  ...Fireworks:_xact.c shoots fireworks for $$1  *~~~~~|#####> `';:*,.,*:;'` $$1 *~~~~~|#####> `';:*,.,*:;'` $$1 *~~~~~|#####> `';:*,.,*:;' $$1 *~~~~~|#####> `';:*,.,*:;'`
  ...backflip:_xact.c does back flips and handsprings cause $$1 is here!!!
  ...jewel:_xact.c ¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡ $$1 ¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡ $$1 ¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡ $$1 ¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡ $$1 ¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡ $$1 ¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡ $$1 ¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨°¡!¡°¨¨
  ...moreangel:_xact.c `~Å~.:**.:`~Å~.:* $$1 *.:`~Å~.:* *.:`~Å~.:**.:`~Å~.:* $$1 *.:~Å~.:`**.:`~Å~.:`**.:` ~Å~.:`**.:`~Å~.:`* $$1 *.:`~Å~.:`**.:~Å~.:`**.:~Å~ .:`**.:~Å~.:`**.:~Å~.:`**.:~Å~.:`* $$1 *.:~Å~.:`** .:~Å~.:`**.:~Å~.:`**.:~Å~.:`**.:~Å~ $$1
  ..Fakes
  ...Fake Quits
  ....Quit (me):_xact.c has quit IRC (Quit: Leaving)
  ...Fake Nicks
  ....Nick (me):_xact.c is now know as $$?="Enter a new fake Nickname :"
  ...Fake Whois
  ....Pervert:_xmsg.c $$1 Is Rape@Your.House.now.com | .timer 1 2 _xmsg.c $$1 on @#Pre-teensex @#Young_Sex  # | .timer 1 3 _xmsg.c  $$1 using $server [255.255.255.198] | .timer 1 4 _xmsg.c $$1 away info : Gone To Look For Some Young Kids...The Best Part Is The Suck  | .timer 1 5 _xmsg.c End of /WHOIS list.      
  ....Slut:_xmsg.c $$1 You@Owe.Me.Big.Time.Net | .timer 1 2 _xmsg.c $$1 on @#Kings_cross @sluts_R_us # | .timer 1 3 _xmsg.c  $$1 using $server [255.255.255.198] | .timer 1 4 _xmsg.c $$1 away info: Gone To Kings Kross.....Buy The Way You Owe Me | timer 1 5 _xmsg.c End of /WHOIS list.      
  ....IRCop:_xmsg.c $$1 You@webserver.tln.net | .timer 1 2 _xmsg.c $$1 on @#Operhelp @#Csop # | .timer 1 3 _xmsg.c  $$1 using $server [255.255.255.198] | .timer 1 4 _xmsg.c $$1 is an IRCop ! | .timer 1 5 _xmsg.c $$1 away info: Join #Operhelp for ircop help | .timer 1 6 _xmsg.c End of /WHOIS list.  
  ....Nerd:_xmsg.c $$1 Tech@microsoft.com | .timer 1 2 _xmsg.c $$1 on @#c++ @#mcse #ccna #linux # | .timer 1 3 _xmsg.c $server  [255.255.255.198] | .timer 1 4 _xmsg.c End of /WHOIS list.
  ....Little Lollita:_xmsg.c $$1 Is Lolly14@Roman.Polanksi.films.com | .timer 1 2 _xmsg.c $$1 on @#Lollita @#Jeremy-Irons  #Roman-Polanksi-Film | .timer 1 3 _xmsg.c  $$1 using $server [255.255.255.198] | .timer 1 4 _xmsg.c $$1 away info : Lil me in HEAT!  | .timer 1 5 _xmsg.c End of /WHOIS list.      
  ....Office Bunny:_xmsg.c $$1 Is Bunny@Bouncey.bouncey.Pouncey.com | .timer 1 2 _xmsg.c $$1 on @#OfficeBouncing @#I-like-to-bounce-a-lot..eerrr...Type  #MSWordCutie # | .timer 1 3 _xmsg.c  $$1 using $server [255.255.255.198] | .timer 1 4 _xmsg.c $$1 away info : Bouncy  | .timer 1 5 _xmsg.c End of /WHOIS list.
  ....Psycho:_xmsg.c $$1 Is Killer@Charlie.Manson.fan.com | .timer 1 2 _xmsg.c $$1 on @#MassMurder @#MurderDeathKill  #DieBunnyDie # | .timer 1 3 _xmsg.c  $$1 using $server [255.255.255.198] | .timer 1 4 _xmsg.c $$1 away info : MUST FUCKING KILL EM ALL!  | .timer 1 5 _xmsg.c End of /WHOIS list.      
  ....LustiFrog:_xmsg.c $$1 Is LustyFrog@yahoo.com | .timer 1 2 _xmsg.c $$1 on @#Virtual-Pedophiles @#DaRave  #Pedophile-Bitch # | .timer 1 3 _xmsg.c  $$1 using $server [255.255.255.198] | .timer 1 4 _xmsg.c $$1 away info : Interstate Phone sex with a minor!  | .timer 1 5 _xmsg.c End of /WHOIS list.   
  ....Fag:_xmsg.c $$1 is Omg@pdf.01.gaysex.com * Bend over | .timer 1 2 _xmsg.c $1 on $chan @#Buttsex @#Anal-Action @#gayskinheads @#gay-opers @#gaycuseeme | .timer 1 3 _xmsg.c $1 using $server [156.63.85.20]  | .timer 1 4 _xmsg.c $$1 has been idle 15 seconds, signed on $date $time | .timer 1 5 _xmsg.c End of /WHOIS list.
  ...Fake Modes
  ....Op (+o):_xact.c 3sets mode: +o $$1
  ....Deop (-o):_xact.c 3sets mode: -o $$1
  ....Voice (+v):_xact.c 3sets mode: +v $$1
  ....Devoice (-v):_xact.c 3sets mode: -v $$1
  ....Gay Kick:_xmsg.c *** $$1 was kicked by $me ( $+ 4,8G1ay 4S1cript v5.2 $+ )
  ....Kick:_xact.c 3 $+ $$1 is kicked from $chan by $me ( $+ $$?="Enter Kick reason:" $+ ) | _xact.c 2*** Attempting to rejoin channel... | _xact.c 3*** Rejoined channel #
  ....Kick Reason:_xmsg.c *** $$1 was kicked by $me ( $+ $$?="Enter kick reason:" 4,8G1ay 4S1cript v5.2 $+ )
  ....Ban:_xact.c 3sets mode: +b $$1 $+ !*@*!*
  ....Kick:_xact.c 3You were kicked by $me (Mass Kick) | _xact.c 2*** Attempting to rejoin channel... | _xact.c 3*** Rejoined channel #
  ....-
  ....Mode -clothes:_xact.c sets mode: -clothes $$1
  ....Mode +love:_xact.c sets mode: +love $$1
  ....Mode +my-heart:_xact.c sets mode: +my-heart $$1
  ....Mode +kiss:_xact.c sets mode: +kiss $$1
  ....Mode +sexy:_xact.c sets mode: +sexy $$1
  ....Mode +deeplove:_xact.c sets mode: +deeply-in-love-with- $+ $$1
  ....Mode +hugs:_xact.c sets mode: +BiggestHugInTheWorld For $$1
  ....Mode +ArseLicker:_xact.c sets mode: +Great-Big-ArseLicker $$1
  ....Mode +Cock Sucker:_xact.c sets mode: +Great-Big-CockSucker $$1
  ....Mode +BigGayAss:_xact.c sets mode: +BigGayAss $$1
  ....Mode +Bitch:_xact.c sets mode: +Bitch $$1
  ....Mode +burn:_xact.c sets mode: +burn $$1
  ....Mode +die:_xact.c sets mode: +die $$1
  ....Mode -brain:_xact.c sets mode: -brain $$1
  ....Mode +punch:_xact.c sets mode: +punch-to-the-face $$1
  ....Mode +kickBalls:_xact.c sets mode: +kick-to-the-balls $$1
  ....-
  ....Choose Mode (+):_xact.c sets mode: +$$?="Enter fake mode :" $$1 
  ....Choose Mode (-):_xact.c sets mode: -$$?="Enter fake mode :" $$1
  ..Give Stuffs
  ...Cigarette:_xact.c 2Gives13 $$1 12a Cigarette 7()¯¯¯¯)15¯¯¯¯¯¯¯¯¯¯¯)14~~~ 4*12ENJOY4*
  ...Beer:_xact.c gets some 14~12ice cold14~ beers and hands one to $$1
  ...7 Up:_xact.c tosses $$1 a 15,15 0,3 74°0UP 15,15 
  ...Coke:_xact.c tosses $$1 a 15,15 16,4 Coke 15,15 
  ...Grape:_xact.c tosses $$1 some 15,15 0,6Grape15,15  soda
  ...Mt. Dew:_xact.c tosses $$1 a 15,15 8,3 MtDew 15,15 
  ...Java:_xact.c hands $$1 A Warm Cup Of Java 15~14~1,5___1,0P
  ...Cocoa:_xact.c passes $$1 some warm cocoa 0,5"""1,0] 
  ...Pepoment:_xact.c gives $$1 a 15,15.0,2 PEP-O-MINT 15,15.3,0 
  ...Juicy Fruit:_xact.c hands a pack of 15,15*8,8*4,8<1,8JUICY FRUIT4,8>8,8*15,15* to $$1 $+ !
  ...Lifesavers:_xact.c hands $$1 some 15,15.0,2L1,9I0,3F0,4E1,8S0,10A0,4V0,3E1,9R0,5S15,15. 
  ...Tootsie Roll:_xact.c gives $1 a 1,0>(16.4,4.5,5.16,5Tootsie Roll5,5.4,4.1,0 )< 
  ...Hersheys Bar:_xact.c gives $$1 a 15,1515,5 HERSHEY'S 15,15.15,15
  ...Dick:_xact.c hands $$1 his tiny dick 4,158=Ð
  ...-
  ...Rose:_xact.c gives $$1 a single Rose 4,1@3--}--}-------
  ...Candy:_xact.c sez to7 $$1 13Which one would 2You6 like 12Sugar? 5,44.0,5TootsieRoll4,45,4.? 15,15.0,2L1,9I0,3F0,4E1,8S0,10A0,4V0,3E1,9R0,5S15,15.? 15,15 0,5 HERSHEY'S BAR 15,15 ? 15,15l1,8<~Juicy-Fruit~>15,15l?
  ...Smiley face:_xact.c 1(:)) $$1 2(:)) $$1 3(:)) $$1 4(:)) $$1 5(:)) $$1 6(:)) $$1 7(:)) $$1 8(:)) $$1 9(:)) $$1 10(:)) $$1 11(:)) $$1 12(:)) $$1 13(:)) $$1 14(:)) $$1 15(:))
  ...Rainbow Hug:_xmsg.c 1,1 1,2 1,3 1,4 1,5 1,6 1,7 1,8 1,9 1,10 1,11 1,12 1,13 1,14 1,15 1,17 1,18 8,1 $$1 1,1 1,2 1,3 1,4 1,5 1,6 1,7 1,8 1,9 1,10 1,11 1,12 1,13 1,14 1,15 1,17 1,18 1,19 | _xmsg.c 1,1 1,2 1,3 1,4 1,5 1,6 1,7 1,8 1,9 1,10 1,11 1,12 1,13 1,14 1,15 1,17 1,18 8,1 $$1 1,1 1,2 1,3 1,4 1,5 1,6 1,7 1,8 1,9 1,10 1,11 1,12 1,13 1,14 1,15 1,17 1,18 1,19 | _xmsg.c 1,1 1,2 1,3 1,4 1,5 1,6 1,7 1,8 1,9 1,10 1,11 1,12 1,13 1,14 1,15 1,17 1,18 8,1 $$1 1,1 1,2 1,3 1,4 1,5 1,6 1,7 1,8 1,9 1,10 1,11 1,12 1,13 1,14 1,15 1,17 1,18 1,19
  ...Film Hug:_xact.c  9,1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! | _xact.c 9,4«º8,4ô9,4º» «º8,4ô9,4º» «º8,4ô9,4º»8,1 $1  9,4«º8,4ô9,4º» «º8,4ô9,4º» «º8,4ô9,4º» | _xact.c 9,1¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
  ...LoVe:_xact.c 20 luvs18 $$1 | _xact.c 16...,20.d88b.d88b, |  /me 16....208888818I2088888 |  /me 16....20`Y8818LUV2088Y'  |  /me 16......20`Y818U208Y' |  /me 16........20`Y' 
  ...Pirated:_xact.c 0....2Pirated by $$1 | _xact.c  2.|'."-._.-""--.-"-.__.-'/ | _xact.c  2.|  \0...... 4.-.0........ 2( | _xact.c  2.|   2.|12haha0.4(@.@)0..12haha0..2) | _xact.c  2.|   .|0..   4'=.|m|.='0....2     / | _xact.c  2.|  /0...    4.='`"``=.0...2    / | _xact.c  2.|.-"-.__.-""-.__.-"-)
  ...Sprinkles:_xact.c sprinkles Stardust and Rose Petals over her Special Friend4*13 ,*11`.`*12~7;*4*13 ~11`;,12.'* `4*13;.11^.12*`* 4*13~.11^.;`12*.7^;.4*13 ,*11`;12~..12 $$1 13 *;11`~7*.12,:* 4*13 ;11.,*12`.`4*13 *11~7;*12~`* 4*13 ;,.11'*`12.;*4*13*;`7~*
  ...Wave Hello to: /me is waving to $$1 HÉ££Ø THÉ®É!!
  ...Wavey Lines:_xact.c says Its¸.·´¯`·.¸.·´¯`·.¸¸.·´¯` $1 ´¯`·.¸¸.·´¯`·.¸.·´¯`·.¸HÉ££Ø THÉ®É
  ...Roller Coster:_xact.c asks $$1 $+ , how was your trip on the,¸¸,ø¤°`°¤ø,¸,NetSplit Roller Coaster,¸,ø¤°`°¤ø,¸¸,?
  ...Roses:_xact.c gives 4@9}->6--·´¯`·.¸¸.·´¯`·10 $$1 6 .¸.·´¯`·.¸.9--<-{4@
  ..Hugs
  ...Hug1:_xact.c hugs you $$1, and says gee your a such a terrific person! :)
  ...Hug2:_xact.c Hugz $$1 *hug*
  ...Hug4:_xact.c Hugs {{{{{{{ $$1 }}}}}}} with both arms...:o)
  ...Hug5:_xact.c 4 {{{{{{{{{{HUG{{{{{{{{{{{13 $$1 4 }}}}}}}}HUG}}}}}}}}}}}}
  ...Hug6:_xact.c HUGS  *«¬¤°^°¤¬»., $$1,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬»., $$1,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬»., $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬»., $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬».,
  ...Hug7:_xact.c  12~§«¥~§«¥~§«4HUG!12 <<< $$1 >>>4 HUG!12»§~¥»§~¥»§~
  ...Hug8:_xact.c   2øHugsø,¸¸,ø¤°`6° $$1  `°¤ø,¸¸,øHugsø,¸¸,ø¤10°`° $$1 `°¤ø,¸¸,ø¤°5`° $$1 `°¤ø,¸¸,ø¤°
  ...Hug9:_xact.c 4 HUGS 1(¯`·._(¯`·._(¯`·._( $$12 )_.·´¯)_.·´¯)_.·´¯)
  ...Hug10:_xact.c hugs 3¸,ø¤°`°¤ø,¸¸,ø¤°` $$15 `°¤ø,¸¸,ø¤°`°¤ø,¸
  ...Hug11:_xact.c  1ø¸¸,ø4Hugz2ø,¸¸,ø3¤°`°`°¤6ø,¸¸¸¸,5  $$16 ,¸¸,4Hugz2ø,¸¸,ø3¤°``°¤2ø,¸¸,ø4Hugz6ø,¸¸, 5 $$1 6,¸¸,4Hugz2ø,¸¸,ø3¤°`°`°¤2ø,¸¸,ø4Hugz2ø,¸¸,øø¸¸,ø4Hugz2ø,¸¸,ø3¤°`°`°¤2ø,¸¸,ø4Hugz6ø,¸¸, 5 $$16 ,¸¸,4Hugz2ø,¸¸,ø
  ...Hug12:_xact.c  hugs °º©o.,.o©º°¨°º©  $$1  ©º°¨°º©o.,.o©º°
  ...Hug13:_xact.c HUGZ ,``~` $$1 :,.`*':',`;*`,~;`~ $$1 `:,.`*':',`;`,~;~`:,.`*':',` $$1 ;*`,~; `*,`^';` ~ $$1 ,.*'`": ,`~`:,.`*`,~;`* $$1 ,` ^';`~, $$1 .*'`":,` ~`:,.`*':',`;* $$1 ~;`*,`^';`~,.*'`":, $$1 `~`:,.`*`,~;,``~`: $$1 ,.`*':',`;,``~`:,.`*':',`;*`,~; $$1 `~`:,.`*':',`;` $$1 ,~;~`:,.`*':',`;*`,~; `*,`^';` ~ ,. $$1 *'`": ,`~`:,.`*`,~;`*,` ^';`~,. $$1 *'`":,` ~`:,.`*':',`;* ~;`*,`^';`~,.*
  ...Hug14:_xact.c HUGS .«¬¤°^°¤¬»., $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬».,  $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬».,  $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬»., $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬».,
  ...Hug15:_xact.c HUGS (¯`·.(¯`·.(¯`·. ---{@ $$1 @}--- .·´¯).·´¯).·´¯)
  ...Hug16:_xact.c ,¸¸,øHugsø,¸¸,ø¤°`° $$1 `°¤ø,¸¸,øHugsø,¸¸,ø¤°`°
  ...Hug17:_xact.c --<---<{@((HugzForU|| $$1 ||HugzForU))@}>--->---
  ...Hug18:_xact.c hugs * |(_¸.·'´(_¸.·'´ \ !¡!¡!¡!¡!¡!¡!|»»» $$1 «««|!¡!¡!¡!¡!¡!¡!¡ /`'·.¸_)`'·.¸_)|*
  ...Hug19:_xact.c HUGS  to u $$1~`;.~`;.*`;.`~;`~`*`;.~`;.*  $$1  `;.`~;`~`*~`;.~`; .*`;.`~; ``*~`;.~`  $$1 `~`*~`;.~`;.*`;`~`~`*~`;.~`  $$1  ;.*`;.`~;.*`;.`~;`~`*~` ;.~`;.*`;  $$1 ``~`*~`;.~`;.*`;.`~;~;`~`*~`;.~`  $$1  ;.*`;.`~;`~`*~`;. ~ `.*`;.`~;`~`*~`;  $$1 .~`;.*`;.`~; ~`;.~`;.*`;.`~;`~`*`;.~`;.* `;.`~;`~`*~`;.~`; .*`;.`~; ``*~`;.~`  $$1  `~`*~`;.~`;.*`;`~`~`*~`;.~`  $$1 ;.*`;.`~;.*`;.`~;`~`*~` ;.~`;.*`;  $$1 ``~`*~`;.~`;.*`;.`~;~;`~`*~`;.~`
  ...Hug20:_xact.c {H{*{U{*{G{*{S{*{ $$1 }*}H}*}U}*}G}*}S}
  ...Warm hug:_xact.c 10 Wraps12( ¯`·.,¸¸.·´¯`·.¸¸.->  $$1 12<-.¸¸.·´¯`·.¸¸.·´¯ ) * (¯`'·.¸(¯`'·.¸ ¸.·'´¯)¸.·'´¯) (¯`'·.¸(¯`'·.¸ ¸.·'´¯)¸.·'´¯)* (_¸.·'´(_¸.·'´ `'·.¸_)`'·.¸_) (_¸.·'´(_¸.·'´ `'·.¸_)`'·.¸_) In a13 Warm 4Loving2 Hug 1,8:)
  ...Bright Hugs:_xmsg.c 4,1 * (¯`'·.¸(¯`'·.¸13,1 !!!!!!!!!!!!!! 4,1¸.·'´¯)¸.·'´¯) *   | _xmsg.c 4,1 * (¯`'·.¸(¯`'·.¸12 Ÿ8Ÿ9Ÿ10Ÿ11Ÿ12Ÿ13Ÿ4Ÿ12Ÿ7Ÿ4Ÿ13Ÿ8Ÿ15Ÿ 4,1¸.·'´¯)¸.·'´¯) *  | _xmsg.c 3,1 ----==>>>>------>8,1- $$1 - 3,1<------<<<<==----  | _xmsg.c 4,1 * (_¸.·'´(_¸.·'´13 Ÿ8Ÿ9Ÿ10Ÿ11Ÿ12Ÿ13Ÿ4Ÿ9Ÿ7Ÿ10Ÿ11Ÿ12Ÿ13Ÿ 4,1`'·.¸_)`'·.¸_) *  | _xmsg.c 4,1 * (_¸.·'´(_¸.·'´ 13,1¡¡¡¡¡¡¡¡¡¡¡¡¡¡4,1 `'·.¸_)`'·.¸_) * 
  ...MissUHug:_xmsg.c I've 13ø,¸¸,ø Missed 13ø,¸¸,ø You 13ø,¸¸,ø $$1 4*hug*
  ...WatAHug(Gd):_xact.c sends a9,1 Big...4,1Giant......12,1Extra 13,1Super 0,1Large.....8,1and 4,1Really 9,1nifty 12,1Huggle 0,1your 13,1way 11,1 $$1 9,1 :)
  ...WatAHug(bad):_xact.c  8,1Gives11,1 $$1 12,1a9,1 Terrorfyingly, 4,1Horribly, 13,1Sadistic, 12,1and 9,1Super 4,1Evil 8,1HugGle1,1..........0,11.<<<<<<12,11Booooooo0,11>>>>>>1,1.............
  ...Hug&Kisses1:_xact.c <h><u><g><s> $$1 <k><i><s><s><e><s>
  ...Hug&Kisses2:_xact.c ~*}{ÜÇ§*Ñ*kî§§è§*~ $$1 ~*kî§§è§*Ñ*}{ÜÇ§*
  ...BigHug1:_xact.c  gives  º°¨¨°º©o¿,¿o©º°¨¨°º©{{  $$1  }}©º°¨¨°º©o¿,¿o©º°¨¨°º a big hug!
  ...BigHug2:_xact.c gives $$1 4 «ºôº»6 BIG HUGS 4«ºôº»  $$1 4«ºôº»6 BIG HUGS4 «ºôº»
  ...SqueezeHug:_xact.c 12 loves to squeeze ¬ª*^13,8 $$1 12 ^*ª¬._ _.¬ª*^13,8 $$1 12 ^*ª¬._ _.¬ª*^13,8 $$1 12 ^*ª¬._ _.¬ª*^ 13,8 $$1 12^*ª¬._ _.¬ª*^13,8 $$1 12 ^*ª¬._¬ª*^ 13,8 $$1 12^*ª¬._ _.¬ª*^13,8 $$1 12^*ª¬._ _.¬ª*^13,8 $$1 12^*ª¬ tight!!!
  ...LoveBugHug:_xmsg.c 1(4:1Ï4:1) 1(4:1Ï4:1)4 $$1 1(4:1Ï4:1) 1(4:1Ï4:1) 3 Love Bug Hugs 
  ...ColorHug:_xmsg.c 2øHugsø,¸¸,ø¤°`6° $$1  `°¤ø,¸¸,øHugsø,¸¸,ø¤10°`° $$1 `°¤ø,¸¸,ø¤°5`° $$1  `°¤ø,¸¸,ø¤°
  ...HugLady:_xact.c   hugs this very SPECIAL lady , ©¤.¸¸.¤© $$1  ©¤.¸¸.¤© ©¤.¸¸.¤© $$1  ©¤.¸¸.¤© ©¤.¸¸.¤© $$1  ©¤.¸¸.¤© ©¤.¸¸.¤© 
  ...HugTight:_xact.c  º°¨¨°º(c)o¿,¿o(c)º°¨¨°º(c){{ *HUGS* }}(c)º°¨¨°º(c)o¿,¿o(c)º°¨¨°º $$1 very tight !!!
  ...WarmHug:_xact.c   Wraps 11( ¯`·.,¸¸.·´¯`·.¸¸.-> 2 $$1 11 <-.¸¸.·´¯`·.¸¸.·´¯ ) 12* 11(¯`'·.¸(¯`'·.¸ ¸.·'´¯)¸.·'´¯) (¯`'·.¸(¯`'·.¸ ¸.·'´¯)¸.·'´¯) 12* 11(_¸.·'´(_¸.·'´ `'·.¸_)`'·.¸_) (_¸.·'´(_¸.·'´`'·.¸_)`'·.¸_) 12In a Warm  Hug 2 :)
  ...LoveHugs:_xact.c 4£ô¥ÉHugs £ô¥É*£ô¥É*£ô¥É*£ô¥É 13 $$1 4£ô¥É*£ô¥É*£ô¥É*£ô¥É £ô¥ÉHugs
  ...Stars&Hugs:_xact.c 12throws 6stars and 12hugs6 all over4 $$1 11 * `8* `11 *8 ` *12hug 11` *8 `*11` *8 ` *11 `*12hug 8` *11 ` * 8` *11 ` * 8` *12hug 11` *8 ` *11 ` *8 ` *2 hug 11` *8 ` *11 ` *8 ` *11` *8 ` *12hug 11` *8 ` *11 ` *8 ` *11 ` *8 ` *12hug 11` *8 ` *11 ` *
  ...MegaHug:_xact.c gives 3 $$1 6 a special canadian 13*MEGA* 4 {H}*{U}*{G} 6 because I like you:))))))))
  ...HugeHug:_xact.c gives4 $$1 12a13 HUGE 12:: 4HUG 12::4!  
  ...BigBearHug: /me gives $$1 a BIG BEAR HUG
  ...NvSawB4Hug:_xact.c  gïvê§  $$1 å ßïg hüg £ïKê §hê ñêvê® §åW ßêfð®ê....
  ...RainbowHug:_xact.c gives  $$1 9 4a 1R5A7I12N8B3O11W 1H2U3G4!1(2(3(4(5(6(7(8(9(10(11(12(13(14(15( 13 15)14)13)12)11)10)9)8)7)6)5)4)3)2 )1)
  ...Rose Hug:_xmsg.c 4@3}9_(¯`·.4@3}9_(¯`·._( $$1 9)_.·´¯)_3{4@9.·´¯)_3{4@ | _xmsg.c  4@3}9¯(_.·´4@3}9¯(_.·´¯( $$1 9)¯`·._)¯3{4@9`·._)¯3{4@
  ...2arrowsonblck:_xact.c 13,1 (¯`'·.¸(¯`'·.¸4 _________________13,1 ¸.·'´¯)¸.·'´¯) | _xact.c 11,1 (¯`'·.¸(¯`'·.¸ 11 Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ 11,1 ¸.·'´¯)¸.·'´¯) | _xact.c 4,1 ----==>>>>-------> 4 $$1 4,1 ----==>>>>------> | _xact.c 11,1 (_¸.·'´(_¸.·'´ 11 Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ 11 `'·.¸_)`'·.¸_) | _xact.c 13,1 (_¸.·'´(_¸.·'´4 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯13,1 `'·.¸_)`'·.¸_)
  ...Arrowhug1 :_xact.c 4 (¯`'·.¸(¯`'·.¸11 _______________ 4¸.·'´¯)¸.·'´¯) | _xact.c 4 (¯`'·.¸(¯`'·.¸ 12ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ 4¸.·'´¯)¸.·'´¯) | _xact.c 13 ---==>>>>-----> 3 $$1 13 <-----<<<<==--- | _xact.c 4 (_¸.·'´(_¸.·'´ 12ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ 4`'·.¸_)`'·.¸_) | _xact.c 4 (_¸.·'´(_¸.·'´11 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ 4`'·.¸_)`'·.¸_).
  ...Arrowhug2 :_xact.c 4 (¯`'·.¸3(¯`'·.¸ 8,1ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ4,0 ¸.·'´¯)6¸.·'´¯) | _xact.c 2 ---==>>>>-----> 12 $$1 2 <-----<<<<==--- | _xact.c 4 (_¸.·'´3(_¸.·'´ 8,1ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ4,0 `'·.¸_)6`'·.¸_) 
  ...Smallarrowhug:_xact.c ......     4(¯`'·.¸2(¯`'·.¸ 8¸.·'´¯)6¸.·'´¯) | _xact.c ..  3<----==>>>>---->  14,11 $1 12,0<----==>>>>----> | _xact.c .......    4(_¸.·'´2(_¸.·'´ 8`'·.¸_)6`'·.¸_)
  ...Big:_xact.c gives $$1 a great BIG {{{ hug }}}
  ...Run Up:_xact.c runs up to $$1 and gives him a warm {{{ hug }}}
  ...Breathe:_xact.c hugs $$1 so tight and warm that $$1 has to tap $me on the shoulder and mention that $$1 has to breathe!
  ...Fall Over:_xact.c runs over to $$1 $+ , $me puts their arms around $$1 $+ , squeezes $$1 real tight, picks $$1 up to swing them around but falls over instead. *THUMP*
  ..Slaps
  ...Trout:_xact.c slaps $$1 around a bit with a large trout
  ...Head:_xact.c slaps $$1 upside the head
  ...Slap Back:_xact.c slaps a large trout around a bit with $$1
  ...Forehead:_xact.c slaps $$1 on the forehead
  ...No Reason:_xact.c slaps $$1 for no reason
  ...Likes It:_xact.c slaps $$1 ..and $$1 likes it
  ...-
  ...Keyboard:_xact.c slaps $$1 around a bit with an old keyboard!
  ...Cactus:_xact.c slaps $$1 around a bit with a large cactus!
  ...Duck:_xact.c slaps $$1 with a great BIG rubber duck!
  ...Diaper:_xact.c slaps $$1 with an old diaper full of extricated chile burritos!
  ...Bad Trout:_xact.c slaps $1 around a bit with a Hairy, Slimy, Smelly, RadioActive trout !
  ...Steel Rod:_xact.c slaps $$1 around a bit with a steel rod!
  ...Hard Disk:_xact.c slaps $$1 around a bit with a 30 GigaByte Hard Disk!
  ...Whale:_xact.c slaps $$1 around a bit with a small whale!
  ...ChanServ:_xact.c slaps $$1 around a bit with ChanServ!!
  ...Dictionary:_xact.c slaps $$1 around a bit with a Dictionary..Here read this!!
  ...Chair:_xact.c slaps $$1 around a bit with a folding chair!
  ...Sock:_xact.c slaps $$1 around a while with a wet stinky sock!
  ...Trojan:_xact.c slaps $$1 around a while with a Trojan Virus!
  ...Menu:_xact.c Beats on $$1 awhile with $$?="Using a What??"
  ...slap?:_xact.c slaps $1 with a $?="Slap with what?:"
  ...doh:_xact.c slaps $$1 on the forehead - DOH!
  ...2nickslap(pick 2):_xact.c slaps $$1 with $$2
  ...like slap:_xact.c slaps $$1 around a bit and $$1 likes it..
  ...carp:_xact.c hits $$1 with a old, smelly, Carp! 3><((12 $+ $1 $+ 3((º> *SPLURT*
  ...underoos:_xact.c slaps $$1 with a squishy pair of superman underoos!!
  ...pop bottle:_xact.c hits $$1 over the head repeatidly with a empty 2 liter plastic coca-cola bottle bought at Albertsons Grocery on Hall Blvd in Beaverton, Oregon USA *boink* *boink*
  ...diaper:_xact.c slaps $$1 with an old diaper full of extricated chile burritos!
  ...peas!:_xact.c slaps $$1 around a bit with a large bag of frozen peas.  ¤¤whack¤¤
  ...bonk!:_xact.c *bonks* $$1 on the head with a bag of frozen marshmellows.
  ...Multi slap:_xact.c slaps $nick(#,1) $nick(#,2) $nick(#,3) $nick(#,4) $nick(#,5) $nick(#,6) $nick(#,7) $nick(#,8) $nick(#,9) $nick(#,10) $nick(#,11) $nick(#,12) $nick(#,13) $nick(#,14) $nick(#,15) $nick(#,16) $nick(#,17) with large trouts
  ..Kisses
  ...French:_xact.c gives $$1 a long french kiss!
  ...ShutUp Kiss:_xact.c kisses $$1 to shut her up.
  ...Run Up:_xact.c runs up to $$1 and kisses her on the check!
  ...Smooch:_xact.c lays BIG smoochers on $$1's lips!
  ...Passionately:_xact.c takes $$1 in Arms and Kisses Passionately.
  ...Sloppy:_xact.c gives $$1 a great BIG sloppy kiss :Þ~
  ...Kiss Hand:_xact.c gets down on one knee and takes $$1's hand. Raises it up and Kisses it ever so gently. What a sweet taste. :)
  ...Kiss hand2:_xact.c takes $$1's hand..kisses them...and says "Pleasure My lady.."
  ...Kiss:_xact.c kisses $$1... You taste sweet :)
  ...Bend Kiss:_xact.c grabs $$1, spins $$1 around and gives $$1 the softest sweetest kiss $$1 has ever had!!! :)
  ...Kiss cheek:_xact.c 13grabs12 $$1 13& gives a huge, wet, sloppy, passionate, loving, breath taking4 * * * KISS * * * 13on the cheek!
  ...Kiss On Lips:_xact.c kisses $$1 smack dab on the lips!
  ...Sloppy Kiss:_xact.c gives $$1 a Sloppy Wet Kiss 12=8-Þ
  ...Kiss Goodnight:_xact.c kisses $$1 goodnight!
  ...Long kiss :_xact.c gives $$1 a Super Tight Really Super Erotic Groping, Fondling, Earth Shattering, Sonic Boom, Oh Gawd!! If You Stop I'll Kill You!! Oh yes touch me there, Super Huge Oh Gawd Don't Ya Dare Stop Touching Me!! Huggeroonies And A Knees Are Shaking....Earth Is Trembling, My Heart Has Stopped Beating....Knees Shaking...Lots A Goosebumps, Was That The Ground Moving¿?¿ Passionate Wet Lingering kiss!
  ...3daykiss:_xact.c 12,1gives11,1 $$1 12,1a 13,1long, slow, warm kiss12,1 that lasts 3 days!!!!
  ...Breath Away:_xact.c gets a kiss so hard, it takes $$1's breath away!
  ...Computer kiss:_xact.c gives $$1 a monitor-fritzing, keyboard-sticking, ram-overheating, hard-drive-crashing, modem-frying kiss.
  ...Netsplit Kiss:_xact.c kisses $$1 sooooooo hard that there is an instant netsplit!!
  ...Tongue Kiss:_xact.c 13 :þ :þ :þ :þ :þ :þ :þ :þ :þ :þ 12 kisses $$1 with lots of tongue13 :þ :þ :þ :þ :þ :þ :þ :þ :þ :þ
  ...KissAnywhere:_xact.c 12Gives $1 a long kiss 4 anywhere 12 $$?="He or She?:" wants !!!
  ...Kiss1:_xact.c kisses $$1... You taste sweet :)
  ...Kiss2:_xact.c Ki§§e§ {*{* $$1 *}*} Ki§§e§
  ...Kiss3:_xact.c 13Ki§§ Ki§§ - >4 $$1 13< - Ki§§ Ki§§
  ...Kiss4:_xact.c 4,1((( KI§§§§§§ ¤¤¤  12,1 $$1 4,1  4,1 ¤¤¤ KI§§§§§§ ))) 
  ...Kiss on the cheek :_xact.c kisses $1 on the kiss
  ...Slurp kiss :_xact.c gives $1 a wet kiss
  ...Kiss on the lips :_xact.c gives $1 a big kiss on the LIPS
  ...Awesome kiss :_xact.c gives $1 a long-big-amazing-refreshing-nice-full of energy-3c9o6l13o14u8r10f7u5l-entertaining-sucking-humorous-loving-caring-lip sweling... 4K I S S  
  ...Mega-Kiss:_xact.c ( ( $1 ) ) *SuperTight,AndReally,SuperErotic,Groping,Fondling,EarthShattering,SonicBooming,OhMyGawd,IfYouStopI'llKillYou,ABetterThanHeaven,YetHotterThanHell,WatchWhereYaStickYerHands,SuperHuge,OhMyGawd,OhMyGawd,OhMyGawd,Don'tYaDareStopTouchingMe,HuggerooniesAndzMyKneesAreShaking,EarthIsTrembling,MyHeartHasStopBeating,PassKneesShaking,LotsAGoosebumps,WasThatTheGroundMoving,Passionate,WetDeepLngering,SoulShatteringKiss*
  ...Small kiss :_xact.c gives $1 a 0.1 second kiss
  ...Long kiss :_xact.c gives $1 a 9 minute kiss !!!!!!! W O W
  ...Choose kiss :_xact.c gives $1 a $?="Enter how long the kiss is (seconds/hours/minutes) kisses
  ...Rose kiss :_xact.c gives $1 a rosy kiss |----{---4@3---}----|
  ...Double rose kiss :_xact.c gives $1 a double rosy kiss 3|----{---4@ 13$! 4@3---}----|
  ...Plain kiss :_xact.c gives $1 a <><><><><><><><>KISS<><><><><><><><>
  ...Upside down kiss :_xact.c gives $1 an 6UpSiDe-dOwN 7KiSs
  ...Passionate kiss :_xact.c gives $1 a passionate kiss that /\/\/\/\/\/\ 5could melt everything /\/\/\/\/\/\
  ...Everlasting kiss :_xact.c gives $1 an everlasting 12@@@@@@@@4K I S S12@@@@@@@@
  ...Colourful kiss :_xact.c gives $1 a 7k8i9s11s of colour 
  ...Kiss Cheek:_xact.c kisses $$1 on the cheek
  ...Kiss On Lips:_xact.c kisses $$1 smack dab on the lips!
  ...Kiss Hand:_xact.c gets down on one knee and takes $$1's hand. Raises it up and Kisses it ever so gently. What a sweet taste. :)
  ...Kiss Neck:_xact.c 4{K}*{I}*{S}*{S}*{E}*{S} $$1 lightly on the neck.WOW! what a wonderful Perfume!! I am in love!
  ...Kiss At?:_xact.c  13grabs12 $$1 13& gives a huge, wet, sloppy, passionate,loving, breath taking4 * * * KISS * * * 13on the (XXX)!!  
  ...Passion Kiss1:_xact.c  grabbs  $$1 and gives her the most passionate, earthshaking, kiss she ever had in her whole life!!!`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`WOW!!!!!!!
  ...Passion Kiss2:_xact.c  }-{ôt PÅ§§îôñåté $$1 KÌ§§è§ !¡¡! $$1 }-{ôt PÅ§§îôñåté $$1 KÌ§§è§ !
  ...Blow Kiss1:_xact.c 12blows some 4kisses your way 12»»--4(¯`°´¯)12=4(¯` °´¯)12---»»4 4 $$1 
  ...Blow Kiss2:_xact.c  12blows 1a 13kiss 1to $$1
  ...Soft Kiss:_xact.c grabs $$1, spins $$1 around and gives $$1 the softest sweetest kiss $$1 has ever had!!! :)
  ...Sloppy Kiss:_xact.c gives $$1 a Sloppy Wet Kiss 12=8-Þ
  ...Kiss Goodnight:_xact.c kisses $$1 goodnight!  
  ...Hotstuff:_xact.c Slides up nice and close to $1 and says, "Hey there hot stuff, Gotta little kissey poo for me? huh? come on pretty please!!! 12:4)14
  ...Lick:_xact.c licks $$1 across the face...mmmmm...tastes like candy. :)
  ...Kiss&grope:_xact.c  blows $$1 an old fashioned kiss and gives her an old fashioned grope
  ...Run&Kiss:_xact.c runs up to $$1 and slaps a kiss *smack* on her lips, then runs like hell the other way!!!
  ...SuPeR Kiss :_xact.c gives $$1 a Super Tight Really Super Erotic Groping, Fondling, Earth Shattering, Sonic Boom, Oh Gawd!! If You Stop I'll Kill You!! Oh yes touch me there, Super Huge Oh Gawd Don't Ya Dare Stop Touching Me!! Huggeroonies And A Knees Are Shaking....Earth Is Trembling, My Heart Has Stopped Beating....Knees Shaking...Lots A Goosebumps, Was That The Ground Moving¿?¿ Passionate Wet Lingering kiss*
  ...WhisperKiss:_xact.c walks over and gives a little kiss on $$1's neck and then stays there like $me is whispering something seductively in $$1's ear. | _xmsg.c i wonder what that could be
  ...3daykiss:_xact.c 12,1gives11,1 $$1 12,1a 13,1long, slow, warm kiss12,1 that lasts 3 days!!!!
  ...Wowkiss:_xact.c says after kissing $$1 ..2.I climbed up the door, and shut the stairs.....3I said my clothes, and pulled on my prayers.....14I shut off my bed, and climbed in to the light....12.All because $$1 kissed me goodnight!!! 4,1 WOW  4 What a kiss!! 
  ...Woohoo:_xact.c  gives $$1 a Heart stopping, expolsion starting,Really Long..and extra deep..super Duper..and really 4hot...peck on the cheek
  ...Big Kiss:_xact.c slides over to $$1 dips her & french kisses her so deeply  that her toes curle & she almost faint, so now he has to re kiss her to reviver her..... ;)
  ...MindBlow Kiss:_xmsg.c  1gives $$1 a Really 4Hot..4Erotic1..Earth Shattering, Soul Burning, 2Oh My Gawd If I Stop Now I'll Die1, Better Than Heaven, Yet 4Hotter1 Than 4Hell1, Groping, Don't Stop Touching 4Me1, Blood 4Boiling1, 2OhGawdOhGawdOhGawd Soul Stealing1, Dream Making, Close To 4X1Rated, Hand Trembling, Knee Buckling, 4Heart 2Stopping1, Body Tingling, Earth Quake'g, 4Passion1 Exploding, 2Wet1, Deep, Hard, Long, Lingering, 4Kiss!!!!!!!!!
  ...Kiss-woah:_xmsg.c 2takes4 $$1 2into his arms, gazes deeply into her eyes and gives her a slow, deep, hot, wet, passionate 12~tingling~ 2knee-buckling 4kiss 2that makes goosebumps, 13sparks 2fly, and 11steam rise! 4<only the very experienced can keep from passing out!>
  ...Kiss:_xact.c 4**kisses** $$* $+ !
  ...ShutUp Kiss:_xact.c kisses $* to shut her up!
  ...Slow Kiss:_xact.c takes $$* into his arms and kisses her passionately.
  ...Kiss Cheek:_xact.c kisses $$1 on the cheek
  ...Kiss on Lips:_xact.c kisses $$1 smack dab on the lips!
  ...Kiss Goodnight:_xact.c kisses $$1 goodnight!
  ...Sloppy Kiss:_xact.c gives $$1 a Sloppy Wet Kiss =8-Þ
  ...BlowKisses:_xact.c 12blows some 4kisses your way 12»»--4(¯`°´¯)12=4(¯`°´¯)12---»»4 4 $$1 
  ..Faces
  ...Type 1
  ....Smiley:_xmsg.c 1,8: )   
  ....Big Smile:_xmsg.c 1,8: D
  ....Indifferent:_xmsg.c 1,8: I 
  ....Sarcastic:_xmsg.c 1,8: > 
  .....Kid w/cap:_xmsg.c 1,8¶: P)--|----<
  .....Vampire:_xmsg.c 1,8:[    
  ....Johnny smiley:_xmsg.c 1,8¶: )   
  ....Cap and tongue:_xmsg.c 1,8¶ 12:4Þ  
  ....Angry:_xmsg.c 1,8>: (   
  ....Frown:_xmsg.c 1,8: (   
  ....Wink:_xmsg.c 1,8; )   
  ....Blue Magic:_xmsg.c 1,8=)
  ....Addict:_xmsg.c 1,8% o
  ....Cyclops:_xmsg.c 1,8@ )
  ....Surprised:_xmsg.c 1,8: o
  ....Robot:_xmsg.c 1,8[ :) ]
  ....Blue Smiley:_xmsg.c 0,12 :)
  ....Weird Smile:_xmsg.c 1,8:}
  ....Devilish:_xmsg.c 1,8>:- > 
  ....Devilish Wink:_xmsg.c 1,8>;- >
  ....-
  ....Happy:_xact.c is 6,8 HappY!  1,8: )   
  ....Sad:_xact.c is 12Sad 1,8: (
  ....Confused:_xact.c is 7Confused? 1,8%(
  ...Type 2
  ....Happy 1:_xmsg.c 2¶1,8:4,8)
  ....Happy 2:_xmsg.c 2¶1,8:4,8}
  ....Happy 3:_xmsg.c 2¶1,8:4,8]
  ....Happy 4:_xmsg.c 2¶1,8:4,8>
  ....Very happy:_xmsg.c 2¶1,8:4,8)0,0..2¶1,8:4,8D0,0..2¶1,8:4,8)0,0..2¶1,8:4,8D0,0..2¶1,8:4,8)0,0..2¶1,8:4,8D0,0..2¶1,8:4,8)0,0..2¶1,8:4,8D
  ....Laugh :_xmsg.c 2¶1,8:4,8D
  ....Kiss 1:_xmsg.c 2¶1,8:4,8¤
  ....Kiss 2:_xmsg.c 2¶1,8:4,8*
  ....Smile :_xmsg.c 2¶1,8¦4,8)
  ....Sad :_xmsg.c 2¶1,8:4,8(
  ....Tongue Þ:_xmsg.c 2¶1,8:4,8Þ
  ....Tongue þ:_xmsg.c 2¶1,8:4,8þ
  ....Tongue P:_xmsg.c 2¶1,8:4,8P
  ....Tongue b:_xmsg.c 2¶1,8:4,8b
  ....Super Tongue :_xmsg.c 2¶1,8:4,8Þ0,0..2¶1,8:4,8þ0,0..2¶1,8:4,8P0,0..2¶1,8:4,8Þ0,0..2¶1,8:4,8b0,0..2¶1,8:4,8þ0,0..2¶1,8:4,8P0,0..2¶1,8:4,8Þ
  ....Dont Know:_xmsg.c 2¶1,8:4,8|
  ....Not Happy:_xmsg.c 2¶1,8:4,8S
  ....Cry 1:_xmsg.c 2¶1,8:~4,8O
  ....Cry 2:_xmsg.c 2¶1,8:~4,8(
  ....Questionative 1:_xmsg.c 2¶1,8:4,8/
  ....Questionative 2:_xmsg.c 2¶1,8:4,8\
  ....Hungry/hamsap:_xmsg.c 2¶1,8:4,8)~~~~~
  ....Hamsap face1:_xmsg.c 2¶1,8:4,8D~~~~~
  ....Hamsap face2:_xmsg.c 2¶1,8¦4,8)~~~~~
  ....Hamsap face3:_xmsg.c 2¶1,8¦4,8D~~~~~
  ....Touched:_xmsg.c 2¶1,8:~4,8)
  ....Ghost face:_xmsg.c 2¶1,9:4,9E
  ...Type 3
  ....Happy 1:_xmsg.c 1,8(ñ4,8_1,8ñ)
  ....Happy 2:_xmsg.c 1,8(â4,8_1,8â)
  ....Happy 3:_xmsg.c 1,8(à4,8_1,8á)
  ....Happy 4:_xmsg.c 1,8(ì4,8_1,8í)
  ....Happy 5:_xmsg.c 1,8(ò4,8_1,8ó)
  ....Happy 6:_xmsg.c 1,8(Ò4,8_1,8Ó)
  ....Smile 1:_xmsg.c 1,8(á4,8_1,8á)
  ....Smile 2:_xmsg.c 1,8(ã4,8_1,8ã)
  ....Smile 3:_xmsg.c 1,8(Õ4,8_1,8Õ)
  ....Smile 4:_xmsg.c 1,8(õ4,8_1,8õ)
  ....Smile 5:_xmsg.c 1,8(â4,8_1,8â)
  ....Smile 6:_xmsg.c 1,8(î4,8_1,8î)
  ....Smile 7:_xmsg.c 1,8(T4,8_1,8T)
  ....Sad 1:_xmsg.c 1,8(ó4,8_1,8ò)
  ....Sad 2:_xmsg.c 1,8(á4,8_1,8à)
  ....Sad 3:_xmsg.c 1,8(í4,8_1,8ì)
  ....Sad 4:_xmsg.c 1,8(ú4,8_1,8ù)
  ....Sad 5:_xmsg.c 1,8(Ó4,8_1,8Ò)
  ....Sleep:_xmsg.c 1,8(ú4,8_1,8ú)
  ....Sleeping:_xmsg.c 1,8(ú4,8_1,8ú)2,0 Zzzzzzzzzz.......zzzzzzz......zzzz....zz
  ....Cry 1:_xmsg.c 1,8(Ý4,8_1,8Ý)
  ....Cry 2:_xmsg.c 1,8(ý4,8_1,8ý)
  ....Blur:_xmsg.c 1,8(@4,8_1,8@)
  ..Love Poems
  ... Poem (Love Never)  {
    /..timer35 1 1 _xmsg.c 4Never Say I Love U 
    /..timer36 1 2 _xmsg.c 4If U Dun Really Care
    /..timer37 1 3 _xmsg.c 4Never Talk Of Feelings 
    /..timer38 1 4 _xmsg.c 4If They Aren't Really There
    /..timer39 1 5 _xmsg.c 4Never Hold My Hand
    /..timer40 1 6 _xmsg.c 4If U Mean To Break My Heart
    /..timer41 1 7 _xmsg.c 4Never Say Forever
    /..timer42 1 8 _xmsg.c 4If U Ever Plan To Part
    /..timer43 1 9 _xmsg.c 4Never Look Into My Eyes
    /..timer44 1 10 _xmsg.c 4If U Are Telling Me Is A Lie
    /..timer45 1 11 _xmsg.c 4Never Say Hello
    /..timer46 1 12 _xmsg.c 4If U Think U'll Say GoodBye
    /..timer47 1 13 _xmsg.c 4Never Say That I'm The One
    /..timer48 1 14 _xmsg.c 4If U Dream Of More Than Me
    /..timer49 1 15 _xmsg.c 4Never Lock Up My Heart
    /..timer50 1 16 _xmsg.c 4If U Dun Have The Key
  }
  ... Poem 2 (Love)  {
    /..timer35 1 1 _xmsg.c 9When I Saw U
    /..timer36 1 2 _xmsg.c 9I Was Afraid To Talk To U
    /..timer37 1 3 _xmsg.c 9When I Talked To U
    /..timer38 1 4 _xmsg.c 9I Was Afraid To Hold U
    /..timer39 1 5 _xmsg.c 9When I Hold U 
    /..timer40 1 6 _xmsg.c 9I Was Afraid To Love U
    /..timer41 1 7 _xmsg.c 9Now That I've Love U
    /..timer42 1 8 _xmsg.c 9I'm Afraid To Lose U
  }  
  ...  Poem 3 (Present)  {
    /..timer35 1 1 _xmsg.c 8Yesterday Is A History
    /..timer36 1 2 _xmsg.c 8Tomorrow Is A Mystery
    /..timer37 1 3 _xmsg.c 8And Today Is A Gift
    /..timer38 1 4 _xmsg.c 8That's Why It's Called A Present
  }
  ... Poem (LoveHurts)  {
    /..timer35 1 1 _xmsg.c 12Sometimes Love Hurts
    /..timer36 1 2 _xmsg.c 12But If It Doesn't Hurt
    /..timer37 1 3 _xmsg.c 12Then Itsn't Love Anymore
    /..timer38 1 4 _xmsg.c 12Hold On To The Person U Love
    /..timer39 1 5 _xmsg.c 12Before They Slip Away
    /..timer40 1 6 _xmsg.c 12Or Else U Can Never Get Them Back
  }
  ... Poem (Born)  {
    /..timer35 1 1 _xmsg.c 11I Was Born When U Kissed Me
    /..timer36 1 2 _xmsg.c 11And I Died When U Left Me
    /..timerr37 1 3 _xmsg.c 11But I Lived For The Time U Love Me
  }
  ... Poem (U)  {
    /..timer35 1 1 _xmsg.c 13Until There Was U 
    /..timer36 1 2 _xmsg.c 13I Cry Myself To Sleep
    /..timer37 1 3 _xmsg.c 13WHile I Had U. I Fell Asleep With A Gentle Smile On My Face=)
    /..timer38 1 4 _xmsg.c 13Before I Lost U, I Worried Myself To Sleep
    /..timer39 1 5 _xmsg.c 13Now That I Know U R Gone
    /..timer40 1 6 _xmsg.c 13I Sat At Nite, Waiting For U To Cum Back
  }
  ... Poem [Heart]  {
    /..timer35 1 1 _xmsg.c 7I promise U frm the bottom of my heart
    /..timer36 1 2 _xmsg.c 7I will love U till death do us apart
    /..timer37 1 3 _xmsg.c 7I promise U as a lover and a fren
    /..timer38 1 4 _xmsg.c 7I'll love U like I never love again
    /..timer39 1 5 _xmsg.c 7With everything I am
  }
  ... Poem [Ans]  {
    /..timer35 1 1 _xmsg.c 4Show me a reason, give me a sign
    /..timer36 1 2 _xmsg.c 4Tell me the way we fall out of line
    /..timer37 1 3 _xmsg.c 4Is it today or is it tonight we’ll find
    /..timer38 1 4 _xmsg.c 4The answer to our life
  } 
  ... Poem [Quit]  {
    /..timer35 1 1 _xmsg.c 8Quit playin' games with my heart
    /..timer36 1 2 _xmsg.c 8Before you tear us apart
    /..timer37 1 3 _xmsg.c 8I should've known from the start
    /..timer38 1 4 _xmsg.c 8Before U got in my heart
    ...-
  }
  ... Poem [World]  {
    /..timer35 1 1 _xmsg.c 9WðR|Ð í§ ¢Rúê|,|ðVê |§ ß|íÑÐ,13|ð§T íÑ §âÐÑÉ§§,ß|úR íÑ MíÑÐ,11hÉãRt í§ ßrðKÉÑ,F|âMe HâÐ ÐíÉÐ,4TíMe Hâ§ Pâ§§eÐ & 12hÉ'§ ÑðT MíÑe~
  }
  ... Poem [Hurts]  {
    /..timer35 1 1 _xmsg.c 12¤ 8Ît hùRt§ 2 £óVë §ôMéÖÑê Ñ ñÖT Bê £óVéD ìÑ RêTùrÑ 7BùT wAt ì§ é Mô§t PåìÑFúL ì§ 2 £óVé §ôMëÖñê Ñ 4ñëVéR FìñDÎñG é ÇôúRåGë 2 £êT é PëR§óÑ KñôW HôW Ü Fëê£12¤  
  }
  ...-
  ... Poem [LiBai/Eng]  {
    /..timer35 1 1 _xmsg.c 15[English Verison] Chuang Qian Ming Que Guang
    /..timer36 1 2 _xmsg.c 4The moon light is pouring down on my bedside
    /.timer37 1 3 _xmsg.c 7Like white frost spreading on the ground
    /..timer38 1 4 _xmsg.c 8I look up the bright round moon in the sky
    /..timer39 1 5 _xmsg.c 0And lower my head thinking of my dear hometown
    /..timer40 1 6 _xmsg.c 15-LiBai 
    ..-
  }
  ... Poem [Libai/Sin]  {
    /..timer35 1 1 _xmsg.c 15[Singlish Version] Chuang Qian Ming Que Guang
    /..timer36 1 2 _xmsg.c 14Bedfront Moon Bright Bright
    /..timer37 1 3 _xmsg.c 12Think Is Floor White White
    /..timer38 1 4 _xmsg.c 11Lift Head See Moon Moon 
    /..timer39 1 5 _xmsg.c 0Bow Head Miss Home Home....
    /..timer40 1 6 _xmsg.c 15-LiBai
  }
  ... Poem [Libai/Army]  {
    /..timer35 1 1 _xmsg.c 15[Army Version] Chuang Qian Ming Yue Guang
    /..timer36 1 2 _xmsg.c 3Bedfront Lau Bark Sai (tears drop)
    /..timer37 1 3 _xmsg.c 10Thinking About Exercise (reservist mobilization)
    /..timer38 1 4 _xmsg.c 9Drop Dead Look Into The Sky (run until no breathe)
    /..timer39 1 5 _xmsg.c 0Tong Kor Sia Lang Cai? (my heartache nobody knows)
    /..timer40 1 6 _xmsg.c 15-LiBai  
  } 
  ... Deep love :_xmsg.c 13I know that time can never change the love I have for $1..... Except to make it deeper still with everything we do...... In all my dreams of coming years, you play the greatest part, For I know that time will never change the love within my heart...
  ... Love poem :_xmsg.c 9I always lose control when $1 is by my side. You have become the light of my life. I always enjoy the time I spend with you. Because nothing makes me feel the way you do. I think I'm falling in love with you...
  ... Love :_xmsg.c 12Every time I see your face and I hear your voice, It stirs up feelings inside that I've never felt before. Was it the words you said that made me feel this way? Maybe it was the touch of your hand and the smile on your face...I think I'm falling in love with $1...
  ... Miss u :_xmsg.c 4Tonight I looked up at the stars, And I wondered where you are. Tonight I gazed upon the moon, In hopes that I would see you soon...
  ... TrueLove :_xmsg.c 9True Luv Is Eternal, Cherish Luv When You Got The Chance,Once It Left You, It Will Be Difficult To Get It Back, Dun Let Love Be Onli A Memory
  ...-
  ... Love Poem 01 :_xmsg.c 13 I know that time can never change the love I have for $1..... Except to make it deeper still with everything we do...... In all my dreams of coming years, you play the greatest part, For I know that time will never change the love within my heart...
  ... Love Poem 02 :_xmsg.c 9 I always lose control when $1 by my side. You have become the light of my life. I always enjoy the time I spend with you. Because nothing makes me feel the way you do. I think I'm falling in love with $1 ...
  ... Love Poem 03 :_xmsg.c 12 Every time I see your face and I hear your voice, It stirs up feelings inside that I've never felt before. Was it the words you said that made me feel this way? Maybe it was the touch of your hand and the smile on your face...I think I'm falling in love with $1... 
  ... Love Poem 04 :_xmsg.c 7 You are my best friend and my only true love. I'm sure that you were sent from heaven above. Today is the first day of the rest of our lives. And our future is beginning to look so bright. I think I'm falling in love with $1 ...
  ... Love Poem 05 :_xmsg.c 4 Tonight I looked up at the stars, And I wondered where you are. Tonight I gazed upon the moon, In hopes that I would see $1 soon...
  ... Love Poem 06 :_xmsg.c 8 Tonight you'll look oh so fine, But It will all be in my mind. Tonight you won't even know, That I still love you so... $1
  ... Love Poem 07 :_xmsg.c 10 I can admire your beauty, To which I must stare. Your chin, your mouth, your nose and eyes,  All add to a face so fair...To $1
  ... Love Poem 08 :_xmsg.c 4 I hope that you can accept, How much I really care. A person who loves you more, You can find nowhere... $1
  ..Actions
  ...ToysRUsKid!:_xact.c $c(1) says $c(2) $$1 $c(1) is a Toys R Us kid!!! Don't wanna to grow up!
  ...Fishies:_xact.c Tosses $$1 in the river12¸.·´¯`·.¸¸.·´¯`9><((((º>12¸.·´¯`·.¸9><((((º>4 FISH BAIT9<º))))><12.·´¯`·.¸¸.·´¯`·.¸¸.·´¯`·.¸¸.·´¯`·.¸.·´¯`·.¸9><((((º>4HERE FISHIES9<º))))><12.·´¯`·.¸¸.·´¯`·.¸¸.·´¯`·.¸.·´¯`·..·´¯`·.¸¸.·´¯`·.¸9><((((º>4FISHIE BAIT9<º))))><
  ...FishBait:_xact.c  tosses $$1 in the river9,12 ¸.·´¯`·.¸.·´¯`·.¸¸.·´¯`·.¸ 12,9><((((º>  4,12FISH BAIT 12,9<º))))>< 9,12.·´¯`·.¸ ¸.·´¯`·.¸.·´¯`·.¸¸.·´¯`·.¸12,9 ><((((º>  4,12HERE FISHES 12,9<º))))>< 9,12.·´¯`·.¸ ¸.·´¯`·.¸.·´¯`·.¸¸.·´¯`·.¸ 12,9><((((º> $c(2)2 fishie bait  12,9<º))))><
  ...pie:_xact.c throws 11,12 ----=======|} |} |} |}  ----=======|} |} |}13,12 Pie In Everyone's Faces!!!! 11,12----=======|} |} |} |}  ----=======|} |} |} |}
  ...mice:_xact.c Screams WatCh Out!!! Mousey Attack!!!!!!! 9 <:3 )~~~~ 12 <:3 )~~~~ 8 <:3 )~~~~ 13 <:3 )~~~~ 11 <:3 )~~~~
  ...micegreet:_xact.c  8,12 <:3 )~~~~  13,12 <:3 )~~~~ 9,12 <:3 )~~~~  4,12 $$1  11,12 <:3 )~~~~  9,12 <:3 )~~~~  13,12 <:3 )~~~~
  ...Mad:_xact.c says well $$1 you know that every minute you are angry you waste 60 Happy Seconds :)
  ...Brat!:_xact.c 11,12I am not a brat!13,12 am not... am not... am not 11,12Þ !
  ...Rats:_xmsg.c  12"Rats! Rats! Rats"! 9,12(Translation for the reading impaired):  13,9~~(¸¸ ¸¸ºº>  12,9~~(¸¸ ¸¸ºº>  13,9~~(¸¸ ¸¸ºº>
  ...BIGConfetti:_xact.c  `*~`~`;;.~`;.*`;. `~`~`*~`;.~`;.*`;`~; ~`*~~`;.~`;.*`;.`~; ;.~`;.*`;. `~`~`*~`;.~`;.*`;.~;*`;.`~; ~`*~`~`;.~`;.*`;.`~; ;.~`;.*`;. `~`~`*~`;.~`;.*`;.~;*`;.`~; ~`*~`~` .~`;. *`;.`~; ;.~  $$1  `;.;.`~`~`*~`;.~ `;.*`;.~;*`;.`~; ~ `*,`~`;.~`;.*`;.`~; ;.~`;.*`;. `~`~,`*~`;.~`;.*`;.~;*`;.`~; ~`*~`~`;.~`;.*`;.`~; ;.~`;.*`;. `~`~`*~`;.~`;.*`;.~;*`;.`~; ~`*~`~`;.~`;.*`;.~;*`;.`~; ~`*~` Now get the broom and sweep it up!
  ...Balloons:_xact.c throws 13,9CONFETTI & BALLOONS0,12 in the air for,13,12 $$1  `;~'O~~~*`;.'O~~~~*`;.'`~;`~`O~~~~*`;.'O~~~~*`;.'`~;`~`O~~~*`; .'O~~~~*`;.'`~;`~`O~~~~*`;.'O~~~~*`;.'`~;`~`O~~~*`;.'O~~~~*`;.' `~;`~`O~~~~*`;.'O~~~*`;.'`~;`~`O~~~~*`;.'O~~~~*`;.'`~;`~`O~~~~*`;.'O~~~~*`;.'`~;`~`O~~~~*`;.'`~O~~~~*`;.'`~;`~`O~~~~*`;.'`~O~~ ~~*`;.'`~;`~`O~~~~*`;.'`O~~~~*  13,9Now sweep it up!~!~!
  ...Scream !:_xact.c 12,9Screams  $$1 $+ !!!!!!!!!!!!!13,9 ARGH!!!!!!!!!!!!!!!!!!!!!! 
  ...P§§:_xact.c touches $1 on the arm as a loud "PSSSSSSSssssss" is heard... Let's go cause some Trouble!!!!!!!!!!!!!!!!
  ...She WäîTS:_xact.c hears the Jeopardy theme in the background as she waits for $1 to respond...
  ...He WäîTS:_xact.c hears the Jeopardy theme in the background as he waits for $1 to respond...
  ...innocent:_xact.c stares at the ceiling and whistles innocently....
  ...BadDog:_xact.c slaps $$1 with a rolled up newspaper...bad Dog!!!!!
  ...Fish:_xact.c Pushes $1 Into A Pool Of Piranas... 9 <')))))>< 12SPLaSH!!!!!!! 9 <')))))><
  ...disease:_xact.c 12,1 injects $1 with a syrange filled with  MaD CoW DiSeAsE... 13,1 |==[)XXXX>--- 12,1<Moooooooo> 13,1 |==[)XXXX>---
  ...hammer:_xact.c hits $1 over the head with a Big hammer 12 ====[]  4 Bang!!! 12 ====[]
  ...mouse:_xact.c chases  a Mouse!!!!!! 9 <:3 )~~~~   12 Yummy!!!   9 <:3 )~~~~  
  ...Wedgi:_xact.c looks at $1... | .timer 1 3 _xact.c decides that $1 just doesn't look right.... | .timer 1 7 _xact.c grabs $1 $+ 's pants and pulls them WAAAAY up and wraps them around his head... much better! 
  ...G®îñ:_xact.c grins at $$1 wickedly!
  ..Sexual Love
  ...MaleSex
  ....bite:_xact.c 4< $+ $me $+ > 12Walks over to 15 < $+ $$1 $+ >12 leans in close as he slides his tongue over her neck 15.Then works his tongue around to her earlobe. Makeing 15 < $+ $$1 $+ >15 shiver with sheer pleasure12 as he licks around her earlobe before biting gentley on her earlobe  
  ....divein:_xact.c 4< $+ $me $+ > 9dives between4 < $+ $$1 $+ >9 legs, and thrusts his tongue inside 4 < $+ $$1 $+ >9 juicy wet cunt.Licks away as he slides his tongue deeper inside 4 < $+ $$1 $+ >9 wet,delicious, hot and very tasty pussy.  
  ....fingers:_xact.c 4< $+ $me $+ > 9slides his fingers into4 < $+ $$1 $+ >9 hot,dripping,wet pussy.bringing 4 < $+ $$1 $+ >9to pure exctasy,As he bites into her thigh,drawing the wonderfull taste of4 blood9 as 4 < $+ $$1 $+ >9 reaches the point of climax with an excited scream  
  ....embrace:_xact.c 0< $+ $me $+ > 9 bites into 4< $+ $$1 $+ >8 neck, allowing for the blood to freely pass over his lips, as he takes the life from 4 < $+ $$1 $+ >. | /timer 1 1 /me * 9 Uses his tongue to quicken the flow of the blood as he takes 4 < $+ $$1 $+ >8 to a whole new world of darkness.9 Licks the wound closed as he senses all the blood has been taken out of her | /timer 1 5 /me * 0 $+ $me $+ >8 takes his dagger and slits a fine cut over it, exposing his blood for all to see9 Places his wrist at 4 < $+ $$1 $+ >8 mouth.watching cloesly as 9 < $+ $$1 $+ >8takes the new life he provides from his gapeing wound  | /timer 1 9 /me * 0 $+ $me $+ >8 takes his wrist from her mouth,then licks hsi wound closed.0 $+ $me $+ > smiles down at 4 < $+ $$1 $+ >8 and says "welcome to my family, my new daughter
  ....breasts:_xact.c 4< $+ $me $+ > 9runs his tongue over 4 < $+ $$1 $+ >9 breasts, as he teases the nipple with his fingers. As 4 < $+ $$1 $+ >9 moans out loud4 < $+ $me $+ >  9 bites down on her breast, using his fangs0(V^^^V)4 to pierce the skin on 4 < $+ $$1 $+ > 9 breasts, bringing her to a land of total exctasy  
  ....snog:_xact.c 4< $+ $me $+ > 9looks 4 < $+ $$1 $+ >9 deep within her eyes.As he goes down on 4 < $+ $$1 $+ >9 pussy, to deliver a earth shattering, lots of tongue action 9 snog, that makes 4 < $+ $$1 $+ > 9moan4< $+ $me $+ > 4< $+ $me $+ > 4< $+ $me $+ >9 over and over again   
  ....snog of the centuary:_xact.c 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 wrips of her clothes.As he lifts4 < $+ $$1 $+ >9 up, so her legs are straddling his face,4 < $+ $me $+ >  9delivers the now famous , snog of the century between 4 < $+ $$1 $+ > 9legs 
  ....badgirl:_xact.c 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 since she is being a bad fucking girl9 forces 4 < $+ $$1 $+ >8 over his knee, as he pulls her pants down, and begins to WACK4 < $+ $$1 $+ > 8 ass, good and proper with his0 Paddle
  ....Moan:_xact.c 6Slowly Walks to 9"14 $$1 9" 12Grabbing Her From 15Behind 14And 9"4Thrusting9" 6His 14Hard 9"13Cock9" 11Against Her Tight 13(_Ass_) 9Fealing Him Against 14Her Ass She 6Lets Out An Incredible 9M14o6a14nnnnnnnnnnnnnnnn
  ....Spread:_xact.c 11PaRts 13 $$1 11Legs Thrusting His Wet Tonuge Down tO13 $$1 11Sweet Juicy Pussy And Licking Her CleaN | /timer 1 1 /me * 11Running His Tongue all over her HotBox13 $me 11bEgins To SLip his tongue deepER AND dEEpER inside and Loves The Taste Of13 $$1 11PuSSy
  ....Throw:_xact.c 14When I See You There10 $$1 14I Wanna Throw You Down And Shove My Erect 13Cock14 Into your Hot13 Pussy14 Or You Could Just Get On Your Kness And 10SUCK 14All My 11Cum14 Down Your Throat
  ....Sex1:_xact.c 7,6.·´¯)Vvå£k§ Ûþ †ø $$1 †åKíñg ]-[î§ håñds äñ §£íÐ¡ñg t]-[e]v[ Ùþ $$1's †¡gh† §]-[¡Rt ƒêê£îñg $$1's Ñ¡þþ£ê§ ßêG¡ññ¡ñg †ø }{ârÐëñ ßè†wëëñ }{i§ ƒïñgèRŠ †¡þ§¸Å§ }{è £¡çk§ ]-[¡§ £¡þ§ $$1 *Š*(¯`·.
  ....Sex:_xact.c 14walks over to9 $$1 14and grabs her around the waist really hard thrusting his body against9  $$1 14s13 tits 14feeling her erect13 nipples 14so hard against him | /timer 1 1 /me * 14begins to run his hands lower over her body teasing her to the point of total submission and she is helpless to refuse him and any of his wishes  
  ....assbite:_xact.c 1__________________________-_____4( 0V13^^^^^^^^^^^^^^^^^0V 4) | _xact.c  1__________________________________  8 $$1 's  0 (_|_) | _xact.c 1 ______________________-________ 4( 13/\15vvvvvvvvvvvvvvv13/\ 4)ds down over9  $$1 s13 tits 14and slides them into her pants to feel how wet9  $$1 s13 pussy 14is for him. | /timer 1 2 /me * 14 then slowly starts to rub9  $$1 14s wet13 pussy 14knowing she loves it by the expression on her beautiful face,9 $$1 14begins to pull9 $me 14s hand harder into her13 pussy 14wanting him to 4fuck 14her13 pussy 14with his fingers so hard and make her 11cum14!
  ....cockslap:_xact.c 14Come Her15e $$1 it's time f14or you to ge15t13 (_)_)lllllllllD 15slapped bitch.  W14here do you want i15t $$1 ?  Your ass o14r your face?
  ....ass:_xact.c 10Mind if I re14ach aroun15d $$1 and pla10y with yo14ur 13 "TITS" 14while I fuck y15ou in the13 (_ass_) 
  ....Licks-edited:_xact.c 4putš hiš finger in hiš mouth and walkš up to 6 $$1 4and šlowly runš hiš finger down my šhirt and over my nipple. Saying "I'll HeLpš you get out of thoše wet clotheš 6 $$1 4" 13®
  ....2spots-ed:_xact.c 15«14§15»4«12§4»0«6§0»14«15§14»12«4§12»6«0§6» 15HeY 14 $$1 4I'vE 12GoT 0TwO 6§pots 14Of 15ThRoBbInG 12LoVe 4FoR 6YoU 15«14§15»4«12§4»0«6§0»14«15§14»12«4§12»6«0§6» 13®
  ....Blow-ed:_xact.c 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 4Let's 0PLAY 4army! 0You 4lay down 0 $$1 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­4, and I'll 0ß£ØW 4the hell out of YoU! 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 13®      
  ....Question:_xact.c ­­12Bend over­15 < $+ $$1 $+ > 12Then you got to decide, do I smack your ass with my paddle or Just fuck you good and proper?­
  ....Hungry:_xact.c  4Im 5f4eeling a  5l4ittle hungry 3 $$1 4I fancy 5h4aving some hot,5t4asty pie,with 5d4elicious melons for  5d4essert 5I'm4 sure you can 5h4elp me here3 $$1  | /timer 1 8 /me * 0you say no 3 $$1 0You actually think you have a choice4 COME HERE BITCH 
  ....ShakeRattleAndRoll:_xact.c 11Lets 13shake 0rattle 4and roll10 $$1 0You shake your hand on my cock,ill rattle my fingers in and out of you.7Then ill roll you around and fuck you all night long10 $$1 
  ....Pros:_xact.c 0 $$1 9 and4 $$me 7 THE PROFESSIONAL SLUTS OF ACN
  ....ThankYou:_xact.c 0Thank you for that blowjob last night4 $$1 8 I really enjoyed it that much,I would like another one.0Thow I am a little short of cash, So can I have a freebie4 $$1 
  ....BeatMe:_xact.c 0 You may 12beat me4,frope me15,grope me11,snog me8 $$1 9But goddammit to hell,3You got to let me ram my 9cock into that sweet little0 (_ass_) 3 of yours
  ....Fropes:_xact.c 0Fropes12 $$1 0breasts12 $$me 0thinks theres something wrong here8 oh i see what it is12 $$1 8you still have that silly top on,take it of and free4 them breasts for me to suck and lick like a real pro
  ....LivingHell:_xact.c 0fucks the living hell out of 4 $$1 0 cause she is sexually deprieved and needs a good seeing to
  ....Gropes:_xact.c 12Fropes 11 $$1 8ass12 and8 breasts,12then8 rams12 his8 cock12 into11 $$1 8cunt,12 makeing 8her 12scream8 OMG11 $$me 12you 8are 12my 8master 12and 8the 12RULER8 OF12 THE8 WORLDDDDDDDDDDDDD 
  ....Fishy:_xact.c 6hmmm 0 $$1 3 something smells fishy,4 $$me 6sniffs 0 $$1 3pussy, hmm nope smell not coming from there,3shrugs O well may as well give ya a good licking while I'm here
  ....Angellike:_xact.c 10Be good wittle0 angellike7 $$1 10OMG what the fuck am i talking about, just fuck me now 7 $$1 
  ...FemaleSex
  ....bite:_xact.c 4< $+ $me $+ > 12Walks over to 15 < $+ $$1 $+ >12 leans in close as she slides his tongue over his neck 15.Then works her tongue around to his earlobe. Makeing 15 < $+ $$1 $+ >15 shiver with sheer pleasure12 as she licks around his earlobe before biting gentley on his earlobe  
  ....divein:_xact.c 4< $+ $me $+ > 9dives between4 < $+ $$1 $+ >9 legs, and slides her mouth around his cock.looks up into the eyes of 4 < $+ $$1 $+ >9 Runs her lips up and down the large cock in her hand. Takeing the whole erection in her mouth.4 < $+ $$1 $+ >9 moans with sheer pleasure as 4< $+ $me $+ > 9 sucks faster and faster
  ....hand:_xact.c 4< $+ $me $+ > 9slides her hands around4 < $+ $$1 $+ >9 large,throbbing erection.Watching with a grin as 4 < $+ $$1 $+ >9 moans with the sheer pleasure provided by the quick movements of 4< $+ $me $+ > 9hand. 4 < $+ $$1 $+ >9 reaches the point of climax with an excited scream as 4< $+ $me $+ >  9 licks up all the dripping cum
  ....embrace:_xact.c 0< $+ $me $+ > 9 bites into 4< $+ $$1 $+ >8 neck, allowing for the blood to freely pass over her lips, as she takes the life from 4 < $+ $$1 $+ >. | /timer 1 1 /me * 9 Uses her tongue to quicken the flow of the blood as she takes 4 < $+ $$1 $+ >8 to a whole new world of darkness.9 Licks the wound closed as she senses all the blood has been taken out of him | /timer 1 5 /me * 0 $+ $me $+ >8 takes her dagger and slits a fine cut over it, exposing her blood for all to see9 Places her wrist at 4 < $+ $$1 $+ >8 mouth.watching cloesly as 9 < $+ $$1 $+ >8takes the new life she provides from her gapeing wound  | /timer 1 9 /me * 0 $+ $me $+ >8 takes her wrist from his mouth,then licks her wound closed.0 $+ $me $+ > smiles down at 4 < $+ $$1 $+ >8 and says "welcome to my family, my new son
  ....tease:_xact.c 4< $+ $me $+ > 9runs her tongue over 4 < $+ $$1 $+ >9 chest,flicking at his nipples as she teases him with her tongue 4 < $+ $$1 $+ >9 moans out loud4 < $+ $me $+ >  9as she bites down on his chest with her fangs0(V^^^V)4 Drawing a little blood from 4 < $+ $$1 $+ > 9 chest  
  ....blowjob:_xact.c 4< $+ $me $+ > 9looks 4 < $+ $$1 $+ >9 deep within his eyes.As she goes down on 4 < $+ $$1 $+ >9 cock, to deliver a earth shattering, lots of sucking action 9 blowjob, that makes 4 < $+ $$1 $+ > 9moan4< $+ $me $+ > 4< $+ $me $+ > 4< $+ $me $+ >9 over and over again   
  ....blowjob of the centuary:_xact.c 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 wrips of his clothes.As she lies back with4 < $+ $$1 $+ >9 legs straddling his face,4 < $+ $me $+ >  9 delivers the earth shattering blowjob of the centuary between 4 < $+ $$1 $+ > 9legs 
  ....badboy:_xact.c 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 since he is being a bad fucking boy9 forces 4 < $+ $$1 $+ >8 over her knee, as she pulls his boxers down, and begins to WACK4 < $+ $$1 $+ > 8 ass, good and proper with his0 Paddle
  ....lix:_xact.c 14Pushes her 13( 0 )( 0 ) 14together and LickS her 4LIPS 14 as she looks at 9 $$1 14and wonders if he knows how 10WET 14her 0^pussy^ 14is for 9HIM 
  ....mouth:_xact.c 12FuCk My MoUt2H WiTh YoUr CoC14k $$1 WhiLe I Fu15Ck My CuNt Wi11Th My FiNgE0rS
  ....relaxxx-ed:_xact.c 14Close Your eyes12 $$1 4- RELAXXX - 14think of the sensation of Your CocK sliding up and down my 10WET13PUSSY 14right before You 12FUCK 14me..suck:_xact.c 14If YoU PusH my Hea15D DowN on YouR CocK $$1 I'l13l SucK iT aNd SucK it a15Nd SucK it aNd The14N I'll SucK it SomE mORe !!!!
  ....breath:_xact.c  14wraps her 4HAND 14around11 $$1 's 4THROBBING 14"Love Muscle" and looks into his 4EYES 14slowlyyyy 4LICKING 14the 4TIP 14with her 4TONGUE 14and then blowing on his 4COCK 14with her 4HOT 14breath.
  ....pvt:_xact.c 14If you're horny9 $$1 14heres my pvt room 3#OhYes 14Here's my pussy 13(it's wet) 14Here's some handcuffs 15(oh baby) 14And the rest is up to you9 $$1
  ....pleaseme:_xact.c 0I have 2 13( 0 )v( 0 ) 0and one 15PUSSY 0an 13(_ass_)  0You've got a0 4TONGUE 0a 13(_)_)lllllD 0and 10 14FINGERS0.....Put it all together.... Then cum 3#PLEASE_ME0 $$1
  ....cum:_xact.c 12 $$1 Yo15u can put a sm14ile on my face, o11r you can p12ut your c14um all ov15er it 11!
  ....scrabble:_xact.c 12Pushes the button on the wall.... a spotlight shines on 8\\\0 $$1 8///12...music begins to play. | _xact.c * 12She walks over to the dresser glancing at 0 $$1 12she asks Him if He wants to play a game. | _xact.c * 12 $me opens the drawer and takes out some 4HANDCUFFS 12and some 7VASELINE12, some 9BATTERY OPERATED TOYS12, an 13FEATHER12, and 10 3 BOTTLES OF MASSAGE OILS12, also a 3SILK NITIE12, 8 2 BOTTLES OF TEQUILA12, some 15SHOT GLASSES | _xact.c * 12 Lastly $me removes 13 ThE gAmE oF sCrAbBLe12.  Carrying all of this, she walks over to 0 $$1 12 and whispers.... "If You are feeling really naughty for me, i'll set up the scrabble board"
  ....cum2me:_xact.c 13,6 $$1 YoU sExY BaStArD....cUm To Me BaBy
  ....bj:_xact.c 12GiVeS13 $$1 0a11LoNg12AnD14LiNgErInG15cOcK13hArDeNiNg6HeArT4bEaTiNg3PaLm9SwEaTiNg11NiPpLe12HaRdEnInG14hAiR15rAiSiNg13PuPiL4dIaLaTiNg6HeAd3TuRnInG9bLoW11jOb
  ....Job-ed:_xact.c 2{{{{{12{{{{{11{{{{{0{{{{{ 8ÀrÉ 12You 11AcHing 4 $$1 0?¿? 9CÀusÉ 12YoU 11rÉÀlly 0nÉÉd 6À 12ßLÓwJÒß11, 0but 7YoU'll 12tÀkÉ 11À 0hard 13FuCk 12Ïf 11onÉ's 0ÀvÀiLÀbLÉ, RiGhT? 0}}}}}11}}}}}12}}}}}2}}}}}13® 
  ....Blow-ed:_xact.c 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 4Let's 0PLAY 4army! 0You 4lay down 0 $$1 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­4, and I'll 0ß£ØW 4the hell out of YoU! 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 13®      
  ....urBone:_xact.c 3»»æ0:3{13®3}0:3æ«« 13YoU'll 4£11ove 13Every 11Bone 13In 11my 13Body 11 $$1 13Especially4 Y11ours
  ....Buffett-edited:_xact.c 4¿0?4¿0?4¿0?4¿0?4¿0?4¿0?4Cøûld 0I 4Bë 0Yøûr 4L0ø4v0ë 4B0û4f0f4ë0t 0 $$1 4Sø 0Yøû 4Cøûld 0Låy 4Me 0On 4Thë 0Tåblë 4And 0Eåt 4Whåt 0Yøû 4Wåntëd 0?4¿0?4¿0?4¿0?4¿0?4¿0?4¿13®
  ....Boxing:_xact.c 3Wanna 11Play 3Midget 11Boxing 3 $$1 ? 11I'll 3Get 11Down 3On 11my 3Knees 11And 3Give 11You 3A 11Couple 3Of 11Blows!13® 
  ....hotpussy:_xact.c 14¤¤¤¤ $$1 ¤¤¤¤ 15Guess What! 0I've got an hot, wet pussy! 14And i can feel YoUr Breathe close to it now! 13® 
  ....suck:_xact.c 0Doesn'T cARe AbouT 13jEWELs 0OR 3mONEy 0ShE oNLy WantS to SucK 12 $$1 's 0cOCk
  ....ABC-ed:_xact.c 6I'll Lay down4 $$1 6and part my13 PUSSY LIPS 6for YoU so YoU can spell out the 12A9L13P4H10A0B14E2T 6on my 13CLIT 6with YoUr 4TONGUE
  ....SticksStones:_xact.c 12¤¤¤¤4§ticks 13Änd 12§tones 4Will 13ßreak 12Mý 4ßone§ 13ßut 12HandCuff§ 4Ãnd 13Feather§ 12Excite 13Mé 4¤¤¤¤ $$1 ¤¤¤¤ 13§ex 12i§ 4The 13Thing; 12I 4Like 4Tó 13Dó 12It 4Ñìghtlý 13¤¤¤¤®
  ....Slip:_xact.c 0HeY13"·*:·*"·*:·*"·*:·*" $$1 "·*:·*"·*:·*"·*:·*0HoW13"·*:·*"0AbOuT13"·*:·*"0You13"·*:·*"0§LiP13"·*:·*"0InTo13"·*:·*"  0SoMeThInG13"·*:·*"0MoRe13"·*:·*"0cOmFoRtAbLe13"·*:·*"0LiKe13"·*:·*"0Me13"·*:·*"®
  ....Sleepy:_xact.c 4 $$1 10You 4Are 10Getting.....9SLEEPY6HORNY9SLEEPY6HORNY9SLEEPY6SLEEPY9HORNY14SLEEPYHORNYSLEEPY6SLEEPY9HORNY6SLEEPY9HORNY6SLEEPY14SLEEPYHORNY9SLEEPY6HORNY9SLEEPY6SLEEPY9HORNY6SLEEPY14HORNYSLEEY
  ....Headache:_xact.c 4you gave me a headache with your bitching0 $$1 4 least you could do is give me a blowjob to make up for it 
  ...FemaletoFemale
  ....bite:_xact.c 4< $+ $me $+ > 12Walks over to 15 < $+ $$1 $+ >12 leans in close as she slides her tongue over her neck 15.Then works her tongue around to her earlobe. Makeing 15 < $+ $$1 $+ >15 shiver with sheer pleasure12 as she licks around her earlobe before biting gentley on her earlobe  
  ....divein:_xact.c 4< $+ $me $+ > 9dives between4 < $+ $$1 $+ >9 legs, and thrusts her tongue inside 4 < $+ $$1 $+ >9 juicy wet cunt.Licks away as she slides her tongue deeper inside 4 < $+ $$1 $+ >9 wet,delicious, hot and very tasty pussy.  
  ....fingers:_xact.c 4< $+ $me $+ > 9slides her fingers into4 < $+ $$1 $+ >9 hot,dripping,wet pussy.bringing 4 < $+ $$1 $+ >9to pure exctasy,As she bites into her thigh,drawing the wonderfull taste of4 blood9 as 4 < $+ $$1 $+ >9 reaches the point of climax with an excited scream  
  ....embrace:_xact.c 0< $+ $me $+ > 9 bites into 4< $+ $$1 $+ >8 neck, allowing for the blood to freely pass over her lips, as she takes the life from 4 < $+ $$1 $+ >. | /timer 1 1 /me * 9 Uses her tongue to quicken the flow of the blood as she takes 4 < $+ $$1 $+ >8 to a whole new world of darkness.9 Licks the wound closed as she senses all the blood has been taken out of her | /timer 1 5 /me * 0 $+ $me $+ >8 takes her dagger and slits a fine cut over it, exposing her blood for all to see9 Places her wrist at 4 < $+ $$1 $+ >8 mouth.watching cloesly as 9 < $+ $$1 $+ >8takes the new life she provides from her gapeing wound  | /timer 1 9 /me * 0 $+ $me $+ >8 takes her wrist from her mouth,then licks her wound closed.0 $+ $me $+ > smiles down at 4 < $+ $$1 $+ >8 and says "welcome to my family, my new daughter
  ....breasts:_xact.c 4< $+ $me $+ > 9runs her tongue over 4 < $+ $$1 $+ >9 breasts, as she teases the nipple with her fingers. As 4 < $+ $$1 $+ >9 moans out loud4 < $+ $me $+ >  9 bites down on her breast, using his fangs0(V^^^V)4 to pierce the skin on 4 < $+ $$1 $+ > 9 breasts, bringing her to a land of total exctasy  
  ....snog:_xact.c 4< $+ $me $+ > 9looks 4 < $+ $$1 $+ >9 deep within her eyes.As she goes down on 4 < $+ $$1 $+ >9 pussy, to deliver a earth shattering, lots of tongue action 9 snog, that makes 4 < $+ $$1 $+ > 9moan4< $+ $me $+ > 4< $+ $me $+ > 4< $+ $me $+ >9 over and over again   
  ....snog of the centuary:_xact.c 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 wrips of her clothes.As she lifts4 < $+ $$1 $+ >9 up, so her legs are straddling her face,4 < $+ $me $+ >  9delivers the now famous , snog of the century between 4 < $+ $$1 $+ > 9legs 
  ....badgirl:_xact.c 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 since she is being a bad fucking girl9 forces 4 < $+ $$1 $+ >8 over her knee, as she pulls her pants down, and begins to WACK4 < $+ $$1 $+ > 8 ass, good and proper with her0 Paddle
  ....Moan:_xact.c 6Slowly Walks to 9"14 $$1 9" 12Grabbing Her From 15Behind 14And 9"4Thrusting9" 6Herself 11Against Her Tight 13(_Ass_) 9Fealing Her Against 14Her Ass She 6Lets Out An Incredible 9M14o6a14nnnnnnnnnnnnnnnn
  ....Spread:_xact.c 11PaRts 13 $$1 11Legs Thrusting Her Wet Tonuge Down tO13 $$1 11Sweet Juicy Pussy And Licking Her CleaN | /timer 1 1 /me * 11Running Her Tongue all over her HotBox13 $me 11bEgins To SLip her tongue deepER AND dEEpER inside and Loves The Taste Of13 $$1 11PuSSy
  ....Throw:_xact.c 14When I See You There10 $$1 14I Wanna Throw You Down And Shove my huge 13vibrator14 Into your Hot13 Pussy14 Or You Could Just Get On Your Kness And 10LICK me intill 14I 11Cum14 Down Your Throat
  ....Sex1:_xact.c 7,6.·´¯)Vvå£k§ Ûþ †ø $$1 †åKíñg ]-[êR håñds äñ §£íÐ¡ñg t]-[e]v[ Ùþ $$1's †¡gh† §]-[¡Rt ƒêê£îñg $$1's Ñ¡þþ£ê§ ßêG¡ññ¡ñg †ø }{ârÐëñ ßè†wëëñ }{êR ƒïñgèRŠ †¡þ§¸Å§ }{è £¡çk§ ]-[êR £¡þ§ $$1 *Š*(¯`·.
  ....Sex:_xact.c 14walks over to9 $$1 14and grabs her around the waist really hard thrusting her body against9  $$1 14s13 tits 14feeling her erect13 nipples 14so hard against her | /timer 1 1 /me * 14begins to run her hands lower over her body teasing her to the point of total submission and she is helpless to refuse her and any of her wishes  
  ....assbite:_xact.c 1__________________________-_____4( 0V13^^^^^^^^^^^^^^^^^0V 4) | _xact.c  1__________________________________  8 $$1 's  0 (_|_) | _xact.c 1 ______________________-________ 4( 13/\15vvvvvvvvvvvvvvv13/\ 4)ds down over9  $$1 s13 tits 14and slides them into her pants to feel how wet9  $$1 s13 pussy 14is for her. | /timer 1 2 /me * 14 then slowly starts to rub9  $$1 14s wet13 pussy 14knowing she loves it by the expression on her beautiful face,9 $$1 14begins to pull9 $me 14s hand harder into her13 pussy 14wanting her to 4fuck 14her13 pussy 14with her fingers so hard and make her 11cum14!
  ....Dildo:_xact.c 14Come Her15e $$1 it's time f14or you to ge15t13 fucked with the dildo W14here do you want i15t $$1 ?  Your pussy o14r your ass?
  ....ass:_xact.c 10Mind if I re14ach aroun15d $$1 and pla10y with yo14ur 13 "TITS" 14while I fuck y15ou in the13 (_ass_) 14with a strapon
  ....Licks-edited:_xact.c 4putš her finger in her mouth and walkš up to 6 $$1 4and šlowly runš her finger down my šhirt and over my nipple. Saying "I'll HeLpš you get out of thoše wet clotheš 6 $$1 4" 13®
  ....2spots-ed:_xact.c 15«14§15»4«12§4»0«6§0»14«15§14»12«4§12»6«0§6» 15HeY 14 $$1 4I'vE 12GoT 0TwO 6Holes 14that 15NeEd 12aTtEnTiOn 4FrOm 6YoU 15«14§15»4«12§4»0«6§0»14«15§14»12«4§  
  ....Question:_xact.c ­­12Bend over­15 $$1 12Then you got to decide, do I smack your ass with my paddle or Just lick you good and proper?­
  ....Hungry:_xact.c  4Im 5f4eeling a  5l4ittle hungry 3 $$1 4I fancy 5h4aving some hot,5t4asty pie,with 5d4elicious melons for  5d4essert 5I'm4 sure you can 5h4elp me here3 $$1  | /timer 1 14 /me * 0you say no 3 $$1 0You actually think you have a choice4 COME HERE BITCH 
  ....ShakeRattleAndRoll:_xact.c 11Lets 13shake 0rattle 4and roll10 $$1 0You shake your hand all over my breasts,ill rattle my fingers in and out of you.7Then ill roll you around and lets just cum all night long10 $$1 
  ....Pros:_xact.c 0 $$1 9 and4 $$me 7 THE PROFESSIONAL SLUTS OF ACN
  ....ThankYou:_xact.c 0Thank you for that sex session last night4 $$1 8 I really enjoyed it that much,I would like another one.0Thow I am a little short of cash, So can I have a freebie4 $$1 
  ....BeatMe:_xact.c 0 You may 12beat me4,frope me15,grope me11,snog me8 $$1 9But goddammit to hell,3You got to let me lick that 9sweet little0 (_ass_) 3 of yours
  ....Fropes:_xact.c 0Fropes12 $$1 0breasts12 $$me 0thinks theres something wrong here8 oh i see what it is12 $$1 8you still have that silly top on,take it of and free4 them breasts for me to suck and lick like a real pro
  ....LivingHell:_xact.c 0licks the living hell out of 4 $$1 0cunt,cause she is sexually deprieved and needs a good seeing to
  ....Gropes:_xact.c 12Fropes 11 $$1 8ass12 and8 breasts,12then8 rams12 her8 strapon12 into11 $$1 8cunt,12 makeing 8her 12scream8 OMG11 $$me 12you 8are 12my 8master 12and 8the 12RULER8 OF12 THE8 WORLDDDDDDDDDDDDD 
  ....Fishy:_xact.c 6hmmm 0 $$1 3 something smells fishy,4 $$me 6sniffs 0 $$1 3pussy, hmm nope smell not coming from there,3shrugs O well may as well give ya a good licking while I'm here
  ....Angellike:_xact.c 10Be good wittle0 angellike7 $$1 10OMG what the fuck am i talking about, lets 69 and lick away like 2 fucking horny sluts 7 $$1 
  ....Tease:_xact.c 7Stop teasing the males10 $$1 7and get your cute self over here and tease my clit instead
  ...MaleToMale
  ....bite:_xact.c 4< $+ $me $+ > 12Walks over to 15 < $+ $$1 $+ >12 leans in close as he slides his tongue over his neck 15.Then works his tongue around to his earlobe. Makeing 15 < $+ $$1 $+ >15 shiver with sheer pleasure12 as he licks around his earlobe before biting gentley on his earlobe  
  ....divein:_xact.c 4< $+ $me $+ > 9dives between4 < $+ $$1 $+ >9 legs, and slides his mouth around his cock.looks up into the eyes of 4 < $+ $$1 $+ >9 Runs his lips up and down the large cock in his hand. Takeing the whole erection in his mouth.4 < $+ $$1 $+ >9 moans with sheer pleasure as 4< $+ $me $+ > 9 sucks faster and faster
  ....hand:_xact.c 4< $+ $me $+ > 9slides his hands around4 < $+ $$1 $+ >9 large,throbbing erection.Watching with a grin as 4 < $+ $$1 $+ >9 moans with the sheer pleasure provided by the quick movements of 4< $+ $me $+ > 9hand. 4 < $+ $$1 $+ >9 reaches the point of climax with an excited scream as 4< $+ $me $+ >  9 licks up all the dripping cum
  ....embrace:_xact.c 0< $+ $me $+ > 9 bites into 4< $+ $$1 $+ >8 neck, allowing for the blood to freely pass over his lips, as she takes the life from 4 < $+ $$1 $+ >. | /timer 1 1 /me * 9 Uses his tongue to quicken the flow of the blood as he takes 4 < $+ $$1 $+ >8 to a whole new world of darkness.9 Licks the wound closed as he senses all the blood has been taken out of him | /timer 1 5 /me * 0 $+ $me $+ >8 takes his dagger and slits a fine cut over it, exposing his blood for all to see9 Places his wrist at 4 < $+ $$1 $+ >8 mouth.watching cloesly as 9 < $+ $$1 $+ >8takes the new life he provides from his gapeing wound  | /timer 1 9 /me * 0 $+ $me $+ >8 takes his wrist from his mouth,then licks his wound closed.0 $+ $me $+ > smiles down at 4 < $+ $$1 $+ >8 and says "welcome to my family, my new son
  ....tease:_xact.c 4< $+ $me $+ > 9runs his tongue over 4 < $+ $$1 $+ >9 chest,flicking at his nipples as he teases him with his tongue 4 < $+ $$1 $+ >9 moans out loud4 < $+ $me $+ >  9as he bites down on his chest with his fangs0(V^^^V)4 Drawing a little blood from 4 < $+ $$1 $+ > 9 chest  
  ....blowjob:_xact.c 4< $+ $me $+ > 9looks 4 < $+ $$1 $+ >9 deep within his eyes.As he goes down on 4 < $+ $$1 $+ >9 cock, to deliver a earth shattering, lots of sucking action 9 blowjob, that makes 4 < $+ $$1 $+ > 9moan4< $+ $me $+ > 4< $+ $me $+ > 4< $+ $me $+ >9 over and over again   
  ....blowjob of the centuary:_xact.c 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 wrips of his clothes.As he lies back with4 < $+ $$1 $+ >9 legs straddling his face,4 < $+ $me $+ >  9 delivers the earth shattering blowjob of the centuary between 4 < $+ $$1 $+ > 9legs 
  ....badboy:_xact.c 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 since he is being a bad fucking boy9 forces 4 < $+ $$1 $+ >8 over his knee, as he pulls his boxers down, and begins to WACK4 < $+ $$1 $+ > 8 ass, good and proper with his0 Paddle
  ....lix:_xact.c 14rubs his 13cock 14 and LickS his 4LIPS 14 as he looks at 9 $$1 14and wonders if he knows how 10horny 14he 14is for 9HIM 
  ....mouth:_xact.c 12FuCk My MoUt2H WiTh YoUr CoC14k $$1 WhiLe I Wa15Nk Myself Wi11Th My Han0d
  ....relaxxx-ed:_xact.c 14Close Your eyes12 $$1 4- RELAXXX - 14think of the sensation of Your CocK sliding up and down my 10ass13hole 14right before You 12FUCK 14me..suck:_xact.c 14If YoU PusH my Hea15D DowN on YouR CocK $$1 I'l13l SucK iT aNd SucK it a15Nd SucK it aNd The14N I'll SucK it SomE mORe !!!!
  ....breath:_xact.c  14wraps his 4HAND 14around11 $$1 's 4THROBBING 14"Love Muscle" and looks into his 4EYES 14slowlyyyy 4LICKING 14the 4TIP 14with his 4TONGUE 14and then blowing on his 4COCK 14with his 4HOT 14breath.
  ....pvt:_xact.c 14If you're horny9 $$1 14heres my pvt room 3#OhYes 14Here's my cock 13(it's hard) 14Here's some handcuffs 15(oh baby) 14And the rest is up to you9 $$1
  ....pleaseme:_xact.c 0I have 13 7 inch cock 0and a 15tight 13(_ass_)  0You've got a 4TONGUE 0a 13(_)_)lllllD 0and 10 14FINGERS0.....Put it all together.... Then cum 3#PLEASE_ME0 $$1
  ....cum:_xact.c 12 $$1 Yo15u can put a sm14ile on my face, o11r you can p12ut your c14um all ov15er it 11!
  ....scrabble:_xact.c 12Pushes the button on the wall.... a spotlight shines on 8\\\0 $$1 8///12...music begins to play. | /timer 1 2 /me * 12he walks over to the dresser glancing at 0 $$1 12he asks Him if He wants to play a game. | /timer 1 4 /me * 12 $me opens the drawer and takes out some 4HANDCUFFS 12and some 7VASELINE12, some 9BATTERY OPERATED TOYS12, an 13FEATHER12, and 10 3 BOTTLES OF MASSAGE OILS12, also a 3WHIP12, 8 2 BOTTLES OF TEQUILA12, some 15SHOT GLASSES | /timer 1 7 /me * 12 Lastly $me removes 13 ThE gAmE oF sCrAbBLe12.  Carrying all of this, he walks over to 0 $$1 12 and whispers.... "If You are feeling really naughty for me, i'll set up the scrabble board"
  ....cum2me:_xact.c 13,6 $$1 YoU sExY BaStArD....cUm To Me Ya Bastard
  ....bj:_xact.c 12GiVeS13 $$1 0a11LoNg12AnD14LiNgErInG15cOcK13hArDeNiNg6HeArT4bEaTiNg3PaLm9SwEaTiNg11NiPpLe12HaRdEnInG14hAiR15rAiSiNg13PuPiL4dIaLaTiNg6HeAd3TuRnInG9bLoW11jOb
  ....Job-ed:_xact.c 2{{{{{12{{{{{11{{{{{0{{{{{ 8ÀrÉ 12You 11AcHing 4 $$1 0?¿? 9CÀusÉ 12YoU 11rÉÀlly 0nÉÉd 6À 12ßLÓwJÒß11, 0but 7YoU'll 12tÀkÉ 11À 0hard 13FuCk 12Ïf 11onÉ's 0ÀvÀiLÀbLÉ, RiGhT? 0}}}}}11}}}}}12}}}}}2}}}}}13® 
  ....Blow-ed:_xact.c 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 4Let's 0PLAY 4army! 0You 4lay down 0 $$1 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­4, and I'll 0ß£ØW 4the hell out of YoU! 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 13®      
  ....urBone:_xact.c 3»»æ0:3{13®3}0:3æ«« 13YoU'll 4£11ove 13Every 11Bone 13In 11my 13Body 11 $$1 13Especially4 Y11ours
  ....Buffett-edited:_xact.c 4¿0?4¿0?4¿0?4¿0?4¿0?4¿0?4Cøûld 0I 4Bë 0Yøûr 4L0ø4v0ë 4B0û4f0f4ë0t 0 $$1 4Sø 0Yøû 4Cøûld 0Låy 4Me 0On 4Thë 0Tåblë 4And 0Eåt 4Whåt 0Yøû 4Wåntëd 0?4¿0?4¿0?4¿0?4¿0?4¿0?4¿13®
  ....Boxing:_xact.c 3Wanna 11Play 3Midget 11Boxing 3 $$1 ? 11I'll 3Get 11Down 3On 11my 3Knees 11And 3Give 11You 3A 11Couple 3Of 11Blows!13® 
  ....throbbingcock:_xact.c 14¤¤¤¤ $$1 ¤¤¤¤ 15Guess What! 0I've got an hard, and throbbing cock! 14And i can feel YoUr Breathe close to it now! 13® 
  ....suck:_xact.c 0Doesn'T cARe AbouT 13woman 0OR 3Brad Pitt 0hE oNLy WantS to SucK 12 $$1 's 0cOCk
  ....ABC-ed:_xact.c 6I'll Lie on my stomach4 $$1 6and stick my13 ASS in the AIR 6for YoU so YoU can spell out the 12A9L13P4H10A0B14E2T 6on my 13AssHole 6with YoUr 4TONGUE
  ....SticksStones:_xact.c 12¤¤¤¤4§ticks 13Änd 12§tones 4Will 13ßreak 12Mý 4ßone§ 13ßut 12HandCuff§ 4Ãnd 13Feather§ 12Excite 13Mé 4¤¤¤¤ $$1 ¤¤¤¤ 13§ex 12i§ 4The 13Thing; 12I 4Like 4Tó 13Dó 12It 4Ñìghtlý 13¤¤¤¤®
  ....Slip:_xact.c 0HeY13"·*:·*"·*:·*"·*:·*" $$1 "·*:·*"·*:·*"·*:·*0HoW13"·*:·*"0AbOuT13"·*:·*"0You13"·*:·*"0§LiP13"·*:·*"0InTo13"·*:·*"  0SoMeThInG13"·*:·*"0MoRe13"·*:·*"0cOmFoRtAbLe13"·*:·*"0LiKe13"·*:·*"0My13"·*:·*"®0ASS13"·*:·*"®
  ....Sleepy:_xact.c 4 $$1 10You 4Are 10Getting.....9SLEEPY6HORNY9SLEEPY6HORNY9SLEEPY6SLEEPY9HORNY14SLEEPYHORNYSLEEPY6SLEEPY9HORNY6SLEEPY9HORNY6SLEEPY14SLEEPYHORNY9SLEEPY6HORNY9SLEEPY6SLEEPY9HORNY6SLEEPY14HORNYSLEEY
  ....Moaning:_xact.c 5Your moaning like a right BITCH 4 $$1 5shut up and bend over will ya
  ..Kicks
  ...Kiddy Kick:._xact.c Looks At $$1 And Shakes His Head... | .timer 1 2 _xmsg.c $$1 $+ , Go To #KiddieFun ! | .timer 1 3 kick # $$1 -> Kiddie Kick <-
  ...Faggot Kick:_xact.c Looks At $$1 And Notices A Pair Of Limp Wrists... | .timer 1 2 _xact.c Laughs At $$1 $+ 's Apparent Lack Of Masculinity... | .timer 1 3 _xact.c Yells To $$1 "Hey Faggot, Don't Hit Your Loose Ass On The Way Out" | .timer 1 4 kick # $$1 We Don't Like Faggots Here ! - %name
  ...Shut Up Kick:_xact.c Looks Over To $$1 $+ ... | .timer 1 2 _xact.c Notices That $$1 Is Being a REAL Asshole... | .timer 1 3 _xact.c Decides To Put His PoWeR Into Action... | .timer 1 4 kick # $$1 Hey... SHUT THE FUCK UP ! Or ELSE /mode +b ! - %name
  ...Lamer Kick:_xact.c Looks Around In # $+ ... | .timer 1 2 _xmsg.c I See A Member Of The Scpecies Called "Unhumanus Lay-meh'ers" ! | .timer 1 3 _xmsg.c Hey $$1 $+ , What Are You Doing Here In # ? I Think You Should Join #Lamers Instead... | .timer 1 4 _xact.c Thinks Everyone Agreed... So Way You GO ! | .timer 1 5 kick # $$1 Lamer Shields Activated ! - %name
  ...Newbie Kick:_xact.c ToTaLlY FrEaKs OuT ! | .timer 1 2 _xmsg.c AaAaAaAaRrRgGgHhH !!!! They Are Here Again ! (Oh NO) | .timer 1 3 _xact.c Starts Bravely To Prepare For A Hard Battle Against "THE NEWBIES" And Their Leader $$1 $+ ... | .timer 1 4 kick # $$1 I Am Doing It... YES ! (Phew... Was Close Again) - %name
  ...Ace Ventura:_xact.c 3is now known as Ace Ventura | .timer 1 2 _xmsg.c All Righty Then ! | .timer 1 3 _xmsg.c Look It's My Little Friend $$1 $+ ... | .timer 1 4 _xmsg.c Ouuyyzo-Boooyyzy-Bo-Be-Boo ! Hungry Fella? | .timer 1 5 _xmsg.c There Ya Go $$1 ! | .timer 1 6 _xmsg.c Are We Done Yet $$1 ? ...Cos You Are A Lu-Hey-Sa-Her ! | .timer 1 7 kick # $$1 Buh Bye Then ! - %name
  ...For Sister !:_xact.c Looks Down To $$1 $+ ... | .timer 1 2 _xact.c Says: I Remeber You... You Fucked My Sister ! | .timer 1 3 _xact.c Hates Fools That Fuck His Sister ! | .timer 1 4 kick # $$1 You Got Her Pregnant Asshole ! - %name
  ...Curious:notice # What's That In The Sky ? | .timer 1 2 notice # Is It A Bird ? Is It A Plane? | .timer 1 3 notice # No. It's A... | .timer 1 4 kick # $$1 -> Caught You Looking ! <- - %name
  ...SuperMan:_xact.c Looks At $$1 $+ ... | .timer 1 2 _xact.c Notices That $$1 Is Carrying KrYpToNiTe... | .timer 1 3 _xact.c Is Weakened Temporarily... But Slaps Himself Around... -WHACK! -WHACK! | .timer 1 4 _xact.c Isn't Affected By That SHIT ! | .timer 1 5 kick # $$1 That Was A Nice Try Kid... - %name
  ...Ass Shove:_xmsg.c Hey Look It's $$1 ! | .timer 1 2 _xact.c Remembers $$1 $+ ... I HATE You AssLamah ! | .timer 1 3 _xact.c Reaches Over And Rips Off $$1 $+ 's Head, And Shoves It So Far Up His Ass That He Can Talk And Shit At The Same Time ! | .timer 1 4 kick # $$1 Look! A Talking BungHole! - %name
  ...CD Switch: {
    _xact.c Follows $$1 To A Party One Night.... | .timer 1 2 _xact.c Waits Until $$1 Goes Inside And Then Breaks Into His Car...
    .timer 1 5 _xact.c Exchanges $$1 $+ 's MegaDeth CD With The New Enigma CD ! | .timer 1 7 _xmsg.c Later That Night, $$1 Decides To Crank Some Tunes On His Drive Home From His Lame Samsung "Stereo" System...
    .timer 1 9 _xmsg.c $$1 Freaks Out Totally Because Of New Music Experience And Drives Into A 50 Meter Long Truck ! | .timer 1 11 kick # $$1 -(!)- CRASH -(!)- Ouch ! Thats Gotta Hurt Mr. Pancake ! - %name
  }
  ...Cow Suit:_xact.c Catches $$1 And Stuffs Him In A Cow Suit, Then Throws Him Into A Corral With A Horny Bull In It ! <<Mmmmmoooooo!>> | .timer 1 2 kick # $$1 Ohh... Isn't That Love Between Man And Animal So Cute ! - %name
  ...Chest Kick:_xact.c Kicks $$1 Quikly In The Chest... ***Kaiaaaaa ! | .timer 1 2 kick # $$1 Come Back When You Can Breath ! - %name
  ...BaseBall:_xact.c Smashes $$1 $+ 's Head With A Baseball Bat ***BOK ! | .timer 1 2 kick # $$1 Damn... I Got Brains All Over Me ! - %name
  ...The Chair:_xact.c Puts $$1 To An Electric Chair... | .timer 1 2 _xmsg.c I'm Pulling The Switch Now... | .timer 1 3 kick # $$1 Yuch ! What A Stinch ! - %name
  ...MoonWalk !:_xact.c Throws $$1 Carelessly To The Floor... | .timer 1 2 _xact.c Does The MoonWalk Up And Down On $$1 $+ 's Ass. | .timer 1 3 kick # $$1 Not Going To Sit For A While ?
  ...Maths Test:_xact.c Pulls Out His Portable Chalkboard... | .timer 1 2 _xact.c Shows $$1 The Function Of Relativity For Chaos Mathematics... | .timer 1 3 _xact.c Watches As $$1 $+ 's Brains Pop Out With A Puff Of Putrid Smoke ! | .timer 1 4 _xmsg.c Hmh... Too Fancy For You I Guess :) | .timer 1 5 kick # $$1 [ E=mc2 ] = F/(s^2) = [ (x-y3*2,03) ] - %name
  ...The Quest:_xmsg.c Hey $$1 What Is Your Real Name ? | .timer 1 2 _xmsg.c $$1 What Is Your Quest ? | .timer 1 3 _xmsg.c $$1 What's The Average Speed Of A Swallowed WaterMelon Going Down Your Throat ? | .timer 1 4 kick # $$1 Well Aren't You Answering Me ? - %name
  ...Jordan Kick:_xact.c Waves His Hands And Turns Into Michael Jordan For A Instant... | .timer 1 2 _xmsg.c Hey $$1 $+ , Give Me Those Nikes ! | .timer 1 3 _xact.c Leaves A Court Shoe Print Across $$1 $+ 's Face ! | .timer 1 4 kick # $$1 Thanks... I Needed These ! - %name
  ...The Dance:_xact.c Casts Otto's Irresistible Dance On $$1 $+ ... | .timer 1 2 _xact.c Casts Then Tasha's Uncontrollable Hideous Laughter On $$1 $+ ... | .timer 1 3 _xact.c Watches As $$1 Laughs And Dances Away From The Channel ! | .timer 1 4 kick # $$1 Man... What A NutCase ! - %name
  ...Tongue Pull:_xact.c Grabs $$1 $+ 's Tongue And Pulls It Wayyyyy Out. | .timer 1 2 _xact.c Takes Out Locking Ring And Loops It Through $$1 $+ 's Tongue. | .timer 1 3 _xact.c Then Fastens The Ring To A Ferrari F-50 And Drives Off 250 Km/h ! | .timer 1 4 kick # $$1 Whats That Red 15 Meter Long Rope Back There ? - %name
  ...Laser Sabre !:_xact.c 3is now known as Darth Vader | .timer 1 2 _xact.c Looks At $$1 $+ ... | .timer 1 3 _xact.c Wonders Why $$1 Won't Join The Dark Side... | .timer 1 4 notice # You Have Underestimated The Dark Side ! Now You Must Die ! | .timer 1 5 _xact.c Takes Out His Laser Sabre ! | .timer 1 6 _xact.c Takes A Look At $$1 And... | .timer 1 7 kick # $$1 !! SWISH !! You Are Dead ! - %name
  ...Join Darkside:_xact.c 3is now known as Darth Vader | .timer 1 2 _xact.c Looks At $$1 $+ ... | .timer 1 3 _xmsg.c You Aren't $$1 $+ ... You are Luke Skywalker, My Son ! | .timer 1 4 _xmsg.c Son... Join Me On The Dark Side... | .timer 1 5 _xact.c Explains To $$1 The Advantages Of Joining Him... | .timer 1 6 _xact.c Sees No Hope With $$1 $+ ... | .timer 1 7 kick # $$1 This Is My Last Option. (Sorry) - %name
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
