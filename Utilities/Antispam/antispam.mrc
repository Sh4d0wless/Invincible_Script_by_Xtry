;___________________________________________
; Invincible by Xtry
; Antispam
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:LOAD:{ 
  if ($version < 6) {
    .echo -q $input(Sorry, you need version 6 or above of mIRC to use this script.,260,AntiSpamBot)
    unload -rs antispam.mrc
    return
  }
  antispam.reset 
  .echo -q $input(AntiSpamBot has been successully loaded. Visit #antispambot-help on DALnet to obtain help on the script.,68,AntiSpamBot)
}

on *:START:{
  unset %antispam.*
  asini whois_section whois
  if (on isin $result) {
    set %whois.send = on
  } 
  else { set %whois.send = off }
  if ($asini(personalize,password) == $null) {
    writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize identify no
  } 
}

on *:INPUT:@antispambot:{
  if ($left($1,1) != /) {
    if ($sock(antispam).status == active) {
      sockwrite -n antispam $1-
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Server $cxs(3) $+ : $+ $cxs(1) $1-
    }
  }
}

alias ascheck {
  if ($1 == connected) { 
    if ($sock(antispam) != $null) { return $2 }
  }
}

alias asnick {
  ; Returns the CURRENT name of the bot
  if ($sock(antispam) == $null) { return $asini(personalize,nickname) }
  return %antispam.mynick
}

alias asquit {
  asclearrecent
  .timerasexpire off
  .timerascycle off
  .timerasreconnect off
  if ($sock(antispam.identd) != $null) { sockclose antispam.identd }
  if ($sock(antispam.identdin) != $null) { sockclose antispam.identdin }

  if ($hget(as.queue) != $null) { hfree as.queue }

  if ($sock(antispam) == $null) || ($sock(antispam).status != active) { return }

  sockwrite -n antispam JOIN 0
  sockwrite -n antispam QUIT :AntiSpam Bot by toucan $+ $cr

  asecho $colour(info) *** Disconnected
  sockclose antispam
  unset %antispam.*
}

alias asconnect {
  if ($1 == $null) {
    if ($dialog(asdia.connect) != $null) { return }
    dialog -m asdia.connect asdia.connect
    return
  }

  unset %antispam.*
  asquit
  if ($2 == $null) { set %antispam.host $1 6667 }
  else { set %antispam.host $1 $2 }
  if ($asini(bnc,enabled) == yes) { 
    set %antispam.host $asini(bnc,host) $asini(bnc,port) 
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Antispam Bot is trying to connect through BNC
  }
  else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Connecting.. }

  if ($window(@antispambot) == $null) { window -aek0 @antispambot 30 50 600 360 }
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general server $$1

  if ($sock(antispam) != $null) { sockclose antispam }

  sockopen antispam %antispam.host

  ; identd - currently this cannot be disabled
  if (($portfree(113) == $true) && ($asini(bnc,enabled) == no)) {
    socklisten antispam.identd 113
    set %antispam.identd $true
  }
  unset %antispam.connected %antispam.host
}

alias asini {
  var %antispam.file " $+ $scriptdir $+ antispam.ini $+ "
  if ($version >= 5.9) { return $readini(%antispam.file,n,$1,$2) }
  else { return $readini -n %antispam.file $1, $2 }
}

alias askillmsg {
  if ($read(" $+ $scriptdir $+ killmsg.txt $+ ", wn, $1 $+ :*, 1) == $null) { return %kickcode You are compromising network policy }
  return $gettok($read(" $+ $scriptdir $+ killmsg.txt $+ ", wn, $1 $+ :*, 1),2,58)
}

alias askickmsg {
  if ($read(" $+ $scriptdir $+ kickmsg.txt $+ ", wn, $1 $+ :*, 1) == $null) { return %kickcode You are compromising channel policy }
  return $gettok($read(" $+ $scriptdir $+ kickmsg.txt $+ ", wn, $1 $+ :*, 1),2-,58)
}

menu @antispambot {
  $ascheck(connected,Cycle all channels):{ ascycleall }
  $ascheck(connected,Whois):whois $asnick
  $ascheck(connected,Send message):asmsg $$?="Enter nick to message:" $$?="Enter message:"
  $ascheck(connected,Send notice):asnotice $$?="Enter nick to notice:" $$?="Enter notice:"
  -
  Connect:{
    if ($asini(personalize,nickname) == $null) {
      antispam.reset
    }
    asconnect
  }
  $ascheck(connected,Disconnect):{
    if ($sock(antispam).name == $null) {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Antispam Bot is  $+ $cxs(1) Not Connected
      return
    }
    asquit 
  }
  -
  Settings:{
    as.settings
  }
}

; Alias for joining buffered joins
alias asrejoin {
  if (%antispam.rejoin != $null) {
    sockwrite -n antispam JOIN %antispam.rejoin
    unset %antispam.rejoin
  }
  if (%antispam.repart != $null) {
    sockwrite -n antispam PART %antispam.repart
    unset %antispam.repart
  }
}
; Adds a join to buffer
alias asaddjoin {
  if ($istok(%antispam.current,$1,32) == $false) { 
    set %antispam.rejoin $addtok(%antispam.rejoin,$1,44)
    .timerasrejoin 1 1 asrejoin
  }
}
alias asaddpart {
  if ($istok(%antispam.current,$1,32) == $true) { 
    set %antispam.repart $addtok(%antispam.repart,$1,44)
    .timerasrejoin 1 1 asrejoin
  }
}

; Joins all the listed channels
alias asjoinchans {
  set %antispam.aschans 0
  while (%antispam.aschans < $aschannels(0)) {
    inc %antispam.aschans
    if (j isin $aschanconfig($aschannels(%antispam.aschans),flags)) {
      asaddjoin $aschannels(%antispam.aschans)
    }
  }
  unset %antispam.aschans
}


alias asadvert {
  var %spamcycle 0
  var %spamtext $strip($1-,burc)
  while (%spamcycle < $gettok($1-,0,32)) {
    inc %spamcycle 1
    if (/server isin $gettok(%spamtext,%spamcycle,32)) { return ma/net }
    if (http: isin $gettok(%spamtext,%spamcycle,32)) { return ma/web }
    if (www. isin $gettok(%spamtext,%spamcycle,32)) { return ma/web }
    ; basic domain names - To many to add them all!
    if (.com isin $gettok(%spamtext,%spamcycle,32)) { return ma/web }
    if (.net isin $gettok(%spamtext,%spamcycle,32)) { return ma/web }
    if (.org isin $gettok(%spamtext,%spamcycle,32)) { return ma/web }

    ; added 3/1/02 by Steppin`
    if ($chr(36) $+ decode isin $gettok(%spamtext,%spamcycle,32)) { return exp/vrs }
    if (/echo isin $gettok(%spamtext,%spamcycle,32)) { return exp/vrs }
    if (/write isin $gettok(%spamtext,%spamcycle,32)) { return exp/vrs }

    if ($chr(35) isin $gettok(%spamtext,%spamcycle,32)) { 
      ; don't kick if i am an op on the channel name
      if ($me !isop $gettok(%spamtext,%spamcycle,32)) {
        return ma/inv
      }
    }
  }
  unset %spamcycle
  return $false
}
alias aschans {
  return $gettok($asini(channels,channels),$1,32)
}
alias asgoodchan {
  if ($findtok($asini(channels,channels),$1,0,32) >= 1) {
    return $true
  }
  else {
    return $false
  } 
}

on *:sockclose:antispam:{
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Antispam Bot was $+ $cxs(1) Disconnected
  unset %antispam.*
  if ($hget(as.queue) != $null) { hfree as.queue }
  if ($asini(general,reconnect) == yes) {
    .timerasreconnect -o 0 3 asconnect $asini(general,server)
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Antispam Bot reconnecting to $+ $cxs(1) $asini(general,server)  $+ $cxs(2) $+ in 3 seconds (close window to stop)
    sockclose antispam
  }
  .timerascycle off
}

on *:CLOSE:@antispambot:{
  if ($sock(antispam).name != $null) {
    asquit
  }
  if ($sock(antispam.identd) != $null) { sockclose antispam.identd }
  if ($sock(antispam.identdin) != $null) { sockclose antispam.identdin }

}

; Alias for converting ? signs in nicknames to random letters and # signs to 
; random numbers. This idea was suggested by Milky.
alias asnickname {
  set %antispam.cycle 0
  unset %antispam.nick
  while (%antispam.cycle < $len($1)) {
    inc %antispam.cycle
    if ($mid($1,%antispam.cycle,1) == $chr(35)) { set %antispam.nick %antispam.nick $+ $rand(0,9) }
    else { 
      if ($mid($1,%antispam.cycle,1) == ?) { set %antispam.nick %antispam.nick $+ $rand(a,z) }
      else {
        set %antispam.nick %antispam.nick $+ $mid($1,%antispam.cycle,1) 
      }
    }
  }
  var %antispam.nick2 %antispam.nick
  unset %antispam.nick %antispam.cycle
  return %antispam.nick2
}

on *:sockopen:antispam:{
  if ($window(@antispambot) == $null) {
    sockclose antispam
    .timerascycle off
    .timerasreconnect off
  }
  if ($sockerr != 0) {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $sock($sockname).wsmsg 
    return
  }

  if ($asini(bnc,enabled) == yes) { sockwrite -n antispam PASS $asini(bnc,pass) }
  sockwrite antispam NICK $asnickname($asini(personalize,nickname)) $+ $crlf $+ USER $asnickname($asini(personalize,ident)) "" "" : $+ $asini(personalize,fullname) $+ $crlf
  if ($asini(bnc,enabled) == yes) { 
    if ($asini(bnc,vhost) != $null) {
      sockwrite -n antispam VIP $asini(bnc,vhost)
      sockwrite -n antispam VHOST $asini(bnc,vhost)
    }
    sockwrite -n antispam CONN $asini(general,server) 6667 
  }

  .timerasreconnect off
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Antispam Bot is $+ $cxs(1) Logging in
  .timerascycle -o 0 $asini(general,cycletime) ascycleall
}

on *:sockread:antispam:{
  if ($sockerr > 0) return
  :nextread
  sockread %temp
  if ($sockbr == 0) return
  if (%temp == $null) %temp = -
  ; asecho 1 %temp
  unset %kickcode


  ; End of MOTD
  if ($gettok(%temp,2,32) == 376) || ($gettok(%temp,2,32) == 422) {
    asecho $colour(info) *** AntiSpam Bot has logged into the server
    if ($sock(antispam.ident) != $null) { sockclose antispam.ident }
    if ($sock(antispam.identin) != $null) { sockclose antispam.identin }

    set %antispam.connected $true
    set %antispam.mynick $gettok(%temp,3,32)
    asjoinchans
    if ($aschannels(0) != 1) {
      sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ NOTICE #AntiSpamBot :Loaded AntiSpam Bot 3.3 (owned by  $+ $me $+  and monitoring  $+ $aschannels(0) $+  channels)
    }
    else {
      sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ NOTICE #AntiSpamBot :Loaded AntiSpam Bot 3.3 (owned by  $+ $me $+  and monitoring  $+ $aschannels(0) $+  channel)
    }
    if ($asini(personalize,identify) == yes) { 
      sockwrite -n antispam NICKSERV IDENTIFY $asini(personalize,password)
    }
    if ($asini(general,visible) == yes) { sockwrite -n antispam MODE $asnick -i }
  }

  ; Nickname is already in use
  if ($gettok(%temp,2,32) == 433) {
    if ($gettok(%temp,5-,32) !=  :Nickname is registered to someone else.) {
      asecho $colour(normal) The nick $gettok(%temp,4,32) is already in use.
      ; If the nickname has ? or # signs they should be able to get past
      ; if ($asnickname($asini(personalize,nickname)) != $gettok(%temp,4,32)) {
      if (%antispam.connected != $true) {
        as.queue NICK $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z)
      }
      ; }
    }
  }

  ; Closing link 
  if ($gettok(%temp,1-3,32) == ERROR :Closing Link:) {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Closing Link $cxs(3) $+ : $+ $cxs(1) $gettok(%temp,4-,32)
  }

  ; Ping event
  if ($gettok(%temp,1,32) == PING) {
    sockwrite -n antispam PONG $gettok(%temp,2-,32)
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) PING? PONG!
  }

  ; Raw stuff
  ; user logged out (my nick so get it back)
  if ($gettok(%temp,2,32) == 601) {
    if ($asini(personalize,hold) == yes) {
      if ($gettok(%temp,4,32) == $asini(personalize,nickname)) {
        if ($asini(personalize,nickname) === $asnick) { }
        else {
          echo -a $cxs(3) $+  $+ %xsbrack $+ $cxs(1) $asini(personalize,nickname)  $+ $cxs(2) $+ has logged off, trying to retake nick.
          sockwrite -n $sockname NICK $asini(personalize,nickname)
        }
      }
    }
    return
  }

  ; banned
  if ($gettok(%temp,2,32) == 474) {
    asecho $colour(normal) $gettok(%temp,4,32) can't join channel (address is banned)
    window -g1 @antispambot
    return
  }

  ; Full
  if ($gettok(%temp,2,32) == 471) {
    if ($asgoodchan($gettok(%temp,4,32)) == $true) { 
      asecho $colour(normal) $gettok(%temp,4,32) can't join channel (channel is full)
    }
  }

  ; Invite only
  if ($gettok(%temp,2,32) == 473) {
    if ($asgoodchan($gettok(%temp,4,32)) == $true) { 
      asecho $colour(normal) $gettok(%temp,4,32) can't join channel (invite only)
    }
  }

  ; key set
  if ($gettok(%temp,2,32) == 475) {
    if ($asgoodchan($gettok(%temp,4,32)) == $true) { 
      asecho $colour(normal) $gettok(%temp,4,32) can't join channel (need correct key)
    }
  }

  ; Need registered nick to join
  if ($gettok(%temp,2,32) == 477) {
    if ($asgoodchan($gettok(%temp,4,32)) == $true) { 
      asecho $colour(normal) $gettok(%temp,4,32) can't join channel (not using registered nick)
    }
  }

  ; KICK
  if ($gettok(%temp,2,32) == KICK) && ($gettok(%temp,4,32) == $asnick) {  
    set %antispam.current $remtok(%antispam.current,$gettok(%temp,3,32),1,32)
    if ($asgoodchan($gettok(%temp,3,32)) == $true) { 
      if (j isin $aschanconfig($gettok(%temp,3,32),flags)) { asaddjoin $gettok(%temp,3,32)  }
      asecho $colour(kick) *** $mid($gettok(%temp,1,33),2,100) kicked me from $gettok(%temp,3,32) ( $+ $mid($gettok(%temp,5-,32),2,1000) $+ )
    }
  }

  ; PART
  if ($gettok(%temp,2,32) == PART) {
    if ($mid($gettok(%temp,1,33),2,100) == $asnick) {
      ; Remove channel from current channel lists
      set %antispam.current $remtok(%antispam.current,$gettok(%temp,3,32),1,32)

      if (%antispam.part. [ $+ [ $gettok(%temp,3,32) ] ] == $true) {
        unset %antispam.part. [ $+ [ $gettok(%temp,3,32) ] ]
        return
      }

      if ($asgoodchan($gettok(%temp,3,32)) == $true) {
        if (j isin $aschanconfig($gettok(%temp,3,32),flags)) {
          asecho $colour(part) *** Parted $gettok(%temp,3,32) (cycle)
          asaddjoin $gettok(%temp,3,32)
        }
        else {
          asecho $colour(part) *** Parted $gettok(%temp,3,32)
        }
      }
      else {
        asecho $colour(part) *** Parted $gettok(%temp,3,32)
      }

    }
  }

  ; JOIN
  if ($gettok(%temp,2,32) == JOIN) {
    if ($mid($gettok(%temp,1,33),2,100) == $asnick) {

      set %antispam.current $addtok(%antispam.current,$mid($gettok(%temp,3,32),2,200),32)

      if ($asgoodchan($mid($gettok(%temp,3,32),2,200)) == $false) {
        asaddpart $mid($gettok(%temp,3,32),2,200)
        asecho $colour(join) *** Joined $mid($gettok(%temp,3,32),2,200) (But didn't want to)
        return
      }

      asaddconfig $mid($gettok(%temp,3,32),2,200)

      if (j !isin $aschanconfig($mid($gettok(%temp,3,32),2,200),flags)) {
        asaddpart $gettok(%temp,3,32)
        asecho $colour(join) *** Joined $mid($gettok(%temp,3,32),2,200) (cycle)
        return
      }

      asecho $colour(join) *** Joined $mid($gettok(%temp,3,32),2,200)
    }
  }

  if ($gettok(%temp,2,32) == NICK) {
    ; has my nick been changed?
    if ($mid($gettok(%temp,1,33),2,100) == $asnick) {
      asecho $colour(nick) *** I am now known as $mid($gettok(%temp,3,32),2,100)
      sockwrite -n $sockname $asini(personalize,nickname)
      set %antispam.mynick $mid($gettok(%temp,3,32),2,100)
    }
  }

  ; Advertisment detectors
  if ($gettok(%temp,2,32) == INVITE) {

    if ($asignore($mid($gettok(%temp,1,32),2,100)) == $true) { return }

    set %kickcode [ma/inv]
    ; Relaying
    if ($asexclude($mid($gettok(%temp,1,32),2,100)) == $false) { 
      if ($asini(general,relay) == yes) {
        if (%kickcode != $null) {
          as.queue PRIVMSG $asini(general,relaychan) : $+ %kickcode $mid($gettok(%temp,1,33),2,100) ( $+ $gettok($gettok(%temp,2,33),1,32) $+ ) invited me into $mid($gettok(%temp,4,32),2,100)
        }
        else {
          as.queue PRIVMSG $asini(general,relaychan) : $+ $mid($gettok(%temp,1,33),2,100) ( $+ $gettok($gettok(%temp,2,33),1,32) $+ ) invited me into $mid($gettok(%temp,4,32),2,100)
        }
      }
    }

    asecho $colour(invite) *** %kickcode $mid($gettok(%temp,1,33),2,100) ( $+ $gettok($gettok(%temp,2,33),1,32) $+ ) invited me into $mid($gettok(%temp,4,32),2,100)

    if ($asgoodchan($mid($gettok(%temp,4,32),2,100)) == $true) { 
      asaddjoin $mid($gettok(%temp,4,32),2,100) 
      return
    }

    askick $mid($gettok(%temp,1,32),2,100) [ma/inv]
    window -g1 @antispambot
  }

  if ($gettok(%temp,2,32) == NOTICE) {

    if ($asignore($mid($gettok(%temp,1,32),2,100)) == $true) { return }

    ; Notices to channel are ignored
    if (($Chr(35) !isin $gettok(%temp,3,32)) && ($Chr(36) !isin $gettok(%temp,3,32))) {
      ; Ignore server notices
      if (. !isin $gettok(%temp,1,33)) {
        if ($asadvert($mid($gettok(%temp,4-,32),2,600)) == ma/web) {
          set -u1 %kickcode [ma/web]
        }

        if (($mid($gettok(%temp,4-5,32),2,600) != DCC SEND) && ($mid($gettok(%temp,4-5,32),2,600) != DCC CHAT)) {
          set -u1 %kickcode [autogreet]
        }

        if ($asadvert($mid($gettok(%temp,4-,32),2,600)) == ma/inv) {
          set -u1 %kickcode [ma/inv]
        }

        if ($asadvert($mid($gettok(%temp,4-,32),2,600)) == ma/net) {
          set -u1 %kickcode [ma/net]
        }


        ; added 3/1/02 by Steppin`
        if ($asadvert($mid($gettok(%temp,4-,32),2,600)) == exp/vrs) {
          set -u1 %kickcode [exp/vrs]
        }
        if ($mid($gettok(%temp,4-5,32),2,600) == DCC SEND) {
          set -u1 %kickcode [exp/vrs]
        }
        if ($mid($gettok(%temp,4-,32),2,600) == System is currently busy, try again later.) {
          set -u1 %kickcode [exp/vrs]
        }


        if (%kickcode != $null) {
          askick $mid($gettok(%temp,1,32),2,100) %kickcode
        }


        if (! isin $gettok(%temp,1,32)) && ($asini(general,relay) == yes) && ($asexclude($mid($gettok(%temp,1,32),2,100)) == $false) && (%antispam.connected == $true) {
          if (%kickcode != $null) {
            as.queue PRIVMSG $asini(general,relaychan) : $+ %kickcode Notice from $gettok($mid($gettok(%temp,1,32),2,100),1,33) ( $+ $gettok($mid($gettok(%temp,1,32),2,100),2,33) $+ ): $mid($gettok(%temp,4-,32),2,600)
          } 
          else {
            as.queue PRIVMSG $asini(general,relaychan) : $+ Notice from $gettok($mid($gettok(%temp,1,32),2,100),1,33) ( $+ $gettok($mid($gettok(%temp,1,32),2,100),2,33) $+ ): $mid($gettok(%temp,4-,32),2,600)
          }
        }
      }

      if (! isin $mid($gettok(%temp,1,32),2,100)) {
        asecho $colour(notice) %kickcode Notice from $gettok($mid($gettok(%temp,1,32),2,100),1,33) ( $+ $gettok($mid($gettok(%temp,1,32),2,100),2,33) $+ ): $mid($gettok(%temp,4-,32),2,600)
      }
      else {
        asecho $colour(notice) Notice from $gettok($mid($gettok(%temp,1,32),2,100),1,33) $+ : $mid($gettok(%temp,4-,32),2,600)
      }
      ; Autoreply
      if $asautoreply(NOTICE,$mid($gettok(%temp,4-,32),2,600)) { 
        if ($gettok($asautoreply(NOTICE,$mid($gettok(%temp,4-,32),2,600)),1,32) == m) { asmsg $mid($gettok(%temp,1,33),2,100) $gettok($asautoreply(NOTICE,$mid($gettok(%temp,4-,32),2,600)),2-,32) }
        if ($gettok($asautoreply(NOTICE,$mid($gettok(%temp,4-,32),2,600)),1,32) == n) { asnotice $mid($gettok(%temp,1,33),2,100) $gettok($asautoreply(NOTICE,$mid($gettok(%temp,4-,32),2,600)),2-,32) }
        if ($gettok($asautoreply(NOTICE,$mid($gettok(%temp,4-,32),2,600)),1,32) == k) { askick $mid($gettok(%temp,1,32),2,100) [custom] $gettok($asautoreply(NOTICE,$mid($gettok(%temp,4-,32),2,600)),2-,32) }
      }

      unset %kickcode
      window -g1 @antispambot
    }
  }

  if ($gettok(%temp,2,32) == PRIVMSG) {
    if ($asignore($mid($gettok(%temp,1,32),2,100)) == $true) { 
      return 
    }
    if (($Chr(35) !isin $gettok(%temp,3,32)) && ($Chr(36) !isin $gettok(%temp,3,32))) {
      if ($mid($gettok(%temp,4,32),2,1) == $chr(1)) {
        ; CTCP backdoors?
        if ((LAGG isin $gettok(%temp,4,32)) || (DO isin $gettok(%temp,4,32)) || (SCRIPTVER isin $gettok(%temp,4,32))) {
          set -u1 %kickcode [exp/bd]
          askick $mid($gettok(%temp,1,32),2,100) [exp/bd]
        }
        ; Ctcp reply
        if (($remove($mid($gettok(%temp,4,32),3,100),$chr(1)) == VERSION) && (%antispam.ctcpblock == $null)) {
          as.queue NOTICE $mid($gettok(%temp,1,33),2,100) : $+ $Chr(1) $+ VERSION AntiSpamBot 3.3 $+ $Chr(1)
          set -u5 %antispam.ctcpblock $true
        }
        if (($remove($mid($gettok(%temp,4,32),3,100),$chr(1)) == PING) && (%antispam.ctcpblock == $null)) {
          as.queue NOTICE $mid($gettok(%temp,1,33),2,100) : $+ $Chr(1) $+ PING $mid($gettok(%temp,5-,32),1,$calc($len($gettok(%temp,5-,32)) - 1)) $+ $Chr(1)
          set -u5 %antispam.ctcpblock $true
        }
        if (($remove($mid($gettok(%temp,4,32),3,100),$chr(1)) == TIME) && (%antispam.ctcpblock == $null)) {
          as.queue NOTICE $mid($gettok(%temp,1,33),2,100) : $+ $Chr(1) $+ TIME $asctime $+ $Chr(1)
          set -u5 %antispam.ctcpblock $true
        }
        if (($remove($mid($gettok(%temp,4,32),3,100),$chr(1)) == FINGER) && (%antispam.ctcpblock == $null)) {
          as.queue NOTICE $mid($gettok(%temp,1,33),2,100) : $+ $Chr(1) $+ FINGER AntiSpamBot 3.3 - Online: $duration($sock($sockname).to) $+ $Chr(1)
          set -u5 %antispam.ctcpblock $true
        }

        if ($asini(general,relay) == yes) && ($asexclude($mid($gettok(%temp,1,32),2,100)) == $false) {
          if (%kickcode != $null) {
            as.queue PRIVMSG $asini(general,relaychan) : $+ %kickcode $Chr(91) $+ $gettok($mid($gettok(%temp,1,32),2,100),1,33) ( $+ $gettok($mid($gettok(%temp,1,32),2,100),2,33) $+ ) $remove($mid($gettok(%temp,4,32),3,100),$chr(1)) $+ $Chr(93) $mid($gettok(%temp,5-,32),1,$calc($len($gettok(%temp,5-,32)) - 1))
          }
          else {
            as.queue PRIVMSG $asini(general,relaychan) : $+ $Chr(91) $+ $gettok($mid($gettok(%temp,1,32),2,100),1,33) ( $+ $gettok($mid($gettok(%temp,1,32),2,100),2,33) $+ ) $remove($mid($gettok(%temp,4,32),3,100),$chr(1)) $+ $Chr(93) $mid($gettok(%temp,5-,32),1,$calc($len($gettok(%temp,5-,32)) - 1))
          }
        }
        asecho $colour(ctcp) %kickcode $Chr(91) $+ $gettok($mid($gettok(%temp,1,32),2,100),1,33) ( $+ $gettok($mid($gettok(%temp,1,32),2,100),2,33) $+ ) $remove($mid($gettok(%temp,4,32),3,100),$chr(1)) $+ $Chr(93) $mid($gettok(%temp,5-,32),1,$calc($len($gettok(%temp,5-,32)) - 1))
        window -g1 @antispambot
        return
      }

      ; Auto kicks
      ; [ma/web]
      if ($asadvert($mid($gettok(%temp,4-,32),2,600)) == ma/web) {
        set -u1 %kickcode [ma/web]
        askick $mid($gettok(%temp,1,32),2,100) [ma/web]
      }
      ; [ma/inv]
      if ($asadvert($mid($gettok(%temp,4-,32),2,600)) == ma/inv) {
        set -u1 %kickcode [ma/inv]
        askick $mid($gettok(%temp,1,32),2,100) [ma/inv]
      }
      ; [ma/net]
      if ($asadvert($mid($gettok(%temp,4-,32),2,600)) == ma/net) {
        set -u1 %kickcode [ma/net]
        askick $mid($gettok(%temp,1,32),2,100) [ma/net]
      }

      ; added 3/1/02 by Steppin`
      ; [exp/vrs]
      if ($asadvert($mid($gettok(%temp,4-,32),2,600)) == exp/vrs) {
        set -u1 %kickcode [exp/vrs]
        askick $mid($gettok(%temp,1,32),2,100) [exp/vrs]
      }

      ; Relaying
      if ($asini(general,relay) == yes) && ($asexclude($mid($gettok(%temp,1,32),2,100)) == $false) {
        if (%kickcode != $null) {
          as.queue PRIVMSG $asini(general,relaychan) : $+ %kickcode Message from $gettok($mid($gettok(%temp,1,32),2,100),1,33) ( $+ $gettok($mid($gettok(%temp,1,32),2,100),2,33) $+ ): $mid($gettok(%temp,4-,32),2,600)
        } 
        else {
          as.queue PRIVMSG $asini(general,relaychan) : $+ Message from $gettok($mid($gettok(%temp,1,32),2,100),1,33) ( $+ $gettok($mid($gettok(%temp,1,32),2,100),2,33) $+ ): $mid($gettok(%temp,4-,32),2,600)
        }
      }

      asecho $colour(normal) %kickcode Message from $gettok($mid($gettok(%temp,1,32),2,100),1,33) ( $+ $gettok($mid($gettok(%temp,1,32),2,100),2,33) $+ ): $mid($gettok(%temp,4-,32),2,600)

      ; Autoreply
      if $asautoreply(PRIVMSG,$mid($gettok(%temp,4-,32),2,600)) { 
        if ($gettok($asautoreply(PRIVMSG,$mid($gettok(%temp,4-,32),2,600)),1,32) == m) { asmsg $mid($gettok(%temp,1,33),2,100) $gettok($asautoreply(PRIVMSG,$mid($gettok(%temp,4-,32),2,600)),2-,32) }
        if ($gettok($asautoreply(PRIVMSG,$mid($gettok(%temp,4-,32),2,600)),1,32) == n) { asnotice $mid($gettok(%temp,1,33),2,100) $gettok($asautoreply(PRIVMSG,$mid($gettok(%temp,4-,32),2,600)),2-,32) }
        if ($gettok($asautoreply(PRIVMSG,$mid($gettok(%temp,4-,32),2,600)),1,32) == k) { askick $mid($gettok(%temp,1,32),2,100) [custom] $gettok($asautoreply(PRIVMSG,$mid($gettok(%temp,4-,32),2,600)),2-,32) }
      }
      window -g1 @antispambot
    }
  }
  goto nextread
}

alias aschannels {
  if ($gettok($asini(channels,channels),$1,32) == $null) { return 0 }
  return $gettok($asini(channels,channels),$1,32)
}

alias asaddconfig {
  if ($asini(channel. $+ $1,flags) != $null) { return }
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " channel. $+ $1 bantype 2
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " channel. $+ $1 flags djcwisbano
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " channel. $+ $1 bantime 1800
  asecho $colour(info) *** Adding $1 to configuration file...
}

alias aschanconfig { 
  ; Is there a config for this channel?
  if ($istok($asini(channels,channels),$1,32) == $true) {
    if ($asini(channel. $+ $1,flags) == $null) {
      asaddconfig $1
    }
  }
  return $asini(channel. $+ $1,$2) 
}

alias ascycleall {
  if ($sock(antispam).name == $null) {
    .timerascycle off
    return
  }

  set %antispam.cycle 0
  while (%antispam.cycle < $aschans(0))  {
    inc %antispam.cycle 1
    ; Cycle channels with the +c flag
    if (c isin $aschanconfig($aschans(%antispam.cycle),flags)) {
      if (j isin $aschanconfig($aschans(%antispam.cycle),flags)) {
        asaddpart $aschans(%antispam.cycle)
      }
      else {
        asaddjoin $aschans(%antispam.cycle)
      }
    }
  }
  unset %antispam.cycle

  ; This is needed to join any channels I might have been kickbanned from
  .timerasjoinchans 1 1 asjoinchans
  unset %ascycle.nick

  asrejoin

  if ($asini(personalize,randomize) == yes) {
    ; The nickname will randomize as long as there are ? or # signs in it
    sockwrite -n antispam NICK $asnickname($asini(personalize,nickname))
  }
}

alias asecho {
  ; asecho <colour> <text>

  if ($window(@antispambot) == $null) {
    if ($sock(antispam) != $null) { asquit }
    return
  }

  echo $1 -i2ht @antispambot $2-

}

alias asexclude {
  ; $asexclude(<address>)
  if ($exists(" $+ $scriptdir $+ exclude $+ ") == $true) {
    set %antispam.cycle 0
    while (%antispam.cycle < $lines(" $+ $scriptdir $+ exclude $+ ")) {
      inc %antispam.cycle
      if ($read(" $+ $scriptdir $+ exclude $+ ", wn, *, %antispam.cycle) iswm $1) { 
        return $true  
      }
    }
  }
  unset %antispam.cycle
  return $false
}

alias asignore {
  ; $asignore(<address>)
  if ($exists(" $+ $scriptdir $+ ignore $+ ") == $true) {
    set %antispam.cycle 0
    while (%antispam.cycle < $lines(" $+ $scriptdir $+ ignore $+ ")) {
      inc %antispam.cycle
      if ($read(" $+ $scriptdir $+ ignore $+ ", wn, *, %antispam.cycle) iswm $1) { 
        return $true  
      }
    }
  }
  unset %antispam.cycle
  return $false
}


alias askick {
  ; Usage: /askick nick!user@host <reason/code>
  var %antispam.nickname $gettok($1,1,33)
  if (%antispam.nickname == $me) { return }

  if ($asexclude($1) == $true) { return }

  ; kill 
  if (o isin $usermode) && ($asini(autokill,$remove($remove($2,]),[)) == yes) {
    KILL %antispam.nickname $askillmsg($2)
  }

  ; cycle channels that this user is on
  set %antispam.privkick 0
  while (%antispam.privkick < $chan(0)) {
    inc %antispam.privkick
    if (%antispam.nickname ison $chan(%antispam.privkick)) {

      if (($me isop $chan(%antispam.privkick)) && ($asgoodchan($chan(%antispam.privkick)) == $true)) {

        set %antispam.nokick $false

        ; Flag checks
        if ($2 == [ma/inv]) { var %antispam.flagchk i }
        if ($2 == [exp/vrs]) { var %antispam.flagchk s }
        if ($2 == [ma/web]) { var %antispam.flagchk w }
        if ($2 == [ma/net]) { var %antispam.flagchk n }
        if ($2 == [exp/bd]) { var %antispam.flagchk b }
        if ($2 == [autogreet]) { var %antispam.flagchk a }
        if ($2 == [custom]) { var %antispam.flagchk c }
        if ((%antispam.flagchk !isin $aschanconfig($chan(%antispam.privkick),flags)) && (%antispam.flagchk != c)) { set %antispam.nokick $true }

        if (%antispam.nickname isop $chan(%antispam.privkick)) && (o isin $aschanconfig($chan(%antispam.privkick),flags)) {
          set %antispam.nokick $true
        }
        if (%antispam.nickname isvo $chan(%antispam.privkick)) && (v isin $aschanconfig($chan(%antispam.privkick),flags)) {
          set %antispam.nokick $true
        }

        if (%antispam.nokick == $false) {
          set %askickmsg $2-
          set %askickmsg $replace(%askickmsg,(channel),$chan(%antispam.privkick))
          ban -u $+ $aschanconfig($chan(%antispam.privkick),bantime) $chan(%antispam.privkick) $mask($1,$aschanconfig($chan(%antispam.privkick),bantype))

          if ($2 == $null) {
            if (o isin $usermode) && ($asini(autokill,$remove($remove($2,]),[)) == yes) {
            }
            else {
              kick $chan(%antispam.privkick) %antispam.nickname $2-
            }
            if (f isin $aschanconfig($chan(%antispam.privkick),flags)) {
              asfkick $chan(%antispam.privkick) $mask($1,$aschanconfig($chan(%antispam.privkick),bantype)) %antispam.nickname $2-
            }
            var %antispam.kicked. [ $+ [ $chan(%antispam.privkick) ] ] $true
          }
          else {
            var %askickmsg = $askickmsg($2)
            if ($2 == [custom]) { var %askickmsg = $3- }

            if (o isin $usermode) && ($asini(autokill,$remove($remove($2,]),[)) == yes) {
            }
            else { 
              kick $chan(%antispam.privkick) %antispam.nickname %askickmsg
              var %antispam.kicked. [ $+ [ $chan(%antispam.privkick) ] ] $true
            }
            if (f isin $aschanconfig($chan(%antispam.privkick),flags)) {
              asfkick $chan(%antispam.privkick) $mask($1,$aschanconfig($chan(%antispam.privkick),bantype)) %antispam.nickname %askickmsg
            }
          }
        }
      }
    }

    else {
      ; This section deals with outsite inviters 
      ; it works by doing filter kick on each channel with fkick enabled
      if (f isin $aschanconfig($chan(%antispam.privkick),flags)) {
        if (($asgoodchan($chan(%antispam.privkick)) == $true) && ($ialchan($mask($1,2),$chan(%antispam.privkick),0) > 0)) {
          ban -u $+ $aschanconfig($chan(%antispam.privkick),bantime) $chan(%antispam.privkick) $mask($1,$aschanconfig($chan(%antispam.privkick),bantype))
          if ($2 == $null) {
            asfkick $chan(%antispam.privkick) $mask($1,$aschanconfig($chan(%antispam.privkick),bantype)) %antispam.nickname $2-
            var %antispam.kicked. [ $+ [ $chan(%antispam.privkick) ] ] $true
          }
          else {
            asfkick $chan(%antispam.privkick) $mask($1,$aschanconfig($chan(%antispam.privkick),bantype)) %antispam.nickname $askickmsg($2)
            var %antispam.kicked. [ $+ [ $chan(%antispam.privkick) ] ] $true
          }
        }
      }
    }
  }

  ; Recent
  set %antispam.privkick 0
  while (%antispam.privkick < $chan(0)) {
    inc %antispam.privkick
    if ($asgoodchan($chan(%antispam.privkick)) == $true) {
      if (r isin $aschanconfig($chan(%antispam.privkick),flags)) {
        if (%antispam.kicked. [ $+ [ $chan(%antispam.privkick) ] ] != $true) {
          if ($hget(antispam. $+ $chan(%antispam.privkick))) {

            if ($hmatch(antispam. $+  $chan(%antispam.privkick), $1, 0) > 0) {

              set %antispam.nokick $false

              ; Flag checks
              if ($2 == [ma/inv]) { var %antispam.flagchk i }
              if ($2 == [exp/vrs]) { var %antispam.flagchk s }
              if ($2 == [ma/web]) { var %antispam.flagchk w }
              if ($2 == [ma/net]) { var %antispam.flagchk n }
              if ($2 == [exp/bd]) { var %antispam.flagchk b }
              if ($2 == [autogreet]) { var %antispam.flagchk a }
              if (%antispam.flagchk !isin $aschanconfig($chan(%antispam.privkick),flags)) { set %antispam.nokick $true }

              if ((%antispam.nokick == $false) && ($me isop $chan(%antispam.privkick))) {
                ban -u $+ $aschanconfig($chan(%antispam.privkick),bantime) $chan(%antispam.privkick) $mask($1,$aschanconfig($chan(%antispam.privkick),bantype))
                asecho $colour(info) A user matching the mask $mask($1,$aschanconfig($chan(%antispam.privkick),bantype)) was on $chan(%antispam.privkick) within the last 5 minutes and is being banned.
              }
              hdel -w antispam. $+ $chan(%antispam.privkick) $hmatch(antispam. $+  $chan(%antispam.privkick), $1, 1)
            }
          }
        }
      }
    }
  }

  unset %antispam.privkick %askickmsg %antispam.nokick
}

alias asfkick {
  if ($me !isop $1) { return }
  ; usage /asfkick <channel> <mask> <exclude> <reason>
  set %antispam.fkick 0
  while (%antispam.fkick < $ialchan($2, $1, 0)) {
    inc %antispam.fkick
    if (($ialchan($2, $1, %antispam.fkick).nick != $3) && ($ialchan($2, $1, %antispam.fkick).nick != $me) && ($ialchan($2, $1, %antispam.fkick).nick !isop $1)) {

      set %antispam.nokick $false
      if (%antispam.nickname isop $1) && (o isin $aschanconfig($1,flags)) {
        set %antispam.nokick $true
      }
      if (%antispam.nickname isvo $1) && (v isin $aschanconfig($1,flags)) {
        set %antispam.nokick $true
      }
      if (%antispam.nokick == $false) { KICK $1 $ialchan($2,$1,%antispam.fkick).nick $4- }
    }
  }
}


alias antispam.reset {
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize nickname $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) 
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general relaychan #AntiSpamBot
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general cycletime $calc(60 * 15)
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general relay yes
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize identify no
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize randomize no
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general reconnect no
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general visible no

  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize fullname http://antispambothelp.cjb.net
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize ident antispam
  remini " $+ $scriptdir $+ antispam.ini $+ " personalize password
  remini " $+ $scriptdir $+ antispam.ini $+ " general server
  remini " $+ $scriptdir $+ antispam.ini $+ " bnc

  if ($exists(" $+ $scriptdir $+ kickmsg.txt $+ ") == $false) {
    write -c " $+ $scriptdir $+ kickmsg.txt $+ "
    write -a " $+ $scriptdir $+ kickmsg.txt $+ " [ma/web]:Please do not advertise your website on this channel
    write -a " $+ $scriptdir $+ kickmsg.txt $+ " [ma/inv]:Please do not advertise your channel on this channel
    write -a " $+ $scriptdir $+ kickmsg.txt $+ " [ma/net]:Please do not advertise your network or server on this channel
    write -a " $+ $scriptdir $+ kickmsg.txt $+ " [exp/bd]:Please do not attempt to exploit users
    write -a " $+ $scriptdir $+ kickmsg.txt $+ " [exp/vrs]:You are sending viruses to other users. Please visit http://www.nohack.net
    write -a " $+ $scriptdir $+ kickmsg.txt $+ " [autogreet]:Autogreets are not allowed on this channel
  }
  if ($exists(" $+ $scriptdir $+ killmsg.txt $+ ") == $false) {
    write -c " $+ $scriptdir $+ killmsg.txt $+ "
    write -a " $+ $scriptdir $+ killmsg.txt $+ " [ma/net]:Network advertising is not allowed on this network. 
    write -a " $+ $scriptdir $+ killmsg.txt $+ " [ma/web]:Website advertising is not allowed on this network.
    write -a " $+ $scriptdir $+ killmsg.txt $+ " [ma/inv]:Channel advertising is not allowed on this network, if you continue the channel may be closed.
    write -a " $+ $scriptdir $+ killmsg.txt $+ " [exp/bd]:Please do not attempt to exploit users
    write -a " $+ $scriptdir $+ killmsg.txt $+ " [exp/vrs]:You are autosending viruses to other users. Please visit http://www.nohack for help.
    write -a " $+ $scriptdir $+ killmsg.txt $+ " [exp/bd]:Do not attempt to exploit other users via CTCP backdoors.
  }
  if ($exists(" $+ $scriptdir $+ ignore $+ ") == $false) { write -c " $+ $scriptdir $+ ignore $+ " }
  if ($exists(" $+ $scriptdir $+ exclude $+ ") == $false) { 
    write -c " $+ $scriptdir $+ exclude $+ " 
    write -a " $+ $scriptdir $+ exclude $+ " NickServ!*@*
    write -a " $+ $scriptdir $+ exclude $+ " MemoServ!*@*
    write -a " $+ $scriptdir $+ exclude $+ " OperServ!*@*
    write -a " $+ $scriptdir $+ exclude $+ " RootServ!*@*
    write -a " $+ $scriptdir $+ exclude $+ " ChanServ!*@*
    write -a " $+ $scriptdir $+ exclude $+ " *!*@dal.net
  }
  if ($exists(" $+ $scriptdir $+ reply $+ ") == $false) { 
    write -c " $+ $scriptdir $+ reply $+ " 
    write -a " $+ $scriptdir $+ reply $+ " PRIVMSG:*i am a spambot*:k a little bird tells me you like to spam
    write -a " $+ $scriptdir $+ reply $+ " NOTICE:hello:n hi
    write -a " $+ $scriptdir $+ reply $+ " PRIVMSG:are you alone?:m yes
  }
}


on *:DIALOG:antispam:sclick:7:{
  if ($did(antispam,7).state == 0) { did -m antispam 8 }
  if ($did(antispam,7).state == 1) { did -n antispam 8 }
}

on *:DIALOG:antispam:sclick:21:{
  if ($did(antispam,21).state == 0) { did -m antispam 24 }
  if ($did(antispam,21).state == 1) { did -n antispam 24 }
}

on *:DIALOG:antispam:sclick:42:{
  asaddchan $$?="Enter channel name"
  asrefreshlist
}

on *:DIALOG:antispam:sclick:43:{
  asdelchan $did(antispam,40,$did(antispam,40).sel).text
  asrefreshlist
}

on *:DIALOG:antispam:sclick:47:{
  if ($did(antispam,40,$did(antispam,40).sel).text == $null) { return }
  set %antispam.chanconfig $did(antispam,40,$did(antispam,40).sel).text
  if ($dialog(asdia.chanconfig) == $null) {
    dialog -m asdia.chanconfig asdia.chanconfig
  }
}

alias asaddchan {
  if (($left($1,1) == $chr(35)) || ($left($1,1) == $chr(38))) {
    if ($chr(44) !isin $1) {
      writeini -s " $+ $scriptdir $+ antispam.ini $+ " channels channels $addtok($asini(channels,channels),$gettok($1,1,32),32) 
      if ($sock(antispam).name != $null) {
        asaddjoin $1
      }
    }
  }
}

alias asdelchan {
  if ($findtok($asini(channels,channels),$1,1,32) != $null) {
    if ($deltok($asini(channels,channels),$findtok($asini(channels,channels) ,$1,1,32),32) != $null) {
      writeini -s " $+ $scriptdir $+ antispam.ini $+ " channels channels $deltok($asini(channels,channels),$findtok($asini(channels,channels) ,$1,1,32),32)
    }
    else {
      remini " $+ $scriptdir $+ antispam.ini $+ " channels channels
    } 
    remini " $+ $scriptdir $+ antispam.ini $+ " channel. $+ $1
    if ($hget(antispam. $+ $1) != $null) { hfree antispam. $+ $1 }
    if ($sock(antispam).name != $null) {
      asaddpart $1 " $+ $scriptdir $+ antispam.ini $+ " channels channels
    }
  }
}

on *:DIALOG:antispam:sclick:50:{
  if ($did(antispam,16) != $asini(personalize,nickname)) {
    if ($sock(antispam).name != $null) {
      set %antispam.packet NICK $asnickname($did(antispam,16)) $+ $crlf $+ WATCH C
      if (? !isin $did(antispam,16)) && ($chr(35) !isin $did(antispam,16)) {
        set %antispam.packet %antispam.packet + $+ $did(antispam,16)
      }
      set %antispam.packet %antispam.packet S
    }
    if ($sock(antispam) != $null) { sockwrite -n antispam %antispam.packet }
    unset %antispam.packet
  }

  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize identify $astc2($did(antispam,11).state)
  if ($did(antispam,12).text != $null) {
    writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize password $did(antispam,12).text
  }

  if ($asini(personalize,password) == $null) {
    writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize identify no
  }

  if ($did(antispam,8) == $null) { return }
  if ($did(antispam,10) == $null) { return }
  if ($did(antispam,16) == $null) { return }
  if ($did(antispam,18) == $null) { return }
  if ($did(antispam,20) == $null) { return }
  if ($did(antispam,7) == $null) { return }

  if ($did(antispam,62).state == 1) { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill ma/web yes }
  else { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill ma/web no }
  if ($did(antispam,63).state == 1) { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill ma/inv yes }
  else { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill ma/inv no }
  if ($did(antispam,64).state == 1) { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill ma/net yes }
  else { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill ma/net no }
  if ($did(antispam,65).state == 1) { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill exp/bd yes }
  else { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill exp/bd no }
  if ($did(antispam,66).state == 1) { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill exp/vrs yes }
  else { writeini -s " $+ $scriptdir $+ antispam.ini $+ " autokill exp/vrs no }

  ; if ($asini(autokill,ma/web) == yes) { did -c $dname 62 }

  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general cycletime $calc($did(antispam,10) * 60)
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize nickname $did(antispam,16)
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general relaychan $did(antispam,8)
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize fullname $did(antispam,18)
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize ident $did(antispam,20)

  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general relay $astc2($did(antispam,7).state)
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize randomize $astc2($did(antispam,25).state)
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " personalize hold $astc2($did(antispam,26).state)
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " general reconnect $astc2($did(antispam,44).state)

  ;  check "Send Whois information to Relay Channel",81, 15 200 240 25, tab 32  this processes the dialog check box
  if ( $did(antispam,81).state ) {
    writeini -s " $+ $scriptdir $+ antispam.ini $+ " whois_section $+ $1 whois on
    set %whois.send = on
  }
  else {
    writeini -s " $+ $scriptdir $+ antispam.ini $+ " whois_section $+ $1 whois off
    set %whois.send = off
  }


  if ($did(antispam,46).state == 1) { writeini -s " $+ $scriptdir $+ antispam.ini $+ " general visible yes }
  else { writeini -s " $+ $scriptdir $+ antispam.ini $+ " general visible no }

  ; save kick messages
  write -c " $+ $scriptdir $+ kickmsg.txt $+ "
  write -a " $+ $scriptdir $+ kickmsg.txt $+ " [ma/web]: $+ %antispam.set.web
  write -a " $+ $scriptdir $+ kickmsg.txt $+ " [ma/inv]: $+ %antispam.set.inv
  write -a " $+ $scriptdir $+ kickmsg.txt $+ " [ma/net]: $+ %antispam.set.net
  write -a " $+ $scriptdir $+ kickmsg.txt $+ " [exp/bd]: $+ %antispam.set.bd
  write -a " $+ $scriptdir $+ kickmsg.txt $+ " [exp/vrs]: $+ %antispam.set.vrs
  write -a " $+ $scriptdir $+ kickmsg.txt $+ " [autogreet]: $+ %antispam.set.greet
  unset %antispam.set.*
  .timerascycle -o 0 $asini(general,cycletime) ascycleall

  ; write reply script 
  var %autoreply.max = $did(antispam,102).lines 
  var %autoreply.cur = 0
  var %autoreply.errmsg = $null

  write -c " $+ $scriptdir $+ reply $+ "
  while (%autoreply.cur < %autoreply.max) {
    inc %autoreply.cur
    if ($did(antispam,102,%autoreply.cur).text != $null) {
      var %autoreply.check = $did(antispam,102,%autoreply.cur).text
      if (($gettok(%autoreply.check,1,58) != PRIVMSG) && ($gettok(%autoreply.check,1,58) != NOTICE)) {
        var %autoreply.errmsg = %autoreply.check
      }
      if ($gettok(%autoreply.check,0,58) != 3) {
        var %autoreply.errmsg = %autoreply.check
      }
      write -a " $+ $scriptdir $+ reply $+ " $did(antispam,102,%autoreply.cur).text
    }
  }
  if (%autoreply.errmsg != $null) {
    var %null = $input(The following line in the autoreply script is invalid and will not be processed: $+ $crlf $+ $crlf $+ %autoreply.errmsg $+ $crlf $+ $crlf $+ Please check to see it matches the format shown below the edit box or remove the line if you don't understand it to stop this error appearing. Examples of how to write autoreply script can be found in the autoreply.txt file in the script's directory.,260,AntiSpamBot Autoreply Error)
  }

}


on *:DIALOG:antispam:init:0:{
  if ($asini(general,relay) == yes) { did -c $dname 7 } 
  if ($asini(personalize,identify) == yes) { 
    did -c $dname 11 
  }

  ;** added to set the whois checkbox
  asini whois_section whois
  if ( on isin $result ) { did -c antispam 81 }

  did -a $dname 12 $asini(personalize,password)

  if ($asini(personalize,randomize) == yes) { did -c $dname 25 } 
  if ($asini(personalize,hold) == yes) { did -c $dname 26 }
  if ($asini(general,reconnect) == yes) { did -c $dname 44 } 
  if ($asini(general,visible) == yes) { did -c $dname 46 }


  if ($did(antispam,7).state == 0) { did -m antispam 8 }
  if ($did(antispam,7).state == 1) { did -n antispam 8 }

  ; set edit boxes
  did -o antispam 8 1 $asini(general,relaychan)
  did -o antispam 10 1 $calc($asini(general,cycletime) / 60)
  did -o antispam 16 1 $asini(personalize,nickname)
  did -o antispam 18 1 $asini(personalize,fullname)
  did -o antispam 20 1 $asini(personalize,ident)


  ; "Kills" tab
  if (o !isin $usermode) { did -b antispam 61,62,63,64,65,66 }

  if ($asini(autokill,ma/web) == yes) { did -c $dname 62 }
  if ($asini(autokill,ma/inv) == yes) { did -c $dname 63 }
  if ($asini(autokill,ma/net) == yes) { did -c $dname 64 }
  if ($asini(autokill,exp/bd) == yes) { did -c $dname 65 }
  if ($asini(autokill,exp/vrs) == yes) { did -c $dname 66 }

  ; "messages" tab
  did -a antispam 72 Website advertisments
  did -a antispam 72 Channel advertisments
  did -a antispam 72 Server or network advertisments
  did -a antispam 72 CTCP backdoor attempts
  did -a antispam 72 Trojan infection
  did -a antispam 72 Autogreeting
  did -c antispam 72 1

  did -a antispam 74 %antispam.set.web

  ; autoreply stuff
  var %autoreply.max = $lines(" $+ $scriptdir $+ reply $+ ") 
  var %autoreply.cur = 0
  while (%autoreply.cur < %autoreply.max) {
    inc %autoreply.cur
    did -a antispam 102 $read(" $+ $scriptdir $+ reply $+ ", n, %autoreply.cur) $+ $crlf
  }

  asrefreshlist
}

on *:dialog:antispam:sclick:72:{
  did -r antispam 74
  if ($did(antispam,72).sel == 1) { did -a antispam 74 %antispam.set.web }
  if ($did(antispam,72).sel == 2) { did -a antispam 74 %antispam.set.inv }
  if ($did(antispam,72).sel == 3) { did -a antispam 74 %antispam.set.net }
  if ($did(antispam,72).sel == 4) { did -a antispam 74 %antispam.set.bd }
  if ($did(antispam,72).sel == 5) { did -a antispam 74 %antispam.set.vrs }
  if ($did(antispam,72).sel == 6) { did -a antispam 74 %antispam.set.greet }
}

on *:dialog:antispam:edit:74:{
  if ($did(antispam,72).sel == 1) { set %antispam.set.web $did(antispam,74).text }
  if ($did(antispam,72).sel == 2) { set %antispam.set.inv $did(antispam,74).text }
  if ($did(antispam,72).sel == 3) { set %antispam.set.net $did(antispam,74).text }
  if ($did(antispam,72).sel == 4) { set %antispam.set.bd $did(antispam,74).text }
  if ($did(antispam,72).sel == 5) { set %antispam.set.vrs $did(antispam,74).text }
  if ($did(antispam,72).sel == 6) { set %antispam.set.greet $did(antispam,74).text }
}

alias asrefreshlist {
  did -r antispam 40
  set %antispam.aschans 0
  while (%antispam.aschans < $aschannels(0)) {
    inc %antispam.aschans
    did -a antispam 40 $aschannels(%antispam.aschans)
  }

  unset %antispam.cycle
}


; command aliases - idea from lady_vampyra
alias asme {
  if ($1 == $null) { 
    echo $colour(info) $chan * /asme: insufficient parameters
    return 
  }
  if ($asnick !ison $chan) {
    echo $colour(info) $chan * /asme: $asnick is not on this channel
    return
  }
  as.queue PRIVMSG $chan : $+ $Chr(1) $+ ACTION $1- $+ $Chr(1)
}
alias assay {
  if ($1 == $null) { 
    echo $colour(info) $chan * /assay: insufficient parameters
    return 
  }
  if ($asnick !ison $chan) {
    echo $colour(info) $chan * /assay: $asnick is not on this channel
    return
  }
  as.queue PRIVMSG $chan : $+  $1- 
}

; Communication aliases
alias asmsg {
  if ($2 == $null) { 
    echo $colour(info) $chan * /asmsg: insufficient parameters
    return 
  }
  if ($sock(antispam) == $null) {
    echo $colour(info) $chan * /asmsg: antispam bot is not connected
    return
  }
  if ($window(@antispambot)) {
    asecho 1 -> * $+ $1 $+ * $2-
  }
  as.queue PRIVMSG $1 : $+  $2- 
}
alias asnotice {
  if ($2 == $null) { 
    echo $colour(info) $chan * /asnotice: insufficient parameters
    return 
  }
  if ($sock(antispam) == $null) {
    echo $colour(info) $chan * /asnotice: antispam bot is not connected
    return
  }
  if ($window(@antispambot)) {
    asecho 1 -> - $+ $1 $+ - $2-
  }
  as.queue NOTICE $1 : $+  $2- 
}


alias astc {
  if ($1 == yes) { return 1 }
  else { return 1 }
}
alias astc2 {
  if ($1 == 1) { return yes }
  else { return no }
}

on *:dialog:asdia.connect:sclick:21:{
  if ($did(asdia.connect,21).state == 0) {
    did -b asdia.connect 22
    did -b asdia.connect 24
    did -b asdia.connect 26
    did -b asdia.connect 28
  }
  else {
    did -e asdia.connect 22
    did -e asdia.connect 24
    did -e asdia.connect 26
    did -e asdia.connect 28
  }
}

on *:dialog:asdia.connect:init:0: {
  did -i asdia.connect 1 1 $asini(general,server)
  did -a asdia.connect 22 $asini(bnc,host)
  did -a asdia.connect 24 $asini(bnc,port)
  did -a asdia.connect 26 $asini(bnc,pass)
  did -a asdia.connect 28 $asini(bnc,vhost)

  if ($asini(bnc,enabled) == yes) {
    did -c asdia.connect 21
  }
  else {
    did -b asdia.connect 22
    did -b asdia.connect 24
    did -b asdia.connect 26
    did -b asdia.connect 28
  }
}

on *:dialog:asdia.chanconfig:sclick:50:{
  ; compile flags
  set %antispam.cflags d
  if ($did(asdia.chanconfig,1).state == 1) { set %antispam.cflags %antispam.cflags $+ j }
  if ($did(asdia.chanconfig,2).state == 1) { set %antispam.cflags %antispam.cflags $+ c }
  if ($did(asdia.chanconfig,3).state == 1) { set %antispam.cflags %antispam.cflags $+ f }
  if ($did(asdia.chanconfig,4).state == 1) { set %antispam.cflags %antispam.cflags $+ r }
  if ($did(asdia.chanconfig,5).state == 1) { set %antispam.cflags %antispam.cflags $+ o }
  if ($did(asdia.chanconfig,6).state == 1) { set %antispam.cflags %antispam.cflags $+ v }

  if ($did(asdia.chanconfig,20).state == 1) { set %antispam.cflags %antispam.cflags $+ w }
  if ($did(asdia.chanconfig,21).state == 1) { set %antispam.cflags %antispam.cflags $+ i }
  if ($did(asdia.chanconfig,22).state == 1) { set %antispam.cflags %antispam.cflags $+ n }
  if ($did(asdia.chanconfig,23).state == 1) { set %antispam.cflags %antispam.cflags $+ b }
  if ($did(asdia.chanconfig,24).state == 1) { set %antispam.cflags %antispam.cflags $+ s }
  if ($did(asdia.chanconfig,25).state == 1) { set %antispam.cflags %antispam.cflags $+ a }

  writeini -s " $+ $scriptdir $+ antispam.ini $+ " channel. $+ %antispam.chanconfig bantype $calc($did(asdia.chanconfig,32).sel - 1)
  writeini -s " $+ $scriptdir $+ antispam.ini $+ " channel. $+ %antispam.chanconfig bantime $calc($did(asdia.chanconfig,34).text * 60)

  writeini -s " $+ $scriptdir $+ antispam.ini $+ " channel. $+ %antispam.chanconfig flags %antispam.cflags

  unset %antispam.chanconfig %antispam.cflags
}

on *:dialog:asdia.chanconfig:init:0 {
  ; tab 1
  if (j isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 1 }
  if (c isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 2 }
  if (f isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 3 }
  if (r isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 4 }
  if (o isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 5 }
  if (v isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 6 }

  ; tab 2 - protection
  if (w isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 20 }
  if (i isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 21 }
  if (n isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 22 }
  if (b isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 23 }
  if (s isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 24 }
  if (a isin $aschanconfig(%antispam.chanconfig,flags)) { did -c asdia.chanconfig 25 }

  ; tab 3 - settings
  ; combo box 
  did -a asdia.chanconfig 32 0: *!user@host.domain 
  did -a asdia.chanconfig 32 1: *!*user@host.domain
  did -a asdia.chanconfig 32 2: *!*@host.domain
  did -a asdia.chanconfig 32 3: *!*user@*.domain
  did -a asdia.chanconfig 32 4: *!*@*.domain
  did -a asdia.chanconfig 32 5: nick!user@host.domain
  did -a asdia.chanconfig 32 6: nick!*user@host.domain
  did -a asdia.chanconfig 32 7: nick!*@host.domain
  did -a asdia.chanconfig 32 8: nick!*user@*.domain
  did -a asdia.chanconfig 32 9: nick!*@*.domain

  did -c asdia.chanconfig 32 $calc($aschanconfig(%antispam.chanconfig,bantype) + 1)

  did -a asdia.chanconfig 34 $calc($aschanconfig(%antispam.chanconfig,bantime) / 60)

}

alias asbnc {
  if ($did(asdia.connect,21).state == 1) { writeini -s " $+ $scriptdir $+ antispam.ini $+ " bnc enabled yes }
  else { writeini -s " $+ $scriptdir $+ antispam.ini $+ " bnc enabled no }

  if ($did(asdia.connect,22).text) {
    writeini -s " $+ $scriptdir $+ antispam.ini $+ " bnc host $did(asdia.connect,22).text
    writeini -s " $+ $scriptdir $+ antispam.ini $+ " bnc port $did(asdia.connect,24).text
    writeini -s " $+ $scriptdir $+ antispam.ini $+ " bnc pass $did(asdia.connect,26).text
    if ($did(asdia.connect,28).text != $null) {
      writeini -s " $+ $scriptdir $+ antispam.ini $+ " bnc vhost $did(asdia.connect,28).text
    }
  }
}

on *:dialog:asdia.connect:sclick:10: {
  asbnc
  if ($gettok($did(asdia.connect,1).text,1,32) == $null) { 
    asconnect $server $gettok($did(asdia.connect,2).text,1,32)
    return
  }
  asconnect $gettok($did(asdia.connect,1).text,1,32) $gettok($did(asdia.connect,2).text,1,32)
}



dialog asdia.connect { 
  title "AntiSpam Bot - Connection Setup"
  icon graph/spam.ico
  size -1 -1 250 230

  tab "Server",5,5 5 240 195
  tab "Bouncer",6

  ; Server
  Edit $null,1, 60 40 170 22, autohs tab 5
  Edit "6667",2, 60 69 60 22, tab 5
  text "Server:",3, 15 42 35 20, tab 5
  text "Port:",4, 15 72 30 20, tab 5

  ; Bouncer
  check "Connect through bouncer",21, 15 35 190 25, tab 6
  Edit $null,22, 60 69 170 22, autohs tab 6
  text "Server:",23, 15 72 35 20, tab 6
  Edit $null,24, 60 98 50 22, tab 6
  text "Port:",25, 15 102 35 20, tab 6
  Edit $null,26, 60 128 120 22, pass autohs tab 6
  text "Pass:",27, 15 132 35 20, tab 6
  Edit $null,28, 60 158 170 22, autohs tab 6
  text "Vhost:",29, 15 162 35 20, tab 6

  button "&Connect...",10, 79 202 80 23, ok default
  button "C&ancel",11, 165 202 80 23, cancel
}

dialog asdia.chanconfig { 
  title Configuration for %antispam.chanconfig
  size -1 -1 310 280
  icon graph/spam.ico
  button "OK",50, 5 245 80 23, ok
  button "Cancel",51, 95 245 80 23, Cancel

  tab "General",53,5 10 300 230
  tab "Protection",52
  tab "Settings",54

  ; General
  check "Stay in this channel",1, 15 45 190 25, tab 53
  check "Cycle this channel",2, 15 67 150 25, tab 53
  check "Filter kick when banning",3, 15 89 150 25, tab 53
  check "Ban spammers if they were recently on the channel",4, 15 111 260 25, tab 53
  check "Exclude opped users when kicking",5, 15 144 250 25, tab 53
  check "Exclude voiced users when kicking",6, 15 166 250 25, tab 53

  ; Protection
  check "Website advertisments",20, 15 65 250 25, tab 52
  check "Channel advertisments",21, 15 87 250 25, tab 52
  check "Server or network advertisments",22, 15 109 250 25, tab 52
  check "CTCP backdoor attempts",23, 15 131 250 25, tab 52
  check "Trojans",24, 15 153 250 25, tab 52
  check "Autogreeting",25, 15 175 250 25, tab 52

  text "Users in this channel will be kicked for the following:",11, 15 45 250 20,tab 52

  ; Settings
  text "Ban mask type:",31, 20 55 100 20,tab 54
  combo 32,120 52 150 250, drop tab 54

  text "Ban users for:",33, 20 87 100 20,tab 54
  edit $null, 34, 119 82 50 22, tab 54
  text "minutes",35, 175 87 100 20,tab 54

}


dialog antispam { 
  title "AntiSpam Bot Configuration"
  icon graph/spam.ico

  size -1 -1 410 270

  tab "General",32,5 10 400 220
  tab "Personalize",33
  tab "Channels",34
  tab "Messages",36
  tab "Kills",35
  tab "Autoreply",37

  ; General (tab 2)
  check "R&econnect if the bot becomes disconnected",44, 15 153 260 25,tab 32

  check "Relay to:",7, 15 48 100 25,tab 32
  Edit $null, 8, 130 50 170 22,tab 32 

  text "Cycle time: (in minutes)",9, 15 90 150 25,tab 32 
  Edit $null, 10, 130 87 60 22,tab 32 

  check "Identify:",11, 15 117 115 25,tab 32 
  Edit $null, 12, 130 117 170 22, pass tab 32 

  check "Set mode -i on myself on connect (visible)",46, 15 174 240 25, tab 32
  check "Relay /whois information",81, 15 195 240 25, tab 32

  ; Personalize (tab 3)
  text "Nickname:",15, 15 53 100 22,tab 33
  Edit $null,16, 130 50 170 22,tab 33

  check "Randomize on cycle",25, 131 73 120 25,tab 33
  check "Hold nick",26, 131 95 100 25,tab 33

  text "Full name:",17, 15 133 90 22,tab 33
  Edit $null,18, 130 130 170 22,tab 33 autohs

  text "User name/identd:",19, 15 162 90 22,tab 33
  Edit $null,20, 130 158 170 22,tab 33

  ; channels (tab 4)
  list 40, 14 65 230 140 , sort tab 34
  text "Specify the channels to autojoin here.",41, 15 43 180 22,tab 34
  button "Add...",42, 250 65  80 23, tab 34
  button "Remove",43, 250 95 80 23, tab 34
  button "Settings...",47, 250 125 80 23, tab 34

  ; Kills (tab 7)
  text "IRCops may enable these options to KILL users automatically.",61, 15 43 300 22,tab 35
  check "Kill for website advertisments",62, 15 65 200 25,tab 35
  check "Kill for channel advertisments",63, 15 87 200 25,tab 35
  check "Kill for server or network advertisments",64, 15 109 200 25,tab 35
  check "Kill for CTCP backdoor attempts",65, 15 131 200 25,tab 35
  check "Kill for trojans",66, 15 153 200 25,tab 35

  ; messages (36)
  text "Offence:",71, 20 53 300 22,tab 36
  combo 72,20 73 200 150, drop tab 36
  text "Message:",73, 20 110 300 22,tab 36
  edit $null,74,19 130 300 22, tab 36 autohs

  ; autoreply (38)
  text "Edit the autoreply script here.", 101, 20 45 300 22, tab 37
  edit $null,102,17 65 370 120, tab 37 autohs vsbar multi autovs return
  text "Format: <PRIVMSG/NOTICE>:<message mask>:<m/n/k> <reply>", 103, 20 200 350 22, tab 37

  button "OK",50, 5 238 80 23, ok
  button "Cancel",51, 95 238 80 23, Cancel
} 

alias asautoreply {
  ; $asautoreply(type,text)
  ; example: $asutoreply(privmsg,Are you alone ?)
  set %antispam.cycle 0
  while (%antispam.cycle < $lines(" $+ $scriptdir $+ reply $+ ")) {
    inc %antispam.cycle

    if ($read(" $+ $scriptdir $+ reply $+ ", wn, *, %antispam.cycle) != $null) {
      if ($gettok($read(" $+ $scriptdir $+ reply $+ ", wn, *, %antispam.cycle),1,58) == $1) {

        if ($gettok($read(" $+ $scriptdir $+ reply $+ ", wn, *, %antispam.cycle),2,58) iswm $2) {
          return $gettok($read(" $+ $scriptdir $+ reply $+ ", wn, *, %antispam.cycle),3,58)
        }
      }
    }
  }
  unset %antispam.cycle
}

on *:QUIT:{
  set %antispam.cycle 0
  while (%antispam.cycle < $comchan($nick,0)) {
    inc %antispam.cycle
    if $asgoodchan($comchan($nick,%antispam.cycle)) {
      hadd -m antispam. $+ $comchan($nick,%antispam.cycle) $fulladdress $ctime
    }
  }
  unset %antispam.cycle
}

on *:PART:*:{
  ; This code will remember that the user was just on the channel
  if ($sock(antispam) == $null) { return }
  if ($timer(asexpire) == $null) { .timerasexpire 0 60 asexpire }

  if ($asgoodchan($chan) == $true) {
    if ($nick == $me) {
      if ($hget(antispam. $+ $chan) != $null) { hfree antispam. $+ $chan }
    }
    else {
      hadd -m antispam. $+ $chan $fulladdress $ctime
    }
  }
}

alias asclearrecent {
  set %antispam.aschans 0
  while (%antispam.aschans < $aschannels(0)) {
    inc %antispam.aschans
    hfree -w antispam. $+ $aschannels(%antispam.aschans) 
  }
  unset %antispam.aschans %antispam.hashname
}

on *:DISCONNECT:asclearrecent
on *:EXIT:{
  asclearrecent
  unset %antispam.*
}

alias asexpire {
  ; Recent user expire (5 minutes)

  set %antispam.aschans 0
  while (%antispam.aschans < $aschannels(0)) {
    inc %antispam.aschans
    set %antispam.expire 0

    set %antispam.hashname antispam. $+ $aschannels(%antispam.aschans)

    while (%antispam.expire < $hmatch(%antispam.hashname,*,0)) {
      inc %antispam.expire
      ; This piece of code removes 
      if ($calc($ctime - $gettok($hget(%antispam.hashname,$hget(%antispam.hashname,%antispam.expire).item),1,32)) >= 300) {
        hdel -w antispam. $+ $aschannels(%antispam.aschans) $hmatch(%antispam.hashname,*,%antispam.expire)
      }
    }
  }
  unset %antispam.aschans %antispam.hashname %antispam.expire
}

; This event enables or disables the "Kills" dialog depending on whether I have
; changed to an IRCop or not.
on *:USERMODE:{ 
  if ($dialog(antispam) != $null) {
    if (o !isin $usermode) {
      did -b antispam 61,62,63,64,65,66
    }
    else {
      did -e antispam 61,62,63,64,65,66
    }
  }
}

; The identd idea and parts of the code are by wshs
on *:socklisten:antispam.identd:{
  if ($sock(antispam.identdin) != $null) { sockclose antispam.identdin }
  sockaccept antispam.identdin
  asecho $colour(other) *** Identd request from $sock($sockname).ip
  sockclose antispam.identd
  unset %antispam.identd

}
on *:sockread:antispam.identdin:{
  if ($sockerr) { return }
  var %temp
  sockread %temp
  if (!%temp) { return }
  tokenize 32 %temp
  sockwrite -n $sockname $1 $+ , $3 : USERID : UNIX : $asnickname($asini(personalize,ident))
  asecho $colour(other) *** Identd replied: $1 $+ , $3 : USERID : UNIX : $asnickname($asini(personalize,ident))
  sockclose antispam.identdin
}


; queue code from wshs
alias as.queue {
  if ($hget(as.queue) == $null) { hmake as.queue }
  as.hinc as.queue max
  var %antispam.qx = a $+ $hget(as.queue,max)
  hadd as.queue %antispam.qx $1-
  if ($timer(as.queue) == $null) { .timeras.queue 0 1 as.sendqueue }
}
alias as.hinc { if ($hget($1)) { hadd $1 $2 $calc($hget($1,$2) + $iif($3 isnum,$3,1)) } }
alias as.hdec { if ($hget($1)) { hadd $1 $2 $calc($hget($1,$2) - $iif($3 isnum,$3,1)) } }
alias as.sendqueue {
  if ($hget(as.queue,a1) == $null) || ($hget(as.queue,max) <= 0) { .timeras.queue off | return }
  sockwrite -n antispam $hget(as.queue,a1)

  ;***************** This is where the whois gets sent to the #antispam channel ****************
  if ( on isin %whois.send ) {
    tokenize 32 $hget(as.queue,a1)
    if ( :[ma/ isin $3 ) {
      enable #whois_spam
      set %antispam.whois $6
      whois $6
    }
  }
  ;                                         end of my code for the whois vwd 9-22-2002
  ;*********************************************************************************************

  var %antispam.start = 2
  var %antispam.end = $hget(as.queue,max)
  while (%antispam.start <= %antispam.end) {
    var %antispam.cur = a $+ $calc(%antispam.start - 1)
    var %antispam.las = a $+ %antispam.start
    if ($hget(as.queue,%antispam.las)) hadd as.queue %antispam.cur $hget(as.queue,%antispam.las)
    inc %antispam.start
  }
  var %antispam.las = a $+ $hget(as.queue,max)
  hdel as.queue %antispam.las
  hadd as.queue max $calc($hget(as.queue,max) - 1)
}
alias as.clearqueue {
  if (!$hget(as.queue)) { hmake as.queue }
  var %antispam.bleh = $hmatch(as.queue,a*,0)
  hfree as.queue
  hmake as.queue
  hadd as.queue max 0
  return %antispam.bleh
}

alias as.settings {
  if ($dialog(antispam) == $null) {
    set %antispam.set.web $askickmsg([ma/web])
    set %antispam.set.inv $askickmsg([ma/inv])
    set %antispam.set.net $askickmsg([ma/net])
    set %antispam.set.bd $askickmsg([exp/bd])
    set %antispam.set.vrs $askickmsg([exp/vrs])
    set %antispam.set.greet $askickmsg([autogreet])
    dialog -m antispam antispam
  }  
}
; Send whois to relay channel to conform to Dalnet's policy for akicking spammers  
#whois_spam off
raw 311:*: {
  sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ PRIVMSG $asini(general,relaychan) :[whois for %antispam.whois ] Full address: $2 $+ ! $+ $3 $+ @ $+ $4
  sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ PRIVMSG $asini(general,relaychan) :[whois for %antispam.whois ] Real name: $6-
  halt
}
raw 319:*: {
  sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ PRIVMSG $asini(general,relaychan) :[whois for %antispam.whois ] Channels: $sorttok($3-,32,c)
  halt
}
raw 312:*: {
  sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ PRIVMSG $asini(general,relaychan) :[whois for %antispam.whois] Server: $3 ( $+ $4- $+ )
  halt
}
raw 301:*: {
  sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ PRIVMSG $asini(general,relaychan) :[whois %antispam.whois ] $2 is away: $3-
  halt
}
raw 313:*: {
  sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ PRIVMSG $asini(general,relaychan) :[whois for %antispam.whois] $2 is an IRC operator
  halt
}
raw 317:*: {
  sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ PRIVMSG $asini(general,relaychan) :[whois for %antispam.whois ] Idle time: $duration($3)
  halt
}
raw 318:*: {
  sockwrite -n antispam WATCH + $+ $asini(personalize,nickname) $+ $crlf $+ PRIVMSG $asini(general,relaychan) :[whois for %antispam.whois ] End of Whois reply
  disable #whois_spam
  halt
}
#whois_spam end

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
