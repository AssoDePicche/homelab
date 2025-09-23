if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
  Plug 'editorconfig/editorconfig-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'mattn/emmet-vim'
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-surround'
call plug#end()

set encoding=utf-8
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set incsearch
set hlsearch
set autowrite
set modelines=0
set nomodeline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set signcolumn=no
set shiftround
set expandtab
set nojoinspaces
set nu
set rnu
set splitbelow
set splitright
set breakindent
set autoindent

filetype plugin indent on

syntax on

nnoremap <C-a> :NERDTreeToggle<CR>
nnoremap <C-F> :FZF<CR>

nmap th :split<CR>
nmap tv :vsplit<CR>
nmap <C-i> :nohlsearch<CR>

nmap q :q<CR>
nmap <C-s> :w<CR>
nmap <C-e> :e
nmap <C-p> :%s/
nmap <C-t> :term<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let NERDTreeShowHidden=1

let g:ale_linters = {
\ 'cpp': ['g++'],
\ 'c': ['gcc'],
\ 'css': ['stylelint', 'csslint'],
\ 'html': ['tidy', 'htmlhint'],
\ 'java': ['javac'],
\ 'javascript': ['eslint', 'standard'],
\ 'python': ['flake8', 'pyright', 'bandit']
\}

let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'cpp': ['clang-format'],
\ 'c': ['clang-format'],
\ 'css': ['prettier', 'rustywind', 'stylelint'],
\ 'html': ['prettier', 'tidy', 'html-beautify'],
\ 'java': ['clang-format'],
\ 'javascript': ['eslint'],
\ 'python': ['black', 'isort'],
\}

let g:ale_sign_error = 'E'

let g:ale_sign_warning = 'W'

let g:ale_sign_column_always = 1

let g:ale_linters_explicit = 1

let g:ale_fix_on_save = 1

let g:ale_completion_autoimport = 0

let g:ale_c_cc_options = '-std=c23 -Wall -Wextra -Wpedantic'

let g:ale_cpp_cc_options = '-std=c++23 -Wall -Wextra -Wpedantic'

let g:ale_c_clangformat_options = '--style=Google'

let g:ale_python_flake8_options = '--max-line-length=80 --extend-ignore=E203'

let g:ale_python_black_options = '--line-length=80'

let g:ale_javascript_eslint_options = '--max-warnings=0 --fix --env es6'

let g:ale_lint_on_text_changed = 'always'

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --tab-width 2 --print-width 80'

let g:ale_html_prettier_options = '--tab-width 2 --print-width 80'

let g:ale_html_tidy_options = '--indent yes --wrap 80'

let g:ale_css_prettier_options = '--tab-width 2 --print-width 80'

let g:ale_css_stylelint_options = '--fix'

let g:user_emmet_install_global = 0

:let $FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --follow --exclude .git --exclude node_modules --exclude dist --exclude build --exclude vendor --exclude target'

autocmd FileType html,css EmmetInstall
