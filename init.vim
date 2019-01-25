"Plug  Turn on line numbers
set rtp+=/usr/local/opt/fzf
set number
set directory=~/.vim-swap/

set hidden
set updatetime=200
" Install Plugins

call plug#begin()
" Languages 
"
Plug 'sheerun/vim-polyglot'
" Javascript Plugins
"
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'Galooshi/vim-import-js'
Plug 'ternjs/tern_for_vim'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
" Navigation Plugins
"
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Sessions
"
Plug 'mhinz/vim-startify'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc'
"Plug 'thaerkh/vim-workspace'
" Utilities
"
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdcommenter'
" Colorscheme
"
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'

call plug#end()

" Configurations
"

set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

let mapleader=","

set mouse=a
set nofoldenable    " disable folding
set background=dark

colorscheme onedark
let g:airline_theme = 'onedark'
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

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" Keymapping
"
nmap <Leader>n  :tabnext<CR>
nmap <Leader>p  :tabprevious<CR>

" Move to the previous buffer with "gp"
nnoremap [[ :bp<CR>
" Move to the next buffer with "gn"
nnoremap ]] :bn<CR>
nnoremap <Leader>w :bd<CR>
nnoremap <Leader>e :Buffers<CR>

nnoremap <Leader>gz :GitGutterUndoHunk<CR>
nnoremap <Leader>gn :GitGutterNextHunk<CR>
nnoremap <Leader>gp :GitGutterPrevHunk<CR>

nmap <Leader><Space> :GFiles<CR>

map <C-n> :tabnew<CR>

map <Leader>l :BLines<CR>
map <Leader>\ :NERDTreeToggle<CR>

map <Space>f :Prettier<CR>

" Search Configurations
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


let g:NERDSpaceDelims = 1

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Javascripts Configurations
"
"
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

let g:ale_sign_column_always = 1
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_lint_delay = 200
let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '∆'
let g:ale_fix_on_save = 0

let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

