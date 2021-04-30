## Setup profile in Windows Terminal
- open settings.json file
- copy the profile setting from existing profile
- use command below to generate guid (globally unique identifier) and change the guid
  - `uuidgen` in linux terminal or
  - `[guid]::NewGuid()` in powershell
- change commandLine to
  - `ssh username@host` or
  - `ssh -t username@hostname \"cd path && exec bash -l\""`

## The following block is the template of a profile
```
{
    "bellStyle": "none",
    "commandline": "ssh yunfan@ntu-02",
    "cursorShape": "filledBox",
    "fontFace": "DejaVu Sans Mono",
    "fontSize": 13,
    "guid": "{3b47f78e-99a6-4c33-9719-f11ea83feb44}",
    "hidden": false,
    "icon": "C:\\Users\\Yunfan\\Documents\\github\\alicloud.png",
    "name": "ntu-02",
    "scrollbarState": "hidden",
    "suppressApplicationTitle": true
}
```
