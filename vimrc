"set background=dark
set hlsearch
set nu
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype on
filetype plugin indent on

syntax on

set nocompatible " Required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
"Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'hashivim/vim-packer'
Plugin 'rodjek/vim-puppet'
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-vagrant'
Plugin 'L9'
"
Plugin 'mattn/emmet-vim'
Plugin 'mhartington/oceanic-next'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jcherven/jummidark.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'jremmen/vim-ripgrep'
Plugin 'ryanoasis/vim-devicons'
Plugin 'metakirby5/codi.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'APZelos/blamer.nvim'

au BufReadPost *.twig colorscheme koehler 
au BufReadPost Dockerfile colorscheme molokai
au BufReadPost assemble colorscheme molokai
au BufReadPost run colorscheme molokai
au BufReadPost *.css colorscheme slate 
au BufReadPost *.cfg colorscheme monokai
au BufReadPost *.erb colorscheme molokai
au BufReadPost *.go colorscheme molokai
au BufReadPost *.hcl colorscheme molokai
au BufReadPost *.html colorscheme monokai
au BufReadPost *.j2 colorscheme molokai
au BufReadPost *.json colorscheme molokai
au BufReadPost *.js colorscheme elflord 
au BufReadPost *.java colorscheme monokai
au BufReadPost *.php colorscheme two2tango
au BufReadPost *.pp colorscheme molokai
au BufReadPost Puppetfile colorscheme molokai
au BufReadPost *.py colorscheme molokai
au BufReadPost Rakefile colorscheme molokai
au BufReadPost *.rb colorscheme molokai
au BufReadPost *rc colorscheme molokai
au BufReadPost *.sh colorscheme molokai
au BufReadPost *.tf colorscheme molokai
au BufReadPost *.tfvars colorscheme cleanroom
au BufReadPost Vagrantfile colorscheme molokai
"au BufReadPost vimrc colorscheme molokai
au BufReadPost vimrc colorscheme OceanicNext
au BufReadPost *.vimrc colorscheme molokai
"au BufReadPost *.yaml colorscheme molokai
au BufReadPost *.yaml colorscheme OceanicNext
au BufReadPost *.yml colorscheme molokai

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
let g:terraform_align=1

"
"colorscheme OceanicNext
set encoding=UTF-8
set guifont=Cousine\ Nerd\ Font,\ Regular

"nmap <F6> :NERDTreeToggle<CR>
nmap <C-B> :NERDTreeToggle<CR>
map <C-Up> :m -2<CR>
map <C-k> :m -2<CR>
map <C-Down> :m +1<CR>
map <C-j> :m +1<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"let NERDTreeShowHidden=1
"let NERDTreeQuiteOnOpen-1
"nnoremap d "_d
nnoremap c d
nnoremap C D
vnoremap c d
"nnoremap x "_x
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
set relativenumber
set ignorecase
let g:blamer_enabled = 1
let g:blamer_delay = 500
runtime macros/matchit.vim
"
"
call vundle#end()
filetype plugin indent on
