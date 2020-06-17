set encoding=utf-8
" setting
if has('vim_starting')
  set nocompatible
endif

filetype off
filetype indent plugin off


if !filereadable(expand('~/.vim/autoload/plug.vim'))
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

" plugin
call plug#begin(expand('~/.vim/plugged'))
"" color iceberg
Plug 'cocopon/iceberg.vim'
"" kakko
Plug 'cohama/lexima.vim'
"" space + ne -> sidebar
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"" ga -> align
Plug 'junegunn/vim-easy-align'
"" space + go -> exec script
Plug 'thinca/vim-quickrun'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"" gcc -> comment
Plug 'tpope/vim-commentary'
"" option bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" auto bracket
Plug 'Raimondi/delimitMate'
"" sorround by S-key
Plug 'tpope/vim-surround'
"" error detect
Plug 'scrooloose/syntastic'
"" delete white space
Plug 'bronson/vim-trailing-whitespace'
"" auto complete
" Plug 'sheerun/vim-polyglot' " I don't want to use this plugin.
" Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ryanolsonx/vim-lsp-python'
" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'roxma/nvim-yarp'
endif

Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'deoplete-plugins/deoplete-jedi'

"" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
"" javascript
Plug 'jelera/vim-javascript-syntax'
"" php
Plug 'arnaud-lb/vim-php-namespace'
"" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
"" space + sh -> vimshell
Plug 'Shougo/vimshell.vim'
" icons
Plug 'ryanoasis/vim-devicons'
"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()
filetype plugin indent on
let mapleader="/<Space>"
"

let mapleader="\<Space>"
"" vim-lsp
let g:lsp_diagnostics_enabled = 1
"" fix tab order
let g:SuperTabDefaultCompletionType = '<C-n>'
""  python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config' : {
        \    'pyls': {
        \        'plugins': {
        \            'jedi_definition': {
        \                'follow_imports': v:true,
        \                'follow_builtin_imports': v:true
        \    },
        \ }}}
        \})
endif

" deoplete
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.

"  deo-jedi
"  add path to 'anaconda python'
let g:deoplete#sources#jedi#python_path = '/home/tanaka/anaconda3/bin/python3.7'
" This python is used for only complete
" The vim is compiled by '/usr/local/python3.6'
" So use '/usr/local/python3.6 -m pip install ......'

" For python language server
" if (executable('pyls'))
"     let s:pyls_path = fnamemodify(g:python_host_prog, ':h') . '/'. 'pyls'
"     augroup LspPython
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"       \ 'name': 'pyls',
"       \ 'cmd': {server_info->['pyls']},
"       \ 'whitelist': ['python']
"       \ })
"     augroup END
" endif


"" icons
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '⚠'}
let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'} " icons require GUI

" linter
" let g:lsp_signs_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_signs_error = {'text': '✗'}
" let g:lsp_signs_warning = {'text': '‼', 'icon': '/path/to/some/icon'}
" let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'}

"" youcompleteme
" let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
" let g:ycm_python_binary_path = '/usr/bin/python3.6'
" let g:ycm_auto_trigger = 1
" let g:ycm_min_num_of_chars_for_completion = 1
" let g:ycm_complete_in_comments = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_max_num_candidates = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_disable_signature_help = 1 " if this param on, disale signature[ID] why?
" " but vim cannot complete signature
" set completeopt-=preview
" set completeopt-=menu
" set completeopt-=menuone
" set completeopt-=longest
" let g:ycm_add_preview_to_completeopt = 0
" let g:make = 'gmake'
" if exists('make')
"   let g:make = 'make'
" endif

"" color
" colorscheme evening " カラースキームにicebergを設定する
colorscheme iceberg " カラースキームにicebergを設定する

" vim-airline
let g:airline_theme = 'iceberg'  "iceberg's color is going bad.(200603)
" let g:airline_theme = 'bubblegum'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"" nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <Leader>dir :NERDTreeTabsToggle<CR>
autocmd BufWritePre * :FixWhitespace

"" quickrun
nnoremap <Leader>go :QuickRun<CR>
let g:quickrun_config={'*': {'split': ''}}

"" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" vimshell
"" nnoremap <Leader>sh :VimShellPop<CR>
nnoremap <Leader>sh :vertical terminal<CR>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

"" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
"" Do syntaxtic_check if filetype was setted to hoge
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['hoge']
    \}

"" jedi-vim
" let g:jedi#auto_initialization = 0
let g:jedi#popup_on_dot = 1
" let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = 2
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 1
let g:jedi#force_py_version = 3
autocmd FileType python setlocal completeopt-=preview "" not dotcasting

"" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
let g:polyglot_disabled = ['python']
" let g:polyglot_disabled = ['csv']
let python_highlight_all = 1

"" vim-airline
let g:airline#extensions#virtualenv#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = ''
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_se          = ''
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  "
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" function
"" xaml
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"" python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" shortcut leader=Space
"" save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>qqq :q!<CR>
nnoremap <Leader>eee :e<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>nn :noh<CR>

"" split
nnoremap <Leader>s :<C-u>split<CR>
nnoremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <Leader>t :tabnew<CR>

"" ignore wrap
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

"" Sft + y => yunk to EOL
nnoremap Y y$

"" + => increment
nnoremap + <C-a>

"" - => decrement
nnoremap - <C-x>

"" pbcopy for OSX copy/paste
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

"" move line/word
nmap <C-e> $
nmap <C-a> 0
nmap <C-f> W
nmap <C-b> B
imap <C-e> <C-o>$
imap <C-a> <C-o>0
imap <C-f> <C-o>W
imap <C-b> <C-o>B

" base
set fileencoding=utf-8
set fileencodings=utf-8
set ambiwidth=double " □や○文字が崩れる問題を解決
scriptencoding utf-8
set bomb
set binary
set ttyfast
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅
set expandtab
set splitright
set splitbelow
set hidden
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set cursorline " カーソルラインをハイライト
set termguicolors  " more blue color

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"カーソルの最終編集位置へ
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
set showmatch " 括弧の対応関係を一瞬表示する
set matchtime=1 " 0.1秒だけ
"let loaded_matchparen=1 止めるとき
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
"hi MatchParen ctermbg=1"
hi MatchParen term=standout ctermbg=Black ctermfg=LightGrey guibg=Black guifg=LightGrey

set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set fileformats=unix,dos,mac
syntax on
set ruler
set number
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数
set gcr=a:blinkon0
set scrolloff=3
set laststatus=2
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set modeline
set modelines=10
set pumheight=10    "if value is 0 , show menu all
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set autoread
set noerrorbells visualbell t_vb=
set clipboard+=unnamed,autoselect
set mouse=a
set whichwrap=b,s,h,l,<,>,[,]
set t_Co=257 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける
"highlight Pmenu ctermbg=233 ctermfg=241
"highlight PmenuSel ctermbg=233 ctermfg=166
"highlight Search ctermbg=166 ctermfg=233
"highlight Visual ctermbg=166 ctermfg=233

"command #these names are able to change.

command Dir NERDTree
command Vsh vertical terminal
command Run QuickRun
command Sfg setfiletype gnuplot

autocmd BufNewFile,BufRead *.dat setfiletype gnuplot
autocmd BufNewFile,BufRead *.gp setfiletype gnuplot
autocmd BufNewFile,BufRead *.in setfiletype conf
" gnuplot is using # as comment and vi don't check syntax
" autocmd BufNewFile,BufRead *.prm setfiletype gnuplot
" autocmd BufNewFile,BufRead *.txt setfiletype txt
"filetype plugin indent off

" NERDTree
if !argc()
    autocmd vimenter * NERDTree|normal gg3j
endif

" autocmd FileType python setlocal omnifunc=jedi#completions
" this statement is needed
let g:csv_delim=','
filetype plugin indent on
" if set filetype=="csv"
"     autocmd setfiletype conf
" endif
"
" autocmd BufReadPost * tab ball " open by tab
" nnoremap tt gt
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=235 guibg=#2c2d27

