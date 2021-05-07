;; disabe CapsLock
;; SetCapsLockState, alwaysoff

CapsLock & h::
Send {Left}
return

CapsLock & l::
Send {Right} 
return

CapsLock & k::
Send {Up}
return

CapsLock & j::
Send {Down}
return

CapsLock & c::
Send ^{c}
return

CapsLock & v::
Send ^{v}
return

CapsLock & x::
Send ^{x}
return

CapsLock & s::
Send ^{s}
return

;; Always on top setting
^+1::  Winset, Alwaysontop, , A
CapsLock & a:: Winset, Alwaysontop, , A

SwitchToWindowsTerminal()
{
  windowHandleId := WinExist("ahk_exe WindowsTerminal.exe")
  windowExistsAlready := windowHandleId > 0

  ; If the Windows Terminal is already open, determine if we should put it in focus or minimize it.
  if (windowExistsAlready = true)
  {
    activeWindowHandleId := WinExist("A")
    windowIsAlreadyActive := activeWindowHandleId == windowHandleId

    if (windowIsAlreadyActive)
    {
      ; Minimize the window.
      WinMinimize, "ahk_id %windowHandleId%"
    }
    else
    {
      ; Put the window in focus.
      WinActivate, "ahk_id %windowHandleId%"
      WinShow, "ahk_id %windowHandleId%"
    }
  }
  ; Else it's not already open, so launch it.
  else
  {
    Run, *RunAs wt
  }
}

; Hotkey to use Hyper+R to launch/restore the Windows Terminal.
CapsLock & r::SwitchToWindowsTerminal()

