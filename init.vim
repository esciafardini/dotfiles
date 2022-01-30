"neovim config

set termguicolors

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ntpeters/vim-airline-colornum'
Plug 'rking/ag.vim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'guns/vim-clojure-highlight'
Plug 'Olical/conjure'
Plug 'bakpakin/fennel.vim'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'karoliskoncevicius/sacredforest-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'frazrepo/vim-rainbow'
call plug#end()

au FileType clj,cljs,cljc,el call rainbow#load()

let g:sexp_enable_insert_mode_mappings = 0
let g:rainbow_active = 1
let g:rainbow_guifgs = ['Green', 'DarkCyan', 'Purple', 'DarkGreen']
let g:rainbow_ctermfgs = ['Red', 'DarkGreen', 'LightGrey', 'Green', 'LightMagenta']
let g:NERDCreateDefaultMappings = 1
"Re-Creating my Emacs Key-bindings
let mapleader = " "
let maplocalleader = " "

"Conjure notes
"ls HORIZONTAL buffer for CIDER
"lv VERTICAL buffer for CIDER
"er THE WHOLE THING
"ee the smaller thing
"ew the WORD or SYMBOL

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap " ""<Esc>i

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>` :nohl<CR>
nnoremap <Leader>f :Ex<CR>
nnoremap <Leader>gf :GFiles --cached --exclude-standard --others<CR>
nnoremap <Leader>cj :ConjureConnect<CR>
nnoremap <Leader>q :q<CR> 
nnoremap <Leader>0 :bd<CR> 
nnoremap <Leader>1 :only<CR>
nnoremap <Leader>2 <C-w>s
nnoremap <Leader>3 <C-w>v
nnoremap <Leader>o <C-w>w
nnoremap <Leader>j kJ
nnoremap <Leader>r dvb
nnoremap <Leader>xf gqq
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

map <Leader>;l <plug>NERDCommenterInvert
map <Leader>;y <plug>NERDCommenterYank
map <Leader>;c <plug>NERDCommenterYank p

"Aclaimant
nmap <Leader>as :ConjureConnect local.aclaimant.com 7000<CR>
nmap <Leader>aj :ConjureConnect local.aclaimant.com 7001<CR>
nmap <Leader>aa :ConjureConnect local.aclaimant.com 7002<CR>
nmap <Leader>at :ConjureConnect local.aclaimant.com 7004<CR>
nmap <Leader>ap :ConjureConnect local.aclaimant.com 7005<CR>


nnoremap <Leader>o <C-w>w
"VIM SEXP for slurping and lisping
let g:sexp_filetypes = ''

" ((4 4) (5 5))
function! s:vim_sexp_mappings()
  nmap <silent><buffer> <Leader>ms    <Plug>(sexp_splice_list)
  nmap <silent><buffer> <Leader>kr    <Plug>(sexp_raise_element)
  nmap <silent><buffer> <M-right>     <Plug>(sexp_emit_head_element)
  nmap <silent><buffer> <C-left>      <Plug>(sexp_emit_tail_element)
  nmap <silent><buffer> <M-left>      <Plug>(sexp_capture_prev_element)
  nmap <silent><buffer> <C-right>     <Plug>(sexp_capture_next_element)
  nmap <silent><buffer> <Leader>w[     <Plug>(sexp_square_head_wrap_list)
  nmap <silent><buffer> <Leader>w{     <Plug>(sexp_curly_head_wrap_list)
  nmap <silent><buffer> <Leader>w(     <Plug>(sexp_round_head_wrap_element)
endfunction

augroup VIM_SEXP_MAPPING
  autocmd!
  autocmd FileType clojure,scheme,lisp,timl call s:vim_sexp_mappings()
augroup END

set nocompatible
set number
set splitbelow
set splitright

set mouse=a
set clipboard=unnamed


" allow unsaved buffers
set hidden
set backspace=2
set gfn=Monaco:h16
set visualbell t_vb=
set signcolumn=yes
set laststatus=2
set updatetime=300
set redrawtime=5000

" better command line completion
set wildmode=longest,list,full
set wildmenu
set completeopt=longest,menuone

" show partial commands
set showcmd

" highlight searchs
set hlsearch
set incsearch

" case insensitive unless caps
set ignorecase
set smartcase

set ruler
set confirm
set notimeout ttimeout ttimeoutlen=200

" disable sticky esc key 
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=2

" save on blur
au FocusLost * silent! wa


" So it matches D and C
map Y y$
map <F1> <nop>
imap <F1> <nop>

"" Set airline solarized theme to light
let g:airline_theme='palenight'
let g:airline_solarized_bg='light'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#hunks#enabled = 0
let g:multi_cursor_exit_from_insert_mode=0
nmap br <Plug>AirlineSelectPrevTab
nmap bb <Plug>AirlineSelectNextTab
nmap <leader>b1 <Plug>AirlineSelectTab1
nmap <leader>b2 <Plug>AirlineSelectTab2
nmap <leader>b3 <Plug>AirlineSelectTab3
nmap <leader>b4 <Plug>AirlineSelectTab4
nmap <leader>b5 <Plug>AirlineSelectTab5
nmap <leader>b6 <Plug>AirlineSelectTab6
nmap <leader>b7 <Plug>AirlineSelectTab7
nmap <leader>b8 <Plug>AirlineSelectTab8
nmap <leader>b9 <Plug>AirlineSelectTab9


let g:markdown_fenced_languages = ['css', 'js=javascript', 'clojure']
let g:vim_markdown_folding_disabled = 1

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp/

set statusline+=%#warningmsg#
set statusline+=%*

" sudo to write file
cmap w!! %!sudo tee > /dev/null %

" omni complete
inoremap <Nul> <C-x><C-o>

" Clojure
let g:sexp_enable_insert_mode_mappings = 1
let g:clojure_fuzzy_indent_patterns = ['^doto', '^with', '^def', '^let', 'go-loop', 'match', '^context', '^GET', '^PUT', '^POST', '^PATCH', '^DELETE', '^ANY', 'this-as', '^are', '^dofor']
let g:clojure_align_multiline_strings = 1
let g:clojure_maxlines = 100
let g:clj_refactor_prefix_rewriting=0

" CLOJURE BINDINGS
nmap <Leader>cR cqp(require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh)<CR>

" COC
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

command! -nargs=0 Format :call CocAction('format')

"let g:coc_enable_locationlist = 0
"autocmd User CocLocationsChange CocList --normal location

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [l <Plug>(coc-diagnostic-prev)
nmap <silent> ]l <Plug>(coc-diagnostic-next)
nmap <silent> [k :CocPrev<cr>
nmap <silent> ]k :CocNext<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction



" Clojure LSP
nmap <silent> crtl :call CocAction('runCommand', 'lsp-clojure-thread-last-all')<CR>
nmap <silent> crtf :call CocAction('runCommand', 'lsp-clojure-thread-first-all')<CR>
nmap <silent> crth :call CocAction('runCommand', 'lsp-clojure-thread-first')<CR>
nmap <silent> crtt :call CocAction('runCommand', 'lsp-clojure-thread-last')<CR>
nmap <silent> crin :call CocAction('runCommand', 'lsp-clojure-add-import-to-namespace')<CR>
nmap <silent> cram :call CocAction('runCommand', 'lsp-clojure-add-missing-libspec')<CR>
nmap <silent> crns :call CocAction('runCommand', 'lsp-clojure-clean-ns')<CR>
nmap <silent> crcc :call CocAction('runCommand', 'lsp-clojure-cycle-coll')<CR>
nmap <silent> crcp :call CocAction('runCommand', 'lsp-clojure-cycle-privacy')<CR>
nmap <silent> crel :call CocAction('runCommand', 'lsp-clojure-expand-let')<CR>
nmap <silent> cref :call CocAction('runCommand', 'lsp-clojure-extract-function')<CR>
nmap <silent> cris :call CocAction('runCommand', 'lsp-clojure-inline-symbol')<CR>
nmap <silent> cril :call CocAction('runCommand', 'lsp-clojure-introduce-let')<CR>
nmap <silent> crml :call CocAction('runCommand', 'lsp-clojure-move-to-let')<CR>
nmap <silent> crua :call CocAction('runCommand', 'lsp-clojure-unwind-all')<CR>
nmap <silent> crut :call CocAction('runCommand', 'lsp-clojure-unwind-thread')<CR>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)

"Ted creeps in, looks left, turns right
imap JJ <Esc>
colorscheme palenight
""highlight Normal guibg=#101010 guifg=white
""highlight CursorColumn guibg=#202020
""highlight Keyword guifg=#FFAB52
""highlight CursorLine guibg=#202020
hi clear CocHighlightText
hi CocHighlightText guibg=#072004
