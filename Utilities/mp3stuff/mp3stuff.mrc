on *:load:mp3stuff.init
on *:start:{
  if ($not_making_list) {
    startup
    if ($timer(mp3stuffld)) return
    cont 0
  }
}
alias -l v if ($1) return $mp3stuffversion | return 2002.12.30
alias mp3stuffversion if ($1) return $v | return mp3stuff [[ $+ $v $+ ]]
alias mp3stuff {
  if ($isid) return [ $ [ $+ [ $1- ] ] ]
  if ($1 isnum) mp3stuffs $1
  else $1-
}
alias mp3stuff.init {
  oldversion
  .timermp3stuffld -o 1 1 n
  if ($dialog(mp3stuffo)) dialog -x mp3stuffo
  if ($dialog(mp3stuffs)) dialog -x mp3stuffs
  if ($dialog(mp3stuffc)) dialog -x mp3stuffc
  var %@ = @mp3stuff loaded, %e = $_echo(%@)
  if (%mp3stuffcheck !isnum) .timer -o 1 0 mp3stuffo 94
  startup 1
  close -@ %@
  window -aik %@
  %e $v(1) loaded.
  var %f = $scriptdir $+ stuffamp.mrc
  if ($isfile(%f)) && ($version >= 5.8) {
    if (%mp3stuffampunloaded != 1) || ($script(stuffamp.mrc)) {
      .timer -o 1 0 stuffamp.init
      if ($script(stuffamp.mrc)) .reload -rs " $+ $ifmatch $+ "
      else .reload -rs " $+ %f $+ "
    }
  }
  %e Check out my other addons available at </c>http://come.to/andys.site/
  if ($len(%mp3stuffplayer) < 2) %e If the default mp3 player setting doesn't work for you, set an mp3 player in the options dialog.
  %e Click on "</c>mp3stuff > More options > View Readme<c>" in the popup for help and to see the newest changes.
  %e Please report all bugs to </c>a_s_d@snet.net<c>
  .ial on
  if ($script(mp3stuf1.mrc)) {
    .unload -rs " $+ $ifmatch $+ "
    .remove " $+ $ifmatch $+ "
  }

  ;fixes for when updating from previous versions
  var %f = $f(pre), %@ = @mp3stuff_fix
  if ($lines(%f)) {
    window -hl %@
    loadbuf %@ %f
    var %x = $line(%@,0)
    while (%x) {
      rline %@ %x $replace($line(%@,%x),<time>,<length>,<mp3count>,<mp3 count>)
      dec %x
    }
    savebuf %@ %f
    close -@ %@
  }
  ;update variable names
  var %old = t c0 c1 c2 c3 c4 b ampnoecho lecho pq uq uslots qrq rl rp at sa desk ontop cstart l p a cl
  var %new = tab custom0 custom1 custom2 custom3 custom4 bullet local_echo local_echo stop user_queues user_slots query_request local_color public_color ad_time site_ad c_desktop c_ontop c_start p_l p_p p_a serv_only_to
  %x = $numtok(%old,32)
  while (%x) {
    var %var = $gettok(%old,%x,32)
    if (* iswm %mp3stuff [ $+ [ %var ] ] ) {
      if (%var isin l p a) t 0 %var
      %mp3stuff [ $+ [ $gettok(%new,%x,32) ] ] = %mp3stuff [ $+ [ %var ] ]
      unset %mp3stuff [ $+ [ %var ] ]
    }
    dec %x
  }
  %mp3stuffcustom2 = $replace(%mp3stuffcustom2,<time>,<length>,<mp3count>,<mp3 count>)
  %mp3stuffcustom3 = $replace(%mp3stuffcustom3,<time>,<length>,<mp3count>,<mp3 count>)
  %mp3stuffcustom4 = $replace(%mp3stuffcustom4,<mp3count>,<mp3 count>)
}
alias -l oldversion {
  if ($version < 5.71) {
    echo $colour(i) -ai *** mp3stuff requires mIRC v5.71 or higher:  $+ $colour(h) $+ www.mirc.com
    if ($?!="You need mIRC v5.71 to use mp3stuff.") .timer -o 1 0 run http://www.mirc.com/
    unload -rs mp3stuff.mrc
    halt
  }
}
alias mp3quote {
  if ($2- = $null) { halt }
  else { write utilities/mp3stuff/mp3quote.txt $1- }
}
alias -l startup {
  oldversion
  var %this = $script, %x = $script(0)
  while (%x) {
    var %that = $script(%x)
    if ($shortfn(%this) == $shortfn(%that)) && (%this != %that) .unload -rs " $+ %that $+ "
    dec %x
  }
  if (%mp3stuffad) && ($1 != 1) ad
  if (%mp3stuffc_start) mp3stuffc
  var %t = site_ad cache check showctcp install listening once playlist public_color slots user_slots _ query_request d_desktop p_l p_p p_a p_next
  while ($numtok(%t,32)) {
    if (%mp3stuff [ $+ [ $gettok(%t,1,32) ] ] !isnum) {
      t $gettok(%t,1,32) 1
      if (check * iswm %t) && ($version >= 5.8) t player mIRC
    }
    %t = $deltok(%t,1,32)
  }
  if (* !iswm %mp3stuffzipcmd) t zipcmd $winzip
  t mi %mp3stuffmi
  if (* !iswm %mp3stuffbullet) {
    t bullet ×
    _editbox bullet
  }
  if (%mp3stuffuse_dur) && ($isalias(%mp3stuffdur) == $false) %mp3stuffuse_dur = 0
  if (ircn isin %iver) && (* !iswm %mp3stuffp_menus) %mp3stuffp_menus = 3
  if (* !iswm %mp3stuffcustom0) custom0 1 $custom0
  if (* !iswm %mp3stuffcustom1) custom1 1 $custom1
  if (* !iswm %mp3stuffcustom2) custom2 1 $custom2
  if (* !iswm %mp3stuffcustom3) custom3 1 $custom3
  if (* !iswm %mp3stuffcustom4) custom4 1 $custom4
  if (%mp3stuffhistory !isnum 1-) t history 200
  if (%mp3stuff/c !isnum 0-15) t /c $colour(no)
  if ($calc(+%mp3stuffad_time) < 1) t ad_time 10
  if (%mp3stuffuser_queues !isnum) t user_queues 2
  if (%mp3stuffqueues !isnum) t queues 5
  if (%mp3stuffcheck) check 1 $1
  var %a = $f(adr), %x = $lines(%a), %l, %q = $f(fq)
  while (%x) && ($isfile(%q)) {
    %l = $read -l $+ %x %a
    if (* !iswm $read -w" $+ $gettok(%l,1,32) *" %q) write -dl $+ %x %a
    dec %x
  }
}
alias -l dflags {
  if (%mp3stuffd_desktop) {
    if (%mp3stuffd_ontop) return -dmo $+ $1-
    return -dm $+ $1-
  }
  return -m $+ $1-
}
alias -l n
alias -l f return $shortfn($scriptdir) $+ mp3stuff. $+ $1
alias -l fn {
  if (* iswm $1) {
    var %r = " $+ $replace($1-,$chr(32),?,\?,\:,??,*,?,$chr(32),*,*?,*,$chr(32),\:,\?)
    if (" * iswm %r) return ? $+ $right(%r,-2)
    return $right(%r,-1)
  }
}
;sfn = win2k fix for double spaces
alias -l sfn return $shortfn($replace($1-,?,$chr(32)))
alias -l _echo {
  var %e = <c> $+ $iif($len(%mp3stuffbullet),%mp3stuffbullet,×) $+ <c>
  if ($isid) return __echo $iif($1,$1,-ai) $iif($2,$chr(32),%e)
  __echo -ai %e $1-
}
alias -l __echo echo $ad_tags(0,$1-)
alias -l _input {
  %mp3stufftemp = $1-
  return $dialog(mp3stuff_input,mp3stuff_input,-4)
}
alias -l alert {
  %mp3stufftemp = $1-
  return $dialog(mp3stuff_inputalert,mp3stuff_inputalert,-4)
}
alias -l min if ($1 < $2) return $calc(+$1) | return $calc(+$2)
alias -l max if ($1 > $2) return $calc(+$1) | return $calc(+$2)
alias -l 1b {
  if ($timer(mp3stuff1b)) halt
  else .timermp3stuff1b -o 1 0 return
}
alias -l 1b1 {
  if (%mp3stuffplayer == mIRC) return
  if ($timer(mp3stuff1b1)) halt
  enable/disable 1
  .timermp3stuff1b1 -om 1 2500 enable/disable
}
alias -l enable/disable {
  ;if (%mp3stuffplayer == mIRC) return
  if ($dialog(mp3stuffc)) did $iif($1,-b,-e) mp3stuffc 1,2,3,4,5,6,7,11,12,13
  if ($dialog(mp3stuffs)) {
    did $iif($1,-b,-e) mp3stuffs 1,8,9,10,11,12,13,14,15,16,20,21,22,23,30,32,33,34,35,40,41,43,44,45,51,52,53,54,55,60,61,62,63,64,65,66,67,68,101,102
    if ($1) did -b mp3stuffs 50,31,17,18
    else {
      stab
      if ($len($current_dir) > 3) did -e mp3stuffs 50
      if (?:* iswm $did(mp3stuffs,31,1)) did -e mp3stuffs 31
    }
  }
}
;playchoose
alias -l pc {
  t play 1
  if ($len($1)) t playto $1
  fix_playto
  stuff 5
}
;playrandom
alias -l pr {
  1b1
  t play 1
  if ($len($1)) t playto $1
  fix_playto
  random_mp3
  enqueue 1 $2-
}
;listenchoose
alias -l lc {
  t play
  stuff 5
}
;listenrandom
alias -l lr {
  1b1
  random_mp3
  enqueue 0 $1-
}
alias -l adv next
alias -l next {
  if ($pq_length) {
    var %pq = $f(pq)
    1b1
    :n
    var %pq_length = $pq_length, %mp3num = $iif(%mp3stuffshuf,$rand(1,%pq_length),1), %mp3, %cont = 1
    if ($dialog(mp3stuffs)) {
      %mp3 = $did(mp3stuffs,41,%mp3num)
      did -d mp3stuffs 41 %mp3num
    }
    else {
      %mp3 = $read -l $+ %mp3num %pq
      write -dl $+ %mp3num %pq
    }
    dec %pq_length
    setmp3 %mp3
    if (%mp3stuffmp3) && (%pq_length < 1) && (%mp3stuffstop) %cont = 0
    if ($find_location(%mp3stuffmp3)) {
      open $play %cont
      return
    }
    elseif (%pq_length) goto n
    elseif (%cont == 0) {
      cont 0
      return
    }
  }
  if ($play) pr $playto 1 0
  elseif (%mp3stuffmute) cont 0
  else lr 1 0
}
alias -l focus if ($appactive) && ($appstate !isin trayminimized) && ($dialog(mp3stuffc).active) .timermp3stufffocus -o 1 0 showmirc -s
alias -l qecho {
  if (%mp3stufflocal_echo != 1) return
  var %a = $_echo($iif(%mp3stuffst,-s)) Queued, %c
  if ($isfile($sfn(%mp3stuffmp3))) %c = $nopath(%mp3stuffmp3)
  else %c = $instok(%mp3stuffmp3,$chr(32),0,92)
  var %b = [</c> $+ %c $+ <c>]</c>
  if ($1 == 1) %a %b
  else %a $1 files from %b
}
alias -l playing {
  if (%mp3stuffplayer == mIRC) {
    if ($inmp3) return 1
    return 0
  }
  if ($timer(mp3stuffnext)) return 1
  return 0
}
alias -l enqueue {
  if (%mp3stuffmp3) {
    find_location %mp3stuffmp3
    if ($playing) && (%mp3stuffenq) && ($3 != 0) || ($3) {
      var %y = $add_file(41,pq)
      if ($prop == e) qecho %y
      .timermp3stuff1b1 -e
      cont $2
      return %y
    }
    else open $1-
  }
}
alias -l list_contents {
  var %@ = @mp3stuffcontents, %d = @mp3stuffwd, %f = $sfn(%mp3stuffmp3)
  close -@ %@ %d
  window -hl %@
  if ($isfile(%f)) {
    filter -fwx %f %@ #extinf:*
    filter -wwc %@ %@ *.mp3
  }
  else {
    window -hls %d
    n $findfile(%mp3stuffmp3,*.mp3,%d)
    filter -ww %d %@
    close -@ %d
  }
}
alias -l open {
  if (%mp3stuffmp3) {
    if ($2 isnum) cont $2
    if ($1) {
      t last %mp3stuffmp3
      if ($spam) {
        history_add
        if (%mp3stuffmute != 1) $run_mp3
        mtimer
        return
      }
      if (%mp3stuffmute) {
        cont 0
        return
      }
    }
    history_add
    $run_mp3
    if (%mp3stufflocal_echo) echo $iif(%mp3stuffst,-si,-ai) $all_tags(0,$iif(%mp3stuffcustom2,%mp3stuffcustom2,$custom2))
    mtimer
  }
}
alias -l run_mp3 {
  var %m = $find_location(%mp3stuffmp3)
  .timer -om 1 2500 if (* !iswm $!timer(mp3stuff1b1) ) enable/disable
  if ($isfile($sfn(%m)) != $true) || (*.mp3 !iswm %m) return return
  if (%mp3stuff.length !isnum 1-) {
    _echo Error finding song length (could be a corrupt mp3): " $+ %m $+ " ( $+ %mp3stuff.bytes bytes)
    if ($cont) {
      if (%mp3stuffplayer == mIRC) next
      else .timercorruptmp3 1 2 mtimer_
      return return
    }
  }
  if (%mp3stuffplayer != mIRC) || ($version < 5.8) && (%mp3stuffplayer) && ($isfile($sfn(%mp3stuffplayer)) != $true) {
    _echo mp3 player does not exist: " $+ %mp3stuffplayer $+ "; switching to default.
    t player
  }
  if ($version >= 6) .signal mp3start
  if (%mp3stuffplayer == mIRC) $iif($script(stuffamp.mrc),stuffamp) splay -p $sfn(%m)
  else {
    var %f = $sfn(%mp3stuffplayer)
    run -n $iif($isfile(%f),%f) $sfn(%m)
  }
  return n
}
alias -l history_add {
  t last %mp3stuffmp3
  if (%mp3stuffmp3) {
    var %h = $f(hst), %d = $dialog(mp3stuffs)
    t history $max(1,%mp3stuffhistory)
    if (%d) {
      did -i %d 21 1 %mp3stuffmp3
      if ($version == 5.71) {
        var %x = $did(%d,21).lines
        while (%x > %mp3stuffhistory) {
          did -d %d 21 %x
          dec %x
        }
      }
      else filter -rioc 1- $+ %mp3stuffhistory %d 21 %d 21
      did -z %d 21
    }
    else {
      write -il1 %h %mp3stuffmp3
      filter -rffc 1- $+ %mp3stuffhistory %h %h
    }
  }
}
alias -l lastmp3 {
  if ($dialog(mp3stuffs)) {
    var %n = $did(mp3stuffs,21).lines, %m = $did(mp3stuffs,21,1)
    did -dz mp3stuffs 21 1
    return %m
  }
  var %f = $f(hst), %n = $calc(+$lines(%f))
  write %f
  var %m = $read -l1 %f
  write -dl1 %f
  return %m
}
alias -l prev {
  var %d = $dialog(mp3stuffs)
  var %lastmp3 = $lastmp3
  if (%lastmp3) {
    if (%d) did -iz %d 41 1 %lastmp3
    else {
      var %q = $f(pq)
      write -il1 %q %lastmp3
    }
  }
  setmp3 $lastmp3
  open 0
}
alias -l pq_length {
  if ($dialog(mp3stuffs)) return $did($ifmatch,41).lines
  var %f = $f(pq)
  write %f
  return $calc(+$lines(%f))
}
alias -l add_file {
  var %m = %mp3stuffmp3, %n = $nofile(%m), %@ = @mp3stuffcontents, %l, %x = 1, %y, %d = $dialog(mp3stuffs)
  if (* !iswm %d $2) return
  if (%d) did -h %d $1
  if (*3 iswm %m) && ($isfile($sfn(%m))) {
    %y = 1
    if (%d) did -a %d $1 %m
    else write $f($2) %m
  }
  elseif ($exists(%m)) {
    list_contents
    %y = $line(%@,0)
    if (%d) {
      while (%x <= %y) {
        %l = $fn($replace($line(%@,%x),$chr(32),?))
        if (?:* iswm %l) did -a %d $1 %l
        else did -a %d $1 %n $+ %l
        inc %x
      }
    }
    else {
      while (%x <= %y) {
        %l = $fn($replace($line(%@,%x),$chr(32),?))
        if (?:* iswm %l) rline %@ %x %l
        else rline %@ %x %n $+ %l
        inc %x
      }
    }
    if (* !iswm %d) savebuf -a %@ $f($2)
    close -@ %@
  }
  if (%d) did -vz %d $1
  return %y
}
alias -l spam {
  if (%mp3stufflast) {
    setmp3 $ifmatch
    var %n = $playto_chans
    if (%n) && ($server) {
      if ($isid) && (%mp3stuffctcp) $iif(%mp3stuffshowctcp,ctcp,.ctcp) %n mp3 $nopath(%mp3stuffmp3)
      if ($window($gettok($1,1,44))) %n = $1-
      while (%n) {
        $iif(%mp3stuffact,describe,msg) $gettok(%n,1,44) $all_tags(1,$iif(%mp3stuffcustom3,%mp3stuffcustom3,$custom3))
        %n = $deltok(%n,1,44)
      }
      return 1
    }
  }
  elseif ($timer(mp3stuff1b1)) .timermp3stuff1b1 -e
}
alias -l playto return $deltok($remove(%mp3stuffplayto,$chr(32)),0,44)
alias -l playto_chans {
  var %n, %t, %x = 1, %p = $playto, %a = $iif($chan(0) || $query(0) && %p == all || * !iswm %p,1)
  while (%x <= $iif(%a,$iif($chan(0),$chan(0),$query(0)),$numtok(%p,44))) {
    %t = $iif(%a,$iif($chan(0),$chan(%x),$query(%x)),$gettok(%p,%x,44))
    if (#* iswm %t) && (%t ischan) || ($query(%t)) %n = $addtok(%n,%t,44)
    inc %x
  }
  return %n
}
on *:disconnect:.timer -o 1 0 ad
alias -l ad {
  if (%mp3stuffad) .timermp3stuffad -om 1 $calc(60000*$max(1,%mp3stuffad_time)) mp3stuff ad
  if ($len($1)) t playto $1
  var %first = 1, %ok
  :start
  var %n = $playto_chans, %t
  while (%n) && ($server) {
    %t = $gettok(%n,1,44)
    if (%mp3stuffserv_only_to != 1) || ($istok(%mp3stuffserv,%t,32)) || (%ok) && (%t ischan) {
      %first = 0
      msg %t $ad_tags(1,$iif($len(%mp3stuffcustom4) > 6,%mp3stuffcustom4,$custom4))
    }
    %n = $deltok(%n,1,44)
  }
  if (%first) && (%mp3stuffserv_only_to) {
    %first = 0
    %ok = 1
    goto start
  }
}
alias -l available {
  var %n = $numtok(%mp3stuffexclude,124), %f = $sfn(%mp3stuffmp3)
  while (%n) {
    if ($sfn($exclude(%n)) isin %f) return
    dec %n
  }
  %n = $numtok(%mp3stuffdirs,124)
  while (%n) {
    if ($sfn($directory(%n)) isin %f) return 1
    dec %n
  }
}
alias -l all_tags {
  set %mp3.quotex $read(utilities/mp3stuff/mp3quote.txt)
  set %mp3.tips $read(utilities/mp3stuff/mp3tips.txt)
  var %n = $nopath(%mp3stuffmp3), %m
  if (%mp3stuff_) %n = $fn($replace(%n,_,?))
  if (%mp3stuffautosend) && ($available) %m = ! $+ $me %n
  elseif (%mp3stuff!nickmp3) %m = %n
  else %m = $left(%n,-4)
  var %f = %mp3stuffmp3, %r = $ad_tags($1,$replace($2-,<!nickmp3>,%m,<mp3>,%n,<mp3noext>,$left(%n,-4),<size>,%mp3stuff.size,<length>,%mp3stuff.lengthtxt,<kbps>,%mp3stuff.kbps,<khz>,%mp3stuff.khz,<stereo>,%mp3stuff.stereo,<quote>,%mp3.quotex,<tips>,%mp3.tips))
  if ($version >= 5.8) %r = $replace(%r,<album>,$mp3(%f).album,<title>,$mp3(%f).title,<artist>,$mp3(%f).artist,<year>,$mp3(%f).year,<comment>,$mp3(%f).comment,<genre>,$mp3(%f).genre,<track>,$mp3(%f).track,<quote>,%mp3.quotex,<tips>,%mp3.tips)
  return %r
}
alias -l ad_tags {
  set %mp3.quotex $read(utilities/mp3stuff/mp3quote.txt)
  set %mp3.tips $read(utilities/mp3stuff/mp3tips.txt)
  var %n =  $+ $iif(%mp3stuff/c isnum 0-15,%mp3stuff/c,$colour(no)) $+ , %used_queues = $min(%mp3stuffqueues,$lines($f(fq))), %x = $2-
  if (<c> isin %x) {
    if ($1 == 1) || (%mp3stuffpublic_color) %x = $replace(%x,<c>,$ct($1))
    else %x = $remove(%x,<c>)
  }
  %x = $replace(%x,</c>,$iif($1,99,%n),<nick>,$iif(%mp3stuffnick,%mp3stuffnick,$me),<slots>,%mp3stuffslots,<open queues>,$calc(%mp3stuffqueues - %used_queues),<used queues>,%used_queues,<queues>,%mp3stuffqueues,<quote>,%mp3.quotex,<tips>,%mp3.tips)
  if (<used slots> isin %x) %x = $replace(%x,<used slots>,$min($used_slots,%mp3stuffslots))
  if (<open slots> isin %x) %x = $replace(%x,<open slots>,$slots)
  if (<list size> isin %x) %x = $replace(%x,<list size>,$mb($list_size))
  if (<list count> isin %x) %x = $replace(%x,<list count>,$list_count)
  if (<mp3 count> isin %x) %x = $replace(%x,<mp3 count>,$mp3count(1))
  if (<date> isin %x) %x = $replace(%x,<date>,$left($right($list,16),10))
  if (<version> isin %x) %x = $replace(%x,<version>,$mp3stuffversion(1))
  if (<quote> isin %x) %x = $replace(%x,<quote>,%mp3.quotex)
  if (<tips> isin %x) %x = $replace(%x,<tips>,%mp3.tips)
  return %x
}
alias -l ct {
  if ($1) tokenize 32 custom1 public_color
  else tokenize 32 custom0 local_color
  if ($len(%mp3stuff [ $+ [ $1 ] ] )) var %c = %mp3stuff [ $+ [ $1 ] ]
  else var %c = $mp3stuff($1)
  return  $+ $iif(%mp3stuff [ $+ [ $2 ] ] ,$calc(+$gettok(%c,$rand(1,$numtok(%c,44)),44)),$colour(i)) $+ 
}
alias -l find_location {
  var %m = $1-
  if ($exists($sfn(%m))) return %m
  t cachedirs
  findmp3 $nopath(%m)
  if ($findmp3) {
    setmp3 $findmp3($rand(1,$findmp3))
    findmp3
    return %mp3stuffmp3
  }
  findmp3
  return 0
}
alias -l directory return $instok($gettok(%mp3stuffdirs,$1,124),$chr(32),0,92)
alias -l exclude return $instok($gettok(%mp3stuffexclude,$1,124),$chr(32),0,92)
alias -l mp3count {
  if ($1) && (%mp3stuffc) return %mp3stuffc
  %mp3stuffc = $file_count(*.mp3)
  return %mp3stuffc
}
alias -l total_count {
  if ($1) && (%mp3stufftotal) return %mp3stufftotal
  %mp3stufftotal = $file_count(%mp3stufftypes)
  return %mp3stufftotal
}
alias -l file_count {
  while ($check_dirs) { }
  var %y = $numtok($1-,124), %n = $numtok(%mp3stuffdirs,124)
  while (%y) {
    var %x = %n, %c = 0, %type = $gettok($1-,%y,124)
    while (%x) {
      inc %c $findfile($sfn($gettok(%mp3stuffdirs,%x,124)),%type,0)
      dec %x
    }
    dec %y
  }
  ;subtract files in excluded dir if excluded dir is subdir of search dir
  var %ex = $numtok(%mp3stuffexclude,124)
  while (%ex) {
    ;compare to search dirs
    var %x = %n, %go = 0, %exdir = $sfn($gettok(%mp3stuffexclude,%ex,124))
    while (%x) && (%go == 0) {
      if ($sfn($gettok(%mp3stuffdirs,%x,124)) isin %exdir) %go = 1
      dec %x
    }
    if (%go == 1) {
      ;loop through file types
      %y = $numtok($1-,124)
      while (%y) {
        dec %c $findfile(%exdir,%type,0)
        dec %y
      }
    }
    dec %ex
  }    
  return %c
}
alias -l random_mp3 {
  var %pl0 = $f(pl0), %pl1 = $f(pl1), %mp3stuffs = $dialog(mp3stuffs), %mp3
  if (%mp3stuffs) {
    if ($pinit) var %pl_ready = $did(mp3stuffs,61).lines
    else %mp3stuffs =
  }
  if (%mp3stuffs != mp3stuffs) var %pl_ready = $file(%pl0).size + $file(%pl1).size
  if (%pl_ready) && (%mp3stuffplaylist) {
    if (* !iswm %mp3stuffs) {
      close -@ @mp3stuff0 @mp3stuff1
      window -hl @mp3stuff0
      window -hl @mp3stuff1
      write %pl0
      write %pl1
      filter -fw %pl1 @mp3stuff1
      filter -fw %pl0 @mp3stuff0
    }
    while (* !iswm %mp3) {
      if (%mp3stuffs) {
        var %total = $did(mp3stuffs,61).lines, %unplayed = 0, %n = $did(mp3stuffs,61).lines
        if (%mp3stuffonce) {
          while (%n) {
            if (*3 iswm $did(mp3stuffs,61,%n)) inc %unplayed
            dec %n
          }
        }
        else %unplayed = %total
      }
      else var %unplayed = $line(@mp3stuff0,0), %total = %unplayed + $line(@mp3stuff1,0)
      if (%mp3stuffonce) && (%unplayed < 1) || (%total < 1) {
        if (%mp3stuffs) {
          var %n = %total
          while (%n) {
            did -o mp3stuffs 61 %n $left($did(mp3stuffs,61,%n),-2)
            dec %n
          }
        }
        else {
          savebuf @mp3stuff0 %pl0
          savebuf -a @mp3stuff1 %pl0
          write -c %pl1
        }
        if (%mp3stuffplcont != 1) || (%total < 1) {
          if (%mp3stufflocal_echo) $_echo($iif(%mp3stuffst,-s)) End of playlist.
          cont 0
          setmp3
          close -@ @mp3stuff0 @mp3stuff1
          return
        }
        if (%mp3stufflocal_echo) $_echo($iif(%mp3stuffst,-s)) Restarted playlist.
        filter -ww @mp3stuff1 @mp3stuff0
        filter -wwcx @mp3stuff1 @mp3stuff1
      }
      var %mp3num = $rand(1,$iif(%mp3stuffonce,%unplayed,%total))
      if (%mp3stuffs) {
        if (%mp3stuffonce) {
          ;find the %mp3num-th unplayed mp3
          var %n = 1, %line = 1
          while (%n < %mp3num) {
            ; if (%line is unplayed) inc %n
            if (*3 iswm $did(mp3stuffs,61,%line)) inc %n
            inc %line
          }
          ;store the correct line for the %mp3num-th unplayed mp3 into %mp3num
          %mp3num = %line
        }
        %mp3 = $did(mp3stuffs,61,%mp3num)
        did -d mp3stuffs 61 %mp3num
        if (*  iswm %mp3) %mp3 = $left(%mp3,-2)
      }
      else {
        if (%mp3num > %unplayed) {
          var %@ = @mp3stuff1
          dec %mp3num %unplayed
        }
        else var %@ = @mp3stuff0
        %mp3 = $line(%@,%mp3num)
        dline %@ %mp3num
      }
      %mp3 = $find_location(%mp3)
      if (%mp3) {
        if (%mp3stuffs) did -az mp3stuffs 61 %mp3  
        else aline @mp3stuff1 %mp3
      }
    }
    if (* !iswm %mp3stuffs) {
      savebuf @mp3stuff0 %pl0
      savebuf @mp3stuff1 %pl1
    }
    setmp3 %mp3
    %mp3stuffc =
    close -@ @mp3stuff0 @mp3stuff1
    return
  }
  :dirs
  while ($check_dirs) { }
  var %counts, %n = $numtok(%mp3stuffdirs,124), %tempcount, %e = $numtok(%mp3stuffexclude,124), %y, %dir1, %dir2
  while (%n) {
    %dir1 = $sfn($gettok(%mp3stuffdirs,%n,124))
    %tempcount = $findfile(%dir1,*.mp3,0) %counts
    %y = %e
    while (%y) {
      %dir2 = $sfn($gettok(%mp3stuffexclude,%n,124))
      if (%dir1 isin %dir2) dec %tempcount $findfile(%dir2,*.mp3,0)
      dec %y
    }
    %counts = %tempcount %counts
    dec %n
  }
  var %total = $calc(+$replace(%counts,$chr(32),+))
  %mp3stuffc = %total
  if (%total < 1) {
    _echo No mp3s found
    var %dirs = %mp3stuffdirs
    dir_cmd add_dir
    if (%dirs != %mp3stuffdirs) goto dirs
    return 0
  }
  %mp3stuff.length = 0
  close -@ @mp3stuff0
  window -hl @mp3stuff0
  while (%mp3stuff.length !isnum 1-) {
    var %mp3num = $calc(1 + ($rand(1,%total) + $ticks) % %total), %dirnum = 0, %dirstart = 0, %searching = 0
    while (%mp3num > %searching) {
      %dirstart = %searching
      inc %dirnum
      inc %searching $gettok(%counts,%dirnum,32)
    }
    %dir1 = $sfn($gettok(%mp3stuffdirs,%dirnum,124))
    filter -wwcx @mp3stuff0 @mp3stuff0
    %y = $findfile(%dir1,*.mp3,@mp3stuff0)
    %y = %e
    while (%y) {
      %dir2 = $gettok(%mp3stuffexclude,%y,124)
      if (%dir1 isin $sfn(%dir2)) filter -wwxc @mp3stuff0 @mp3stuff0 %dir2 $+ *
      dec %y
    }
    setmp3 $fn($replace($line(@mp3stuff0,$calc(%mp3num - %dirstart)),$chr(32),?))
  }
  close -@ @mp3stuff0
}
alias -l fix_types {
  if (* !iswm %mp3stufftypes) %mp3stufftypes = *.mp3
  var %temp = %mp3stufftypes
  :start
  var %x = 1, %n = $numtok(%mp3stufftypes,124)
  while (%x <= %n) {
    var %y = 1
    while (%y <= %n) {
      if (%x != %y) && ($gettok(%mp3stufftypes,%x,124) iswm $gettok(%mp3stufftypes,%y,124)) {
        t types $deltok(%mp3stufftypes,%y,124)
        goto start
      }
      inc %y
    }
    inc %x
  }
  if ($1) || (%temp != %mp3stufftypes) && ($dialog(mp3stuffo)) {
    did -r mp3stuffo 209
    didtok mp3stuffo 209 124 %mp3stufftypes
    did -z mp3stuffo 209
  }
}
alias -l fix_dirs {
  var %temp = %mp3stuffdirs, %tempex = %mp3stuffexclude
  :startex
  var %x = 1, %e = $numtok(%mp3stuffexclude,124)
  while (%x <= %e) {
    var %y = 1, %dirx = $exclude(%x)
    while (%y <= %e) {
      if (%x != %y) && (%dirx isin $exclude(%y)) {
        %mp3stuffexclude = $deltok(%mp3stuffexclude,%y,124)
        goto startex
      }
      inc %y
    }
    inc %x
  }
  :start
  var %x = 1, %n = $numtok(%mp3stuffdirs,124), %e = $numtok(%mp3stuffexclude,124)
  while (%x <= %n) {
    var %y = 1, %dirx = $directory(%x)
    while (%y <= %n) {
      if (%x != %y) && (%dirx isin $directory(%y)) {
        %mp3stuffdirs = $deltok(%mp3stuffdirs,%y,124)
        goto start
      }
      inc %y
    }
    %y = 1
    while (%y <= %e) {
      if ($exclude(%y) isin %dirx) {
        %mp3stuffdirs = $deltok(%mp3stuffdirs,%x,124)
        goto start
      }
      inc %y
    }
    inc %x
  }
  if ($1) || (%temp != %mp3stuffdirs) || (%tempex != %mp3stuffexclude) && ($dialog(mp3stuffo)) {
    did -r mp3stuffo 241
    didtok mp3stuffo 241 124 %mp3stuffdirs
    did -z mp3stuffo 241
    did -r mp3stuffo 227
    didtok mp3stuffo 227 124 %mp3stuffexclude
    did -z mp3stuffo 227
  }
}
alias -l check_dirs {
  fix_dirs
  if ($numtok(%mp3stuffdirs,124)) return
  _echo You need to set a search directory
  dir_cmd add_dir
  if ($numtok(%mp3stuffdirs,124)) return 1
  halt
}
alias -l mtimer {
  if (%mp3stuffplayer == mIRC) return
  .timermp3stuffnext -om 1 $calc(1000*(2+%mp3stuff.length)) mp3stuff mtimer_
}
alias -l mtimer_ {
  .timermp3stuff1b1 -e
  .timermp3stuffnext off
  if (%mp3stuffplayer == mIRC) return
  if ($cont) next
}
on *:mp3end:if (%mp3stuffplayer == mIRC) if ($cont) next
alias -l t {
  if (* !iswm $1) return
  var %r
  if ($1) {
    %r = $2-
    %mp3stuff [ $+ [ $1 ] ] = %r
    if ($1 == mp3) mp3stuff t bin
    if ($istok(mp3 bin custom0 custom1 custom2 custom3 custom4 bullet note zipcmd,$1,32)) return
  }
  else {
    tokenize 32 $2-
    if (%mp3stuff [ $+ [ $1 ] ] ) %r = 0
    else %r = 1
    %mp3stuff [ $+ [ $1 ] ] = %r
    if ($1 == ad) {
      if (%r) ad
      else .timermp3stuffad off
    }
  }
  i $1
  if ($1 == play) fix_play
  _editbox $1
  if ($istok(c_desktop c_ontop,$1,32)) $1
  if ($istok(d_desktop d_ontop,$1,32)) {
    var %dialogs = mp3stuff_tags mp3stuffq mp3stuffs mp3stuffo
    while (%dialogs) {
      var %temp = $gettok(%dialogs,1,32)
      if ($dialog(%temp)) {
        if ($1 == d_desktop) {
          if (%temp == mp3stuffo) {
            dialog -x %temp
            %temp
          }
          else dialog -c %temp
        }
        else dialog $iif(%r,-o,-n) %temp
      }
      %dialogs = $deltok(%dialogs,1,32)
    }
  }
  if ($1 == autosend) fix_queue
  if ($1 == dirs) || ($1 == exclude) fix_dirs 1
  if ($1 == types) fix_types 1
  if ($1 == stop) check/uncheck %r mp3stuffs 44
  if ($1 == shuf) check/uncheck %r mp3stuffs 45
  if ($1 == cont) $1 %r
  if ($1 == enq) check/uncheck %r mp3stuffs 14
  if ($1 == mute) {
    check/uncheck %r mp3stuffs 15
    check/uncheck %r mp3stuffc 6
  }
  if ($1 == new) && ($dialog(mp3stuffo)) {
    if (%r) && (\ $v \ != \ %r \) did -o mp3stuffo 262 1 New: [[ $+ %r $+ ]]
    else did -o mp3stuffo 262 1 No new version
  }
  if ($1 == mi) {
    if (%r !isnum 1-9) %r = 4
    %mp3stuffmi = %r
    if ($dialog(mp3stuffo)) did -o mp3stuffo 340 1 %r
  }
}
alias -l check/uncheck {
  if ($dialog($2)) && ($3) {
    if ($1) did -c $2-
    else did -u $2-
  }
}
alias -l fix_playto {
  var %pt = $playto, %c = $iif(%pt,-o,-r)
  if ($dialog(mp3stuffc)) did %c mp3stuffc 13 1 %pt
  if ($dialog(mp3stuffs)) did %c mp3stuffs 13 1 %pt
  fix_play
}
alias -l fix_play {
  var %c = $iif(%mp3stuffplay && $playto,-c,-u)
  if ($dialog(mp3stuffc)) did %c mp3stuffc 12
  if ($dialog(mp3stuffs)) did %c mp3stuffs 12
}
alias -l c_ontop {
  if ($dialog(mp3stuffc)) {
    dialog $iif(%mp3stuffc_ontop,-o,-n) mp3stuffc
    fix_playto
    return $mp3stuffc
  }
}
alias -l c_desktop {
  if ($dialog(mp3stuffc)) {
    .timer -o 1 0 n $!mp3stuffc($dialog(mp3stuffc).x,$dialog(mp3stuffc).y)
    dialog -x mp3stuffc
    if ($dialog(mp3stuffo) == $dname) dialog -o mp3stuffo
  }
}
alias -l setmp3 {
  %mp3stuffmp3 = $deltok($fn($1-),0,92)
  bin
}
alias -l bin {
  var %v, %c, %bin, %t, %r = 0, %d = $f(dat), %f = $replace($sfn(%mp3stuffmp3),$chr(32),?), %s = $file(%f).size
  if ($isfile(%f)) && (*.mp3 iswm %f) { }
  else {
    %mp3stuff.info1 = $mb(%s)
    %mp3stuff.info = %mp3stuff.info1 ( $+ %s bytes)
    return
  }
  if (* !iswm $1) && (%mp3stuffcache) {
    if ($isfile(%d)) {
      %t = $read -w" $+ $nopath(%f) %s *" %d
      if ($len($gettok(%t,3,32)) == 15) {
        %bin = $gettok(%t,3,32)
        %v = $gettok(%t,4,32)
        goto done
      }
    }
  }
  %c = 1
  :r
  if (%r > %s) return
  bread %f %r 4096 &x
  var %x = 1
  if ($bfind(&x,%x,Xing)) var %v = $get4(&x,$ifmatch,8), %x = 112 + $ifmatch
  :f
  %x = 1 + $bfind(&x,%x,255)
  if (%x !isnum 2-4096) {
    inc %r 4095
    goto r
  }
  %t = $calc(+$bvar(&x,%x))
  if (%t isnum 224-231) || (%t > 239) { }
  else goto f
  var %bin, %y = 0
  while (%y < 3) {
    %t = $base($bvar(&x,$calc(%x +%y)),10,2,8)
    if (2 == %y) && (*00 !iswm %t) || (0 *00? iswm %y %t) || (1 1111 isin %y %t) || (1 0000 isin %y %t) || (1 *11?? iswm %y %t) goto f
    %bin = %bin $+ %t
    inc %y
  }
  %bin = $mid(%bin,4,15)
  if (%mp3stuffcache) && (%c) && (%bin) && (%s) write -il1 %d $nopath(%f) %s %bin %v
  :done
  %mp3stuffbin = %bin %v
  %mp3stuff.bytes = %s
  %mp3stuff.size = $mb(%s)
  %mp3stuff.stereo = $replace($mid(%bin,14,2),00,stereo,01,$iif(%mp3stuffstereo,stereo,joint stereo),10,stereo,11,mono)
  %mp3stuff.layer = $calc(4-$base($mid(%bin,3,2),2,10))
  %mp3stuff.mpeg = $replace($left(%bin,2),11,1.0,10,2.0,00,2.5)
  if (%v) {
    var %t = $gettok($iif(%mp3stuff.mpeg > 1,192 576 576,384 1152 1152),%mp3stuff.layer,32)
    %t = $calc(%t *%v /1000/%mp3stuff.khz)
    %mp3stuff.kbps = $int($calc(.008*%s /%t)) $+ kbps(vbr)
  }
  else {
    var %l = %mp3stuff.layer, %k = $base($mid(%bin,6,4),2,10)
    if (%mp3stuff.mpeg == 1) {
      if (%l == 1) %k = 32 * %k
      elseif (%l == 2) %k = $gettok(32 48 56 64 80 96 112 128 160 192 224 256 320 384,%k,32)
      elseif (%l == 3) %k = $gettok(32 40 48 56 64 80 96 112 128 160 192 224 256 320,%k,32)
    }
    else {
      if (%l == 1) %k = $gettok(32 48 56 64 80 96 112 128 144 160 176 192 224 256,%k,32)
      else %k = $gettok(8 16 24 32 40 48 56 64 80 96 112 128 144 160,%k,32)
    }
    if (%k isin 0 14) %k = 128
    %mp3stuff.kbps = %k $+ kbps
    var %t = $int($calc(%s /125/%k))
  }
  %mp3stuff.length = %t
  if (%mp3stuffuse_dur) && (%mp3stuffdur) %mp3stuff.lengthtxt = $ [ $+ [ %mp3stuffdur ] $+ ] (%t)
  elseif (%t > 3599) %mp3stuff.lengthtxt = $int($calc(%t /3600)) $+ : $+ $right($int($calc(100+%t /60 % 60)),2) $+ : $+ $right($int($calc(100+%t % 60)),2)
  else %mp3stuff.lengthtxt = $int($calc(%t / 60)) $+ : $+ $right($int($calc(100+%t % 60)),2)
  var %k = 1 + $base($mid(%bin,10,2),2,10)
  %k = $replace(%mp3stuff.mpeg,1.0,$gettok(44.1 48 32,%k,32),2.0,$gettok(22.05 24 16,%k,32),2.5,$gettok(11.025 12 8,%k,32))
  %mp3stuff.khz = $int(%k) $+ khz
  %mp3stuff.info1 = %mp3stuff.size %mp3stuff.lengthtxt %mp3stuff.kbps %mp3stuff.khz %mp3stuff.stereo
  %mp3stuff.info = %mp3stuff.info1 ( $+ %s bytes)
}
alias -l get4 {
  var %y = 0, %bin
  while (%y < 4) {
    %bin = %bin $+ $base($bvar($1,$calc($2 +$3 +%y)),10,2,8)
    inc %y
  }
  return $base(%bin,2,10)
}
alias -l mb {
  if ($1 > 102394) {
    if ($1 > 1048570751) var %x = 3
    else var %x = 2
  }
  else var %x = 1
  var %m = $round($calc($1 /1024^%x),2) * 100
  return $int($calc(%m /100)) $+ . $+ $right($int($calc(%m /10)),1) $+ $right($int(%m),1) $+ $gettok(kb mb gb,%x,32)
}
alias -l cont {
  if ($1 isnum) %mp3stuffcont = $1
  elseif ($dialog(mp3stuffc)) %mp3stuffcont = $did(mp3stuffc,5).state
  check/uncheck %mp3stuffcont mp3stuffc 5
  check/uncheck %mp3stuffcont mp3stuffs 16
  return %mp3stuffcont
}
alias -l play {
  if ($dialog(mp3stuffc)) t play $did(mp3stuffc,12).state
  return $calc(+%mp3stuffplay)
}
alias -l hide_playlist {
  did -h $$dialog(mp3stuffs) 61
  .timermp3stuffsp -o 1 0 did -zv $!$dialog(mp3stuffs) 61
}
alias -l wildcard {
  .timer -o 1 0 stuff 6
  if ($2) var %s = $2-
  else var %s = * $+ $_input($crlf,$iif($1,Add,Remove),all files containing what?,$crlf,(Use * or ? for all)) $+ *
  if (* !iswm $dialog(mp3stuffs)) {
    if (%s) .timer -o 1 0 wildcard $calc(+$1) %s
    return
  }
  if (%s == *$null*) || (%s == **) return
  hide_playlist
  if ($1) {
    findmp3 $replace(%s,$chr(32),*) $+ .mp3
    var %x = $findmp3
    while (%x) {
      did -a mp3stuffs 61 $findmp3(%x)
      dec %x
    }
    pl_fix
    findmp3
    return
  }
  var %x = $did(mp3stuffs,61).lines
  while (%x) {
    if ($replace(%s,$chr(32),*) iswm $did(mp3stuffs,61,%x)) did -d mp3stuffs 61 %x
    dec %x
  }
}
alias -l pl_fix {
  hide_playlist
  var %x = $did(mp3stuffs,61).lines - 1
  while (%x > 0) {
    if ($did(mp3stuffs,61,%x) $+ * iswm $did(mp3stuffs,61,$calc(1+%x))) did -d mp3stuffs 61 %x
    dec %x
  }
}
alias -l sl {
  var %x = $did(mp3stuffs,61).lines, %m, %p0 = $f(pl0), %p1 = $f(pl1)
  if ($1) {
    .timer -o 1 0 stuff 6
    var %f = $shortfn($scriptdir) $+ *.m3u, %f = $pick_file(%f,Save copy of playlist as...)
    if ($len(%f)) && (. !isin %f) %f = $instok(%f,m3u,0,46)
    if (* !iswm %f) return $stuff(6)
    if ($isfile(%f)) if ($?!="Overwrite existing file?" != $true) return
  }
  hide_playlist
  close -@ @mp3stuff0 @mp3stuff1
  window -hls @mp3stuff0
  window -hl @mp3stuff1
  if ($version == 5.71) {
    while (%x) {
      %m = $did(mp3stuffs,61,%x)
      if (*3 iswm %m) aline @mp3stuff0 %m
      else aline @mp3stuff1 $left(%m,-2)
      dec %x
    }
  }
  else {
    filter -iw mp3stuffs 61 @mp3stuff0 *3
    filter -iw mp3stuffs 61 @mp3stuff1 * 
    %x = $line(@mp3stuff1,0)
    while (%x) {
      rline @mp3stuff1 %x $left($line(@mp3stuff1,%x),-2)
      dec %x
    }
  }
  if ($1) {
    filter -ww @mp3stuff1 @mp3stuff0
    savebuf @mp3stuff0 " $+ %f $+ "
  }
  else {
    savebuf @mp3stuff0 %p0
    savebuf @mp3stuff1 %p1
  }
  close -@ @mp3stuff0 @mp3stuff1
}
alias -l winzip return winzip32.exe -min -a -ex <zip> <txt>
alias -l winace {
  .timer -o 1 0 mp3stuffo
  if ($findfile(c:\program files\winace\,winace.exe,1)) var %f = $ifmatch
  elseif ($findfile(c:\winace\,winace.exe,1)) var %f = $ifmatch
  else var %f = $pick_file(c:\,Where is WinAce?)
  if ($isfile(%f) != $true) return
  t zipcmd " $+ %f $+ " a <zip> <txt>
  _editbox zipcmd
}
alias -l not_making_list if (*mp3stuff.ini !iswm $mircini) return 1
alias -l list_size return $readini $f(ini) ident userid
alias -l list_count return $readini $f(ini) mirc nick
alias -l list {
  var %ctime = $ctime, %ini = $f(ini), %l = writeini %ini, %currentlist = " $+ $scriptdir $+ $readini %ini mirc anick $+ "
  if ($isid) return %currentlist
  check_dirs
  fix_types
  if (* !iswm %mp3stuffnick) %mp3stuffnick = $iif($me,$me,mp3stuff)
  var %list = $shortfn($scriptdir) $+ $replace($mkfn($replace(%mp3stuffnick,|,I,^,¯,\,-)),¯,^,$null,mp3stuff) $+ $asctime([yyyy.mm.dd]) $+ .txt
  var %zip = " $+ $left(%list,-3) $+ zip $+ ", %txt = " $+ %list $+ "
  if ($not_making_list) {
    if ($isfile(%currentlist)) .remove %currentlist
    %currentlist = $left(%currentlist,-4) $+ txt"
    if ($isfile(%currentlist)) .remove %currentlist
    write -c %ini
    var %temp = $readini $shortfn($mircini) about show
    if (%temp) %l about show %temp
    %l script n0 on *:start:mp3stuff list $1- $chr(124) .timer 1 2 exit
    %l afiles n0 %ini
    %l rfiles n0 %ini
    %l rfiles n1 %ini
    %l rfiles n2 %ini
    %l rfiles n3 $f(mrc)
    %l variables n0 % $+ mp3stuffnick %mp3stuffnick
    %l variables n1 % $+ mp3stuffdirs %mp3stuffdirs
    %l variables n2 % $+ mp3stuffexclude %mp3stuffexclude
    %l variables n3 % $+ mp3stufftypes %mp3stufftypes
    %l variables n4 % $+ mp3stuffcache %mp3stuffcache
    %l variables n5 % $+ mp3stuffzip %mp3stuffzip
    %l variables n6 % $+ mp3stuffzipcmd %mp3stuffzipcmd
    if (%mp3stuffzip) %l mirc anick $nopath(%zip)
    else %l mirc anick $nopath(%list)
    %l mirc nick 0
    %l ident userid 0
    %l options n2 0,0,0,1,1,1,1,1,0,1,1,0,0,1,1,0,1,1,0,1,1,1,0,1,1,0,0
    %l options n6 0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,1,0,0
    .timer -o 1 1 run -n " $+ $mircexe $+ " %ini
    if ($dialog(mp3stuffo)) {
      did -o mp3stuffo 236 1 Updating list. Please wait until the other copy of mIRC closes.
      .timermp3stuffwait -o 1 7 list_status
    }
    return
  }
  ; deltok unimportant exclude dirs
  var %exclude, %i = $numtok(%mp3stuffexclude,124)
  while (%i) {
    var %j = $numtok(%mp3stuffdirs,124), %itok = $gettok(%mp3stuffexclude,%i,124), %iok = 0
    while (%j) {
      if ($gettok(%mp3stuffdirs,%j,124) isin %itok) {
        %iok = 1
        break
      }
      dec %j
      continue
    }
    if (%iok) %exclude = $addtok(%exclude,$deltok(%itok,0,92),124)
    dec %i
    continue
  }
  var %numexclude = $numtok(%exclude,124)
  window -hls @subdirs
  window -hls @files
  var %numtypes = $numtok(%mp3stufftypes,124), %i = %numtypes, %totalcount = 0, %counts
  while (%i) {
    var %temp = $file_count($gettok(%mp3stufftypes,%i,124))
    %counts = %temp %counts
    inc %totalcount %temp
    dec %i
  }
  var %typenum = 1, %progress = 0, %totalsize = 0, %separator = $str(=,$calc(125+$len(%mp3stuffnick))), %smallseparator = $replace($str(-.,$int($calc(36+$len(%mp3stuffnick)/2))),.,$chr(32))
  write -c %txt $replace(%separator,=,-) $+ $lf %mp3stuffnick $+ 's list - $asctime(mmmm doo) $+ , $asctime(yyyy) $+ $lf To get a file from me, copy !<my nick> <file name> into a channel that I'm on.
  while (%typenum <= %numtypes) {
    var %type = $gettok(%mp3stufftypes,%typenum,124), %typecount = $gettok(%counts,%typenum,32), %typelength = 0, %typesize = 0
    write %txt $str($lf,3) $+ %separator $+ $lf $+ %separator $+ $lf Listing %typecount $iif(%typecount == 1,file,files) matching %type $+ $lf $+ %smallseparator $+ $lf $+ $lf
    var %dirnum = 1, %numdirs = $numtok(%mp3stuffdirs,124)
    while (%dirnum <= %numdirs) {
      filter -wwcx @subdirs @subdirs
      var %dir = $directory(%dirnum)
      aline @subdirs %dir
      %i = $finddir(%dir,*,@subdirs)
      ; filter out exceptions here
      %i = %numexclude
      while (%i) {
        filter -wwxc @subdirs @subdirs $gettok(%exclude,%i,124) $+ \*
        filter -wwxc @subdirs @subdirs $gettok(%exclude,%i,124)
        dec %i
      }
      var %subnum = 1, %numsubs = $line(@subdirs,0)
      while (%subnum <= %numsubs) {
        filter -wwcx @files @files
        var %subsize = 0, %sublength = 0, %subdir = $line(@subdirs,%subnum)
        titlebar [ $+ $round($calc(100*%progress /%totalcount),0) $+ % done] - %subdir
        var %filenum = 1, %numfiles = $findfile($longfn(%subdir),%type,0,1,@files)
        while (%filenum <= %numfiles) {
          %mp3stuffmp3 = $fn($replace($line(@files,%filenum),$chr(32),?))
          var %bytes = $file(%mp3stuffmp3).size, %info
          inc %subsize %bytes
          if ($1) && (*.mp3 iswm %mp3stuffmp3) {
            bin
            inc %sublength %mp3stuff.length
            %info = %mp3stuff.info
          }
          else %info = $mb(%bytes) ( $+ %bytes bytes)
          var %temp = $nopath(%mp3stuffmp3)
          rline @files %filenum ! $+ %mp3stuffnick %temp .. $+ $str(.,$calc(64-$len(%temp))) %info
          inc %filenum
        }
        if (%numfiles) {
          inc %progress %numfiles
          write %txt $lf $+ -=- $instok(%subdir,$chr(32),0,92) -=- %numfiles files -=- $mb(%subsize) -=- $iif($1 && %type == *.mp3, [ $duration(%sublength) ] -=-)
          inc %typesize %subsize
          inc %typelength %sublength
          savebuf -a @files %txt
        }
        inc %subnum
      }
      inc %dirnum
    }
    if (%typecount) {
      var %cmd = write %txt $lf $+ $lf $+ %smallseparator $+ $lf Total for %type $+ : %typecount files, $mb(%typesize)
      if ($1) && (%type == *.mp3) && (%typelength) %cmd = %cmd $+ , $duration(%typelength)
      %cmd $+ $lf $+ %separator $+ $lf $+ %separator
    }
    inc %totalsize %typesize
    inc %typenum
  }
  var %cmd = write %txt $str($lf,3)
  if (%numtypes > 1) %cmd = %cmd Grand total: %totalcount files, $mb(%totalsize) $+ $lf
  %ctime = in $duration($calc($ctime -%ctime))
  %cmd Made $iif($2,%ctime) with $v(1) - http://come.to/andys.site/ $+ $lf $+ $replace(%separator,=,-)
  .nick %totalcount
  .identd on %totalsize
  close -@ @subdirs @files
  if (%mp3stuffzip) {
    .remove %zip
    run $replace($iif(%mp3stuffzipcmd,%mp3stuffzipcmd,$winzip),<zip>,%zip,<txt>,%txt)
  }
  _echo Done creating list
  titlebar [Done]
  flash [Done]
}
raw 401:*:if ($window(@mp3stuffnm)) filter -xcww @mp3stuffnm @mp3stuffnm * msg $2 *
alias -l used_slots {
  var %@ = @mp3stuffcs, %a = $f(adr), %x = 0, %s = 1, %n, %z, %pdcc = $pdcc, %total = $iif(%pdcc,$pdcc_win,$send(0))
  if ($1) { }
  else {
    var %n = 0, %dead = 0
    while (%n <= $iif($1,$send($1,0),$send(0))) {
      if ($iif($1,$send($1,%n).status,$send(%n).status) == inactive) inc %dead
      inc %n
    }
    return $calc(%total -%dead)
  }
  window -hl %@
  .timer -o 1 0 close -@ %@
  if ($isfile(%a)) filter -fwc %a %@ $mask($1,1) *
  aline %@ $1
  while (%s <= %total) {
    if (%pdcc) %z = $pdcc_win(%s,1)
    else %z = $send(%s)
    if (%pdcc) || ($send(%s).status != inactive) {
      var %l = 1
      while (%l <= $line(%@,0)) {
        var %t = 2
        while (%t) {
          %n = $gettok($gettok($line(%@,%l),%t,32),1,33)
          if (%n == %z) {
            inc %x
            break
          }
          dec %t
          continue
        }
        inc %l
        continue
      }
    }
    inc %s
    continue
  }
  return %x
}
alias -l pdcc_win {
  if ($1) {
    var %i = $pasvdcc.id($1)
    return $replace($2,1,$pasvdcc.info(%i).nick,2,$pasvdcc.info(%i).tleft)
  }
  return $pasvdcc.id(0)
}
alias -l pdcc if ($script(pasvdcc.mrc)) return 1
alias -l queue_msg queue_line next_msg $1-
alias -l queue_command queue_line next_command $1-
alias -l queue_line {
  var %@ = @mp3stuff $+ $1
  window -hl %@
  if ($2 == -1) iline %@ 1 $3-
  else aline %@ $2-
  if (* !iswm $timer(%@)) .timermp3stuffql 1 0 mp3stuff $1
}
alias -l next_command next_line next_command $1-
alias -l next_msg next_line next_msg $1-
alias -l next_line {
  var %@ = @mp3stuff $+ $1
  if ($window(%@)) {
    tokenize 32 $1 $line(%@,1)
    dline %@ 1
    if (#* iswm $2) && ($chan($2)) || (#* !iswm $2) && ($server) $iif(%mp3stuffecho != 1,.) $+ $3-
    t mi %mp3stuffmi
    .timermp3stuff $+ $1 -m 0 $iif($1 == next_command,1250,$calc(1000*%mp3stuffmi)) mp3stuff $1
  }
  else .timer $+ %@ off
  if ($line(%@,0)) && ($server) return
  close -@ %@
}
alias -l site_ad {
  var %s = http://come.to/andys.site/
  if ($1) return %s
  if (%mp3stuffsite_ad) return - ( $+ $v(1) - %s $+ )
}
alias -l fix_queue {
  var %dialog = $dialog(mp3stuffq)
  if (%dialog) && (* !iswm $1) return
  var %file = $f(fq)
  if ($isfile(%file)) { }
  else {
    write %file
    return
  }
  var %l = 1
  while (%mp3stuffautosend) && (%l <= $lines(%file)) && ($slots) {
    var %n, %f = $read -nl $+ %l %file, %a = $gettok(%f,1,32), %t = $gettok(%a,1,33), %f = $deltok(%f,1,32)
    if ($_nick(%a)) %n = $ifmatch
    elseif ($comchan(%t,0)) %n = %t
    elseif ($_nick($mask(%a,1),1)) %n = $ifmatch
    if (%n) && ($comchan(%n,0)) { }
    else {
      write -dl $+ %l %file
      if (%dialog) {
        did -d mp3stuffq 1 %l
        did -d mp3stuffq 11 %l
      }
      continue
    }
    if ($slots(%n) !isnum 1-) {
      inc %l
      continue
    }
    if ($isfile($sfn(%f))) { }
    else {
      queue_msg - notice %n Sorry, the file you requested could not be found: " $+ $nopath(%f) $+ "
      write -dl $+ %l %file
      if (%dialog) {
        did -d mp3stuffq 1 %l
        did -d mp3stuffq 11 %l
      }
      continue
    }
    send_file %n %f
    setmp3 %f
    notice.p %n Thank you for waiting; here's the file you requested: " $+ $nopath(%mp3stuffmp3) $+ " ( $+ %mp3stuff.info $+ ) $site_ad
    write -dl $+ %l %file
    if (%dialog) {
      did -d mp3stuffq 1 %l
      did -d mp3stuffq 11 %l
    }
    continue
  }
  if (%dialog) did -z mp3stuffq 1
}
alias -l slots {
  if ($1) return $max($calc($max(%mp3stuffuser_slots,1)-$used_slots($1)),0)
  else return $max($calc(%mp3stuffslots -$used_slots),0)
}
on ^*:nick:{
  var %m = $mask($fulladdress,1)
  if ($_nick(%m)) _nick %m $newnick
}
alias -l _nick {
  var %f = $f(adr)
  if ($isfile(%f)) { }
  else write -c %f
  var %t = $read -nw" $+ $1 $+ * *" %f, %r = $readn, %a = $gettok(%t,1,32), %n = $gettok(%t,2,32)
  if ($isid) return %n
  write $iif(%r,-l,-i) $+ $max(%r,1) %f $iif(%a,%a,$1) $2
}
alias mp3stuffpasvdcc if ($1 != refresh) .timer -o 1 0 fix_queue
alias -l send_file {
  if ($pdcc) psend -ma mp3stuffpasvdcc $1-
  else .dcc send $1 " $+ $iif(? isin $fn($2-),$sfn($2-),$2-) $+ "
  ;.timer -o 1 0 _echo Sending [</c> $+ $2- $+ <c>] to</c> $1
}
alias -l c {
  var %r, %t = $replace($1,<,$chr(40),>,$chr(41))
  if ($timer(mp3stuffc)) %r = $gettok($timer(mp3stuffc).com,2,32)
  else %r = $remtok($remtok(%mp3stuffcustom1,15,44),1,44)
  if (* !iswm %r) && (* !iswm %mp3stuffcustom1) %r = 0 $+ $mid($custom1(1),4,31)
  %r = $iif($len(%r) && %mp3stuffpublic_color,$calc(+$gettok(%r,$rand(1,$numtok(%r,44)),44)),14)
  .timermp3stuffc -o 1 0 return %r
  if ($len($1)) return  $+ %r $+  $+ %t $+ 15 [ $+ [ $2 ] ]
  return 15,01
}
alias -l findmp3 {
  if ($isid) return $fn($replace($line(@mp3stuff_findmp3,$calc(+$1)),$chr(32),?))
  close -@ @mp3stuff_findmp3 @mp3stuffls
  if ($1-) window -ikhls @mp3stuff_findmp3
  else return
  fix_types
  var %ls = $f(ls)
  if ($total_count != $lines(%ls)) || (%mp3stuffdirs != %mp3stuffcachedirs) || (%mp3stufftypes != %mp3stuffcachetypes) {
    %mp3stuffcachedirs = %mp3stuffdirs
    %mp3stuffcachetypes = %mp3stufftypes
    window -hl @mp3stuffls
    var %i = $numtok(%mp3stuffdirs,124), %x, %dir, %j
    while (%i) {
      %j = $numtok(%mp3stufftypes,124)
      %dir = $directory(%i)
      while (%j) {
        %x = $findfile($sfn(%dir),$gettok(%mp3stufftypes,%j,124),@mp3stuffls)
        dec %j
      }
      dec %i
    }
    savebuf @mp3stuffls %ls
    close -@ @mp3stuffls
  }
  filter -fw %ls @mp3stuff_findmp3 *\ $+ $1-
  var %e = $numtok(%mp3stuffexclude,124)
  while (%e) {
    filter -wwxc @mp3stuff_findmp3 @mp3stuff_findmp3 $gettok(%mp3stuffexclude,%e,124) $+ *
    dec %e
  }
}
alias -l setchans {
  if ($1) 1b1
  var %p = %mp3stuffplayto
  if ($dialog(mp3stuff_chans,mp3stuff_chans,-4)) {
    t playto $ifmatch
    if (%p != %mp3stuffplayto) {
      if (%mp3stuffplayto) { }
      else t playto all
      fix_playto
    }
    if ($1) spam
  }
}
alias -l setmenuvars {
  var %no
  if ($findtok(status menubar channel nicklist query,$menu,32)) if (%mp3stuffp_menus & $biton(0,$ifmatch)) %no = 1
  if ($menu == @[stuffamp]) && (%mp3stuffampmenu) || (%no) {
    %mp3stuff_popup = 0
    %mp3stuff_next = 0
  }
  else {
    %mp3stuff_setchans = Set channels... [[ $+ %mp3stuffplayto $+ ]]
    if ($version < 5.9) {
      %mp3stuff_0 = [  ] 
      %mp3stuff_1 = [×] 
    }
    else {
      unset %mp3stuff_0
      %mp3stuff_1 = $style(1)
    }
    %mp3stuff_popup = 1
    %mp3stuff_aw = $active
    %mp3stuff_ap = $iif($timer(mp3stuffad),%mp3stuff_1,%mp3stuff_0)
    if (#* iswm $chan(%mp3stuff_aw)) || ($query(%mp3stuff_aw)) && ($server) %mp3stuff_za = 1 | else %mp3stuff_za = 0
    if (#* iswm $chan(1)) || ($query(1)) && ($server) %mp3stuff_z1 = 1 | else %mp3stuff_z1 = 0
    if ($playing) && ($cont) || ($pq_length) && (%mp3stuff_popup) && (* !iswm $timer(mp3stuff1b1)) && (%mp3stuffp_next) && (%mp3stuff_popup) %mp3stuff_next = 1
    else %mp3stuff_next = 0
    if (%mp3stuffp_extra) && (%mp3stuffp_l) %mp3stuff_l = 1 | else %mp3stuff_l = 0
    if (%mp3stuffp_extra) && (%mp3stuffp_l != 1) %mp3stuff_l0 = 1 | else %mp3stuff_l0 = 0
    if (%mp3stuffp_extra) && (%mp3stuff_za) && (%mp3stuffp_p) %mp3stuff_p = 1 | else %mp3stuff_p = 0
    if (%mp3stuffp_extra) && (%mp3stuff_za) && (%mp3stuffp_p != 1) %mp3stuff_p0 = 1 | else %mp3stuff_p0 = 0
    if (%mp3stuffp_extra) && (%mp3stuff_z1) && (%mp3stuffp_a) %mp3stuff_a = 1 | else %mp3stuff_a = 0
    if (%mp3stuffp_extra) && (%mp3stuff_z1) && (%mp3stuffp_a != 1) %mp3stuff_a0 = 1 | else %mp3stuff_a0 = 0
    if ($script(stuffamp.mrc)) %mp3stuff_stuffamp = 1 | else %mp3stuff_stuffamp = 0
    var %f = $shortfn($scriptdir) $+ stuffamp.mrc
    if ($isfile(%f)) {
      if (%mp3stuff_stuffamp) %mp3stuff_amp = Unload Stuffamp
      else %mp3stuff_amp = Load Stuffamp
    }
    else %mp3stuff_amp = 0
  }
  .timer -o 1 0 unset % $+ mp3stuff_?*
}
menu @[stuffamp],status,menubar,channel,nicklist,query,@mp3stuff* {
  -
  $setmenuvars $iif(%mp3stuff_next,[ Next mp3 ]):next
  -
  $iif(%mp3stuff_popup,mp3stuff)
  .Choose an mp3/m3u:stuff 5
  .Skip to next mp3:next
  .-
  .$iif(%mp3stuff_l,[ Listen to mp3s ]  »):t 0 p_l
  .$iif(%mp3stuff_l,Choose):lc
  .$iif(%mp3stuff_l,Random):lr 0
  .$iif(%mp3stuff_l,Random continuous):lr 1
  .-
  .$iif(%mp3stuff_p,[ Play mp3s here ]  »):t 0 p_p
  .$iif(%mp3stuff_p,Choose):pc $active
  .$iif(%mp3stuff_p,Random):pr $active 0
  .$iif(%mp3stuff_p,Random continuous):pr $active 1
  .-
  .$iif(%mp3stuff_a,[ Play mp3s to all ]  »):t 0 p_a
  .$iif(%mp3stuff_a,Choose):pc all
  .$iif(%mp3stuff_a,Random):pr all 0
  .$iif(%mp3stuff_a,Random continuous):pr all 1
  .-
  .Options dialog:.timer -o 1 0 mp3stuffo
  .-
  .$iif(%mp3stuff_za,Spam here):spam $active
  .Spam options
  ..$iif(%mp3stuff_z1,Spam play message):spam
  ..-
  ..$iif(%mp3stuffplay,%mp3stuff_1,%mp3stuff_0) Auto-spam on play:t 0 play
  ..-
  ..Edit play message...:mp3stuffo 87
  ..-
  ..$iif(%mp3stuff_z1,%mp3stuff_setchans):setchans
  .-
  .$iif($cont,%mp3stuff_1,%mp3stuff_0) Continuous play:t 0 cont
  .$iif(%mp3stuffp_toggles || %mp3stuffmute, [ $iif(%mp3stuffmute,%mp3stuff_1,%mp3stuff_0) ] Mute for play-to mode):t 0 mute
  .$iif(%mp3stuffp_toggles, [ $iif(%mp3stuffenq,%mp3stuff_1,%mp3stuff_0) ] Enqueue by default):t 0 enq
  .$iif(%mp3stuffp_toggles, [ $iif(%mp3stufflistening,%mp3stuff_1,%mp3stuff_0) ] Listen to mp3 CTCPs):t 0 listening
  .$iif(%mp3stuffp_toggles, [ $iif(%mp3stuffautosend,%mp3stuff_1,%mp3stuff_0) ] Auto-send):t 0 autosend
  .$iif(%mp3stuffp_toggles, [ $iif(%mp3stufflocator,%mp3stuff_1,%mp3stuff_0) ] @Locator/@Find):t 0 locator
  .$iif(%mp3stuffp_toggles, [ %mp3stuff_ap ] Timed channel ad)
  ..%mp3stuff_ap Start ad now, and on startup:{
    t ad $timer(mp3stuffad)
    t 0 ad
  }
  ..-
  ..$iif(%mp3stuff_z1,Display ad once now):ad
  .$iif(%mp3stuffp_toggles != 1,Quick toggles)
  ..$iif(%mp3stuffmute != 1, [ $iif(%mp3stuffmute,%mp3stuff_1,%mp3stuff_0) ] Mute for Play-to mode):t 0 mute
  ..$iif(%mp3stuffenq,%mp3stuff_1,%mp3stuff_0) Enqueue by default:t 0 enq
  ..$iif(%mp3stufflistening,%mp3stuff_1,%mp3stuff_0) Listen to mp3 CTCPs:t 0 listening
  ..$iif(%mp3stuffautosend,%mp3stuff_1,%mp3stuff_0) Auto-send:t 0 autosend
  ..$iif(%mp3stufflocator,%mp3stuff_1,%mp3stuff_0) @Locator/@Find:t 0 locator
  ..%mp3stuff_ap Timed channel ad
  ...%mp3stuff_ap Start ad now, and on startup:{
    t ad $timer(mp3stuffad)
    t 0 ad
  }
  ...-
  ...$iif(%mp3stuff_z1,Display ad once now):ad
  .$iif(%mp3stuff_l0 || %mp3stuff_p0 || %mp3stuff_a0,[ Listen to/Play mp3s ])
  ..$iif(%mp3stuff_l0,« [ Listen to mp3s ]):t 0 p_l
  ..$iif(%mp3stuff_l0,   Choose):lc
  ..$iif(%mp3stuff_l0,   Random):lr 0
  ..$iif(%mp3stuff_l0,   Random continuous):lr 1
  ..-
  ..$iif(%mp3stuff_p0,« [ Play to [ $replace(%mp3stuff_aw,&,&&) ] ]):t 0 p_p
  ..$iif(%mp3stuff_p0,   Choose):pc $active
  ..$iif(%mp3stuff_p0,   Random):pr $active 0
  ..$iif(%mp3stuff_p0,   Random continuous):pr $active 1
  ..-
  ..$iif(%mp3stuff_a0,« [ Play mp3s to all ]):t 0 p_a
  ..$iif(%mp3stuff_a0,   Choose):pc all
  ..$iif(%mp3stuff_a0,   Random):pr all 0
  ..$iif(%mp3stuff_a0,   Random continuous):pr all 1
  .-
  .More options
  ..Popup options:.timer -o 1 0 mp3stuffo 85
  ..-
  ..View readme:{
    var %f = $f(html)
    if ($isfile(%f)) run %f
    else run http://pages.cthome.net/pdufilie/irc/mp3stuff.html
  }
  ..Check version no.:{
    .timer -o 1 0 mp3stuffo 81
    check 1
  }
  ..-
  ..Make list:.timer -o 1 0 mp3stuffo 93
  ..-
  ..$iif(%mp3stuff_za,Advertise mp3stuff):{
    var %msg = I'm using <c>[</c> $+ $v(1) by ^Andy<c>]</c> - <c>(</c> $+ $site_ad(1) $+ <c>)
    say $ad_tags(1,%msg)
  }
  ..-
  ..$iif($version >= 5.8 && %mp3stuff_amp,%mp3stuff_amp):{
    if ($script(stuffamp.mrc)) {
      close -@ @[stuffamp] @[stuffamp]title
      unload -rs stuffamp.mrc
      t ampunloaded 1
    }
    else {
      .load -rs " $+ $scriptdir $+ stuffamp.mrc"
      t ampunloaded
    }
  }
  ..-
  ..Uninstall:{
    if ($?!="Unload files and unset mp3stuff variables?") {
      .timer -o 1 0 unset %mp3stuff*
      .timermp3stuff* off
      close -@ @[stuffamp] @[stuffamp]title
      unload -rs stuffamp.mrc
      unload -rs mp3stuff.mrc
    }
  }
  ..-
  ..$new([ Install new version ]):downloadmp3stuff
  .Open remote control:.timer -o 1 0 mp3stuffc
  .$iif(%mp3stuff_stuffamp,Open Stuffamp):stuffamp
  .-
  .$iif($lines($f(fq)),File-serving queue editor):.timer -o 1 0 mp3stuffq
  -
}
alias -l _editbox {
  var %v = custom0 custom1 custom2 custom3 custom4 /c ad_time bullet note nick player slots user_slots queues user_queues zipcmd, %d = 140 141 142 143 144 230 322 211 223 231 251 213 216 221 224 301, %i = $gettok(%d,$findtok(%v,$1,32),32)
  if ($isid) {
    if ($1 isnum) {
      if ($1 > 99) return $gettok(%v,$findtok(%d,$1,32),32)
      return $gettok(%v,$1,32)
    }
    elseif ($dialog(mp3stuffo)) return $did(mp3stuffo,%i)
    else return %mp3stuff [ $+ [ $1 ] ]
  }
  if (%i) {
    if ($dialog(mp3stuffo)) did -o mp3stuffo %i 1 %mp3stuff [ $+ [ $1 ] ] $iif($1 == player && * !iswm %mp3stuffplayer,Default)
  }
}
alias -l i {
  var %v = mute listening interrupt ctcp showctcp check install autosend site_ad locator info stop echo playlist once plcont cache st local_color public_color enq ad act local_echo c_ontop c_desktop c_start reply zip shuf _ query_request d_desktop d_ontop p_next p_extra p_toggles
  if ($isid) return $gettok(%v,$1,32)
  if ($findtok(%v,$1,32)) check/uncheck $calc(+%mp3stuff [ $+ [ $1 ] ] ) mp3stuffo $ifmatch
}
on *:dialog:mp3stuffo:init,sclick,dslick,edit:*:{
  var %did = $did, %e = $_editbox(%did)
  if (%did == 0) {
    if ($devent != init) return





    if (* !iswm $dialog(mp3stuffo)) return
    var %x = $i(0), %f = $f(pre), %c, %y = 4, %l = $lines(%f)
    while (%x) {
      i $i(%x)
      dec %x
    }
    %x = 5
    while (%x) {
      if (%mp3stuffp_menus !& $biton(0,%x)) did -c mp3stuffo 20 $+ %x
      dec %x
    }
    list_status
    fix_dirs 1
    fix_types 1
    %x = $_editbox(0)
    while (%x) {
      _editbox $_editbox(%x)
      dec %x
    }
    did -o mp3stuffo 261 1 $v(1)
    %c = 120,121,122,123,124
    %x = 130,131,132,133,134
    did -ra mp3stuffo %c $+ , $+ %x $str(-,19)
    did -ic mp3stuffo %c 1 Presets
    did -a mp3stuffo %c [Default]
    did -a mp3stuffo %c [Default2]
    did -a mp3stuffo 123 [Default3]
    did -ic mp3stuffo %x 1 Remove
    while (%y) {
      %c = 12 $+ %y $+ ,13 $+ %y
      if (%y == 1) %c = 120,130, $+ %c
      %x = 1
      while (%x <= %l) {
        %x = $read -l $+ %x -ns $+ %y %f
        if ($readn !isnum 1-) break
        if (* * iswm %x) did -a mp3stuffo %c $gettok(%x,1,32)
        %x = $readn
        if ($version > 5.8) inc %x
        continue
      }
      dec %y
      continue
    }
    var %f = $f(fr)
    write %f
    if ($version == 5.71) {
      var %x = 1
      close -@ @mp3stuff_friends
      window -hl @mp3stuff_friends
      loadbuf @mp3stuff_friends %f
      while (%x <= $line(@mp3stuff_friends,0)) {
        did -a mp3stuffo 336 $line(@mp3stuff_friends,%x)
        inc %x
      }
      close -@ @mp3stuff_friends
    }
    else filter -fo %f mp3stuffo 336
    t mi %mp3stuffmi
    check/uncheck 1 mp3stuffo $calc(272+%mp3stuffserv_only_to)
    didtok mp3stuffo 328 32 %mp3stuffserv
    did -z mp3stuffo 336,328
    didtok mp3stuffo 100 44  Version checking, System, Playlist, Dialogs, Popup menus, Local echos, Play message, Timed channel ad, File serving, File queues, @Locator/@Find, File serving msgs, File serving list, Search directories, File types, mp3 Player
    if (%mp3stufftab !isnum 81-95) %mp3stufftab = 81









    if (%mp3stufftab isnum) {
      did -fc mp3stuffo 100 $calc(%mp3stufftab -80)
      .timer -o 1 0 fixtab
    }
    if ($version >= 5.8) did -e mp3stuffo 254
    return
  }
  %mp3stufftab = $dialog(mp3stuffo).tab
  if (%did < 80) {
    t $i(%did) $did(mp3stuffo,%did).state
    if (%did == 22) {
      t ad $iif($did(22).state,0,1)
      t 0 ad
    }
  }
  elseif (%e) {
    .timer -o 1 0 t_editbox %e
    return
  }
  if (%did isnum 120-139) {
    var %line = $did(%did).sel, %name = $did(%did,%line), %type = $right(%did,1)
    check/uncheck 1 mp3stuffo %did 1
    if (%did < 130) {
      if (%line < 3) { }
      elseif (%line < 4) custom $+ %type 1 $ [ $+ custom $+ [ %type ] ]
      elseif (%line < 5) && ($dialog(mp3stuffo)) {
        if (%type isnum 0-1) custom $+ %type 1 $remtok($remtok($custom1(1),$colour($iif(%mp3stuffact,a,no)),44),$colour(b),44)
        if (%type == 2) custom2 1 <c>× listening to [</c><mp3><c>] - [</c><size> <length> <kbps> <khz> <stereo><c>]
        if (%type > 2) custom1 1 $remtok($remtok($iif($len($did(141)),$did(141),$custom1),1,44),15,44)
        if (%type == 3) custom3 1 <c>//</c> <!nickmp3> <c>//</c> <length> <c>//</c> <kbps> <c>//</c>
        if (%type == 4) custom4 1 <c>//</c> List trigger: @<nick> <c>//</c> Files: <list count> <c>//</c> Open slots: <open slots>/<slots> <c>//</c> Open queues: <open queues>/<queues> <c>//</c>
      }
      elseif (%type == 3) && (%line < 6) custom3 1 <c>[</c><!nickmp3><c>]</c> - <c>[</c><size><c>;</c> <length><c>;</c> <kbps><c>;</c> <khz><c>;</c> <stereo><c>]
      else {
        write $f(pre)
        tokenize 32 $read -nw" $+ [ $max($calc(+%type),1) ] %name *" $f(pre)
        custom $+ %type 1 $3-
      }
    }
    else .timer -o 1 0 remove_preset %type %line %name
  }
  if (%did == 99) {
    if ($dialog(mp3stuffo).focus == 206) %did = 207
    elseif ($dialog(mp3stuffo).focus == 271) %did = 269
    else halt
  }
  1b 1
  if (%did isnum 81-95) did -cf mp3stuffo 100 $calc(%did -80)
  if (%did == 100) {
    did -f mp3stuffo $calc(80+$did(mp3stuffo,100,1).sel)
    did -f mp3stuffo 100
  }
  if (%did == 100) || (%did isnum 81-95) .timermp3stuffot -om 5 200 fixtab
  if (%did == 200) {
    var %f = $f(html)
    if ($isfile(%f)) run %f
    else run http://pages.cthome.net/pdufilie/irc/mp3stuff.html
  }
  if (%did isnum 201-205) {
    if ($did(mp3stuffo,%did).state) %mp3stuffp_menus = $bitoff($calc(+%mp3stuffp_menus),$right(%did,1))
    else %mp3stuffp_menus = $biton($calc(+%mp3stuffp_menus),$right(%did,1))
    if (%mp3stuffp_menus == 31) .timer -o 1 0 alert You have disabled all mp3stuff popups. $+ $str($crlf,2) $+ Remember that you can open the $+ $crlf $+ options dialog by typing /mp3stuffo.
  }
  if (%did == 207) {
    if ($len(%mp3stufftypes) < 800) {
      var %temp = $gettok($remove($did(mp3stuffo,206),|,$chr(32)),-1,46)
      if (* iswm $remove(%temp,?,*)) {
        while ($left(%temp,1) isin ?*) {
          %temp = $right(%temp,-1)
        }
      }
      if (* iswm %temp) {
        %temp = *. $+ %temp
        var %i = $did(mp3stuffo,209).lines, %ok = 1
        while (%i) {
          var %test = $did(mp3stuffo,209,%i)
          if (%temp iswm $replace(%test,*,$str(?,11))) did -d mp3stuffo 209 %i
          elseif (%test iswm $replace(%temp,*,$str(?,11))) %ok = 0
          dec %i
        }
        if (%ok) did -a mp3stuffo 209 %temp
      }
      did -o mp3stuffo 206 1
    }
  }
  if (%did == 208) {
    while ($did(mp3stuffo,209,0).sel) {
      did -d mp3stuffo 209 $did(mp3stuffo,209,1).sel
    }
    if ($did(mp3stuffo,209).lines == 0) did -a mp3stuffo 209 *.mp3
  }
  if (%did == 210) {
    t bullet ×
    _editbox bullet
  }
  if ($istok(212 215 222 225,%did,32)) .timer -o 1 0 set_var $replace(%did,212,1 slots 1,215,3 user_slots 1,222,2 queues 0 1,225,4 user_queues 1 1)
  if (%did == 214) .timer -o 1 0 t ad_time $max(1,$calc(%mp3stuffad_time -1))
  if (%did == 217) .timer -o 1 0 t ad_time $min(60,$calc(1+%mp3stuffad_time))
  if (%did == 218) {
    var %n = $did(mp3stuffo,209,0).sel, %x = 1
    if ($did(mp3stuffo,209,1).sel == 1) return
    while (%x <= %n) {
      var %l = $did(mp3stuffo,209,%x).sel, %t = $did(mp3stuffo,209,%l)
      did -d mp3stuffo 209 %l
      did -ick mp3stuffo 209 $calc(%l -1) %t
      inc %x
    }
  }
  if (%did == 219) {
    var %x = $did(mp3stuffo,209,0).sel
    if ($did(mp3stuffo,209,%x).sel == $did(mp3stuffo,209).lines) return
    while (%x) {
      var %l = $did(mp3stuffo,209,%x).sel, %t = $did(mp3stuffo,209,%l)
      did -d mp3stuffo 209 %l
      did -ick mp3stuffo 209 $calc(1+%l) %t
      dec %x
    }
  }
  if (%did isnum 207-208) || (%did isnum 218-219) {
    %mp3stufftypes = $didtok(mp3stuffo,209,124)
    did -z mp3stuffo 209
  }
  if (%did == 228) .timer -o 1 0 dir_cmd add_exclude
  if (%did == 229) remove_exclude
  if (%did == 232) .timer -o 1 0 set_nick
  if (%did == 233) .timer -o 1 0 stuff 6
  if (%did isnum 234-235) && (* !iswm $timer(mp3stuffwait)) {
    list_status
    if ($isfile($list)) && (%did == 235) .timer -o 1 0 run $list
    if (%did == 234) .timer -o 1 0 list %mp3stuffinfo
  }
  if (%did == 238) .remove $f(dat)
  if (%did == 239) .timer -o 1 0 t /c $max(0,$calc(%mp3stuff/c -1))
  if (%did == 240) .timer -o 1 0 t /c $min(15,$calc(1+%mp3stuff/c))
  if (%did == 242) .timer -o 1 0 dir_cmd add_dir
  if (%did == 243) remove_dirs
  if (%did == 244) t /c $colour(no)
  if (%did == 252) .timer -o 1 0 set_player
  if (%did == 253) .timer -o 1 0 t player
  if (%did == 254) .timer -o 1 0 t player mIRC
  if (%did == 263) check 1
  if (%did == 264) .timer -o 1 0 downloadmp3stuff $new(1)
  if (%did isnum 272-273) t serv_only_to $calc(%did -272)
  if (11? iswm %did) .timer -o 1 0 save_preset $max($right(%did,1),1) $calc(30+%did)
  if ($istok(265 266 268,%did,32)) {
    if ($dialog(mp3stuff_tags)) dialog -ev mp3stuff_tags
    else dialog $dflags mp3stuff_tags mp3stuff_tags
  }
  if (%did == 267) n $mp3stuffc
  if (%did == 269) {
    var %temp = $remove($did(mp3stuffo,271),$chr(32))
    if (* iswm %temp) {
      if ($left(%temp,1) !isin &#%) %temp = $chr(35) $+ %temp
      if ($istok(%mp3stuffserv,%temp,32) != $true) did -a mp3stuffo 328 %temp
    }
    did -o mp3stuffo 271 1
  }
  if (%did == 270) {
    while ($did(mp3stuffo,328,0).sel) {
      did -d mp3stuffo 328 $did(mp3stuffo,328,1).sel
    }
  }
  if (%did isnum 269-270) {
    t serv $didtok(mp3stuffo,328,32)
    did -z mp3stuffo 328
  }
  if ($istok(270 273,%did,32)) && (* !iswm %mp3stuffserv) {
    t serv_only_to 0
    check/uncheck 0 mp3stuffo 273
    check/uncheck 1 mp3stuffo 272
  }
  if (%did == 325) .timer -o 1 0 run mailto:a_s_d@snet.net?subject= $+ $v(1)
  if (%did == 326) .timer -o 1 0 run http://pages.cthome.net/pdufilie/
  if (%did == 329) .timer -o 1 0 mp3stuffq
  if (%did == 330) {
    t zipcmd $winzip
    _editbox zipcmd
  }
  if (%did == 331) .timer -o 1 0 winace
  if (%did == 337) .timer -o 1 0 add_friend
  if (%did == 338) {
    while ($did(mp3stuffo,336,0).sel) {
      did -d mp3stuffo 336 $did(mp3stuffo,336,1).sel
    }
    did -z mp3stuffo 336
    save_friendlist
  }
  if (%did == 341) t mi $max(1,$calc(%mp3stuffmi -1))
  if (%did == 342) t mi $min(9,$calc(1+%mp3stuffmi))
  halt
}
alias -l t_editbox t $1 $_editbox($1)
alias -l set_var {
  .timer -o 1 0 mp3stuffo
  var %t = $iif($4,Maximum n,N) $+ umber of $gettok(send slots.send slots per user.length of queue list.queues per user,$1,46) = %mp3stuff [ $+ [ $2 ] ] $str($crlf,2) What do you want to change it to?, %t = $_input(%t)
  if (%t isnum) {
    t $2 $max($min($int(%t),999),$3)
    if ($1 <= 2) .timermp3stuff $+ $2 -o 1 0 fix_queue
  }
}
alias -l set_nick {
  .timer -o 1 0 mp3stuffo
  var %n
  if (%mp3stuffnick) %n = Current one: %mp3stuffnick
  %n = $_input(Enter nickname to use in lists:,$crlf,$crlf,%n)
  if (* !iswm %n) return
  %n = $remove(%n,$chr(32))
  if (* !iswm %n) %n = $remove(%mp3stuffnick,$chr(32))
  t nick $iif(%n,%n,$me)
}
alias -l add_friend {
  dialog -ev $$dialog(mp3stuffo)
  did -az mp3stuffo 336 $$dialog(mp3stuff_friends,mp3stuff_friends,-4)
  save_friendlist
}
alias -l save_friendlist {
  if ($version != 5.71) {
    filter -ifc mp3stuffo 336 $f(fr)
    return
  }
  var %x = $did(mp3stuffo,336).lines
  close -@ @mp3stuff_friends
  window -hl @mp3stuff_friends
  while (%x) {
    aline @mp3stuff_friends $did(mp3stuffo,336,%x)
    dec %x
  }
  savebuf @mp3stuff_friends $f(fr)
  close -@ @mp3stuff_friends
}
alias -l fixtab {
  if (* !iswm $dialog(mp3stuffo)) return
  if ($did(mp3stuffo,100,1).sel) {
    did -f mp3stuffo $calc(80+$ifmatch)
    did -f mp3stuffo 100
    %mp3stufftab = $calc(80+$ifmatch)
  }
  if ($mouse !& 1) .timermp3stuffot off
}
on *:dialog:mp3stuff?:sclick,edit:11,12,13:{
  var %dname = $dname, %did = $did
  if ($right(%dname,1) isin cs) {
    if (%did == 11) {
      1b
      .timer -o 1 0 setchans
    }
    elseif (%did == 12) {
      if ($timer(mp3stuffcplay)) || (* !iswm $deltok($did(13),0,44)) && ($server) {
        var %a = $iif($active ischan || $query($active),$active,$iif($chan(1),$chan(1),$query(1)))
        if ($dialog(mp3stuffc)) did $iif(%a,-o,-r) mp3stuffc 13 1 %a
        if ($dialog(mp3stuffs)) did $iif(%a,-o,-r) mp3stuffs 13 1 %a
      }
      if (* iswm $did(13)) && ($server) t playto $did(13)
      else {
        if ($dialog(mp3stuffc)) did -u mp3stuffc 12
        if ($dialog(mp3stuffs)) did -u mp3stuffs 12
      }
      .timermp3stuffcplay -om 1 333 return
      t play $did(12).state
    }
    elseif (%did == 13) {
      %mp3stuffplayto = $deltok($did(13),0,44)
      var %p = $playto
      if (* !iswm %p) {
        if ($dialog(mp3stuffc)) did -u mp3stuffc 12
        if ($dialog(mp3stuffs)) did -u mp3stuffs 12
      }
      if (mp3stuffc != %dname) if ($dialog(mp3stuffc)) did $iif(%p,-o,-r) mp3stuffc 13 1 %p
      if (mp3stuffs != %dname) if ($dialog(mp3stuffs)) did $iif(%p,-o,-r) mp3stuffs 13 1 %p
      .timermp3stuffcplay off
    }
  }
}
on *:dialog:mp3stuffc:init,sclick:*:{
  var %did = $did
  if ($devent == init) {
    dialog -bs mp3stuffc %mp3stuffxy -1 -1
    check/uncheck $calc(+%mp3stuffcont) mp3stuffc 5
    fix_playto
    c_ontop
  }
  if (%did isin 3 7) 1b1
  if (%did == 1) stuff 5
  elseif (%did == 2) mp3stuffo
  elseif (%did == 3) .timermp3stuffbtn -o 1 0 prev
  elseif (%did == 4) .timermp3stuffbtn -o 1 0 next
  elseif (%did == 5) cont $did(5).state
  elseif (%did == 6) t mute $did(6).state
  elseif (%did == 7) spam
  elseif (%did == 99) t xy $dialog(mp3stuffc).x $dialog(mp3stuffc).y
  if (%did isin 3 4) focus
}
alias -l save_preset {
  if ($2 isnum && $dialog(mp3stuffo)) {
    var %t = $did(mp3stuffo,$2), %f = $f(pre), %x = $_input($crlf,Enter a name for this,$gettok(color list.listening echo.play message.channel advertisement,$1,46))
    write %f
    if (* iswm $remove(%x, ,$chr(32))) {
      var %x = $replace($remove(%x,$lf,$cr),$chr(32), ), %y = $read -nw" $+ $1 %x *" %f, %y = $readn, %z = -l $+ %y
      write $iif(%y,%z) %f $1 %x %t
      if (%y !isnum 1-) && ($dialog(mp3stuffo)) {
        did -a mp3stuffo 12 $+ $1 $+ ,13 $+ $1 %x
        if ($1 == 1) did -a mp3stuffo 120,130 %x
      }
    }
    mp3stuffo
  }
}
alias -l remove_preset {
  if ($2 < 3) return
  if ($?!="Are you sure you want to remove $3 $+ ?") {
    var %f = $f(pre), %n = $read -nw" $+ $max($1,1) $3 *" %f
    if ($readn) write -dl $+ $readn %f
    if ($dialog(mp3stuffo)) {
      if ($1 < 2) {
        did -d mp3stuffo 130,131 $2
        did -d mp3stuffo 120,121 $calc(2+$2)
      }
      else {
        did -d mp3stuffo 13 $+ $1 $2
        did -d mp3stuffo 12 $+ $1 $calc($iif($1 == 3,3,2)+$2)
      }
    }
  }
  mp3stuffo
}
alias -l custom0 {
  if ($isid) return $custom1($1)
  if ($1) t custom0 $2-
  if ($dialog(mp3stuffo)) did -o mp3stuffo 140 1 %mp3stuffcustom0
}
alias -l custom1 {
  if ($isid) {
    if ($1) return 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
    return 3,5,6,7,10,12,14
  }
  if ($1) t custom1 $2-
  if ($dialog(mp3stuffo)) did -o mp3stuffo 141 1 %mp3stuffcustom1
}
alias -l custom2 {
  if ($isid) return <c>× listening to [</c><mp3noext><c>] - (</c><length><c>/</c><kbps><c>/</c><stereo><c>)
  if ($1) t custom2 $2-
  if ($dialog(mp3stuffo)) did -o mp3stuffo 142 1 %mp3stuffcustom2
}
alias -l custom3 {
  if ($isid) return <c>mp3</c> [<!nickmp3>] <c>-</c> (<length>/<kbps>) <c>stuff
  if ($1) t custom3 $2-
  if ($dialog(mp3stuffo)) did -o mp3stuffo 143 1 %mp3stuffcustom3
}
alias -l custom4 {
  if ($isid) return <c>[</c>mp3stuff<c>]</c> - <c>[</c>Type @<nick> to get my list<c>]</c> - <c>(</c><list count> files<c>/</c><list size><c>)</c> - <c>[</c><used slots>/<slots> slots in use<c>]</c> - <c>[</c><used queues>/<queues> queues in use<c>]
  if ($1) t custom4 $2-
  if ($dialog(mp3stuffo)) did -o mp3stuffo 144 1 %mp3stuffcustom4
}
alias -l add_dir {
  if ($dialog(mp3stuffo)) dialog -ev $ifmatch
  if (* !iswm $1-) return
  var %x = 1, %d = $1-, %n = $numtok(%mp3stuffdirs,124)
  while (%x <= %n) {
    if ($directory(%x) isin %d) return
    inc %x
  }
  t dirs $addtok(%mp3stuffdirs,%d,124)
}
alias -l remove_dirs {
  var %x = 1
  while ($did(mp3stuffo,241,1).sel) {
    did -d mp3stuffo 241 $did(mp3stuffo,241,1).sel
  }
  t dirs $didtok(mp3stuffo,241,124)
}
alias -l add_exclude {
  if ($dialog(mp3stuffo)) dialog -ev $ifmatch
  if (* !iswm $1-) return
  var %x = 1, %d = $1-, %n = $numtok(%mp3stuffexclude,124)
  while (%x <= %n) {
    if ($exclude(%x) isin %d) return
    inc %x
  }
  t exclude $addtok(%mp3stuffexclude,%d,124)
}
alias -l remove_exclude {
  var %x = 1
  while ($did(mp3stuffo,227,1).sel) {
    did -d mp3stuffo 227 $did(mp3stuffo,227,1).sel
  }
  t exclude $didtok(mp3stuffo,227,124)
}
alias -l pick_file {
  if ($version < 5.81) return $fn($$dir=" [ $2- ] ") $1
  else return $fn($$sfile($1,$2-))
}
alias -l set_player {
  .timer -o 1 0 mp3stuffo
  if ($isfile($sfn(%mp3stuffplayer))) var %f = $nofile(%mp3stuffplayer) $+ *.exe
  else var %f = $left($scriptdir,3) $+ program files\winamp\*.exe
  %f = $pick_file(%f,Select mp3 player)
  if ($isfile($sfn(%f))) t player %f
}
alias -l list_status {
  if ($dialog(mp3stuffo)) {
    var %list = $list
    if ($isfile(%list)) did -o mp3stuffo 236 1 $remove(%list,")
    else did -o mp3stuffo 236 1 None
  }
}
alias -l dir_cmd {
  var %t = $iif(a isin $1,to add,to remove), %dir
  if ($isdir($sfn(%mp3stuffdir))) %dir = %mp3stuffdir
  elseif ($directory(1)) %dir = $ifmatch
  else %dir = $fn($scriptdir)
  if ($version < 5.81) %dir = $fn($sdir="Pick a directory [ %t ] ") %dir
  else %dir = $fn($sdir(%dir,Pick a directory [ %t ] ))
  if (%dir) t dir %dir
  $1- %dir
}
alias -l current_dir return $did(mp3stuffs,52)
alias -l current_file return $did(mp3stuffs,51,$did(mp3stuffs,51,1).sel)
alias -l viewdir {
  did -hr mp3stuffs 51
  did -o mp3stuffs 52 1 $instok($fn($1-),$chr(32),0,92)
  if ($numtok($current_dir,92) > 1) did -a mp3stuffs 51 [..]
  var %t = *.mp3, %n = 1
  close -@ @mp3stuffs
  window -hls @mp3stuffs
  n $finddir($current_dir,*,0,1,@mp3stuffs)
  while (%n <= $line(@mp3stuffs,0)) {
    did -a mp3stuffs 51  [ $+ $fn($replace($gettok($line(@mp3stuffs,%n),-1,92),$chr(32),?)) $+ ]
    inc %n
  }
  :t
  close -@ @mp3stuffs
  window -hls @mp3stuffs
  %n = $longfn($nofile($current_dir))
  if ($findfile(%n,%t,0,1,@mp3stuffs)) did -a mp3stuffs 51 $str(-,76)   %t $+  
  %n = 1
  while (%n <= $line(@mp3stuffs,0)) {
    did -a mp3stuffs 51 $fn($replace($nopath($line(@mp3stuffs,%n)),$chr(32),?))
    inc %n
  }
  if (*3 iswm %t) {
    %t = *.m3u
    goto t
  }
  close -@ @mp3stuffs
  setmp3 $instok($current_dir,$current_file,0,92)
  ginfo
  did -zvf mp3stuffs 51
  tokenize 32 %mp3stuffdrives
  did -r mp3stuffs 53
  if ($1) didtok mp3stuffs 53 32 %mp3stuffdrives
  else {
    %mp3stuffdrives =
    var %x = 90
    while (%x > 66) {
      if ($1) did -i mp3stuffs 53 1 $gettok(%mp3stuffdrives,%x,32)
      else {
        var %n = $chr(%x) $+ :\
        if ($isdir(%n)) {
          %mp3stuffdrives = %n %mp3stuffdrives
          did -i mp3stuffs 53 1 %n
        }
      }
      dec %x
    }
  }
  check/uncheck 1 mp3stuffs 53 $didwm(mp3stuffs,53,$left($current_dir,3))
  if ($len($current_dir) < 4) did -b mp3stuffs 50
  else did -e mp3stuffs 50
}
alias -l ginfo {
  var %x
  if (*u iswm $current_file) {
    list_contents
    %x = $line(@mp3stuffcontents,0) mp3s in this playlist
    close -@ @mp3stuffcontents
  }
  elseif (*3 iswm $current_file) %x = %mp3stuff.info1
  did -o mp3stuffs 55 1 %x
}
alias -l search {
  var %ticks = $ticks
  check_dirs
  var %s = $replace($1-,$chr(32),*), %@ = @mp3stuff_findmp3
  did -o mp3stuffs 32 1 %s
  if (* !iswm $1) {
    did -r mp3stuffs 31
    did -f mp3stuffs 32
    goto e
  }
  if (*.mp3 !iswm %s) %s = * $+ %s $+ *.mp3
  else %s = * $+ %s
  %mp3stuffcachedirs =
  findmp3 %s
  did -hr mp3stuffs 31
  if ($version == 5.71) {
    var %n = $line(%@,0)
    while (%n) {
      did -a mp3stuffs 31 $fn($replace($line(%@,%n),$chr(32),?))
      dec %n
    }
  }
  else filter -woc %@ mp3stuffs 31
  did -evz mp3stuffs 31
  :e
  if ($did(mp3stuffs,31).lines) did -f mp3stuffs 31
  else did -abz mp3stuffs 31   No search results
  did -r mp3stuffs 32
  findmp3
}
alias -l stab {
  var %t = $dialog(mp3stuffs).tab
  did $iif(%t == 4,-b,-e) mp3stuffs 17
  did $iif(%t == 6,-b,-e) mp3stuffs 18
}
alias mp3stuffs stuff $gettok(4 2 6 3 5,$1,32)
alias -l stuff {
  if ($dialog(mp3stuffs)) dialog -ev mp3stuffs
  else dialog $dflags(h) mp3stuffs mp3stuffs
  if ($1) did -f mp3stuffs $1
  if ($1 == 5) finit
  elseif ($1 == 6) pinit
  stab
}
alias -l dostuff {
  stuff_select
  var %q = 1, %t = $dialog(mp3stuffs).title, %c, %l, %m, %x = 1, %y = 0, %n = $did(mp3stuffs,$1,0).sel
  did -h mp3stuffs 21,31,41,51,61
  if ($2) {
    finit n
    while (%x <= %n) {
      %l = $did(mp3stuffs,$1,%x).sel
      if (%l !isnum) break
      %m = $fn($did(mp3stuffs,$1,%l))
      if ($1 == 51) {
        %m = $replace(%m,$chr(32),?)
        if (*] iswm %m) %m = $mid($left(%m,-1),3)
        if (. == %m) %m = $deltok($current_dir,-1,92)
        else %m = $fn($instok($current_dir,%m,0,92))
      }
      %m = $find_location(%m)
      %mp3stuffmp3 = %m
      if ($isfile($sfn(%m))) && (*3 iswm %m) {
        did -a mp3stuffs 61 %m
        inc %y
      }
      elseif ($exists($sfn(%m))) inc %y $add_file(61)
      dialog -t mp3stuffs mp3stuff - working $int($calc(100*%x /%n)) $+ %
      inc %x
    }
    if (%y) pl_fix
  }
  else {
    if ($2 == 0) && (%n == 1) {
      %c = 1
      1b1
    }
    elseif ($1 == 21) {
      while (%x <= %n) {
        %l = $did(mp3stuffs,21,1).sel
        if (%l !isnum) break
        %m = $fn($did(mp3stuffs,21,%l))
        did -d mp3stuffs 21 %l
        did -i mp3stuffs 21 1 %m
        inc %x
      }
      %x = %n
      while (%x) {
        did -kc mp3stuffs 21 %x
        dec %x
      }
      %x = 1
    }
    while (%x <= %n) {
      %l = $did(mp3stuffs,$1,%x).sel
      if (%l !isnum) break
      %m = $fn($did(mp3stuffs,$1,%l))
      if ($1 == 61) && (*  iswm %m) %m = $left(%m,-2)
      elseif ($1 == 41) check/uncheck 0 mp3stuffs 41 %l
      elseif ($1 == 51) {
        %m = $replace(%m,$chr(32),?)
        if (*] iswm %m) %m = $mid($left(%m,-1),3)
        if (. == %m) %m = $deltok($current_dir,-1,92)
        else %m = $fn($instok($current_dir,%m,0,92))
      }
      %m = $find_location(%m)
      %mp3stuffmp3 = %m
      if ($istok(21 41,$1,32)) {
        dec %x
        did -d mp3stuffs $1 %l
      }
      if ($isfile($sfn(%m))) && (*3 iswm %m) {
        if (%c) {
          setmp3 %m
          if ($1 == 41) {
            inc %y
            open $play
          }
          else inc %y $enqueue($play,$cont).e
          %q = 0
          break
        }
        else add_file 41
        inc %y
      }
      elseif ($exists($sfn(%m))) inc %y $add_file(41)
      dialog -t mp3stuffs mp3stuff - working $int($calc(100*%x /%n)) $+ %
      inc %x
    }
  }
  did -f mp3stuffs $1
  dialog -t mp3stuffs %t
  did -v mp3stuffs 21,31,41,51,61
  if ($2) || (%y == 0) return
  if (%mp3stuffenq) || (%y > 1) cont
  if (%mp3stufflocal_echo) {
    if (%n > 1) $_echo($iif(%mp3stuffst,-s)) Queued %y files
    elseif (%q) && (%n) && (%mp3stuffenq) qecho %y
  }
}
alias -l finit {
  $1 did -f mp3stuffs 51
  if (* !iswm $did(mp3stuffs,52)) {
    if (%mp3stuffdir) viewdir %mp3stuffdir
    elseif ($directory(1)) viewdir $ifmatch
    else viewdir $fn($scriptdir)
  }
}
alias -l pinit {
  if ($isid) {
    if ($did(mp3stuffs,61,1) == 1) return
    return 1
  }
  $1 did -f mp3stuffs 61
  if ($did(mp3stuffs,61,1) == 1) {
    var %x, %m, %f = $sfn($2-), %p0 = $f(pl0), %p1 = $f(pl1)
    if ($1) && ($isfile(%f) != $true) return $stuff(6)
    hide_playlist
    close -@ @mp3stuff0 @mp3stuff1
    window -hl @mp3stuff0
    window -hl @mp3stuff1
    if ($1) {
      filter -fw %f @mp3stuff0 ?:*.mp3
      filter -fw %f @mp3stuff1 *.mp3
      filter -wwcx @mp3stuff1 @mp3stuff1 *:*
      %x = $line(@mp3stuff1,0)
      while (%x) {
        did -a mp3stuffs 61 $nofile(%f) $+ $line(@mp3stuff1,%x)
        dec %x
      }
    }
    else {
      write %p1
      filter -fw %p1 @mp3stuff0
      %x = $line(@mp3stuff0,0)
      while (%x) {
        rline @mp3stuff0 %x $line(@mp3stuff0,%x)  
        dec %x
      }
      write %p0
      filter -fw %p0 @mp3stuff0
      did -r mp3stuffs 61
    }
    if ($version == 5.71) {
      %x = $line(@mp3stuff1,0)
      while (%x) {
        did -a mp3stuffs 61 $line(@mp3stuff1,%x)
        dec %x
      }
    }
    else filter -wo @mp3stuff0 mp3stuffs 61
    close -@ @mp3stuff0 @mp3stuff1
    if ($1) pl_fix
  }
  stab
}
alias -l stuff_select {
  var %a = $did(mp3stuffs,51,1).sel, %n = $did(mp3stuffs,51,0).sel, %x = %n
  if ($dialog(mp3stuffs).focus != 51) return
  if (%n == 1) && (* isin $did(mp3stuffs,51,%a)) {
    var %s = $left($right($did(mp3stuffs,51,%a),6),5), %l = $did(mp3stuffs,51).lines
    if (%l > 20) did -h mp3stuffs 51
    while (%l > %a) {
      if (%s iswm $did(mp3stuffs,51,%l)) did -kc mp3stuffs 51 %l
      dec %l
    }
    did -fvck mp3stuffs 51 %a
    did -uk mp3stuffs 51 %a
  }
  else {
    while (%x) {
      var %y = $did(mp3stuffs,51,%x).sel, %z = $did(mp3stuffs,51,%y)
      if (* isin %z) did -ku mp3stuffs 51 %y
      dec %x
    }
    if ($did(mp3stuffs,51,%a) == [..]) && ($did(mp3stuffs,51,0).sel > 1) did -ku mp3stuffs 51 %a
  }
  if ($did(mp3stuffs,51,0).sel == 1) {
    setmp3 $current_dir $+ $current_file
    ginfo
  }
  else {
    setmp3
    did -o mp3stuffs 55 1 $did(mp3stuffs,51,0).sel lines selected
  }
}
alias -l stuff_dclick {
  var %f = $current_file
  if ($1 == 51) && (*] iswm %f) {
    var %c = $current_dir, %f = $left($mid(%f,3),-1)
    if (%f == .) %c = $deltok(%c,-1,92)
    else %c = $instok(%c,%f,0,92)
    viewdir %c
  }
  else dostuff $1 0
}
alias -l load_pq_hst {
  var %f = $f($1)
  close -@ @mp3stuffs
  window -hl @mp3stuffs
  if ($isfile(%f)) { }
  else write %f
  filter -fwc %f @mp3stuffs
  var %x = 1, %y = $lines(%f)
  did -h mp3stuffs $2
  if ($version == 5.71) {
    while (%x <= %y) {
      did -a mp3stuffs $2 $line(@mp3stuffs,%x)
      inc %x
    }
  }
  else filter -wo @mp3stuffs mp3stuffs $2
  did -vz mp3stuffs $2
  close -@ @mp3stuffs
}
alias -l save_pq_hst {
  var %f = $f($1), %x = 1, %y = $did(mp3stuffs,$2).lines
  if ($version != 5.71) {
    filter -ifc mp3stuffs $2 %f *
    return
  }
  close -@ @mp3stuffs
  window -hl @mp3stuffs
  while (%x <= %y) {
    aline @mp3stuffs $did(mp3stuffs,$2,%x)
    inc %x
  }
  close -@ @mp3stuffs
}
on *:dialog:mp3stuffs:init,sclick,dclick:*:{
  var %did = $did
  if (%did == 0) {
    if ($devent == init) {
      check/uncheck %mp3stuffenq mp3stuffs 14
      check/uncheck %mp3stuffmute mp3stuffs 15
      check/uncheck %mp3stuffcont mp3stuffs 16
      check/uncheck %mp3stuffstop mp3stuffs 44
      check/uncheck %mp3stuffshuf mp3stuffs 45
      fix_playto
      load_pq_hst pq 41
      load_pq_hst hst 21
      did -ab mp3stuffs 31   Type in what you want to search for
      did -a mp3stuffs 61 1
    }
    return
  }
  ;enter key
  elseif (%did == 1) {
    var %f = $dialog(mp3stuffs).focus
    if ($dialog(mp3stuffs).tab %f == 3 32) search $did(32)
    elseif ($istok(21 31 41 51 61,%f,32)) stuff_dclick %f
    halt
  }
  ;cilck file in browser
  elseif ($devent %did == sclick 51) stuff_select
  ;double click list
  elseif ($istok(21 31 41 51 61,%did,32)) && ($devent == dclick) stuff_dclick %did
  elseif (%did isnum 2-6) {
    ;tab
    if (%did == 2) did -f mp3stuffs 21
    elseif (%did == 3) did -f mp3stuffs 32
    elseif (%did == 4) did -f mp3stuffs 41
    elseif (%did == 5) finit
    elseif (%did == 6) pinit
    stab
  }
  elseif (%did == 8) mp3stuffo
  elseif (%did == 9) {
    ;close
    if ($did(61,1) !isnum) sl
    save_pq_hst pq 41
    save_pq_hst hst 21
    if ($current_dir) t dir $ifmatch
  }
  elseif (%did == 10) {
    1b1
    spam
  }
  elseif (%did == 14) t enq $did(14).state
  elseif (%did == 15) t mute $did(15).state
  elseif (%did == 16) cont $did(16).state
  ;enqueue selected
  elseif (%did == 17) dostuff $dialog(mp3stuffs).tab $+ 1
  elseif (%did == 18) {
    ;add selected to playlist
    if ($pinit != 1) pinit
    dostuff $dialog(mp3stuffs).tab $+ 1 1
  }
  elseif ($istok(20 30 40,%did,32)) {
    ;open random
    var %list = 1 + %did
    if (?:* iswm $did(mp3stuffs,%list,1)) {
      check/uncheck 1 mp3stuffs %list $rand(1,$did(mp3stuffs,%list).lines)
      stuff_dclick %list
    }
  }
  elseif (%did == 22) .timer -o 1 0 history_setlength
  elseif ($istok(23 43,%did,32)) {
    ;remove selected from history/play queue
    var %list = %did - 2, %c
    did -h mp3stuffs %list
    while ($did(%list,0).sel) {
      %c = 1
      did -d mp3stuffs %list $did(%list,1).sel
    }
    if (%list == 41) && (%mp3stuffstop) && (%c) && ($did(41).lines < 1) cont 0
    did -vz mp3stuffs %list
  }
  elseif (%did == 33) search $did(32)
  ;directories...
  elseif (%did == 34) .timer -o 1 0 mp3stuffo 94
  elseif (%did == 35) search *
  elseif (%did == 44) t stop $did(44).state
  elseif (%did == 45) t shuf $did(45).state
  elseif (%did == 46) {
    ;top
    var %n = $did(mp3stuffs,41,0).sel, %x = %n
    while (%x) {
      var %l = $did(mp3stuffs,41,%n).sel, %t = $did(mp3stuffs,41,%l)
      did -d mp3stuffs 41 %l
      did -ick mp3stuffs 41 1 %t
      dec %x
    }
  }
  elseif (%did == 47) {
    ;up
    var %n = $did(mp3stuffs,41,0).sel, %x = 1
    if ($did(mp3stuffs,41,1).sel == 1) return
    while (%x <= %n) {
      var %l = $did(mp3stuffs,41,%x).sel, %t = $did(mp3stuffs,41,%l)
      did -d mp3stuffs 41 %l
      did -ick mp3stuffs 41 $calc(%l -1) %t
      inc %x
    }
  }
  elseif (%did == 48) {
    ;down
    var %x = $did(mp3stuffs,41,0).sel
    if ($did(mp3stuffs,41,%x).sel == $did(mp3stuffs,41).lines) return
    while (%x) {
      var %l = $did(mp3stuffs,41,%x).sel, %t = $did(mp3stuffs,41,%l)
      did -d mp3stuffs 41 %l
      did -ick mp3stuffs 41 $calc(1+%l) %t
      dec %x
    }
  }
  elseif (%did == 49) {
    ;bottom
    var %x = $did(mp3stuffs,41,0).sel
    while (%x) {
      var %l = $did(mp3stuffs,41,1).sel, %t = $did(mp3stuffs,41,%l)
      did -d mp3stuffs 41 %l
      did -ack mp3stuffs 41 %t
      dec %x
    }
  }
  ;..
  elseif (%did == 50) viewdir $deltok($current_dir,-1,92)
  ;drives
  elseif (%did == 53) viewdir $did(53)
  elseif (%did == 54) {
    ;refresh
    %mp3stuffdrives =
    viewdir $current_dir
  }
  ;playlist options
  elseif (%did == 60) mp3stuffo 83
  ;add dir
  elseif (%did == 62) .timer -o 1 0 dir_cmd pl_add_dir
  ;add wildcard
  elseif (%did == 63) .timer -o 1 0 wildcard 1
  elseif (%did == 64) {
    ;remove selected
    hide_playlist
    var %x = $did(mp3stuffs,61,1).sel
    while (%x) {
      did -d mp3stuffs 61 %x
      %x = $did(mp3stuffs,61,1).sel
    }
  }
  ;remove dir
  elseif (%did == 65) .timer -o 1 0 dir_cmd pl_rem_dir
  ;remove wildcard
  elseif (%did == 66) .timer -o 1 0 wildcard
  elseif (%did == 67) {
    ;dead files
    hide_playlist
    var %t = $did(mp3stuffs,61).lines, %x = %t, %m
    while (%x) {
      %m = $did(mp3stuffs,61,%x)
      if ($isfile($sfn($iif(*  iswm %m,$left(%m,-2),%m)))) { }
      else did -d mp3stuffs 61 %x
      dec %x
    }
  }
  ;save copy
  elseif (%did == 68) .timer -o 1 0 sl 1
  if (%did isnum 46-49) did -z mp3stuffs 41
  ;make list on active tab the default (enter key activates)
  did -t mp3stuffs $dialog(mp3stuffs).tab $+ 1
}
alias -l history_setlength {
  if ($_input(Set history length (enter a number),$crlf,$crlf,Current length:,$max(1,%mp3stuffhistory)) isnum) t history $max(1,$ifmatch)
  if ($dialog(mp3stuffs)) dialog -ev mp3stuffs
}
alias -l pl_add_dir {
  .timer -o 1 0 stuff
  stuff
  var %p = $$dialog(mp3stuffs), %x = $did(%p,61).lines, %d = $$1-, %@ = @mp3stuffapd, %n, %y
  hide_playlist
  window -hl %@
  n $findfile($longfn(%d),*.mp3,%@)
  %n = $line(%@,0)
  if (%n) {
    while (%n) {
      did -a %p 61 $fn($line(%@,%n))
      dec %n
    }
    pl_fix
  }
  close -@ %@
}
alias -l pl_rem_dir {
  .timer -o 1 0 stuff
  stuff
  var %p = $$dialog(mp3stuffs), %t = $did(%p,61).lines, %x = %t, %d = $$1- $+ *
  hide_playlist
  if ($version != 5.71) {
    filter -iocx %p 61 %p 61 %d
    return
  }
  while (%x) {
    if (%d iswm $did(mp3stuffs,61,%x)) did -d %p 61 %x
    dec %x
  }
}
alias -l new if (%mp3stuffnew) && (\ %mp3stuffnew \ != \ $v \) return $1-
alias -l dialog_echo {
  if ($dialog(mp3stuffo)) did -o mp3stuffo 262 1 $replace($1, ,$chr(32))
  elseif ($2-) _echo $2-
}
alias -l check {
  if ($sock(mp3stuffversion).name) return
  t checking $iif($1,0,1)
  if (%mp3stuffchecking) || ($dialog(mp3stuffo)) dialog_echo Checking... Checking for a newer version of mp3stuff...
  if ($2) t checking 2
  sockopen mp3stuffversion pages.cthome.net 80
}
on *:sockopen:mp3stuffv*:{
  if ($sockerr) {
    if (%mp3stuffchecking) || ($dialog(mp3stuffo)) {
      dialog_echo Error  $+ $sockerr Connection error ( $+ $sockerr $+ ) when checking for a new version of mp3stuff
      t checking
    }
    return
  }
  sockwrite -n $sockname GET /pdufilie/versions.txt HTTP/1.0
  sockwrite -n $sockname Accept: */*
  sockwrite -n $sockname Host: pages.cthome.net
  sockwrite -n $sockname $crlf
}
on *:sockread:mp3stuffv*:{
  var %d, %m = $v
  :x
  sockread -f %d
  if ($sockbr) {
    if (mp3stuff * iswm %d) {
      var %a = $gettok(%d,2,32), %b = $gettok(%d,3,32), %c = $iif(%b > $version,1,0)
      t new %a
      if (%m != %a) {
        if (* !iswm $dialog(mp3stuffo)) || (%c) _echo New version of mp3stuff found! (You have version %m $+ ; version %a is $iif(%mp3stuffinstall && %mp3stuffchecking != 2 && %c != 1,the newest,available at http://come.to/andys.site/ or you can type /downloadmp3stuff) $+ )
        if (%c) {
          _echo The newest version of mp3stuff requires mIRC v $+ %b $+ . Get it from  $+ $colour(h) www.mirc.com
          halt
        }
        if (%mp3stuffchecking == 2) _echo If the auto-install feature doesn't seem to be working, please download & install the newest version manually.
        if (%mp3stuffinstall) && (%mp3stuffchecking != 2) {
          t checking
          downloadmp3stuff
        }
        t checking
      }
      if (%m == %a) && (%mp3stuffchecking) {
        _echo mp3stuff is up to date [[ $+ $v $+ ]]
        t new %m
        t checking
      }
    }
    goto x
  }
}
on *:sockclose:mp3stuffv*:t checking
alias downloadmp3stuff {
  if ($1) if ($?!="Install newest version?" != $true) return
  if ($sock(downloadmp3stuff).name) || ($timer(mp3stuffld)) halt
  dialog_echo Downloading...
  sockopen downloadmp3stuff pages.cthome.net 80
}
on *:sockopen:downloadmp3stuff:{
  var %e = $sockerr
  if (%e) {
    dialog_echo Error  $+ %e Connection error ( $+ %e $+ ) when downloading mp3stuff
    return
  }
  write -c $f(exe)
  t dlb
  t dl 1
  dlwin
  sockwrite -n downloadmp3stuff GET /pdufilie/irc/mp3stuff.exe HTTP/1.0
  sockwrite -n downloadmp3stuff Accept: */*
  sockwrite -n downloadmp3stuff Host: pages.cthome.net
  sockwrite -n downloadmp3stuff
}
on *:sockread:downloadmp3stuff:{
  var %d = $sockerr
  if (%d) {
    dialog_echo Error  $+ %d Error %d when downloading mp3stuff
    return
  }
  while (%mp3stuffdlb !isnum 1-) {
    sockread -f %d
    if ($sockbr) {
      if (Content-Length: * iswm %d) t dl $gettok(%d,2,32)
      elseif (* !iswm %d) {
        t dlb $rand(1,16777215)
        break
      }
    }
  }
  :x
  sockread 4096 &d
  if ($sockbr) {
    dlwin
    bwrite $f(exe) -1 -1 &d
    goto x
  }
}
on *:sockclose:downloadmp3stuff:install
alias -l install {
  dlwin 1
  if ($isfile($f(exe))) {
    dialog_echo Installing...
    run $f(exe)
    _load 0
  }
}
alias -l _load {
  if ($isfile($f(exe)) != $true) || ($1 > 20) {
    .timer -o 1 0 mp3stuff.init
    .reload -rs " $+ $script $+ "
  }
  else .timermp3stuffld -om 1 200 _load $calc(1+$1)
}
on *:filesent:*:.timer -o 1 0 fix_queue
on *:sendfail:*:.timer -o 1 0 fix_queue
on ^*:text:*@?*:*:{
  $return_when_necessary
  if (@locator * iswm $1-) || (@find * iswm $1-) {
    queue_command $iif(#,#,query) @find $iif(#,#,query) $fulladdress $2-
  }
  elseif (%mp3stuffnick) && (@ $+ %mp3stuffnick $+ * iswm $1) || (@ $+ $me $+ * iswm $1) {
    queue_command $iif(#,#,query) @command $iif(#,#,query) $nick $mid($1-,2)
  }
}
alias -l @find {
  fix_queue
  if (%mp3stufflocator) { }
  else return
  var %nick = $gettok($2,1,33), %to_get, %total = $total_count(1), %showing, %search = * $+ $nopath($3-) $+ *
  :r
  %search = $replace(%search,$chr(32),*,_,*,-,*,',*,`,*,$chr(44),*,**,*)
  if (** isin %search) goto r
  if (* !iswm $remove(%search,*,?)) return
  findmp3 %search
  if ($isfile($list)) && (%mp3stuffautosend) %to_get = - $c(<,To) get my list, type: @ $+ $me $+ $c(>)
  if ($findmp3) {
    if ($findmp3 > 5) %showing = %search (showing first 5)
    elseif ($findmp3 == 1) %showing = %search
    else %showing = %search
    if (%mp3stuffautosend) {
      queue_msg $1 msg %nick $c $c([,Searched) %total files and found  $+ $findmp3 $+  matching %showing $+ $c(]) - $c([,) $+ $reptok($slots($2),0,no,1) $+  send $iif($slots($2) == 1,slot,slots) and  $+ $reptok($max(0,$calc(%mp3stuffuser_queues -$user_queued(%nick))),0,no,1) $+  queues open for you $+ $c(]) - $c(<,To) get a file, copy !<my nick> <file name> into a channel that I'm on $+ $c(>) %to_get 
      findmp3 %search
      var %x = 1
      while (%x <= 5) && (%x <= $findmp3) {
        setmp3 $findmp3(%x)
        queue_msg $1 msg %nick ! $+ $me $nopath(%mp3stuffmp3) ..... ( $+ %mp3stuff.info $+ )
        inc %x
      }
      if ($len(%mp3stuffnote) > 1) queue_msg $1 msg %nick $c $c(Note:)  $ad_tags(1,%mp3stuffnote)
    }
    elseif (%mp3stuffreply) queue_msg $1 notice %nick Searched %total files and found $c($findmp3) matching %search $+ , but my auto-send is currently off.
    if ($findmp3) {
      if ($window(@mp3stuff requests)) { }
      else window -ikn @mp3stuff requests
      aline -p @mp3stuff requests $timestamp ( $+ $1 $+ ) %nick was looking for %search ( $+ $findmp3 matc $+ $iif($findmp3 > 1,hes,h) found)
    }
  }
  if ($findmp3) window -b @mp3stuff requests
  findmp3
}
alias -l @command {
  fix_queue
  var %s, %qu = $f(fq), %q = $lines(%qu), %l = wanted your list, %m = queue_msg $1 notice $2, %z = %m You have no files in my queue list.
  if (%mp3stuffnick) && (%mp3stuffnick $+ -help* iswm $3) || ($me $+ -help* iswm $3) {
    %m You can type "@ $+ $me $+ -queue" to see your queue status, or "@ $+ $me $+ -remove" to remove yourself from my queue list. $iif($isfile($list),Type "@ [ $+ [ $me ] $+ ] " to get my list.)
    %s = asked for help
  }
  elseif (%mp3stuffnick) && (%mp3stuffnick $+ -que* iswm $3) || ($me $+ -que* iswm $3) {
    n $read -nw $+ $2 $+ !* %qu
    if ($readn) {
      %m You are number  $+ $readn $+  in my queue list. $next_queue_time Type "@ $+ $me $+ -remove" with or without file name to remove yourself from my queue list.
      %s = requested queue status
    }
    else {
      %z
      return
    }
  }
  elseif (%mp3stuffnick) && (%mp3stuffnick $+ -remove* iswm $3) || ($me $+ -remove* iswm $3) {
    filter -ffcx %qu %qu $2 $+ !* $+ $4-
    if ($dialog(mp3stuffq)) {
      var %x = $did(mp3stuffq,1).lines
      while (%x) {
        if ($2 $+ !* $+ $4- iswm $did(mp3stuffq,11,%x)) {
          did -d mp3stuffq 1 %x
          did -d mp3stuffq 11 %x
        }
        dec %x
      }
      did -z mp3stuffq 1
    }
    if ($lines(%qu) < %q) {
      %m You have been removed from my queue list ( $+ $iif($4-,$4-,all files) $+ ).
      %s = removed themselves from your queue ( $+ $iif($4-,$4-,all files) $+ )
    }
    else {
      %z
      return
    }
  }
  elseif (%mp3stuffautosend != 1) {
    if (%mp3stuffreply) {
      %m My auto-send is currently off, sorry.
      %s = %l (auto-send was off)
    }
  }
  elseif ($3 == %mp3stuffnick) || ($3 == $me) {
    var %list = $list
    if ($isfile(%list)) {
      send_file $2 $remove(%list,")
      notice $2 I'm sending you my list of $list_count files.
      %s = %l (sending...)
    }
    else {
      %m Sorry, no list.
      %s = %l (didn't send; no list)
    }
  }
  %z = $iif($window(@mp3stuff requests),n,window)
  if (%s) {
    %z -kn @mp3stuff requests
    aline -p @mp3stuff requests $timestamp ( $+ $1 $+ ) $2 %s
    %z -b @mp3stuff requests
  }
}
alias -l next_queue_time {
  var %r = 0, %x = 1, %t, %s
  if ($pdcc) {
    while (%x <= $used_slots) {
      %t = $pdcc_win(%x,2)
      if (%t) && (%t < %r) || (%r == 0) %r = %t
      inc %x
    }
  }
  else {
    while (%x <= $send(0)) {
      var %s = $send(%x).sent, %t = $calc(($send(%x).size -%s)/%s *$send(%x).secs)
      if (%t) && (%t < %r) || (%r == 0) && ($send(%x).status == active) %r = %t
      inc %x
    }
  }
  if (%r) return Time left for next send to complete: $duration(%r) $+ .
}
alias -l return_when_necessary {
  if (* !iswm #) && (%mp3stuffquery_request != 1) return return
  if ($istok(%mp3stuffserv,#,32) != $true) && (%mp3stuffserv_only_to) && (#) return return
}
on *:text:!?* *.*:*:{
  $return_when_necessary
  if (%mp3stuffnick) && (! $+ %mp3stuffnick * iswm $1-) || (! $+ $me * iswm $1-) {
    queue_command $iif(#,#,query) file_request $iif(#,#,query) $fulladdress $2-
  }
}
alias -l user_queued {
  var %@ = @mp3stuffuser_queued
  window -hl %@
  filter -fwc $f(fq) %@ $1 $+ *
  var %n = $line(%@,0)
  close -@ %@
  return %n
}
;file_request chan address request[junk]
alias -l file_request {
  fix_types
  var %i = $numtok(%mp3stufftypes,124), %request
  while (%i) {
    var %ext = $right($gettok(%mp3stufftypes,%i,124),-1)
    if ($remove(%ext,*,?) == .) %request = $3-
    ;test for *.ext*
    elseif (* $+ %ext $+ * iswm $3-) {
      var %pos = 1, %len = $len(%ext)
      while (%pos <= %len) && ($mid(%ext,%pos,1) !isin *?) {
        inc %pos
      }
      dec %pos
      ;pos = position of first non-wildcard character in matching extension
      var %temp = $left(%ext,$calc(%pos -1))
      %temp = $left($3-,$pos($3-,%temp,$count($3-,%temp))) $+ $right(%ext,-1)
      if ($len(%temp) > $len(%request)) %request = %temp
    }
    dec %i
  }
  fix_queue
  var %slots = $slots, %nick = $gettok($2,1,33), %user_slots = $slots(%nick), %notice = queue_msg $1 notice %nick, %do, %status, %file
  if (%mp3stuffautosend) {
    var %path = $longfn($nofile(%request)), %nopath = $nopath(%request)
    findmp3 %nopath
    var %matches = $findfile(%path,%nopath,0,1)
    ; if exact path is valid
    if (%matches == 1) var %do = s, %file = $fn($replace($findfile(%path,%nopath,1,1),$chr(32),?))
    ; if one match found in all dirs
    elseif ($findmp3 == 1) var %do = s, %file = $findmp3(1)
    ; if more than one match found in path
    elseif (%matches > 1) var %do = m
    ; if more than one match found in all dirs
    elseif ($findmp3 > 1) var %do = m, %matches = $findmp3
    ; if not found, replace space/underscore with wildcard
    else {
      findmp3 $replace(%request,_,?,$chr(32),?)
      ; if one match found
      if ($findmp3 == 1) var %do = s, %file = $findmp3(1)
      ; if not found
      elseif ($findmp3 < 1) var %do = m, %matches = 0
    }
    var %mp3stuff.fr = $f(fr)
    if ($isfile(%mp3stuff.fr)) {
      close -@ @mp3stuff_friends
      window -hl @mp3stuff_friends
      write %mp3stuff.fr
      loadbuf @mp3stuff_friends %mp3stuff.fr
      %mp3stuff.fr = $line(@mp3stuff_friends,0)
      while (%mp3stuff.fr) {
        var %temp = $gettok($line(@mp3stuff_friends,%mp3stuff.fr),1,32)
        if (%temp == %nick) || (%temp iswm $2) {
          %slots = 1
          %user_slots = 1
          break
        }
        dec %mp3stuff.fr
      }
    }
    if (%do == m) {
      if (%matches > 1) {
        %notice I have  $+ %matches $+  matches for " $+ %request $+ "; try including the full path name specified in my list. $iif($isfile($list),Get it by typing "@ [ $+ [ $me ] $+ ] ".)
        %status = $findmp3 matches, didn't send
      }
      else {
        %notice I can't find the requested file, " $+ %request $+ "
        %status = Couldn't find it
      }
    }
    if (%do == s) {
      if (%slots) && (%user_slots) {
        setmp3 %file
        send_file %nick %file
        _nick $2 %nick
        notice %nick I'm sending you the file you requested: " $+ $nopath(%mp3stuffmp3) $+ " ( $+ %mp3stuff.info $+ ) $site_ad
        %status = Sending...
      }
      else {
        var %mp3stuff.fq = $f(fq), %total_queued = $calc(+$lines(%mp3stuff.fq)), %user_queued = $user_queued(%nick), %msg, %echo, %ql = queue list is $iif(%mp3stuffqueues,full,disabled)
        if (%user_slots) {
          %msg = all of my send slots are in use and
          %echo = all send slots in use
        }
        else {
          var %already = already getting $used_slots(%nick) files from
          %msg = you are %already me and
          %echo = %already you
        }
        if (%mp3stuffqueues !isnum 1-999) {
          %notice Sorry, %msg my %ql $+ ; try again later.
          %status = %echo $+ , %ql
        }
        elseif (%user_queued >= %mp3stuffuser_queues) {
          %notice Sorry, %msg you already have $cq(0) files queued; try again later.
          %status = Didn't send; %echo $+ , already had %user_queued files queued
        }
        elseif ($lines(%mp3stuff.fq) >= %mp3stuffqueues) {
          %notice Sorry, %msg my %ql $+ ; try again later.
          %status = Didn't send; %echo $+ , %ql
        }
        elseif ($lines(%mp3stuff.fq) < %mp3stuffqueues) {
          setmp3 %file
          var %test = $read -w" $+ $2 %file $+ " %mp3stuff.fq
          if (* iswm %test) {
            %notice You have already queued the file " $+ $nopath(%mp3stuffmp3) $+ "
            %status = Already queued
          }
          else {
            write %mp3stuff.fq $2 %file
            if ($dialog(mp3stuffq)) {
              did -az mp3stuffq 1 $gettok($2,1,33) ... $nopath(%file)
              did -az mp3stuffq 11 $2 %file
            }
            _nick $2 %nick
            %notice You have been placed as number  $+ $lines(%mp3stuff.fq) $+  in my queue list for " $+ $nopath(%mp3stuffmp3) $+ " ( $+ %mp3stuff.info $+ ). Stay on a channel that I'm on to get the file. Type "@ $+ $me $+ -help" for a command list.
            %status = Placed in queue list
          }
        }
      }
    }
    :d
    if (%status) {
      if (* !iswm $window(@mp3stuff requests)) window -ikn @mp3stuff requests
      aline -p @mp3stuff requests $timestamp ( $+ $1 $+ ) %nick requested " $+ %request $+ " ( $+ %status $+ )
      window -b @mp3stuff requests
    }
    findmp3
  }
  elseif (%mp3stuffreply) %notice My auto-send is currently off, sorry.
}
ctcp ^*:mp3:*:plop $2-
ctcp ^*:sound:*:plop $2
alias -l plop if (%mp3stufflistening) queue_command -1 $iif(#,#,query) ctcp_mp3 $nick $1-
alias -l ctcp_mp3 {
  if (%mp3stufflistening) {
    if ($1 != $me) && (*.mp3 iswm $2-) && ($remove($2-,?,*) != .mp3) {
      findmp3 $replace($nopath($2-),$chr(44),?,_,?,$chr(32),?,',?,`,?)
      if ($findmp3) {
        setmp3 $findmp3($rand(1,$findmp3))
        if (%mp3stuffenq != 1) && (%mp3stuffinterrupt) && ($playing == 1) open 0
        elseif ($playing == 0) open 0
        else enqueue 0
      }
      findmp3
    }
  }
}
alias mp3stuffc {
  if ($1 isnum) && ($2 isnum) %mp3stuffxy = $1 $2
  elseif ($gettok(%mp3stuffxy,1,32) !isnum) || ($gettok(%mp3stuffxy,2,32) !isnum) set %mp3stuffxy -1 -1
  if (* !iswm $dialog(mp3stuffc)) dialog $iif(%mp3stuffc_desktop,-dmh,-mh) mp3stuffc mp3stuffc
  dialog -ev mp3stuffc
  if ($dialog(mp3stuffo)) && ($isid) dialog -n mp3stuffo
}
alias mp3stuffo {
  if ($1 isnum 81-95) t tab $1
  if ($dialog(mp3stuffo)) {
    dialog -ev mp3stuffo
    if (%mp3stufftab isnum 81-95) {
      did -fu mp3stuffo %mp3stufftab
      did -c mp3stuffo 100 $calc(%mp3stufftab -80)
    }
  }
  else .timermp3stuffo -o 1 0 dialog $dflags(h) mp3stuffo mp3stuffo
}
alias mp3search {
  stuff 3
  search $1-
}
alias -l dlwin {
  var %@ = @Downloading mp3stuff
  if ($1) {
    close -@ %@
    return
  }
  if (* !iswm $window(%@)) window -iBhaCdfopk +Ldf %@ -1 -1 176 24
  drawrect -frn %@ 0 0 0 0 176 24
  drawrect -rn %@ $calc(+%mp3stuffdlb) 0 0 0 176 24
  drawrect -frn %@ 8421504 0 1 1 $calc(+$calc(174*$sock(downloadmp3stuff).rcvd /%mp3stuffdl)) 22
  drawtext -rn %@ 12632256 Fixedsys 15 8 4 Downloading mp3stuff
  drawpic %@
}
alias -l movedlwin {
  var %@ = @Downloading mp3stuff
  if ($window(%@)) {
    window %@ $calc($mouse.dx -$1) $calc($mouse.dy -$2)
    if ($mouse.key & 1) .timer -o 1 0 movedlwin $1-
  }
}
menu @Downloading mp3stuff {
  sclick:movedlwin $calc($mouse.dx -$window($menu).x) $calc($mouse.dy -$window($menu).y)
  &Cancel:close -@ $menu | sockclose downloadmp3stuff
}
on *:close:@Downloading mp3stuff:sockclose downloadmp3stuff
dialog mp3stuffo {
  title "mp3stuff options"
  size -1 -1 241 145
  option dbu
  text "Sections", 315, 8 4 48 8, center
  list 100, 6 14 53 109, size
  button "&Close", 98, 17 128 29 12, cancel
  button "", 99, 5 0 0 0, hide ok
  tab "", 81, 10 -39 176 19
  text "mp3stuff [2002.02.06]", 261, 79 44 62 8, tab 81 center
  text "by Andy Dufilie (^Andy)", 312, 79 53 62 8, tab 81 center
  button "&E-mail", 325, 80 63 29 12, tab 81
  button "&Website", 326, 111 63 29 12, tab 81
  button "&Help", 200, 96 77 29 12, tab 81
  edit "", 262, 155 42 64 12, tab 81 read center
  button "Check for new &version", 263, 155 56 64 12, tab 81
  button "I&nstall newest version", 264, 155 70 64 12, tab 81
  check "Check on &startup", 6, 155 86 54 10, tab 81
  check "&Auto-Install", 7, 155 97 41 10, tab 81
  tab "", 82
  text "File info caching:", 327, 71 9 42 8, tab 82
  check "&Use mp3 file info caching", 17, 78 18 71 10, tab 82
  button "Cle&ar cache", 238, 152 17 40 12, tab 82
  text "Play queue:", 313, 71 36 31 8, tab 82
  check "&Enqueue mp3s by default", 21, 78 45 73 10, tab 82
  check "S&huffle play queue", 30, 78 56 58 10, tab 82
  check "&Stop at end of play queue", 12, 78 67 75 10, tab 82
  text "Playing mp3s publicly:", 314, 71 85 55 8, tab 82
  check "&Mute (Disables listening, and won't open mp3s)", 1, 78 94 124 10, tab 82
  check "&Listen to mp3 CTCPs...", 2, 78 105 67 10, tab 82
  check "and allow i&nterruptions", 3, 146 105 66 10, tab 82
  check "Send mp3 C&TCPs with play message...", 4, 78 116 104 10, tab 82
  check "and ech&o them", 5, 183 116 47 10, tab 82
  check "&Replace underscores with spaces", 31, 78 127 92 10, tab 82
  tab "", 83
  button "&Edit playlist", 233, 125 47 42 12, tab 83
  check "&Use playlist as random mp3 source", 14, 97 66 96 10, tab 83
  check "&Only play each mp3 in playlist once", 15, 97 77 97 10, tab 83
  check "&Restart playlist and continue when done", 16, 97 88 109 10, tab 83
  tab "", 84
  text "Main dialogs:", 323, 80 44 34 8, tab 84
  check "&Open on desktop", 33, 87 53 54 10, tab 84
  check "&Always on top", 34, 87 64 47 10, tab 84
  text "Changing the desktop setting closes dialogs", 306, 87 75 60 16, tab 84
  text "Remote control:", 321, 159 44 41 8, tab 84
  check "Open on &startup", 27, 166 53 52 10, tab 84
  check "Open on &desktop", 26, 166 64 54 10, tab 84
  check "Always o&n top", 25, 166 75 47 10, tab 84
  button "Open re&mote", 267, 166 87 44 12, tab 84
  tab "", 85
  text "Enable mp3stuff popups for:", 302, 95 14 72 8, tab 85
  check "Status window", 201, 102 23 52 10, tab 85
  check "Menu bar", 202, 102 34 52 10, tab 85
  check "Channels", 203, 102 45 52 10, tab 85
  check "Channel nick list", 204, 102 56 52 10, tab 85
  check "Query windows", 205, 102 67 52 10, tab 85
  text "Popup elements:", 303, 95 90 44 8, tab 85
  check "'[ Next mp3 ]' appears above 'mp3stuff'", 35, 102 99 108 10, tab 85
  check "Extra choices for choose, random, etc.", 36, 102 110 107 10, tab 85
  check "Expand 'Quick toggles' menu", 37, 102 121 82 10, tab 85
  tab "", 86
  check "&Enable listening echo...", 24, 68 8 68 10, tab 86
  check "and echo to &status", 18, 137 8 57 10, tab 86
  button "&View tags", 265, 201 6 32 12, tab 86
  edit "", 142, 68 20 165 12, tab 86 autohs
  button "&Save as...", 112, 68 34 33 12, tab 86
  combo 122, 104 35 63 80, tab 86 drop
  combo 132, 170 35 63 80, tab 86 drop
  text "Colors for <c> tags in echos, separated by commas:", 343, 68 60 129 8, tab 86
  edit "", 140, 68 69 99 12, tab 86 autohs
  check "Enable ra&ndom colors", 19, 170 70 62 10, tab 86
  button "Save &as...", 110, 68 83 33 12, tab 86
  combo 120, 104 84 63 80, tab 86 drop
  combo 130, 170 84 63 80, tab 86 drop
  text "Color for </c> tags in echos:", 344, 75 114 72 8, tab 86 right
  edit "", 230, 149 112 15 12, tab 86 read center
  button "-", 239, 166 112 13 12, tab 86
  button "+", 240, 181 112 13 12, tab 86
  button "&Default", 244, 196 112 27 12, tab 86
  text "Bullet for other echos:", 345, 75 129 72 9, tab 86 right
  edit "", 211, 149 127 45 12, tab 86 autohs
  button "D&efault", 210, 196 127 27 12, tab 86
  tab "", 87
  text "Custom play message:", 310, 68 22 57 8, tab 87
  check "Send as actio&n", 23, 140 21 48 10, tab 87
  button "&View tags", 266, 201 19 32 12, tab 87
  edit "", 143, 68 33 165 12, tab 87 autohs
  button "&Save as...", 113, 68 48 33 12, tab 87
  combo 123, 104 49 63 80, tab 87 drop
  combo 133, 170 49 63 80, tab 87 drop
  text "Colors for <c> tags in messages, separated by commas:", 311, 68 82 138 8, tab 87
  edit "", 141, 68 91 99 12, tab 87 autohs
  check "&Enable random colors", 20, 170 92 63 10, tab 87
  button "Save &as...", 111, 68 105 33 12, tab 87
  combo 121, 104 106 63 80, tab 87 drop
  combo 131, 170 106 63 80, tab 87 drop
  tab "", 88
  check "Start timed channel &advertisement now, and on startup", 22, 68 22 145 10, tab 88
  edit "", 144, 68 36 165 12, tab 88 autohs
  button "&Save as...", 114, 68 51 33 12, tab 88
  combo 124, 104 52 63 80, tab 88 drop
  combo 134, 170 52 63 80, tab 88 drop
  button "&View tags", 268, 201 66 32 12, tab 88
  text "Minutes between ads:", 324, 68 78 55 8, tab 88
  edit "", 322, 124 76 16 12, tab 88 read center
  button "-", 214, 142 76 13 12, tab 88
  button "+", 217, 157 76 13 12, tab 88
  text "Note:", 309, 68 100 15 8, tab 88
  text "The channel advertisement uses the same random colors and channels as the play message.", 307, 84 100 149 16, tab 88
  tab "", 89
  check "Auto-se&nd files when they are requested (Enable file serving)", 8, 67 10 160 9, tab 89
  text "Total number of send slots:", 316, 91 31 74 8, tab 89 right
  edit "", 213, 168 29 17 12, tab 89 read center
  button "&Edit", 212, 187 29 18 12, tab 89
  text "Maximum send slots per user:", 317, 91 45 74 8, tab 89 right
  edit "", 216, 168 43 17 12, tab 89 read center
  button "E&dit", 215, 187 43 18 12, tab 89
  check "Allow requests in q&ueries", 32, 67 68 71 10, tab 89
  radio "&Serve in all channels", 272, 67 80 60 10, tab 89
  radio "Serve in these channels &only:", 273, 67 92 81 10, tab 89
  edit "", 271, 67 105 54 12, tab 89 autohs
  button "&Add ->", 269, 124 105 28 12, tab 89
  button "<- &Remove selected", 270, 94 120 58 12, tab 89
  list 328, 156 68 80 64, tab 89 size extsel hsbar vsbar
  tab "", 90
  button "Edit que&ue", 329, 69 18 37 12, tab 90
  text "Length of queue list:", 318, 116 13 76 8, tab 90 right
  edit "", 221, 195 11 17 12, tab 90 read center
  button "&Edit", 222, 214 11 18 12, tab 90
  text "Maximum file queues per user:", 319, 116 27 76 8, tab 90 right
  edit "", 224, 195 25 17 12, tab 90 read center
  button "E&dit", 225, 214 25 18 12, tab 90
  text "Friend list (Send files immediately, bypassing queue list):", 308, 70 51 139 8, tab 90
  list 336, 69 61 163 56, tab 90 sort size extsel hsbar vsbar
  button "&Add user...", 337, 69 121 39 12, tab 90
  button "&Remove selected", 338, 110 121 51 12, tab 90
  tab "", 91
  check "&Respond to @Locator/@Find searches", 10, 71 47 104 10, tab 91
  text "Optional note to send with @Locator/@Find results:", 305, 71 63 129 8, tab 91
  edit "", 223, 70 73 161 12, tab 91 autohs
  tab "", 92
  box "File serving messages", 333, 76 17 147 51, tab 92
  check "&Display script ad when auto-sending files", 9, 86 29 109 10, tab 92
  check "&Echo all messages that mp3stuff sends", 13, 86 40 105 10, tab 92
  check "&Respond to requests when features are disabled", 28, 86 51 129 10, tab 92
  box "Message delay (Flood protection)", 332, 81 87 137 33, tab 92
  text "Seconds between messages:", 339, 90 102 72 8, tab 92
  edit "", 340, 163 100 16 12, tab 92 read center
  button "-", 341, 181 100 13 12, tab 92
  button "+", 342, 196 100 13 12, tab 92
  tab "", 93
  text "Nick used in list:", 320, 67 11 42 8, tab 93
  edit "", 231, 76 20 65 12, tab 93 read autohs
  button "&Edit", 232, 143 20 18 12, tab 93
  check "I&nclude full file information (This will take longer)", 11, 67 42 129 10, tab 93
  check "Create a .&zip file", 29, 67 61 53 10, tab 93
  text "Zip command (<zip> = ''file.zip'', <txt> = ''file.txt''):", 300, 77 74 128 8, tab 93
  edit "", 301, 77 83 128 12, tab 93 autohs
  button "&WinZip", 330, 208 69 27 12, tab 93
  button "Win&Ace", 331, 208 83 27 12, tab 93
  edit "", 236, 67 108 168 12, tab 93 read autohs
  button "&View current list", 235, 67 123 49 12, tab 93
  button "&Update list", 234, 118 123 46 12, tab 93
  tab "", 94
  text "Search directories:", 335, 68 7 49 8, tab 94
  list 241, 68 16 115 50, tab 94 size extsel hsbar vsbar
  button "&Add a directory", 242, 185 16 50 12, tab 94
  button "&Remove selected", 243, 185 30 50 12, tab 94
  text "Excluded directories:   (Try to limit these. They slow down searches.)", 226, 68 77 170 8, tab 94
  list 227, 68 86 115 50, size extsel hsbar vsbar, tab 94
  button "&Add a directory", 228, 185 86 50 12, tab 94
  button "&Remove selected", 229, 185 100 50 12, tab 94
  tab "", 95
  text "File types for @Locator/@Find and file serving list:", 304, 81 19 124 8, tab 95
  edit "", 206, 88 31 27 12, tab 95 autohs limit 10
  button "&Add ->", 207, 118 31 28 12, tab 95
  text "Move selected:", 220, 97 68 41 8, tab 95
  button "&Up", 218, 102 77 30 12, tab 95
  button "&Down", 219, 102 91 30 12, tab 95
  button "<- &Remove selected", 208, 88 46 58 12, tab 95
  list 209, 150 31 62 72, tab 95 size extsel hsbar vsbar
  text "Rearranging the file types affects the order they appear in your list.", 38, 107 111 86 16, tab 95
  tab "", 96
  text "mp3 Player:", 334, 69 49 32 8, tab 96
  edit "", 251, 69 59 163 12, tab 96 read autohs
  button "&mIRC internal", 254, 69 74 53 12, disable tab 96
  button "&External player...", 252, 124 74 53 12, tab 96
  button "&Default player", 253, 179 74 53 12, tab 96
}
dialog mp3stuffs {
  title "mp3stuff - Double click an mp3 to open"
  size -1 -1 264 186
  option dbu
  tab "   Play Queue   ", 4, 3 0 257 153
  button "Open &random", 40, 215 18 40 12, tab 4
  text "Move selected:", 7, 215 40 40 8, tab 4
  button "To &top", 46, 215 49 40 12, tab 4
  button "&Up", 47, 215 61 40 12, tab 4
  button "&Down", 48, 215 75 40 12, tab 4
  button "To &bottom", 49, 215 87 40 12, tab 4
  check "&Stop at end", 44, 215 108 40 10, tab 4
  check "Shu&ffle", 45, 215 119 40 10, tab 4
  button "Remo&ve", 43, 215 136 40 12, tab 4
  list 41, 8 18 203 130, tab 4 size extsel hsbar vsbar
  tab "   mp3 History   ", 2
  button "Remove &selected", 23, 107 18 53 12, tab 2
  button "Histor&y length...", 22, 8 18 51 12, tab 2
  button "Open &random", 20, 208 18 47 12, tab 2
  list 21, 8 32 247 116, tab 2 size extsel hsbar vsbar
  tab "   Playlist Editor   ", 6
  list 61, 8 18 209 130, tab 6 sort size extsel hsbar vsbar
  button "Op&tions", 60, 221 18 34 12, tab 6
  text "Add:", 101, 221 35 34 8, tab 6
  button "&Directory", 62, 221 44 34 12, tab 6
  button "&Wildcard", 63, 221 56 34 12, tab 6
  text "Remove:", 102, 221 73 34 8, tab 6
  button "&Selected", 64, 221 82 34 12, tab 6
  button "Director&y", 65, 221 94 34 12, tab 6
  button "Wildca&rd", 66, 221 106 34 12, tab 6
  button "Dead &files", 67, 221 118 34 12, tab 6
  button "Sa&ve copy", 68, 221 136 34 12, tab 6
  tab "   mp3 Search   ", 3
  edit "", 32, 8 18 87 12, tab 3 autohs
  button "&Search", 33, 98 18 30 12, tab 3
  button "&List all", 35, 138 18 26 12, tab 3
  button "&Directories...", 34, 167 18 42 12, tab 3
  button "Open &random", 30, 212 18 43 12, tab 3
  list 31, 8 32 247 116, tab 3 sort size extsel hsbar vsbar
  tab "   File Browser   ", 5
  edit "", 52, 8 18 171 12, tab 5 read autohs
  button "..", 50, 182 18 15 12, tab 5
  combo 53, 200 19 24 112, tab 5 drop
  button "&Refresh", 54, 227 18 28 12, tab 5
  list 51, 8 32 247 102, tab 5 size extsel hsbar vsbar
  edit "", 55, 54 136 155 12, tab 5 read autohs
  check "&Play to: ", 12, 3 159 27 8
  edit "", 13, 33 157 52 12, autohs
  check "Mute", 15, 3 172 27 10
  button "C&hans", 11, 33 171 25 12
  button "Spa&m!", 10, 60 171 25 12
  check "En&queue on double-click", 14, 91 158 70 10
  check "Co&ntinuous play", 16, 91 172 70 10
  button "&Enqueue selected", 17, 165 157 65 12
  button "&Add selected to playlist", 18, 165 171 65 12
  button "&Options", 8, 232 157 29 12
  button "&Close", 9, 232 171 29 12, cancel
  button "", 1, 0 0 0 0, hide ok
}
dialog mp3stuffc1 {
  title " "
  option dbu
  size -1 -1 24 72
  button "&Open"1,0 0 24 11
  button "Option&s"2,0 11 24 11
  button "<<"3,0 22 12 11
  button ">>"4,12 22 12 11
  check "&Contin"5,0 34 24 7
  check "&Public"12,0 42 24 7
  button "C&hans"11,0 50 24 11
  button "Sp&am!"7,0 61 24 11
  button ""99,0 11 0 0,cancelhidedisable
  edit ""13,0 32 46 11,autohshide
  check "&Mute"6,25 40 21 9,hide
}
dialog mp3stuffc {
  title "mp3stuff"
  option dbu
  size -1 -1 99 33
  edit ""13,29 11 47 11,autohs
  check "&continuous play"5,2 23 47 9
  button "c&hans"11,76 11 23 11
  check "&mute"6,52 23 21 9
  button "sp&am!"7,76 22 23 11
  button "&open..."1,0 0 26 11
  button "option&s"2,26 0 27 11
  button "< pre&v"3,53 0 23 11
  button "&next >"4,76 0 23 11
  check "&play to:"12,2 12 27 9
  button ""99,0 0 0 0,cancelhidedisable
}
dialog mp3stuff_tags {
  title "mp3stuff - Supported tags"
  size -1 -1 207 129
  option dbu
  edit "", 1, 4 4 198 70, read multi vsbar
  check "&Use custom alias for <length> tag  (input will be in seconds)", 7, 5 79 156 10
  text "Alias name:", 3, 14 91 31 8, right
  edit "", 8, 47 89 40 12, autohs
  check "<!&nickmp3> acts like <mp3noext> when the file isn't available", 5, 5 104 162 10
  check "<&stereo> tag replaces 'joint stereo' with 'stereo'", 6, 5 115 130 10
  button "&Close", 9, 175 113 28 12, cancel
}
on *:dialog:mp3stuff_tags:init,sclick,edit:*:{
  if ($devent == init) {
    var %a = did -a mp3stuff_tags 1 $crlf
    did -a mp3stuff_tags 1 Colors:
    %a <c>  =  Begin random color
    %a </c>  =  End color
    %a
    %a $+ When playing an mp3:
    %a <!nickmp3>  =  Filename with !yournick added when appropriate
    %a <mp3>  =  Filename including ".mp3"
    %a <mp3noext>  =  Filename without ".mp3"
    %a <size>  =  File size
    %a <length>  =  Length of the song
    %a <kbps>  =  Quality information
    %a <khz>  =  Quality information
    %a <stereo>  =  Quality information
    if ($version >= 5.8) {
      %a
      %a $+ ID3 tags:
      %a <artist> <album> <track> <title> <year> <comment> <genre>
    }
    %a
    %a $+ File serving information:
    %a <open slots>  =  Number of unused send slots
    %a <used slots>  =  Number of files being sent
    %a <slots>  =  Total number of send slots
    %a <open queues>  =  Number of unused file queues
    %a <used queues>  =  Number of files currently queued
    %a <queues>  =  Length of queue list
    %a <mp3 count>  =  Number of mp3s in your search directories
    %a <list count>  =  Number of files in your list
    %a <list size>  =  Total size of the files in your list
    %a <date>  =  The date when your list was last updated
    %a <nick>  =  The nickname used in your list
    %a
    %a $+ Version information:
    %a <version>  =  The version of mp3stuff you have
    did -ra mp3stuff_tags 8 %mp3stuffdur
    if (%mp3stuff!nickmp3) { }
    else did -c mp3stuff_tags 5
    if (%mp3stuffstereo) did -c mp3stuff_tags 6
    if (%mp3stuffuse_dur) did -c mp3stuff_tags 7
  }
  elseif ($did == 5) %mp3stuff!nickmp3 = 1 - $did(mp3stuff_tags,5).state
  elseif ($did == 6) %mp3stuffstereo = $did(mp3stuff_tags,6).state
  elseif ($did == 7) || ($did == 8) {
    var %fix = $remove($did(mp3stuff_tags,8),$chr(32))
    while ($left(%fix,1) == $) {
      %fix = $mid(%fix,2)
    }
    if ($isalias(%fix) != $true) %fix =
    %mp3stuffdur = %fix
    if ($did == 7) did -o mp3stuff_tags 8 1 %fix
    if (%fix) { }
    else did -u mp3stuff_tags 7
    %mp3stuffuse_dur = $did(mp3stuff_tags,7).state
  }
}
dialog mp3stuff_input {
  title "mp3stuff"
  size -1 -1 124 54
  option dbu
  text "" 1, 4 2 116 21, center
  edit "" 2, 4 24 116 12, autohs result
  button "Ok" 3, 34 39 26 12, ok default
  button "Cancel" 4, 65 39 26 12, cancel
}
dialog mp3stuff_inputalert {
  title "mp3stuff"
  size -1 -1 124 54
  option dbu
  text "", 1, 4 6 116 28, center
  button "Ok", 3, 49 39 27 12, default ok
}
on *:dialog:mp3stuff_input*:init:0:did -o $dname 1 1 %mp3stufftemp
on *:dialog:mp3stuff_input*:sclick:*:unset %mp3stufftemp
dialog mp3stuff_chans {
  title "Select channels"
  size -1 -1 85 122
  option dbu
  text "Select the channels you want: "1,4 2 77 7,center
  list 2, 4 10 77 52, vsbar size sort extsel
  button "Cl&ear additional" 9, 4 63 42 11
  button "&Select none" 8, 46 63 35 11
  text "Enter additional channels here: (separate by commas)" 3, 4 77 77 14, center
  edit "" 4, 4 92 77 11, autohs result
  button "&All" 5, 4 107 25 12
  button "&Ok" 6, 30 107 25 12, ok
  button "&Cancel" 7, 56 107 25 12, cancel
}
on *:dialog:mp3stuff_chans:init,sclick,dclick:*:{
  var %did = $did
  if ($devent == init) {
    var %x = $query(0), %c = %mp3stuffplayto, %t
    ;while (%x) {
    ;  did -a mp3stuff_chans 2 $query(%x)
    ;  dec %x
    ;}
    %x = $chan(0)
    while (%x) {
      did -a mp3stuff_chans 2 $chan(%x)
      dec %x
    }
    did -z mp3stuff_chans 2
    %x = $numtok(%c,44)
    while (%x) {
      %t = $gettok(%c,%x,44)
      if ($didwm(mp3stuff_chans,2,%t)) did -ck mp3stuff_chans 2 $ifmatch
      else did -o mp3stuff_chans 4 1 $addtok($did(4),%t,44)
      dec %x
    }
  }
  elseif ($devent == dclick) || ($did(4) == all) && (%did == 2) did -r mp3stuff_chans 4
  elseif (%did == 5) {
    did -o mp3stuff_chans 4 1 all
    did -u mp3stuff_chans 2
    dialog -k mp3stuff_chans
  }
  elseif (%did == 6) {
    while ($did(2,0).sel) {
      did -o mp3stuff_chans 4 1 $addtok($did(4),$did(2,$did(2,1).sel),44)
      did -uk mp3stuff_chans 2 $did(2,1).sel
    }
    did -o mp3stuff_chans 4 1 $deltok($remove($did(4),$chr(32)),0,44)
  }
  elseif (%did == 8) did -u mp3stuff_chans 2
  elseif (%did == 9) did -rf mp3stuff_chans 4
  if ($devent == dclick) dialog -k mp3stuff_chans
}
dialog mp3stuff_friends {
  title "mp3stuff - Add to friend list"
  size -1 -1 177 111
  option dbu
  text "Nicks:"7,5 3 15 7
  list 5,3 12 48 68,sizesort
  text "Address masks for selected nick:"8,56 3 78 7
  list 6,54 12 120 68,size
  text "Friend list entry:"9,15 86 37 7,right
  edit ""1,54 84 120 11,autohsresult
  text "Comment:"10,15 99 37 7,right
  edit ""2,54 97 66 11,autohs
  button "&Add"3,123 97 25 11,okdefault
  button "&Cancel"4,149 97 25 11,cancel
}
on *:dialog:mp3stuff_friends:init,sclick,dclick:*:{
  var %did = $did
  if ($devent == dclick) && (%did isnum 5-6) {
    dialog -k mp3stuff_friends
    return
  }
  if ($devent == init) {
    var %c = $chan(0), %t
    while (%c) {
      var %n = $nick($chan(%c),0)
      while (%n) {
        %t = $nick($chan(%c),%n)
        if ($didwm(mp3stuff_friends,5,%t)) { }
        else did -a mp3stuff_friends 5 %t
        dec %n
      }
      dec %c
    }
    %c = $query(0)
    while (%c) {
      %t = $query(%c)
      if ($didwm(mp3stuff_friends,5,%t)) { }
      else did -a mp3stuff_friends 5 %t
      dec %c
    }
  }
  elseif (%did == 5) {
    var %n = $did(mp3stuff_friends,5,$did(mp3stuff_friends,5,1).sel), %x = 0
    did -r mp3stuff_friends 6
    did -o mp3stuff_friends 1,2 1 %n
    if ($address(%n,5)) {
      did -o mp3stuff_friends 1 1 $address(%n,3)
      while (%x < 10) {
        did -a mp3stuff_friends 6 $address(%n,%x)
        inc %x
      }
      did -c mp3stuff_friends 6 4
    }
  }
  elseif (%did == 6) did -o mp3stuff_friends 1 1 $did(mp3stuff_friends,6,$did(mp3stuff_friends,6,1).sel)
  elseif (%did == 3) {
    var %1 = $did(mp3stuff_friends,1), %2 = $did(mp3stuff_friends,2), %t
    if (%1) && (%2) %t = ( $+ %2 $+ )
    did -o mp3stuff_friends 1 1 %1 %t
  }
}
alias mp3stuffq {
  if ($dialog(mp3stuffq)) dialog -ev mp3stuffq
  else dialog $dflags(h) mp3stuffq mp3stuffq
}
dialog mp3stuffq {
  title "mp3stuff file-serving queue editor"
  size -1 -1 214 112
  option dbu
  list 1, 3 4 170 89, size extsel hsbar vsbar
  list 11, 3 4 170 89, size extsel hsbar vsbar hide
  button "&Top", 2, 179 4 30 12
  button "&Up", 3, 181 18 26 12
  button "&Down", 4, 181 32 26 12
  button "&Bottom", 5, 179 46 30 12
  button "&Remove", 6, 178 65 32 12
  button "Optio&ns", 7, 178 81 32 12
  button "&Ok", 8, 110 97 32 12, ok
  button "&Cancel", 9, 144 97 32 12, cancel
  button "&Apply", 10, 178 97 32 12
  text "Queue is paused until you apply changes", 12, 3 99 105 8
}
alias -l qinit {
  var %f = $f(fq)
  write %f
  var %@ = @mp3stuffqinit, %x = 1
  window -hl %@
  loadbuf %@ %f
  var %n = $line(%@,0)
  while (%x <= %n) {
    tokenize 32 $line(%@,%x)
    did -a mp3stuffq 1 $gettok($1,1,33) ... $nopath($2-)
    did -a mp3stuffq 11 $1-
    inc %x
  }
  did -z mp3stuffq 1
  close -@ %@
}
on *:dialog:mp3stuffq:init,sclick,dslick,edit:*:{
  if ($devent == init) qinit
  elseif ($did == 2) {
    var %n = $did(mp3stuffq,1,0).sel, %x = %n
    while (%x) {
      var %l = $did(mp3stuffq,1,%n).sel, %t = $did(mp3stuffq,1,%l)
      did -d mp3stuffq 1 %l
      did -ick mp3stuffq 1 1 %t
      %t = $did(mp3stuffq,11,%l)
      did -d mp3stuffq 11 %l
      did -i mp3stuffq 11 1 %t
      dec %x
    }
    did -z mp3stuffq 1
  }
  elseif ($did == 3) {
    var %n = $did(mp3stuffq,1,0).sel, %x = 1
    if ($did(mp3stuffq,1,1).sel == 1) return
    while (%x <= %n) {
      var %l = $did(mp3stuffq,1,%x).sel, %t = $did(mp3stuffq,1,%l)
      did -d mp3stuffq 1 %l
      did -ick mp3stuffq 1 $calc(%l -1) %t
      %t = $did(mp3stuffq,11,%l)
      did -d mp3stuffq 11 %l
      did -i mp3stuffq 11 $calc(%l -1) %t
      inc %x
    }
  }
  elseif ($did == 4) {
    var %x = $did(mp3stuffq,1,0).sel
    if ($did(mp3stuffq,1,%x).sel == $did(mp3stuffq,1).lines) return
    while (%x) {
      var %l = $did(mp3stuffq,1,%x).sel, %t = $did(mp3stuffq,1,%l)
      did -d mp3stuffq 1 %l
      did -ick mp3stuffq 1 $calc(1+%l) %t
      %t = $did(mp3stuffq,11,%l)
      did -d mp3stuffq 11 %l
      did -i mp3stuffq 11 $calc(1+%l) %t
      dec %x
    }
  }
  elseif ($did == 5) {
    var %x = $did(mp3stuffq,1,0).sel
    while (%x) {
      var %l = $did(mp3stuffq,1,1).sel, %t = $did(mp3stuffq,1,%l)
      did -d mp3stuffq 1 %l
      did -ack mp3stuffq 1 %t
      %t = $did(mp3stuffq,11,%l)
      did -d mp3stuffq 11 %l
      did -a mp3stuffq 11 %t
      dec %x
    }
  }
  elseif ($did == 6) {
    while ($did(mp3stuffq,1,0).sel) {
      var %x = $did(mp3stuffq,1,$did(mp3stuffq,1,0).sel).sel
      did -d mp3stuffq 1 %x
      did -d mp3stuffq 11 %x
    }
  }
  elseif ($did == 7) mp3stuffo 90
  elseif ($did == 8) || ($did == 10) {
    window -hl @mp3stuffqsave
    var %n = $did(mp3stuffq,11).lines, %x = 1
    while (%x <= %n) {
      aline @mp3stuffqsave $did(mp3stuffq,11,%x)
      inc %x
    }
    savebuf @mp3stuffqsave $f(fq)
    close -@ @mp3stuffqsave
  }
  if ($did isnum 2-6) did -z mp3stuffq 1
  elseif ($did isnum 8-10) fix_queue 1
}
alias -l colour return $color($1)
alias -l complete return 1
