;___________________________________________
; Invincible by Xtry
; Run Programs
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias rprog { if ($dialog(rprog)) dialog -v rprog | else dialog -m rprog rprog }
dialog rprog {
  title "Run Programs"
  icon graph/rprog.ico
  size -1 -1 127 188
  option dbu
  button Close,1,5 169 116 15,cancel
  box "",2,-2 0 150 165
  box "",25,-2 1 150 163
  tab "Accessories",3,5 7 116 150
  icon 4,20 30 17 17,graph/notpadx.ico, tab 3
  button "Notepad",5,47 30 50 15,tab 3 ok
  icon 6,20 55 17 17,graph/wordpadx.ico, tab 3
  button "Wordpad",7,47 55 50 15,tab 3 ok
  icon 8,20 80 17 17,graph/calcx.ico, tab 3
  button "Calculator",9,47 80 50 15,tab 3 ok
  icon 10,20 105 17 17,graph/pbrushx.ico, tab 3
  button "Paintbrush",11,47 105 50 15,tab 3 ok
  icon 12,20 130 17 17,graph/imagingx.ico, tab 3
  button "Imaging",13,47 130 50 15,tab 3 ok
  tab "Entertainment",14,5 7 88 150
  icon 15,20 30 17 17,graph/cdplayx.ico, tab 14
  button "Media Player",16,47 30 50 15,tab 14 ok
  icon 17,20 55 17 17,graph/cdplay2x.ico, tab 14
  button "CD Player",18,47 55 50 15,tab 14 ok
  icon 19,20 80 17 17,graph/srecx.ico, tab 14
  button "Sound Recorder",20,47 80 50 15,tab 14 ok
  icon 21,20 105 17 17,graph/mixx.ico, tab 14
  button "Volume Control",22,47 105 50 15,tab 14 ok
  icon 23,20 130 17 17,graph/movmakx.ico, tab 14
  button "Movie Maker",24,47 130 50 15,tab 14 ok
  tab "Others",26,5 7 88 150
  icon 27,20 30 17 17,graph/tnetx.ico, tab 26
  button "Telnet",28,47 30 50 15,tab 26 ok
  icon 29,20 55 17 17,graph/addrbookx.ico, tab 26
  button "Address Book",30,47 55 50 15,tab 26 ok
  icon 31,20 80 17 17,graph/outx.ico, tab 26
  button "Outlook Express",32,47 80 50 15,tab 26 ok
  icon 33,20 105 17 17,graph/winzx.ico, tab 26
  button "Winzip",34,47 105 50 15,tab 26 ok
  icon 35,20 130 17 17,graph/msdx.ico, tab 26
  button "MS Dos",36,47 130 50 15,tab 26 ok
}
on *:dialog:rprog:init:*:{ 
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 3,5,9,11,13,14,16,18,20,22,24,26,28,30,32,34,36,1,7 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 3,5,9,11,13,14,16,18,20,22,24,26,28,30,32,34,36,1,7 clientedge
}
on *:dialog:rprog:sclick:5:{ run notepad }
on *:dialog:rprog:sclick:7:{ run wordpad }
on *:dialog:rprog:sclick:9:{ run calc }
on *:dialog:rprog:sclick:11:{ run mspaint }
on *:dialog:rprog:sclick:13:{ run kodakimg }
on *:dialog:rprog:sclick:16:{ run mplayer2 }
on *:dialog:rprog:sclick:18:{ run cdplayer }
on *:dialog:rprog:sclick:20:{ run sndrec32 }
on *:dialog:rprog:sclick:22:{ run sndvol32 }
on *:dialog:rprog:sclick:24:{ run moviemk }
on *:dialog:rprog:sclick:28:{ run telnet }
on *:dialog:rprog:sclick:30:{ run wab }
on *:dialog:rprog:sclick:32:{ run msimn }
on *:dialog:rprog:sclick:34:{ run winzip32 }
on *:dialog:rprog:sclick:36:{ run dosprmpt }

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
