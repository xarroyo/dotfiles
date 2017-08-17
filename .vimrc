set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'airblade/vim-gitgutter'
Plugin 'vim-perl/vim-perl'
Plugin 'rkitover/perl-vim-mxd'
Plugin 'pangloss/vim-javascript'

Plugin 'townk/vim-autoclose'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" -----------------------------------------------------------------------------
" Plugin configuration
" -----------------------------------------------------------------------------

" -------------------------
" CtrlP
" -------------------------

"  Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked, unless a starting directory is specified, CtrlP will set its
" local working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore:
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" -------------------------
" vim-gitgutter
" -------------------------
let g:gitgutter_enabled = 1

" -------------------------
" NERDTree
" -------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" -----------------------------------------------------------------------------
" Interface
" -----------------------------------------------------------------------------
set nocompatible                        " Sorry vi :'(
set laststatus=2                        " Show the status line
set mouse=a

set visualbell                          " Screen blink instead of beeping
set noerrorbells                        " Don't ring the bell on errors

set listchars=tab:▸\ ,eol:¬,extends:#,nbsp:.,trail:.
set list                                " Show hidden characters (customized)

let g:Powerline_symbols = 'fancy'       " Powerline symbols set

set number                              " Show line numbers column
set numberwidth=3                       " Line number column width
set guicursor+=a:blinkon0               " Turn off cursor blinking
set ruler                               " Show the line and column number

" -----------------------------------------------------------------------------
" Format
" -----------------------------------------------------------------------------

syntax on                               " Enable syntax highlighting
autocmd BufNewFile,BufRead *.htt set filetype=tt2html
colorscheme wombat

" Identation
set autoindent                          " Auto identation
set smartindent                         " Smart identation
set tabstop=2                           " Tab lenght
set shiftwidth=2                        " Tab lenght (backwards compatible)
set expandtab                           " Expand tabs to spaces

" -----------------------------------------------------------------------------
" Snippets
" -----------------------------------------------------------------------------
iab _debug  print "\n\n----------------------------\n\n";<CR>print;<CR>print "\n\n----------------------------\n\n";
iab _debug2 print "\n\noooooooooooooooooooooooooooo\n\n";<CR>print;<CR>print "\n\noooooooooooooooooooooooooooo\n\n";
iab _debug3 print "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n";<CR>print;<CR>print "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n";
iab _debug4 print "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n";<CR>print;<CR>print "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n";
iab _debug5 print "\n\nMWMWMWMWMWMWMWMWMWMWMWMWMWMW\n\n";<CR>print;<CR>print "\n\nWMWMWMWMWMWMWMWMWMWMWMWMWMWM\n\n";
