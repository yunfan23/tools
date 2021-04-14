# Map CapsLock + hjkl to arrow keys

1. Download AutoHotKey from 

[AutoHotkey](https://www.autohotkey.com/)

2. Create a remapkey.ahk file and copy the following script into the file

   `CapsLock & h::`
   `Send {Left}`
   `return`

   `CapsLock & j::`
   `Send {Right}`
   `return`

   `CapsLock & k::`
   `Send {Up}` 
   `return`

   `CapsLock & l::`
   `Send {Down}` 
   `return`

3. right-click to compile the script to exe file, and click the exe to execute

4. put the exe file into system startup folder

   C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp