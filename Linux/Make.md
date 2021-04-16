:=

Simply expanded (using :=) allows you to append to a variable. Recursive
definitions will give an infinite loop error.

?=

only sets variables if they have not yet been set

+=

to append

recursive (use =) - only looks for the variables when the command is used, not
when it's defined.
