;------------------------------------------------------------------------------
; scramble by Andy Dufilie (^Andy)
;------------------------------------------------------------------------------
; this is an addon made for mIRC32 v5.7
; homepage:  http://come.to/andys.site/  or  http://pages.cthome.net/pdufilie/
; send bug reports, comments, and suggestions to: a_s_d@snet.net
;------------------------------------------------------------------------------
; type "/scramble <text>" in a channel
; $scramble(<text>) also works as an identifier
;------------------------------------------------------------------------------
alias scramble {
  if ($active !ischan) || (* !iswm $1-) && ($isid == $false) {
    echo $colour(info) *** use /scramble <text> in a channel.
    return
  }
  var %x = $numtok($1-,32), %o, %n, %t, %l, %w
  while (%x) {
    %w = $gettok($1-,%x,32)
    while ($len(%w)) {
      %t = %t $mid(%w,1,1)
      %w = $right(%w,-1)
    }
    while ($numtok(%t,32)) {
      %n = $rand(1,$numtok(%t,32))
      %w = $gettok(%t,%n,32) $+ %w
      %t = $deltok(%t,%n,32)
    }
    %o = %w %o
    dec %x
  }
  if ($isid) return %o
  if (* iswm $1) {
    echo $colour(info) *** scrambled this: $1-
    say unscramble this: %o
    %scramble_text = $1-
    %scramble_channel = $active
  }
}
on *:text:*:#:{
  if (%scramble_channel == #) && (%scramble_text) && (%scramble_text $+ * iswm $1-) {
    msg # yay, $nick got the correct answer: " $+ %scramble_text $+ "
    unset %scramble_*
  }
  if (%aygame_channel == #) && (%aygame_text) && (%aygame_text $+ * iswm $1-) {
    msg # yay, $nick got the correct answer: " $+ %aygame_text $+ "
    unset %aygame_*
  }
}
alias ay {
  var %x = $len($1-), %l, %o, %i = $1-, %a = abcdefghijklmnopqrstuvwxyz 0123456789/|\,.:;()?!+-*<>{}[]&~'`^$#@%=_¯"
  var %b = ay bee see dee ee ef gee aych eye jay kay el em en oh pee kyew are es tea yew vee dubbleyew ecks why zee space $&
    zero one two three four five six seven eight nine slash pipe backslash comma dot colon semicolon openparentheses closeparentheses $&
    questionmark exclamationpoint plus minus star lessthan greaterthan leftbrace rightbrace leftsquarebracket rightsquarebracket $&
    and tilde apostrophe apostrophe carat dollarsign numbersign at percent equals underscore overscore doublequote
  while (%x) {
    %l = $mid(%i,%x,1)
    if ($pos(%a,%l,1)) %o = $gettok(%b,$ifmatch,32) %o
    else %o = %l %o
    dec %x
  }
  if ($isid) return %o
  say %o
}
alias aygame {
  if (* iswm $1) {
    echo $colour(info) *** ay'd this: $1-
    say decode this: $ay($1-)
    %aygame_text = $1-
    %aygame_channel = $active
  }
}
