"syntax highlighting
syntax on 

"line numbering that toggles between normal and relative
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" show partial commands
" somehow did not work normally
au BufNewFile,BufReadPost,FilterReadPost,FileReadPost * set showcmd

"original line number
set number

"indent options
set ai

"search incrementally and highlighting
set incsearch
set hlsearch

"remove highlighting till next search
nnoremap <silent> <esc> :noh<return><esc>

"show matching brackets
set showmatch

"tab completion
set wildmode=longest:full
set wildmenu

"set semi-colon to colon
nore ; :
nore : ;

"shift >>/<< width
set shiftwidth=2

set tabstop=4
set softtabstop=4

filetype plugin on

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

"""CtrlP plugin - it's super awesome
Plugin 'ctrlpvim/ctrlp.vim'

"""scala highlighting
Plugin 'derekwyatt/vim-scala'

"""License adder
Plugin 'antoyo/vim-licenses'

"b
"""racket highlighting
Plugin 'wlangstroth/vim-racket'

""snippet plugin - experiment
""Plugin 'Shougo/neosnippet'
""Plugin 'Shougo/neosnippet-snippets'

"""org-mode - yet to use
Plugin 'jceb/vim-orgmode'

""" syntax checking - uncomfortable
"""Plugin 'scrooloose/syntastic'
""" quick scope to find best position to jump to
Plugin 'unblevable/quick-scope'

""" Helpful for commenting
Plugin 'tpope/vim-commentary'

""" Indentation for Lisp
Plugin 'paredit.vim'

""" To look up documentation
Plugin 'keith/investigate.vim'

"""list of tags
Plugin 'majutsushi/tagbar'

"""slime for vim
Plugin 'jpalardy/vim-slime'

"""zeavim - access zeal docs from vim
Plugin 'kabbamine/zeavim.vim'

""" code snippets for C and python
Plugin 'drmingdrmer/xptemplate'

""" syntax highlighting for rust
Plugin 'rust-lang/rust.vim'

""" Neocomplete - general purpose auto complete frontend
Plugin 'Shougo/neocomplete.vim'

""" Snippets
" engine
Plugin 'SirVer/ultisnips'
" snippets
Plugin 'honza/vim-snippets'

" Auto formatting
Plugin 'chiel92/vim-autoformat'

" C/C++ completion engine based on clang
Plugin 'Rip-Rip/clang_complete'

" completion of paranthesis, quotes
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on

"Ctrlp fuzzy finder : thanks to Robin Ward
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"for quick indexing by using git file listing => no files from gitignore, but untracked files
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

"""For the License Adder
let g:licenses_authors_name = 'Govindarajan, Kavya <soldatargent@gmail.com>'
let g:licenses_copyright_holders_name = 'Govindarajan, Kavya <soldatargent@gmail.com>'

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

""" Better escapes
"inoremap <silent> <Up> <ESC><Up>
"inoremap <silent> <Down> <ESC><Down>
"since esc moves back one step
inoremap <silent> <Left> <ESC><Right>
inoremap <silent> <Right> <ESC><Right>
""" Escape when typing so fingers don't leave home row
inoremap <silent> fj <ESC>

colorscheme peachpuff

""" Thanks to nvie/vimrc

""" to paste without mass auto indendation
set pastetoggle=<F2>

""" fold using syntax
set foldmethod=syntax
set foldclose=all "automatically reclose after navigating out
set foldlevel=1

""" show status bar at all times
"set laststatus=2

""" underline current line
set cursorline
""" highlight current cursor column
set cursorcolumn
hi CursorColumn ctermbg=6
noremap <silent> <F3> :set nocursorline!<CR>
noremap <silent> <F4> :set nocursorcolumn!<CR>

""" keep para indentation when wrapping text
set breakindent

""" Complete filenames/lines with quicker shortcut
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

" Quick yanking to the end of the line
nnoremap Y y$

""" End Thanks to nvie/vimrc

""" shortcut to write in vim when you forget to start using vim as sudo
cmap w!! w !sudo tee > /dev/null %

""" QuickScope plugin
""" toggle with 
nmap <F5> <plug>(QuickScopeToggle)
vmap <F5> <plug>(QuickScopeToggle)
""" highlight when pressing f or F
"let g:qs_highlight_on_keys = ['f', 'F']

""" tagbar plugin
""" easy toggle
nmap <silent> <F8> ;TagbarToggle<CR>

""" slime configuration
let g:slime_target = "tmux"
noremap <silent> X :SlimeSendCurrentLine<CR>

""" Neocomplete settings
set completeopt=longest,menu,menuone
let g:neocomplete#enable_at_startup=1
" have selection on first option
let g:neocomplete#enable_auto_select = 1

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

let g:neosnippet#snippets_directory='~/.vim/bundle/xptemplate/autoload/xpt'

""" Auto formatting
" format on save
au BufWrite *.py :Autoformat
au BufWrite *.c :Autoformat
au BufWrite *.cpp :Autoformat

""" clang_complete
" Require: clang (apt-get), exact path needs to be put here
let g:clang_library_path='/usr/lib/llvm-3.5/lib/libclang-3.5.so.1'

""" make space as leader
let mapleader = "\<Space>"

""" save using <space>w
nnoremap <Leader>w :w<CR>

""" remember undo afer quitting
set hidden
