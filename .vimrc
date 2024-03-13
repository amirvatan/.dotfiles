
filetype plugin indent on
set nocompatible
set autowrite
set autowriteall
set noshowmode
set autoindent
set hlsearch 
set ignorecase
set incsearch
set smartcase
set encoding=utf-8
set noswapfile
set linebreak
syntax enable
set wildmenu
set relativenumber
set noerrorbells
set novisualbell
set title
set foldmethod=indent
set backspace=indent,eol,start
set foldnestmax=2
set backupdir=~/.cache/vim
set history=1000
set clipboard=unnamedplus,unnamed
set background=dark
set guicursor+=a:blinkon0
set guifont=Fira\ Code\ 12
set laststatus=2
set path+=**
" remap keys
nmap <F8> :TagbarToggle<CR>
imap jj <ESC>
nnoremap ; :
let mapleader = " "
nnoremap <leader>e :NERDTreeToggle<CR>
autocmd FileType * nnoremap <nowait> <buffer> <leader>w :w<CR>
"noremap <nowait> <leader>w :w<CR>
nnoremap <leader>f <Plug>(easymotion-bd-fn)
nnoremap <leader>s <Plug>(easymotion-bd-w)
nnoremap <leader>j <Plug>(easymotion-bd-jk)
map <C-h> <C-w>h
map <C-j> <C-w>j

"Keybindings for tab navigation with leader and number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <leader>x :tabclose<Cr>
" global settings
let g:NERDCreateDefaultMappings = 1
" vimwiki config
let g:vimwiki_global_ext = 0
let g:vimwiki_root_dir = '$HOME/vimwiki/'
" disable difault mapping for easymotion
let g:EasyMotion_do_mapping = 0 

let g:floaterm_keymap_toggle = '<F12>'
let g:vimspector_base_dir='/home/amir/.vim/plugged/vimspector' 
" plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'stevearc/vim-arduino'
Plug 'voldikss/vim-floaterm'
Plug 'https://github.com/preservim/tagbar.git'
Plug 'puremourning/vimspector'
Plug 'junegunn/fzf'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" use gruvbox for vim theme
autocmd vimenter * ++nested colorscheme gruvbox
" Exit Vim if NERDTree is the only window remaining in the only tab.
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "\<c-h>"


" format pythn files on save
aug c 
  au!
  au BufWrite *.c call CocAction('format')
aug END
autocmd filetype c nnoremap <leader>cf :!gcc % -ggdb -o %:r <CR><CR>
"au FileType c set makeprg=gcc\ -g\ -o\ %:r\ %\ <CR>\ <CR>

" debug Keybindings
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dx :call vimspector#Reset()<CR>
nnoremap <F10> :call vimspector#StepInto()<CR>
nnoremap <F11> :call vimspector#StepOut()<CR>
nnoremap <nowait> <F9> :call vimspector#ToggleBreakpoint()<CR>
nnoremap <F9><F9> :call vimspector#ClearBreakpoints()<CR>




" arduino Keybindings

"
" Change these as desired
nnoremap <buffer> <leader>aa <cmd>ArduinoAttach<CR>
nnoremap <buffer> <leader>ac <cmd>ArduinoVerify<CR>
nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
nnoremap <buffer> <leader>acu <cmd>ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>as <cmd>ArduinoSerial<CR>
nnoremap <buffer> <leader>ab <cmd>ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap <cmd>ArduinoChooseProgrammer<CR>



" setting for vim arduino
let g:arduino_build_path = "{project_dir}/build"
let g:arduino_board = 'arduino:avr:mega'
let g:arduino_serial_port = '/dev/ttyUSB0'
let g:arduino_serial_baud = 9600
let g:arduino_serial_cmd = 'screen {port} {baud}'
