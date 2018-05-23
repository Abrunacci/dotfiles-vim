".vimrc created by Alejandro Brunacci
"  https://github.com/abrunacci

" rebind <leader> key
let mapleader=','

" split navigations
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" tabs navigation
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" No swap and backup files
set noswapfile
set nobackup
set nowritebackup

" Encoding
set encoding=utf-8

" Syntax stuff and number of lines
syntax on
let python_highlight_all=1
set nu
set numberwidth=1
set ls=2
" Files indent (check the configs on .vim/after/ftplugin/
filetype plugin indent on

" Disable folding
set nofoldenable

" Colorscheme
colorscheme wombat256mod


" Plugins

call plug#begin()

" NERDTree -- File browser 
" Some doc -- https://vimawesome.com/plugin/nerdtree-red
" Repo --  https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'scrooloose/nerdtree'

" Airline -- Powerline
" Some doc -- https://vimawesome.com/plugin/vim-airline
Plug 'vim-airline/vim-airline'

" Airline Themes
" Screenshots -- https://github.com/vim-airline/vim-airline/wiki/Screenshots
Plug 'vim-airline/vim-airline-themes'

" NERDCommenter -- that.
" Some doc -- https://vimawesome.com/plugin/the-nerd-commenter
Plug 'scrooloose/nerdcommenter'

" Neomake -- Linter
" Some doc -- https://vimawesome.com/plugin/neomake-impatience-and-laziness
Plug 'neomake/neomake'

" Jedi-VIM -- Python Autocomplete
" Some doc -- https://vimawesome.com/plugin/jedi-vim
Plug 'davidhalter/jedi-vim'


" VIM-Isort -- Sort Python Imports
" Some doc -- https://vimawesome.com/plugin/vim-isort
Plug 'fisadev/vim-isort'

" CTRLP -- Search files
" Some doc -- https://vimawesome.com/plugin/ctrlp-vim-everything-has-changed
Plug 'ctrlpvim/ctrlp.vim'

" Devicons -- Icons for vim
" Some doc -- https://vimawesome.com/plugin/vim-devicons
Plug 'ryanoasis/vim-devicons'

" Icons highlight -- Because of reasons... (this make NT soooo slow)
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()


" ===============
" PLUGIN SETTINGS
" ===============

" NERDtree 
map <F3> :NERDTree<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$',]

" Airline
let g:airline_theme='luna'
" Comment this line if theme is not 'solarized'
" let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts=1

" NERD Commenter
let g:NERDSpaceDelims=1

" Neomake 
" Run linter on write
autocmd! BufWritePost * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker=neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker=neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe='python3 -m py_compile'
let g:neomake_python_flake8_maker.exe='python3 -m flake8'

" Jedi
" Use tabs when going to definition
let g:jedi#use_tabs_not_buffers=1
" Make completions faster
let g:pymode_rope=0
" Rebind 'find usages' keys
let g:jedi#usages_command = "<leader>U"

" Isort
let g:vim_isort_Map='<C-i>'
let g:vim_isort_python_version='python3'

" CtrlP
let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" Ignore some folders
let g:ctrlp_custom_ignore = '.virtualenvs\|__pycache__\|git'
