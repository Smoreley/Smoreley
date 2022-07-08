# Pato PDE

## Config files
~/.config/nvim/
~/.config/alacritty/alacritty.yml

## Start
nvim

## Keys
<ESC> u			Undo last change
<CTRL> <tab>	Toggle between tabs
<SHIFT> h		Show/Hide files

### move cursor
h (left), j (down), k (up), l (right)

:help option-list
:CheckHealth


## Commands
:buffers		show a list of opened buffers
:bfirst			change to the first buffer
:blast			change to the last buffer
:bnext			change to the next buffer
	:bn
:bprevious		change to the previous buffer
	:bp
:bdelete		delete current buffer from the buffer list
	:bd
	:bd <N>			delete specified N buffer
:b <TAB>		choose from opened buffers
<N> <CTRL-6>	goes to specified N buffer

:pwd			print the current directory name
:cd [path]		change the current directory to [path]

:help			open a window and display the help file in read-only mode
	:h
:close			close the current window


:w				write to the current file
:q				quit current buffer, unless changes have been
:q!				quit current buffer always, discard any changes
:qa				exit Vim, unless changes have been made
:qa!			exit Vim always, discard any changes


## Packer
:PackerSync

:WhichKey
:Dashboard

## Netrw
:Explore
:Hexplore
:Lexplore		open a file on the window where we called the command.
:Sexplore		create a horizontal split and show the directory in the upper window
:Vexplore		create a vertical split and show the directory on the left side
:Texplore		create a new tabpage to show the directory.
:Rexplore

Enter			go down a directory
-				go up a directory
u				go back

mt				assign the "target directory" used by the move and copy commands
mf				marks a file or directory
mc				copy the marked files in the target directory
mm				move the marked files to the target directory

p				preview
gh				toggle hidden files
R				renames a file
D				deletes a file or empty directory
d				creates a directory


## Custom

<F3>			NvimTreeToggle
<F4>			TroubleToggle
<F11>			Zen toggle

<leader> ff		packer sync


## References
* https://neovim.io/doc/user/windows.html
* https://neovim.io/doc/user/quickref.html#quickref


??? Why does u in the explore change the icons?
??? What are swapfiles


# Some Options
vim.opt.number = true			for line numbers
vim.opt.mouse = 'a'				allows mouse
vim.opt.wrap = true				wrap lines that exceed the width of the screen
vim.opt.expandtab = true		should transform Tab character to spaces


# Understanding Keybinding
vim.keymap.set({mode}, {lhs}, {rhs}, {opts})

modes:
	* normal:		n
	* insert:		i
	* visual:		x
	* selection:	s
	* terminal:		t

{lhs}		the key we want to bind
{rhs}		the action we want to execute
{opts}		must be a lua table
	desc		string that describes what the keybinding does
	remap		boolean that determines if the keybinding can be recursive
	buffer		can be boolean of number. boolean applies to current buffer, number means "id" for buffer
	silent		whether or not the keybinding can show a message
	expr		if enabled gives the change to use vimscript or lua to calculate the value of {rhs}

// global variable for leader
vim.g.mapleader = ' '

