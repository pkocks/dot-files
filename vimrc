
set nocompatible

set viminfo='1000,%

" Use Pathogen to manage plugins
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" Set backup directory for ~ files
set backup
set backupdir=~/tmp/.vim/backup,/tmp
set directory=~/tmp/.vim/tmp

" Color settings
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
set t_Co=256
" g:solarized_termcolors= 16 | 256 
let g:solarized_termcolors=256
" g:solarized_termtrans = 0 | 1 
let g:solarized_termtrans=1
" g:solarized_degrade = 0 | 1 
" g:solarized_bold = 1 | 0 
" g:solarized_underline = 1 | 0 
" g:solarized_italic = 1 | 0 
" g:solarized_contrast = “normal”| “high” or “low” 
" g:solarized_visibility= “normal”| “high” or “low”
call togglebg#map("<leader>l")
colorscheme solarized


set expandtab
set autoindent
set softtabstop=4
set shiftwidth=4
set scrolljump=5
set scrolloff=3
set backspace=2
set ruler
set number
" set foldmethod=indent

" Better searching
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Be nice and quiet
" set noerrorbells
set visualbell
" set t_vb to empty do disable visualbell flashing / # t = terminal
" set t_vb=

" make it easy to reload .vimrc
:nmap <Leader>s :source $MYVIMRC

" Easy to clear searches
nnoremap <leader><space> :noh<cr>


" Turn on mouse support in xterm
set mouse=a

" Turn on relative number support
" set relativenumber

" Turn on undo file
" set undofile


" Commenting with EnhancedCommentify
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
let g:EngCommentifyMultiPartBlocks = 'Yes'
let g:EnhCommentifyUseBlockIndex = 'Yes'


" Obvious Mode
set laststatus=2
let g:obviousModeInsertHi = 'term=reverse ctermbg=1'

" tags
set tags+=~/.vim/tags/cpp

" Omnifunc / Omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


" Open and close all the three plugins on the same time 
" nmap <F8>   :TrinityToggleAll<CR> 
" Open and close the srcexpl.vim separately 
" nmap <F9>   :TrinityToggleSourceExplorer<CR> 
" Open and close the taglist.vim separately 
" nmap <F10>  :TrinityToggleTagList<CR> 
" Open and close the NERD_tree.vim separately 
" nmap <F11>  :TrinityToggleNERDTree<CR>

" Set up toggles for Taglist and NERDTree
nmap <F2>  :TlistToggle<CR> 
nmap <F3>  :NERDTreeToggle<CR>

let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces=1
let g:NERDDefaultNesting=0
let g:NERDTreeWinPos = 'right'

" Set paste mode
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>
set showmode

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Attach 'run this file' with the shebang to F5
au BufEnter *
\if match( getline(1) , '^\#!') == 0 |
\ execute("let b:interpreter = getline(1)[2:]") |
\endif

fun! CallInterpreter()
    if exists("b:interpreter")
         exec ("!".b:interpreter." %")
    endif
endfun

" map <F5> :call CallInterpreter()<CR>

"
" Mappings
"
" Get out of insert mode quickly
" inoremap kj <Esc>
" move by 10 with control
nnoremap <C-h> 10h
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <C-l> 10l
" move to next buffer on the screen quickly
nnoremap <leader>h :bnext<CR>


" Set paste mode
nnoremap <leader>v :set invpaste paste?<CR>
set pastetoggle=<leader>v
set showmode

" Let scripts autoinstall
let g:GetLatestVimScripts_allowautoinstall=1
