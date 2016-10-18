syntax on 

"line numbering that toggles between normal and relative
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"original line number
set number

"indent options
set ai

"search incrementally and highlighting
set incsearch
set hlsearch

"show matching brackets
set showmatch

"tab completion
set wildmode=longest:full
set wildmenu

"set semi-colon to colon
nore ; :
nore : ;

"dark background color
set background=light
colorscheme zellner

"shift >>/<< width
set shiftwidth=2

set tabstop=4
set softtabstop=4

"Use Enter/Shift-Enter to introduce new lines above/below w/o leaving normal mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>

"""setup vundle
set nocompatible
filetype off 

set rtp^=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""manage vundle
Plugin 'gmarik/Vundle.vim'

"""CtrlP plugin
Plugin 'kien/ctrlp.vim'

"""scala highlighting
Plugin 'derekwyatt/vim-scala'

"""License adder
Plugin 'antoyo/vim-licenses'

"""racket highlighting
Plugin 'wlangstroth/vim-racket'

"""plugin for hdl
"""Plugin 'suoto/vim-hdl'

""snippet plugin - experiment
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'

"""org-mode 
Bundle 'jceb/vim-orgmode'

call vundle#end()
filetype plugin indent on

"Ctrlp fuzzy finder : thanks to Robin Ward
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"for quick indexing by using git file listing => no files from gitignore, but untracked files
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

"""For the License Adder
let g:licenses_authors_name = 'Govindarajan, Chander <chandergovind@gmail.com>'
let g:licenses_copyright_holders_name = 'Govindarajan, Chander <chandergovind@gmail.com>'

""" for neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

""" set terminal mode
set term=rxvt-unicode
""" this way, by using tmux (with xterm keys on) also works

""" for urxvt
map [5^ <C-PageUp>
map [6^ <C-PageDown>

""" Tabs management

"""switching between tabs
noremap <C-PageUp> gT
noremap <C-PageDown> gt

""" new tab creation
map tn <Esc>;tabnew<CR>

""" A better escape
"inoremap <silent> <Up> <ESC><Up>
"inoremap <silent> <Down> <ESC><Down>
inoremap <silent> <Left> <ESC><Left>
"inoremap <silent> <Right> <ESC><Right>
