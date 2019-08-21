"PLUGINS
"
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "busca em palavra dentro do arquivo precisa do https://github.com/ggreer/the_silver_searcher instalado
Plug 'junegunn/fzf.vim'
Plug 'elentok/plaintasks.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'
Plug 'universal-ctags/ctags'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'StanAngeloff/php.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'mkusher/padawan.vim'
Plug 'rakr/vim-one'
Plug 'junegunn/goyo.vim' "free distraction mode :Goyo
Plug 'fenetikm/falcon'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-rooter'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

"CONFIGS NVIM
syntax enable
filetype plugin indent on
set termguicolors     " enable true colors support
set t_Co=256
"colorscheme falcon
colorscheme PaperColor
set background=light
set foldmethod=syntax
set foldnestmax=2
set foldlevel=1
set encoding=UTF-8
set number
set mouse=a
set inccommand=split
set tabstop=4
set softtabstop=0
set shiftwidth=4
set linespace=3
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
set nolist
set autochdir "para dar path complete com o deoplete
set redrawtime=10000

let mapleader="\<space>"
let g:indentLine_setColors = 0
let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
let &colorcolumn="120,".join(range(400,999),",")

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set statusline+=%F

let g:better_whitespace_enable = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

let g:falcon_lightline = 1

if has("gui_running")
    set antialias
end

hi htmlArg gui=italic cterm=italic
hi Comment gui=italic cterm=italic

autocmd BufEnter * :syntax sync fromstart

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"increment and decrement numbers
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent>         <C-a> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <Leader><C-a> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>

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

nnoremap <c-b> :CtrlPBuffer<cr>
nnoremap <c-f> :Ag<space>

"seleciona tudo
"noremap <C-a> <esc>ggVG<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"move linhas
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

map <CR> o<ESC>
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

"let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'dart': ['ale-dart-dartanalyzer'],
\}

"let g:lsc_server_commands = {'dart': 'dart_language_server'}
"let dart_style_guide = 4
"let dart_format_on_save = 0
"let g:lsc_server_commands = {'dart': 'dart /usr/local/opt/dart/libexec/bin/snapshots/analysis_server.dart.snapshot --lsp'}
"let g:lsc_auto_map = v:true " Use defaults

let g:mta_use_matchparen_group = 1

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

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
map <C-n> :NERDTreeToggle<CR>
"autocmd VimEnter * silent NERDTree | wincmd p

let g:phpcd_php_cli_executable = 'php'

"""BUffertabs
let g:buftabline_show=2

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

set statusline+=%*

"let g:gruvbox_contrast_dark = 'hard'
let g:enable_bold_font = 1
let g:enable_italic_font = 1
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

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

"let g:lightline.colorscheme = 'falcon'
let g:lightline = {
      \ 'enable': { 'tabline': 1 },
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [['lineinfo'],
      \             ['fileformat','filetype', 'fileencoding']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ }


""********* COC AUTO COMPLETE *************""
"por enquanto vou desabilitar auto complte em dart
"autocmd FileType dart let b:coc_suggest_disable = 1
"
"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
""********** FIM COC **********************""
