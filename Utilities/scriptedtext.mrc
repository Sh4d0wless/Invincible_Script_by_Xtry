;___________________________________________
; Invincible by Xtry
; Scripted Text
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯


#gtzcoltxt off
on *:INPUT:#: {
  if ($left($1-,1) != /) && ($left($1-,1) != .) && ($left($1-,1) != !) && ($left($1-,1) != @) {
    if ($me isop $chan) {
      gtzcoltalk $1-
      echo -t $chan  $+ $_nc.rini(nc,m-) $+ @ $+ $me  $+ $color(own) $+ :  $+ %gtzcase
      halt
    }
    if ($me isvo $chan) && ($me !isop $chan) && ($me !isreg $chan) {
      gtzcoltalk $1-
      echo -t $chan  $+ $_nc.rini(nc,m-) $+ + $+ $me  $+ $color(own) $+ :  $+ %gtzcase
      halt
    }
    if ($me !isvo $chan) && ($me !isop $chan) && ($me isreg $chan) {
      gtzcoltalk $1-
      echo -t $chan  $+ $_nc.rini(nc,m-) $+ $me  $+ $color(own) $+ :  $+ %gtzcase
      halt
    }
  }
}
on *:INPUT:?: {
  if ($left($1-,1) != /) && ($left($1-,1) != .) && ($left($1-,1) != !) && ($left($1-,1) != @) {
    gtzcoltalk $1-
    echo -at  $+ $_nc.rini(nc,m-) $+ $me  $+ $color(own) $+ :  $+ %gtzcase
    halt
  }
}
#gtzcoltxt end

#scsc on
on 1:INPUT:*: {
  if ($1 = hahaha) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lha2.txt) $+  $2- | halt }
  if ($1 = hihihi) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lhi2.txt) $+  $2- | halt }
  if ($1 = hehehe) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lhe2.txt) $+  $2- | halt }
  if ($1 = huhuhu) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lhu2.txt) $+  $2- | halt }
  if ($1 = hohoho) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lho2.txt) $+  $2- | halt }
  if ($1 = haha) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lha.txt) $+  $2- | halt }
  if ($1 = hihi) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lhi.txt) $+  $2- | halt }
  if ($1 = hehe) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lhe.txt) $+  $2- | halt }
  if ($1 = huhu) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lhu.txt) $+  $2- | halt }
  if ($1 = hoho) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/lho.txt) $+  $2- | halt }
  if ($1 = lol) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ aughing  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ ut  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ oud $2- | halt }
  if ($1 = $chr(59) $+ $chr(41)) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/smile.txt) $+  $2- | halt }
  if ($1 = $chr(59) $+ $chr(40)) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/badf.txt) $+  $2- | halt }
  if ($1 = $chr(59) $+ $chr(124)) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/disap.txt) $+  $2- | halt }
  if ($1 = $chr(58) $+ $chr(41)) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/smile.txt) $+  $2- | halt }
  if ($1 = $chr(58) $+ $chr(40)) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/badf.txt) $+  $2- | halt }
  if ($1 = $chr(58) $+ $chr(124)) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/disap.txt) $+  $2- | halt }
  if ($1 = ?) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/qh.txt) $+  $2- | halt }
  if ($1 = $chr(59) $+ o) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/shf.txt) $+  $2- | halt }
  if ($1 = $chr(59) $+ p) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/wekx.txt) $+  $2- | halt }
  if ($1 = $chr(59) $+ d) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/smileb.txt) $+  $2- | halt }
  if ($1 = $chr(59) $+ x) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/upsups.txt) $+  $2- | halt }
  if ($1 = $chr(59) $+ \) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/disap3.txt) $+  $2- | halt }
  if ($1 = $chr(59) $+ /) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/disap2.txt) $+  $2- | halt }
  if ($1 = $chr(58) $+ o) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/shf.txt) $+  $2- | halt }
  if ($1 = $chr(58) $+ p) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/wekx.txt) $+  $2- | halt }
  if ($1 = $chr(58) $+ d) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/smileb.txt) $+  $2- | halt }
  if ($1 = $chr(58) $+ x) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/upsups.txt) $+  $2- | halt }
  if ($1 = $chr(58) $+ \) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/disap3.txt) $+  $2- | halt }
  if ($1 = $chr(58) $+ /) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $read(utilities/emo/disap2.txt) $+  $2- | halt }
  if ($1 = !) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active $read(utilities/emo/shoxxx.txt) $+  $2- | halt }
  if ($1 = wb) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ W $+ $cgtz(2) $+ elcome  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ ack $2- | halt }
  if ($1 = tyt) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ ake  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ our  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ ime $2- | halt }
  if ($1 = np) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ P $+ $cgtz(2) $+ roblem $2- | halt }
  if ($1 = yw) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ ou  $+ $cgtz(1) $+ W $+ $cgtz(2) $+ elcome $2- | halt }
  if ($1 = brb) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ e  $+ $cgtz(1) $+ R $+ $cgtz(2) $+ ight  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ ack $2- | halt }
  if ($1 = bbl) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ e  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ ack  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ ater $2- | halt }
  if ($1 = bbs) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ e  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ ack  $+ $cgtz(1) $+ S $+ $cgtz(2) $+ oon $2- | halt }
  if ($1 = tc) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ ake  $+ $cgtz(1) $+ C $+ $cgtz(2) $+ are $2- | halt }
  if ($1 = omg) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ h  $+ $cgtz(1) $+ M $+ $cgtz(2) $+ y  $+ $cgtz(1) $+ G $+ $cgtz(2) $+ od $2- | halt }
  if ($1 = ok) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ k $2- | halt }
  if ($1 = okay) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ kay $2- | halt }
  if ($1 = k) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ k $2- | halt }
  if ($1 = yes) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ es $2- | halt }
  if ($1 = yup) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ up $2- | halt }
  if ($1 = yep) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ ep $2- | halt }
  if ($1 = yupe) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ upe $2- | halt }
  if ($1 = no) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ o $2- | halt }
  if ($1 = nope) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ ope $2- | halt }
  if ($1 = nop) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ op $2- | halt }
  if ($1 = ty) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ hank  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ ou $2- | halt }
  if ($1 = gtg) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ G $+ $cgtz(2) $+ ot  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ G $+ $cgtz(2) $+ o $2- | halt }
  if ($1 = asl) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ A $+ $cgtz(2) $+ ge  $+ $cgtz(1) $+ S $+ $cgtz(2) $+ ex  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ ocation $2- | halt }
  if ($1 = gts) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ G $+ $cgtz(2) $+ ot  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ S $+ $cgtz(2) $+ leep $2- | halt }
  if ($1 = jk) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ J $+ $cgtz(2) $+ ust  $+ $cgtz(1) $+ K $+ $cgtz(2) $+ idding $2- | halt }
  if ($1 = j/k) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ J $+ $cgtz(2) $+ ust  $+ $cgtz(1) $+ K $+ $cgtz(2) $+ idding $2- | halt }
  if ($1 = pls) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ P $+ $cgtz(2) $+ lease $2- | halt }
  if ($1 = ic) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ I $cgtz(1) $+ S $+ $cgtz(2) $+ ee $2- | halt }
  if ($1 = btw) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ y  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ he  $+ $cgtz(1) $+ W $+ $cgtz(2) $+ ay $2- | halt }
  if ($1 = nbd) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ ig  $+ $cgtz(1) $+ D $+ $cgtz(2) $+ eal $2- | halt }
  if ($1 = imho) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ I $+ $cgtz(2) $+ n  $+ $cgtz(1) $+ M $+ $cgtz(2) $+ y  $+ $cgtz(1) $+ H $+ $cgtz(2) $+ onest  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ pinion $2- | halt }
  if ($1 = imo) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ I $+ $cgtz(2) $+ n  $+ $cgtz(1) $+ M $+ $cgtz(2) $+ y  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ pinion $2- | halt }
  if ($1 = ltns) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ ong  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ ime  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ S $+ $cgtz(2) $+ ee $2- | halt }
  if ($1 = ltnc) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ ong  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ ime  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ S $+ $cgtz(2) $+ ee $2- | halt }
  if ($1 = oic) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ h  $+ $cgtz(1) $+ I $cgtz(1) $+ S $+ $cgtz(2) $+ ee $2- | halt }
  if ($1 = thx) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ hanks $2- | halt }
  if ($1 = tnx) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ hanks $2- | halt }
  if ($1 = ctc) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ C $+ $cgtz(2) $+ are  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ C $+ $cgtz(2) $+ hat $2- | halt }
  if ($1 = wtf) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ W $+ $cgtz(2) $+ hat  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ he  $+ $cgtz(1) $+ F $+ $cgtz(2) $+ uck $2- | halt }
  if ($1 = gtf) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ G $+ $cgtz(2) $+ et  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ he  $+ $cgtz(1) $+ F $+ $cgtz(2) $+ uck $2- | halt }
  if ($1 = gth) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ G $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ H $+ $cgtz(2) $+ ell $2- | halt }
  if ($1 = jic) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ J $+ $cgtz(2) $+ ust  $+ $cgtz(1) $+ I $+ $cgtz(2) $+ n  $+ $cgtz(1) $+ C $+ $cgtz(2) $+ ase $2- | halt }
  if ($1 = wth) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ W $+ $cgtz(2) $+ hat  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ he  $+ $cgtz(1) $+ H $+ $cgtz(2) $+ ell $2- | halt }
  if ($1 = bye) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ ye  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ ye $2- | halt }
  if ($1 = nm) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ evermind $2- | halt }
  if ($1 = nvm) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ evermind $2- | halt }
  if ($1 = cool) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ C $+ $cgtz(2) $+ ool $2- | halt }
  if ($1 = kewl) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ K $+ $cgtz(2) $+ ewl $2- | halt }
  if ($1 = ttyl) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ alk  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ ou  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ ater $2- | halt }
  if ($1 = bbiaf) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ e  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ ack  $+ $cgtz(1) $+ I $+ $cgtz(2) $+ n  $+ $cgtz(1) $+ A F $+ $cgtz(2) $+ ew $2- | halt }
  if ($1 = rofl) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ R $+ $cgtz(2) $+ olling  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ n  $+ $cgtz(1) $+ F $+ $cgtz(2) $+ loor  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ aughing $2- | halt }
  if ($1 = rotfl) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ R $+ $cgtz(2) $+ olling  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ n  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ he  $+ $cgtz(1) $+ F $+ $cgtz(2) $+ loor  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ aughing $2- | halt }
  if ($1 = rotflmao) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ R $+ $cgtz(2) $+ olling  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ n  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ he  $+ $cgtz(1) $+ F $+ $cgtz(2) $+ loor  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ aughing  $+ $cgtz(1) $+ M $+ $cgtz(2) $+ y  $+ $cgtz(1) $+ A $+ $cgtz(2) $+ ss  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ ff $2- | halt }
  if ($1 = roflmao) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ R $+ $cgtz(2) $+ olling  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ n  $+ $cgtz(1) $+ T $+ $cgtz(2) $+ he  $+ $cgtz(1) $+ F $+ $cgtz(2) $+ loor  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ aughing  $+ $cgtz(1) $+ M $+ $cgtz(2) $+ y  $+ $cgtz(1) $+ A $+ $cgtz(2) $+ ss  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ ff $2- | halt }
  if ($1 = bs) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ B $+ $cgtz(2) $+ ull  $+ $cgtz(1) $+ S $+ $cgtz(2) $+ hit $2- | halt }
  if ($1 = hs) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ H $+ $cgtz(2) $+ oly  $+ $cgtz(1) $+ S $+ $cgtz(2) $+ hit $2- | halt }
  if ($1 = ys) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ ou  $+ $cgtz(1) $+ S $+ $cgtz(2) $+ uck $2- | halt }
  if ($1 = wd) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ W $+ $cgtz(2) $+ ell  $+ $cgtz(1) $+ D $+ $cgtz(2) $+ one $2- | halt }
  if ($1 = nw) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ N $+ $cgtz(2) $+ o  $+ $cgtz(1) $+ W $+ $cgtz(2) $+ ay $2- | halt }
  if ($1 = cya) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ S $+ $cgtz(2) $+ ee  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ a $2- | halt }
  if ($1 = heh) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ H $+ $cgtz(2) $+ eh $2- | halt }
  if ($1 = afk) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ A $+ $cgtz(2) $+ way  $+ $cgtz(1) $+ F $+ $cgtz(2) $+ rom  $+ $cgtz(1) $+ K $+ $cgtz(2) $+ eyboard $2- | halt }
  if ($1 = fyi) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ F $+ $cgtz(2) $+ or  $+ $cgtz(1) $+ Y $+ $cgtz(2) $+ our  $+ $cgtz(1) $+ I $+ $cgtz(2) $+ nformation $2- | halt }
  if ($1 = lmao) && ($left($1-,1) != /) && ($left($1-,1) != .) { .msg $active  $+ $cgtz(1) $+ L $+ $cgtz(2) $+ aughing  $+ $cgtz(1) $+ M $+ $cgtz(2) $+ y  $+ $cgtz(1) $+ A $+ $cgtz(2) $+ ss  $+ $cgtz(1) $+ O $+ $cgtz(2) $+ ff $2- | halt }
}
#scsc end

alias gtzsctxt { if ($dialog(gtzsctxt)) dialog -v gtzsctxt | else dialog -m gtzsctxt gtzsctxt }
dialog gtzsctxt {
  title "Scripted Text Setup"
  icon graph/fonts.ico
  size -1 -1 98 69
  option dbu
  button "Ok",1,60 40 30 10,ok
  button "Cancel",9,60 50 30 10,cancel
  box "",8,58 35 34 27
  combo 2,40 10 50 50,drop
  text "1st Colour :",3,9 12 30 7
  box "",4,5 5 87 17
  box "",5,5 18 87 17
  combo 6,40 23 50 50,drop
  text "2nd Colour :",7,9 25 30 7
  radio "Enable",10,7 40 30 10,push group
  radio "Disable",11,7 50 30 10,push
  box "",12,5 35 34 27
}
on *:dialog:gtzsctxt:*:*:{
  if ($devent == init) {
    dll dll/mdx.dll SetMircVersion $version
    dll dll/mdx.dll MarkDialog $dname
    dll dll/mdx.dll SetFont 1,9,2,3,6,7,10,11 13 14 Tahoma 
    dll dll/mdx.dll SetBorderStyle $dname 10,11,1,9 clientedge
    Color.List.1
    Color.List.2
    if (%scsc = on) { did -c gtzsctxt 10 }
    if (%scsc = off) { did -c gtzsctxt 11 }
  }  
  if ($devent == sclick) {
    if ($did = 1) {
      gtzw.Set colors color.1 $calc($gtzisset($did($dname,2).sel,15) -1 )
      gtzw.Set colors color.2 $calc($gtzisset($did($dname,6).sel,15) -1 )
    }
    if ($did = 10) { .enable #scsc | set %scsc on }
    if ($did = 11) { .disable #scsc | set %scsc off }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
