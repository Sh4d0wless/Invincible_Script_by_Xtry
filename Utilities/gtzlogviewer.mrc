;___________________________________________
; Invincible by Xtry
; Logs Viewer
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

alias logviews {
  :start
  set %logviews.window.h $window(-1).h
  set %logviews.window.w $window(-1).w
  if ($window(@logviews) == $null) {  
    window -l16 @logviews 200 200 630 200 @logviews Tahoma 11
    window -nls @logviews2 Tahoma 11
    aline -p @logviews %logviews.version $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Loading logs database. This procedure can take a long time depending on the amount of logs you have.
    aline @logviews %logviews.version $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) %name will temporarily be locked up during this time so please be patient.
    set %logviews.count 1
    :AddLog
    set %logviews.log $findfile(logs/,*.log,%logviews.count)
    if (%logviews.log == $null) goto end
    else {
      aline -l @logviews2 $nopath(%logviews.log)
      inc %logviews.count 1
      goto addlog
    }
  }
  else { window -c @logviews | goto start }
  :end
  set %logviews.lines $line(@logviews2,0,0)
  set %logviews.count 1
  :lineadd
  if (%logviews.count > %logviews.lines) goto end2
  else {
    aline -l @logviews $line(@logviews2,%logviews.count)
    inc %logviews.count 1
    goto lineadd
  }
  :end2
  if (%logviews.about == run) { logviews.about | set %logviews.about ran | goto end4 }
  :end3
  clear @logviews
  aline @logviews $cxs(3) $+  $+ %xsbrack $+ $cxs(1) %name  $+ $cxs(2) Logviewer
  aline -p @logviews $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Welcome to logviewer, to view a log please double click it in the side listbox.  Or else right click on a log in the listbox to access more commands.
  :end4
  iline -l @logviews 1 $cxs(1) $+ Current Logs $str($chr(160),175)
  iline -l @logviews 2 $cxs(3) $+ ––––––––––––––––––––––––
  window -c @logviews2
}

alias logrefresh {
  :start
  if ($window(@logviews) == $null) { logviews }
  else {
    clear -l @logviews
    window -nls @logviews2 Tahoma 11
    set %logviews.count 1
    :AddLog
    set %logviews.log $findfile(logs/,*.log,%logviews.count)
    if (%logviews.log == $null) goto end
    else {
      aline -l @logviews2 $nopath(%logviews.log)
      inc %logviews.count 1
    goto addlog }
  }
  :end
  set %logviews.lines $line(@logviews2,0,0)
  set %logviews.count 1
  :lineadd
  if (%logviews.count > %logviews.lines) goto end2
  else {
    aline -l @logviews $line(@logviews2,%logviews.count)
    inc %logviews.count 1
    goto lineadd
  }
  :end2
  iline -l @logviews 1 $cxs(1) $+ Current Logs $str($chr(160),30)
  iline -l @logviews 2 $cxs(3) $+ ––––––––––––––––––––––––
  window -c @logviews2
}

alias Logview {
  if ($sline(@logviews,1).ln == 1 || $sline(@logviews,1).ln == 2) { halt }
  else {
    set %logviews.file logs/ $+ $sline(@logviews,1)
    set %logviews.size $lof(%logviews.file)
    clear @logviews    
    iline @logviews 1 $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Viewing $+ $cxs(1) $sline(@logviews,1)
    iline @logviews 2 $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Size $+ $cxs(1) %logviews.size  $+ $cxs(2) $+ bytes $str($chr(160),175)
    titlebar @logviews - $sline(@logviews,1)
    loadbuf -p @logviews logs/ $+ $sline(@logviews,1)
    sline @logviews 15
  }
}

alias logview.newwindow {
  set %logviews.window @ [ $+ [ $sline(@logviews,1) ] ]
  set %logviews.file logs/ $+ $sline(@logviews,1)
  set %logviews.size $lof(%logviews.file)
  window %logviews.window @LogView Tahoma 11
  background -t @ [ $+ [ $sline(@logviews,1) ] ] graph/gtzlinechan.bmp
  iline @ [ $+ [ $sline(@logviews,1) ] ] 1 $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Viewing $+ $cxs(1) $sline(@logviews,1)
  iline @ [ $+ [ $sline(@logviews,1) ] ] 2 $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Size $+ $cxs(1) %logviews.size  $+ $cxs(2) $+ bytes $str($chr(160),175)
  loadbuf %logviews.window logs/ $+ $sline(@logviews,1)
  sline %logviews.window 15
}

menu @logviews {
  dclick loglist2
  View Log
  .In Window:logview $sline(@logviews,1)
  .In New Window:logview.newwindow $sline(@logviews,1)
  Search Log Text:logsearch
  -
  Delete Log:dellog $sline(@logviews,1)
  Copy Log:copylog
  Rename Log:remlog
  -
  Open Log In Notepad:lognotepad
  -
  Refresh List:logrefresh
  Close Window:window -c @logviews
}

alias LogList2 {
  if ($sline(@logviews,1).ln == 1 || $sline(@logviews,1).ln == 2 || $sline(@logviews,1).ln == $null) { halt }
  else logview $sline(@logviews,1)
}

menu @Logview {
  Search Log Text:logsearch.nw
  -
  Delete Log:/dellog $remove($active,@)
  Copy Log:/copylog
  -
  Open Log In Notepad:run notepad.exe logs/ $+ $remove($active,@)
  -
  Close Window:window -c $active
}

menu @Confirm.Delete {
  dclick Confirm.Delete
}

alias Confirm.Delete {
  if ($sline(@Confirm.Delete,1).ln == 1 || $sline(@Confirm.Delete,1).ln == 2) { halt }
  if ($sline(@Confirm.Delete,1).ln == 3) { .remove logs/ $+ %logviews.log.delete | window -c @Confirm.Delete | dline -l @logviews $sline(@logviews,1).ln | echo $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Succesfully deleted $+ $cxs(1) %logviews.log.delete }
  if ($sline(@Confirm.Delete,1).ln == 4) { window -c @Confirm.Delete }
}

alias copylog {
  if ($sline(@logviews,1).ln == 1 || $sline(@logviews,1).ln == 2 || $sline(@logviews,1).ln == $null) { halt }
  /copy logs/ $+ $sline(@logviews,1) $sdir="Select A Directory To Copy $sline(@logviews,1) To:" $+ $sline(@logviews,1)
}

alias remlog {
  if ($sline(@logviews,1).ln == 1 || $sline(@logviews,1).ln == 2 || $sline(@logviews,1).ln == $null) { halt }
  else {
    rename logs/ $+ $sline(@logviews,1) logs/ $+ $?="Please enter a new filename :" | logrefresh
  }
}

alias dellog {
  if ($sline(@logviews,1).ln == 1 || $sline(@logviews,1).ln == 2 || $sline(@logviews,1).ln == $null) { halt } 
  else {
    set %logviews.log.delete $sline(@logviews,1)
    window -l+bt @Confirm.Delete 20 20 150 111 @Confirm.Delete Tahoma 11
    aline @Confirm.Delete $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Are you sure you want to delete $+ $cxs(1) $sline(@logviews,1)  $+ $cxs(2) $+ ? $str($chr(160),50)
    aline @Confirm.Delete $cxs(3) $+  –––––––––––––––––––––––– $str($chr(160),10)
    aline @Confirm.Delete $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) YES $str($chr(160),50)
    aline @Confirm.Delete $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) NO $str($chr(160),50)
  }
}

alias dellog2 {
  set %logviews.log.delete $remove($active,@)
  window -l+bt @Confirm.Delete 20 20 150 111 @Confirm.Delete Tahoma 11
  aline @Confirm.Delete %name Log Viewer
  aline @Confirm.Delete $cxs(3) $+  –––––––––––––––––––––––– $str($chr(160),10)
  aline @Confirm.Delete $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Are you sure you want $str($chr(160),10)
  aline @Confirm.Delete $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) to delete: $str($chr(160),50)
  aline @Confirm.Delete $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) $sline(@logviews,1) $+ ? $str($chr(160),100)
  aline @Confirm.Delete $cxs(3) $+ –––––––––––––––––––––––– $str($chr(160),10)
  aline @Confirm.Delete $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) YES $str($chr(160),50)
  aline @Confirm.Delete $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) NO $str($chr(160),50)
}

menu @Confirm.Delete2 {
  dclick Confirm.Delete2
}

alias Confirm.Delete2 {
  if ($sline(@Confirm.Delete,1).ln == 1 || $sline(@Confirm.Delete,1).ln == 3 || $sline(@Confirm.Delete,1).ln == 4 || $sline(@Confirm.Delete,1).ln == 4) { halt }
  if ($sline(@Confirm.Delete,1).ln == 3) { .remove logs/ $+ %logviews.log.delete | window -c @Confirm.Delete | logrefresh | echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Succesfully deleted $+ $cxs(1) %logviews.log.delete }
  if ($sline(@Confirm.Delete,1).ln == 4) { window -c @Confirm.Delete }
}

alias lognotepad {
  if ($sline(@logviews,1).ln == 1 || $sline(@logviews,1).ln == 2 || $sline(@logviews,1).ln == $null) { halt }
  else run notepad.exe logs/ $+ $sline(@logviews,1)
}

alias logsearch {
  if ($window(@logviews).title == - $sline(@logviews,1)) goto next
  else { logview $sline(@logviews,1) | goto next }
  :next
  if ($window(@LogSearch) != $null) /window -c @LogSearch
  window @LogSearch @LogSearch Tahoma 11
  set %logviews.file logs/ $+ $sline(@logviews,1)
  titlebar @LogSearch - $sline(@logviews,1) 
  set %logviews.searchstring * [ $+ [ $?="Enter Text To Search For:" ] $+ ] *
  aline @LogSearch $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Log Searcher
  aline @LogSearch $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Searching for $+ $cxs(1) %logviews.searchstring 
  filter -fwn %logviews.file @LogSearch %logviews.searchstring
}

menu @LogSearch {
  dclick logsearch2
  Goto Line:logsearch2
  -
  Close Window:window -c @LogSearch
  About:window -a @logviews | logviews.about
} 

alias logsearch2 {
  if ($sline(@LogSearch,1).ln == 1 || $sline(@LogLogSearch,1).ln == 2 || $sline(@LogSearch,1).ln == $null) { halt }
  else {
    sline @logviews $calc($gettok($sline(@LogSearch,1),1,32) + 10)
    window -a @logviews
  }
}

alias logsearch.nw {
  set %logviews.window $remove($active,@)
  if ($window(@LogSearch) != $null) window -c @LogSearch
  window -l @LogSearch @LogSearch.nw Tahoma 11
  set %logviews.file logs/ $+ %logviews.window
  titlebar @LogSearch - %logviews.window
  set %logviews.searchstring * [ $+ [ $?="Enter Text To Search For:" ] $+ ] *
  aline @LogSearch $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Searching For $+ $cxs(1) %logviews.searchstring  $str($chr(160),500)
  filter -fwn %logviews.file @LogSearch %logviews.searchstring
}

menu @LogSearch.nw {
  dclick:logsearchnw
  Goto Line:logsearchnw
  -
  Close Window:window -c @LogSearch
} 

alias logsearchnw {
  set %logviews.window2 @ $+ %logviews.window
  if ($sline(@LogSearch,1).ln == 1 || $sline(@LogLogSearch,1).ln == 2 || $sline(@LogSearch,1).ln == $null) { halt }
  else {
    sline %logviews.window2 $calc($gettok($sline(@LogSearch,1),1,32) + 10)
    window -a %logviews.window2
  }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
