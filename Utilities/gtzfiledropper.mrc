;___________________________________________
; Invincible by Xtry
; File Dropper
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias fidrop { if ($dialog(filedrop)) dialog -v filedrop | else dialog -m filedrop filedrop }
dialog filedrop {
  size -1 -1 430 332
  title "File Dropper"
  icon graph/logs.ico
  button "&Ok",150, 15 302 60 23, Ok
  button "&Close",1, 80 302 60 23, Cancel
  tab "File-Drop 1",2, 10 10 410 285
  tab "File-Drop 2",3
  tab "File-Drop 3",4
  tab "File-Drop 4",5
  tab "File-Drop 5",6
  box "",7, 25 40 390 245
  text "&Max Sends",8, 45 77 75 20, tab2
  edit "",9, 125 75 40 20, tab2
  text "&Ad Delay (secs)",12, 45 107 75 20, tab2
  edit "",13, 125 105 40 20, tab2
  box "&General",14, 35 50 145 90, tab2
  text "# 1",200, 40 162 60 20, tab2
  text "# 2",201, 40 182 60 20, tab2
  text "# 3",202, 40 202 60 20, tab2
  text "# 4",203, 40 222 60 20, tab2
  text "# 5",204, 40 242 60 20, tab2
  text "# 6",205, 140 162 60 20, tab2
  text "# 7",206, 140 182 60 20, tab2
  text "# 8",207, 140 202 60 20, tab2
  text "# 9",208, 140 222 60 20, tab2
  text "# 10",209, 140 242 60 20, tab2
  edit "",210, 65 160 65 20, tab2 autohs
  edit "",211, 65 180 65 20, tab2 autohs
  edit "",212, 65 200 65 20, tab2 autohs
  edit "",213, 65 220 65 20, tab2 autohs
  edit "",214, 65 240 65 20, tab2 autohs
  edit "",215, 165 160 65 20, tab2 autohs
  edit "",216, 165 180 65 20, tab2 autohs
  edit "",217, 165 200 65 20, tab2 autohs
  edit "",218, 165 220 65 20, tab2 autohs
  edit "",219, 165 240 65 20, tab2 autohs
  check "All Channels",220, 105 262 85 15, tab2
  box "&Channels",221, 35 140 210 140, tab2
  text "&File",21, 190 67 25 20, tab2
  edit "",22, 215 65 170 20, tab2 autohs
  button "...",23, 385 65 25 20, tab2
  text "&Trigger",24, 190 92 40 20, tab2
  edit "",25, 235 90 100 20, tab2 autohs
  text "&Note",222, 190 113 40 20, tab2 
  edit "",223, 235 110 150 20, tab2 autohs
  box "Stats",26, 250 140 160 140
  text "&Files Sent",27, 260 160 100 20
  edit "",28, 260 180 125 20, autohs center
  text "&Bytes Sent",29, 260 210 100 20
  edit "",30, 260 230 125 20, autohs center
  button "Reset Stats",31, 290 255 65 20
  box "File Info",32, 180 50 235 90, tab2
  button "&Start Ad",33, 175 302 75 20, tab2
  button "&Stop Ad",34, 255 302 75 20, tab2
  box "",35, -40 290 500 400
  button "&Clear All",800, 335 302 75 20, tab2
  ;-------------------------------------------------------
  text "&Max Sends",36, 45 77 75 20, tab3
  edit "",37, 125 75 40 20, tab3
  text "&Ad Delay (secs)",40, 45 107 75 20, tab3
  edit "",41, 125 105 40 20, tab3
  box "&General",42, 35 50 145 90, tab3
  text "# 1",250, 40 162 60 20, tab3
  text "# 2",251, 40 182 60 20, tab3
  text "# 3",252, 40 202 60 20, tab3
  text "# 4",253, 40 222 60 20, tab3
  text "# 5",254, 40 242 60 20, tab3
  text "# 6",255, 140 162 60 20, tab3
  text "# 7",256, 140 182 60 20, tab3
  text "# 8",257, 140 202 60 20, tab3
  text "# 9",258, 140 222 60 20, tab3
  text "# 10",259, 140 242 60 20, tab3
  edit "",260, 65 160 65 20, tab3 autohs
  edit "",261, 65 180 65 20, tab3 autohs
  edit "",262, 65 200 65 20, tab3 autohs
  edit "",263, 65 220 65 20, tab3 autohs
  edit "",264, 65 240 65 20, tab3 autohs
  edit "",265, 165 160 65 20, tab3 autohs
  edit "",266, 165 180 65 20, tab3 autohs
  edit "",267, 165 200 65 20, tab3 autohs
  edit "",268, 165 220 65 20, tab3 autohs
  edit "",269, 165 240 65 20, tab3 autohs
  check "All Channels",270, 105 262 85 15, tab3
  box "&Channels",271, 35 140 210 140, tab3
  text "&File",49, 190 67 25 20, tab3
  edit "",50, 215 65 170 20, tab3 autohs
  button "...",51, 385 65 25 20, tab3
  text "&Trigger",52, 190 92 40 20, tab3
  edit "",53, 235 90 100 20, tab3 autohs
  text "&Note",224, 190 113 40 20, tab3
  edit "",225, 235 110 150 20, tab3 autohs
  box "File Info",60, 180 50 235 90, tab3
  button "&Start Ad",61, 175 302 75 20, tab3
  button "&Stop Ad",62, 255 302 75 20, tab3
  button "&Clear All",801, 335 302 75 20, tab3
  ;-------------------------------------------------
  text "&Max Sends",64, 45 77 75 20, tab4
  edit "",65, 125 75 40 20, tab4
  text "&Ad Delay (secs)",68, 45 107 75 20, tab4
  edit "",69, 125 105 40 20, tab4
  box "&General",70, 35 50 145 90, tab4
  text "# 1",400, 40 162 60 20, tab4
  text "# 2",401, 40 182 60 20, tab4
  text "# 3",402, 40 202 60 20, tab4
  text "# 4",403, 40 222 60 20, tab4
  text "# 5",404, 40 242 60 20, tab4
  text "# 6",405, 140 162 60 20, tab4
  text "# 7",406, 140 182 60 20, tab4
  text "# 8",407, 140 202 60 20, tab4
  text "# 9",408, 140 222 60 20, tab4
  text "# 10",409, 140 242 60 20, tab4
  edit "",410, 65 160 65 20, tab4 autohs
  edit "",411, 65 180 65 20, tab4 autohs
  edit "",412, 65 200 65 20, tab4 autohs
  edit "",413, 65 220 65 20, tab4 autohs
  edit "",414, 65 240 65 20, tab4 autohs
  edit "",415, 165 160 65 20, tab4 autohs
  edit "",416, 165 180 65 20, tab4 autohs
  edit "",417, 165 200 65 20, tab4 autohs
  edit "",418, 165 220 65 20, tab4 autohs
  edit "",419, 165 240 65 20, tab4 autohs
  check "All Channels",420, 105 262 85 15, tab4
  box "&Channels",421, 35 140 210 140, tab4
  text "&File",77, 190 67 25 20, tab4
  edit "",78, 215 65 170 20, tab4 autohs
  button "...",79, 385 65 25 20, tab4
  text "&Trigger",80, 190 92 40 20, tab4
  edit "",81, 235 90 100 20, tab4 autohs
  text "&Note",226, 190 113 40 20, tab4
  edit "",227, 235 110 150 20, tab4 autohs
  box "File Info",88, 180 50 235 90, tab4
  button "&Start Ad",89, 175 302 75 20, tab4
  button "&Stop Ad",90, 255 302 75 20, tab4
  button "&Clear All",802, 335 302 75 20, tab4
  ;-----------------------------------------------------
  text "&Max Sends",92, 45 77 75 20, tab5
  edit "",93, 125 75 40 20, tab5
  text "&Ad Delay (secs)",96, 45 107 75 20, tab5
  edit "",97, 125 105 40 20, tab5
  box "&General",98, 35 50 145 90, tab5
  text "# 1",450, 40 162 60 20, tab5
  text "# 2",451, 40 182 60 20, tab5
  text "# 3",452, 40 202 60 20, tab5
  text "# 4",453, 40 222 60 20, tab5
  text "# 5",454, 40 242 60 20, tab5
  text "# 6",455, 140 162 60 20, tab5
  text "# 7",456, 140 182 60 20, tab5
  text "# 8",457, 140 202 60 20, tab5
  text "# 9",458, 140 222 60 20, tab5
  text "# 10",459, 140 242 60 20, tab5
  edit "",460, 65 160 65 20, tab5 autohs
  edit "",461, 65 180 65 20, tab5 autohs
  edit "",462, 65 200 65 20, tab5 autohs
  edit "",463, 65 220 65 20, tab5 autohs
  edit "",464, 65 240 65 20, tab5 autohs
  edit "",465, 165 160 65 20, tab5 autohs
  edit "",466, 165 180 65 20, tab5 autohs
  edit "",467, 165 200 65 20, tab5 autohs
  edit "",468, 165 220 65 20, tab5 autohs
  edit "",469, 165 240 65 20, tab5 autohs
  check "All Channels",470, 105 262 85 15, tab5
  box "&Channels",471, 35 140 210 140, tab5
  text "&File",105, 190 67 25 20, tab5
  edit "",106, 215 65 170 20, tab5 autohs
  button "...",107, 385 65 25 20, tab5
  text "&Trigger",108, 190 92 40 20, tab5
  edit "",109, 235 90 100 20, tab5 autohs
  text "&Note",228, 190 113 40 20, tab5
  edit "",229, 235 110 150 20, tab5 autohs
  box "File Info",116, 180 50 235 90, tab5
  button "&Start Ad",117, 175 302 75 20, tab5
  button "&Stop Ad",118, 255 302 75 20, tab5
  button "&Clear All",803, 335 302 75 20, tab5
  ;----------------------------------------------
  text "&Max Sends",120, 45 77 75 20, tab6
  edit "",121, 125 75 40 20, tab6
  text "&Ad Delay (secs)",124, 45 107 75 20, tab6
  edit "",125, 125 105 40 20, tab6
  box "&General",126, 35 50 145 90, tab6
  text "# 1",550, 40 162 60 20, tab6
  text "# 2",551, 40 182 60 20, tab6
  text "# 3",552, 40 202 60 20, tab6
  text "# 4",553, 40 222 60 20, tab6
  text "# 5",554, 40 242 60 20, tab6
  text "# 6",555, 140 162 60 20, tab6
  text "# 7",556, 140 182 60 20, tab6
  text "# 8",557, 140 202 60 20, tab6
  text "# 9",558, 140 222 60 20, tab6
  text "# 10",559, 140 242 60 20, tab6
  edit "",560, 65 160 65 20, tab6 autohs
  edit "",561, 65 180 65 20, tab6 autohs
  edit "",562, 65 200 65 20, tab6 autohs
  edit "",563, 65 220 65 20, tab6 autohs
  edit "",564, 65 240 65 20, tab6 autohs
  edit "",565, 165 160 65 20, tab6 autohs
  edit "",566, 165 180 65 20, tab6 autohs
  edit "",567, 165 200 65 20, tab6 autohs
  edit "",568, 165 220 65 20, tab6 autohs
  edit "",569, 165 240 65 20, tab6 autohs
  check "All Channels",570, 105 262 85 15, tab6
  box "&Channels",571, 35 140 210 140, tab6
  text "&File",133, 190 67 25 20, tab6
  edit "",134, 215 65 170 20, tab6 autohs
  button "...",135, 385 65 25 20, graph\browx.jpg tab6  
  text "&Trigger",136, 190 92 40 20, tab6
  edit "",137, 235 90 100 20, tab6 autohs
  text "&Note",230, 190 113 40 20, tab6
  edit "",231, 235 110 150 20, tab6 autohs
  box "File Info",144, 180 50 235 90, tab6
  button "&Start Ad",145, 175 302 75 20, tab6
  button "&Stop Ad",146, 255 302 75 20, tab6
  button "&Clear All",804, 335 302 75 20, tab6
}
on *:dialog:filedrop:init:0: {
  did -m filedrop 22 1 %drop.file1 $did(22)
  did -m filedrop 50 1 %drop.file2 $did(50)
  did -m filedrop 78 1 %drop.file3 $did(78)
  did -m filedrop 106 1 %drop.file4 $did(106)
  did -m filedrop 134 1 %drop.file5 $did(134)
  did -o filedrop 9 1 %max.sends1 $did(9) 
  did -o filedrop 37 1 %max.sends2 $did(37)
  did -o filedrop 65 1 %max.sends3 $did(65)
  did -o filedrop 93 1 %max.sends4 $did(93)
  did -o filedrop 121 1 %max.sends5 $did(121)
  did -m filedrop 28 1 %drop.stats $did(28)
  did -m filedrop 30 1 %drop.stats2 $did(30)
  did -o filedrop 28 1  %sent 
  did -o filedrop 30 1 %sent2 
  did -o filedrop 13 1 %ad.delay1 $did(13)
  did -o filedrop 41 1 %ad.delay2 $did(41)
  did -o filedrop 69 1 %ad.delay3 $did(69)
  did -o filedrop 97 1 %ad.delay4 $did(97)
  did -o filedrop 125 1 %ad.delay4 $did(125)
  did -o filedrop 22 1 %drop.file1 $did(22)
  did -o filedrop 50 1 %drop.file2 $did(50)
  did -o filedrop 78 1 %drop.file3 $did(78)
  did -o filedrop 106 1 %drop.file4 $did(106)
  did -o filedrop 134 1 %drop.file5 $did(134)
  did -o filedrop 25 1 %drop.trig1 $did(25)
  did -o filedrop 53 1 %drop.trig2 $did(53)
  did -o filedrop 81 1 %drop.trig3 $did(81)
  did -o filedrop 109 1 %drop.trig4 $did(109)
  did -o filedrop 137 1 %drop.trig5 $did(137)
  did -o filedrop 223 1 %drop.note1 $did(223)
  did -o filedrop 225 1 %drop.note2 $did(225)
  did -o filedrop 227 1 %drop.note3 $did(227)
  did -o filedrop 229 1 %drop.note4 $did(229)
  did -o filedrop 231 1 %drop.note5 $did(231)
  did -o filedrop 210 1 %drop.chan11 $did(210)
  did -o filedrop 211 1 %drop.chan12 $did(211)
  did -o filedrop 212 1 %drop.chan13 $did(212)
  did -o filedrop 213 1 %drop.chan14 $did(213)
  did -o filedrop 214 1 %drop.chan15 $did(214)
  did -o filedrop 215 1 %drop.chan16 $did(215)
  did -o filedrop 216 1 %drop.chan17 $did(216)
  did -o filedrop 217 1 %drop.chan18 $did(217)
  did -o filedrop 218 1 %drop.chan19 $did(218)
  did -o filedrop 219 1 %drop.chan110 $did(219)
  did -o filedrop 260 1 %drop.chan21 $did(260)
  did -o filedrop 261 1 %drop.chan22 $did(261)
  did -o filedrop 262 1 %drop.chan23 $did(262)
  did -o filedrop 263 1 %drop.chan24 $did(263)
  did -o filedrop 264 1 %drop.chan25 $did(264)
  did -o filedrop 265 1 %drop.chan26 $did(265)
  did -o filedrop 266 1 %drop.chan27 $did(266)
  did -o filedrop 267 1 %drop.chan28 $did(267)
  did -o filedrop 268 1 %drop.chan29 $did(268)
  did -o filedrop 269 1 %drop.chan210 $did(269)
  did -o filedrop 410 1 %drop.chan31 $did(410)
  did -o filedrop 411 1 %drop.chan32 $did(411)
  did -o filedrop 412 1 %drop.chan33 $did(412)
  did -o filedrop 413 1 %drop.chan34 $did(413)
  did -o filedrop 414 1 %drop.chan35 $did(414) 
  did -o filedrop 415 1 %drop.chan36 $did(415)
  did -o filedrop 416 1 %drop.chan37 $did(416)
  did -o filedrop 417 1 %drop.chan38 $did(417)
  did -o filedrop 418 1 %drop.chan39 $did(418)
  did -o filedrop 419 1 %drop.chan310 $did(419)
  did -o filedrop 460 1 %drop.chan41 $did(460)
  did -o filedrop 461 1 %drop.chan42 $did(461)
  did -o filedrop 462 1 %drop.chan43 $did(462)
  did -o filedrop 463 1 %drop.chan44 $did(463)
  did -o filedrop 464 1 %drop.chan45 $did(464)
  did -o filedrop 465 1 %drop.chan46 $did(465)
  did -o filedrop 466 1 %drop.chan47 $did(466)
  did -o filedrop 467 1 %drop.chan48 $did(467)
  did -o filedrop 468 1 %drop.chan49 $did(468)
  did -o filedrop 469 1 %drop.chan410 $did(469)
  did -o filedrop 560 1 %drop.chan51 $did(560)
  did -o filedrop 561 1 %drop.chan52 $did(561)
  did -o filedrop 562 1 %drop.chan53 $did(562)
  did -o filedrop 563 1 %drop.chan54 $did(563)
  did -o filedrop 564 1 %drop.chan55 $did(564)
  did -o filedrop 565 1 %drop.chan56 $did(565)
  did -o filedrop 566 1 %drop.chan57 $did(566)
  did -o filedrop 567 1 %drop.chan58 $did(567)
  did -o filedrop 568 1 %drop.chan59 $did(568)
  did -o filedrop 569 1 %drop.chan510 $did(569)
  if (%fd1.all == on) { did -c filedrop 220 | did -b $dname 210,211,212,213,214,215,216,217,218,219 } 
  if (%fd2.all == on) { did -c filedrop 270 | did -b $dname 260,261,262,263,264,265,266,267,268,269 } 
  if (%fd3.all == on) { did -c filedrop 420 | did -b $dname 410,411,412,413,414,415,416,417,418,419 } 
  if (%fd4.all == on) { did -c filedrop 470 | did -b $dname 460,461,462,463,464,465,466,467,468,469 } 
  if (%fd5.all == on) { did -c filedrop 570 | did -b $dname 560,561,562,563,564,565,566,567,568,569 } 
}
on *:dialog:filedrop:edit:*: {
  if ($did == 9) { set %max.sends1 $did(9) } 
  if ($did == 37) { set %max.sends2 $did(37) }
  if ($did == 65) { set %max.sends3 $did(65) }
  if ($did == 93) { set %max.sends4 $did(93) }
  if ($did == 121) { set %max.sends5 $did(121) }
  if ($did == 11) { set %max.queues1 $did(11) }
  if ($did == 39) { set %max.queues2 $did(39) }
  if ($did == 67) { set %max.queues3 $did(67) }
  if ($did == 95) { set %max.queues4 $did(95) }
  if ($did == 123) { set %max.queues5 $did(123) }
  if ($did == 13) { set %ad.delay1 $did(13) }
  if ($did == 41) { set %ad.delay2 $did(41) }
  if ($did == 69) { set %ad.delay3 $did(69) }
  if ($did == 97) { set %ad.delay4 $did(97) }
  if ($did == 125) { set %ad.delay5 $did(125) }
  if ($did == 22) { set %drop.file1 $did(22) }
  if ($did == 50) { set %drop.file2 $did(50) }
  if ($did == 78) { set %drop.file3 $did(78) }
  if ($did == 106) { set %drop.file4 $did(106) }
  if ($did == 134) { set %drop.file5 $did(134) }
  if ($did == 25) { set %drop.trig1 $did(25) }
  if ($did == 53) { set %drop.trig2 $did(53) }
  if ($did == 81) { set %drop.trig3 $did(81) }
  if ($did == 109) { set %drop.trig4 $did(109) }
  if ($did == 137) { set %drop.trig5 $did(137) }
  if ($did == 223) { set %drop.note1 $did(223) }
  if ($did == 225) { set %drop.note2 $did(225) }
  if ($did == 227) { set %drop.note3 $did(227) }
  if ($did == 229) { set %drop.note4 $did(229) }
  if ($did == 231) { set %drop.note5 $did(231) }
  if ($did == 210) { set %drop.chan11 $did(210) }
  if ($did == 211) { set %drop.chan12 $did(211) }
  if ($did == 212) { set %drop.chan13 $did(212) }
  if ($did == 213) { set %drop.chan14 $did(213) }
  if ($did == 214) { set %drop.chan15 $did(214) }
  if ($did == 215) { set %drop.chan16 $did(215) }
  if ($did == 216) { set %drop.chan17 $did(216) }
  if ($did == 217) { set %drop.chan18 $did(217) }
  if ($did == 218) { set %drop.chan19 $did(218) }
  if ($did == 219) { set %drop.chan110 $did(219) }
  if ($did == 260) { set %drop.chan21 $did(260) }
  if ($did == 261) { set %drop.chan22 $did(261) }
  if ($did == 262) { set %drop.chan23 $did(262) }
  if ($did == 263) { set %drop.chan24 $did(263) }
  if ($did == 264) { set %drop.chan25 $did(264) }
  if ($did == 265) { set %drop.chan26 $did(265) }
  if ($did == 266) { set %drop.chan27 $did(266) }
  if ($did == 267) { set %drop.chan28 $did(267) }
  if ($did == 268) { set %drop.chan29 $did(268) }
  if ($did == 269) { set %drop.chan210 $did(269) }
  if ($did == 410) { set %drop.chan31 $did(410) }
  if ($did == 411) { set %drop.chan32 $did(411) }
  if ($did == 412) { set %drop.chan33 $did(412) }
  if ($did == 413) { set %drop.chan34 $did(413) }
  if ($did == 414) { set %drop.chan35 $did(414) }
  if ($did == 415) { set %drop.chan36 $did(415) }
  if ($did == 416) { set %drop.chan37 $did(416) }
  if ($did == 417) { set %drop.chan38 $did(417) }
  if ($did == 418) { set %drop.chan39 $did(418) }
  if ($did == 419) { set %drop.chan310 $did(419) }
  if ($did == 460) { set %drop.chan41 $did(460) }
  if ($did == 461) { set %drop.chan42 $did(461) }
  if ($did == 462) { set %drop.chan43 $did(462) }
  if ($did == 463) { set %drop.chan44 $did(463) }
  if ($did == 464) { set %drop.chan45 $did(464) }
  if ($did == 465) { set %drop.chan46 $did(465) }
  if ($did == 466) { set %drop.chan47 $did(466) }
  if ($did == 467) { set %drop.chan48 $did(467) }
  if ($did == 468) { set %drop.chan49 $did(468) }
  if ($did == 469) { set %drop.chan410 $did(469) }
  if ($did == 560) { set %drop.chan51 $did(560) }
  if ($did == 561) { set %drop.chan52 $did(561) }
  if ($did == 562) { set %drop.chan53 $did(562) }
  if ($did == 563) { set %drop.chan54 $did(563) }
  if ($did == 564) { set %drop.chan55 $did(564) }
  if ($did == 565) { set %drop.chan56 $did(565) }
  if ($did == 566) { set %drop.chan57 $did(566) }
  if ($did == 567) { set %drop.chan58 $did(567) }
  if ($did == 568) { set %drop.chan59 $did(568) }
  if ($did == 569) { set %drop.chan510 $did(569) }
}
on *:dialog:filedrop:sclick:*: {
  if ($did == 800) { unset %drop.file1 | unset %max.sends1 | unset %drop.stats | unset %drop.stats2 | unset %sent | unset %sent2 | unset %ad.delay1 | unset %drop.note1 | unset %drop.chan1* | unset %drop.trig1 | did -r $dname 9,13,210,211,212,213,214,215,216,217,218,219,22,25,223,28,30 }
  if ($did == 801) { unset %drop.file2 | unset %max.sends2 | unset %drop.stats | unset %drop.stats2 | unset %sent | unset %sent2 | unset %ad.delay2 | unset %drop.note2 | unset %drop.chan2* | unset %drop.trig2 | did -r $dname 37,41,260,261,262,263,264,265,266,267,267,269,50,53,225,56,58 }
  if ($did == 802) { unset %drop.file3 | unset %max.sends3 | unset %drop.stats | unset %drop.stats2 | unset %sent | unset %sent2 | unset %ad.delay3 | unset %drop.note3 | unset %drop.chan3* | unset %drop.trig3 | did -r $dname 65,69,410,411,412,413,414,415,416,417,418,419,78,81,227,84,86 }
  if ($did == 803) { unset %drop.file4 | unset %max.sends4 | unset %drop.stats | unset %drop.stats2 | unset %sent | unset %sent2 | unset %ad.delay4 | unset %drop.note4 | unset %drop.chan4* | unset %drop.trig4 | did -r $dname 93,97,460,461,462,463,464,465,466,467,468,469,106,109,229,112,114 }
  if ($did == 804) { unset %drop.file5 | unset %max.sends5 | unset %drop.stats | unset %drop.stats2 | unset %sent | unset %sent2 | unset %ad.delay5 | unset %drop.note5 | unset %drop.chan5* | unset %drop.trig5 | did -r $dname 121,125,560,561,562,563,564,565,566,567,568,569,134,137,231,140,142 }
  if ($did == 31) { did -r filedrop 28 1  | did -o filedrop 30 1  | unset %files.sent | unset %sent2 }
  if ($did == 33) { drop.start1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 1  $+ $cxs(2) $+ has been started | set %filed1 on }
  if ($did == 34) { drop.stop1 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 1  $+ $cxs(2) $+ has been halted | set %filed1 off }
  if ($did == 61) { drop.start2 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 2  $+ $cxs(2) $+ has been started | set %filed2 on }
  if ($did == 62) { drop.stop2 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 2  $+ $cxs(2) $+ has been halted | set %filed2 off }
  if ($did == 89) { drop.start3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 3  $+ $cxs(2) $+ has been started | set %filed3 on }
  if ($did == 90) { drop.stop3 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 3  $+ $cxs(2) $+ has been halted | set %filed3 off }
  if ($did == 117) { drop.start4 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 4  $+ $cxs(2) $+ has been started. | set %filed4 on }
  if ($did == 118) { drop.stop4 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 4  $+ $cxs(2) $+ has been halted | set %filed4 off }
  if ($did == 145) { drop.start5 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 5  $+ $cxs(2) $+ has been started | set %filed5 on }
  if ($did == 146) { drop.stop5 | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) File Dropper $+ $cxs(1) 5  $+ $cxs(2) $+ has been halted | set %filed5 off }
  if ($did == 220) { if ($did($dname,$did).state == 1) { did -b $dname 210,211,212,213,214,215,216,217,218,219 | set %fd1.all on } | else { did -e $dname 210,211,212,213,214,215,216,217,218,219 | set %fd1.all off } }
  if ($did == 270) { if ($did($dname,$did).state == 1) { did -b $dname 260,261,262,263,264,265,266,267,268,269 | set %fd2.all on } | else { did -e $dname 260,261,262,263,264,265,266,267,268,269 | set %fd2.all off } }
  if ($did == 420) { if ($did($dname,$did).state == 1) { did -b $dname 410,411,412,413,414,415,416,417,418,419 | set %fd3.all on } | else { did -e $dname 410,411,412,413,414,415,416,417,418,419 | set %fd3.all off } }
  if ($did == 470) { if ($did($dname,$did).state == 1) { did -b $dname 460,461,462,463,464,465,466,467,468,469 | set %fd4.all on } | else { did -e $dname 460,461,462,463,464,465,466,467,468,469 | set %fd4.all off } }
  if ($did == 570) { if ($did($dname,$did).state == 1) { did -b $dname 560,561,562,563,564,565,566,567,568,569 | set %fd5.all on } | else { did -e $dname 560,561,562,563,564,565,566,567,568,569 | set %fd5.all off } }
  if ($did == 23) { dropfile1 }
  if ($did == 51) { dropfile2 }
  if ($did == 79) { dropfile3 }
  if ($did == 107) { dropfile4 }
  if ($did == 135) { dropfile5 }
}
alias dropfile1 { .timersetfile1 -m 1 1 setfile1_now }
alias setfile1_now { set %drop.file1 $$dir="Select File 1" | did -o filedrop 22 22 %drop.file1 }
alias dropfile2 { .timersetfile2 -m 1 1 setfile2_now }
alias setfile2_now { set %drop.file2 $$dir="Select File 2" | did -o filedrop 50 50 %drop.file2 }
alias dropfile3 { .timersetfile3 -m 1 1 setfile3_now }
alias setfile3_now { set %drop.file3 $$dir="Select File 3" | did -o filedrop 78 78 %drop.file3 }
alias dropfile4 { .timersetfile4 -m 1 1 setfile4_now }
alias setfile4_now { set %drop.file4 $$dir="Select File 4" | did -o filedrop 106 106 %drop.file4 }
alias dropfile5 { .timersetfile5 -m 1 1 setfile5_now }
alias setfile5_now { set %drop.file5 $$dir="Select File 5" | did -o filedrop 134 134 %drop.file5 }

on *:OPEN:!:{ 
  if (%users.served == n/a) { set %users.served 0 }
  inc %users.served 1 
  msg =$nick %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+  %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ 
  msg =$nick File Server - %name
  msg =$nick %c2 $+ -- %c1 $+ stats %c2 $+ -- %c1 $+ Shows users served and other info.
  msg =$nick %c2 $+ -- %c1 $+ dir %c2 $+ -- %c1 $+ Displays all files and directories. 
  msg =$nick %c2 $+ -- %c1 $+ read %c2 $+ -- %c1 $+ Reads the contents of a file.
  msg =$nick %c2 $+ -- %c1 $+ cd %c2 $+ -- %c1 $+ Changes your current directory.
  msg =$nick %c2 $+ -- %c1 $+ ls %c2 $+ -- %c1 $+ Shows all directories in a wide view.
  msg =$nick %c2 $+ -- %c1 $+ exit or bye %c2 $+ -- %c1 $+ Ends this fileserver session.
  msg =$nick %c2 $+ -- %c1 $+ sends %c2 $+ -- %c1 $+ Shows the current sends.  
  if (%f.minc == on) { msg =$nick %c2 $+ -- %c1 $+ Min CPS $+ %c2 $+ -- %c1 $+ %min.cps }
  msg =$nick %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ %c1 $+ - $+ %c2 $+ = $+ 
  if (%fserv.wf != $null) { msg =$nick $+ %fserv.wf $+ }
  if (%mdrive1 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 1: %fserve.drive1.desc %c1 $+ Type !Drive1 }
  if (%mdrive2 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 2: %fserve.drive2.desc %c1 $+ Type !Drive2 }
  if (%mdrive3 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 3: %fserve.drive3.desc %c1 $+ Type !Drive3 }
  if (%mdrive4 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 4: %fserve.drive4.desc %c1 $+ Type !Drive4 }
  if (%mdrive5 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 5: %fserve.drive5.desc %c1 $+ Type !Drive5 }
  if (%mdrive6 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 6: %fserve.drive6.desc %c1 $+ Type !Drive6 }
  if (%mdrive7 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 7: %fserve.drive7.desc %c1 $+ Type !Drive7 }
  if (%mdrive8 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 8: %fserve.drive8.desc %c1 $+ Type !Drive8 }
  if (%mdrive9 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 9: %fserve.drive9.desc %c1 $+ Type !Drive9 }
  if (%mdrive10 == On) && (%fserve.multidrive == on) { msg =$nick %c1 $+ Multi-Drive -- %c2 $+ Drive 10: %fserve.drive10.desc %c1 $+ Type !Drive10 }

  if (%fserve.multidrive == On) { msg =$nick %c1 $+ Type %c2 $+ !Home %c1 $+ to return to main directory at anytime. }
  if ($nick != $me) { f.msg (File Server) %c1 $nick %c2 $+ has joined the File Server. }
}
on 1:SERV:stats: {
  msg =$nick %c1 $+ ----- %c2 $+ ( $+ %c1 $+ File Server Stats $+ %c2 $+ ) %c1 $+ -----
  msg =$nick %c1 $+ -- %c2 $+ ( $+ %c1 $+ Note $+ %c2 $+ ) %offer
  msg =$nick %c1 $+ -- %c2 $+ ( $+ %c1 $+ Online $+ %c2 $+ ) $fserv(0) $+ %c1 $+ / $+ %c2 $+ %max.users 
  msg =$nick %c1 $+ -- %c2 $+ ( $+ %c1 $+ Sends $+ %c2 $+ ) $send(0) $+ %c1 $+ / $+ %c2 $+ %total.sends 
  msg =$nick %c1 $+ -- %c2 $+ ( $+ %c1 $+ Files $+ %c2 $+ ) $findfile(%fserv.dir,*,*) 
  msg =$nick %c1 $+ -- %c2 $+ ( $+ %c1 $+ Snagged $+ %c2 $+ ) $size(%sent2)
  msg =$nick %c1 $+ -- %c2 $+ ( $+ %c1 $+ Accessed $+ %c2 $+ ) %users.served 
  if (%f.minc == on) { msg =$nick %c1 $+ -- %c2 $+ ( $+ %c1 $+ Min CPS $+ %c2 $+ ) %min.cps }
  msg =$nick %c1 $+ ----- %c2 $+ ( $+ %c1 $+ End of Stats $+ %c2 $+ ) %c1 $= -----
  halt
}
on 1:SERV:cd*: { 
  if ($isdir( [ [ $fserv( [ $nick ] ).cd ] $+ ] \ [ $+ [ $2- ] ] ) == $false) { msg =$nick %c2 $+ ( $+ %c1 $+ Invalid Directory $+ %c2 $+ ) | halt }
  else { msg =$nick %c2 $+ ( $+ %c1 $+ Now Switching To: $+ %c2 $+ ) $2- }
}
on 1:SERV:sends: { 
  if ($send(0) == 0) { msg =$nick %c1 $+ I Have %c2 $+ No %c1 $+ Sends In Progress | goto done2 }
  msg =$nick %c1 $+ Now Sending %c2 $+ $send(0) %c1 $+ File(s). Total Bandwidth - %c2 $+ $bandwidth 
  set %sendstat 0 
  :loopy
  inc %sendstat 1
  if ($send(%sendstat).file == $null) { goto done2 }
  msg =$nick %c2 $+ $chr(35) $+ %sendstat %c1 $+ $send(%sendstat).file %c2 $+ ( $+ %c1 $+ $size(%sendstat) $+ %c2 $+ ) %c2 $+ At: %c1 $+ $send(%sendstat).cps Cps %c2 $+ To: %c1 $+ $send(%sendstat) %c2 $+ It's %c1 $+ $send(%sendstat).pc $+ % %c2 $+ Done with: %c1 $+ $duration($int($calc($calc($send(%sendstat).size - $send(%sendstat).rcvd) / $send(%sendstat).cps))) %c2 $+ left.
  goto loopy
  :done2
  unset %sendstat
  halt
}
on 1:CLOSE:!: {
  if (%fserv.all == on) && (%fs.slot == on) { amsg $openslot | goto end }
  if (%fservc.1 != $null) && ($chan(%fservc.1) != $null) && (%fs.slot == on) { msg %fservc.1 $openslot }
  if (%fservc.2 != $null) && ($chan(%fservc.2) != $null) && (%fs.slot == on) { msg %fservc.2 $openslot }
  if (%fservc.3 != $null) && ($chan(%fservc.3) != $null) && (%fs.slot == on) { msg %fservc.3 $openslot }
  if (%fservc.4 != $null) && ($chan(%fservc.4) != $null) && (%fs.slot == on) { msg %fservc.4 $openslot }
  if (%fservc.5 != $null) && ($chan(%fservc.5) != $null) && (%fs.slot == on) { msg %fservc.5 $openslot }
  if (%fservc.6 != $null) && ($chan(%fservc.6) != $null) && (%fs.slot == on) { msg %fservc.6 $openslot }
  if (%fservc.7 != $null) && ($chan(%fservc.7) != $null) && (%fs.slot == on) { msg %fservc.7 $openslot }
  if (%fservc.8 != $null) && ($chan(%fservc.8) != $null) && (%fs.slot == on) { msg %fservc.8 $openslot }
  if (%fservc.9 != $null) && ($chan(%fservc.9) != $null) && (%fs.slot == on) { msg %fservc.9 $openslot }
  if (%fservc.10 != $null) && ($chan(%fservc.10) != $null) && (%fs.slot == on) { msg %fservc.10 $openslot }
  :end 
  f.msg (File Server) %c1 $nick %c2 $+ has left the File Server.
}
on *:SERV:*: {
  if ($1 == Get) {
    if ($2 == $null) { msg =$nick %c2 $+ ( $+ %c1 $+ Syntax: get <filename> $+ %c2 $+ ) | halt }
    set %tmp $fserv($nick).cd $+ \
    set %tmp %tmp $+ $2-
    if ($exists(%tmp) != $true) { msg =$Nick %c2 $+ ( $+ %c1 $+ Invalid Filename $+ %c2 $+ ) | halt | haltdef }
    if ($send(0) >= %total.sends) {     
      /msg = $+ $nick %c2 $+ ( $+ %c1 $+ Sorry The Maximum Files is Now Sending Please Wait For An Open Spot $+ %c2 $+ ) 
      set %temp.fserve.filename $fserv($nick).cd $+ \ [ $+ [ $2- ] ] 
      if ($que.total >= %total.queue) { /msg = $+ $nick %c2 $+ ( $+ %c1 $+ All Queues Have Been Filled $+ %c2 $+ ) | halt }
      else { Que.Add Fserve $nick %temp.fserve.filename | msg = $+ $nick %c2 $+ ( $+ %c1 $+ Queueing $+ %c2 $+ ) $nopath(%temp.fserve.filename) ( $+ $size(%temp.fserve.filename) $+ ) %c2 $+ ( $+ %c1 $+ It has been placed in queue slot $+ %c2 $+ ) $chr(35) $+ $Que.Total $+ , %c2 $+ ( $+ %c1 $+ It will send when sends are available $+ %c2 $+ ) | unset %temp.fserve.filename | halt }
    }
    elseif ($send(0) >= %total.sends) {
      if ($que.total >= %total.queue) { msg =$nick %c2 $+ ( $+ %c1 $+ Sorry, There Are Too Many Sends right now and all the Queue Slots are in use. If you want to see more info on the currect sends type stats $+ %c2 $+ ) | unset %temp.fserve.filename | halt }
      else { Que.Add Fserve $nick %temp.fserve.filename | msg =$nick %c2 $+ ( $+ %c1 $+ Queueing $+ %c2 $+ ) $nopath(%temp.fserve.filename) ( $+ $size(%temp.fserve.filename) $+ ) %c2 $+ ( $+ %c1 $+ It has been placed in queue slot $+ %c2 $+ ) $chr(35) $+ $Que.Total $+ , %c2 $+ ( $+ %c1 $+ It will send when sends are available $+ %c2 $+ ) | unset %temp.fserve.filename | halt }
    }
    :sendelite
    else { set %temp.fserve.filename $fserv($nick).cd $+ \ [ $+ [ $2- ] ]  | dcc send $nick " $+ %temp.fserve.filename $+ " | msg =$nick %c2 $+ ( $+ %c1 $+ Now Sending $+ %c2 $+ ) $nopath(%temp.fserve.filename) %c2 $+ ( $+ $size(%temp.fserve.filename) $+ ) }
    unset %temp.fserve.credit %temp.fserve.filename | halt
  }
}
on 1:TEXT:!list:#: { 
  if (%fs == on) { 
    if ($nick ison %fservc.1) { goto endl }
    if ($nick ison %fservc.2) { goto endl }
    if ($nick ison %fservc.3) { goto endl }
    if ($nick ison %fservc.4) { goto endl }
    if ($nick ison %fservc.5) { goto endl }
    if ($nick ison %fservc.6) { goto endl }
    if ($nick ison %fservc.7) { goto endl }
    if ($nick ison %fservc.8) { goto endl }
    if ($nick ison %fservc.9) { goto endl }
    if ($nick ison %fservc.10) { goto endl }
    else { goto endl2 }
    :endl
    .notice $nick $fservead2  
    :endl2
    halt
  }
}
ctcp *:%trigger: { 
  if (%fs == Off) { notice $nick %c2 $+ ( $+ %c1 $+ File Server is currently off.  Please try again later. $+ %c2 $+ ) | Halt } 
  if ($fserv(0) >= %max.users ) { /.notice $nick %c2 $+ ( $+ %c1 $+ All slots are currently in use.  Please try again later. $+ %c2 $+ ) | halt }
  FSERVE $nick 1 %fserv.dir %fserve.wf
}
ON *:TEXT:%trigger:#: {
  if (%fserv.all == on) { goto endl }
  if ($nick ison %fservc.1) { goto endl }
  if ($nick ison %fservc.2) { goto endl }
  if ($nick ison %fservc.3) { goto endl }
  if ($nick ison %fservc.4) { goto endl }
  if ($nick ison %fservc.5) { goto endl }
  if ($nick ison %fservc.6) { goto endl }
  if ($nick ison %fservc.7) { goto endl }
  if ($nick ison %fservc.8) { goto endl }
  if ($nick ison %fservc.9) { goto endl }
  if ($nick ison %fservc.10) { goto endl }
  else { goto endl2 }
  :endl
  if (%fs == off) { notice.p $nick %c2 $+ ( $+ %c1 $+ File Server is currently off.  Please try again later. $+ %c2 $+ ) | Halt }
  if ($fserv(0) >= %max.users ) { notice.p $nick %c2 $+ ( $+ %c1 $+ All slots are currently in use.  Please try again later. $+ %c2 $+ ) | halt }
  FSERVE $nick 1 %fserv.dir %fserve.wf 
  :endl2
  halt
}

alias fservead2 { 
  if (%fserve.adtype == Inv1) { 
    if (%top.cps == $null) { set %top.cps n/a }
    if (%Ptop.cps == $null) { set %Ptop.cps n/a }
    if (%f.minc == on) && (%trig.type == /ctcp) { 
    return 10.:4File Server Online10:.:Trigger04 /ctcp $me %trigger $+ 10:.:Accessed04 %users.served times $+ 10:.:Total Files04 $findfile(%fserv.dir,*,*) $+ 10:.:Files Sent04 %files.sent $+ 10:.:Snagged04 $size(%sent2) $+ 10:.:Min CPS04 %min.cps $+ 10:.:Top CPS04 %top.cps cps by %Ptop.cps $+ 10:.:Online04 $fserv(0) $+ / $+ %max.users $+ 10:.:Sends04 $send(0) $+ / $+ %total.sends $+ 10:.:Queues04 $que.total $+ / $+ %total.queue $+ 10:.:Note04 %offer $+ 10:. %name }
    if (%f.minc == off) && (%trig.type == /ctcp) { 
      return 10.:4File Server Online10:.:Trigger04 /ctcp $me %trigger $+ 10:.:Accessed04 %users.served times $+ 10:.:Total Files04 $findfile(%fserv.dir,*,*) $+ 10:.:Files Sent04 %files.sent $+ 10:.:Snagged04 $size(%sent2) $+ 10:.:Top CPS04 %top.cps cps by %Ptop.cps $+ 10:.:Online04 $fserv(0) $+ / $+ %max.users $+ 10:.:Sends04 $send(0) $+ / $+ %total.sends $+ 10:.:Queues04 $que.total $+ / $+ %total.queue $+ 10:.:Note04 %offer $+ 10:. %name}
      if (%f.minc == on) && (%trig.type == !Trigger) { 
      return 10.:4File Server Online10:.:Trigger04 %trigger $+ 10:.:Accessed04 %users.served times $+ 10:.:Total Files04 $findfile(%fserv.dir,*,*) $+ 10:.:Files Sent04 %files.sent $+ 10:.:Snagged04 $size(%sent2) $+ 10:.:Min CPS04 %min.cps $+ 10:.:Top CPS04 %top.cps cps by %Ptop.cps $+ 10:.:Online04 $fserv(0) $+ / $+ %max.users $+ 10:.:Sends04 $send(0) $+ / $+ %total.sends $+ 10:.:Queues04 $que.total $+ / $+ %total.queue $+ 10:.:Note04 %offer $+ 10:. %name }
      if (%f.minc == off) && (%trig.type == !Trigger) { 
      return 10.:4File Server Online10:.:Trigger04 %trigger $+ 10:.:Accessed04 %users.served times $+ 10:.:Total Files04 $findfile(%fserv.dir,*,*) $+ 10:.:Files Sent04 %files.sent $+ 10:.:Snagged04 $size(%sent2) $+ 10:.:Top CPS04 %top.cps cps by %Ptop.cps $+ 10:.:Online04 $fserv(0) $+ / $+ %max.users $+ 10:.:Sends04 $send(0) $+ / $+ %total.sends $+ 10:.:Queues04 $que.total $+ / $+ %total.queue $+ 10:.:Note04 %offer $+ 10:. %name }
    }
    if (%fserve.adtype == Inv2) {
      if (%top.cps == $null) { set %top.cps n/a }
      if (%Ptop.cps == $null) { set %Ptop.cps n/a }
      if (%f.minc == on) && (%trig.type == /ctcp) { return 11,5«0File Server Online11» «0Trigger08 /ctcp $me %trigger $+ 11» «0Files08 $findfile(%fserv.dir,*,*) $+ 11» «0Snagged08 $size(%sent2) $+ 11» «0Max CPS8 %top.cps $+ 11» «0Min CPS08 %min.cps $+ 11» «0Online08 $fserv(0) $+ / $+ %max.users $+ 11» «0Sends08 $send(0) $+ / $+ %total.sends $+ 11» «0Queues08 $que.total $+ / $+ %total.queue $+ 11» «0Accessed08 %users.served time(s)11» «0Note08 %offer $+ 11» %name }
      if (%f.minc == off) && (%trig.type == /ctcp) { return 11,5«0File Server Online11» «0Trigger08 /ctcp $me %trigger $+ 11» «0Files08 $findfile(%fserv.dir,*,*) $+ 11» «0Snagged08 $size(%sent2) $+ 11» «0Max CPS8 %top.cps $+ 11» «0Online08 $fserv(0) $+ / $+ %max.users $+ 11» «0Sends08 $send(0) $+ / $+ %total.sends $+ 11» «0Queues08 $que.total $+ / $+ %total.queue $+ 11» «0Accessed08 %users.served time(s)11» «0Note08 %offer $+ 11» %name }
      if (%f.minc == on) && (%trig.type == !Trigger) { return 11,5«0File Server Online11» «0Trigger08 %trigger $+ 11» «0Files08 $findfile(%fserv.dir,*,*) $+ 11» «0Snagged08 $size(%sent2) $+ 11» «0Max CPS8 %top.cps $+ 11» «0Min CPS08 %min.cps $+ 11» «0Online08 $fserv(0) $+ / $+ %max.users $+ 11» «0Sends08 $send(0) $+ / $+ %total.sends $+ 11» «0Queues08 $que.total $+ / $+ %total.queue $+ 11» «0Accessed08 %users.served time(s)11» «0Note08 %offer $+ 11» %name }
      if (%f.minc == off) && (%trig.type == !Trigger) { return 11,5«0File Server Online11» «0Trigger08 %trigger $+ 11» «0Files08 $findfile(%fserv.dir,*,*) $+ 11» «0Snagged08 $size(%sent2) $+ 11» «0Max CPS8 %top.cps $+ 11» «0Online08 $fserv(0) $+ / $+ %max.users $+ 11» «0Sends08 $send(0) $+ / $+ %total.sends $+ 11» «0Queues08 $que.total $+ / $+ %total.queue $+ 11» «0Accessed08 %users.served time(s)11» «0Note08 %offer $+ 11» %name }
    }
    if (%fserve.adtype == Inv3) {
      if (%top.cps == $null) { set %top.cps n/a }
      if (%Ptop.cps == $null) { set %Ptop.cps n/a }
      if (%f.minc == on) && (%trig.type == /ctcp) { return 14[4File Server Online14][Trigger04 /ctcp $me %trigger $+ 14][Snagged04 $size(%sent2) in $findfile(%fserv.dir,*,*) files14][Min CPS04 %min.cps $+ 14][Record CPS04 %top.cps by %Ptop.cps $+ 14][Online04 $fserv(0) $+ / $+ %max.users $+ 14][Sends04 $send(0) $+ / $+ %total.sends $+ 14][Queues04 $que.total $+ / $+ %total.queue $+ 14][Accessed04 %users.served times $+ 14][Note04 %offer $+ 14] %name }
      if (%f.minc == off) && (%trig.type == /ctcp) { return 14[4File Server Online14][Trigger04 /ctcp $me %trigger $+ 14][Snagged04 $size(%sent2) in $findfile(%fserv.dir,*,*) files14][Record CPS04 %top.cps by %Ptop.cps $+ 14][Online04 $fserv(0) $+ / $+ %max.users $+ 14][Sends04 $send(0) $+ / $+ %total.sends $+ 14][Queues04 $que.total $+ / $+ %total.queue $+ 14][Accessed04 %users.served times $+ 14][Note04 %offer $+ 14] %name }
      if (%f.minc == on) && (%trig.type == !Trigger) { return 14[4File Server Online14][Trigger04 %trigger $+ 14][Snagged04 $size(%sent2) in $findfile(%fserv.dir,*,*) files14][Min CPS04 %min.cps $+ 14][Record CPS04 %top.cps by %Ptop.cps $+ 14][Online04 $fserv(0) $+ / $+ %max.users $+ 14][Sends04 $send(0) $+ / $+ %total.sends $+ 14][Queues04 $que.total $+ / $+ %total.queue $+ 14][Accessed04 %users.served times $+ 14][Note04 %offer $+ 14] %name }
      if (%f.minc == off) && (%trig.type == !Trigger) { return 14[4File Server Online14][Trigger04 %trigger $+ 14][Snagged04 $size(%sent2) in $findfile(%fserv.dir,*,*) files14][Record CPS04 %top.cps by %Ptop.cps $+ 14][Online04 $fserv(0) $+ / $+ %max.users $+ 14][Sends04 $send(0) $+ / $+ %total.sends $+ 14][Queues04 $que.total $+ / $+ %total.queue $+ 14][Accessed04 %users.served times $+ 14][Note04 %offer $+ 14] %name }
    }
    if (%fserve.adtype == Inv4) {
      if (%top.cps == $null) { set %top.cps n/a }
      if (%Ptop.cps == $null) { set %Ptop.cps n/a }
      if (%f.minc == on) && (%trig.type == /ctcp) { return 0,10[4File Server Online0][Trigger04 /ctcp $me %trigger $+ 0][Snagged04  $size(%sent2) $+ 0][Min CPS04 %min.cps $+ 0][Max CPS04 %top.cps by %Ptop.cps $+ 0][Online04 $fserv(0) $+ / $+ %max.users $+ 0][Sends04 $send(0) $+ / $+ %total.sends $+ 0][Queues04 $que.total $+ / $+ %total.queue $+ 0][Accessed04 %users.served times $+ 0][Note04 %offer $+ 0] %name }
      if (%f.minc == off) && (%trig.type == /ctcp) { return 0,10[4File Server Online0][Trigger04 /ctcp $me %trigger $+ 0][Snagged04  $size(%sent2) $+ 0][Max CPS04 %top.cps by %Ptop.cps $+ 0][Online04 $fserv(0) $+ / $+ %max.users $+ 0][Sends04 $send(0) $+ / $+ %total.sends $+ 0][Queues04 $que.total $+ / $+ %total.queue $+ 0][Accessed04 %users.served times $+ 0][Note04 %offer $+ 0] %name }
      if (%f.minc == on) && (%trig.type == !Trigger) { return 0,10[4File Server Online0][Trigger04 %trigger $+ 0][Snagged04  $size(%sent2) $+ 0][Min CPS04 %min.cps $+ 0][Max CPS04 %top.cps by %Ptop.cps $+ 0][Online04 $fserv(0) $+ / $+ %max.users $+ 0][Sends04 $send(0) $+ / $+ %total.sends $+ 0][Queues04 $que.total $+ / $+ %total.queue $+ 0][Accessed04 %users.served times $+ 0][Note04 %offer $+ 0] %name }
      if (%f.minc == off) && (%trig.type == !Trigger) { return 0,10[4File Server Online0][Trigger04 %trigger $+ 0][Snagged04  $size(%sent2) $+ 0][Max CPS04 %top.cps by %Ptop.cps $+ 0][Online04 $fserv(0) $+ / $+ %max.users $+ 0][Sends04 $send(0) $+ / $+ %total.sends $+ 0][Queues04 $que.total $+ / $+ %total.queue $+ 0][Accessed04 %users.served times $+ 0][Note04 %offer $+ 0] %name }
    }
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
