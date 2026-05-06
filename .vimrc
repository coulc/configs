set completeopt=menuone,noinsert,noselect
set clipboard=unnamed,unnamedplus
set nobackup
set noswapfile
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set wildmenu
set number
set relativenumber
set scrolloff=5
set autoindent
set smartindent

colorscheme habamax
set background=dark
syntax enable 
filetype plugin indent on

" ----- vim-plug -----
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim',{'branch': 'release', 'do': 'yarn install --frozen-lockfile'}  
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ryanoasis/vim-devicons' 
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify', { 'tag': 'legacy' }

call plug#end()

" ----- keybinding -----
inoremap jk <ESC>
vnoremap jk <ESC>

nnoremap <silent> <Space>sv :vsplit<CR>
nnoremap <silent> <Space>sh :split<CR>
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l

nnoremap <silent> <Space>sc :close<CR> nnoremap <silent> <Space>so :only<CR>

nnoremap <space>bn :bnext<CR>
nnoremap <space>bp :bprev<CR>
nnoremap <space>bb :buffers<CR>:buffer<Space>
nnoremap <space>bd :bdelete<CR>

" ----- augroup -----
augroup DisableAutoCommentFormat
  autocmd!
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o formatoptions-=c
augroup END

" ----- plugin keybinding -----
" coc
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm(): "\<TAB>"
inoremap <silent><expr> <CR> "\<CR>"
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> gd :call CocAction('jumpDefinition')<CR>
nnoremap <silent> gr :call CocAction('jumpReferences')<CR>
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<Ignore>"
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<Ignore>"
nnoremap <silent> g[ <Plug>(coc-diagnostic-prev)
nnoremap <silent> g] <Plug>(coc-diagnostic-next)


" nerdtree
nnoremap <silent> <Space>e :NERDTreeToggle<CR>
" fzf
nnoremap <silent> <Space>ff :Files<CR>

" ----- plugin config -----
" nerdtree
let NERDTreeShowHidden = 1 
let NERDTreeQuitOnOpen = 1 
let NERDTreeMinimalUI = 1 
let NERDTreeDirArrows = 1 

