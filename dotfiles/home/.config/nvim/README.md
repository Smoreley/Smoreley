# Pato PDE(Personal Development Environment)

## Config files
~/.config/nvim/
~/.config/alacritty/alacritty.yml

## Start
nvim

# Terminal
ps T                Selects/Shows all processes associated with the terminal

# HotKeys
<F2>                Symbols
<F3>                NvimTreeToggle
<F4>                TroubleToggle
<F11>               Zen toggle

<ESC> u             undo last change
r                   replace char under cursor
<CTRL> r            redo
<CTRL> <tab>        toggle between tabs
<SHIFT> h           show/Hide files

<CTRL> V            paste in insert mode
<CTRL> e            scroll window down one
<CTRL> y            scroll window up one

<CTRL> f            scroll down one page
<CTRL> b            scroll up one page

<CTRL> d            scroll window Downwards in the buffer.
<CTRL> u            scroll window Upwards in the buffer.

<CTRL> n            next trouble issue
<CTRL> m            move down line

<CTRL> w q          quit a window
<CTRL> w v          vertical window split
<CTRL> w s          horizontal window split
<CTRL> w h,j,k,l    move between window
<CTRL> w o          close all split windows but current one
<CTRL> 0            reset scale
<CTRL> =            increase scale
<CTRL> -            decrease scale

<CTRL> (h,j,k,l)    move between windows
<CTRL> ArrowKey     resize window

<CTRL> a            increment number under cursor
<CTRL> x            decrement number under cursor

<CTRL> t            indent in insert Mode
<CTRL> d            un-indent in Insert Mode

v                   visual mode
    <SHIFT> v           start Visual mode linewise
    <CTRL> v            start Visual mode blockwise
y                   yank/copy
    yy              copy the current line
p                   paste the selected text below
    P               past the text above

zz                  center cursor on screen
G                   move the cursor to the bottom of the file
gg                  move the cursor to the top of the file
ggVG                selects all

H                   move the cursor to the top of the window
M                   move the cursor to the middle of the window
L                   move the cursor to the bottom of the window

K                   when cursor is over word to find its documentation
gd                  go to local definition
    gD              go to global declaration
x                   delete character under the cursor
i                   insert mode (insert before char)
    I                   move to start of line and switch to insert mode
a                   append (insert after char)
    A                   append to end of line
o                   begin a new line below the cursor and insert text
    O                   begin a new line above cursor and insert text

* or #              search for whole word by moving cursor to the word and pressing these one of these keys
%                   move between brackets (when cursor is over a bracket)
[[                  move the cursor to function start
{                   move the cursor to block start

/xyz            search xyz from top to bottom
    /\ctext         search for text (case-insensitive)
?xyz            search xyz from bottom to top
Press n to find the next occurrence or N to find the previous occurrence.

w                   move forward at the beginning of the next word
e                   moves forward at the end of the next word
b                   moves backward at the beginning of the previous word
*w                  moves some number (ex: 3w)
f*                  moves forward on the first occurrence of *
F*                  moves backward on the first occurrence of *
t*                  moves forward before the first occurrence of *
*G                  move to the *th line
dd                  deletes current line (also copies, can past with "p" or "P")
d2d                 delete current line completely
di"                 deletes inside quotes
dw                  delete a word
d$                  delete to end of line

m                   to mark (ex: mk  to get back to the mark `k)

# Vim Commands
:checkhealth
:reg                see all the registers and their content
:buffers            show a list of opened buffers
:bfirst             change to the first buffer
:blast              change to the last buffer
:bnext              change to the next buffer
    :bn
:bprevious          change to the previous buffer
    :bp
:bdelete            delete current buffer from the buffer list (makes the buffer invisible, but leaves it in memory)
    :bd
    :bd <N>         delete specified N buffer
:bwipeout           completely erases the buffer from memory
    :bw
    :%bw            clears all buffers
:b <TAB>            choose from opened buffers
:b somenumber       open specified tab by number in current window
<N> <CTRL-6>        goes to specified N buffer

:pwd                print the current directory name
:cd [path]          change the current directory to [path]
:ls                 list buffers

:help               open a window and display the help file in read-only mode
    :h
:close              close the current window

:w                  write to the current file
    :wq!                write current file (save) and exit vim
    :1,10 w myfile  saves lines 1 to 10 in myfile
:sav myfile.txt     save the file as myfile.txt
:close              close the current split. The buffer is not deleted
:q                  quit current buffer, unless changes have been
    :qa                 exit Vim, unless changes have been made
    :q!                 quit current buffer always, discard any changes
    :qa!                exit Vim always, discard any changes

:e                  reload current buffer
    :e!                 reloads current buffer, discarding unsaved changes
    :e <filepath>       edit file (or create new if doesn't exist)

:term               new terminal buffer
:vsp +term          vertical split terminal

:##                 to go to line (ex: `:32`)
:map                to see the mappings defined by your vimrc and plugins
:map <Space>        list all the mappings assigned for Space

:v/myname/d         delete all lines not containing myname
:move #             moves line to

:tabnew             opens a new tab
:tab ball           puts all open files in different tabs
:only               close all windows(splits) except the current one
:tabonly            close all tabs except the current one

## move cursor
h (left), j (down), k (up), l (right)


# Leader Hotkeys
<leader>`           Find file

## Buffers
<leader>-bc         Close current buffer
<leader>-bf         Format buffer
<leader>-b]         Next buffer
<leader>-b[         Previous buffer
<leader>-bn         Next buffer
<leader>-bp         Previous buffer
<leader>-bb         Switch to other buffer
<leader>-bg         Goto buffer

## Code

## Debug

## Lsp
<leader>-li         Lsp info

## File
<leader>-fc         Edit Neovim configuration
<leader>-fn         Create a new unnamed buffer
<leader>-ff         Find files
<leader>-ft         Help tags
<leader>-fr         Recently opened files

## Git
<leader>-gs         Status
<leader>-gb         Branches
<leader>-gc         Commits

## Plugin
<leader>-pc         Clean disabled or unused plugins
<leader>-pi         Install missing plugins
<leader>-pp         Profile the time taken loading your plugins
<leader>-ps         Sync your plugins
<leader>-pC         Compile your plugins changes
<leader>-pS         Plugins status

## Quit
<leader>-qq         Quit
<leader>-qw         Save and quit
<leader>-qr         Restore previously saved session

## Search
<leader>-sg         Grep
<leader>-sb         Buffer
<leader>-ss         Goto symbol
<leader>-sh         Command history
<leader>-sm         Jump to mark

## Window
<leader>-wh         Window left
<leader>-wj         Window down
<leader>-wl         Window right
<leader>-wk         Window up
<leader>-wH         Expand window left
<leader>-wJ         Expand window down
<leader>-wL         Expand window right
<leader>-wK         Expand window up
<leader>-w=         Balance window

## Open
<leader>-os         Symbols
<leader>-ot         Terminal

## Jumps
<leader>-ja         Alternate file


## Plugin Packer Commands
:PackerSync
:WhichKey
:Dashboard


## NvimTree <F3>
enter               open folder
tab                 expand folder
-                   go back
o                   opens file
<SHIFT> h           show/hide hidden files
g?                  help, show supported commands

## Trouble
<CTRL> n            jump between trouble


# References
* https://neovim.io/doc/user/windows.html
* https://neovim.io/doc/user/quickref.html#quickref
* https://vim.rtorr.com/

# Guides
* https://www.dwarmstrong.org/neovim/

## Getting key maps for different modes
:nmap - Display normal mode maps
:imap - Display insert mode maps
:vmap - Display visual and select mode maps
:smap - Display select mode maps
:xmap - Display visual mode maps
:cmap - Display command-line mode maps
:omap - Display operator pending mode maps

## Vim notation
<BS>                Backspace
<Tab>               Tab
<CR>                Enter
<Enter>             Enter
<Return>            Enter
<Esc>               Escape
<Space>             Space
<Up>                Up arrow
<Down>              Down arrow
<Left>              Left arrow
<Right>             Right arrow
<F1> - <F12>        Function keys 1 to 12
#1, #2..#9,#0       Function keys F1 to F9, F10
<Insert>            Insert
<Del>               Delete
<Home>              Home
<End>               End
<PageUp>            Page-Up
<PageDown>          Page-Down
<bar>               the '|' character, which otherwise needs to be escaped '\|'

# Understanding Keybinding
vim.keymap.set({mode}, {lhs}, {rhs}, {opts})

modes:
    * normal:       n
    * insert:       i
    * visual:       x
    * selection:    s
    * terminal:     t

{lhs}       the key we want to bind
{rhs}       the action we want to execute
{opts}      must be a lua table
    desc        string that describes what the keybinding does
    remap       boolean that determines if the keybinding can be recursive
    buffer      can be boolean of number. boolean applies to current buffer, number means "id" for buffer
    silent      whether or not the keybinding can show a message
    expr        if enabled gives the change to use vimscript or lua to calculate the value of {rhs}

// global variable for leader
vim.g.mapleader = ' '



# Notes

## text objects
w   words
s   sentences
p   paragraphs
t   tags

## motions
a   all
i   in
t   til
f   find foward
F   find backward

## commands
d   delete
c   change
y   yank(copy)
v   visually select

diw delete inside word
di[
caw change
yi) take all text inside parentheses
va"

## Dot Command

## Macro a sequence of commands recorded to a register
## Record a macro
q{register}     record into register (ex: qw, record to "w" register)
DO A THING
q           stop recording

@{register}     execute record macro (ex: @w, to execute macro in "w" register)

