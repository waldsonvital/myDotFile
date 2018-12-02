"PLUGINS
"
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "busca em palavra dentro do arquivo precisa do https://github.com/ggreer/the_silver_searcher instalado
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'elentok/plaintasks.vim'
Plug 'scrooloose/nerdtree-git-plugin'
Plug 'matze/vim-move'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'
Plug 'universal-ctags/ctags'
Plug 'mhartington/oceanic-next'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'joshdick/onedark.vim'
Plug 'StanAngeloff/php.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/goyo.vim' "free distraction mode :Goyo
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

"CONFIGS NVIM
syntax enable
filetype plugin indent on
"colorscheme OceanicNext
"colorscheme gruvbox
colorscheme PaperColor
"colorscheme onedark
"set background=dark
set background=light
set foldmethod=syntax
"set nofoldenable
set foldnestmax=2
set foldlevel=1
set encoding=UTF-8
set hidden
set number
set mouse=a
set inccommand=split
set tabstop=4
set softtabstop=0
set shiftwidth=4
set sw=4
set expandtab
set cursorline
set wrap
set linebreak
set nolist  " list disables linebreak
set laststatus=2
set ruler
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/./config/nvim/undo//
set showmatch

set autochdir "para dar path complete com o deoplete

let mapleader="\<space>"
let g:indentLine_setColors = 0

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set statusline+=%F

hi htmlArg gui=italic cterm=italic
hi Comment gui=italic cterm=italic

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"corregindoidentação html
"au BufEnter,BufNew *.php :set filetype=html

" navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

"seleciona tudo
noremap <C-a> <esc>ggVG<CR>

"nnoremap <leader>ff gg=G<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>


map <CR> o<ESC>
"nnoremap <leader><leader> o<ESC>
imap <C-S> <ESC>:w<CR>a
map  <C-S> :w<CR>a

""COPY to clipboard
vmap <C-c> "+y

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

vnoremap > >gv
vnoremap < <gv

autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

"config deoplete
let g:deoplete#enable_at_startup = 1

let g:move_key_modifier = 'D'
let g:UltiSnipsExpandTrigger="<c-j>"

let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let g:NERDTreeShowHidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
map <C-b> :NERDTreeToggle<CR>
"autocmd VimEnter * silent NERDTree | wincmd p

let g:phpcd_php_cli_executable = 'php'

"""BUffertabs
"let g:buftabline_show=2

" jsx
let g:jsx_ext_required = 0
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:gruvbox_contrast_dark = 'hard'

let g:syntastic_php_checkers = ['php']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_rust_checkers = ['rustc']

"let g:airline#extensions#tabline#enabled = 1
let g:easygit_enable_command = 1


let g:mta_filetypes = {
    \ 'js' : 1,
    \ 'php' : 1,
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [['lineinfo', 'syntastic'],
      \             ['fileformat','filetype', 'fileencoding']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ }

