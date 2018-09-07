call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
" Plug 'pangloss/vim-javascript'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'vim-syntastic/syntastic'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'chun-yang/auto-pairs' 
Plug 'markonm/traces.vim'
Plug 'machakann/vim-sandwich'
" Plug 'ternjs/tern_for_vim'
call plug#end()
filetype plugin indent on

set nobackup
set nowb
set noswapfile
set lazyredraw
set hid 
set guifont=Hack
set sw=2
set ts=2
set expandtab
set number

" Make sure that coxnoremap <S-Tab> <gvursor is always vertically centered on j/k moves
"set so=999

" add vertical lines on columns
"set colorcolumn=81
" Make sure that coursor is always vertically centered on j/k moves
"set so=999
" Path to python interpreter for neovim

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 200
"let g:onedark_termcolors=16
syntax enable
colorscheme nord

set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set relativenumber
set mouse=a
set clipboard=unnamedplus

" mapping
imap jj <ESC>
let mapleader = " "
nnoremap <C-i> i <Esc>
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
imap <C-o> <esc>o
imap <C-a> <esc>A
inoremap <silent> <C-l> <esc>:TmuxNavigateRight<cr>
inoremap <silent> <C-h> <esc>:TmuxNavigateLeft<cr>
inoremap <silent> <C-j> <esc>:TmuxNavigateDown<cr>
inoremap <silent> <C-h> <esc>:TmuxNavigateUp<cr>
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k') 
nnoremap <leader>w :update<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>e :wq<cr>
nnoremap <silent> <leader>; :only<cr>

" Vimux mapping
let g:VimuxUseNearest = 1 " Use existing pane or window (not used by vim) if found instead of running split-window.
let g:VimuxPromptString = "Type command to run: "
nnoremap <silent> <Leader>rp :VimuxPromptCommand<CR>
nnoremap <silent> <Leader>rc :call VimuxRunCommand("clear")<CR>
nnoremap <silent> <Leader>rq :VimuxCloseRunner<CR>
nnoremap <silent> <Leader>rl :VimuxRunLastCommand<CR>
nnoremap <silent> <Leader>rz :VimuxZoomRunner<CR>
autocmd Filetype go nnoremap <silent> <buffer> <Leader>rr :update<Bar>:call VimuxPromptCommand('go run')<CR>
autocmd Filetype js nnoremap <silent> <buffer> <Leader>tr :update<Bar>:call VimuxPromptCommand('node')<CR>
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title

nmap <Enter> o<ESC>k
nmap <S-Enter> O<ESC>j
nmap <S-Space> O<ESC>j
 " plugin settings

" deoplete
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"NERDTree
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toggle NERDTree
map <silent> <C-n> :NERDTreeToggle %<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules'] 
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
"let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" go development

let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command                 = "goimports"
let g:go_def_mapping_enabled         = 1
let g:go_auto_type_info              = 0
let g:go_term_enabled                = 1
let g:go_info_mode                   = 'guru'
let g:go_gocode_autobuild            = 1

let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol ="∙∙"

" gometalinter configuration 
let g:go_metalinter_command = ""
"let g:go_metalinter_deadline = "20s"
"let g:go_metalinter_enabled = [
"    \ 'deadcode',
"    \ 'errcheck',
"    \ 'gas',
"    \ 'goconst',
"    \ 'gocyclo',
"    \ 'golint',
"    \ 'gosimple',
"    \ 'ineffassign',
"    \ 'vet',
"    \ 'vetshadow'
"    \]
let g:go_metalinter_autosave = 0
"let g:go_metalinter_autosave_enabled = ['gotype', 'vet', 'golint'] 

" ------------------------ lightbar settings ---------------------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ], 
      \              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'ok',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '|' }
      \ }

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ''
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
       return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
           \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
           \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

autocmd User ALELint call lightline#update()

" ale + lightline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d --', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d >>', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

function! s:syntastic()
  SyntasticCheck
    call lightline#update()
endfunction 
