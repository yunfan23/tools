# Installing tmux-256color for macOS

1. /usr/bin/tic
2. curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
3. /usr/bin/tic -xe tmux-256color terminfo.src

or sudo /usr/bin/tic -xe tmux-256color terminfo.src

1. infocmp -x tmux-256color
2. set-option default-terminal "tmux-256color"
3. tmux info | grep -e RGB -e Tc
4. set-option -a terminal-overrides ",*256col*:RGB"

In zshrc:

```
if [[ $TMUX != ""]] then
	export TERM="tmux-256color"
else
	export TERM="xterm-256color"
fi
```

In tmux:

```bash
set -g default-terminal "tmux-256color"
set-option -a terminal-overrides ",*256col*:RGB"
```

# TMUX Settings

C_b, C_o swap panel

tmux kill-server to kill all tmux sessions

12 Mar 2021

1. How to change windows order?

a. Ctrl+B, : to invoke command line

b. swap-window -t 0 to move current window to top

c. swap-window -s 3 -t 1 to swap window 3 with 1

15 Mar 2021

How to

for tmux versions <2.5

bind -t vi-copy y copy-pipe 'xclip -in -selection clipboard'

for tmux versions > 2.5

bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

Then hit Ctrl+b [ to enter copy mode. Then hit Space followed by whatever vi movement keys to make a selection. Then, instead of hitting Enter, hit y and the selection will be copied to the clipboard.

For OSX, replace xclip with pbcopy. For Cygwin on Windows, replace it with putclip (from the cygutils-extra package).