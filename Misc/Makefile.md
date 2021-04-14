1. https://cmake.org/download/

   makefiles tips

   1. command starts with a tab and ends with $

   2. in vim setting, stop convert tab into space using

      autocmd FileType make setlocal noexpandtab

   3. to check the file and display the chars use

   cat -e -t -v <filename>

   -e display ending

   -t display tab

   -v control char

   .PHONY

   A phoney target is on that is not really the name of a file. To use a phoney target is to avoid the conflict with a  file of the same name and to improve performance.

   make has the ability to build targets in parallel
