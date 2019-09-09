"Plug  Turn on line numbers
set rtp+=/usr/local/opt/fzf
set number
set directory=~/.vim-swap/

set hidden
set updatetime=50
" set clipboard=unnamed
set clipboard+=unnamedplus
set complete-=.

set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set list

set numberwidth=1
let g:vn_font = 'SauceCodePro Nerd Font'
let g:vn_explorer_ignore_dirs = ['.git']
let g:vn_workspace_ignore_dirs = ['build', 'dist']

" Install Plugins

call plug#begin()
" Languages 
"
" Javascript Plugins
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'flowtype/vim-flow'
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-denite'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-dotenv'
" Navigation Plugins
"
Plug 'severin-lemaignan/vim-minimap'
Plug 'Shougo/denite.nvim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'liuchengxu/vista.vim'
" Sessions
"
" Plug 'mhinz/vim-startify'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc'
"Plug 'thaerkh/vim-workspace'
" Utilities
"
"
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdcommenter'
" Colorscheme
"
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'

call plug#end()

" Configurations
"

let g:dbext_default_profile_pgsql='type=PGSQL:user=postgres:host=localhost:port=5432:dbname=picards'
let g:dbext_default_profile = 'pgsql'

nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)

let g:db_session_header = ''
let g:db_session_on=1

command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd CursorHold * silent call CocActionAsync('doHover')

autocmd BufEnter * if &filetype == "" | setlocal ft=javascript | endif


au BufRead,BufNewFile *.dbout set filetype=tablengen
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


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
  else
  call CocAction('doHover')
     endif
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

vmap <space>f  <Plug>(coc-format-selected)
nmap <space>f  <Plug>(coc-format-selected)

set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline


let mapleader=","

set mouse=a
set nofoldenable    " disable folding
set background=dark

let g:airline_theme = 'minimalist'
let b:airline_whitespace_disabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#left_sep = "\ue0b0 "
let g:airline#extensions#tabline#left_alt_sep = "\ue0b1"

let g:material_theme_style = 'darker'

colorscheme material

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set encoding=UTF-8
set t_Co=256
set termguicolors

let g:workspace_session_name = '.session'
let g:workspace_autosave = 0

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_enabled = 1
let g:gitgutter_async = 1

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" augroup NERD
    " au!
    " autocmd VimEnter * NERDTree
    " autocmd VimEnter * wincmd p
" augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif



" Vista Configurations

let g:vista_icon_indent = ["▸ ", ""]
let g:vista_default_executive = 'coc'


function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" Keymapping
"
"

nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" " show commit contains current position
nmap gc <Plug>(coc-git-commit)

nnoremap <TAB><TAB> <C-w>w

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

inoremap <M-Left> <C-o>b
inoremap <M-Right> <C-o>w
nnoremap <M-Left> b
nnoremap <M-Right> w

inoremap <S-Left> <C-o>^
inoremap <S-Right> <C-o>$
vnoremap <S-Left> <C-o>^
vnoremap <S-Right> <C-o>$
nnoremap <S-Left> ^
nnoremap <S-Right> $

map <M-v> <Esc>p
nmap <Leader>n  :tabnext<CR>
nmap <Leader>p  :tabprevious<CR>

" Move to the previous buffer with "gp"
nmap <Leader>[ :bprevious<CR>
" Move to the next buffer with "gn"
nmap <Leader>] :bnext<CR>
nnoremap <leader>w :bp<cr>:bd #<cr>
nnoremap <Leader>e :History<CR>

nnoremap fix :<C-u>CocCommand eslint.executeAutofix<CR>
nnoremap <C-l> :<C-u>CocList<CR>

nnoremap <Leader>gz :CocCommand git.chunkUndo<CR>

nnoremap <Leader>\\ :NERDTreeFind<CR>

nmap <C-f> <Plug>(easymotion-overwin-f2)

nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP


tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

map <C-n> :enew<CR>

command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 1.. '}, 'up:50%', '?'),
    \   1)


map <Leader>l :LinesWithPreview<CR>
map <Leader>L :Lines<CR>
map <Leader>/ :Ag<CR>
" map <Leader>\ :NERDTreeToggle<CR>
" map <Leader>/ :NERDTreeFind<CR><C-W>w

map <Esc><Esc> :noh<CR>

map <Space>f :Prettier<CR>

nmap gD :FlowJumpToDef<CR>
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>f :<C-U>CocList files<cr>
nnoremap <silent> <space>o  :Vista finder<cr>
nnoremap <silent> <space>e  :<C-u>CocList mru<cr>
"DB keymap

au FileType sql vnoremap <S-e> <Esc>:call DBVisualExec()<cr>
au FileType sql nnoremap <S-f> <Esc>:call DBFindFunction()<cr>
au FileType sql vnoremap <S-q> <Esc>:call DBSessionAssign()<cr>


" Search Configurations
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


let g:NERDSpaceDelims = 1

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''


let g:javascript_plugin_flow = 1

let g:flow#showquickfix = 0
let g:flow#enable = 1

let g:jsx_ext_required = 0

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'FZFBg'],
\ 'hl':      ['fg', 'ModeMsg'],
\ 'fg+':     ['fg', 'Normal'],
\ 'bg+':     ['bg', 'FZFBgP'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['bg', 'PmenuThumb'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

set undofile
set undodir=~/.vim/.undodir/

nnoremap <leader>f :call Fzf_dev()<CR>

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
    let l:filename = fnamemodify(l:candidate, ':p:t')
    let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
    call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
endfunction
" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "awk \"{print $2}\" | bat --theme="Material-Theme-Custom" --color always {2..-1}"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run(fzf#wrap({
  \ 'source': <sid>files(),
  \ 'sink':   function('s:edit_file'),
  \ 'options': l:fzf_files_options }))

endfunction

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('right:50%:hidden', '?')
  \           : fzf#vim#with_preview('up:60%'),
  \   <bang>0)


let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns) * 9 / 10
  let x = float2nr((&columns - width) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
  \ 'relative': 'editor',
  \ 'row': height * 0.3,
  \ 'col': x,
  \ 'width': width,
  \ 'height': height / 2
  \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
  \ buftype=nofile
  \ nobuflisted
  \ bufhidden=hide
  \ nonumber
  \ norelativenumber
  \ signcolumn=no
  return win
endfunction

command! -bang -nargs=* GdiffFiles call Git_DiffFiles(<q-args>)

function! Git_DiffFiles(...)
    " Get the commit hash if it was specified
    let commit = a:0 == 0 ? '' : a:1
    call fzf#run(fzf#vim#with_preview(fzf#wrap({'source': 'git diff --name-only '.commit})))
endfunction

let g:fzf_default_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'Gvdiffsplit'}

function! DBGetVisualSelection() abort
  try
  let a_save = @a
  silent! normal! gv"ay
  return @a
  finally
  let @a = a_save
  endtry
endfunction

function! DBVisualExec()
	let log_level_error = "do $$\nbegin\n"
	let log_level_notice = "end$$;\n\\timing\n"
	execute ":DBExecSQL ".log_level_error.g:db_session_header.log_level_notice."\n".DBGetVisualSelection()."\n"
endfunction

function! DBSessionAssign()
	let g:db_session_header=DBGetVisualSelection()
endfunction

function! DBSesssionToggle()
	let g:db_session_on=!g:db_session_on
endfunction

function! DBSessionClear()
	let g:db_session_header=""
endfunction

function! DBFindFunction()
	execute ":DBExecSQL select prosrc from pg_proc where proname = '".expand("<cword>")."'\n"
endfunction 

highlight Pmenu guibg=#202040
highlight Visual guibg=#216583
highlight Search guibg=#01579b
highlight FZFBg guibg=#202020
highlight FZFBgP guibg=#203080
