
set nocompatible

set viminfo='1000,%
set runtimepath+=~/dotfiles/vim/vim/ultisnips_rep 

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
let g:solarized_termtrans=0
" g:solarized_degrade = 0 | 1 
" g:solarized_bold = 1 | 0 
" g:solarized_underline = 1 | 0 
" g:solarized_italic = 1 | 0 
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
highlight Cursor gui=reverse guifg=NONE guibg=NONE


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

if has('gui_running')
   nnoremap <silent> <C-c> :close<CR>
endif
" make it easy to reload .vimrc
:nmap <Leader>s :source $MYVIMRC

" Easy to clear searches
nnoremap <leader><space> :noh<cr>

" Easy to display Yank Ring
:nnoremap <silent> <F10> :YRShow<CR>

" make it easy to switch to last buffer
:nmap <Leader>3 :e #<cr>

:nmap <leader>t :tabs<CR>
:nmap <leader><Tab> :tabn<CR>
:nmap <leader><S-Tab> :tabp<CR>
:nmap <leader>tm :tabmove
:nmap <leader>tn :tabnew


" Fuzzy
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
let g:fuf_maxMenuWidth = 200
" let g:fuf_coveragefile_globPatterns = ['~/Code/**/*','~/Code/**/.*',
let g:fuf_coveragefile_globPatterns = ['~/Code/lift/**/*','~/.*','/opt/local/etc/**/*','/usr/include/**', '~/dot-files/**/*','~/dot-files/**/.*']
nnoremap <silent> sb     :FufBuffer<CR>
nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> sK     :FufFileWithFullCwd<CR>
nnoremap <silent> s<C-k> :FufFile<CR>
nnoremap <silent> sc     :FufCoverageFile<CR>
nnoremap <silent> sC     :FufCoverageFileChange<CR>
nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> sD     :FufDirWithFullCwd<CR>
nnoremap <silent> s<C-d> :FufDir<CR>
nnoremap <silent> sn     :FufMruFile<CR>
nnoremap <silent> sN     :FufMruFileInCwd<CR>
nnoremap <silent> sm     :FufMruCmd<CR>
nnoremap <silent> su     :FufBookmarkFile<CR>
nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> si     :FufBookmarkDir<CR>
nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
nnoremap <silent> st     :FufTag<CR>
nnoremap <silent> sT     :FufTag!<CR>
nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> s,     :FufBufferTag<CR>
nnoremap <silent> s<     :FufBufferTag!<CR>
vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> s.     :FufBufferTagAll<CR>
nnoremap <silent> s>     :FufBufferTagAll!<CR>
vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> sg     :FufTaggedFile<CR>
nnoremap <silent> sG     :FufTaggedFile!<CR>
nnoremap <silent> so     :FufJumpList<CR>
nnoremap <silent> sp     :FufChangeList<CR>
nnoremap <silent> sq     :FufQuickfix<CR>
nnoremap <silent> sl     :FufLine<CR>
nnoremap <silent> sh     :FufHelp<CR>
nnoremap <silent> se     :FufEditDataFile<CR>
nnoremap <silent> sr     :FufRenewCache<CR>

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

" clang complete
let g:clang_snippets = 0
" let g:clang_snippets_engine = 'snipmate'

" tags
set tags+=~/.vim/tags/cpp

" Omnifunc / Omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete

filetype plugin on

" SuperTab
" let g:SuperTabDefaultCompletionType = "context"
" the next line is wrong... not sure why
" let g:SuperTabLongestHighlight 1

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

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>nt :NERDTree 

" Set paste mode
nnoremap <leader>v :set invpaste paste?<CR>
set pastetoggle=<leader>v
set showmode


" finally change directory
cd ~/Code
