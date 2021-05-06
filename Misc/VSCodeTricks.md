1. Toggle Terminal Max view and Normal view

```json
{

    "key": "ctrl+alt+q",

    "command": "workbench.action.toggleMaximizedPanel",

    // "command": "workbench.action.toggleEditorVisibility"  either one

    "when": "!terminalFocus"

},
```

2. Personal VSCode Settings

   [settings](settings.json)

   [keybindings](keybindings.json)

3. Navigation

   ^+-` and `^+Shift+-` to navigation forward and backward

## VSCode-vim settings
``` json
    // vim settings
    // enable vim surround
    "vim.surround": true,
    "vim.easymotion": true,
    "vim.incsearch": true,
    "vim.hlsearch": true,
    // prevent j/k open fold
    "vim.foldfix": true,
    // enable the system clip board
    "vim.useSystemClipboard": true,
    "vim.useCtrlKeys": true,
    "vim.insertModeKeyBindings": [
        {
        "before": ["j", "j"],
        "after": ["<Esc>"]
        }
    ],
    "vim.normalModeKeyBindingsNonRecursive": [
        {
            "before": [
                "<leader>",
                "d"
            ],
            "after": [
                "d",
                "d"
            ]
        }
    ],

    // do not over-write the dfault settings
    "vim.handleKeys": {
        "<C-w>": false, // close windows
        "<C-t>": false, // goto symbol
        "<C-r>": false, // recently open
        "<C-n>": false, // new file
        "<C-b>": false, // toggle explorer
        "<C-k>": false, // system key prefix
        "<C-c>": false, // copy
        "<C-v>": false  // paste
    }
```