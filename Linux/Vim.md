G# Installation

**Linux (x64)**

1. Download **nvim.appimage**

2. Run

   ```
   chmod u+x nvim.appimage && ./nvim.appimage
   ```

   - If your system does not have FUSE you can [extract the appimage](https://github.com/AppImage/AppImageKit/wiki/FUSE#type-2-appimage):

     ```bash
     ./nvim.appimage --appimage-extract
     ./squashfs-root/usr/bin/nvim
     ```

# Settings

1. Convert tab to space when editing, set the following settings. The expandtab converts tab into spaces set by tabstop and shiftwidth

   set tabstop=4 shiftwidth=4 expandtab

2. For existing file with tabs, set setting one first and use

:retab

1. :set cmdheight=1 to set command status bar to height 1


# Fix
- startify: Can't read viminfo file. Read :help startify-faq-02
  - remove ~/.viminfo file to solve the problem


## move to first none space char
^ to move to current line \
\- to move to previous line \
\+ to move to next line


vimscript A function name must start with an uppercase letter

强制创建一个全局函数（使用感叹号）

```
g:var - 全局
a:var - 函数参数
l:var - 函数局部变量
b:var - buffer 局部变量
w:var - window 局部变量
t:var - tab 局部变量
s:var - 当前脚本内可见的局部变量
v:var - Vim 预定义的内部变量
```

使用 function 关键字定义一个函数，使用 function! 覆盖一个函数的定义，函数和变量一样也有作用范围的约束。需要注意函数名必须以大写字母开头。

call <function> 调用一个函数，函数调用前的 call 语句是必须的，除非在一个表达式里

a:0 用来表示 ... 部分共有多少参数。

The main reason to use augroups is to allow greater control over ranges of autocommands, e.g. to delete a bunch of autocommands in one go. A common pattern is to use the au! as the first part of a group. This removes all existing autocommands in the group, and allows one to start afresh. If you did not use a group, then au! would remove all/many autocommands that you did not want to remove.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c3e97b66-2919-482b-9f60-db2f12a720b1/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c3e97b66-2919-482b-9f60-db2f12a720b1/Untitled.png)

set-option -g focus-events on

ctrl+b ? to list all keybinding in tmux

set is the alias of set-option

bind is an alias for "bind-key", bin work well too

set-window-option (alias setw )

`. will take you to the last change you made.

:map <c-l> check mapping

[Untitled](https://www.notion.so/9f8ebfd4f7284354bdb58b1aac632205)

wget [https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb](https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb)

sudo dpkg -i <filename>.deb

sudo apt-get autoremove

sudo apt-get purge package-name

rg ripgrep

fd -e extension to find extensions

fd -H/—hidden to find the hidden files

-I (or --no-ignore)

-E (or --exclude)

The -x/--exec option runs an external command for each of the search results (in parallel).

The -X/--exec-batch option launches the external command once, with all search results as arguments.

{} is a placeholder for the search result. {.} is the same, without the file extension

LSB Linux Standard Base

ripgrep will respect your .gitignore and automatically skip hidden files/directories and binary files.

vi -o `fzf`vim $(fzf)

vim $(fzf)

vim + ctrl+T

alt+c

### **Installing plugins**

1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
2. Press `prefix` +  (capital i, as in **I**nstall) to fetch the plugin.

    I

    `prefix` + U

    - updates plugin(s)

    `prefix` + alt + u

    - remove/uninstall plugins not on the plugin list

git clone [https://github.com/tmux/tmux.git](https://github.com/tmux/tmux.git)
418  cd tmux/
419  lr
420  sh [autogen.sh](http://autogen.sh/)
421  ./configure
422  apt install libevent
423  apt install libevent-dev
424  ./configure
425  apt install curses
426  ./config
427  ./configure
428  make && make install
429  which bison
430  which yacc
431  apt install yacc
432  apt-get install byacc -y
433  apt-get install bison -y
434  make && make install
435  which tmux

chsh -s $(which zsh)

cc - quick change a whole line

cis for a sentence

caw change word including enclose

ciw change a word

set exrc

set secure

allow project directory specific in vimrc

set gbd

set disassebly-flavor intel

set print pretty on

tui enable (test user interface)

frame and trace in debugger

info layout

b f

delete

r(estart) / run

s 

n

- advanced & extra
    - clang formatter - stop arguing about code formatting rules
        - [https://clang.llvm.org/docs/ClangFormat.html](https://clang.llvm.org/docs/ClangFormat.html)
        - vim plugin: [https://github.com/rhysd/vim-clang-format](https://github.com/rhysd/vim-clang-format)
    - google test - [https://github.com/google/googletest](https://github.com/google/googletest) - unit testing for c++
    - google benchmark - [https://github.com/google/benchmark](https://github.com/google/benchmark) - a micro benchmarking library
    - clang sanitizers
        - example: [https://clang.llvm.org/docs/MemorySanitizer.html](https://clang.llvm.org/docs/MemorySanitizer.html)
        - need to build libc++ and clang from source [https://github.com/llvm/llvm-project](https://github.com/llvm/llvm-project)
            - they have a nice CMake build, its not that bad
        - need to link to libc++ as std library, load appropriate headers for std library
        - more instructions here: [https://github.com/google/sanitizers/wiki/MemorySanitizerLibcxxHowTo1](https://github.com/google/sanitizers/wiki/MemorySanitizerLibcxxHowTo1)
        - DONT RUN SCRIPTS FROM HERE, but you can examine! [https://github.com/jmoyers/dotfiles](https://github.com/jmoyers/dotfiles)

    set makeprg=g++\ \-Wall\ -Werror\ -Wpedantic\ -std=c++17\ -g\ -o\ build/%<\ %

    .gdbinit

    If your system sets $XDG_CONFIG_HOME, use that instead of ~/.config

    Neovim looks for an .nvimrc , vim looks for a .vimrc or .exrc files.

    `exrc` allows loading local **ex**ecuting local **rc** files.

    `secure` disallows the use of :autocmd, shell and write commands in local `.vimrc` files.

    make -j 16 : run program with 16 cores

    pudb

     hit "t" to run to the line under the cursor

    ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/621c9b9a-4002-437b-9fd2-25919cea1b5e/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/621c9b9a-4002-437b-9fd2-25919cea1b5e/Untitled.png)

    set rtp? check runtimepath 

    :retab

    setlocal colorcolumn=80

    :set list!

    runtimepath

    1. home .vim
    2. sysadmin folder
    3. $vimruntime
    4. sysadmin after folder
    5. user home after folder

    ** expand child directory recursively

    set path=.,**

    setlocal wildignore=*.pyc,*/__pycache__/*

    set include?

    include=^\s*#\s*include

    set includeexpr?

    :checkpath to check all included files are found or not?

    \zs backforward matching

    tags

    complier

    makeprg

    cn/cp navigate to the error msg

    $HOME/.tags

    ```python
    --langdef=Go
    --langmap=Go:.go
    --regex-Go=/func([ \t]+\([^)]+\))?[ \t]+([a-zA-Z0-9_]+)/\2/d,func/
    --regex-Go=/var[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,var/
    --regex-Go=/type[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,type/
    --regex-Go=/const[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,const/
    ```

    ```python
    let current_compiler = ‘go’
    CompilerSet makeprg=go\ build\ ./…
    CompilerSet errorformat=%E%f:%l:%c:%m
    compiler go
    nnoremap <buffer> <space> :silent make <bar> redraw!<CR>
    ```

    by pressing and holding ALT , followed by a number (1 through 9

    apt-get install silversearcher-aga

    apt-get install ack-grep

    ftplugin file type plugin

    language specific plugin

    call s:source_file('general.vim')

    ## Ctags

    ```
    $ git clone https://github.com/universal-ctags/ctags.git
    $ cd ctags
    $ ./autogen.sh
    $ ./configure --prefix=/where/you/want # defaults to /usr/local
    $ make
    $ make install # may require extra privileges depending on where to install
    ```

    ```
    $ sudo apt install \
        gcc make \
        pkg-config autoconf automake \
        python3-docutils \
        libseccomp-dev \
        libjansson-dev \
        libyaml-dev \
        libxml2-dev
    ```

    c+k/j to jump between errors

    ```
      <Plug>(ale_previous) - ALEPrevious
      <Plug>(ale_previous_wrap) - ALEPreviousWrap
      <Plug>(ale_previous_error) - ALEPrevious -error
      <Plug>(ale_previous_wrap_error) - ALEPrevious -wrap -error
      <Plug>(ale_previous_warning) - ALEPrevious -warning
      <Plug>(ale_previous_wrap_warning) - ALEPrevious -wrap -warning
      <Plug>(ale_next) - ALENext
      <Plug>(ale_next_wrap) - ALENextWrap
      <Plug>(ale_next_error) - ALENext -error
      <Plug>(ale_next_wrap_error) - ALENext -wrap -error
      <Plug>(ale_next_warning) - ALENext -warning
      <Plug>(ale_next_wrap_warning) - ALENext -wrap -warning
    ```

    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)

    To let Vim know which linter to use, the 'makeprg' and 'errorformat' options can be set

    :command to list all commands available

    :map to list all key mappings

    - `` indicates that it is not remappable (i.e. it is not a recursive mapping, see `know when to use nore` later in this answer)
    - `&` indicates that only script-local mappings are remappable
    - `@` indicates a buffer-local mapping

    To uninstall an extension, type ":CocList extensions" and then press TAB key and there it will prompt you to choose "u" and uninstall the extension you selected

    CocList extensions

    - `?` means invalid extension
    - `` means extension is activated
    - `+` means extension is loaded
    - `` means extension is disabled
    - Contrary to the hard reset, the soft reset won’t alter the working directory and the index.
    - 

    **The “–hard” option is used in order to reset the files of the index (or the staging area) and of the working directory.**

    Using “–hard”, you will be left with the untracked files of your working directory.

    open vim without rc files

    vim —clean / "-u DEFAULTS -U NONE -i NONE":

    ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8c0cf7e5-8488-48c0-8225-498c13c32225/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8c0cf7e5-8488-48c0-8225-498c13c32225/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/19fa0f9e-0dee-4c8a-b14d-20f3dc097842/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/19fa0f9e-0dee-4c8a-b14d-20f3dc097842/Untitled.png)

ctrl+w gf open a file in a new tab

<c-w>f	open in a new window (Ctrl-w f)

On Windows, the default `'isfname'` includes a colon. If you do not use drive letters to identify files, you could remove the colon with the command:

```
set isfname-=:

```

The following commands open the file with the cursor on the specified line number:

[Untitled](https://www.notion.so/0e2a2850005d4cb4b6c1cbbce5b7396c)

linter

pylinter pyright ale, coc flake8 autopep, yapf synthestic

disableDiagnostics

display coc through ale: ALE: `displayByAle`

+ "python.linting.enabled": false,

vs python.linting.pylintEnabled

set showtabline=2 always show a tab

xyz1 == xyz1[()] returns true

brew reinstall font-hack-nerd-font

, and ; are used to navigate through find and t command

<leader>bd to quickly delete the current buffer without closing windows

Load a session in the usual manner: vim -S

```
r       Automatically insert the current comment leader after hitting
        <Enter> in Insert mode.
c       Auto-wrap comments using textwidth, inserting the current comment
        leader automatically.
o       Automatically insert the current comment leader after hitting 'o' or
        'O' in Normal mode.
```

```
:set formatoptions-=r formatoptions-=c formatoptions-=o

```

Note that using `:set formatoptions-=cro` won't work as expected (since it's a string, it will look for the string `cro`, in that order, which often won't work.).

Add this in your vimrc:

```
au BufEnter * set fo-=c fo-=r fo-=o

```

Using `FileType` won't work since other plugins set `formatoption`.

in init.vim:

```
" always show the signcolumn
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
" remove the color from the signColumn
autocmd BufRead,BufNewFile * highlight clear SignColumn

```

And in coc-settings.json:

```
 "diagnostic.hintSign": ""
```

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

ctrl-wp is actually documented as go to the preview window

The ~/.vim/after/ directory is a bit of a hack. Files in this directory will be loaded every time Vim starts, but after the files in ~/.vim/plugin/.

use the += form of set to split the definition across multiple lines, and add a comment on each line to document what each piece does.

ctrl+o in insert mode to temporarily enter normal mode

## Insert mode

ctrl + j - change line

ctrl + u - delete the whole line forward

ctrl + w - delete a word forward

ctrl + r - There’s even a shortcut for putting text from a register: CTRL-r {reg}

## Sessions

You want something like

```
:mksession ~/mysession.vim

```

Then later you can source that vim file and you'll have your old session back:

```
:source ~/mysession.vim

```

or open vim with the -S option:

```
$ vim -S ~/mysession.vim
```

:mks[ession][!] [file]

ssop = sessionoptions

using ":mksession!". This overwrites the previous session.

:wall write all

See sesdir and curdir in :help 'sessionoptions'. I prefer sesdir myself.

ssop = sessionoptions

change sort by pressing s in the Tagbar window

Telescope

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b7be5638-af90-4184-a2a3-5ca3a4d6cc45/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b7be5638-af90-4184-a2a3-5ca3a4d6cc45/Untitled.png)

tmux a - for short

```
This form of the |:lua| command is mainly useful for includingLua code
in Vim scripts.
```

vic/vis to select within a class or vac/vas to select the class

vif to select the function, vaf to select the function inclusive

A read–eval–print loop (REPL)

canvas.draw() This is used to update a figure that has been altered, but not automatically re-drawn

Vista - display tags 

commands

Vista

Vista!

Vista!!

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1aed157b-80a0-4356-9b94-88c6b0f13db8/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1aed157b-80a0-4356-9b94-88c6b0f13db8/Untitled.png)

git clone [https://github.com/zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

Swap windows

ctrl+b : to enable command line

swap-window -t 0

move-window -t 0

vim-vista to view sidebar

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
[https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)

prefix + t to show clock in tmux pan

viminfo

```
The viminfo file is used to store:
- The command line history.
- The search string history.
- The input-line history.
- Contents of non-empty registers.
- Marks for several files.
- File marks, pointing to locations in files.
- Last search/substitute pattern (for 'n' and '&').
- The buffer list.
- Global variables.

:set viminfo?: the default value should include <50 and s10 meaning that the content of registers is saved if they consist of less than 50 lines and/or weight under 10 Kb.
```

shada shared data

### Terminal mode in vim8

use :term to launch built-in terminal

use <C_\><C_N>:q to close the terminal

## Compile and install vim8 in ubunt16.04

[vim/vim](https://github.com/vim/vim/blob/master/src/INSTALL)

1. git clone [https://github.com/vim/vim.git](https://github.com/vim/vim.git)
2. 

```
cd src
make distclean  # if you build Vim before
make
sudo make install
```

3. apt install git make clang

4. add python3 support

apt install libpython3-dev

### YCM

1. sudo apt-get -y install build-essential cmake git python-dev
2. Install vundle
    1. git clone [https://github.com/VundleVim/Vundle.vim.git](https://github.com/VundleVim/Vundle.vim.git) ~/.vim/bundle/Vundle.vim
3. Download gcm

```python
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
```

1. apt-get install g++-8

    Install using gcc8

2. CC=gcc-8 CXX=g++-8 python3 ./install.py

```
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

```

Other options (replace the number after `\e[`):

```
Ps = 0  -> blinking block.
Ps = 1  -> blinking block (default).
Ps = 2  -> steady block.
Ps = 3  -> blinking underline.
Ps = 4  -> steady underline.
Ps = 5  -> blinking bar (xterm).
Ps = 6  -> steady bar (xterm).
```

15 Jun 2021

They're tabs. By default, VIM shows all control characers other than EOL as `^n` where `n` is the character of the alphabet corresponding to the character being shown (tab = char #9, `I` = 9th char in alphabet). To stop showing them, use `:set nolist`, but that will turn off EOL display as well.

If you want to see end-of-line chars but not tabs, you can use `listchars` for that. Use `:help listchars` for details, but roughly:

```
:set listchars=tab:\ \ ,eol:$
```

That says, when showing tabs, show a space for the first virtual space it occupies and a space for the subsequent ones; when showing EOLs, use a `$`. (Since tabs can span multiple virtual columns, you get to use two different chars, one for the first column, and one for the others.)

Use c$ or just C to quickly change from the cursor to the end of a line, 

cc to change an entire line, 

cis for a sentence.1. To quick add 50 # in a Single line using the command

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

## vim coc tips
```
<space>a – coc dialogistic
<space>c – coc command
<space>f – coc fix
<space>rn – coc rename
alt oO insert mode insert a new line above or below

alt+ create a new split
K function help
```