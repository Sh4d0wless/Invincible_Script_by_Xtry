;___________________________________________
; Invincible by Xtry
; Channel Popups
; mailto: InvincibleScript@yahoo.com
;ØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØ

menu channel {
  # $chan(#).mode:channel
  -
  Channel Control
  .Channel Stats
  ..Total $nick(#,0):.
  ..Op $nick(#,0,o) ( $+ $round($calc($nick(#,0,o) / $nick(#,0) * 100),0) $+  % $+ ):.
  ..Voice $nick(#,0,v) ( $+ $round($calc($nick(#,0,v) / $nick(#,0) * 100),0) $+  % $+ ):.
  ..Regular $nick(#,0,r) ( $+ $round($calc($nick(#,0,r) / $nick(#,0) * 100),0) $+  % $+ ):.
  ..-
  ..Get Info In New Window:statz
  .-
  .Mass Stuffs
  ..$iif($me !isop #,$style(2)) Mass Op
  ...All:mass op all
  ...-
  ...Voice Only:mass op voices
  ...Regular Only:mass op regular
  ...-
  ...Mass Deop:mass deop
  ..$iif($me !isop #,$style(2)) Mass Voice
  ...All:mass voice all
  ...-
  ...Op Only:mass voice ops
  ...Regular Only:mass voice regular
  ...-
  ...Mass Devoice:mass devoice
  ..-
  ..$iif($me !isop #,$style(2)) Mass Ban
  ...All:mass ban all
  ...-
  ...Op Only:mass ban ops
  ...Voice Only:mass ban voices
  ...Regular Only:mass ban regular
  ..$iif($me !isop #,$style(2)) Mass Kick
  ...All:mass kick all
  ...-
  ...Op Only:mass kick ops
  ...Voice Only:mass kick voices
  ...Regular Only:mass kick regular
  ..-
  ..Mass Notice
  ...All:mass notice all
  ...-
  ...Op Only:mass notice ops
  ...Voice Only:mass notice voices
  ...Regular Only:mass notice regular
  ..Mass Msg
  ...All:mass msg all
  ...-
  ...Op Only:mass msg ops
  ...Voice Only:mass msg voices
  ...Regular Only:mass msg regular
  ..-
  ..Mass Whois
  ...All:mass whois all
  ...-
  ...Op Only:mass whois ops
  ...Voice Only:mass whois voices
  ...Regular Only:mass whois regular
  ..-
  ..Mass Mode:mode $chan $$?="Mode :" $$*
  .CTCPs
  ..Ping:ctcp # ping
  ..-
  ..Version:ctcp # version
  ..Finger:ctcp # finger
  ..Time:ctcp # time
  ..User Info:ctcp # userinfo
  ..Client Info:ctcp # clientinfo
  .Modes
  ..Current Modes:echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Current mode for $+ $cxs(1) $chan  $+ $cxs(2) is $+ $cxs(1) $chan(#).mode
  ..-
  ..$iif($me !isop #,$style(2)) Set Modes
  ...Multi:mode # $$?="Mode(s) for $chan :"
  ...-
  ...$iif(c isincs $gettok($chan($chan).mode,1,32),$style(1)) ±c (No Colors):{ if (c isincs $gettok($chan($chan).mode,1,32)) { mode $chan -c } | else { mode $chan +c } }
  ...$iif(i isincs $gettok($chan($chan).mode,1,32),$style(1)) ±i (Invite Only):{ if (i isincs $gettok($chan($chan).mode,1,32)) { mode $chan -i } | else { mode $chan +i } }
  ...$iif(M isincs $gettok($chan($chan).mode,1,32),$style(1)) ±R (Only Registered Nicks Can Speak):{ if (M isincs $gettok($chan($chan).mode,1,32)) { mode $chan -M } | else { mode $chan +M } }
  ...$iif(m isincs $gettok($chan($chan).mode,1,32),$style(1)) ±m (Moderated):{ if (m isincs $gettok($chan($chan).mode,1,32)) { mode $chan -m } | else { mode $chan +m } }
  ...$iif(n isincs $gettok($chan($chan).mode,1,32),$style(1)) ±n (No External Messages):{ if (n isincs $gettok($chan($chan).mode,1,32)) { mode $chan -n } | else { mode $chan +n } }
  ...$iif(p isincs $gettok($chan($chan).mode,1,32),$style(1)) ±p (Private):{ if (p isincs $gettok($chan($chan).mode,1,32)) { mode $chan -p } | else { mode $chan +p } }
  ...$iif(R isincs $gettok($chan($chan).mode,1,32),$style(1)) ±R (Only Registered Nicks Can Join):{ if (R isincs $gettok($chan($chan).mode,1,32)) { mode $chan -R } | else { mode $chan +R } }
  ...$iif(s isincs $gettok($chan($chan).mode,1,32),$style(1)) ±s (Secret):{ if (s isincs $gettok($chan($chan).mode,1,32)) { mode $chan -s } | else { mode $chan +s } }
  ...$iif(t isincs $gettok($chan($chan).mode,1,32),$style(1)) ±t (Only Ops Set Topic):{ if (t isincs $gettok($chan($chan).mode,1,32)) { mode $chan -t } | else { mode $chan +t } }
  ...$iif(l isincs $gettok($chan($chan).mode,1,32),$style(1) ±l User Limit $+ $chr(58) $chan(#).limit,±l (User Limit)):{ if (l isincs $gettok($chan($chan).mode,1,32)) { mode $chan -l } | else { mode $chan +l $$?"Maximum number of users allowed in $chan :" } }
  ...$iif(k isincs $gettok($chan($chan).mode,1,32),$style(1) ±k Key $+ $chr(58) $chan(#).key,±k (Key)):{ if (k isincs $gettok($chan($chan).mode,1,32)) { mode $chan -k $chan($chan).key } | else { mode $chan +k $$?"Enter key for $chan :" } }
  .Topic
  ..Show Topic:echo -at $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Current topic for $+ $cxs(1) $chan  $+ $cxs(2) $+ is $+ $cxs(3) : $chan($active).topic
  ..-
  ..Set Topic
  ...Normal:topic # $$?="Topic for $chan :"
  ...-
  ...Designs
  ....Red && Yellow ˜:topic # 12<8,4˜4,8-8,4˜4,8-8,4˜4,8-8,4˜4,8-8,4˜12><8,4˜4,8 $$?="Topic for $chan :" 8,4˜12><8,4˜4,8-8,4˜4,8-8,4˜4,8-8,4˜4,8-8,4˜12>
  ....Red && Green ©:topic # 3(4©3)3(4©3)3(4©3)3(4©3)(4 $$?="Topic for $chan :" 3)(4©3)3(4©3)3(4©3)3(4©3)
  ....Orange && Brown ◊:topic # 7,7.0,5◊◊◊7,7.0,5◊◊◊7,7.0,5◊◊◊7,7.11,5 $$?="Topic for $chan :" 7,7.0,5◊◊◊7,7.0,5◊◊◊7,7.0,5◊◊◊7,7.
  ....Blue && White "®:topic # 2,11è0,2∑11"®"®"0∑11"®"®"0∑11"®"®"0∑2,11è0,2 $$?="Topic for $chan :" 2,11è0,2∑11"®"®"0∑11"®"®"0∑11"®"®"0∑2,11è
  ....Green && Blue ß:topic # 8,3\11ß8/3Ø8,3\11ß8/3Ø8,3\11ß8/3Ø8,3\11ß8/3Ø3,11 $$?="Topic for $chan :" 3Ø8,3\11ß8/3Ø8,3\11ß8/3Ø8,3\11ß8/3Ø8,3\11ß8/
  ....Blue && Grey ():/topic # 0,14(1)0(1)0(1)11 $$?="Topic for $chan :" 0(1)0(1)0(1)
  ....Blue && Yellow §¥`:topic # 12`§11,12§12,11§11,12§12,11§11,12§12,11§11,12§12§¥`§8,12 $$?="Topic for $chan :" 12§¥`§11,12§12,11§11,12§12,11§11,12§12,11§11,12§12§¥
  ....Blue && Orange <>:/topic # 4,7<8>4<8>4<8>2 $$?="Topic for $chan :" 4<8>4<8>4<8>
  ....Grey && Blue ∞∫∞:topic # 11,14∞∫∞o∞∫∞12∞∫∞o∞∫∞2∞∫∞o∞∫∞8 $$?="Topic for $chan :" 2∞∫∞o∞∫∞12∞∫∞o∞∫∞11∞∫∞o∞∫∞
  ....Yellow && Blue ´ª:/topic # 11,12´1ª11´1ª11´1ª8 $$?="Topic for $chan :" 11´1ª11´1ª11´1ª
  ....White && Red:/topic # 8,4{11{8{11{0 $$?="Topic for $chan :" 8}11}8}11}
  ....Pink && Purple °!:/topic # 13,6!6,13°13,6!6,13°13,6!6,13°11,6 $$?="Topic for $chan :" 6,13°13,6!6,13°13,6!6,13°13,6!
  ....Green && Yellow ||:/topic # 9,3\||||/8 $$?="Topic for $chan :" 9\||||/
  ....Cyan && Blue `∞∫©∫∞¥:topic # 0,10`∞∫©∫∞¥`∞∫©∫∞¥`∞∫©∫∞¥`∞∫©∫∞¥2 $$?="Topic for $chan :" 0`∞∫©∫∞¥`∞∫©∫∞¥`∞∫©∫∞¥`∞∫©∫∞¥
  ....Red && Yellow §§:/topic # 11,4§4,11§11,4§4,11§11,4§4,11§8,4 $$?="Topic for $chan :" 4,11§11,4§4,11§11,4§4,11§11,4§
  ....Blue && Pink @@:/topic # 6,11..::13@6@13@6@12 $$?="Topic for $chan :" 6@13@6@13@6::..
  ....Fire %`:/topic # 8,0 ,%0,8%`7,8,%8,7%`4,7,%7,4%`8,4 $$?="Topic for $chan :" 7,4`%4,7%,8,7`%7,8%,0,8`%8,0%,
  ....Black && Grey ©∫∞®®∞∫©:/topic # 1,14©∫∞®®∞∫©∫∞®®∞∫©0 $$?"Topic for $chan :" 1©∫∞®®∞∫©∫∞®®∞∫©
  ....Yellow && Black ÆÆ:topic # 8,1Æ8,14Æ8,15Æ8,0Æ8,15Æ8,14Æ8,1Æ 0 $$?="Topic for $chan :"  8,1Æ8,14Æ8,15Æ8,0Æ8,15Æ8,14Æ8,1Æ
  ....Fire :topic # 1,51,41,71,8 $$?"Topic for $chan :" 1,81,71,41,5
  ....Cyan && Red ¯¯¯:topic # 10[11,10¯12¯2¯10]2,10¯12¯11¯10[4 $$?="Topic for $chan :" 10]11,10¯12¯2¯10[2,10¯12¯11¯10]
  ....Brown && Yellow ´ßª:topic # 11,5´0ß11ª´0ß11ª´0ß11ª´0ß11ª8 $$?="Topic for $chan :" 11´0ß11ª´0ß11ª´0ß11ª´0ß11ª
  ....Green && Blue ©©:topic # 0,3(5©4©7©8©0©8©7©4©5©0)11 $$?="Topic for $chan :" 0(5©4©7©8©0©8©7©4©5©0)
  ....Red && Yellow /|\:topic # 12,8/4|12\/4|12\/4|12\/4|12\8,4 $$?="Topic for $chan :" 12,8/4|12\/4|12\/4|12\/4|12\
  ....Pink && Green <>:topic # 9,3<1>13,6<1>9,3<1>13,6<1>9,3<1>13,6<1>1,13 $$?="Topic for $chan :" 9,3<1>13,6<1>9,3<1>13,6<1>9,3<1>13,6<1>
  ....White && Grey /¥`\:topic # 1,14/¥15`\1/¥15`\1/¥15`\1/¥15`\1/¥15`\1/¥15`\00 $$?="Topic for $chan :" 1/¥15`\1/¥15`\1/¥15`\1/¥15`\1/¥15`\1/¥15`\
  ....Pink && Blue `∞v∞¥:topic # 13`13,2∞v∞13¥2,13 $$?="Topic for $chan :" 13`13,2∞v∞13¥
  ....Yellow && Purple §:topic # 14,6§15§0§15§14§08 $$?="Topic for $chan :" 14§15§0§15§14§
  ....Brown && Red ||:topic # 7,8|8,7|4|7,4|5|4,5|00 $$?="Topic for $chan :" 4|5,4|7|4,7|8|7,8|
  ....Green && Yellow ç:topic # 4,4é8,8é3,3é 4,4é8,8é3,3é 4,4é8,8é8,3 $$?="Topic for $chan :" 8,8é4,4é 4,4é8,8é3,3é 4,4é8,8é3,3é
  ....Red && Yellow ©©:topic # 4,5©5,4©7©4,7©8©7,8©01 $$?="Topic for $chan :" 7©8,7©4©7,4©5©4,5©
  ....Light Blue && Dark Blue ¯¯:topic # 12,2¯2,12¯11¯12,11¯¯11,12¯2¯12,2¯0 $$?="Topic for $chan :" 12¯2,12¯11¯12,11¯¯11,12¯2¯12,2¯
  ....Green && Black ´Ùª:topic # 8,3´Û7´4Ù7ª8Úª01 $$?="Topic for $chan :" 8´Û7´4Ù7ª8Úª
  ....Orange && Blue ][:topic # 7[7,2T2,7O7,2P2,7I7,2C7][7,2 $$?="Topic for $chan :" 7][7,2T2,7O7,2P2,7I7,2C7]
  ....White && Red `§¥:topic # 9,2`4§9¥`4§9¥`4§9¥`4§9¥0 $$?="Topic for $chan :" 9`4§9¥`4§9¥`4§9¥`4§9¥
  ....Yellow && Black µ©:topic # 3,8_µ4©3_µ4©3_µ4©3_µ4©01 $$?="Topic for $chan :" 3_µ4©3_µ4©3_µ4©3_µ4©
  ....White && Green ´ª:topic # 9,3 ´1ª  9´1ª  9´1ª  9´1ª  9´1ª08  $$?="Topic for $chan :"  9´1ª  9´1ª  9´1ª  9´1ª  9´1ª  
  ....Red && Grey ÊÊ:topic # 1Ê14Ê15Ê0Ê15Ê14Ê1Ê14Ê15Ê0Ê15Ê14Ê1Ê4 $$?="Topic for $chan :" 1Ê14Ê15Ê0Ê15Ê14Ê1Ê14Ê15Ê0Ê15Ê14Ê1Ê
  ....Black && Grey ∞`U¥∞:topic # 4`"8,4∞5`1U5¥8∞4,15"¥1 $$?="Topic for $chan :" 4`"8,4∞5`1U5¥8∞4"¥
  ....Yellow && Blue .∑¥Ø`∑.:topic # 0,2.∑¥Ø`∑.9.∑¥Ø`∑.3.∑¥Ø`∑.08 $$?="Topic for $chan :" 3.∑¥Ø`∑.9.∑¥Ø`∑.0.∑¥Ø`∑.
  ....Blue && Purple `[©]¥:topic # 8,6`[0©8]¥`[0©8]¥`[0©8]¥`[0©8]¥11 $$?="Topic for $chan :" 8`[0©8]¥`[0©8]¥`[0©8]¥`[0©8]¥
  ....Yellow && Red \ª/:topic # 4,8\ª/Ø\ª/Ø\ª/Ø\ª/Ø\ª/8,4 $$?="Topic for $chan :" 4,8\´/Ø\´/Ø\´/Ø\´/Ø\´/
  ....Red && Yellow //:topic # 3,3.12,4/ØØ/ 8/ØØ/ 12/ØØ/ 8/ØØ/3,3.04 $$?="Topic for $chan :" 3,3.12,4\ØØ\ 8\ØØ\ 12\ØØ\ 8\ØØ\3,3.
  ....Blue && Red _.∑Ø(:topic # 4(4,11_.∑Ø(_.∑Ø(_.∑Ø(_.∑Ø4)(11,4 $$?="Topic for $chan :" 4)(4,11Ø∑._)Ø∑._)Ø∑._)Ø∑._4)
  ....Green && Red éé:topic # 14]2,2é3,3é4,4é5,5é6,6é7,7é8,8é9,9é10,10é11,11é12,12é13,13é14[]4,9 $$?="Topic for $chan :" 14[]13,13é12,12é11,11é10,10é9,9é8,8é7,7é6,6é5,5é4,4é3,3é2,2é14[
  ....Red && White `∞§¯,∏∏,¯§∞¥:topic # 611,4`8∞11§8¯11,8∏11∏8,11¯8§11∞8¥11`8∞11§8¯11,8∏11∏8,11¯8§11∞8¥00 $$?="Topic for $chan :" 11`8∞11§8¯11,8∏11∏8,11¯8§11∞8¥11`8∞11§8¯11,8∏11∏8,11¯8§11∞8¥
  ....Blue && Light Blue <><>:topic # 11>0,11<12>11,12<1>12,1<11∑12>2,12<11>12,11<0>11<12 $$?="Topic for $chan :" 11>0,11<12>11,12<1>12,1<11∑12>2,12<11>12,11<0>11<
  ....Green && White ´-¥:topic # 11,3´-¥ 8´-¥ 11´-¥ 8´-¥3Ø0,3 $$?="Topic for $chan :" 3Ø11,3`-ª 8`-ª 11`-ª 8`-ª
  ....Rec && White <§>:topic # 12,4<0§11> 12<0§11> 12<0§11> 12<0§11> 12<0§11>4_/0,4 $$?="Topic for $chan :" 4\_12,4<0§11> 12<0§11> 12<0§11> 12<0§11> 12,4<0§11>
  ....Blue && White /◊\:topic # 12/0,12◊12\/0,12◊12\/0,12◊12\/0,12◊12\0,12 $$?="Topic for $chan :" 12/0,12◊12\/0,12◊12\/0,12◊12\/0,12◊12\
  ....Blue && Red §∑§:/topic # 8,8.8,4§∑§∑§∑§8,8.8,7§∑§∑§∑§8,8.11,4 $$?="Topic for $chan :" 8,8.8,7§∑§∑§∑§8,8.8,4§∑§∑§∑§8,8.
  ....Orange && Purple <>:/topic # 8,8.0,6<13>7,7.0,6<13>4,4.0,6<13>7,7.0,6<13>8,8.0,6<13>7,7.0,6<13>4,4.0,6<13>7,7.0,6<13>8,8.2,7 $$?="Topic for $chan :" 8,8.13,6<0>7,7.13,6<0>4,4.13,6<0>7,7.13,6<0>8,8.13,6<0>7,7.13,6<0>4,4.13,6<0>7,7.13,6<0>8,8.
  ....Yellow && Blue ©ﬁ:topic # 8,2 ©15ﬁ 8©15ﬁ 8©15ﬁ 8©15ﬁ 8©15ﬁ $$?="Topic for $chan :" 8©15ﬁ 8©15ﬁ 8©15ﬁ 8©15ﬁ 8©15ﬁ 
  .Parts && Cycle
  ..Part Current Channel:part # Parting # - %name
  ..Part Current Channel w/ msg:part # $$?="Part message to $chan :" - %name
  ..-
  ..Part All Channels:partall Parting All Channels - %name
  ..Part All Channels w/ msg:partall $$?="Part message :" - %name
  ..-
  ..Cycle $chr(160) F8:rejoin $chan
  .$iif($me !isop #,$style(2)) Bans
  ..Specified:mode $chan +b $$?="Nickname!UserID@Hostname to ban (ie: $address($me,5) $+ )"
  ..Guest Ban:mode $chan +b guest*!*@*
  ..-
  ..Nickname Ban:mode $chan +b $$?="Nickname to ban in $chan :" $+ !*@*
  ..User ID Ban:mode $chan +b *! $+ $$?="User ID to ban in $chan :" $+ @*
  ..Hostname Ban:mode $chan +b *!*@ $+ $$?="Hostname to ban in $chan :"
  ..-
  ..Country Bans
  ...Australia: /mode $chan +b *!*@*.au
  ...Belgium: /mode $chan +b *!*@*.be
  ...Bolivia: /mode $chan +b *!*@*.bo
  ...Brazil: /mode $chan +b *!*@*.br
  ...Canada: /mode $chan +b *!*@*.ca
  ...Chile: /mode $chan +b *!*@*.cl
  ...China: /mode $chan +b *!*@*.cn
  ...Denmark: /mode $chan +b *!*@*.dk
  ...Egypt: /mode $chan +b *!*@*.eg
  ...Finland: /mode $chan +b *!*@*.fi
  ...France: /mode $chan +b *!*@*.fr
  ...Germany: /mode $chan +b *!*@*.de
  ...Greece: /mode $chan +b *!*@*.gr
  ...Hong Kong: /mode $chan +b *!*@*.hk
  ...Indonesia: /mode $chan +b *!*@*.id
  ...Ireland: /mode $chan +b *!*@*.ie
  ...Italy: /mode $chan +b *!*@*.it
  ...Japan:/mode $chan +b *!*@*.jp
  ...Korea: /mode $chan +b *!*@*.kr
  ...Lebanon: /mode $chan +b *!*@*.lb
  ...Malaysia: /mode $chan +b *!*@*.my
  ...Mexico: /mode $chan +b *!*@*.mx
  ...The Netherlands: /mode $chan +b *!*@*.nl
  ...New Zealand: /mode $chan +b *!*@*.nz
  ...Norway: /mode $chan +b *!*@*.no
  ...Pakistan: /mode $chan +b *!*@*.pk
  ...Peru: /mode $chan +b *!*@*.pe
  ...Poland: /mode $chan +b *!*@*.pl
  ...Portugal: /mode $chan +b *!*@*.pt
  ...Russia: /mode $chan +b *!*@*.ru
  ...Singapore: /mode $chan +b *!*@*.sg
  ...Slovenia: /mode $chan +b *!*@*.si
  ...South Africa: /mode $chan +b *!*@*.za
  ...Spain: /mode $chan +b *!*@*.es
  ...Sweden: /mode $chan +b *!*@*.se
  ...Switzerland: /mode $chan +b *!*@*.ch
  ...Turkey: /mode $chan +b *!*@*.tr
  ...The U.K.: /mode $chan +b *!*@*.uk
  ...Venezuela: /mode +b *!*@*.ve
  ...Yugoslavia: /mode $chan +b *!*@*.yu
  .Misc
  ..$iif($chan(0) = 1,$style(2)) Msg To All Channels:_amsg.c $$?="Message to all channels i'm currently in :"
  ..$iif($chan(0) = 1,$style(2)) Act To All Channels:_ame.c $$?="Action to all channels i'm currently in :"
  ..-
  ..Find A Word In Channel:filterwindow | filter -pc # @Filtered * $+ $$?="Enter the text that you want to search for in $chan " $+ *
  .-
  .$iif($me !isop #,$style(2)) Invite:invite $$?="The user you want to invite to $chan :" $chan
  Introduction
  .Setup:introx
  .Start Intro:myintro.c
  Contacts
  .Notice
  ..Op Notice:onot
  ..Op && Voice Notice $chr(160) F9:ovnot
  ..Voice Notice:vnot
  ..-
  ..Channel Notice:gnot
  .Message
  ..Op Message:PRIVMSG @ $+ # (Op $+ $nick(#,0,o) $+ ( $+ $round($calc($nick(#,0,o) / $nick(#,0) * 100),0) $+ % $+ )) $$?="Op( $+ $opnick(#,0) $+ ) Message to $chan :"
  ..Op && Voice Message:PRIVMSG @ $+ + $+ # (Op $+ $nick(#,0,o) $+ ( $+ $round($calc($nick(#,0,o) / $nick(#,0) * 100),0) $+ % $+ )Vo $+ $nick(#,0,v) $+ ( $+ $round($calc($nick(#,0,v) / $nick(#,0) * 100),0) $+ % $+ )) $$?="Op( $+ $opnick(#,0) $+ ) & Voice( $+ $vnick(#,0) $+ ) Message to $chan :"
  ..Voice Message:PRIVMSG + $+ # (Vo $+ $nick(#,0,v) $+ ( $+ $round($calc($nick(#,0,v) / $nick(#,0) * 100),0) $+ % $+ )) $$?="Voice( $+ $vnick(#,0) $+ ) Message to $chan :"
  $iif(.dal.net isin $server,DALnet)
  .Chanserv
  ..Options Dialog:gtzdalc
  ..-
  ..Info:/chanserv info $chan
  ..Count:/chanserv count $chan
  ..Invite:/chanserv invite # $$?="Nickname to invite into $chan :"
  ..Mkick:/chanserv mkick $chan
  ..Mdeop:/chanserv mdeop $chan
  ..-
  ..Unban
  ...Unban Me:/chanserv unban # $me
  ...Unban Nickname:/chanserv unban # $$?="Nickname to unban in $chan :"
  ...Unban All:/chanserv unban # *
  ..SOP
  ...Add:chanserv sop # add $$?="Nickname to add Sop in $chan :"
  ...Del:chanserv sop # del $$?="Nickname to del Sop in $chan :"
  ...-
  ...List:/chanserv sop # list
  ...Wipe:/chanserv sop # wipe
  ..AOP
  ...Add:chanserv aop # add $$?="Nickname to add Aop in $chan :"
  ...Del:chanserv aop # del $$?="Nickname to del Aop in $chan :"
  ...-
  ...List:/chanserv aop # list
  ...Wipe:/chanserv aop # wipe
  ..AKICK
  ...Add:chanserv akick # add $$?="Nickname/Address to add Akick in $chan :"
  ...Del:chanserv akick # del $$?="Nickname/Address to del Akick in $chan :"
  ...-
  ...List:/chanserv akick # list
  ...Wipe:/chanserv akick # wipe
  .Memoserv
  ..Memo Express:memos
  ..-
  ..Send User:/memoserv send $$?="Nickname to Send memo :" $$?="Memo message :"
  ..Send Channel:/memoserv send # $$?="Memo message to $chan Ops :"
  ..Send SOP:/memoserv sendsop # $$?="Memo message to $chan SOPs :"
  ..List:memoserv list
  ..News:memoserv news
  .Nickserv
  ..Options Dialog:gtzdaln
  ..-
  ..Register:nickserv register $$?="Set Password to $me :" $$?="Set Email to $me :"
  ..Identify $chr(160) F2:nickserv identify $$?="Nickname to Identify:" $$?*="Password :"
  ..Ghost:nickserv ghost $$?="Nickname to Ghost:" $$?*="Password :"
  ..Recover:nickserv recover $$?="Nickname to Recover :" $$?*="Password :"
  ..Release:nickserv release $$?="Nickname to Release :" $$?*="Password :"
  ..Sendpass:nickserv sendpass $$?="Nickname to Sendpass :" $$?="Email :"
  ..Info:nickserv info $$?="Nickname :"
  .Statserv
  ..Options Dialog:gtzdals
  ..-
  ..Domain:statserv domain $$?="Domain :"
  ..Host:statserv host $$?="Host :"
  ..Server:statserv server $$?="Server :"
  ..Stats:statserv stats $$?="Server/Host/Domain :"
  ..Netstats:statserv netstats
  ..Hosts:statserv hosts
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
  .Mass Deop:operserv massdeop #
  .Mass Kick:operserv mass kick #
  .Mark:chanserv mark # on
  .Unmark:chanserv mark # off
  .Freeze:chanserv freeze #
  .Unfreeze:chanserv freeze - $+ #
  .Close:chanserv close # $$?="Closure Reason for $chan :"
  -
  $iif($me !isop #,$style(2)) Secure Mode $chr(160) F10:mode # +miRcMntl $nick(#,0)
  $iif($me !isop #,$style(2)) Unsecure Mode $chr(160) F10:mode # -miRcMl
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
  ..Logs:run utilities/found.txt
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
  ..Vote Machine:votebox $chan
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
  ...$iif(!$server,$style(2)) Start:ftpAdon
  ...$iif(!$server,$style(2)) Stop:ftpAdOff
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
  .Lyrics Finder:lyrics
  .Sketch:sketch
  .-
  .Love Meter:kira-cinta
  .Colorfull Text Box:tbox
  .-
  .Trivia
  ..$iif($group(#triv) == on,$style(1)) Enable:triv.on
  ..$iif($group(#triv) == off,$style(1)) Disable:triv.off
  ..-
  ..$iif(%triv.currChan !== $chan,Make # Trivia Chan,# is Trivia Chan):set %triv.currChan #
  ..-
  ..Settings:triv.dlg
  .Big Fonts
  ..Editor:bigfont
  ..-
  ..Play:bigfont $$?="Text :"
  .Text Styles
  ..Colorfull:r1 $$?="Colorfull text to $chan :"
  ..Colors && Bold && Underline:r2 $$?="Colorfull && Bold && Underline text to $chan :"
  ..Colored ASCII:asciic $$?="Colored ASCII text to $chan :"
  ..Normal ASCII:ascii $$?="Normal ASCII text to $chan :"
  ..-
  ..Brick (Lime && Red):brick1 $$?="Brick text to $chan :"
  ..Brick (Yellow && Blue):brick2 $$?="Brick text to $chan :"
  ..Brick (Blue && Pink):brick3 $$?="Brick text to $chan :"
  ..Brick ( $+ %name2 $+ ):brick4 $$?="Brick text to $chan :"
  ..-
  ..Blocks:blocks $$?="Blocks text to $chan :"
  ..Caution Tape:reverse2 $$?="Caution tape text to $chan :"
  ..Reverse:reverse $$?="Reverse text to $chan :"
  ..Caps && Low Case:altcap $$?="Caps && low case text to $chan :"
  ..Latin:/piglatin $$?="Latin text to $chan :"
  .Colors Talker
  ..$iif(%coltalk.x = on,$style(1)) Enable:gtzcolon
  ..$iif(%coltalk.x = off,$style(1)) Disable:gtzcoloff
  .Funny Pets
  ..Pikachu:run utilities/games/pikachu.exe
  ..Sheep:run utilities/games/sheep.exe
  ..Orange:run utilities/games/naranja.exe
  .Fun Stuffs
  ..Faces
  ...Thinking
  ....Laugh 1:_xmsg.c $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :D
  ....Laugh 2:_xmsg.c $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :D
  ....-
  ....Smile 1:_xmsg.c $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :)
  ....Smile 2:_xmsg.c $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :)
  ....-
  ....Unhappy 1:_xmsg.c $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :(
  ....Unhappy 2:_xmsg.c $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :(
  ....-
  ....Indifferent 1a:_xmsg.c $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :/
  ....Indifferent 2a:_xmsg.c $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :/
  ....Indifferent 1b:_xmsg.c $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :\
  ....Indifferent 2b:_xmsg.c $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :\
  ....Indifferent 1c:_xmsg.c $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :|
  ....Indifferent 2c:_xmsg.c $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :|
  ....-
  ....Surprised 1:_xmsg.c $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :o
  ....Surprised 2:_xmsg.c $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :o
  ....-
  ....Seriously 1:_xmsg.c $cgtz(2) $+ ( $+ $cgtz(1) $+ $$?="What are you thinking about?" $+ $cgtz(2) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.1) $+ , $+ $gtzr.set(Colors,Color.2) $+ :∑
  ....Seriously 2:_xmsg.c $cgtz(1) $+ ( $+ $cgtz(2) $+ $$?="What are you thinking about?" $+ $cgtz(1) $+ )∫∞∑ $+ $gtzr.set(Colors,Color.2) $+ , $+ $gtzr.set(Colors,Color.1) $+ :∑
  ...-
  ...Type 1
  ....Smiley:_xmsg.c 1,8: )   
  ....Big Smile:_xmsg.c 1,8: D
  ....Indifferent:_xmsg.c 1,8: I 
  ....Sarcastic:_xmsg.c 1,8: > 
  .....Kid w/cap:_xmsg.c 1,8∂: P)--|----<
  .....Vampire:_xmsg.c 1,8:[    
  ....Johnny smiley:_xmsg.c 1,8∂: )   
  ....Cap and tongue:_xmsg.c 1,8∂ 12:4ﬁ  
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
  ....Happy 1:_xmsg.c 2∂1,8:4,8)
  ....Happy 2:_xmsg.c 2∂1,8:4,8}
  ....Happy 3:_xmsg.c 2∂1,8:4,8]
  ....Happy 4:_xmsg.c 2∂1,8:4,8>
  ....Very happy:_xmsg.c 2∂1,8:4,8)0,0..2∂1,8:4,8D0,0..2∂1,8:4,8)0,0..2∂1,8:4,8D0,0..2∂1,8:4,8)0,0..2∂1,8:4,8D0,0..2∂1,8:4,8)0,0..2∂1,8:4,8D
  ....Laugh :_xmsg.c 2∂1,8:4,8D
  ....Kiss 1:_xmsg.c 2∂1,8:4,8§
  ....Kiss 2:_xmsg.c 2∂1,8:4,8*
  ....Smile :_xmsg.c 2∂1,8¶4,8)
  ....Sad :_xmsg.c 2∂1,8:4,8(
  ....Tongue ﬁ:_xmsg.c 2∂1,8:4,8ﬁ
  ....Tongue ˛:_xmsg.c 2∂1,8:4,8˛
  ....Tongue P:_xmsg.c 2∂1,8:4,8P
  ....Tongue b:_xmsg.c 2∂1,8:4,8b
  ....Super Tongue :_xmsg.c 2∂1,8:4,8ﬁ0,0..2∂1,8:4,8˛0,0..2∂1,8:4,8P0,0..2∂1,8:4,8ﬁ0,0..2∂1,8:4,8b0,0..2∂1,8:4,8˛0,0..2∂1,8:4,8P0,0..2∂1,8:4,8ﬁ
  ....Dont Know:_xmsg.c 2∂1,8:4,8|
  ....Not Happy:_xmsg.c 2∂1,8:4,8S
  ....Cry 1:_xmsg.c 2∂1,8:~4,8O
  ....Cry 2:_xmsg.c 2∂1,8:~4,8(
  ....Questionative 1:_xmsg.c 2∂1,8:4,8/
  ....Questionative 2:_xmsg.c 2∂1,8:4,8\
  ....Hungry/hamsap:_xmsg.c 2∂1,8:4,8)~~~~~
  ....Hamsap face1:_xmsg.c 2∂1,8:4,8D~~~~~
  ....Hamsap face2:_xmsg.c 2∂1,8¶4,8)~~~~~
  ....Hamsap face3:_xmsg.c 2∂1,8¶4,8D~~~~~
  ....Touched:_xmsg.c 2∂1,8:~4,8)
  ....Ghost face:_xmsg.c 2∂1,9:4,9E
  ...Type 3
  ....Happy 1:_xmsg.c 1,8(Ò4,8_1,8Ò)
  ....Happy 2:_xmsg.c 1,8(‚4,8_1,8‚)
  ....Happy 3:_xmsg.c 1,8(‡4,8_1,8·)
  ....Happy 4:_xmsg.c 1,8(Ï4,8_1,8Ì)
  ....Happy 5:_xmsg.c 1,8(Ú4,8_1,8Û)
  ....Happy 6:_xmsg.c 1,8(“4,8_1,8”)
  ....Smile 1:_xmsg.c 1,8(·4,8_1,8·)
  ....Smile 2:_xmsg.c 1,8(„4,8_1,8„)
  ....Smile 3:_xmsg.c 1,8(’4,8_1,8’)
  ....Smile 4:_xmsg.c 1,8(ı4,8_1,8ı)
  ....Smile 5:_xmsg.c 1,8(‚4,8_1,8‚)
  ....Smile 6:_xmsg.c 1,8(Ó4,8_1,8Ó)
  ....Smile 7:_xmsg.c 1,8(T4,8_1,8T)
  ....Sad 1:_xmsg.c 1,8(Û4,8_1,8Ú)
  ....Sad 2:_xmsg.c 1,8(·4,8_1,8‡)
  ....Sad 3:_xmsg.c 1,8(Ì4,8_1,8Ï)
  ....Sad 4:_xmsg.c 1,8(˙4,8_1,8˘)
  ....Sad 5:_xmsg.c 1,8(”4,8_1,8“)
  ....Sleep:_xmsg.c 1,8(˙4,8_1,8˙)
  ....Sleeping:_xmsg.c 1,8(˙4,8_1,8˙)2,0 Zzzzzzzzzz.......zzzzzzz......zzzz....zz
  ....Cry 1:_xmsg.c 1,8(›4,8_1,8›)
  ....Cry 2:_xmsg.c 1,8(˝4,8_1,8˝)
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
    ...-
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
    ..-
  }  
  ...  Poem 3 (Present)  {
    /..timer35 1 1 _xmsg.c 8Yesterday Is A History
    /..timer36 1 2 _xmsg.c 8Tomorrow Is A Mystery
    /..timer37 1 3 _xmsg.c 8And Today Is A Gift
    /..timer38 1 4 _xmsg.c 8That's Why It's Called A Present
    ...-
  }
  ... Poem (LoveHurts)  {
    /..timer35 1 1 _xmsg.c 12Sometimes Love Hurts
    /..timer36 1 2 _xmsg.c 12But If It Doesn't Hurt
    /..timer37 1 3 _xmsg.c 12Then Itsn't Love Anymore
    /..timer38 1 4 _xmsg.c 12Hold On To The Person U Love
    /..timer39 1 5 _xmsg.c 12Before They Slip Away
    /..timer40 1 6 _xmsg.c 12Or Else U Can Never Get Them Back
    ...-
  }
  ... Poem (Born)  {
    /..timer35 1 1 _xmsg.c 11I Was Born When U Kissed Me
    /..timer36 1 2 _xmsg.c 11And I Died When U Left Me
    /..timerr37 1 3 _xmsg.c 11But I Lived For The Time U Love Me
    ...-
  }
  ... Poem (U)  {
    /..timer35 1 1 _xmsg.c 13Until There Was U 
    /..timer36 1 2 _xmsg.c 13I Cry Myself To Sleep
    /..timer37 1 3 _xmsg.c 13WHile I Had U. I Fell Asleep With A Gentle Smile On My Face=)
    /..timer38 1 4 _xmsg.c 13Before I Lost U, I Worried Myself To Sleep
    /..timer39 1 5 _xmsg.c 13Now That I Know U R Gone
    /..timer40 1 6 _xmsg.c 13I Sat At Nite, Waiting For U To Cum Back
    ...-
  }
  ... Poem [Heart]  {
    /..timer35 1 1 _xmsg.c 7I promise U frm the bottom of my heart
    /..timer36 1 2 _xmsg.c 7I will love U till death do us apart
    /..timer37 1 3 _xmsg.c 7I promise U as a lover and a fren
    /..timer38 1 4 _xmsg.c 7I'll love U like I never love again
    /..timer39 1 5 _xmsg.c 7With everything I am
    ...-
  }
  ... Poem [Ans]  {
    /..timer35 1 1 _xmsg.c 4Show me a reason, give me a sign
    /..timer36 1 2 _xmsg.c 4Tell me the way we fall out of line
    /..timer37 1 3 _xmsg.c 4Is it today or is it tonight weíll find
    /..timer38 1 4 _xmsg.c 4The answer to our life
    ...-
  } 
  ... Poem [Quit]  {
    /..timer35 1 1 _xmsg.c 8Quit playin' games with my heart
    /..timer36 1 2 _xmsg.c 8Before you tear us apart
    /..timer37 1 3 _xmsg.c 8I should've known from the start
    /..timer38 1 4 _xmsg.c 8Before U got in my heart
    ...-
  }
  ... Poem [World]  {
    /..timer35 1 1 _xmsg.c 9WR|– Ìß ¢R˙Í|,|VÍ |ß ﬂ|Ì—–,13|ßT Ì— ß‚–—…ßß,ﬂ|˙R Ì— MÌ—–,11h…„Rt Ìß ﬂrK…—,F|‚Me H‚– –Ì…–,4TÌMe H‚ß P‚ßße– & 12h…'ß —T MÌ—e~
  }
  ... Poem [Hurts]  {
    /..timer35 1 1 _xmsg.c 12§ 8Œt h˘Rtß 2 £ÛVÎ ßÙMÈ÷—Í — Ò÷T BÍ £ÛVÈD Ï— RÍT˘r— 7B˘T wAt Ïß È MÙßt PÂÏ—F˙L Ïß 2 £ÛVÈ ßÙMÎ÷ÒÍ — 4ÒÎVÈR FÏÒDŒÒG È «Ù˙RÂGÎ 2 £ÍT È PÎRßÛ— KÒÙW HÙW ‹ FÎÍ£12§  
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
    ...-
  }
  ... Poem [Libai/Army]  {
    /..timer35 1 1 _xmsg.c 15[Army Version] Chuang Qian Ming Yue Guang
    /..timer36 1 2 _xmsg.c 3Bedfront Lau Bark Sai (tears drop)
    /..timer37 1 3 _xmsg.c 10Thinking About Exercise (reservist mobilization)
    /..timer38 1 4 _xmsg.c 9Drop Dead Look Into The Sky (run until no breathe)
    /..timer39 1 5 _xmsg.c 0Tong Kor Sia Lang Cai? (my heartache nobody knows)
    /..timer40 1 6 _xmsg.c 15-LiBai  
    ...-
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
  ..Quits
  ...Quits Editor:qdialquit
  ...-
  ...K-lined:/quit K-lined
  ...Nuked:/quit Nuked by 202.224.15.3
  ...EOF From client:/quit EOF From client
  ...Ping timeout:/quit Ping timeout: 240 seconds
  ...Pong timeout:/quit Pong timeout for $me (FPNet.MiNE.NU)
  ...Excess Weed: /quit Excess weed
  ...Excess Pics: /quit Excess pics
  ...Excess Mp3s: /quit Excess mp3s
  ...-
  ...FatBoy:/quit Connection reset by a fat boy
  ...My Grandmother:/quit Connection reset by my grandmother
  ...My ass:/quit Connection reset by my ass
  ...Bye:/quit Connection reset bye
  ...FBI:/quit Connection reset by FBI
  ...Peers: /quit Connection reset by peer
  ...Asshole:quit Connection reset by an asshole
  ...Who?:/quit Connection reset by $$?="Connection reset by ... (enter text) example:(an asshole)"
  ...-
  ...Horny Ident:/quit -hotspeed.sg.as.dal.net- *** Autokilled for [Horny/Ident] Due to constant abuse from this horny ident, you are now required to install a girl on your bed. Send email to Horny@dal.net with [Horny/Ident] as the subject for more information.
  ...Focker Ident:/quit -hotspeed.sg.as.dal.net- *** Autokilled for [Focker/Ident] Due to constant abuse from this focker ident, you are now required to install a girl on your bed. And don't forget to install a condom on your dick. Send email to Focker@dal.net with [Focker/Ident] as the subject for more information.
  ...Stupid:/quit Killed (stats.dal.net (User has been banned from DALnet (User is too stupid)))
  ...Mass Gf:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [ma/gf] Mass Girlfriends is not allowed on DALnet. Continue, and you will be a history. See http://kline.dal.net/massgf/mup.htm)))
  ...Cool Script:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Script] Your script is too cool for our server, Please to change it. See http://kline.dal.net/exploits/akills.htm#script)))
  ...Weed:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Weed] Excess weed on user's blood is not tolerated on DALnet. See http://kline.dal.net/exploits/akills.htm#weed)))
  ...Xmen:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Xmen] You are infected with a dangerous mutant virus. Don't worry, Just stay where you are and we'll send you Cyclops, Storm, and Iceman to bring you to our school. See http://kline.dal.net/exploits/akills.htm#Xmen)))
  ...Mutant:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Mutant] Mutant is not permitted on DALnet. Get out!. See http://kline.dal.net/exploits/akills.htm#mutant)))
  ...Living Dead:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Dead] In the name of God, Living dead shall be banished into eternal damnation! See http://kline.dal.net/exploits/akills.htm#livingdead)))
  ...Enemy Down:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Cs] Enemy down!!. See http://kline.dal.net/exploits/akills.htm#cs)))
  ...Chanserv Begging:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Begger] Stop begging for being Chanserv. See http://kline.dal.net/exploits/akills.htm#begger)))
  ...Somewhere Else:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Se] Go chat in somewhere else. See http://kline.dal.net/exploits/akills.htm#notwelcome)))
  ...Hate WTF:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/WTF] I HATE YOU!! I HATE YOU!! I HATE YOU!! :(((( !@$#@!@&*!!!! DIE!! DIE!! I F*CKIN HATE YOU!!!!!1111. See http://kline.dal.net/exploits/akills.htm#wtf)))
  ...Boys Band:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Bb] Boys Band is not permitted on DALnet. OUT! OUT!. See http://kline.dal.net/exploits/akills.htm#boysband)))
  ...Crash:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Crash] What computer do you want to crash today?.. Mine?.. No Way!. See http://kline.dal.net/exploits/akills.htm#crash)))
  ...Online:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Online] You're online too long, it's time for something else. See http://kline.dal.net/exploits/akills.htm#online)))
  ...Learns:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Learns] Sorry, I am always doing that which I can not do, in order that I may learn how to do it. See http://kline.dal.net/exploits/akills.htm#learns)))
  ...LoveU:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/LoveU] This is because We Love You!. See http://kline.dal.net/exploits/akills.htm#LoveU)))
  ...Doctors:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Doc] Hey doc, we need you at hospital now. See http://kline.dal.net/exploits/akills.htm#doctors)))
  ...Focker:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Focker] How dare you sleep with my wife last night. Continue, and you will be a history. See http://kline.dal.net/exploits/akills.htm#focker)))
  ...E.T:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/E.T] What is the difference between You and E.T??.. At least E.T phoned home. See http://kline.dal.net/exploits/akills.htm#E.T)))
  ...Dickhead:/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Dickhead] You know what is your problem??.. You spend too much time thinking with the wrong head!. See http://kline.dal.net/exploits/akills.htm#dickhead)))
  ...Girls Attention:quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Girls] You are taking all girls attention away from us. See http://kline.dal.net/exploits/akills.htm#girlsattention)))
  ...Accessing:/quit Killed (stats.dal.net (User has been banned from DALnet (Please to stop accessing our computer. Continue, and DALnet will block your ISP. See http://kline.dal.net/hacker/mup.htm)))
  ...Packeting:/quit Killed (stats.dal.net (User has been banned from DALnet (Excessive Packeting of Opers is not permitted on DALnet)))
  ...Pics :/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Pics] Teenagers pics tradings is not tolerated on DALnet, Next time share the Pics with us. See http://kline.dal.net/exploits/akills.htm#Pics)))
  ...Drugs :/quit Killed (stats.dal.net (User has been banned from DALnet ([AKILL ID:1053349498K-e] [exp/Drugs] Drugs saler is not tolerated on DALnet, Next time share the Drugs with us. See http://kline.dal.net/exploits/akills.htm#Drugs)))
  ...No Use:/quit Killed (stats.dal.net (User has been banned from DALnet (You are of no use anymore. Visit http://kline.dal.net/we-got-it/n-ur-useless-now.html)))
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
  ..Add/join this channel:asaddchan $chan
  ..Remove/part this channel:asdelchan $chan
  ..$ascheck(connected,Cycle Channel):{
    if ($sock(antispam).name == $null) {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Antispam Bot is  $+ $cxs(1) Not Connected
      return
    }
    if ($asnick !ison $chan) {
      echo $colour(info) # *** $asnick is not on this channel.
    }
    if ($istok(%antispam.current,$chan,32) == $true) { as.queue PART $chan }
  }
  ..-
  ..$ascheck(connected,Message To Channel):{
    if ($sock(antispam).name == $null) {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Antispam Bot is  $+ $cxs(1) Not Connected
      return
    }
    as.queue PRIVMSG $chan : $+ $$?="Enter message:"
  }
  ..$ascheck(connected,Action To Channel):{
    if ($sock(antispam).name == $null) {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Antispam Bot is  $+ $cxs(1) Not Connected
      return
    }
    as.queue PRIVMSG $chan : $+ $Chr(1) $+ ACTION $$?="Enter message:" $+ $Chr(1)
  }
  ..-
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
  ..Send To Active:invstat.c
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
;ØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØ
