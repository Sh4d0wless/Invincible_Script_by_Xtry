;___________________________________________
; Invincible by Xtry
; Menubar Popups
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

menu menubar {
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
  ..$iif(!$server,$style(2)) Rejoin Channels $chr(160) sF9:ajoin
  ..-
  ..Setup Dialog:aj
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
  ..Clear Logs:write -c utilities/found.txt
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
  ...$iif(!$server,$style(2)) Stop:{ .timerchanAd off 
    .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Auto timed message has been halted
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
  .Personal Games:gamez
  .Pic Player:picplay
  .Trivia Settings:triv.dlg
  .Lyrics Finder:lyrics
  .Sketch:sketch
  .-
  .Big Fonts
  ..Editor:bigfont
  ..-
  ..Play:bigfont $$?="Text :"
  .Colors Talker
  ..$iif(%coltalk.x = on,$style(1)) Enable:gtzcolon
  ..$iif(%coltalk.x = off,$style(1)) Disable:gtzcoloff
  .Funny Pets
  ..Pikachu:run utilities/games/pikachu.exe
  ..Sheep:run utilities/games/sheep.exe
  ..Orange:run utilities/games/naranja.exe
  Protections
  .Secure Query
  ..Setup:secure.query
  ..-
  ..$iif(%sq.was = on,$style(1)) Enable:gtzsecque.en
  ..$iif(%sq.was = off,$style(1)) Disable:gtzsecque.dis
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
  -
  $iif($server,IRCop)
  .Oper
  ..Oper Up $chr(160) cF2:cf2
  ..Super User:operserv su $$?*="SU Password :"
  ..-
  ..Auto Oper:aoperz
  .-
  .$iif(+o isin $usermode,Kills)
  ..Kill:kill $$?="Nickname or Hostname :" $$?="Reason :"
  ..KillClones:operserv killclones $$?="Nickname :"
  ..-
  ..AKill:operserv kill add $$?="Address :" $$?="Reason :"
  ..RAKill:operserv akill del $$?="Address :"
  .$iif(+o isin $usermode,Bans)
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
  .-
  .$iif(+o isin $usermode,CSop)
  ..Drop Channel:chanserv drop $$?="Channel :"
  ..Drop NickName:nickserv drop $$?="Nickname :"
  ..-
  ..Forbid Channel:chanserv forbid $$?="Channel :"
  ..Forbid Nickname:nickserv forbid $$?="Nickname :"
  ..-
  ..Update Services:operserv Update
  ..ShutDown Services:operserv shutdown
  ..Quit Services:operserv quit
  ..-
  ..Channel GetPass:chanserv getpass $$?="Channel :"
  ..NickName GetPass:nickserv getpass $$?="Nickname :"
  ..-
  ..Stats:operserv stats
  .-
  .$iif(+o isin $usermode,Host && User)
  ..SetHost:sethost $$?="New Hostname :"
  ..SetIdent:setident $$?="New Ident :"
  ..SetName:setname $$?="New Name :"
  ..-
  ..User ChgHost:chghost $$?="Nickname :" $$?="New Hostname :"
  ..User ChgIdent:chgident $$?="Nickname :" $$?="New Ident :"
  ..User ChgName:chgname $$?="Nickname :" $$?=New RealName/FullName :"
  ..-
  ..SAMode:samode $$?="Channel :" $$?="Mode :"
  ..SAJoin:sajoin $$?="Nickname :" $$?="Channel :"
  ..SAPart:sapart $$?="Nickname :" $$?="Channel :" 
  .$iif(+o isin $usermode,Messages)
  ..Wallops:wallops $$?="Wallops Message :"
  ..Globops:globops $$?="Globops Message :"
  ..Chatops:chatops $$?="Chatops Message :"
  ..Locops:locops $$?="Locops Message :"
  ..-
  ..Adchat:adchat $$?="Adchat Message :"
  ..Nachat:nachat $$?="Nachat Message :"
  ..Techat:techat $$?="Techat Message :"
  ..-
  ..OperMotd:opermotd
  ..AddMotd:addmotd $$?="Text to add to Motd :"
  ..AddOMotd:addomotd $$?="Text to add to OperMotd :"
  .$iif(+o isin $usermode,Server)
  ..Connect Current Server:connect $$?="Server to Connect :" $$?="Port :"
  ..Connect Other Server:connect $$?="Server :" $$?="Port :" $$?="Server to Connect :"
  ..-
  ..Rehash:rehash $$?="Server :" - $+ $$?="Flags :"
  ..Restart:restart $$?="Server :" $$?*="Password :"
  ..Die:die $$?*="Password :"
  ..Lag:lag $$?="Server :"
  ..SQuit:squit $$?="Server :"
  ..RPing:rping $$?="Server Mask:"
  ..Trace:trace $$?="Server :"
  ..SDesc:sdesc $$?="Description :"
  .-
  .$iif(+o isin $usermode,Misc)
  ..Rules:rules
  ..Map:map
  ..DALInfo:dalinfo
  ..Credits:credits
  ..License:license
  ..MkPasswd:mkpasswd $$?="Method :" $$?*="Password :"
  ..-
  ..TSCtl
  ...OffSet:tsctl offset $$?="+ or - ?" $$?="Time :"
  ...Time:tsctl time
  ...AllTime:tsctl alltime
  ...SvsTime:tsctl svstime $$?="Timestamp :"
  ..DCC
  ...DCCDeny:dccdeny $$?="Filename Mask :" $$?="Reason"
  ...UnDCCDeny:undccdeny $$?="Filename Mask :"
  -
  Window
  .On Tray:showmirc -t
  .-
  .Cascade:mdi -c
  .Tile:mdi -t
  .Arrange Icons:mdi -a
  .-
  .Inflate
  ..Current Window:_inflate $active
  ..All Windows:scid -a inflate -a
  ..-
  ..Channels:inflate -c
  ..Queries:inflate -q
  ..DCC Chats:inflate -d
  ..Status Windows:inflate -s
  ..Custom Windows:inflate -@
  .Clear
  ..Current Window $chr(160) F11:clear
  ..Status Window:clear -s
  ..-
  ..Clear All Status:clearall -s
  ..Clear All Channel:clearall -n
  ..Clear All Query:clearall -q
  ..-
  ..All Windows:clearall
  .$iif(!$server,$style(2)) Close
  ..Query:close -m
  ..-
  ..Fserv:close -f
  ..DCC Sends:close -s
  ..DCC Gets:close -g
  ..DCC Chats:close -c
  ..Inactive DCC:close -i
  ..-
  ..All Windows:close -isgmf
  $iif(!$server,$style(2)) Quits
  .$iif(%qiutedi = on,$style(1)) Quits Editor:qdialquit
  .Quit /w Msg Editor:/quit $read(utilities/quits.txt) %name
  .-
  .Quit:/quit %name
  .Quit && Exit $chr(160) sF1:{
    .timer 1 3 exit
    quit %name
  }
  $iif(!$server,$style(2)) Server Info
  .Current
  ..Lusers:/lusers
  ..Motd:/motd
  ..Motd Services:motd services.*
  ..Time:/time
  ..Version:/version
  ..Admin:/admin
  ..Uptime:/stats u
  ..Hubs && Leaves:/stats H
  ..Ports:/stats l
  ..Map:map $server
  ..-
  ..T Lines:stats t
  ..G Lines:stats g
  ..I Lines:stats i
  ..K Lines:stats k
  ..O Lines:stats o
  ..Q Lines:stats q
  ..E Lines:stats e
  ..Y Lines:stats y
  ..Z Lines:stats z
  .Others
  ..Lusers:/lusers $$?="Server :"
  ..Motd:/motd $$?="Server :"
  ..Time:/time $$?="Server :"
  ..Version:/version $$?="Server :"
  ..Admin:/admin $$?="Server :"
  Search
  .$iif(!$server,$style(2)) Links:/links
  .$iif(!$server,$style(2)) Names:/names $$?="Channel :"
  .$iif(!$server,$style(2)) Topic:/topic $$?="Channel :"
  .-
  .$iif(!$server,$style(2)) Who
  ..Who:/who $$?="Host Address  :"
  ..Whois:/whois $$?="Nickname :"
  ..Whowas:/whowas $$?="Nickname :"
  ..-
  ..DNS:dns $$?="Nickname or Address to DNS :"
  .$iif(!$server,$style(2)) Lists
  ..Channel
  ...Full List:/list
  ...MinMax List:/list -min $$?="Minimum Number :" +max $$?="Maximum Number :"
  ...Specified List:/list $$?="Channel :"
  ...Word List:/list $$?=*"Contains Word :"*
  ..IRCop
  ...Current Server:stats o $server
  ...Network:who 0 o
  ...CSop:motd services.*
  ..-
  ..Ignores:show.ignoreList.dialog
  ..Notify:check.notify
  ..Bans:/mode $$?="Channel :" b
  .Recent
  ..$iif(!$server,$style(2)) Channels
  ...%recentch1:join %recentch1
  ...%recentch2:join %recentch2
  ...%recentch3:join %recentch3
  ..$iif(!$server,$style(2)) Nicks
  ...%recnick1:nick %recnick1
  ...%recnick2:nick %recnick2
  ...%recnick3:nick %recnick3
  ..Servers
  ...%recserv1 $chr(160) cF3:server %recserv1
  ...%recserv2:server %recserv2
  ...%recserv3:server %recserv3
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
