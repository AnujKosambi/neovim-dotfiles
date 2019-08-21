"Plug  Turn on line numbers
set rtp+=/usr/local/opt/fzf
set number
set directory=~/.vim-swap/

set hidden
set updatetime=50
" set clipboard=unnamed
set clipboard+=unnamedplus
set complete-=.

set ignorecase
set smartcase
set list

let g:vn_font = 'SauceCodePro Nerd Font'
let g:vn_explorer_ignore_dirs = ['.git']
let g:vn_workspace_ignore_dirs = ['build', 'dist']

" Install Plugins

call plug#begin()
" Languages 
"
" Javascript Plugins

Plug 'mxw/vim-jsx'
Plug 'flowtype/vim-flow'
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-denite'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Navigation Plugins
"
Plug 'Shougo/denite.nvim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
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


command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd CursorHold * silent call CocActionAsync('highlight')

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


vmap <space>f  <Plug>(coc-format-selected)
nmap <space>f  <Plug>(coc-format-selected)

set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline


let mapleader=","

set mouse=a
set nofoldenable    " disable folding
set background=dark

let g:airline_theme = 'onedark'
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
let g:gitgutter_async = 0

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
map <M-v> <Esc>p
nmap <Leader>n  :tabnext<CR>
nmap <Leader>p  :tabprevious<CR>

" Move to the previous buffer with "gp"
nnoremap [[ :bprevious<CR>
" Move to the next buffer with "gn"
nnoremap ]] :bnext<CR>
nnoremap <leader>w :bp<cr>:bd #<cr>
nnoremap <Leader>e :Buffers<CR>

nnoremap fix :<C-u>CocCommand eslint.executeAutofix<CR>
nnoremap <C-l> :<C-u>CocList<CR>

nnoremap <Leader>gz :GitGutterUndoHunk<CR>
nnoremap <Leader>gn :GitGutterNextHunk<CR>
nnoremap <Leader>gp :GitGutterPrevHunk<CR>


nnoremap <Leader>\\ :NERDTreeFind<CR>

nmap <Leader><Leader>f <Plug>(easymotion-overwin-f2)

nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP


tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

map <C-n> :enew<CR>

map <Leader>l :BLines<CR>
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

let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set undofile
set undodir=~/.vim/.undodir/


highlight CursorLine guibg=black gui=bold


if exists('veonim')

let $PATH .= '/usr/local/opt/openssl/bin:/usr/local/opt/sqlite/bin:/usr/local/opt/qt/bin:/usr/local/opt/php@7.1/sbin:/usr/local/opt/php@7.1/bin:/Users/anujkosambi/Downloads/google-cloud-sdk/bin:./bin:/usr/local/bin:/usr/local/sbin:/Users/anujkosambi/.dotfiles/bin:/Users/anujkosambi/.rbenv/shims:/Users/anujkosambi/code/go/bin:/Users/anujkosambi/.nvm/versions/node/v10.15.0/bin:/Applications/CMake.app/Contents/bin:/Users/anujkosambi/.fastlane/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/aria2/bin:/opt/X11/bin:/Users/anujkosambi/tools:/Users/anujkosambi/Library/Android/sdk/platform-tools:/usr/local/bin:/usr/local/opt/fzf/bin'

" built-in plugin manager
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

" extensions for web dev
let g:vscode_extensions = [
  \'vscode.css-language-features',
  \'vscode.html-language-features',
\]

" multiple nvim instances
nno <silent> <c-t>c :Veonim vim-create<cr>
nno <silent> <c-g> :Veonim vim-switch<cr>
nno <silent> <c-t>, :Veonim vim-rename<cr>

" workspace functions
nno <silent> ,f :Veonim files<cr>
nno <silent> ,e :Veonim explorer<cr>
nno <silent> ,b :Veonim buffers<cr>
nno <silent> ,d :Veonim change-dir<cr>
"or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

" searching text
nno <silent> <space>fw :Veonim grep-word<cr>
vno <silent> <space>fw :Veonim grep-selection<cr>
nno <silent> <space>fa :Veonim grep<cr>
nno <silent> <space>ff :Veonim grep-resume<cr>
nno <silent> <space>fb :Veonim buffer-search<cr>

" language features
nno <silent> sr :Veonim rename<cr>
nno <silent> sd :Veonim definition<cr>
nno <silent> si :Veonim implementation<cr>
nno <silent> st :Veonim type-definition<cr>
nno <silent> sf :Veonim references<cr>
nno <silent> sh :Veonim hover<cr>
nno <silent> sl :Veonim symbols<cr>
nno <silent> so :Veonim workspace-symbols<cr>
nno <silent> sq :Veonim code-action<cr>
nno <silent> sk :Veonim highlight<cr>
nno <silent> sK :Veonim highlight-clear<cr>
nno <silent> ,n :Veonim next-usage<cr>
nno <silent> ,p :Veonim prev-usage<cr>
nno <silent> sp :Veonim show-problem<cr>
nno <silent> sw :Veonim next-problem<cr>
nno <silent> sb :Veonim prev-problem<cr>

endif



nnoremap <silent> <leader>f :call Fzf_dev()<CR>

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction



command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)



let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
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
endfunction

