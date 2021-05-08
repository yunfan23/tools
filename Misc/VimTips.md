1. To quick add 50 # in a Single line using the command

   `50a#<esc>` In Command Mode

2. save and show the difference

   `:w !diff % -`
   - !cmd: shell command
   - %: current file name
   
3. In normal mode, typing Ctrl-A will increment the next number, and typing Ctrl-X will decrement the next number.

4. ctrl+w q or c is to close the current window

## vim-surround
- `ys$"` to add " from current position to end of line
- `yss)` to add ) for entire line
- Opening braces add extra spaces, but closing ones do not.