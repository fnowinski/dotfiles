set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Colors
Plugin 'dracula/vim'

" Utils
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'epmatsw/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-ragtag'
Plugin 'janko-m/vim-test'
Plugin 'thoughtbot/vim-rspec'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'craigemery/vim-autotag'
Plugin 'jiangmiao/auto-pairs'
Plugin 'simeji/winresizer'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'godlygeek/tabular'
Plugin 'vim-syntastic/syntastic'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'sonph/onehalf'
Plugin 'ngmy/vim-rubocop'

call vundle#end()
filetype plugin indent on

" Syntax
syntax on
set t_Co=256
set background=dark
"colorscheme dracula
"colorscheme onehalfdark


" Map Leader
let mapleader = ","

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:jsx_ext_required = 0

let g:airline_theme='angr' " luna
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

runtime macros/matchit.vim

set number
set backspace=indent,eol,start
set clipboard=unnamed
set incsearch
set hlsearch
set ignorecase
set tags=tags;/
set noswapfile
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set ttymouse=xterm2
set mouse=a
set nowrap
set hidden
set history=10000
set scrolloff=4
set noesckeys
set ttimeout
set ttimeoutlen=1
set relativenumber
set path=$PWD/**

" Key Mappings
nmap <leader>vr :tabe $MYVIMRC<cr>
nmap <leader>rv :source $MYVIMRC<cr>

" Debuggers
imap cll console.log();<Esc>==f(a
nmap cll yiwocll
imap ppp binding.pry
nmap ppp yiwoppp
imap dbg debugger
nmap dbg yiwodbg
imap iee IEx.pry
nmap iee yiwoiee

" Search directory
nnoremap <leader>ta :ta<SPACE>
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>C :CtrlPClearCache<cr>
nnoremap <leader>x :only<CR>
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>
map <leader>m :CtrlPBuffer<CR>
map <leader>rt :!~/.vim/bin/update_ctags 2>/dev/null &<CR>
map <leader>g :Gblame<CR>
map <leader>bb ,m<cr>
nmap <space>w :w<cr>
nmap <space>q :q!<cr>
nmap <leader>q :wq<cr>
nmap <leader>w :set wrap!<cr>
map <space><tab> :Tabularize /
map <leader>p :pu<cr>
nmap 0 ^

autocmd VimResized * :wincmd =

" Move lines
nnoremap <leader>vv :m .+1<CR>==
nnoremap <leader>ff :m .-2<CR>==
inoremap <leader>vv <Esc>:m .+1<CR>==gi
inoremap <leader>ff <Esc>:m .-2<CR>==gi
vnoremap <leader>vv :m '>+1<CR>gv=gv
vnoremap <leader>ff :m '<-2<CR>gv=gv
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Split windows
map <leader>- :split<cr>
map <leader>\ :vsplit<cr>

autocmd BufWritePre * :%s/\s\+$//e
au VimEnter * highlight clear SignColumn

" Italics
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic

" Specs
let g:rspec_command = "Dispatch docker-compose exec test bundle exec spring rspec {spec}"
nmap <space>T :w<cr>:call RunCurrentSpecFile()<CR>
nmap <space>t :w<cr>:call RunNearestSpec()<CR>
nmap <space>l :call RunLastSpec()<CR>
nmap <space>A :call RunAllSpecs()<CR>
"let g:rspec_command = "!bundle exec spring rspec --drb {spec}"
"let g:rspec_command = "Dispatch bin/rspec {spec}"
"nmap <space>T :w<cr>:call RunCurrentSpecFile()<CR>
"nmap <space>t :w<cr>:call RunNearestSpec()<CR>
"nmap <space>l :call RunLastSpec()<CR>
"nmap <space>A :call RunAllSpecs()<CR>

" Navigation
map <leader>ja :CtrlP app<CR>
map <leader>jm :CtrlP app/models<CR>
map <leader>jc :CtrlP app/controllers<CR>
map <leader>jv :CtrlP app/views<CR>
map <leader>jh :CtrlP app/helpers<CR>
map <leader>js :CtrlP app/services<CR>
map <leader>jw :CtrlP app/workers<CR>
map <leader>jr :CtrlP app/javascript_apps/songs<CR>
map <leader>jl :CtrlP lib<CR>
map <leader>jp :CtrlP public<CR>
map <leader>jt :CtrlP spec<CR>
map <leader>jC :CtrlP config<CR>
map <leader>jd :CtrlP db<CR>
map <leader>jf :CtrlP spec/support/factories<CR>

map <leader>aa :Ag! -i <c-r>=expand("<cword>")<cr><cr>
map <leader>sa :Ag! -i <c-r>=expand("<cword>")<cr> app/<cr>
map <leader>sm :Ag! -i <c-r>=expand("<cword>")<cr> app/models<cr>
map <leader>sc :Ag! -i <c-r>=expand("<cword>")<cr> app/controllers<cr>
map <leader>sv :Ag! -i <c-r>=expand("<cword>")<cr> app/views<cr>
map <leader>sh :Ag! -i <c-r>=expand("<cword>")<cr> app/helpers<cr>
map <leader>ss :Ag! -i <c-r>=expand("<cword>")<cr> app/services<cr>
map <leader>sw :Ag! -i <c-r>=expand("<cword>")<cr> app/workers<cr>
map <leader>sr :Ag! -i <c-r>=expand("<cword>")<cr> app/javascript_apps/songs<cr>
map <leader>sl :Ag! -i <c-r>=expand("<cword>")<cr> lib/<cr>
map <leader>sp :Ag! -i <c-r>=expand("<cword>")<cr> public/<cr>
map <leader>st :Ag! -i <c-r>=expand("<cword>")<cr> spec/<cr>
map <leader>sC :Ag! -i <c-r>=expand("<cword>")<cr> config/<cr>
map <leader>sd :Ag! -i <c-r>=expand("<cword>")<cr> db/<cr>
map <leader>sf :Ag! -i <c-r>=expand("<cword>")<cr> spec/support/factories<cr>

map <space>aa :Ag! -i<space>
map <space>sa :Ag! -i app/<C-Left>
map <space>sm :Ag! -i app/models/<C-Left>
map <space>sc :Ag! -i app/controllers/<C-Left>
map <space>sv :Ag! -i app/views/<C-Left>
map <space>sh :Ag! -i app/helpers/<C-Left>
map <space>ss :Ag! -i app/services/<C-Left>
map <space>sw :Ag! -i app/workers/<C-Left>
map <space>sr :Ag! -i app/javascript_apps/songs<C-Left>
map <space>sl :Ag! -i lib/<C-Left>
map <space>sp :Ag! -i public/<C-Left>
map <space>st :Ag! -i spec/<C-Left>
map <space>sC :Ag! -i config/<C-Left>
map <space>sd :Ag! -i db/<C-Left>
map <space>sf :Ag! -i spec/support/factories/<C-Left>

"map <leader>jl :CtrlP lib/investr<cr>
"map <leader>jc :CtrlP config<cr>
"map <leader>jp :CtrlP priv<cr>
"map <leader>jt :CtrlP test<cr>

"map <leader>aa :Ag! -i <c-r>=expand("<cword>")<cr><cr>
"map <leader>sl :Ag! -i <c-r>=expand("<cword>")<cr> lib/<cr>

"map <space>aa :Ag! -i<space>
"map <space>sa :Ag! -i lib/<C-Left>

