;___________________________________________
; Invincible by Xtry
; Invite Notifier
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

on *:Load:{
  if ($version < 5.90) { if ($input(Invite Notify requires mIRC v5.90 and up! You are using mIRC v $+ $version $+ ! Please download the latest version of mIRC then install Invite Notify! ,4,Invite Notify)) { .unload -rs " $+ $script $+ " } }
  elseif ($gettok($readini($mircini,options,n3),11,44) == 1) { if ($input(Invite Notify has detected you have 'Auto-join channel on invite' enabled! This option must be disabled in order to use Invite Notify. Please disable this option in mIRC's options dialog then reload Invite Notify...,4,Invite Notify)) { .unload -rs " $+ $script $+ " } }
  else { if ($input(Invite Notifier was loaded successfully!,4,Invite Notify)) { return } }
}

#INVD on
on ^*:INVITE:*:{
  if ($gettok($readini($mircini,options,n3),11,44) == 1) { halt } 
  elseif ((!$dialog(Invite)) && (!$away)) { set %Invite.Nick $nick | set %Invite.Chan $chan | .timer 1 0 Inv.Dlg | haltdef }
  elseif (($dialog(Invite)) || ($away)) { haltdef }
}
#INVD end

Alias -l Inv.Dlg { $dialog(Invite,Invite) }
dialog Invite {
  title "Invite Request"
  icon graph/warn.ico
  size -1 -1 140 76
  option dbu
  button "", 1, 0 0 0 0, cancel
  button "", 2, 97 58 38 12, default
  button "&Accept", 3, 56 58 38 12
  check "&Ignore user", 4, 6 50 38 8
  text "", 5, 5 6 129 15, group
  text "Choose to accept or reject the invitation by using the buttons below.  You may also choose to ignore future invitations and messages from this user.", 6, 5 24 129 21, group
}

Alias -l Clean.Vars { 
  if (%Invite.Nick) { unset %Invite.Nick }
  if (%Invite.Chan) { unset %Invite.Chan }
}

on *:DIALOG:Invite:init:*:{ 
  if ((%Invite.Nick) && (%Invite.Chan)) { did -a $dname 2 &Reject | did -a $dname 5 %Invite.Nick Invites you to %Invite.Chan }
  else { did -a $dname 2 &Close | did -a $dname 5 :) | did -b $dname 3,4 | did -r $dname 6 }
}

on *:DIALOG:Invite:sclick:1:{ Clean.Vars }
on *:DIALOG:Invite:sclick:2:{ 
  if ($did(4).state == 1) { .ignore %Invite.Nick 3 | dialog -x $dname }
  elseif ($did(4).state == 0) { dialog -x $dname }
  else { dialog -x $dname }  
  Clean.Vars
}

on *:DIALOG:Invite:sclick:3:{ join %Invite.Chan | Clean.Vars | dialog -x $dname }
on *:DIALOG:Invite:sclick:4:{ if ($did(4).state == 1) { did -b $dname 3 }
  else { did -e $dname 3 }
}

;___________________________________________________________________________
; Copyright © 2000 - 2003 logos,scripts & codes. All rights reserved
; Reproduction/distribution/alteration of this material in part or in full without prior consent is forbidden
; Script author: Xtry on dalnet.
; mailto: InvincibleScript@yahoo.com
;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
