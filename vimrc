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
set t_Co=256

set nocompatible " Required
filetype off     " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'tpope/vim-surround.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
"Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'hashivim/vim-packer'
Plugin 'rodjek/vim-puppet'
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-vagrant'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'L9'

au BufReadPost *.twig colorscheme koehler 
au BufReadPost Dockerfile colorscheme molokai
au BufReadPost assemble colorscheme molokai
au BufReadPost run colorscheme molokai
au BufReadPost *.css colorscheme slate 
au BufReadPost *.cfg colorscheme monokai
au BufReadPost *.erb colorscheme molokai
au BufReadPost *.go colorscheme molokai
au BufReadPost *.pke.hcl colorscheme molokai
au BufReadPost *.hcl colorscheme molokai
au BufReadPost *.html colorscheme monokai
au BufReadPost *.j2 colorscheme molokai
au BufReadPost *.json colorscheme molokai
au BufReadPost *.js colorscheme elflord 
au BufReadPost *.java colorscheme monokai
au BufReadPost *.pkr.hcl colorscheme molokai
au BufReadPost *.php colorscheme two2tango
au BufReadPost *.pp colorscheme molokai
au BufReadPost Puppetfile colorscheme molokai
au BufReadPost *.py colorscheme molokai
au BufReadPost Makefile colorscheme molokai
au BufReadPost Rakefile colorscheme molokai
au BufReadPost *.rb colorscheme molokai
au BufReadPost *rc colorscheme molokai
au BufReadPost *.sh colorscheme molokai
au BufReadPost *.tf colorscheme molokai
au BufReadPost *.tfvars colorscheme cleanroom
au BufReadPost Vagrantfile colorscheme molokai
au BufReadPost vimrc colorscheme molokai
au BufReadPost *.vimrc colorscheme molokai
au BufReadPost *.yaml colorscheme molokai
au BufReadPost *.yml colorscheme molokai

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
let g:terraform_align=1

call vundle#end()
filetype plugin indent on

