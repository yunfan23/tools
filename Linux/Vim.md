# Installation

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
