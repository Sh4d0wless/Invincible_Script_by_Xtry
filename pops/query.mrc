;___________________________________________
; Invincible by Xtry
; Query Popups
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

menu query {
  Whois:whois $$1
  Whois idle:whois $$1 $$1
  Notice:notice.p $$1 $$?="Notice to $$1 :"
  -
  Info
  .Nickname $chr(160) $$1:halt
  .Hostname $chr(160) $remove($address($$1,2),*!*@):halt
  .Idle $chr(160) $duration($query($nick).idle):halt
  .-
  .UCentral:uwho $$1
  .DNS:.dns $$1
  .Trace:trace $$1
  .Userhost:userhost $$1
  .Whowas:whowas $$1
  Introduction
  .Set Up:introx
  .Start Intro:myintro.q
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
  .$iif($1 == $me,$style(2)) Silences
  ..Silence:.silence + $+ $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to silence list
  ..Unsilence:.silence - $+ $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Removed $+ $cxs(1) $1  $+ $cxs(2) $+ from silence list
  .Notify
  ..Add:.notify $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to notify list
  ..Remove:.notify -r $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Removed $+ $cxs(1) $1  $+ $cxs(2) $+ from notify list
  ..-
  ..Make Note For $snick(#,1):.notify -r $1 | .notify $1 $?="Notify note to $1 :" | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to notify list $cxs(3) $+ ( $+ $cxs(2) $+ Note $+ $cxs(3) $+ )
  ..Whois On Notify $snick(#,1):.notify -r $1 | .notify + $+ $1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $1  $+ $cxs(2) $+ to notify list $cxs(3) $+ ( $+ $cxs(2) $+ Whois on notify $+ $cxs(3) $+ )
  ..-
  ..Show Notify List:/notify -s
  ..Echo Notify List:/notify -h
  .-
  .Invite:invite $$1 $$?="Invite to channel :"
  User List
  .View User List:userlist
  .$iif($1 != $me,$iif($ulist($_a($$1,5)) != $nulll,rem $1,add $1)):if ($ulist($_a($1,5))) { .ruser $ifmatch } | else user.new $iif($_a($1,5) != $null,$_a($1,5),$1 $+ !*@*)
  .-
  .$iif($1 != $me,$iif($level($_a($$1,5)) == 1,1 (normal),$iif($level($_a($1,5)) == 50,50 (shitlisted),$iif($level($_a($1,5)) == 100,100 (auto voice),$iif($level($_a($1,5)) == 150,150 (auto op),$iif($level($_a($1,5)) == 999,999 (protected))))))):echo -a :n: $1 level is $iif($level($_a($1,5)) == 1,1 (normal),$iif($level($_a($1,5)) == 50,50 (shitlisted),$iif($level($_a($1,5)) == 100,100 (auto voice),$iif($level($_a($1,5)) == 150,150 (auto op),$iif($level($_a($1,5)) == 999,999 (protected))))))
  .-
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 1,Normal (1))):.auser 1 $1 $+ !*@*
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 50,DeathList (50))):.auser 50 $1 $+ !*@*
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 100,Auto Voice (100))):.auser 100 $1 $+ !*@*
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 150,Auto Op (150))):.auser 150 $1 $+ !*@*
  .$iif($1 != $me,$iif($level($_a($$1,5)) != 999,Protect (999))):.auser 999 $1 $+ !*@*
  CTCP
  .Ping:ctcb $active ping
  .Chat:ctcb $active chat
  .Page:ctcb $active page
  .-
  .Time:ctcb $active time
  .Version:ctcb $active version
  .Userinfo:ctcb $active userinfo
  .Clientinfo:ctcb $active clientinfo
  .Finger:ctcb $active finger
  .-
  .Custom:ctcp $1 $$?="CTCP to $$1 :"
  $iif($1 == $me,$style(2)) DCC
  .Send:dcc send $$1
  .Chat:dcc chat $$1
  .-
  .Allow:dccallow + $+ $$1
  .Disallow:dccallow - $+ $$1
  $iif(.dal.net isin $server,DALnet)
  .Chanserv
  ..Options Dialog:gtzdalc
  ..-
  ..Why:chanserv why $$?="Channel to check $$1 (why) :" $$1
  ..Access:chanserv acc $$?="Channel to check $$1 (acc) :" $$1
  ..Invite:chanserv invite $$?="Channel to invite $$1 :" $$1
  ..Unban:chanserv unban $$?="Channel to unban $$1" $$1
  ..-
  ..Op - Deop
  ...Op:/chanserv op $$?="Channel to op $$1 :" $$1
  ...Deop:/chanserv deop $$?="Channel to deop $$1 :" $$1
  ..SOP
  ...Add:/chanserv sop $$?="Channel to add $$1 (Sop) :" add $$1
  ...Del:/chanserv sop $$?="Channel to del $$1 (Sop) :" del $$1
  ..AOP
  ...Add:/chanserv aop $$?="Channel to add $$1 (Aop) :" add $$1
  ...Del:/chanserv aop $$?="Channel to del $$1 (Aop) :" del $$1
  ..Akick
  ...$iif($1 == $me,$style(2)) Add:chanserv akick $$?="Channel to add $$1 (Akick) :" add $address($1,2)
  ...Del:chanserv akick $$?="Channel to del $$1 (Akick) :" del $address($1,2)
  .Nickserv
  ..Options Dialog:gtzdaln
  ..-
  ..Access:/nickserv acc $$1
  ..Info:/nickserv info $$1
  ..$iif($1 == $me,$style(2)) Ghost:/nickserv ghost $$1 $$?*="Password to ghost $$1 :"
  ..$iif($1 == $me,$style(2)) Recover:/nickserv recover $$1 $$?*="Password to recover $$1 :"
  ..$iif($1 == $me,$style(2)) Release:/nickserv release $$1 $$?*="Password to release $$1 :"
  .Memoserv
  ..$iif($1 == $me,$style(2)) Send:/memoserv send $$1 $$?="Memo message to $$1 :"
  .Statserv
  ..Domain:statserv domain $$?="Domain :"
  ..Host:statserv host $$?="Host :"
  ..Server:/statserv server $$?="Server :"
  ..Stats:/statserv stats $$?="Server/Host/Domain :"
  ..-
  ..Netstats:statserv netstats
  ..Hosts:statser hosts
  ..Servers:statserv servers
  ..Up Time:statserv uptime
  $iif(o isin $umode,IRCop)
  .Oper Up $chr(160) cF2:oper $$?="Id to Oper up :" $$?*="Password :"
  .-
  .Kill:kill $$?="Nickname or Hostname :" $$?="Reason :"
  .AKill:akill $$?="UserID@Hostname :" $$?="Reason :"
  .RAKill:rakill $$?="UserID@Hostname :"
  .-
  .Rehash:rehash $$?="Server :" - $+ $$?="Flags :"
  .Restart:restart $$?="Sever :" $$?*="Password :"
  .Die:die $$?*="Password :"
  .Lag:lag $$?="Server :"
  .SQuit:squit $$?="Server :"
  .RPing:rping $$?="Server Mask:"
  .Trace:trace $$?="Server :"
  .SDesc:sdesc $$?="Description :"
  .MkPasswd:mkpasswd $$?="Method :" $$?*="Password :"
  .-
  .SetHost:sethost $$?="New Hostname :"
  .SetIdent:setident $$?="New Ident :"
  .ChgHost:chghost $$?="Nickname :" $$?="New Hostname :"
  .ChgIdent:chgident $$?="Nickname :" $$?="New Ident :"
  .ChgName:chgname $$?="Nickname :" $$?=New RealName/FullName :"
  .-
  .SA
  ..SAMode:samode $$?="Channel :" $$?="Mode :"
  ..SAJoin:sajoin $$?="Nickname :" $$?="Channel :"
  ..SAPart:sapart $$?="Nickname :" $$?="Channel :"
  .Bans
  ..Kline:kline $$?="Hostname :" $$?="Reason :"
  ..UnKline:unkline $$?="Hostname :"
  ..-
  ..Zline:zline $$?="IP Address :" $$?="Reason :"
  ..UnZline:unzline $$?="IP Adddress :"
  ..-
  ..GZline:gzline $$?="UserID@Hostname :" $$?="Seconds to be banned :" $$?="Reason :"
  ..UnGZline:gzline - $+ $$?="UserID@Hostname :"
  ..-
  ..TKline:tkline $$?="UserID@Hostname :" $$?="Seconds to be banned :" $$?="Reason :"
  ..UnTKline:tkline - $+ $$?="UserID@Hostname :"
  ..-
  ..TZline:tzline $$?="UserID@Hostname :" $$?="Seconds to be banned :" $$?="Reason :"
  ..UnTZline:tzline - $+ $$?="UserID@Hostname :"
  .Messages
  ..Wallops:wallops $$?="Wallops Message :"
  ..Globops:globops $$?="Globops Message :"
  ..Chatops:chatops $$?="Chatops Message :"
  ..Locops:locops $$?="Locops Message :"
  ..-
  ..Adchat:adchat $$?="Adchat Message :"
  ..Nachat:nachat $$?="Nachat Message :"
  ..Techat:techat $$?="Techat Message :"
  .Connect
  ..Current Server:connect $$?="Server to Connect :" $$?="Port :"
  ..Other Servers:connect $$?="Server :" $$?="Port :" $$?="Server to Connect :"
  .Motd
  ..OperMotd:opermotd
  ..AddMotd:addmotd $$?="Text to add to Motd :"
  ..AddOMotd:addomotd $$?="Text to add to OperMotd :"
  .TSCtl
  ..OffSet:tsctl offset $$?="+ or - ?" $$?="Time :"
  ..Time:tsctl time
  ..AllTime:tsctl alltime
  ..SvsTime:tsctl svstime $$?="Timestamp :"
  .DCC
  ..DCCDeny:dccdeny $$?="Filename Mask :" $$?="Reason"
  ..UnDCCDeny:undccdeny $$?="Filename Mask :"
  .-
  .Freeze:nickserv freeze $$1
  .Unfreeze:nickserv freeze  - $+ $$1
  .Mark:nickserv mark $$1 on
  .Unmark:nickserv mark $$1 off
  -
  Script Setup
  .Auto Thanks:authx
  .Auto Oper:aoperz
  .Auto Pinger:aping
  .Auto Greet:agreetx
  .-
  .Script Theme:thema
  .Text System:xssctxt
  .Sound System:gtzwav
  .Echo System:echosys
  .Ghost Killer:ghostkill
  .DCC Controls:dccgtz
  .Nicklist Colors:nlc
  .Timestamp Styler:tsgtz
  .Introduction Setup:introx
  .Kick Counter:kickcounter
  .-
  .DALnet Auto Identify
  ..DALnet Auto Identify:aid
  ..-
  ..$iif(dal.net isin $server,Identify to enabled nicks):_aid.spe
  ..$iif(dal.net isin $server,Identify to all nicks $chr(160) cF6):_aid.all
  .Auto Join
  ..$iif(%ajena = on,$style(1)) Enable:ajoin.on
  ..$iif(%ajena = off,$style(1)) Disable:ajoin.off
  ..-
  ..Rejoin Channels $chr(160) sF9:ajoin
  ..-
  ..Setup Dialog:aj
  .Tools Bar Options
  ..$iif(%toolz.bc = on,$style(1)) Run On Connect:toolzbc
  ..$iif(%toolz.bs = on,$style(1)) Run On Startup:toolzbs
  .Lagbar System
  ..$iif(%xlagx.bar = on,$style(1)) Enable:gtzlagon
  ..$iif(%xlagx.bar = off,$style(1)) Disable:gtzlagoff
  .Scripted Text
  ..$iif(%scsc = on,$style(1)) Enable $chr(160) sF4:gtzscriptxt.on
  ..$iif(%scsc = off,$style(1)) Disable $chr(160) sF4:gtzscriptxt.off
  ..-
  ..Setup:gtzsctxt
  .Invite Notifier
  ..$iif(%xinvx.note = on,$style(1)) Enable:invnot.on
  ..$iif(%xinvx.note = off,$style(1)) Disable:invnot.off
  .Proxy Scanner
  ..$iif(%irc.proxy = on,$style(1)) Enable:gtzprox.en
  ..$iif(%irc.proxy = off,$style(1)) Disable:gtzprox.dis
  ..-
  ..Logs:/run utilities/found.txt
  ..Clear Logs:/write -c utilities/found.txt
  .Netsplit Detector
  ..$iif(%nsalert = on,$style(1)) Enable:nsalerton
  ..$iif(%nsalert = off,$style(1)) Disable:nsalertoff
  .Nicknames
  ..$iif((%nix.set1 = $null),n/a,%nix.set1)
  ...$iif((%nix.set1 = $null),$style(2)) Change Nick:nick %nix.set1
  ...-
  ...Set Nick:set %nix.set1 $$?="Enter the nickname :"
  ..$iif((%nix.set2 = $null),n/a,%nix.set2)
  ...$iif((%nix.set2 = $null),$style(2)) Change Nick:nick %nix.set2
  ...-
  ...Set Nick:set %nix.set2 $$?="Enter the nickname :"
  ..$iif((%nix.set3 = $null),n/a,%nix.set3)
  ...$iif((%nix.set3 = $null),$style(2)) Change Nick:nick %nix.set3
  ...-
  ...Set Nick:set %nix.set3 $$?="Enter the nickname :"
  ..$iif((%nix.set4 = $null),n/a,%nix.set4)
  ...$iif((%nix.set4 = $null),$style(2)) Change Nick:nick %nix.set4
  ...-
  ...Set Nick:set %nix.set5 $$?="Enter the nickname :"
  ..$iif((%nix.set5 = $null),n/a,%nix.set5)
  ...$iif((%nix.set5 = $null),$style(2)) Change Nick:nick %nix.set5
  ...-
  ...Set Nick:set %nix.set5 $$?="Enter the nickname :"
  ..-
  ..Random Nick
  ...Change Random Nick $chr(160) cF5:randomnix
  ...-
  ...$iif(%randomnix.start = on,$style(1)) Random Nick On Start:randomnix.start 
  ...$iif(%randomnix.conn = on,$style(1)) Random Nick On Connect:randomnix.conn
  Utilities
  .Main
  ..Away System [ $+ $iif(%asawaymode == $null,Unknown,%asawaymode) Mode] $chr(160) sF1
  ...$iif($exists(awaysys.ini) == $false || %asawaymode == $null,Repair config file):asresetdefault
  ...$iif($ascheckini && %asawaymode == Back, Set to Away Mode ):asgoaway
  ...$iif($ascheckini && %asawaymode == Back, Set to Stealth Away Mode ):%asqaway = 1 | asgoaway
  ...$iif($ascheckini && Away isin %asawaymode, Set to Back Mode ):assetback
  ...$iif($ascheckini && Away isin %asawaymode, Change Away Message ):$dialog(asmsgchng,asmsgchng)
  ...-
  ...$iif($ascheckini, Configuration ):awaysys.config
  ...$iif($ascheckini, Away Logviewer ):awaysystemlog
  ..Memo Express $chr(160) sF2
  ...$iif(%memostatx = on,$style(1)) Enable:xtrymemon
  ...$iif(%memostatx = off,$style(1)) Disable:xtrymemoff
  ...-
  ...Dialog:memos
  ..-
  ..Net Scanner:scanner
  ..URL Manager $chr(160) sF7:urlc
  ..Email Client:emailer
  ..File Server Setup:fservx
  ..User List $chr(160) sF3:userlist
  .Infos
  ..$_time.v
  ...$_time.p:time
  ...-
  ...$iif($server,Message)
  ....All:_time.msg Time: $time(HH:nn:ss) - Date: $time(dddd dd mmmm yyyy) - mIRC Uptime: $uptime(mirc,1) Record: $duration($_time.rini(r,m)) - Idle Time: $duration($idle) Record: $duration($_time.rini(r,i)) - Away Time: $duration($awaytime) Record: $duration($_time.rini(r,a)) - Online Time: $uptime(server,1) Record: $duration($_time.rini(r,o)) - System Uptime: $uptime(system,1) Record: $duration($_time.rini(r,s))
  ....-
  ....Time:_time.msg Time: $time(HH:nn:ss)
  ....Date:_time.msg Date: $time(dddd dd mmmm yyyy)
  ....-
  ....mIRC:_time.msg mIRC Uptime: $uptime(mirc,1) - Record: $duration($_time.rini(r,m))
  ....Idle:_time.msg Idle Time: $duration($idle) - Record: $duration($_time.rini(r,i))
  ....Away:_time.msg Away Time: $duration($awaytime) - Record: $duration($_time.rini(r,a))
  ....Online:_time.msg Online Time: $uptime(server,1) - Record: $duration($_time.rini(r,o))
  ....System:_time.msg System Uptime: $uptime(system,1) - Record: $duration($_time.rini(r,s))
  ..Connections History
  ...Dialog:connexhis
  ...-
  ...$iif($_ch.rini(ch,ch) = on,$style(1)) Enable:_ch.wini ch ch on | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Connections History was $+ $cxs(1) Enabled
  ...$iif($_ch.rini(ch,ch) = off,$style(1)) Disable:_ch.wini ch ch off | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Connections History was $+ $cxs(1) Disabled
  ..-
  ..System Info:sysi
  ..Multi Network Info:servinfo
  ..Personal Info:personainx
  ..DCC Transfer Info:dccinfo
  ..Weather Forecaster:weafor
  ..Country Lookup $chr(160) sF5:gtzclookup $$?="Code/Domain for Country Lookup (ie : uk) :"
  ..IP Lookup:run utilities/iplookup/iplookup.exe
  ..Dictionary:dict
  ..-
  ..Characters Map $chr(160) cF8:charmap
  ..Text To Char:txt2c
  ..Measurement Convertion:run utilities/mc.exe
  ..Notepad $chr(160) cF4:padnote
  .Others
  ..File Transfer Manager:filetm
  ..Quote Manager:quoteman
  ..Nick Completor:ncpro
  ..Notify Viewer:check.notify
  ..Kicked User List:kickpl
  ..List Maker:dialist
  ..Auto Regain Nick:aregainn
  ..Ip && Nick Finder:Ip.scan
  ..Vote Machine:votebox
  ..Channel Counter:chcount
  ..Alarm Clock:alarmx
  ..Favorites:fav
  ..-
  ..Auto Timed Message
  ...$iif(!$server,$style(2)) Start: { if (%chan.delay == $null) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You must set the advertise delay first | goto bleh }
    set %channel on
    .timerchanAd 1 .1 chanAdOn
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto timed message has been started
    :bleh 
  }
  ...$iif(!$server,$style(2)) Stop:{
    .timerchanAd off 
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto timed message has been halted
    .set %channel off
  }
  ...-
  ...Setup:autotm
  ..Ignore Manager
  ...Set Up:ignore.manager
  ...List:show.ignoreList.dialog
  ..Seen System
  ...Set Up:seen
  ...Search:search
  ...-
  ...Open List:.run seen.ini
  ..File Dropper
  ...Setup:fidrop
  ...-
  ...$iif(!$server,$style(2)) FileDrop 1
  ....Start Ad:/drop.start1 
  ....Stop Ad:/drop.stop1 
  ...$iif(!$server,$style(2)) FileDrop 2
  ....Start Ad:/drop.start2 
  ....Stop Ad:/drop.stop2 
  ...$iif(!$server,$style(2)) FileDrop 3
  ....Start Ad:/drop.start3 
  ....Stop Ad:/drop.stop3 
  ...$iif(!$server,$style(2)) FileDrop 4
  ....Start Ad:/drop.start4 
  ....Stop Ad:/drop.stop4 
  ...$iif(!$server,$style(2)) FileDrop 5
  ....Start Ad:/drop.start5 
  ....Stop Ad:/drop.stop5 
  ..FTP Advertisement
  ...Setup:ftpad
  ...-
  ...$iif(!$server,$style(2)) Start:/ftpAdon
  ...$iif(!$server,$style(2)) Stop:/ftpAdOff
  ..Text Encryption
  ...$iif(%x.encryp = on,$style(1)) Enable:gtzcrypton
  ...$iif(%x.encryp = off,$style(1)) Disable:gtzcryptoff
  ..Quits Editor
  ...$iif(%qiutedi = on,$style(1)) Enable:xqedin
  ...$iif(%qiutedi = off,$style(1)) Disable:xqediff
  ...-
  ...Dialog:qdialquit
  Entertainment
  .Personal Games:/gamez
  .Pic Player:picplay
  .Trivia Settings:triv.dlg
  .Lyrics Finder:lyrics
  .Sketch:sketch
  .-
  .Love Meter:/set %kira-cinta1 $$1 | set %kira-cinta2 $me | lovemnl
  .Colorfull Text Box:tbox
  .-
  .Big Fonts
  ..Editor:bigfont
  ..-
  ..Play:bigfont $$?="Text :"
  .Text Styles
  ..Colorfull:r1 $$?="Colorfull text to $chan :"
  ..Colors && Bold && Underline:r2 $$?="Colorfull && Bold && Underline text to $chan :"
  ..Colored ASCII:asciic $$?="Colored ASCII text to $$1 :"
  ..Normal ASCII:ascii $$?="Normal ASCII text to $$1 :"
  ..-
  ..Brick (Lime && Red):brick1 $$?="Brick text to $$1 :"
  ..Brick (Yellow && Blue):brick2 $$?="Brick text to $$1 :"
  ..Brick (Blue && Pink):brick3 $$?="Brick text to $$1 :"
  ..Brick ($+ %name2 $+ ):brick4 $$?="Brick text to $$1 :"
  ..-
  ..Blocks:blocks $$?="Blocks text to $$1 :"
  ..Caution Tape:reverse2 $$?="Caution tape text to $$1 :"
  ..Reverse:reverse $$?="Reverse text to $$1 :"
  ..Caps && Low Case:altcap $$?="Caps && low case text to $$1 :"
  ..Latin:piglatin $$?="Latin text to $$1 :"
  .Colors Talker
  ..$iif(%coltalk.x = on,$style(1)) Enable:gtzcolon
  ..$iif(%coltalk.x = off,$style(1)) Disable:gtzcoloff
  .Funny Pets
  ..Pikachu:run utilities/games/pikachu.exe
  ..Sheep:run utilities/games/sheep.exe
  ..Orange:run utilities/games/naranja.exe
  .Fun Stuffs
  ..Fakes
  ...Fake Quits
  ....Quit (me):_xact.q has quit IRC (Quit: Leaving)
  ...Fake Nicks
  ....Nick (me):_xact.q is now know as $$?="Enter Name"
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
  ....Op (+o):_xact.q 3sets mode: +o $$1
  ....Deop (-o):_xact.q 3sets mode: -o $$1
  ....Voice (+v):_xact.q 3sets mode: +v $$1
  ....Devoice (-v):_xact.q 3sets mode: -v $$1
  ....Gay Kick:_xmsg.q *** $$1 was kicked by $me ( $+ 4,8G1ay 4S1cript v5.2 $+ )
  ....Kick:_xact.q 3 $+ $$1 is kicked from $chan by $me ( $+ $$?="Enter Kick reason:" $+ ) | _xact.q 2*** Attempting to rejoin channel... | _xact.q 3*** Rejoined channel #
  ....Kick Reason:_xmsg.q *** $$1 was kicked by $me ( $+ $$?="Enter kick reason:" 4,8G1ay 4S1cript v5.2 $+ )
  ....-
  ....Mode -clothes:_xact.q *** sets mode: -clothes $$1
  ....Mode +love:_xact.q *** sets mode: +love $$1
  ....Mode +my-heart:_xact.q *** sets mode: +my-heart $$1
  ....Mode +kiss:_xact.q *** sets mode: +kiss $$1
  ....Mode +sexy:_xact.q *** sets mode: +sexy $$1
  ....Mode +deeplove:_xact.q *** sets mode: +deeply-in-love-with- $+ $$1
  ....Mode +hugs:_xact.q *** sets mode: +BiggestHugInTheWorld For $$1
  ....Mode +ArseLicker:_xact.q *** $me mode: +Great-Big-ArseLicker $$1
  ....Mode +Cock Sucker:_xact.q *** $me mode: +Great-Big-CockSucker $$1
  ....Mode +BigGayAss:_xmsg.q *** $me sets Big Gay @$$: +@$$ $$1
  ....Mode +Bitch:_xmsg.q *** $me sets mode: +Bitch $$1
  ....-
  ....Choose Mode (+):_xmsg.q *** $me sets mode: +$$?="Enter fake mode :" $$1 
  ....Choose Mode (-):_xmsg.q *** $me sets mode: -$$?="Enter fake mode :" $$1
  ..Give Stuffs
  ...Cigarette:_xact.q 2Gives13 $$1 12a Cigarette 7()¯¯¯¯)15¯¯¯¯¯¯¯¯¯¯¯)14~~~ 4*12ENJOY4*
  ...Beer:_xact.q gets some 14~12ice cold14~ beers and hands one to $$1
  ...7 Up:_xact.q tosses $$1 a 15,15 0,3 74°0UP 15,15 
  ...Coke:_xact.q tosses $$1 a 15,15 16,4 Coke 15,15 
  ...Grape:_xact.q tosses $$1 some 15,15 0,6Grape15,15  soda
  ...Mt. Dew:_xact.q tosses $$1 a 15,15 8,3 MtDew 15,15 
  ...Java:_xact.q hands $$1 A Warm Cup Of Java 15~14~1,5___1,0P
  ...Cocoa:_xact.q passes $$1 some warm cocoa 0,5"""1,0] 
  ...Pepoment:_xact.q gives $$1 a 15,15.0,2 PEP-O-MINT 15,15.3,0 
  ...Juicy Fruit:_xact.q hands a pack of 15,15*8,8*4,8<1,8JUICY FRUIT4,8>8,8*15,15* to $$1 $+ !
  ...Lifesavers:_xact.q hands $$1 some 15,15.0,2L1,9I0,3F0,4E1,8S0,10A0,4V0,3E1,9R0,5S15,15. 
  ...Tootsie Roll:_xact.q gives $1 a 1,0>(16.4,4.5,5.16,5Tootsie Roll5,5.4,4.1,0 )< 
  ...Hersheys Bar:_xact.q gives $$1 a 15,1515,5 HERSHEY'S 15,15.15,15
  ...Dick:_xact.q hands $$1 his tiny dick 4,158=Ð
  ..Hugs
  ...Hug1:_xact.q hugs you $$1, and says gee your a such a terrific person! :)
  ...Hug2:_xact.q Hugz $$1 *hug*
  ...Hug4:_xact.q Hugs {{{{{{{ $$1 }}}}}}} with both arms...:o)
  ...Hug5:_xact.q 4 {{{{{{{{{{HUG{{{{{{{{{{{13 $$1 4 }}}}}}}}HUG}}}}}}}}}}}}
  ...Hug6:_xact.q HUGS  *«¬¤°^°¤¬»., $$1,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬»., $$1,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬»., $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬»., $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬».,
  ...Hug7:_xact.q  12~§«¥~§«¥~§«4HUG!12 <<< $$1 >>>4 HUG!12»§~¥»§~¥»§~
  ...Hug8:_xact.q   2øHugsø,¸¸,ø¤°`6° $$1  `°¤ø,¸¸,øHugsø,¸¸,ø¤10°`° $$1 `°¤ø,¸¸,ø¤°5`° $$1 `°¤ø,¸¸,ø¤°
  ...Hug9:_xact.q 4 HUGS 1(¯`·._(¯`·._(¯`·._( $$12 )_.·´¯)_.·´¯)_.·´¯)
  ...Hug10:_xact.q hugs 3¸,ø¤°`°¤ø,¸¸,ø¤°` $$15 `°¤ø,¸¸,ø¤°`°¤ø,¸
  ...Hug11:_xact.q  1ø¸¸,ø4Hugz2ø,¸¸,ø3¤°`°`°¤6ø,¸¸¸¸,5  $$16 ,¸¸,4Hugz2ø,¸¸,ø3¤°``°¤2ø,¸¸,ø4Hugz6ø,¸¸, 5 $$1 6,¸¸,4Hugz2ø,¸¸,ø3¤°`°`°¤2ø,¸¸,ø4Hugz2ø,¸¸,øø¸¸,ø4Hugz2ø,¸¸,ø3¤°`°`°¤2ø,¸¸,ø4Hugz6ø,¸¸, 5 $$16 ,¸¸,4Hugz2ø,¸¸,ø
  ...Hug12:_xact.q  hugs °º©o.,.o©º°¨°º©  $$1  ©º°¨°º©o.,.o©º°
  ...Hug13:_xact.q HUGZ ,``~` $$1 :,.`*':',`;*`,~;`~ $$1 `:,.`*':',`;`,~;~`:,.`*':',` $$1 ;*`,~; `*,`^';` ~ $$1 ,.*'`": ,`~`:,.`*`,~;`* $$1 ,` ^';`~, $$1 .*'`":,` ~`:,.`*':',`;* $$1 ~;`*,`^';`~,.*'`":, $$1 `~`:,.`*`,~;,``~`: $$1 ,.`*':',`;,``~`:,.`*':',`;*`,~; $$1 `~`:,.`*':',`;` $$1 ,~;~`:,.`*':',`;*`,~; `*,`^';` ~ ,. $$1 *'`": ,`~`:,.`*`,~;`*,` ^';`~,. $$1 *'`":,` ~`:,.`*':',`;* ~;`*,`^';`~,.*
  ...Hug14:_xact.q HUGS .«¬¤°^°¤¬»., $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬».,  $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬».,  $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬»., $$1 ,.«¬¤°^°¤¬».,©,.«¬¤°^°¤¬».,
  ...Hug15:_xact.q HUGS (¯`·.(¯`·.(¯`·. ---{@ $$1 @}--- .·´¯).·´¯).·´¯)
  ...Hug16:_xact.q ,¸¸,øHugsø,¸¸,ø¤°`° $$1 `°¤ø,¸¸,øHugsø,¸¸,ø¤°`°
  ...Hug17:_xact.q --<---<{@((HugzForU|| $$1 ||HugzForU))@}>--->---
  ...Hug18:_xact.q hugs * |(_¸.·'´(_¸.·'´ \ !¡!¡!¡!¡!¡!¡!|»»» $$1 «««|!¡!¡!¡!¡!¡!¡!¡ /`'·.¸_)`'·.¸_)|*
  ...Hug19:_xact.q HUGS  to u $$1~`;.~`;.*`;.`~;`~`*`;.~`;.*  $$1  `;.`~;`~`*~`;.~`; .*`;.`~; ``*~`;.~`  $$1 `~`*~`;.~`;.*`;`~`~`*~`;.~`  $$1  ;.*`;.`~;.*`;.`~;`~`*~` ;.~`;.*`;  $$1 ``~`*~`;.~`;.*`;.`~;~;`~`*~`;.~`  $$1  ;.*`;.`~;`~`*~`;. ~ `.*`;.`~;`~`*~`;  $$1 .~`;.*`;.`~; ~`;.~`;.*`;.`~;`~`*`;.~`;.* `;.`~;`~`*~`;.~`; .*`;.`~; ``*~`;.~`  $$1  `~`*~`;.~`;.*`;`~`~`*~`;.~`  $$1 ;.*`;.`~;.*`;.`~;`~`*~` ;.~`;.*`;  $$1 ``~`*~`;.~`;.*`;.`~;~;`~`*~`;.~`
  ...Hug20:_xact.q {H{*{U{*{G{*{S{*{ $$1 }*}H}*}U}*}G}*}S}
  ...Warm hug:_xact.q 10 Wraps12( ¯`·.,¸¸.·´¯`·.¸¸.->  $$1 12<-.¸¸.·´¯`·.¸¸.·´¯ ) * (¯`'·.¸(¯`'·.¸ ¸.·'´¯)¸.·'´¯) (¯`'·.¸(¯`'·.¸ ¸.·'´¯)¸.·'´¯)* (_¸.·'´(_¸.·'´ `'·.¸_)`'·.¸_) (_¸.·'´(_¸.·'´ `'·.¸_)`'·.¸_) In a13 Warm 4Loving2 Hug 1,8:)
  ...Bright Hugs:_xmsg.q 4,1 * (¯`'·.¸(¯`'·.¸13,1 !!!!!!!!!!!!!! 4,1¸.·'´¯)¸.·'´¯) *   | _xmsg.q 4,1 * (¯`'·.¸(¯`'·.¸12 Ÿ8Ÿ9Ÿ10Ÿ11Ÿ12Ÿ13Ÿ4Ÿ12Ÿ7Ÿ4Ÿ13Ÿ8Ÿ15Ÿ 4,1¸.·'´¯)¸.·'´¯) *  | _xmsg.q 3,1 ----==>>>>------>8,1- $$1 - 3,1<------<<<<==----  | _xmsg.q 4,1 * (_¸.·'´(_¸.·'´13 Ÿ8Ÿ9Ÿ10Ÿ11Ÿ12Ÿ13Ÿ4Ÿ9Ÿ7Ÿ10Ÿ11Ÿ12Ÿ13Ÿ 4,1`'·.¸_)`'·.¸_) *  | _xmsg.q 4,1 * (_¸.·'´(_¸.·'´ 13,1¡¡¡¡¡¡¡¡¡¡¡¡¡¡4,1 `'·.¸_)`'·.¸_) * 
  ...MissUHug:_xmsg.q I've 13ø,¸¸,ø Missed 13ø,¸¸,ø You 13ø,¸¸,ø $$1 4*hug*
  ...WatAHug(Gd):_xact.q sends a9,1 Big...4,1Giant......12,1Extra 13,1Super 0,1Large.....8,1and 4,1Really 9,1nifty 12,1Huggle 0,1your 13,1way 11,1 $$1 9,1 :)
  ...WatAHug(bad):_xact.q  8,1Gives11,1 $$1 12,1a9,1 Terrorfyingly, 4,1Horribly, 13,1Sadistic, 12,1and 9,1Super 4,1Evil 8,1HugGle1,1..........0,11.<<<<<<12,11Booooooo0,11>>>>>>1,1.............
  ...Hug&Kisses1:_xact.q <h><u><g><s> $$1 <k><i><s><s><e><s>
  ...Hug&Kisses2:_xact.q ~*}{ÜÇ§*Ñ*kî§§è§*~ $$1 ~*kî§§è§*Ñ*}{ÜÇ§*
  ...BigHug1:_xact.q  gives  º°¨¨°º©o¿,¿o©º°¨¨°º©{{  $$1  }}©º°¨¨°º©o¿,¿o©º°¨¨°º a big hug!
  ...BigHug2:_xact.q gives $$1 4 «ºôº»6 BIG HUGS 4«ºôº»  $$1 4«ºôº»6 BIG HUGS4 «ºôº»
  ...SqueezeHug:_xact.q 12 loves to squeeze ¬ª*^13,8 $$1 12 ^*ª¬._ _.¬ª*^13,8 $$1 12 ^*ª¬._ _.¬ª*^13,8 $$1 12 ^*ª¬._ _.¬ª*^ 13,8 $$1 12^*ª¬._ _.¬ª*^13,8 $$1 12 ^*ª¬._¬ª*^ 13,8 $$1 12^*ª¬._ _.¬ª*^13,8 $$1 12^*ª¬._ _.¬ª*^13,8 $$1 12^*ª¬ tight!!!
  ...LoveBugHug:_xmsg.q 1(4:1Ï4:1) 1(4:1Ï4:1)4 $$1 1(4:1Ï4:1) 1(4:1Ï4:1) 3 Love Bug Hugs 
  ...ColorHug:_xmsg.q 2øHugsø,¸¸,ø¤°`6° $$1  `°¤ø,¸¸,øHugsø,¸¸,ø¤10°`° $$1 `°¤ø,¸¸,ø¤°5`° $$1  `°¤ø,¸¸,ø¤°
  ...HugLady:_xact.q   hugs this very SPECIAL lady , ©¤.¸¸.¤© $$1  ©¤.¸¸.¤© ©¤.¸¸.¤© $$1  ©¤.¸¸.¤© ©¤.¸¸.¤© $$1  ©¤.¸¸.¤© ©¤.¸¸.¤© 
  ...HugTight:_xact.q  º°¨¨°º(c)o¿,¿o(c)º°¨¨°º(c){{ *HUGS* }}(c)º°¨¨°º(c)o¿,¿o(c)º°¨¨°º $$1 very tight !!!
  ...WarmHug:_xact.q   Wraps 11( ¯`·.,¸¸.·´¯`·.¸¸.-> 2 $$1 11 <-.¸¸.·´¯`·.¸¸.·´¯ ) 12* 11(¯`'·.¸(¯`'·.¸ ¸.·'´¯)¸.·'´¯) (¯`'·.¸(¯`'·.¸ ¸.·'´¯)¸.·'´¯) 12* 11(_¸.·'´(_¸.·'´ `'·.¸_)`'·.¸_) (_¸.·'´(_¸.·'´`'·.¸_)`'·.¸_) 12In a Warm  Hug 2 :)
  ...LoveHugs:_xact.q 4£ô¥ÉHugs £ô¥É*£ô¥É*£ô¥É*£ô¥É 13 $$1 4£ô¥É*£ô¥É*£ô¥É*£ô¥É £ô¥ÉHugs
  ...Stars&Hugs:_xact.q 12throws 6stars and 12hugs6 all over4 $$1 11 * `8* `11 *8 ` *12hug 11` *8 `*11` *8 ` *11 `*12hug 8` *11 ` * 8` *11 ` * 8` *12hug 11` *8 ` *11 ` *8 ` *2 hug 11` *8 ` *11 ` *8 ` *11` *8 ` *12hug 11` *8 ` *11 ` *8 ` *11 ` *8 ` *12hug 11` *8 ` *11 ` *
  ...MegaHug:_xact.q gives 3 $$1 6 a special canadian 13*MEGA* 4 {H}*{U}*{G} 6 because I like you:))))))))
  ...HugeHug:_xact.q gives4 $$1 12a13 HUGE 12:: 4HUG 12::4!  
  ...BigBearHug:_xact.q gives $$1 a BIG BEAR HUG
  ...NvSawB4Hug:_xact.q  gïvê§  $$1 å ßïg hüg £ïKê §hê ñêvê® §åW ßêfð®ê....
  ...RainbowHug:_xact.q gives  $$1 9 4a 1R5A7I12N8B3O11W 1H2U3G4!1(2(3(4(5(6(7(8(9(10(11(12(13(14(15( 13 15)14)13)12)11)10)9)8)7)6)5)4)3)2 )1)
  ...Rose Hug:_xmsg.q 4@3}9_(¯`·.4@3}9_(¯`·._( $$1 9)_.·´¯)_3{4@9.·´¯)_3{4@ | _xmsg.q  4@3}9¯(_.·´4@3}9¯(_.·´¯( $$1 9)¯`·._)¯3{4@9`·._)¯3{4@
  ...2arrowsonblck:_xact.q 13,1 (¯`'·.¸(¯`'·.¸4 _________________13,1 ¸.·'´¯)¸.·'´¯) | _xact.q 11,1 (¯`'·.¸(¯`'·.¸ 11 Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ 11,1 ¸.·'´¯)¸.·'´¯) | _xact.q 4,1 ----==>>>>-------> 4 $$1 4,1 ----==>>>>------> | _xact.q 11,1 (_¸.·'´(_¸.·'´ 11 Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ4Ÿ11Ÿ 11 `'·.¸_)`'·.¸_) | _xact.q 13,1 (_¸.·'´(_¸.·'´4 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯13,1 `'·.¸_)`'·.¸_)
  ...Arrowhug1 :_xact.q 4 (¯`'·.¸(¯`'·.¸11 _______________ 4¸.·'´¯)¸.·'´¯) | _xact.q 4 (¯`'·.¸(¯`'·.¸ 12ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ 4¸.·'´¯)¸.·'´¯) | _xact.q 13 ---==>>>>-----> 3 $$1 13 <-----<<<<==--- | _xact.q 4 (_¸.·'´(_¸.·'´ 12ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ 4`'·.¸_)`'·.¸_) | _xact.q 4 (_¸.·'´(_¸.·'´11 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ 4`'·.¸_)`'·.¸_).
  ...Arrowhug2 :_xact.q 4 (¯`'·.¸3(¯`'·.¸ 8,1ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ4,0 ¸.·'´¯)6¸.·'´¯) | _xact.q 2 ---==>>>>-----> 12 $$1 2 <-----<<<<==--- | _xact.q 4 (_¸.·'´3(_¸.·'´ 8,1ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ4,0 `'·.¸_)6`'·.¸_) 
  ...Smallarrowhug:_xact.q ......     4(¯`'·.¸2(¯`'·.¸ 8¸.·'´¯)6¸.·'´¯) | _xact.q ..  3<----==>>>>---->  14,11 $1 12,0<----==>>>>----> | _xact.q .......    4(_¸.·'´2(_¸.·'´ 8`'·.¸_)6`'·.¸_)
  ...Big:_xact.q gives $$1 a great BIG {{{ hug }}}
  ...Run Up:_xact.q runs up to $$1 and gives him a warm {{{ hug }}}
  ...Breathe:_xact.q hugs $$1 so tight and warm that $$1 has to tap $me on the shoulder and mention that $$1 has to breathe!
  ...Fall Over:_xact.q runs over to $$1 $+ , $me puts their arms around $$1 $+ , squeezes $$1 real tight, picks $$1 up to swing them around but falls over instead. *THUMP*
  ..Slaps
  ...Trout:_xact.q slaps $$1 around a bit with a large trout!
  ...Keyboard:_xact.q slaps $$1 around a bit with an old keyboard!
  ...Cactus:_xact.q slaps $$1 around a bit with a large cactus!
  ...Duck:_xact.q slaps $$1 with a great BIG rubber duck!
  ...Diaper:_xact.q slaps $$1 with an old diaper full of extricated chile burritos!
  ...Bad Trout:_xact.q slaps $1 around a bit with a Hairy, Slimy, Smelly, RadioActive trout !
  ...Steel Rod:_xact.q slaps $$1 around a bit with a steel rod!
  ...Hard Disk:_xact.q slaps $$1 around a bit with a 30 GigaByte Hard Disk!
  ...Slap Back:_xact.q slaps a large trout around a bit with $$1
  ...Head:_xact.q slaps $$1 upside the head!
  ...Whale:_xact.q slaps $$1 around a bit with a small whale!
  ...ChanServ:_xact.q slaps $$1 around a bit with ChanServ!!
  ...Dictionary:_xact.q slaps $$1 around a bit with a Dictionary..Here read this!!
  ...Chair:_xact.q slaps $$1 around a bit with a folding chair!
  ...Sock:_xact.q slaps $$1 around a while with a  wet stinky sock!
  ...Trojan:_xact.q slaps $$1 around a while with a Trojan Virus!
  ...slap?:_xact.q slaps $1 with a $?="Slap with what?:"
  ...doh:_xact.q slaps $$1 on the forehead - DOH!
  ...2nickslap(pick 2):_xact.q slaps $$1 with $$2
  ...like slap:_xact.q slaps $$1 around a bit and $$1 likes it..
  ...carp:_xact.q hits $$1 with a old, smelly, Carp! 3><((12 $+ $1 $+ 3((º> *SPLURT*
  ...underoos:_xact.q slaps $$1 with a squishy pair of $gender superman underoos!!
  ...pop bottle:_xact.q  hits $$1 over the head repeatidly with a empty 2 liter plastic  coca-cola bottle bought at Albertsons Grocery on Hall Blvd in Beaverton, Oregon USA *boink* *boink*
  ...diaper:_xact.q slaps $$1 with an old diaper full of extricated chile burritos!
  ...peas!:_xact.q slaps $$1 around a bit with a large bag of frozen peas.  ¤¤whack¤¤
  ...bonk!:_xact.q *bonks* $$1 on the head with a bag of frozen marshmellows.
  ...Menu:_xact.q Beats on $$1 awhile with $$?="Using a What??"
  ...Multi slap:_xact.q slaps $nick(#,1) $nick(#,2) $nick(#,3) $nick(#,4) $nick(#,5) $nick(#,6) $nick(#,7) $nick(#,8) $nick(#,9) $nick(#,10) $nick(#,11) $nick(#,12) $nick(#,13) $nick(#,14) $nick(#,15) $nick(#,16) $nick(#,17) with large trouts
  ..Kisses
  ...French:_xact.q gives $$1 a long french kiss!
  ...ShutUp Kiss:_xact.q kisses $$1 to shut her up.
  ...Run Up:_xact.q runs up to $$1 and kisses her on the check!
  ...Smooch:_xact.q lays BIG smoochers on $$1's lips!
  ...Passionately:_xact.q takes $$1 in Arms and Kisses Passionately.
  ...Sloppy:_xact.q gives $$1 a great BIG sloppy kiss :Þ~
  ...Kiss Hand:_xact.q gets down on one knee and takes $$1's hand. Raises it up and Kisses it ever so gently. What a sweet taste. :)
  ...Kiss hand2:_xact.q takes $$1's hand..kisses them...and says "Pleasure My lady.."
  ...Kiss:_xact.q kisses $$1... You taste sweet :)
  ...Bend Kiss:_xact.q grabs $$1, spins $$1 around and gives $$1 the softest sweetest kiss $$1 has ever had!!! :)
  ...Kiss cheek:_xact.q 13grabs12 $$1 13& gives a huge, wet, sloppy, passionate, loving, breath taking4 * * * KISS * * * 13on the cheek!
  ...Kiss On Lips:_xact.q kisses $$1 smack dab on the lips!
  ...Sloppy Kiss:_xact.q gives $$1 a Sloppy Wet Kiss 12=8-Þ
  ...Kiss Goodnight:_xact.q kisses $$1 goodnight!
  ...Long kiss :_xact.q gives $$1 a Super Tight Really Super Erotic Groping, Fondling, Earth Shattering, Sonic Boom, Oh Gawd!! If You Stop I'll Kill You!! Oh yes touch me there, Super Huge Oh Gawd Don't Ya Dare Stop Touching Me!! Huggeroonies And A Knees Are Shaking....Earth Is Trembling, My Heart Has Stopped Beating....Knees Shaking...Lots A Goosebumps, Was That The Ground Moving¿?¿ Passionate Wet Lingering kiss!
  ...3daykiss:_xact.q 12,1gives11,1 $$1 12,1a 13,1long, slow, warm kiss12,1 that lasts 3 days!!!!
  ...Breath Away:_xact.q gets a kiss so hard, it takes $$1's breath away!
  ...Computer kiss:_xact.q gives $$1 a monitor-fritzing, keyboard-sticking, ram-overheating, hard-drive-crashing, modem-frying kiss.
  ...Netsplit Kiss:_xact.q kisses $$1 sooooooo hard that there is an instant netsplit!!
  ...Tongue Kiss: _xact.q 13 :þ :þ :þ :þ :þ :þ :þ :þ :þ :þ 12 kisses $$1 with lots of tongue13 :þ :þ :þ :þ :þ :þ :þ :þ :þ :þ
  ...KissAnywhere: _xact.q 12Gives $1 a long kiss 4 anywhere 12 $$?="He or She?:" wants !!!
  ...Kiss1:_xact.q kisses $$1... You taste sweet :)
  ...Kiss2:_xact.q Ki§§e§ {*{* $$1 *}*} Ki§§e§
  ...Kiss3:_xact.q 13Ki§§ Ki§§ - >4 $$1 13< - Ki§§ Ki§§
  ...Kiss4:_xact.q 4,1((( KI§§§§§§ ¤¤¤  12,1 $$1 4,1  4,1 ¤¤¤ KI§§§§§§ ))) 
  ...Kiss on the cheek :_xact.q kisses $1 on the kiss
  ...Slurp kiss :_xact.q gives $1 a wet kiss
  ...Kiss on the lips :_xact.q gives $1 a big kiss on the LIPS
  ...Awesome kiss :_xact.q gives $1 a long-big-amazing-refreshing-nice-full of energy-3c9o6l13o14u8r10f7u5l-entertaining-sucking-humorous-loving-caring-lip sweling... 4K I S S  
  ...Mega-Kiss:_xact.q ( ( $1 ) ) *SuperTight,AndReally,SuperErotic,Groping,Fondling,EarthShattering,SonicBooming,OhMyGawd,IfYouStopI'llKillYou,ABetterThanHeaven,YetHotterThanHell,WatchWhereYaStickYerHands,SuperHuge,OhMyGawd,OhMyGawd,OhMyGawd,Don'tYaDareStopTouchingMe,HuggerooniesAndzMyKneesAreShaking,EarthIsTrembling,MyHeartHasStopBeating,PassKneesShaking,LotsAGoosebumps,WasThatTheGroundMoving,Passionate,WetDeepLngering,SoulShatteringKiss*
  ...Small kiss :_xact.q gives $1 a 0.1 second kiss
  ...Long kiss :_xact.q gives $1 a 9 minute kiss !!!!!!! W O W
  ...Choose kiss :_xact.q gives $1 a $?="Enter how long the kiss is (seconds/hours/minutes) kisses
  ...Rose kiss :_xact.q gives $1 a rosy kiss |----{---4@3---}----|
  ...Double rose kiss :_xact.q gives $1 a double rosy kiss 3|----{---4@ 13$! 4@3---}----|
  ...Plain kiss :_xact.q gives $1 a <><><><><><><><>KISS<><><><><><><><>
  ...Upside down kiss :_xact.q gives $1 an 6UpSiDe-dOwN 7KiSs
  ...Passionate kiss :_xact.q gives $1 a passionate kiss that /\/\/\/\/\/\ 5could melt everything /\/\/\/\/\/\
  ...Everlasting kiss :_xact.q gives $1 an everlasting 12@@@@@@@@4K I S S12@@@@@@@@
  ...Colourful kiss :_xact.q gives $1 a 7k8i9s11s of colour 
  ...Kiss Cheek:_xact.q kisses $$1 on the cheek
  ...Kiss On Lips:_xact.q kisses $$1 smack dab on the lips!
  ...Kiss Hand:_xact.q gets down on one knee and takes $$1's hand. Raises it up and Kisses it ever so gently. What a sweet taste. :)
  ...Kiss Neck:_xact.q 4{K}*{I}*{S}*{S}*{E}*{S} $$1 lightly on the neck.WOW! what a wonderful Perfume!! I am in love!
  ...Kiss At?:_xact.q  13grabs12 $$1 13& gives a huge, wet, sloppy, passionate,loving, breath taking4 * * * KISS * * * 13on the (XXX)!!  
  ...Passion Kiss1:_xact.q  grabbs  $$1 and gives her the most passionate, earthshaking, kiss she ever had in her whole life!!!`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`°`°¤ø,¸¸¸,ø¤°`WOW!!!!!!!
  ...Passion Kiss2:_xact.q  }-{ôt PÅ§§îôñåté $$1 KÌ§§è§ !¡¡! $$1 }-{ôt PÅ§§îôñåté $$1 KÌ§§è§ !
  ...Blow Kiss1:_xact.q 12blows some 4kisses your way 12»»--4(¯`°´¯)12=4(¯` °´¯)12---»»4 4 $$1 
  ...Blow Kiss2:_xact.q  12blows 1a 13kiss 1to $$1
  ...Soft Kiss:_xact.q grabs $$1, spins $$1 around and gives $$1 the softest sweetest kiss $$1 has ever had!!! :)
  ...Sloppy Kiss:_xact.q gives $$1 a Sloppy Wet Kiss 12=8-Þ
  ...Kiss Goodnight:_xact.q kisses $$1 goodnight!  
  ...Hotstuff:_xact.q Slides up nice and close to $1 and says, "Hey there hot stuff, Gotta little kissey poo for me? huh? come on pretty please!!! 12:4)14
  ...Lick:_xact.q licks $$1 across the face...mmmmm...tastes like candy. :)
  ...Kiss&grope:_xact.q  blows $$1 an old fashioned kiss and gives her an old fashioned grope
  ...Run&Kiss:_xact.q runs up to $$1 and slaps a kiss *smack* on her lips, then runs like hell the other way!!!
  ...SuPeR Kiss :_xact.q gives $$1 a Super Tight Really Super Erotic Groping, Fondling, Earth Shattering, Sonic Boom, Oh Gawd!! If You Stop I'll Kill You!! Oh yes touch me there, Super Huge Oh Gawd Don't Ya Dare Stop Touching Me!! Huggeroonies And A Knees Are Shaking....Earth Is Trembling, My Heart Has Stopped Beating....Knees Shaking...Lots A Goosebumps, Was That The Ground Moving¿?¿ Passionate Wet Lingering kiss*
  ...WhisperKiss:_xact.q walks over and gives a little kiss on $$1's neck and then stays there like $me is whispering something seductively in $$1's ear. | _xmsg.q i wonder what that could be
  ...3daykiss:_xact.q 12,1gives11,1 $$1 12,1a 13,1long, slow, warm kiss12,1 that lasts 3 days!!!!
  ...Wowkiss:_xact.q says after kissing $$1 ..2.I climbed up the door, and shut the stairs.....3I said my clothes, and pulled on my prayers.....14I shut off my bed, and climbed in to the light....12.All because $$1 kissed me goodnight!!! 4,1 WOW  4 What a kiss!! 
  ...Woohoo:_xact.q  gives $$1 a Heart stopping, expolsion starting,Really Long..and extra deep..super Duper..and really 4hot...peck on the cheek
  ...Big Kiss:_xact.q slides over to $$1 dips her & french kisses her so deeply  that her toes curle & she almost faint, so now he has to re kiss her to reviver her..... ;)
  ..Faces
  ...Thinking
  ....Laugh 1:_xmsg.q $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )º°· $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :D
  ....Laugh 2:_xmsg.q $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )º°· $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :D
  ....-
  ....Smile 1:_xmsg.q $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )º°· $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :)
  ....Smile 2:_xmsg.q $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )º°· $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :)
  ....-
  ....Unhappy 1:_xmsg.q $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )º°· $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :(
  ....Unhappy 2:_xmsg.q $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )º°· $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :(
  ....-
  ....Indifferent 1a:_xmsg.q $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )º°· $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :/
  ....Indifferent 2a:_xmsg.q $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )º°· $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :/
  ....Indifferent 1b:_xmsg.q $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )º°· $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :\
  ....Indifferent 2b:_xmsg.q $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )º°· $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :\
  ....Indifferent 1c:_xmsg.q $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )º°· $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :|
  ....Indifferent 2c:_xmsg.q $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )º°· $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :|
  ....-
  ....Surprised 1:_xmsg.q $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )º°· $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :o
  ....Surprised 2:_xmsg.q $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )º°· $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :o
  ....-
  ....Seriously 1:_xmsg.q $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )º°· $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :·
  ....Seriously 2:_xmsg.q $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )º°· $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :·
  ...Type 1
  ....Smiley:_xmsg.q 1,8: )   
  ....Big Smile:_xmsg.q 1,8: D
  ....Indifferent:_xmsg.q 1,8: I 
  ....Sarcastic:_xmsg.q 1,8: > 
  .....Kid w/cap:_xmsg.q 1,8¶: P)--|----<
  .....Vampire:_xmsg.q 1,8:[    
  ....Johnny smiley:_xmsg.q 1,8¶: )   
  ....Cap and tongue:_xmsg.q 1,8¶ 12:4Þ  
  ....Angry:_xmsg.q 1,8>: (   
  ....Frown:_xmsg.q 1,8: (   
  ....Wink:_xmsg.q 1,8; )   
  ....Blue Magic:_xmsg.q 1,8=)
  ....Addict:_xmsg.q 1,8% o
  ....Cyclops:_xmsg.q 1,8@ )
  ....Surprised:_xmsg.q 1,8: o
  ....Robot:_xmsg.q 1,8[ :) ]
  ....Blue Smiley:_xmsg.q 0,12 :)
  ....Weird Smile:_xmsg.q 1,8:}
  ....Devilish:_xmsg.q 1,8>:- > 
  ....Devilish Wink:_xmsg.q 1,8>;- >
  ....-
  ....Happy:_xact.q is 6,8 HappY!  1,8: )   
  ....Sad:_xact.q is 12Sad 1,8: (
  ....Confused:_xact.q is 7Confused? 1,8%(
  ...Type 2
  ....Happy 1:_xmsg.q 2¶1,8:4,8)
  ....Happy 2:_xmsg.q 2¶1,8:4,8}
  ....Happy 3:_xmsg.q 2¶1,8:4,8]
  ....Happy 4:_xmsg.q 2¶1,8:4,8>
  ....Very happy:_xmsg.q 2¶1,8:4,8)0,0..2¶1,8:4,8D0,0..2¶1,8:4,8)0,0..2¶1,8:4,8D0,0..2¶1,8:4,8)0,0..2¶1,8:4,8D0,0..2¶1,8:4,8)0,0..2¶1,8:4,8D
  ....Laugh :_xmsg.q 2¶1,8:4,8D
  ....Kiss 1:_xmsg.q 2¶1,8:4,8¤
  ....Kiss 2:_xmsg.q 2¶1,8:4,8*
  ....Smile :_xmsg.q 2¶1,8¦4,8)
  ....Sad :_xmsg.q 2¶1,8:4,8(
  ....Tongue Þ:_xmsg.q 2¶1,8:4,8Þ
  ....Tongue þ:_xmsg.q 2¶1,8:4,8þ
  ....Tongue P:_xmsg.q 2¶1,8:4,8P
  ....Tongue b:_xmsg.q 2¶1,8:4,8b
  ....Super Tongue :_xmsg.q 2¶1,8:4,8Þ0,0..2¶1,8:4,8þ0,0..2¶1,8:4,8P0,0..2¶1,8:4,8Þ0,0..2¶1,8:4,8b0,0..2¶1,8:4,8þ0,0..2¶1,8:4,8P0,0..2¶1,8:4,8Þ
  ....Dont Know:_xmsg.q 2¶1,8:4,8|
  ....Not Happy:_xmsg.q 2¶1,8:4,8S
  ....Cry 1:_xmsg.q 2¶1,8:~4,8O
  ....Cry 2:_xmsg.q 2¶1,8:~4,8(
  ....Questionative 1:_xmsg.q 2¶1,8:4,8/
  ....Questionative 2:_xmsg.q 2¶1,8:4,8\
  ....Hungry/hamsap:_xmsg.q 2¶1,8:4,8)~~~~~
  ....Hamsap face1:_xmsg.q 2¶1,8:4,8D~~~~~
  ....Hamsap face2:_xmsg.q 2¶1,8¦4,8)~~~~~
  ....Hamsap face3:_xmsg.q 2¶1,8¦4,8D~~~~~
  ....Touched:_xmsg.q 2¶1,8:~4,8)
  ....Ghost face:_xmsg.q 2¶1,9:4,9E
  ...Type 3
  ....Happy 1:_xmsg.q 1,8(ñ4,8_1,8ñ)
  ....Happy 2:_xmsg.q 1,8(â4,8_1,8â)
  ....Happy 3:_xmsg.q 1,8(à4,8_1,8á)
  ....Happy 4:_xmsg.q 1,8(ì4,8_1,8í)
  ....Happy 5:_xmsg.q 1,8(ò4,8_1,8ó)
  ....Happy 6:_xmsg.q 1,8(Ò4,8_1,8Ó)
  ....Smile 1:_xmsg.q 1,8(á4,8_1,8á)
  ....Smile 2:_xmsg.q 1,8(ã4,8_1,8ã)
  ....Smile 3:_xmsg.q 1,8(Õ4,8_1,8Õ)
  ....Smile 4:_xmsg.q 1,8(õ4,8_1,8õ)
  ....Smile 5:_xmsg.q 1,8(â4,8_1,8â)
  ....Smile 6:_xmsg.q 1,8(î4,8_1,8î)
  ....Smile 7:_xmsg.q 1,8(T4,8_1,8T)
  ....Sad 1:_xmsg.q 1,8(ó4,8_1,8ò)
  ....Sad 2:_xmsg.q 1,8(á4,8_1,8à)
  ....Sad 3:_xmsg.q 1,8(í4,8_1,8ì)
  ....Sad 4:_xmsg.q 1,8(ú4,8_1,8ù)
  ....Sad 5:_xmsg.q 1,8(Ó4,8_1,8Ò)
  ....Sleep:_xmsg.q 1,8(ú4,8_1,8ú)
  ....Sleeping:_xmsg.q 1,8(ú4,8_1,8ú)2,0 Zzzzzzzzzz.......zzzzzzz......zzzz....zz
  ....Cry 1:_xmsg.q 1,8(Ý4,8_1,8Ý)
  ....Cry 2:_xmsg.q 1,8(ý4,8_1,8ý)
  ....Blur:_xmsg.q 1,8(@4,8_1,8@)
  ..Love Poems
  ... Poem (Love Never)  {
    /..timer35 1 1 _xmsg.q 4Never Say I Love U 
    /..timer36 1 2 _xmsg.q 4If U Dun Really Care
    /..timer37 1 3 _xmsg.q 4Never Talk Of Feelings 
    /..timer38 1 4 _xmsg.q 4If They Aren't Really There
    /..timer39 1 5 _xmsg.q 4Never Hold My Hand
    /..timer40 1 6 _xmsg.q 4If U Mean To Break My Heart
    /..timer41 1 7 _xmsg.q 4Never Say Forever
    /..timer42 1 8 _xmsg.q 4If U Ever Plan To Part
    /..timer43 1 9 _xmsg.q 4Never Look Into My Eyes
    /..timer44 1 10 _xmsg.q 4If U Are Telling Me Is A Lie
    /..timer45 1 11 _xmsg.q 4Never Say Hello
    /..timer46 1 12 _xmsg.q 4If U Think U'll Say GoodBye
    /..timer47 1 13 _xmsg.q 4Never Say That I'm The One
    /..timer48 1 14 _xmsg.q 4If U Dream Of More Than Me
    /..timer49 1 15 _xmsg.q 4Never Lock Up My Heart
    /..timer50 1 16 _xmsg.q 4If U Dun Have The Key
  }
  ... Poem 2 (Love)  {
    /..timer35 1 1 _xmsg.q 9When I Saw U
    /..timer36 1 2 _xmsg.q 9I Was Afraid To Talk To U
    /..timer37 1 3 _xmsg.q 9When I Talked To U
    /..timer38 1 4 _xmsg.q 9I Was Afraid To Hold U
    /..timer39 1 5 _xmsg.q 9When I Hold U 
    /..timer40 1 6 _xmsg.q 9I Was Afraid To Love U
    /..timer41 1 7 _xmsg.q 9Now That I've Love U
    /..timer42 1 8 _xmsg.q 9I'm Afraid To Lose U
  }  
  ...  Poem 3 (Present)  {
    /..timer35 1 1 _xmsg.q 8Yesterday Is A History
    /..timer36 1 2 _xmsg.q 8Tomorrow Is A Mystery
    /..timer37 1 3 _xmsg.q 8And Today Is A Gift
    /..timer38 1 4 _xmsg.q 8That's Why It's Called A Present
  }
  ... Poem (LoveHurts)  {
    /..timer35 1 1 _xmsg.q 12Sometimes Love Hurts
    /..timer36 1 2 _xmsg.q 12But If It Doesn't Hurt
    /..timer37 1 3 _xmsg.q 12Then Itsn't Love Anymore
    /..timer38 1 4 _xmsg.q 12Hold On To The Person U Love
    /..timer39 1 5 _xmsg.q 12Before They Slip Away
    /..timer40 1 6 _xmsg.q 12Or Else U Can Never Get Them Back
  }
  ... Poem (Born)  {
    /..timer35 1 1 _xmsg.q 11I Was Born When U Kissed Me
    /..timer36 1 2 _xmsg.q 11And I Died When U Left Me
    /..timerr37 1 3 _xmsg.q 11But I Lived For The Time U Love Me
  }
  ... Poem (U)  {
    /..timer35 1 1 _xmsg.q 13Until There Was U 
    /..timer36 1 2 _xmsg.q 13I Cry Myself To Sleep
    /..timer37 1 3 _xmsg.q 13WHile I Had U. I Fell Asleep With A Gentle Smile On My Face=)
    /..timer38 1 4 _xmsg.q 13Before I Lost U, I Worried Myself To Sleep
    /..timer39 1 5 _xmsg.q 13Now That I Know U R Gone
    /..timer40 1 6 _xmsg.q 13I Sat At Nite, Waiting For U To Cum Back
  }
  ... Poem [Heart]  {
    /..timer35 1 1 _xmsg.q 7I promise U frm the bottom of my heart
    /..timer36 1 2 _xmsg.q 7I will love U till death do us apart
    /..timer37 1 3 _xmsg.q 7I promise U as a lover and a fren
    /..timer38 1 4 _xmsg.q 7I'll love U like I never love again
    /..timer39 1 5 _xmsg.q 7With everything I am
  }
  ... Poem [Ans]  {
    /..timer35 1 1 _xmsg.q 4Show me a reason, give me a sign
    /..timer36 1 2 _xmsg.q 4Tell me the way we fall out of line
    /..timer37 1 3 _xmsg.q 4Is it today or is it tonight we’ll find
    /..timer38 1 4 _xmsg.q 4The answer to our life
  } 
  ... Poem [Quit]  {
    /..timer35 1 1 _xmsg.q 8Quit playin' games with my heart
    /..timer36 1 2 _xmsg.q 8Before you tear us apart
    /..timer37 1 3 _xmsg.q 8I should've known from the start
    /..timer38 1 4 _xmsg.q 8Before U got in my heart
    ...-
  }
  ... Poem [World]  {
    /..timer35 1 1 _xmsg.q 9WðR|Ð í§ ¢Rúê|,|ðVê |§ ß|íÑÐ,13|ð§T íÑ §âÐÑÉ§§,ß|úR íÑ MíÑÐ,11hÉãRt í§ ßrðKÉÑ,F|âMe HâÐ ÐíÉÐ,4TíMe Hâ§ Pâ§§eÐ & 12hÉ'§ ÑðT MíÑe~
  }
  ... Poem [Hurts]  {
    /..timer35 1 1 _xmsg.q 12¤ 8Ît hùRt§ 2 £óVë §ôMéÖÑê Ñ ñÖT Bê £óVéD ìÑ RêTùrÑ 7BùT wAt ì§ é Mô§t PåìÑFúL ì§ 2 £óVé §ôMëÖñê Ñ 4ñëVéR FìñDÎñG é ÇôúRåGë 2 £êT é PëR§óÑ KñôW HôW Ü Fëê£12¤  
  }
  ...-
  ... Poem [LiBai/Eng]  {
    /..timer35 1 1 _xmsg.q 15[English Verison] Chuang Qian Ming Que Guang
    /..timer36 1 2 _xmsg.q 4The moon light is pouring down on my bedside
    /.timer37 1 3 _xmsg.q 7Like white frost spreading on the ground
    /..timer38 1 4 _xmsg.q 8I look up the bright round moon in the sky
    /..timer39 1 5 _xmsg.q 0And lower my head thinking of my dear hometown
    /..timer40 1 6 _xmsg.q 15-LiBai 
    ..-
  }
  ... Poem [Libai/Sin]  {
    /..timer35 1 1 _xmsg.q 15[Singlish Version] Chuang Qian Ming Que Guang
    /..timer36 1 2 _xmsg.q 14Bedfront Moon Bright Bright
    /..timer37 1 3 _xmsg.q 12Think Is Floor White White
    /..timer38 1 4 _xmsg.q 11Lift Head See Moon Moon 
    /..timer39 1 5 _xmsg.q 0Bow Head Miss Home Home....
    /..timer40 1 6 _xmsg.q 15-LiBai
  }
  ... Poem [Libai/Army]  {
    /..timer35 1 1 _xmsg.q 15[Army Version] Chuang Qian Ming Yue Guang
    /..timer36 1 2 _xmsg.q 3Bedfront Lau Bark Sai (tears drop)
    /..timer37 1 3 _xmsg.q 10Thinking About Exercise (reservist mobilization)
    /..timer38 1 4 _xmsg.q 9Drop Dead Look Into The Sky (run until no breathe)
    /..timer39 1 5 _xmsg.q 0Tong Kor Sia Lang Cai? (my heartache nobody knows)
    /..timer40 1 6 _xmsg.q 15-LiBai  
  } 
  ... Deep love :_xmsg.q 13I know that time can never change the love I have for $1..... Except to make it deeper still with everything we do...... In all my dreams of coming years, you play the greatest part, For I know that time will never change the love within my heart...
  ... Love poem :_xmsg.q 9I always lose control when $1 is by my side. You have become the light of my life. I always enjoy the time I spend with you. Because nothing makes me feel the way you do. I think I'm falling in love with you...
  ... Love :_xmsg.q 12Every time I see your face and I hear your voice, It stirs up feelings inside that I've never felt before. Was it the words you said that made me feel this way? Maybe it was the touch of your hand and the smile on your face...I think I'm falling in love with $1...
  ... Miss u :_xmsg.q 4Tonight I looked up at the stars, And I wondered where you are. Tonight I gazed upon the moon, In hopes that I would see you soon...
  ... TrueLove :_xmsg.q 9True Luv Is Eternal, Cherish Luv When You Got The Chance,Once It Left You, It Will Be Difficult To Get It Back, Dun Let Love Be Onli A Memory
  ...-
  ... Love Poem 01 :_xmsg.q 13 I know that time can never change the love I have for $1..... Except to make it deeper still with everything we do...... In all my dreams of coming years, you play the greatest part, For I know that time will never change the love within my heart...
  ... Love Poem 02 :_xmsg.q 9 I always lose control when $1 by my side. You have become the light of my life. I always enjoy the time I spend with you. Because nothing makes me feel the way you do. I think I'm falling in love with $1 ...
  ... Love Poem 03 :_xmsg.q 12 Every time I see your face and I hear your voice, It stirs up feelings inside that I've never felt before. Was it the words you said that made me feel this way? Maybe it was the touch of your hand and the smile on your face...I think I'm falling in love with $1... 
  ... Love Poem 04 :_xmsg.q 7 You are my best friend and my only true love. I'm sure that you were sent from heaven above. Today is the first day of the rest of our lives. And our future is beginning to look so bright. I think I'm falling in love with $1 ...
  ... Love Poem 05 :_xmsg.q 4 Tonight I looked up at the stars, And I wondered where you are. Tonight I gazed upon the moon, In hopes that I would see $1 soon...
  ... Love Poem 06 :_xmsg.q 8 Tonight you'll look oh so fine, But It will all be in my mind. Tonight you won't even know, That I still love you so... $1
  ... Love Poem 07 :_xmsg.q 10 I can admire your beauty, To which I must stare. Your chin, your mouth, your nose and eyes,  All add to a face so fair...To $1
  ... Love Poem 08 :_xmsg.q 4 I hope that you can accept, How much I really care. A person who loves you more, You can find nowhere... $1
  ..Actions
  ...ToysRUsKid!:_xact.q $c(1) says $c(2) $$1 $c(1) is a Toys R Us kid!!! Don't wanna to grow up!
  ...Fishies:_xact.q Tosses $$1 in the river12¸.·´¯`·.¸¸.·´¯`9><((((º>12¸.·´¯`·.¸9><((((º>4 FISH BAIT9<º))))><12.·´¯`·.¸¸.·´¯`·.¸¸.·´¯`·.¸¸.·´¯`·.¸.·´¯`·.¸9><((((º>4HERE FISHIES9<º))))><12.·´¯`·.¸¸.·´¯`·.¸¸.·´¯`·.¸.·´¯`·..·´¯`·.¸¸.·´¯`·.¸9><((((º>4FISHIE BAIT9<º))))><
  ...FishBait:_xact.q  tosses $$1 in the river9,12 ¸.·´¯`·.¸.·´¯`·.¸¸.·´¯`·.¸ 12,9><((((º>  4,12FISH BAIT 12,9<º))))>< 9,12.·´¯`·.¸ ¸.·´¯`·.¸.·´¯`·.¸¸.·´¯`·.¸12,9 ><((((º>  4,12HERE FISHES 12,9<º))))>< 9,12.·´¯`·.¸ ¸.·´¯`·.¸.·´¯`·.¸¸.·´¯`·.¸ 12,9><((((º> $c(2)2 fishie bait  12,9<º))))><
  ...pie:_xact.q throws 11,12 ----=======|} |} |} |}  ----=======|} |} |}13,12 Pie In Everyone's Faces!!!! 11,12----=======|} |} |} |}  ----=======|} |} |} |}
  ...mice:_xact.q Screams WatCh Out!!! Mousey Attack!!!!!!! 9 <:3 )~~~~ 12 <:3 )~~~~ 8 <:3 )~~~~ 13 <:3 )~~~~ 11 <:3 )~~~~
  ...micegreet:_xact.q  8,12 <:3 )~~~~  13,12 <:3 )~~~~ 9,12 <:3 )~~~~  4,12 $$1  11,12 <:3 )~~~~  9,12 <:3 )~~~~  13,12 <:3 )~~~~
  ...Mad:_xact.q says well $$1 you know that every minute you are angry you waste 60 Happy Seconds :)
  ...Brat!:_xact.q 11,12I am not a brat!13,12 am not... am not... am not 11,12Þ !
  ...Rats:_xmsg.q 12"Rats! Rats! Rats"! 9,12(Translation for the reading impaired):  13,9~~(¸¸ ¸¸ºº>  12,9~~(¸¸ ¸¸ºº>  13,9~~(¸¸ ¸¸ºº>
  ...BIGConfetti:_xact.q  `*~`~`;;.~`;.*`;. `~`~`*~`;.~`;.*`;`~; ~`*~~`;.~`;.*`;.`~; ;.~`;.*`;. `~`~`*~`;.~`;.*`;.~;*`;.`~; ~`*~`~`;.~`;.*`;.`~; ;.~`;.*`;. `~`~`*~`;.~`;.*`;.~;*`;.`~; ~`*~`~` .~`;. *`;.`~; ;.~  $$1  `;.;.`~`~`*~`;.~ `;.*`;.~;*`;.`~; ~ `*,`~`;.~`;.*`;.`~; ;.~`;.*`;. `~`~,`*~`;.~`;.*`;.~;*`;.`~; ~`*~`~`;.~`;.*`;.`~; ;.~`;.*`;. `~`~`*~`;.~`;.*`;.~;*`;.`~; ~`*~`~`;.~`;.*`;.~;*`;.`~; ~`*~` Now get the broom and sweep it up!
  ...Balloons:_xact.q throws 13,9CONFETTI & BALLOONS0,12 in the air for,13,12 $$1  `;~'O~~~*`;.'O~~~~*`;.'`~;`~`O~~~~*`;.'O~~~~*`;.'`~;`~`O~~~*`; .'O~~~~*`;.'`~;`~`O~~~~*`;.'O~~~~*`;.'`~;`~`O~~~*`;.'O~~~~*`;.' `~;`~`O~~~~*`;.'O~~~*`;.'`~;`~`O~~~~*`;.'O~~~~*`;.'`~;`~`O~~~~*`;.'O~~~~*`;.'`~;`~`O~~~~*`;.'`~O~~~~*`;.'`~;`~`O~~~~*`;.'`~O~~ ~~*`;.'`~;`~`O~~~~*`;.'`O~~~~*  13,9Now sweep it up!~!~!
  ...Scream !:_xact.q 12,9Screams  $$1 $+ !!!!!!!!!!!!!13,9 ARGH!!!!!!!!!!!!!!!!!!!!!! 
  ...P§§:_xact.q touches $1 on the arm as a loud "PSSSSSSSssssss" is heard... Let's go cause some Trouble!!!!!!!!!!!!!!!!
  ...She WäîTS:_xact.q hears the Jeopardy theme in the background as she waits for $1 to respond...
  ...He WäîTS:_xact.q hears the Jeopardy theme in the background as he waits for $1 to respond...
  ...innocent:_xact.q stares at the ceiling and whistles innocently....
  ...BadDog:_xact.q slaps $$1 with a rolled up newspaper...bad Dog!!!!!
  ...Fish:_xact.q Pushes $1 Into A Pool Of Piranas... 9 <')))))>< 12SPLaSH!!!!!!! 9 <')))))><
  ...disease:_xact.q 12,1 injects $1 with a syrange filled with  MaD CoW DiSeAsE... 13,1 |==[)XXXX>--- 12,1<Moooooooo> 13,1 |==[)XXXX>---
  ...hammer:_xact.q hits $1 over the head with a Big hammer 12 ====[]  4 Bang!!! 12 ====[]
  ...mouse:_xact.q chases  a Mouse!!!!!! 9 <:3 )~~~~   12 Yummy!!!   9 <:3 )~~~~  
  ...Wedgi:_xact.q looks at $1... | .timer 1 3 me decides that $1 just doesn't look right.... | .timer 1 7 me grabs $1 $+ 's pants and pulls them WAAAAY up and wraps them around his head... much better! 
  ...G®îñ:_xact.q grins at $$1 wickedly!
  ..Sexual Love
  ...MaleSex
  ....bite:_xact.q 4< $+ $me $+ > 12Walks over to 15 < $+ $$1 $+ >12 leans in close as he slides his tongue over her neck 15.Then works his tongue around to her earlobe. Makeing 15 < $+ $$1 $+ >15 shiver with sheer pleasure12 as he licks around her earlobe before biting gentley on her earlobe  
  ....divein:_xact.q 4< $+ $me $+ > 9dives between4 < $+ $$1 $+ >9 legs, and thrusts his tongue inside 4 < $+ $$1 $+ >9 juicy wet cunt.Licks away as he slides his tongue deeper inside 4 < $+ $$1 $+ >9 wet,delicious, hot and very tasty pussy.  
  ....fingers:_xact.q 4< $+ $me $+ > 9slides his fingers into4 < $+ $$1 $+ >9 hot,dripping,wet pussy.bringing 4 < $+ $$1 $+ >9to pure exctasy,As he bites into her thigh,drawing the wonderfull taste of4 blood9 as 4 < $+ $$1 $+ >9 reaches the point of climax with an excited scream  
  ....embrace:_xact.q 0< $+ $me $+ > 9 bites into 4< $+ $$1 $+ >8 neck, allowing for the blood to freely pass over his lips, as he takes the life from 4 < $+ $$1 $+ >. | /timer 1 1 _xact.q * 9 Uses his tongue to quicken the flow of the blood as he takes 4 < $+ $$1 $+ >8 to a whole new world of darkness.9 Licks the wound closed as he senses all the blood has been taken out of her | /timer 1 5 _xact.q * 0 $+ $me $+ >8 takes his dagger and slits a fine cut over it, exposing his blood for all to see9 Places his wrist at 4 < $+ $$1 $+ >8 mouth.watching cloesly as 9 < $+ $$1 $+ >8takes the new life he provides from his gapeing wound  | /timer 1 9 _xact.q * 0 $+ $me $+ >8 takes his wrist from her mouth,then licks hsi wound closed.0 $+ $me $+ > smiles down at 4 < $+ $$1 $+ >8 and says "welcome to my family, my new daughter
  ....breasts:_xact.q 4< $+ $me $+ > 9runs his tongue over 4 < $+ $$1 $+ >9 breasts, as he teases the nipple with his fingers. As 4 < $+ $$1 $+ >9 moans out loud4 < $+ $me $+ >  9 bites down on her breast, using his fangs0(V^^^V)4 to pierce the skin on 4 < $+ $$1 $+ > 9 breasts, bringing her to a land of total exctasy  
  ....snog:_xact.q 4< $+ $me $+ > 9looks 4 < $+ $$1 $+ >9 deep within her eyes.As he goes down on 4 < $+ $$1 $+ >9 pussy, to deliver a earth shattering, lots of tongue action 9 snog, that makes 4 < $+ $$1 $+ > 9moan4< $+ $me $+ > 4< $+ $me $+ > 4< $+ $me $+ >9 over and over again   
  ....snog of the centuary:_xact.q 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 wrips of her clothes.As he lifts4 < $+ $$1 $+ >9 up, so her legs are straddling his face,4 < $+ $me $+ >  9delivers the now famous , snog of the century between 4 < $+ $$1 $+ > 9legs 
  ....badgirl:_xact.q 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 since she is being a bad fucking girl9 forces 4 < $+ $$1 $+ >8 over his knee, as he pulls her pants down, and begins to WACK4 < $+ $$1 $+ > 8 ass, good and proper with his0 Paddle
  ....Moan:_xact.q 6Slowly Walks to 9"14 $$1 9" 12Grabbing Her From 15Behind 14And 9"4Thrusting9" 6His 14Hard 9"13Cock9" 11Against Her Tight 13(_Ass_) 9Fealing Him Against 14Her Ass She 6Lets Out An Incredible 9M14o6a14nnnnnnnnnnnnnnnn
  ....Spread:_xact.q 11PaRts 13 $$1 11Legs Thrusting His Wet Tonuge Down tO13 $$1 11Sweet Juicy Pussy And Licking Her CleaN | /timer 1 1 _xact.q * 11Running His Tongue all over her HotBox13 $me 11bEgins To SLip his tongue deepER AND dEEpER inside and Loves The Taste Of13 $$1 11PuSSy
  ....Throw:_xact.q 14When I See You There10 $$1 14I Wanna Throw You Down And Shove My Erect 13Cock14 Into your Hot13 Pussy14 Or You Could Just Get On Your Kness And 10SUCK 14All My 11Cum14 Down Your Throat
  ....Sex1:_xact.q 7,6.·´¯)Vvå£k§ Ûþ †ø $$1 †åKíñg ]-[î§ håñds äñ §£íÐ¡ñg t]-[e]v[ Ùþ $$1's †¡gh† §]-[¡Rt ƒêê£îñg $$1's Ñ¡þþ£ê§ ßêG¡ññ¡ñg †ø }{ârÐëñ ßè†wëëñ }{i§ ƒïñgèRŠ †¡þ§¸Å§ }{è £¡çk§ ]-[¡§ £¡þ§ $$1 *Š*(¯`·.
  ....Sex:_xact.q 14walks over to9 $$1 14and grabs her around the waist really hard thrusting his body against9  $$1 14s13 tits 14feeling her erect13 nipples 14so hard against him | /timer 1 1 _xact.q * 14begins to run his hands lower over her body teasing her to the point of total submission and she is helpless to refuse him and any of his wishes  
  ....assbite:_xact.q 1__________________________-_____4( 0V13^^^^^^^^^^^^^^^^^0V 4) | _xact.q  1__________________________________  8 $$1 's  0 (_|_) | _xact.q 1 ______________________-________ 4( 13/\15vvvvvvvvvvvvvvv13/\ 4)ds down over9  $$1 s13 tits 14and slides them into her pants to feel how wet9  $$1 s13 pussy 14is for him. | /timer 1 2 _xact.q * 14 then slowly starts to rub9  $$1 14s wet13 pussy 14knowing she loves it by the expression on her beautiful face,9 $$1 14begins to pull9 $me 14s hand harder into her13 pussy 14wanting him to 4fuck 14her13 pussy 14with his fingers so hard and make her 11cum14!
  ....cockslap:_xact.q 14Come Her15e $$1 it's time f14or you to ge15t13 (_)_)lllllllllD 15slapped bitch.  W14here do you want i15t $$1 ?  Your ass o14r your face?
  ....ass:_xact.q 10Mind if I re14ach aroun15d $$1 and pla10y with yo14ur 13 "TITS" 14while I fuck y15ou in the13 (_ass_) 
  ....Licks-edited:_xact.q 4putš hiš finger in hiš mouth and walkš up to 6 $$1 4and šlowly runš hiš finger down my šhirt and over my nipple. Saying "I'll HeLpš you get out of thoše wet clotheš 6 $$1 4" 13®
  ....2spots-ed:_xact.q 15«14§15»4«12§4»0«6§0»14«15§14»12«4§12»6«0§6» 15HeY 14 $$1 4I'vE 12GoT 0TwO 6§pots 14Of 15ThRoBbInG 12LoVe 4FoR 6YoU 15«14§15»4«12§4»0«6§0»14«15§14»12«4§12»6«0§6» 13®
  ....Blow-ed:_xact.q 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 4Let's 0PLAY 4army! 0You 4lay down 0 $$1 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­4, and I'll 0ß£ØW 4the hell out of YoU! 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 13®      
  ....Question:_xact.q ­­12Bend over­15 < $+ $$1 $+ > 12Then you got to decide, do I smack your ass with my paddle or Just fuck you good and proper?­
  ....Hungry:_xact.q  4Im 5f4eeling a  5l4ittle hungry 3 $$1 4I fancy 5h4aving some hot,5t4asty pie,with 5d4elicious melons for  5d4essert 5I'm4 sure you can 5h4elp me here3 $$1  | /timer 1 8 _xact.q * 0you say no 3 $$1 0You actually think you have a choice4 COME HERE BITCH 
  ....ShakeRattleAndRoll:_xact.q 11Lets 13shake 0rattle 4and roll10 $$1 0You shake your hand on my cock,ill rattle my fingers in and out of you.7Then ill roll you around and fuck you all night long10 $$1 
  ....Pros:_xact.q 0 $$1 9 and4 $$me 7 THE PROFESSIONAL SLUTS OF ACN
  ....ThankYou:_xact.q 0Thank you for that blowjob last night4 $$1 8 I really enjoyed it that much,I would like another one.0Thow I am a little short of cash, So can I have a freebie4 $$1 
  ....BeatMe:_xact.q 0 You may 12beat me4,frope me15,grope me11,snog me8 $$1 9But goddammit to hell,3You got to let me ram my 9cock into that sweet little0 (_ass_) 3 of yours
  ....Fropes:_xact.q 0Fropes12 $$1 0breasts12 $$me 0thinks theres something wrong here8 oh i see what it is12 $$1 8you still have that silly top on,take it of and free4 them breasts for me to suck and lick like a real pro
  ....LivingHell:_xact.q 0fucks the living hell out of 4 $$1 0 cause she is sexually deprieved and needs a good seeing to
  ....Gropes:_xact.q 12Fropes 11 $$1 8ass12 and8 breasts,12then8 rams12 his8 cock12 into11 $$1 8cunt,12 makeing 8her 12scream8 OMG11 $$me 12you 8are 12my 8master 12and 8the 12RULER8 OF12 THE8 WORLDDDDDDDDDDDDD 
  ....Fishy:_xact.q 6hmmm 0 $$1 3 something smells fishy,4 $$me 6sniffs 0 $$1 3pussy, hmm nope smell not coming from there,3shrugs O well may as well give ya a good licking while I'm here
  ....Angellike:_xact.q 10Be good wittle0 angellike7 $$1 10OMG what the fuck am i talking about, just fuck me now 7 $$1 
  ...FemaleSex
  ....bite:_xact.q 4< $+ $me $+ > 12Walks over to 15 < $+ $$1 $+ >12 leans in close as she slides his tongue over his neck 15.Then works her tongue around to his earlobe. Makeing 15 < $+ $$1 $+ >15 shiver with sheer pleasure12 as she licks around his earlobe before biting gentley on his earlobe  
  ....divein:_xact.q 4< $+ $me $+ > 9dives between4 < $+ $$1 $+ >9 legs, and slides her mouth around his cock.looks up into the eyes of 4 < $+ $$1 $+ >9 Runs her lips up and down the large cock in her hand. Takeing the whole erection in her mouth.4 < $+ $$1 $+ >9 moans with sheer pleasure as 4< $+ $me $+ > 9 sucks faster and faster
  ....hand:_xact.q 4< $+ $me $+ > 9slides her hands around4 < $+ $$1 $+ >9 large,throbbing erection.Watching with a grin as 4 < $+ $$1 $+ >9 moans with the sheer pleasure provided by the quick movements of 4< $+ $me $+ > 9hand. 4 < $+ $$1 $+ >9 reaches the point of climax with an excited scream as 4< $+ $me $+ >  9 licks up all the dripping cum
  ....embrace:_xact.q 0< $+ $me $+ > 9 bites into 4< $+ $$1 $+ >8 neck, allowing for the blood to freely pass over her lips, as she takes the life from 4 < $+ $$1 $+ >. | /timer 1 1 _xact.q * 9 Uses her tongue to quicken the flow of the blood as she takes 4 < $+ $$1 $+ >8 to a whole new world of darkness.9 Licks the wound closed as she senses all the blood has been taken out of him | /timer 1 5 _xact.q * 0 $+ $me $+ >8 takes her dagger and slits a fine cut over it, exposing her blood for all to see9 Places her wrist at 4 < $+ $$1 $+ >8 mouth.watching cloesly as 9 < $+ $$1 $+ >8takes the new life she provides from her gapeing wound  | /timer 1 9 _xact.q * 0 $+ $me $+ >8 takes her wrist from his mouth,then licks her wound closed.0 $+ $me $+ > smiles down at 4 < $+ $$1 $+ >8 and says "welcome to my family, my new son
  ....tease:_xact.q 4< $+ $me $+ > 9runs her tongue over 4 < $+ $$1 $+ >9 chest,flicking at his nipples as she teases him with her tongue 4 < $+ $$1 $+ >9 moans out loud4 < $+ $me $+ >  9as she bites down on his chest with her fangs0(V^^^V)4 Drawing a little blood from 4 < $+ $$1 $+ > 9 chest  
  ....blowjob:_xact.q 4< $+ $me $+ > 9looks 4 < $+ $$1 $+ >9 deep within his eyes.As she goes down on 4 < $+ $$1 $+ >9 cock, to deliver a earth shattering, lots of sucking action 9 blowjob, that makes 4 < $+ $$1 $+ > 9moan4< $+ $me $+ > 4< $+ $me $+ > 4< $+ $me $+ >9 over and over again   
  ....blowjob of the centuary:_xact.q 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 wrips of his clothes.As she lies back with4 < $+ $$1 $+ >9 legs straddling his face,4 < $+ $me $+ >  9 delivers the earth shattering blowjob of the centuary between 4 < $+ $$1 $+ > 9legs 
  ....badboy:_xact.q 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 since he is being a bad fucking boy9 forces 4 < $+ $$1 $+ >8 over her knee, as she pulls his boxers down, and begins to WACK4 < $+ $$1 $+ > 8 ass, good and proper with his0 Paddle
  ....lix:_xact.q 14Pushes her 13( 0 )( 0 ) 14together and LickS her 4LIPS 14 as she looks at 9 $$1 14and wonders if he knows how 10WET 14her 0^pussy^ 14is for 9HIM 
  ....mouth:_xact.q 12FuCk My MoUt2H WiTh YoUr CoC14k $$1 WhiLe I Fu15Ck My CuNt Wi11Th My FiNgE0rS
  ....relaxxx-ed:_xact.q 14Close Your eyes12 $$1 4- RELAXXX - 14think of the sensation of Your CocK sliding up and down my 10WET13PUSSY 14right before You 12FUCK 14me..suck:_xact.q 14If YoU PusH my Hea15D DowN on YouR CocK $$1 I'l13l SucK iT aNd SucK it a15Nd SucK it aNd The14N I'll SucK it SomE mORe !!!!
  ....breath:_xact.q  14wraps her 4HAND 14around11 $$1 's 4THROBBING 14"Love Muscle" and looks into his 4EYES 14slowlyyyy 4LICKING 14the 4TIP 14with her 4TONGUE 14and then blowing on his 4COCK 14with her 4HOT 14breath.
  ....pvt:_xact.q 14If you're horny9 $$1 14heres my pvt room 3#OhYes 14Here's my pussy 13(it's wet) 14Here's some handcuffs 15(oh baby) 14And the rest is up to you9 $$1
  ....pleaseme:_xact.q 0I have 2 13( 0 )v( 0 ) 0and one 15PUSSY 0an 13(_ass_)  0You've got a0 4TONGUE 0a 13(_)_)lllllD 0and 10 14FINGERS0.....Put it all together.... Then cum 3#PLEASE_ME0 $$1
  ....cum:_xact.q 12 $$1 Yo15u can put a sm14ile on my face, o11r you can p12ut your c14um all ov15er it 11!
  ....scrabble:_xact.q 12Pushes the button on the wall.... a spotlight shines on 8\\\0 $$1 8///12...music begins to play. | _xact.q * 12She walks over to the dresser glancing at 0 $$1 12she asks Him if He wants to play a game. | _xact.q * 12 $me opens the drawer and takes out some 4HANDCUFFS 12and some 7VASELINE12, some 9BATTERY OPERATED TOYS12, an 13FEATHER12, and 10 3 BOTTLES OF MASSAGE OILS12, also a 3SILK NITIE12, 8 2 BOTTLES OF TEQUILA12, some 15SHOT GLASSES | _xact.q * 12 Lastly $me removes 13 ThE gAmE oF sCrAbBLe12.  Carrying all of this, she walks over to 0 $$1 12 and whispers.... "If You are feeling really naughty for me, i'll set up the scrabble board"
  ....cum2me:_xact.q 13,6 $$1 YoU sExY BaStArD....cUm To Me BaBy
  ....bj:_xact.q 12GiVeS13 $$1 0a11LoNg12AnD14LiNgErInG15cOcK13hArDeNiNg6HeArT4bEaTiNg3PaLm9SwEaTiNg11NiPpLe12HaRdEnInG14hAiR15rAiSiNg13PuPiL4dIaLaTiNg6HeAd3TuRnInG9bLoW11jOb
  ....Job-ed:_xact.q 2{{{{{12{{{{{11{{{{{0{{{{{ 8ÀrÉ 12You 11AcHing 4 $$1 0?¿? 9CÀusÉ 12YoU 11rÉÀlly 0nÉÉd 6À 12ßLÓwJÒß11, 0but 7YoU'll 12tÀkÉ 11À 0hard 13FuCk 12Ïf 11onÉ's 0ÀvÀiLÀbLÉ, RiGhT? 0}}}}}11}}}}}12}}}}}2}}}}}13® 
  ....Blow-ed:_xact.q 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 4Let's 0PLAY 4army! 0You 4lay down 0 $$1 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­4, and I'll 0ß£ØW 4the hell out of YoU! 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 13®      
  ....urBone:_xact.q 3»»æ0:3{13®3}0:3æ«« 13YoU'll 4£11ove 13Every 11Bone 13In 11my 13Body 11 $$1 13Especially4 Y11ours
  ....Buffett-edited:_xact.q 4¿0?4¿0?4¿0?4¿0?4¿0?4¿0?4Cøûld 0I 4Bë 0Yøûr 4L0ø4v0ë 4B0û4f0f4ë0t 0 $$1 4Sø 0Yøû 4Cøûld 0Låy 4Me 0On 4Thë 0Tåblë 4And 0Eåt 4Whåt 0Yøû 4Wåntëd 0?4¿0?4¿0?4¿0?4¿0?4¿0?4¿13®
  ....Boxing:_xact.q 3Wanna 11Play 3Midget 11Boxing 3 $$1 ? 11I'll 3Get 11Down 3On 11my 3Knees 11And 3Give 11You 3A 11Couple 3Of 11Blows!13® 
  ....hotpussy:_xact.q 14¤¤¤¤ $$1 ¤¤¤¤ 15Guess What! 0I've got an hot, wet pussy! 14And i can feel YoUr Breathe close to it now! 13® 
  ....suck:_xact.q 0Doesn'T cARe AbouT 13jEWELs 0OR 3mONEy 0ShE oNLy WantS to SucK 12 $$1 's 0cOCk
  ....ABC-ed:_xact.q 6I'll Lay down4 $$1 6and part my13 PUSSY LIPS 6for YoU so YoU can spell out the 12A9L13P4H10A0B14E2T 6on my 13CLIT 6with YoUr 4TONGUE
  ....SticksStones:_xact.q 12¤¤¤¤4§ticks 13Änd 12§tones 4Will 13ßreak 12Mý 4ßone§ 13ßut 12HandCuff§ 4Ãnd 13Feather§ 12Excite 13Mé 4¤¤¤¤ $$1 ¤¤¤¤ 13§ex 12i§ 4The 13Thing; 12I 4Like 4Tó 13Dó 12It 4Ñìghtlý 13¤¤¤¤®
  ....Slip:_xact.q 0HeY13"·*:·*"·*:·*"·*:·*" $$1 "·*:·*"·*:·*"·*:·*0HoW13"·*:·*"0AbOuT13"·*:·*"0You13"·*:·*"0§LiP13"·*:·*"0InTo13"·*:·*"  0SoMeThInG13"·*:·*"0MoRe13"·*:·*"0cOmFoRtAbLe13"·*:·*"0LiKe13"·*:·*"0Me13"·*:·*"®
  ....Sleepy:_xact.q 4 $$1 10You 4Are 10Getting.....9SLEEPY6HORNY9SLEEPY6HORNY9SLEEPY6SLEEPY9HORNY14SLEEPYHORNYSLEEPY6SLEEPY9HORNY6SLEEPY9HORNY6SLEEPY14SLEEPYHORNY9SLEEPY6HORNY9SLEEPY6SLEEPY9HORNY6SLEEPY14HORNYSLEEY
  ....Headache:_xact.q 4you gave me a headache with your bitching0 $$1 4 least you could do is give me a blowjob to make up for it 
  ...FemaletoFemale
  ....bite:_xact.q 4< $+ $me $+ > 12Walks over to 15 < $+ $$1 $+ >12 leans in close as she slides her tongue over her neck 15.Then works her tongue around to her earlobe. Makeing 15 < $+ $$1 $+ >15 shiver with sheer pleasure12 as she licks around her earlobe before biting gentley on her earlobe  
  ....divein:_xact.q 4< $+ $me $+ > 9dives between4 < $+ $$1 $+ >9 legs, and thrusts her tongue inside 4 < $+ $$1 $+ >9 juicy wet cunt.Licks away as she slides her tongue deeper inside 4 < $+ $$1 $+ >9 wet,delicious, hot and very tasty pussy.  
  ....fingers:_xact.q 4< $+ $me $+ > 9slides her fingers into4 < $+ $$1 $+ >9 hot,dripping,wet pussy.bringing 4 < $+ $$1 $+ >9to pure exctasy,As she bites into her thigh,drawing the wonderfull taste of4 blood9 as 4 < $+ $$1 $+ >9 reaches the point of climax with an excited scream  
  ....embrace:_xact.q 0< $+ $me $+ > 9 bites into 4< $+ $$1 $+ >8 neck, allowing for the blood to freely pass over her lips, as she takes the life from 4 < $+ $$1 $+ >. | /timer 1 1 _xact.q * 9 Uses her tongue to quicken the flow of the blood as she takes 4 < $+ $$1 $+ >8 to a whole new world of darkness.9 Licks the wound closed as she senses all the blood has been taken out of her | /timer 1 5 _xact.q * 0 $+ $me $+ >8 takes her dagger and slits a fine cut over it, exposing her blood for all to see9 Places her wrist at 4 < $+ $$1 $+ >8 mouth.watching cloesly as 9 < $+ $$1 $+ >8takes the new life she provides from her gapeing wound  | /timer 1 9 _xact.q * 0 $+ $me $+ >8 takes her wrist from her mouth,then licks her wound closed.0 $+ $me $+ > smiles down at 4 < $+ $$1 $+ >8 and says "welcome to my family, my new daughter
  ....breasts:_xact.q 4< $+ $me $+ > 9runs her tongue over 4 < $+ $$1 $+ >9 breasts, as she teases the nipple with her fingers. As 4 < $+ $$1 $+ >9 moans out loud4 < $+ $me $+ >  9 bites down on her breast, using his fangs0(V^^^V)4 to pierce the skin on 4 < $+ $$1 $+ > 9 breasts, bringing her to a land of total exctasy  
  ....snog:_xact.q 4< $+ $me $+ > 9looks 4 < $+ $$1 $+ >9 deep within her eyes.As she goes down on 4 < $+ $$1 $+ >9 pussy, to deliver a earth shattering, lots of tongue action 9 snog, that makes 4 < $+ $$1 $+ > 9moan4< $+ $me $+ > 4< $+ $me $+ > 4< $+ $me $+ >9 over and over again   
  ....snog of the centuary:_xact.q 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 wrips of her clothes.As she lifts4 < $+ $$1 $+ >9 up, so her legs are straddling her face,4 < $+ $me $+ >  9delivers the now famous , snog of the century between 4 < $+ $$1 $+ > 9legs 
  ....badgirl:_xact.q 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 since she is being a bad fucking girl9 forces 4 < $+ $$1 $+ >8 over her knee, as she pulls her pants down, and begins to WACK4 < $+ $$1 $+ > 8 ass, good and proper with her0 Paddle
  ....Moan:_xact.q 6Slowly Walks to 9"14 $$1 9" 12Grabbing Her From 15Behind 14And 9"4Thrusting9" 6Herself 11Against Her Tight 13(_Ass_) 9Fealing Her Against 14Her Ass She 6Lets Out An Incredible 9M14o6a14nnnnnnnnnnnnnnnn
  ....Spread:_xact.q 11PaRts 13 $$1 11Legs Thrusting Her Wet Tonuge Down tO13 $$1 11Sweet Juicy Pussy And Licking Her CleaN | /timer 1 1 _xact.q * 11Running Her Tongue all over her HotBox13 $me 11bEgins To SLip her tongue deepER AND dEEpER inside and Loves The Taste Of13 $$1 11PuSSy
  ....Throw:_xact.q 14When I See You There10 $$1 14I Wanna Throw You Down And Shove my huge 13vibrator14 Into your Hot13 Pussy14 Or You Could Just Get On Your Kness And 10LICK me intill 14I 11Cum14 Down Your Throat
  ....Sex1:_xact.q 7,6.·´¯)Vvå£k§ Ûþ †ø $$1 †åKíñg ]-[êR håñds äñ §£íÐ¡ñg t]-[e]v[ Ùþ $$1's †¡gh† §]-[¡Rt ƒêê£îñg $$1's Ñ¡þþ£ê§ ßêG¡ññ¡ñg †ø }{ârÐëñ ßè†wëëñ }{êR ƒïñgèRŠ †¡þ§¸Å§ }{è £¡çk§ ]-[êR £¡þ§ $$1 *Š*(¯`·.
  ....Sex:_xact.q 14walks over to9 $$1 14and grabs her around the waist really hard thrusting her body against9  $$1 14s13 tits 14feeling her erect13 nipples 14so hard against her | /timer 1 1 _xact.q * 14begins to run her hands lower over her body teasing her to the point of total submission and she is helpless to refuse her and any of her wishes  
  ....assbite:_xact.q 1__________________________-_____4( 0V13^^^^^^^^^^^^^^^^^0V 4) | _xact.q  1__________________________________  8 $$1 's  0 (_|_) | _xact.q 1 ______________________-________ 4( 13/\15vvvvvvvvvvvvvvv13/\ 4)ds down over9  $$1 s13 tits 14and slides them into her pants to feel how wet9  $$1 s13 pussy 14is for her. | /timer 1 2 _xact.q * 14 then slowly starts to rub9  $$1 14s wet13 pussy 14knowing she loves it by the expression on her beautiful face,9 $$1 14begins to pull9 $me 14s hand harder into her13 pussy 14wanting her to 4fuck 14her13 pussy 14with her fingers so hard and make her 11cum14!
  ....Dildo:_xact.q 14Come Her15e $$1 it's time f14or you to ge15t13 fucked with the dildo W14here do you want i15t $$1 ?  Your pussy o14r your ass?
  ....ass:_xact.q 10Mind if I re14ach aroun15d $$1 and pla10y with yo14ur 13 "TITS" 14while I fuck y15ou in the13 (_ass_) 14with a strapon
  ....Licks-edited:_xact.q 4putš her finger in her mouth and walkš up to 6 $$1 4and šlowly runš her finger down my šhirt and over my nipple. Saying "I'll HeLpš you get out of thoše wet clotheš 6 $$1 4" 13®
  ....2spots-ed:_xact.q 15«14§15»4«12§4»0«6§0»14«15§14»12«4§12»6«0§6» 15HeY 14 $$1 4I'vE 12GoT 0TwO 6Holes 14that 15NeEd 12aTtEnTiOn 4FrOm 6YoU 15«14§15»4«12§4»0«6§0»14«15§14»12«4§  
  ....Question:_xact.q ­­12Bend over­15 $$1 12Then you got to decide, do I smack your ass with my paddle or Just lick you good and proper?­
  ....Hungry:_xact.q  4Im 5f4eeling a  5l4ittle hungry 3 $$1 4I fancy 5h4aving some hot,5t4asty pie,with 5d4elicious melons for  5d4essert 5I'm4 sure you can 5h4elp me here3 $$1  | /timer 1 14 _xact.q * 0you say no 3 $$1 0You actually think you have a choice4 COME HERE BITCH 
  ....ShakeRattleAndRoll:_xact.q 11Lets 13shake 0rattle 4and roll10 $$1 0You shake your hand all over my breasts,ill rattle my fingers in and out of you.7Then ill roll you around and lets just cum all night long10 $$1 
  ....Pros:_xact.q 0 $$1 9 and4 $$me 7 THE PROFESSIONAL SLUTS OF ACN
  ....ThankYou:_xact.q 0Thank you for that sex session last night4 $$1 8 I really enjoyed it that much,I would like another one.0Thow I am a little short of cash, So can I have a freebie4 $$1 
  ....BeatMe:_xact.q 0 You may 12beat me4,frope me15,grope me11,snog me8 $$1 9But goddammit to hell,3You got to let me lick that 9sweet little0 (_ass_) 3 of yours
  ....Fropes:_xact.q 0Fropes12 $$1 0breasts12 $$me 0thinks theres something wrong here8 oh i see what it is12 $$1 8you still have that silly top on,take it of and free4 them breasts for me to suck and lick like a real pro
  ....LivingHell:_xact.q 0licks the living hell out of 4 $$1 0cunt,cause she is sexually deprieved and needs a good seeing to
  ....Gropes:_xact.q 12Fropes 11 $$1 8ass12 and8 breasts,12then8 rams12 her8 strapon12 into11 $$1 8cunt,12 makeing 8her 12scream8 OMG11 $$me 12you 8are 12my 8master 12and 8the 12RULER8 OF12 THE8 WORLDDDDDDDDDDDDD 
  ....Fishy:_xact.q 6hmmm 0 $$1 3 something smells fishy,4 $$me 6sniffs 0 $$1 3pussy, hmm nope smell not coming from there,3shrugs O well may as well give ya a good licking while I'm here
  ....Angellike:_xact.q 10Be good wittle0 angellike7 $$1 10OMG what the fuck am i talking about, lets 69 and lick away like 2 fucking horny sluts 7 $$1 
  ....Tease:_xact.q 7Stop teasing the males10 $$1 7and get your cute self over here and tease my clit instead
  ...MaleToMale
  ....bite:_xact.q 4< $+ $me $+ > 12Walks over to 15 < $+ $$1 $+ >12 leans in close as he slides his tongue over his neck 15.Then works his tongue around to his earlobe. Makeing 15 < $+ $$1 $+ >15 shiver with sheer pleasure12 as he licks around his earlobe before biting gentley on his earlobe  
  ....divein:_xact.q 4< $+ $me $+ > 9dives between4 < $+ $$1 $+ >9 legs, and slides his mouth around his cock.looks up into the eyes of 4 < $+ $$1 $+ >9 Runs his lips up and down the large cock in his hand. Takeing the whole erection in his mouth.4 < $+ $$1 $+ >9 moans with sheer pleasure as 4< $+ $me $+ > 9 sucks faster and faster
  ....hand:_xact.q 4< $+ $me $+ > 9slides his hands around4 < $+ $$1 $+ >9 large,throbbing erection.Watching with a grin as 4 < $+ $$1 $+ >9 moans with the sheer pleasure provided by the quick movements of 4< $+ $me $+ > 9hand. 4 < $+ $$1 $+ >9 reaches the point of climax with an excited scream as 4< $+ $me $+ >  9 licks up all the dripping cum
  ....embrace:_xact.q 0< $+ $me $+ > 9 bites into 4< $+ $$1 $+ >8 neck, allowing for the blood to freely pass over his lips, as she takes the life from 4 < $+ $$1 $+ >. | /timer 1 1 _xact.q * 9 Uses his tongue to quicken the flow of the blood as he takes 4 < $+ $$1 $+ >8 to a whole new world of darkness.9 Licks the wound closed as he senses all the blood has been taken out of him | /timer 1 5 _xact.q * 0 $+ $me $+ >8 takes his dagger and slits a fine cut over it, exposing his blood for all to see9 Places his wrist at 4 < $+ $$1 $+ >8 mouth.watching cloesly as 9 < $+ $$1 $+ >8takes the new life he provides from his gapeing wound  | /timer 1 9 _xact.q * 0 $+ $me $+ >8 takes his wrist from his mouth,then licks his wound closed.0 $+ $me $+ > smiles down at 4 < $+ $$1 $+ >8 and says "welcome to my family, my new son
  ....tease:_xact.q 4< $+ $me $+ > 9runs his tongue over 4 < $+ $$1 $+ >9 chest,flicking at his nipples as he teases him with his tongue 4 < $+ $$1 $+ >9 moans out loud4 < $+ $me $+ >  9as he bites down on his chest with his fangs0(V^^^V)4 Drawing a little blood from 4 < $+ $$1 $+ > 9 chest  
  ....blowjob:_xact.q 4< $+ $me $+ > 9looks 4 < $+ $$1 $+ >9 deep within his eyes.As he goes down on 4 < $+ $$1 $+ >9 cock, to deliver a earth shattering, lots of sucking action 9 blowjob, that makes 4 < $+ $$1 $+ > 9moan4< $+ $me $+ > 4< $+ $me $+ > 4< $+ $me $+ >9 over and over again   
  ....blowjob of the centuary:_xact.q 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 wrips of his clothes.As he lies back with4 < $+ $$1 $+ >9 legs straddling his face,4 < $+ $me $+ >  9 delivers the earth shattering blowjob of the centuary between 4 < $+ $$1 $+ > 9legs 
  ....badboy:_xact.q 4< $+ $me $+ > 9grabs 4 < $+ $$1 $+ >9 since he is being a bad fucking boy9 forces 4 < $+ $$1 $+ >8 over his knee, as he pulls his boxers down, and begins to WACK4 < $+ $$1 $+ > 8 ass, good and proper with his0 Paddle
  ....lix:_xact.q 14rubs his 13cock 14 and LickS his 4LIPS 14 as he looks at 9 $$1 14and wonders if he knows how 10horny 14he 14is for 9HIM 
  ....mouth:_xact.q 12FuCk My MoUt2H WiTh YoUr CoC14k $$1 WhiLe I Wa15Nk Myself Wi11Th My Han0d
  ....relaxxx-ed:_xact.q 14Close Your eyes12 $$1 4- RELAXXX - 14think of the sensation of Your CocK sliding up and down my 10ass13hole 14right before You 12FUCK 14me..suck:_xact.q 14If YoU PusH my Hea15D DowN on YouR CocK $$1 I'l13l SucK iT aNd SucK it a15Nd SucK it aNd The14N I'll SucK it SomE mORe !!!!
  ....breath:_xact.q  14wraps his 4HAND 14around11 $$1 's 4THROBBING 14"Love Muscle" and looks into his 4EYES 14slowlyyyy 4LICKING 14the 4TIP 14with his 4TONGUE 14and then blowing on his 4COCK 14with his 4HOT 14breath.
  ....pvt:_xact.q 14If you're horny9 $$1 14heres my pvt room 3#OhYes 14Here's my cock 13(it's hard) 14Here's some handcuffs 15(oh baby) 14And the rest is up to you9 $$1
  ....pleaseme:_xact.q 0I have 13 7 inch cock 0and a 15tight 13(_ass_)  0You've got a 4TONGUE 0a 13(_)_)lllllD 0and 10 14FINGERS0.....Put it all together.... Then cum 3#PLEASE_ME0 $$1
  ....cum:_xact.q 12 $$1 Yo15u can put a sm14ile on my face, o11r you can p12ut your c14um all ov15er it 11!
  ....scrabble:_xact.q 12Pushes the button on the wall.... a spotlight shines on 8\\\0 $$1 8///12...music begins to play. | /timer 1 2 _xact.q * 12he walks over to the dresser glancing at 0 $$1 12he asks Him if He wants to play a game. | /timer 1 4 _xact.q * 12 $me opens the drawer and takes out some 4HANDCUFFS 12and some 7VASELINE12, some 9BATTERY OPERATED TOYS12, an 13FEATHER12, and 10 3 BOTTLES OF MASSAGE OILS12, also a 3WHIP12, 8 2 BOTTLES OF TEQUILA12, some 15SHOT GLASSES | /timer 1 7 _xact.q * 12 Lastly $me removes 13 ThE gAmE oF sCrAbBLe12.  Carrying all of this, he walks over to 0 $$1 12 and whispers.... "If You are feeling really naughty for me, i'll set up the scrabble board"
  ....cum2me:_xact.q 13,6 $$1 YoU sExY BaStArD....cUm To Me Ya Bastard
  ....bj:_xact.q 12GiVeS13 $$1 0a11LoNg12AnD14LiNgErInG15cOcK13hArDeNiNg6HeArT4bEaTiNg3PaLm9SwEaTiNg11NiPpLe12HaRdEnInG14hAiR15rAiSiNg13PuPiL4dIaLaTiNg6HeAd3TuRnInG9bLoW11jOb
  ....Job-ed:_xact.q 2{{{{{12{{{{{11{{{{{0{{{{{ 8ÀrÉ 12You 11AcHing 4 $$1 0?¿? 9CÀusÉ 12YoU 11rÉÀlly 0nÉÉd 6À 12ßLÓwJÒß11, 0but 7YoU'll 12tÀkÉ 11À 0hard 13FuCk 12Ïf 11onÉ's 0ÀvÀiLÀbLÉ, RiGhT? 0}}}}}11}}}}}12}}}}}2}}}}}13® 
  ....Blow-ed:_xact.q 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 4Let's 0PLAY 4army! 0You 4lay down 0 $$1 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­4, and I'll 0ß£ØW 4the hell out of YoU! 15®­3®­15®3­®­15®­3®­15®­3®­15®­3®­15®­3®­ 13®      
  ....urBone:_xact.q 3»»æ0:3{13®3}0:3æ«« 13YoU'll 4£11ove 13Every 11Bone 13In 11my 13Body 11 $$1 13Especially4 Y11ours
  ....Buffett-edited:_xact.q 4¿0?4¿0?4¿0?4¿0?4¿0?4¿0?4Cøûld 0I 4Bë 0Yøûr 4L0ø4v0ë 4B0û4f0f4ë0t 0 $$1 4Sø 0Yøû 4Cøûld 0Låy 4Me 0On 4Thë 0Tåblë 4And 0Eåt 4Whåt 0Yøû 4Wåntëd 0?4¿0?4¿0?4¿0?4¿0?4¿0?4¿13®
  ....Boxing:_xact.q 3Wanna 11Play 3Midget 11Boxing 3 $$1 ? 11I'll 3Get 11Down 3On 11my 3Knees 11And 3Give 11You 3A 11Couple 3Of 11Blows!13® 
  ....throbbingcock:_xact.q 14¤¤¤¤ $$1 ¤¤¤¤ 15Guess What! 0I've got an hard, and throbbing cock! 14And i can feel YoUr Breathe close to it now! 13® 
  ....suck:_xact.q 0Doesn'T cARe AbouT 13woman 0OR 3Brad Pitt 0hE oNLy WantS to SucK 12 $$1 's 0cOCk
  ....ABC-ed:_xact.q 6I'll Lie on my stomach4 $$1 6and stick my13 ASS in the AIR 6for YoU so YoU can spell out the 12A9L13P4H10A0B14E2T 6on my 13AssHole 6with YoUr 4TONGUE
  ....SticksStones:_xact.q 12¤¤¤¤4§ticks 13Änd 12§tones 4Will 13ßreak 12Mý 4ßone§ 13ßut 12HandCuff§ 4Ãnd 13Feather§ 12Excite 13Mé 4¤¤¤¤ $$1 ¤¤¤¤ 13§ex 12i§ 4The 13Thing; 12I 4Like 4Tó 13Dó 12It 4Ñìghtlý 13¤¤¤¤®
  ....Slip:_xact.q 0HeY13"·*:·*"·*:·*"·*:·*" $$1 "·*:·*"·*:·*"·*:·*0HoW13"·*:·*"0AbOuT13"·*:·*"0You13"·*:·*"0§LiP13"·*:·*"0InTo13"·*:·*"  0SoMeThInG13"·*:·*"0MoRe13"·*:·*"0cOmFoRtAbLe13"·*:·*"0LiKe13"·*:·*"0My13"·*:·*"®0ASS13"·*:·*"®
  ....Sleepy:_xact.q 4 $$1 10You 4Are 10Getting.....9SLEEPY6HORNY9SLEEPY6HORNY9SLEEPY6SLEEPY9HORNY14SLEEPYHORNYSLEEPY6SLEEPY9HORNY6SLEEPY9HORNY6SLEEPY14SLEEPYHORNY9SLEEPY6HORNY9SLEEPY6SLEEPY9HORNY6SLEEPY14HORNYSLEEY
  ....Moaning:_xact.q 5Your moaning like a right BITCH 4 $$1 5shut up and bend over will ya
  Protections
  .Secure Query
  ..Setup:secure.query
  ..-
  ..$iif(%sq.was = on,$style(1)) Enable:gtzsecque.en
  ..$iif(%sq.was = off,$style(1)) Disable:gtzsecque.dis
  ..-
  ..Add Access:.auser -a securequery $address($1,3) | msg $1 (Secure Query) You have free access to message me | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Added $+ $cxs(1) $address($1,3)  $+ $cxs(2) $+ to Secure Query | if ($dialog(querycon) != $null) { did -r querycon 45 | s.levels }
  .Safe Decode
  ..$iif(%sdecod = on,$style(1)) Enable:sdecon
  ..$iif(%sdecod = off,$style(1)) Disable:sdecoff
  .Antispam Bot
  ..Connect:{
    if ($asini(personalize,nickname) == $null) { antispam.reset }
    unset %antispam.*
    asconnect
  }
  ..$ascheck(connected,Disconnect):{
    if ($sock(antispam).name == $null) {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Antispam Bot is  $+ $cxs(1) Not Connected
      return
    }
    asquit 
  }
  ..-
  ..Config:as.settings
  .-
  .Status Prot:gtz.cpro
  .Personal Flood Prot:pp
  .Channel Prot:akick
  .Script Pass Prot:gtzpp
  .Trojan Scanner:tscan
  .-
  .IRClean:run utilities/irclean.exe
  Misc
  .About:authorx
  .Highlight:wingtz
  .Email Author:.run mailto: InvincibleScript@yahoo.com
  .-
  .Tools Bar
  ..Open Dialog $chr(160) sF11:barz
  ..-
  ..$iif(%toolz.bc = on,$style(1)) Run On Connect:toolzbc
  ..$iif(%toolz.bs = on,$style(1)) Run On Startup:toolzbs
  ..$iif(%toolz.bn = on,$style(1)) Don't Run:toolzbn
  .Script Stats
  ..Send To Active:invstat.q
  ..-
  ..Connect $chr(160) %st.conx:halt
  ..Disconnect $chr(160) %st.dconx:halt
  ..-
  ..Join $chr(160) %st.joinx:halt
  ..Part $chr(160) %st.partx:halt
  ..-
  ..Opped $chr(160) %st.iop:halt
  ..Deopped $chr(160) %st.opi:halt
  ..-
  ..Voiced $chr(160) %st.ivo:halt
  ..Devoiced $chr(160) %st.voi:halt
  ..-
  ..Kick $chr(160) %st.ikick:halt
  ..Kicked $chr(160) %st.kicki:halt
  ..-
  ..Ban $chr(160) %st.iban:halt
  ..Banned $chr(160) %st.bani:halt
  ..-
  ..Reset:.if ($?!"Are you sure you want to reset %name2 script stats ?") st.reset
  .-
  .Tips && Tricks:tips
  .Shortcut Keys $chr(160) F1:F1
  .Help Center $chr(160) sF8:gtzhelp
  .Control Panel:cp
  .Connector $chr(160) cF1:connect2
  .Log Viewer:logviews
  .Run Programs $chr(160) sF6:rprog
  .Folder Browser:run $$sdir="Select Directory to View"
  .Search System $chr(160) sF12:dfsearchf
  .-
  .%name2:advgtz
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
