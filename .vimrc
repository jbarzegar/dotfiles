set nocompatible              " be iMproved, required
filetype off                  " required

"Auto install Plug https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" set rtp+=/usr/local/opt/fzf "Fuzzy finder, installed via homebrew

call plug#begin('~/.vim/plugged')

" Start screen
Plug 'mhinz/vim-startify'

" Themes
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons' "Icons for filetypes
Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'


Plug 'luochen1990/rainbow'

" Language Syntax Support
Plug 'peitalin/vim-jsx-typescript', { 'branch': 'main' }
Plug 'styled-components/vim-styled-components'
Plug 'sheerun/vim-polyglot'

" Tools
Plug 'prettier/vim-prettier'
Plug 'jiangmiao/auto-pairs' "Autocomplete brackets.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive' "Git tools
Plug 'tpope/vim-surround' "Surround
Plug 'mileszs/ack.vim' "Searcher
Plug 'mattn/emmet-vim' "A bit annoying because it takes over my Tab key
Plug 'scrooloose/nerdtree', {  } "Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocompletion
Plug 'neoclide/coc-eslint'
Plug 'liuchengxu/vim-which-key'
Plug 'dense-analysis/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'junegunn/goyo.vim'

"Ranger integration
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

Plug 'kamykn/spelunker.vim'



" All of your Plugins must be added before the following line
call plug#end()            " required
" filetype plugin indent on    " automatically run by Plug
" syntax enable " automatically run by Plug


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core Functionality (general settings, keyboard shortcuts)
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8

 "Map leader to spacebar
let mapleader="\<Space>"

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite
set autoread
set modelines=0
set wildmenu
"set nospell
set nospell

"deal with swps and backups here
set timeoutlen=1000  "speed vim up
set ttimeoutlen=0  "https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334
set ttyfast  "Rendering

set clipboard=unnamed  " set clipboard to easily copy from vim and paste into OSx


" Theme settings
set background=dark
colorscheme palenight
let g:lightline = {
			\'colorscheme': 'palenight',
			\ 'active': {
	 		\   'left': [
			\     [ 'mode', 'paste' ],
			\     [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'cocstatus': 'coc#status'
			\ },
			\ }

if (has("termguicolors"))
  set termguicolors
endif

" Disable Autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" save with zz
nnoremap zz :update<cr>
" quickly remove highlighting
nnoremap <leader>nhl :nohl<cr>

" Reload vim config
cnoreabbrev reloadConf so ~/.vimrc<CR>
nnoremap <leader>rc :so ~/.vimrc<cr>

"Yoink the current path
nnoremap ,c :let @* = expand("%:p").":".line('.')<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"Changes NerdTree Toggle to Ctrl + n
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<Enter>
nnoremap <leader>nf :NERDTreeFind<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Don't really use anymore.  Mostly using tmux now
"Smart way to move between windows map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
" auto rescale splits in vim
:autocmd VimResized * wincmd =

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ranger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ranger_map_keys = 0  "Disable the annoying <leader>f key

function OpenFM()
	:tabnew
	:Ranger
endfunction

nmap <leader>fm :Ranger<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
map <C-p> :FZF<CR>
nmap <leader>p :FZF<CR>

let g:fzf_action = {
	\ 'return': 'tab split',
	\ 'ctrl-v': 'vsplit',
	\ 'ctrl-s': 'split' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conquer of Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2     " tab spacing
set linespace=10

set ai            " Auto indent
" set si            " Smart indent

" Show line numbers
" turn absolute line numbers on
set number
set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set breakindent
set columns=80


set mouse=a "Enable mouse support

" Code fold bliss
" https://www.linux.com/learn/vim-tips-folding-fun
" set foldmethod=indent

" Blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=


" adds blue highlight to vim in visual mode selections
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Shows the title within the window
set title titlestring=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default formatters for ES/ES-based languages
:let default_es_formatters = ['eslint', 'prettier']

autocmd BufWritePre * :%s/\s\+$//e

let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': default_es_formatters,
\ 'typescript': default_es_formatters,
\ 'typescriptreact': default_es_formatters,
\ 'markdown': ['prettier', 'textlint'],
\ 'ruby': ['rubocop']
\}
let g:ale_fix_on_save = 1

" Emmet
" let g:user_emmet_expandabbr_key='<Tab>'

" Syntax stuff
" This lets vim know that .prisma files should be graphql.
" Stolen from vim-graphql/ftdetect/graphql.vim
au BufRead,BufNewFile *.prisma setfiletype graphql

set secure "disables unsafe commands in project specific .vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use ag instead of ACK
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

nnoremap <leader>ag :Ack


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable jbuilder syntax
au BufNewFile,BufRead *.json.jbuilder set syntax=ruby


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => spelunker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable spelunker.vim. (default: 1)
" 1: enable
" 0: disable
let g:enable_spelunker_vim = 1


 let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
