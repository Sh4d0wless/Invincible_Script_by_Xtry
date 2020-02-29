;___________________________________________
; Invincible by Xtry
; DNS & Whois System
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on ^*:DNS: {
  haltdef
  linesep -a
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) DNS result for $+ $cxs(1) $1-
  echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Host address $cxs(3) $+ : $+ $cxs(1) $iaddress 
  if ($naddress = $null) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Can't get local host address }
  else { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Local host address $cxs(3) $+ : $+ $cxs(1) $naddress }
  if ($raddress = $null) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Can't resolve IP address }
  else {
    var %dnsnumhosts $dns(0), %dnshost = 0
    var %dnshosts
    while (%dnshost < %dnsnumhosts) {
      inc %dnshost 1
      set %dnshosts %dnshosts $iif($dns(1) == $dns(1).ip,$dns(%dnshost).addr,$dns(%dnshost).ip) $+ $chr(44)
    }
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Resolved address $cxs(3) $+ : $+ $cxs(1) $left(%dnshosts,$calc($len(%dnshosts)-1))
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) End of DNS result for $+ $cxs(1) $1-
  }
  linesep -a
  halt
}

alias whois.chx {
  if ($calc($count(%whois.channels,$chr(32)) + 1) = 1) { return 1 Channel }
  else { return $calc($count(%whois.channels,$chr(32)) + 1) Channels }
}
alias whois.chop { 
  if ($calc($count(%whois.channels2,$chr(32) $+ @) > 0)) { return  $+ $cxs(1) $+ $calc($count(%whois.channels2,$chr(32) $+ @)) $+ $cxs(2) $+ Op }
}
alias whois.chvo {
  if ($calc($count(%whois.channels2,$chr(32) $+ +) > 0)) { return  $+ $cxs(1) $+ $calc($count(%whois.channels2,$chr(32) $+ +)) $+ $cxs(2) $+ Vo }
}
alias whois.chreg {
  set %chregop $count(%whois.channels2,$chr(32) $+ @)
  set %chregvo $count(%whois.channels2,$chr(32) $+ +)
  set %chregtot $count(%whois.channels2,$chr(32))
  if ($calc(%chregtot - $calc(%chregop + %chregvo)) > 0) { return  $+ $cxs(1) $+ $calc(%chregtot - $calc(%chregop + %chregvo)) $+ $cxs(2) $+ Reg }
}
alias whois.ver return Whois System by %auname
alias whois.line { return  $+ $colour(whois) $+ $str(-,60) }
alias whois.reg var %. = $chr(32) $+ $1 $+ $chr(40) $+ $2 $+ $chr(41) | %whois.using = $addtok(%whois.using,%.,44)
alias whois.unreg if ($numtok(%whois.using,44) < 2) unset %whois.using | var %. = $remtok(%whois.using,$matchtok(%whousing,$1,1,44),44) | if (%.) %whois.using = %.
alias whois.country {
  set %whois.country $right($1-,4)
  if (%whois.country == .com) { unset %whois.country | return Commercial }
  if (%whois.country == .net) { unset %whois.country | return Network }
  if (%whois.country == .org) { unset %whois.country | return Organization }
  if (%whois.country == .edu) { unset %whois.country | return Educational }
  if (%whois.country == .gov) { unset %whois.country | return Government }
  if (%whois.country == .ato) { unset %whois.country | return Nato Field }
  if (%whois.country == .rpa) { unset %whois.country | return Old School Arpanet }
  if (%whois.country == .mil) { unset %whois.country | return Military }
  if (%whois.country == .int) { unset %whois.country | return International }
  if (%whois.country == .med) { unset %whois.country | return United States Medical }
  if (%whois.country == .rpa) { unset %whois.country | return Arpanet }
  if (%whois.country == .ato) { unset %whois.country | return Nato field }
  set %whois.country $right($1-,3)
  if (%whois.country == .ad) { unset %whois.country | return Andorra }
  if (%whois.country == .ae) { unset %whois.country | return United Arab Emirates }
  if (%whois.country == .af) { unset %whois.country | return Afghanistan }
  if (%whois.country == .ag) { unset %whois.country | return Antigua and Barbuda }
  if (%whois.country == .ai) { unset %whois.country | return Anguilla }
  if (%whois.country == .al) { unset %whois.country | return Albania }
  if (%whois.country == .am) { unset %whois.country | return Armenia }
  if (%whois.country == .an) { unset %whois.country | return Netherlands Antilles }
  if (%whois.country == .ao) { unset %whois.country | return Angola }
  if (%whois.country == .aq) { unset %whois.country | return Antarctica }
  if (%whois.country == .ar) { unset %whois.country | return Argentina }
  if (%whois.country == .as) { unset %whois.country | return American Samoa }
  if (%whois.country == .at) { unset %whois.country | return Austria }
  if (%whois.country == .au) { unset %whois.country | return Australia }
  if (%whois.country == .aw) { unset %whois.country | return Aruba }
  if (%whois.country == .az) { unset %whois.country | return Azerbaijan }
  if (%whois.country == .ba) { unset %whois.country | return Bosnia/Herzegovina }
  if (%whois.country == .bb) { unset %whois.country | return Barbados }
  if (%whois.country == .bd) { unset %whois.country | return Bangladesh }
  if (%whois.country == .be) { unset %whois.country | return Belgium }
  if (%whois.country == .bf) { unset %whois.country | return Burkina faso }
  if (%whois.country == .bg) { unset %whois.country | return Bulgaria }
  if (%whois.country == .bh) { unset %whois.country | return Bahrain }
  if (%whois.country == .bi) { unset %whois.country | return Burundi }
  if (%whois.country == .bj) { unset %whois.country | return Benin }
  if (%whois.country == .bm) { unset %whois.country | return Bermuda }
  if (%whois.country == .bn) { unset %whois.country | return Brunei Darussalam }
  if (%whois.country == .bo) { unset %whois.country | return Bolivia }
  if (%whois.country == .br) { unset %whois.country | return Brazil }
  if (%whois.country == .bs) { unset %whois.country | return Bahamas }
  if (%whois.country == .bt) { unset %whois.country | return Bhutan }
  if (%whois.country == .bv) { unset %whois.country | return Bouvet Island }
  if (%whois.country == .bw) { unset %whois.country | return Botswana }
  if (%whois.country == .by) { unset %whois.country | return Belarus }
  if (%whois.country == .bz) { unset %whois.country | return Belize }
  if (%whois.country == .ca) { unset %whois.country | return Canada }
  if (%whois.country == .cc) { unset %whois.country | return Cocos Islands }
  if (%whois.country == .cf) { unset %whois.country | return Central African Republic }
  if (%whois.country == .cg) { unset %whois.country | return Congo }
  if (%whois.country == .ch) { unset %whois.country | return Switzerland }
  if (%whois.country == .ci) { unset %whois.country | return Cote d'Ivoire }
  if (%whois.country == .ck) { unset %whois.country | return Cook Islands }
  if (%whois.country == .cl) { unset %whois.country | return Chile }
  if (%whois.country == .cm) { unset %whois.country | return Cameroon }
  if (%whois.country == .cn) { unset %whois.country | return China }
  if (%whois.country == .co) { unset %whois.country | return Colombia }
  if (%whois.country == .cr) { unset %whois.country | return Costa Rica }
  if (%whois.country == .cs) { unset %whois.country | return Former Czechoslovakia }
  if (%whois.country == .cu) { unset %whois.country | return Cuba }
  if (%whois.country == .cv) { unset %whois.country | return Cape Verde }
  if (%whois.country == .cx) { unset %whois.country | return Christmas Island }
  if (%whois.country == .cy) { unset %whois.country | return Cyprus }
  if (%whois.country == .cz) { unset %whois.country | return Czech Republic }
  if (%whois.country == .de) { unset %whois.country | return Germany }
  if (%whois.country == .dj) { unset %whois.country | return Djibouti }
  if (%whois.country == .dk) { unset %whois.country | return Denmark }
  if (%whois.country == .dm) { unset %whois.country | return Dominica }
  if (%whois.country == .do) { unset %whois.country | return Dominican Republic }
  if (%whois.country == .dz) { unset %whois.country | return Algeria }
  if (%whois.country == .ec) { unset %whois.country | return Ecuador }
  if (%whois.country == .ee) { unset %whois.country | return Estonia }
  if (%whois.country == .eg) { unset %whois.country | return Egypt }
  if (%whois.country == .eh) { unset %whois.country | return Western Sahara }
  if (%whois.country == .er) { unset %whois.country | return Eritrea }
  if (%whois.country == .es) { unset %whois.country | return Spain }
  if (%whois.country == .et) { unset %whois.country | return Ethiopia }
  if (%whois.country == .fi) { unset %whois.country | return Finland }
  if (%whois.country == .fj) { unset %whois.country | return Fiji }
  if (%whois.country == .fk) { unset %whois.country | return Falkland Islands }
  if (%whois.country == .fm) { unset %whois.country | return Micronesia }
  if (%whois.country == .fo) { unset %whois.country | return Faroe Islands }
  if (%whois.country == .fr) { unset %whois.country | return France }
  if (%whois.country == .fx) { unset %whois.country | return Metropolitan France }
  if (%whois.country == .ga) { unset %whois.country | return Gabon }
  if (%whois.country == .gb) { unset %whois.country | return Great Britain }
  if (%whois.country == .gd) { unset %whois.country | return Grenada }
  if (%whois.country == .ge) { unset %whois.country | return Georgia }
  if (%whois.country == .gf) { unset %whois.country | return French Guiana }
  if (%whois.country == .gh) { unset %whois.country | return Ghana }
  if (%whois.country == .gi) { unset %whois.country | return Gibraltar }
  if (%whois.country == .gl) { unset %whois.country | return Greenland }
  if (%whois.country == .gm) { unset %whois.country | return Gambia }
  if (%whois.country == .gn) { unset %whois.country | return Guinea }
  if (%whois.country == .gp) { unset %whois.country | return Guadeloupe }
  if (%whois.country == .gq) { unset %whois.country | return Equatorial Guinea }
  if (%whois.country == .gr) { unset %whois.country | return Greece }
  if (%whois.country == .gs) { unset %whois.country | return South Georgia & South Sandwich Isls. }
  if (%whois.country == .gt) { unset %whois.country | return Guatemala }
  if (%whois.country == .gu) { unset %whois.country | return Guam }
  if (%whois.country == .gw) { unset %whois.country | return Guinea-bissau }
  if (%whois.country == .gy) { unset %whois.country | return Guyana }
  if (%whois.country == .hk) { unset %whois.country | return Hong Kong }
  if (%whois.country == .hm) { unset %whois.country | return Heard & McDonald Islands }
  if (%whois.country == .hn) { unset %whois.country | return Honduras }
  if (%whois.country == .hr) { unset %whois.country | return Croatia }
  if (%whois.country == .ht) { unset %whois.country | return Haiti }
  if (%whois.country == .hu) { unset %whois.country | return Hungary }
  if (%whois.country == .id) { unset %whois.country | return Indonesia }
  if (%whois.country == .ie) { unset %whois.country | return Ireland }
  if (%whois.country == .il) { unset %whois.country | return Israel }
  if (%whois.country == .in) { unset %whois.country | return India }
  if (%whois.country == .io) { unset %whois.country | return British Indian Ocean Territory }
  if (%whois.country == .iq) { unset %whois.country | return Iraq }
  if (%whois.country == .ir) { unset %whois.country | return Iran }
  if (%whois.country == .is) { unset %whois.country | return Iceland }
  if (%whois.country == .it) { unset %whois.country | return Italy }
  if (%whois.country == .jm) { unset %whois.country | return Jamaica }
  if (%whois.country == .jp) { unset %whois.country | return Japan }
  if (%whois.country == .ke) { unset %whois.country | return Kenya }
  if (%whois.country == .kg) { unset %whois.country | return Kyrgyzstan }
  if (%whois.country == .kh) { unset %whois.country | return Cambodia }
  if (%whois.country == .ki) { unset %whois.country | return Kiribati }
  if (%whois.country == .km) { unset %whois.country | return Comoros }
  if (%whois.country == .kn) { unset %whois.country | return St. Kitts and Nevis }
  if (%whois.country == .kp) { unset %whois.country | return North Korea }
  if (%whois.country == .kr) { unset %whois.country | return South Korea }
  if (%whois.country == .kw) { unset %whois.country | return Kuwait }
  if (%whois.country == .ky) { unset %whois.country | return Cayman Islands }
  if (%whois.country == .kz) { unset %whois.country | return Kazakhstan }
  if (%whois.country == .la) { unset %whois.country | return Laos }
  if (%whois.country == .lb) { unset %whois.country | return Lebanon }
  if (%whois.country == .lc) { unset %whois.country | return Saint Lucia }
  if (%whois.country == .li) { unset %whois.country | return Liechtenstein }
  if (%whois.country == .lk) { unset %whois.country | return Sri Lanka }
  if (%whois.country == .lr) { unset %whois.country | return Liberia }
  if (%whois.country == .ls) { unset %whois.country | return Lesotho }
  if (%whois.country == .lt) { unset %whois.country | return Lithuania }
  if (%whois.country == .lu) { unset %whois.country | return Luxembourg }
  if (%whois.country == .lv) { unset %whois.country | return Latvia }
  if (%whois.country == .ly) { unset %whois.country | return Libya }
  if (%whois.country == .ma) { unset %whois.country | return Morocco }
  if (%whois.country == .mc) { unset %whois.country | return Monaco }
  if (%whois.country == .md) { unset %whois.country | return Moldova }
  if (%whois.country == .mg) { unset %whois.country | return Madagascar }
  if (%whois.country == .mh) { unset %whois.country | return Marshall Islands }
  if (%whois.country == .mk) { unset %whois.country | return Macedonia }
  if (%whois.country == .ml) { unset %whois.country | return Mali }
  if (%whois.country == .mm) { unset %whois.country | return Myanmar }
  if (%whois.country == .mn) { unset %whois.country | return Mongolia }
  if (%whois.country == .mo) { unset %whois.country | return Macau }
  if (%whois.country == .mp) { unset %whois.country | return Northern Mariana Islands }
  if (%whois.country == .mq) { unset %whois.country | return Martinique }
  if (%whois.country == .mr) { unset %whois.country | return Mauritania }
  if (%whois.country == .ms) { unset %whois.country | return Montserrat }
  if (%whois.country == .mt) { unset %whois.country | return Malta }
  if (%whois.country == .mu) { unset %whois.country | return Mauritius }
  if (%whois.country == .mv) { unset %whois.country | return Maldives }
  if (%whois.country == .mw) { unset %whois.country | return Malawi }
  if (%whois.country == .mx) { unset %whois.country | return Mexico }
  if (%whois.country == .my) { unset %whois.country | return Malaysia }
  if (%whois.country == .mz) { unset %whois.country | return Mozambique }
  if (%whois.country == .na) { unset %whois.country | return Namibia }
  if (%whois.country == .nc) { unset %whois.country | return New Caledonia }
  if (%whois.country == .ne) { unset %whois.country | return Niger }
  if (%whois.country == .nf) { unset %whois.country | return Norfolk Island }
  if (%whois.country == .ng) { unset %whois.country | return Nigeria }
  if (%whois.country == .ni) { unset %whois.country | return Nicaragua }
  if (%whois.country == .nl) { unset %whois.country | return Netherlands }
  if (%whois.country == .no) { unset %whois.country | return Norway }
  if (%whois.country == .np) { unset %whois.country | return Nepal }
  if (%whois.country == .nr) { unset %whois.country | return Nauru }
  if (%whois.country == .nt) { unset %whois.country | return Neutral Zone }
  if (%whois.country == .nu) { unset %whois.country | return Niue }
  if (%whois.country == .nz) { unset %whois.country | return New Zealand }
  if (%whois.country == .om) { unset %whois.country | return Oman }
  if (%whois.country == .pa) { unset %whois.country | return Panama }
  if (%whois.country == .pe) { unset %whois.country | return Peru }
  if (%whois.country == .pf) { unset %whois.country | return French Polynesia }
  if (%whois.country == .pg) { unset %whois.country | return Papua New Guinea }
  if (%whois.country == .ph) { unset %whois.country | return Philippines }
  if (%whois.country == .pk) { unset %whois.country | return Pakistan }
  if (%whois.country == .pl) { unset %whois.country | return Poland }
  if (%whois.country == .pm) { unset %whois.country | return St. Pierre & Miquelon }
  if (%whois.country == .pn) { unset %whois.country | return Pitcairn }
  if (%whois.country == .pt) { unset %whois.country | return Portugal }
  if (%whois.country == .pw) { unset %whois.country | return Palau }
  if (%whois.country == .py) { unset %whois.country | return Paraguay }
  if (%whois.country == .qa) { unset %whois.country | return Qatar }
  if (%whois.country == .re) { unset %whois.country | return Reunion }
  if (%whois.country == .ro) { unset %whois.country | return Romania }
  if (%whois.country == .ru) { unset %whois.country | return Russian Federation }
  if (%whois.country == .rw) { unset %whois.country | return Rwanda }
  if (%whois.country == .sa) { unset %whois.country | return Saudi Arabia }
  if (%whois.country == .sb) { unset %whois.country | return Solomon Islands }
  if (%whois.country == .sc) { unset %whois.country | return Seychelles }
  if (%whois.country == .sd) { unset %whois.country | return Sudan }
  if (%whois.country == .se) { unset %whois.country | return Sweden }
  if (%whois.country == .sg) { unset %whois.country | return Singapore }
  if (%whois.country == .sh) { unset %whois.country | return St. Helena }
  if (%whois.country == .si) { unset %whois.country | return Slovenia }
  if (%whois.country == .sj) { unset %whois.country | return Svalbard & Jan Mayen Islands }
  if (%whois.country == .sk) { unset %whois.country | return Slovak Republic }
  if (%whois.country == .sl) { unset %whois.country | return Sierra Leone }
  if (%whois.country == .sm) { unset %whois.country | return San Marino }
  if (%whois.country == .sn) { unset %whois.country | return Senegal }
  if (%whois.country == .so) { unset %whois.country | return Somalia }
  if (%whois.country == .sr) { unset %whois.country | return Suriname }
  if (%whois.country == .st) { unset %whois.country | return Sao Tome & Principe }
  if (%whois.country == .su) { unset %whois.country | return Former USSR }
  if (%whois.country == .sv) { unset %whois.country | return el Salvador }
  if (%whois.country == .sy) { unset %whois.country | return Syria }
  if (%whois.country == .sz) { unset %whois.country | return Swaziland }
  if (%whois.country == .tc) { unset %whois.country | return Turks & Caicos Islands }
  if (%whois.country == .td) { unset %whois.country | return Chad }
  if (%whois.country == .tf) { unset %whois.country | return French Southern Territories }
  if (%whois.country == .tg) { unset %whois.country | return Togo }
  if (%whois.country == .th) { unset %whois.country | return Thailand }
  if (%whois.country == .tj) { unset %whois.country | return Tajikistan }
  if (%whois.country == .tk) { unset %whois.country | return Tokelau }
  if (%whois.country == .tm) { unset %whois.country | return Turkmenistan }
  if (%whois.country == .tn) { unset %whois.country | return Tunisia }
  if (%whois.country == .to) { unset %whois.country | return Tonga }
  if (%whois.country == .tp) { unset %whois.country | return East Timor }
  if (%whois.country == .tr) { unset %whois.country | return Turkey }
  if (%whois.country == .tt) { unset %whois.country | return Trinidad & Tobago }
  if (%whois.country == .tv) { unset %whois.country | return Tuvalu }
  if (%whois.country == .tw) { unset %whois.country | return Taiwan }
  if (%whois.country == .tz) { unset %whois.country | return Tanzania }
  if (%whois.country == .ua) { unset %whois.country | return Ukraine }
  if (%whois.country == .ug) { unset %whois.country | return Uganda }
  if (%whois.country == .uk) { unset %whois.country | return United Kingdom }
  if (%whois.country == .um) { unset %whois.country | return US Minor Outlying Islands }
  if (%whois.country == .us) { unset %whois.country | return United States }
  if (%whois.country == .uy) { unset %whois.country | return Uruguay }
  if (%whois.country == .uz) { unset %whois.country | return Uzbekistan }
  if (%whois.country == .va) { unset %whois.country | return Vatican City State }
  if (%whois.country == .vc) { unset %whois.country | return St. Vincent & The Grenadines }
  if (%whois.country == .ve) { unset %whois.country | return Venezuela }
  if (%whois.country == .vg) { unset %whois.country | return British Virgin Islands }
  if (%whois.country == .vi) { unset %whois.country | return US Virgin Islands }
  if (%whois.country == .vn) { unset %whois.country | return Vietnam }
  if (%whois.country == .vu) { unset %whois.country | return Vanuatu }
  if (%whois.country == .wf) { unset %whois.country | return Wallis & Futuna Islands }
  if (%whois.country == .ws) { unset %whois.country | return Samoa }
  if (%whois.country == .ye) { unset %whois.country | return Yemen }
  if (%whois.country == .yt) { unset %whois.country | return Mayotte }
  if (%whois.country == .yu) { unset %whois.country | return Yugoslavia }
  if (%whois.country == .za) { unset %whois.country | return South Africa }
  if (%whois.country == .zm) { unset %whois.country | return Zambia }
  if (%whois.country == .zr) { unset %whois.country | return Zaire }
  if (%whois.country == .zw) { unset %whois.country | return Zimbabwe }
  else { unset %whois.country | return Unknown }
}
raw *:* {
  unset %whois.raw | %whois.raw = $numeric
  if (%whois.raw == 301) { %whois.away = yes | %whois.reason = $3- | haltdef }
  if (%whois.raw == 307) { %whois.ident = 1 | haltdef }
  if (%whois.raw == 310) { %whois.helper = yes | haltdef }
  if (%whois.raw == 311) { %whois.nick = $2 | %whois.address = $3 $+ @ $+ $4 | %whois.name = $6- | haltdef }
  if (%whois.raw == 312) { %whois.server = $3 | %whois.serverinfo = $4- | haltdef }
  if (%whois.raw == 378) { %whois.ispr = $2- | %whois.ispr2 = $4- | %whois.ispr3 = $6- | haltdef }
  if (%whois.raw == 313) { %whois.ircop = yes | set %whois.operinfo $5- | haltdef }
  if (%whois.raw == 314) {
    %whowas.nick = $2 | %whowas.address = $3 $+ @ $+ $4 | %whowas.name = $6-
    .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Whowas info for $+ $cxs(1) %whowas.nick
    .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Full name $cxs(3) $+ : $+ $cxs(1) %whowas.name
    .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Address $cxs(3) $+ : $+ $cxs(1) %whowas.address  $+ $cxs(3) $+ - $+ $cxs(1) $whois.country(%whowas.address)
    .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) End of whowas info for $+ $cxs(1) %whowas.nick
    unset %whowas.* | haltdef
  }
  if (%whois.raw == 317) { %whois.idle = $3 | %whois.idle2 = $asctime($4,HH:nn:ss dddd dd mmmm yyyy) | %whois.idle3 = $calc($ctime - $4) | haltdef }
  if (%whois.raw == 318) {
    if (%whois.nick == 0) { unset %whois.* | halt }
    linesep -a
    .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Whois info for $+ $cxs(1) %whois.nick  $+ $cxs(3) $+ ( $+ $cxs(2) $+ $ujoinlevelw $+ $cxs(3) $+ )
    if (%whois.name) { .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Full name $cxs(3) $+ : %whois.name }
    if (%whois.address) { .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Address $cxs(3) $+ : $+ $cxs(1) %whois.address  $+ $cxs(3) $+ - $+ $cxs(1) $whois.country(%whois.address) }
    if (%whois.ispr) { .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) ISP report $cxs(3) $+ : $+ $cxs(1) %whois.ispr  $+ $cxs(3) $+ - $+ $cxs(1) %whois.ispr2   $+ $cxs(3) $+ - $+ $cxs(1) %whois.ispr3 }
    if (%whois.channels) { .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Channels $cxs(3) $+ : $+ $cxs(1) %whois.channels  $+ $cxs(3) $+ - $+ $cxs(1) $whois.chx  $+ $cxs(3) $+ ( $+ $whois.chop $+ $whois.chvo $+ $whois.chreg $+ $cxs(3) $+ ) }
    if (%whois.server) { .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Server $cxs(3) $+ : $+ $cxs(1) %whois.server  $+ $cxs(3) $+ - $+ $cxs(1) %whois.serverinfo }
    if (%whois.idle) { .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Idle time $cxs(3) $+ : $+ $cxs(1) $duration(%whois.idle)  $+ $cxs(3) $+ - $cxs(2) $+ Signed on  $+ $cxs(1) $+ %whois.idle2  $+ $cxs(3) $+ - $cxs(2) $+ Online  $+ $cxs(1) $+ $duration(%whois.idle3) }
    if (%whois.away == yes) && (%whois.reason) { .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Away $cxs(3) $+ : %whois.reason }
    if (%whois.ident == 1) { .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) %whois.nick has $+ $cxs(1) identified  $+ $cxs(2) $+ for this nick }
    if (%whois.ircop == yes) {
      .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) %whois.nick is an  $+ $cxs(1) $+ %whois.operinfo
      if (%opersound = on) { .splay %ircop }
      else halt
    }
    .echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) End of whois info for $+ $cxs(1) %whois.nick
    .unset %whois.* | haltdef
    linesep -a
  }
  if (%whois.helper == yes) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) %whois.nick is a $+ $cxs(1) Helper }
  if (%whois.raw == 319) { %whois.channels = $3- | %whois.channels2 = $chr(32) $+ $3- | haltdef }
  if (%whois.raw == 369) { haltdef }
  if (%whois.raw == 401) { %whois.nick = 0 | echo -a $cxs(3) $+  $+ %xsbrack $cxs(1) $+ $2  $+ $cxs(2) $+ no such nickname/channel | haltdef }
  unset %whois.raw
}
on *:DISCONNECT: .unset %whois.* | .unset %whowas.*


;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
