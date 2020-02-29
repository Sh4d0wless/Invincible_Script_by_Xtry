;___________________________________________
; Invincible by Xtry
; Server Connector
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

dialog connect {
  title "Server Connector"
  icon graph\connector2.ico
  size -1 -1 232 255
  button "Close",7, 170 225 50 20, cancel default
  box "",51,166 215 58 34
  text "Server :", 8, 15 20 80 20
  list 2, 15 55 200 100, sort vsbar
  edit "", 3, 15 35 200 20, autohs 
  box "",1, 6 3 219 212
  button "Add",4, 15 152 50 20
  button "Remove",5, 65 152 50 20
  button "Clear",22, 165 152 50 20
  button "Connect",6, 80 180 70 25
  box "",50,76 170 78 39
  button "Change",99, 115 152 50 20
}
on 1:dialog:connect:init:*: {
  dll dll/mdx.dll SetMircVersion $version
  dll dll/mdx.dll MarkDialog $dname
  dll dll/mdx.dll SetFont 7,8,2,3,4,5,22,6,99 13 14 Tahoma 
  dll dll/mdx.dll SetBorderStyle $dname 4,5,22,6,99,7 clientedge
  set %servercount 0
  :loopster
  inc %servercount 1
  if (%server [ $+ [ %servercount ] ] == $null) { goto loop2 }
  if (%server [ $+ [ %servercount ] ] != $null) { did -a connect 2 %server [ $+ [ %servercount ] ] }
  goto loopster
  :loop2
  did -f connect 3
}
on 1:dialog:connect:sclick:*: {
  if ($did == 4) {
    if ($did(3)) { did -a connect 2 $ifmatch | did -r $dname 3 } 
    else { dialog -m error1 error1 } 
  } 
  if ($did == 2) { 
    did -ra $dname 3 $did(connect,2,$did(connect,2).sel).text 
  }
  if ($did == 22) { unset %server* | did -r connect 2 }
  if ($did == 5) { 
    if ($did(2,$did(2).sel).text) { did -d connect 2 $did(2).sel } 
    else { dialog -m error2 error2 } 
  }
  if ($did == 99) { 
    did -d connect 2 $did(2).sel
    unset %server [ $+ [ $did($dname,2).sel ] ] 
    set %server [ $+ [ $did($dname,2).sel ] ] $did(3).text
    did -a connect 2 $did(3).text | did -r $dname 3 
  }
  if ($did == 6) { 
    if ($did(2,$did(2).sel).text) { 
    .set %temp.server $did(2,$did(2).sel).text | .server %temp.server } 
    else { dialog -m error2 error2 } 
  }
  if ($did == 7) {
    set %server1 $did(connect,2,1)
    set %server2 $did(connect,2,2)
    set %server3 $did(connect,2,3)
    set %server4 $did(connect,2,4)
    set %server5 $did(connect,2,5)
    set %server6 $did(connect,2,6)
    set %server7 $did(connect,2,7)
    set %server8 $did(connect,2,8)
    set %server9 $did(connect,2,9)
    set %server10 $did(connect,2,10)
    set %server11 $did(connect,2,11)
    set %server12 $did(connect,2,12)
    set %server13 $did(connect,2,13)
    set %server14 $did(connect,2,14)
    set %server15 $did(connect,2,15)
    set %server16 $did(connect,2,16)
    set %server17 $did(connect,2,17)
    set %server18 $did(connect,2,18)
    set %server19 $did(connect,2,19)
    set %server20 $did(connect,2,20)
  }
}
alias connect2 {
  if ($dialog(connect) == $null) { 
    dialog -mn connect connect 
  }
  else { 
    dialog -c connect connect
  }
}
dialog error1 {
  size -1 -1 201 60
  icon graph\connector2.ico
  title "Error"
  icon graph\connector.ico
  button "Ok",1, 75 30 55 20, OK
  text "You must type in a server first",2, 30 10 150 20
}
dialog error2 {
  size -1 -1 201 60
  title "Error"
  icon graph\connector2.ico
  button "Ok",1, 75 30 55 20, OK
  text "You must select a server in the list first",2, 10 10 190 20
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
