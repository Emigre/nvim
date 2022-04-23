# Keys

## Neovim

### Basic

```
:h        (plus keyword) shows help

:!        (plus command) execute external shell command
:r        (plus program) read external program output into file
:r!       (plus command) read external shell command output into file

:          (plus line number) jump to that line
g          (plus line number) jump to that line
.          repeat last command

/          (plus text) search in current file
?          (plus text) search backwards in current file
*          search for word under the cursor
<leader>h  toggle search result highlighting

<leader>a  search in the project's files
           TODO: check and add regex notes

<leader>s  search and substitute text in current file
           TODO: check and add regex notes

<leader>p  yank path
<leader>P  yank absolute path
<leader>R  toggle replace text mode
r          reload and redraw the screen
s          safe save

K          cut selected text
KK         cut the whole line

S          go to next empty paragraph, same as }
U          go to previous empty paragraph, same as {

<c-y>      scroll up the screen
<c-v>      scroll down the screen

<leader>w  enter/exit the quickfix window
<leader>W  close the quickfix window
<leader>L  enter/exit the location window

>>         indent right
<<         indent left
~          switch case
```

### Buffer navigation

```
h          previous buffer
l          next buffer
q          close current buffer
Q          close the other buffers
```

### Jumps

```
<c-i>      go forward in the jumplist
<c-o>      go back in the jumplist

g,         go to newer position in change list
g;         go to older position in change list

:ju        shows jumplist
:cle       clears jumplist for the current window
           the jumplist is stored in the shared data file located
           in the XDG data directory ($XDG_DATA_HOME), this file
           should be deleted to remove the jumps permanently
```

### Windows

```
<c-w>s      split window horizontally
<c-w>v      split window vertically

<c-w><c-w>  go to next window
<c-w>w      go to next window
<c-w>h      go to the window to the left
<c-w>l      go to the window to the right
<c-w>j      go to the window below
<c-w>k      go to the window above

<c-w>c      close window
<c-w>q      quit window
:on         close all windows except current window

<c-w>r      rotate windows clockwise
<c-w>T      move window to a new tab

<c-w>|      maximize width of active window
<c-w>1|     minimize width of active window
<c-w>_      maximize height of active window
<c-w>1_     minimize height of active window
<c-w>=      equalize size of windows
```

### Marks and registes

```
m          (plus letter) create mark, global if uppercase
`          (plus letter) jump to mark
           ... prefix with command to execute it to that mark
'          (plus letter) jump to that mark's line
           ... prefix with command to execute it to that mark's line

``         jump to location before last jump
`"         jump to last edit in this file
`.         jump to last change in this file
`0         jump to where Vim was previously exited

:marks     shows list of marks
:marks     (plus letter) shows that mark
```

### Macros

```
<leader>q  (plus letter) start/stop recording macro
@          (plus letter) execute that macro
           ... prefix with number to execute multiple times
@@         execute last macro again

:reg       shows all registers, including macros
:reg       (plus letter) shows that register
```

### CtrlP

```
<c-p>     start ctrlp
          ... <c-d> cycle search by filename [d] (default) / search by whole path
          ... <c-f> cycle search mode: files (default) / buffers / mru files
          ... <c-r> to switch to regexp mode
          ... <c-p> select previous strings in the prompt's history
          ... <c-n> select next strings in the prompt's history
          ... <c-y> create a new file and its parent directories
          ... <c-z> to mark/unmark multiple files, and <c-o> to open them
          ... <c-j>, <c-k> or the arrow keys to navigate the result list
```

### Language server

```
# diagnostics
<c-j>      next diagnostic
<c-k>      previous diagnostic
<leader>D  show location list (diagnostics window)

# language analysis
R          show references
t          show type definition
<leader>;  go to definition

<leader>v  show symbols outline window
```

### Git

```
# blame window
<leader>g  open blame window

# in blame window ...
-          reblame at the commit that added the line
gq         close blame and restore file from a reblame

<CR>       close blame and show patch that added the line
o          jump to patch or blob in horizontal split

# diff window
<leader>G  open diff window

# in diff window ...
]c          go to next difference
[c          go to previous difference
dp          diff put (uses version in this file in the other file)
            use in the diff window to undo changes
do          diff obtain (brings version from the other file)

zo          open fold
zc          close fold
zr          unfold both files completely
zm          fold both files completely

:dif        re-scan the files for differences
:diffput    same as dp but for a visual mode range
:diffget    same as do but for a visual mode range
```

### Comments

```
<leader>cc comment with //
<leader>cm comment with /*
<leader>cs doc style comment
<leader>cn comment, nested
<leader>cA add comment at the end of the line
```

### Other

```
# functions
WhatIsThisColour
WhatIsThisSyntax
WhatIsThisFile
ShowAllColours

# commands
CtrlPRefresh
SpacesToTabs
TabsToSpaces
RetabIndent

# language specific: C++
<leader>H  switch between header and implementation
<leader>i  add an include header
```

## Ranger

```
<leader>f  open ranger in base path
<leader>F  open ranger in working directory
```
