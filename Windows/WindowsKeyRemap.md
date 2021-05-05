# Map CapsLock + hjkl to arrow keys

1. Download AutoHotKey from 

[AutoHotkey](https://www.autohotkey.com/)

2. Create a remapkey.ahk file and copy the following script into the file

   ```
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
   ```

   

3. right-click to compile the script to exe file, and click the exe to execute

4. put the exe file into system startup folder

   C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp

# Toggle Windows always on-top

`^+1::  Winset, Alwaysontop, , A`

put the above command into the *ahk file

# Quick Open Start-up folder

1. Win+R launch Run dialog

2. Keyin the command and press enter

   `shell:startup`

3. copy application or shortcut into the folder

### Assign hotkey to windows terminal launch
``` 

^+1::  Winset, Alwaysontop, , A

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

; Hotkey to use Ctrl+Shift+T to launch/restore the Windows Terminal.
^+t::SwitchToWindowsTerminal()
```