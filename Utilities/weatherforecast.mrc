;___________________________________________
; Invincible by Xtry
; Weather Forecaster
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias weafor { if ($dialog(prev)) dialog -v prev | else dialog -m prev prev }
dialog prev {
  title "Weather Forecaster"
  size 233 112 312 374
  text "Choose your country :", 1, 26 12 105 13
  combo 2, 133 7 84 200, drop size
  text "Show in :", 23, 223 14 45 13
  combo 24, 267 7 35 152, drop size
  text "Enter your city name :", 3, 1 40 143 13, right
  combo 4, 151 35 150 100, drop edit size
  button "Get forecaste", 5, 117 67 75 20
  box "", 6, 16 90 280 8
  text "Forecaste of :", 7, 7 113 63 13
  edit "", 8, 72 108 130 22, read autohs
  text "Day :", 9, 235 113 53 13
  edit "", 10, 264 108 40 22, read autohs
  text "Weather :", 11, 26 144 43 13
  edit "", 12, 74 138 127 22, read autohs
  text "Average temp. :", 13, 26 172 97 13
  edit "", 14, 104 166 40 22, read autohs
  text "Relative air humidity :", 15, 163 172 119 13
  edit "", 16, 264 166 40 22, read autohs
  box "Next days", 17, 5 196 302 112
  list 18, 10 209 292 94, size
  box "", 20, 5 306 302 34
  edit "", 21, 8 315 295 23, read autohs
  button "Close", 22, 120 345 60 20, ok
  icon 30,205 134 32 32, utilities/weather/prev01.ico, hide 
}
on 1:dialog:prev:init:*:{
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetControlMDX $dname 18 ListView listview rowselect grid single flatsb labeltip headerdrag report  > dll/views.mdx
  dll dll/mdx.dll SetDialog $dname icon utilities/weather/prev.ico
  did -i $dname 18 1 iconsize small
  did -i $dname 18 1 seticon utilities/weather/prev.ico
  did -i $dname 18 1 seticon utilities/weather/prev01.ico
  did -i $dname 18 1 seticon utilities/weather/prev02.ico
  did -i $dname 18 1 seticon utilities/weather/prev03.ico
  did -i $dname 18 1 seticon utilities/weather/prev04.ico
  did -i $dname 18 1 seticon utilities/weather/prev05.ico
  did -i $dname 18 1 seticon utilities/weather/prev06.ico
  did -i $dname 18 1 seticon utilities/weather/prev07.ico
  did -i $dname 18 1 seticon utilities/weather/prev08.ico
  did -i $dname 18 1 seticon utilities/weather/prev09.ico
  did -i $dname 18 1 seticon utilities/weather/prev10.ico
  did -i $dname 18 1 seticon utilities/weather/prev11.ico
  did -i prev 18 1 header @55:1,137:2,46:3,48:4 Day $+ $chr(9) $+ Wheater $+ $chr(9) Max. $+ $chr(9) Min.
  did -a prev 2 Australia
  did -a prev 2 Austria
  did -a prev 2 Belgium
  did -a prev 2 Brazil
  did -a prev 2 Brunei
  did -a prev 2 Bulgaria
  did -a prev 2 Canada
  did -a prev 2 Cyprus
  did -a prev 2 France
  did -a prev 2 Georgia
  did -a prev 2 Germany
  did -a prev 2 Greece
  did -a prev 2 Hungary
  did -a prev 2 Iceland
  did -a prev 2 Italy
  did -a prev 2 India
  did -a prev 2 Indonesia
  did -a prev 2 Israel
  did -a prev 2 Kwait
  did -a prev 2 Lebanon
  did -a prev 2 Luxembourg
  did -a prev 2 Malaysia
  did -a prev 2 Mexico
  did -a prev 2 Netherlands
  did -a prev 2 Norway
  did -a prev 2 Pakistan
  did -a prev 2 Philippines
  did -a prev 2 Poland
  did -a prev 2 Portugal
  did -a prev 2 Romania
  did -a prev 2 Saudi Arabia
  did -a prev 2 Slovenia
  did -a prev 2 Singapore
  did -a prev 2 Sweden
  did -a prev 2 United Kingdom
  did -a prev 2 United Arab Emirates
  did -a prev 2 Usa
  did -c prev 2 %tprev
  did -a prev 4 %cidprev
  did -c prev 4 1 
  did -a prev 24 °F
  did -a prev 24 °C
  did -c prev 24 %whes
  if $did(2) = Usa { did -ra prev 3 Type your Zip Code area: }
}
alias cr {
  if $1 = pakistan return pk
  if $1 = israel return is
  if $1 = india return in
  if $1 = Georgia return gg
  if $1 = Luxembourg return lu
  if $1 = lebanon return le
  if $1 = italy return it
  if $1 = austria return au
  if $1 = poland return pl
  if $1 = hungary return hu
  if $1 = france return fr
  if $1 = mexico return mx
  if ($1 = United Kingdom) return uk
  if $1 = Sweden return sw
  if $1 = iceland return ic
  if ($1 = United Arab Emirates) return tc
  if $1 = Bulgaria return bu
  if $1  = Kwait return ku
  if $1 = Philippines return rp
  if $1 = belgium return be
  if $1 = Netherlands return nl
  if ($1 = Saudi Arabia) return sa
  if $1 = australia return as  
  if $1 = brunei return bx
  if $1 = brazil return br
  if $1 = germany return gm
  if $1 = singapore return sn
  if $1 = malaysia return my
  if $1 = greece return gr
  if $1 = indonesia return id
  if $1 = norway return no
  if $1 = Romania return ro
  if $1 = canada return ca
  if $1 = portugal return po
  if $1 = cyprus return cy
  if $1 = slovenia return si
}

on 1:dialog:prev:edit:4:{
  %cidprev = $did(4)
}
on 1:dialog:prev:sclick:*:{
  if $did = 24 { %whes = $did($did).sel }
  if $did = 5 {
    if $did(2) = USA && $did(4) !isnum { set %scp58.erro.msg Invalid US Zip Code | av.58  | halt }
    if $did(2) = USA && $len($did(4)) > 5 { set %scp58.erro.msg Invalid US Zip Code | av.58  | halt }
    %tmpwhe = 0
    did -h prev 30
    did -r prev 8,10,12,14,16,18    
    if $did(4).text {
      %prev.tmp = 1   
      unset %prev.tmp2
      .sockclose prev     
      sockopen prev www.weather.com 80
      did -o prev 21 1 Connecting to server...
    }
  }
  if $did = 2 {
    %tprev = $did(2).sel 
    if $did(2) = USA { did -ra prev 3 Enter your Zip Code area: }
    else { did -ra prev 3 Enter your city name: }
  }
  if $did = 22 { sockclose prev }
}
on *:sockopen:prev: {
  if ($sockerr = 3) { did -ra prev 21 Can't connect to server }
  elseif ($sockerr = 4) { did -ra prev 21 Can't connect to server }
  elseif ($sockerr > 0) { did -ra prev 21 Error: $sockerr }
  if $did(prev,2) = USA { sockwrite -n prev GET /weather/us/zips/ $+ $did(prev,4) $+ .html }
  else { sockwrite -n prev GET /weather/cities/ $+  $cr($did(prev,2)) $+ __ $+ $replace($lower($did(prev,4).text),$chr(32),_,ó,o,á,a,í,i,ç,c,é,e,ê,e,õ,o,ú,u,ã,a,ô,o,lisboa,lisbon) $+ .html  }
}
on *:sockread:prev: {
  sockread %prev.tmp4 
  tokenize 32 %prev.tmp4
  if (<title> isin $1-) && (city search isin $1-) { did -ra prev 21 Forecaste for this city not found. | sockclose prev | halt | unset %prev.* }
  if (<title> isin $1-) { %prev.l = $1- | { did -ra prev 8 $remove(%prev.l,the weather channel -,<title>,</title>) } }
  if ($left($remove($1-,$chr(44)),58) = <font face="arial helvetica chicago sans serif" size=3><b>) { 
    %prev.est = $right($remove($1-,$chr(44)),$calc($len($1-) - 61)) | %prev.est = $left(%prev.est,$calc($len(%prev.est) - 15)) 
  }
  if (No report isin %prev.est) { did -ra prev 12,14,16 n/d | unset %prev.est }
  if %prev.est && %tmpwhe =  0 { did -i prev 12 1 %prev.est | did -v prev 30 | did -g prev 30 utilities/weather/ $+ $whei(%prev.est) | inc %tmpwhe } 
  if %prev.est && temp: isin $1- || (rel. humidity: isin $1-) { %prev.vez = $ifmatch }
  if %prev.est && (<td width=90><font face="arial helvetica chicago sans serif" size=2> isin $remove($1-,$chr(44))) {
    if (Temp: isin %prev.vez) { did -ra prev 21 receiving data... | did -ra prev 14 $farcel($remove($gettok($1-,3,62),</font,&deg;F)) $+ $whes  }
    if (Rel. Humidity: isin %prev.vez) { did -ra prev 21 receiving data... | did -ra prev 16 $replace($remove($gettok($1-,3,62),</font),&deg;,°) }
    unset %prev.vez
  }
  if Last updated isin $1- && $left($1-,3) = <TD { var %tmp = $gettok($1-,6,44) | %tmp = $gettok($left(%tmp,4),1,32) $gettok(%tmp,2,32) | did -ra prev 10 $prev.dt(%tmp) }
  if %prev.tmp < 7 { if (WIDTH="66" BGCOLOR="#649CCC" isin $1-) { if %prev.tmp > 1 { %prev.tmp2 = $prev.dt($remove($gettok($1-,5,62),<br,</b,>))  } | inc %prev.tmp } }
  if %prev.tmp < 7 { if  (<TD ALIGN="center" VALIGN="middle" WIDTH="65" BGCOLOR="#E4ECF4"><FONT isin $1-)  { if %prev.tmp > 2 { %prev.tmp2 = %prev.tmp2 $chr(9) $+ $prev.es($remove($gettok($1-,3,62),</FONT)) } } }
  if %prev.tmp < 7 { if  (<TD ALIGN="right" VALIGN="middle" WIDTH="65" BGCOLOR="#E4ECF4">  isin $1-) { if %prev.tmp > 2 { %prev.tmp2 = %prev.tmp2 $chr(9) $farcel($remove($gettok($1-,5,62),</FONT,F,hi,&nbsp;,&deg;)) $whes } } }
  if %prev.tmp < 7 { if (<FONT COLOR="#0000FF"><NOBR>lo isin $1-) { if %prev.tmp > 2 { %prev.tmp2 = %prev.tmp2 $chr(9) $farcel($remove($gettok($1-,3,62),</NOBR,&nbsp;,&deg;,F,lo)) $+ $whes | did -a prev 18 %prev.tmp2 } } }
  if %prev.tmp = 7 { sockclose prev | did -ra prev 21 Done. | unset %prev.* |  }
  if </html> = $1- { sockclose prev | did -ra prev 21 Done. | unset %prev.* }
}
alias farcel { 
  if %whes = 1 { return $1 }
  else { return $round($calc($calc(5 / 9) * $calc($1 - 32)),0) }
}
alias prev.es {
  if $1- = Scattered Showers { return 2 $1- }
  if $1- = Mostly Cloudy { return 4 $1- }
  if $1- = Fair { return 5 $1- }
  if $1- = Rain { return 3 $1- }
  if $1- = Cloudy { return 1 $1- }
  if $1- = Partly Cloudy { return 6 $1- }
  if $1- = Scattered T-storms { return 7 $1- }
  if $1- = Scattered snow showers { return 12 $1- }
  if $1- = Sunny { return 8 $1- }
  if $1- = Showers { return 3 $1- }
  if $1- = Snow { return 9 $1- }
  if $1- = Rain and Snow { return 9 $1- }
  if $1- = Snow  showers { return 9 $1- }
  if $1- = Fog { return 1 $1- }
  if $1- = Light rain with thunder { return 7 $1- }
  if $1- = Isolated T-storms { return 7 $1- }
  if $1 = Light rain with thunder { return 7 $1- }
  if $1 = T-storms { return 7 $1- }  
  if $1 = haze { return 11 $1- }  
  return 5 $1-
}
alias whei {
  if $1- = Scattered Showers { return prev01.ico }
  if $1- = Mostly Cloudy { return prev03.ico }
  if $1- = Fair { return prev04.ico }
  if $1- = Rain { return prev02.ico }
  if $1- = Cloudy { return prev.ico }
  if $1- = Partly Cloudy { return prev05.ico }
  if $1- = Scattered T-storms { return prev06.ico }
  if $1- = Sunny { return prev07.ico }
  if $1- = Showers { return prev02.ico }
  if $1- = Snow { return prev08.ico }
  if $1- = Rain and Snow { eturn prev08.ico }
  if $1- = Snow showers { return prev08.ico }
  if $1- = Fog { return prev09.ico }
  if $1- = Light rain with thunder { return prev06.ico }
  if $1- = Isolated T-storms { return prev06.ico }
  if $1 = Light rain with thunder { return prev06.ico }
  if $1 = T-storms { return prev06.ico }  
  if $1 = haze { return prev10.ico }  
  if $1- = Scattered snow showers { return prev11.ico } 
  return prev04.ico
}
alias prev.dt {
  var %tmp = $replace($1-,JAN,jan,FEB,feb,MAR,mar,APR,apr,MAY,may,JUN,jun,JUL,jul,AUG,aug,SEP,sep,OCT,oct,NOV,nov,DEC,dec)
  return 0 $gettok($1-,2,32) $gettok(%tmp,1,32)
}
alias whes {
  if %whes = 1 { Return °F }
  else { return °C }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
