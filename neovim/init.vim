"Plug  Turn on line numbers
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

set number
set directory=~/.vim-swap/

set hidden
set updatetime=300
set clipboard+=unnamedplus
set shortmess+=c

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Install Plugins

call plug#begin()
" Languages 
"
Plug 'sheerun/vim-polyglot'
" Javascript Plugins
"
Plug 'Galooshi/vim-import-js'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
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
"
" Coc 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"
" Utilities
"
"Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdcommenter'
" Colorscheme
"
Plug 'ryanoasis/vim-devicons'
" Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'vhakulinen/gnvim-lsp'
Plug '907th/vim-auto-save'


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



let g:material_theme_style = 'darker'
let g:airline_theme = 'onedark'
let g:material_terminal_italics = 1

colorscheme material
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set encoding=UTF-8
set t_Co=256
set termguicolors
set guifont=Monospace:h10

let g:workspace_session_name = '.session'
let g:workspace_autosave = 0

"if exists('&signcolumn')  " Vim 7.4.2201
"  set signcolumn=yes
"else
"  let g:gitgutter_sign_column_always = 1
"endif
"let g:gitgutter_enabled = 1
"let g:gitgutter_async = 0

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
nnoremap <Space>e :Buffers<CR>

nnoremap <Leader>gz :CocCommand git.chunkUndo<CR>
nnoremap <Leader>gn <Plug>(coc-git-nextchunk)<CR>
nnoremap <Leader>gp <Plug>(coc-git-prevchunk)<CR>

nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

nmap <Space><Space> :Files<CR>

map <C-n> :tabnew<CR>

map <Leader>l :BLines<CR>
map <Leader>\ :NERDTreeToggle<CR>
map <Leader>/ :NERDTreeFind<CR><C-W>w

map <Esc><Esc> :noh<CR>

map <Space>f :Prettier<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Git keymapping 
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)

nnoremap <silent> <space>g  :<C-u>CocList --normal gstatus<CR>

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>i  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>l  :<C-u>CocList<CR>


nnoremap <silent> <space>. :Files <C-R>=expand('%:h')<CR><CR>
" Search Configurations
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


let g:NERDSpaceDelims = 1

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Javascripts Configurations
"
let g:prettier#autoformat = 1
let g:javascript_plugin_flow = 1
let g:flow#enable = 1

let g:jsx_ext_required = 0

let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set undofile
set undodir=~/.vim/.undodir/
