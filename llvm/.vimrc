call plug#begin('~/.vim/plugged')
     Plug 'nanotech/jellybeans.vim'
     Plug 'preservim/nerdtree'
     Plug 'vim-airline/vim-airline'
     Plug 'tpope/vim-fugitive'
     Plug 'jistr/vim-nerdtree-tabs'
call plug#end()

color jellybeans
set number
syntax on

map <C-b> :NERDTreeToggle<CR>

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Close NERDTree after open file
" let NERDTreeQuitOnOpen = 1