
set nocompatible

set runtimepath+=~/dotfiles/vim/vim/ultisnips_rep 
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
:nnoremap <silent> <leader>y :YRShow<CR>

" make it easy to switch to last buffer
:nmap <Leader>3 :e #<cr>

nnoremap <silent> <leader>t :tabs<CR>
:nmap <leader><Tab> :tabn<CR>
:nmap <leader><S-Tab> :tabp<CR>
:nmap <leader>tm :tabmove
:nmap <leader>tn :tabnew<cr>
:nmap <leader>ts :tab split<cr>

" TagList
:nmap <leader>tl :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1

" Save all
nnoremap <leader>w :wa!<cr>


" Fuzzy
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
let g:fuf_maxMenuWidth = 200

let g:fuf_keyOpen = '<CR>'
let g:fuf_keyOpenSplit = '<C-j>'
let g:fuf_keyOpenVsplit = '<C-k>'
let g:fuf_keyOpenTabpage = '<C-l>'

" let g:fuf_coveragefile_globPatterns = ['~/Code/**/*','~/Code/**/.*',
" let g:fuf_coveragefile_globPatterns = ['~/Code/lift/**/*','~/.*','/opt/local/etc/**/*','/usr/include/**', '~/dot-files/**/*','~/dot-files/**/.*']
nnoremap <silent> <leader>fb     :FufBuffer<CR>
nnoremap <silent> <leader>fk     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <leader>fK     :FufFileWithFullCwd<CR>
nnoremap <silent> <leader>ff      :FufFile<CR>
nnoremap <silent> <leader>fc     :FufCoverageFile<CR>
nnoremap <silent> <leader>fC     :FufCoverageFileChange<CR>
nnoremap <silent> <leader>f<C-l> :FufCoverageFileRegister<CR>
nnoremap <silent> <leader>fd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <leader>fD     :FufDirWithFullCwd<CR>
nnoremap <silent> <leader>f<C-d> :FufDir<CR>
nnoremap <silent> <leader>fn     :FufMruFile<CR>
nnoremap <silent> <leader>fN     :FufMruFileInCwd<CR>
nnoremap <silent> <leader>fm     :FufMruCmd<CR>
nnoremap <silent> <leader>fu     :FufBookmarkFile<CR>
nnoremap <silent> <leader>f<C-u> :FufBookmarkFileAdd<CR>
vnoremap <silent> <leader>f<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> <leader>fi     :FufBookmarkDir<CR>
nnoremap <silent> <leader>f<C-i> :FufBookmarkDirAdd<CR>
nnoremap <silent> <leader>ft     :FufTag<CR>
nnoremap <silent> <leader>fT     :FufTag!<CR>
nnoremap <silent> <leader>f<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> <leader>f,     :FufBufferTag<CR>
nnoremap <silent> <leader>f<     :FufBufferTag!<CR>
vnoremap <silent> <leader>f,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> <leader>f<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> <leader>f}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> <leader>f.     :FufBufferTagAll<CR>
nnoremap <silent> <leader>f>     :FufBufferTagAll!<CR>
vnoremap <silent> <leader>f.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> <leader>f>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> <leader>f]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> <leader>fg     :FufTaggedFile<CR>
nnoremap <silent> <leader>fG     :FufTaggedFile!<CR>
nnoremap <silent> <leader>fo     :FufJumpList<CR>
nnoremap <silent> <leader>fp     :FufChangeList<CR>
nnoremap <silent> <leader>fq     :FufQuickfix<CR>
nnoremap <silent> <leader>fl     :FufLine<CR>
nnoremap <silent> <leader>fh     :FufHelp<CR>
nnoremap <silent> <leader>fe     :FufEditDataFile<CR>
nnoremap <silent> <leader>fr     :FufRenewCache<CR>

" Turn on mouse support in xterm
set mouse=a

" Turn on relative number support
set relativenumber

" Turn on undo file
if isdirectory($HOME . '/tmp/.vim/undo') == 0
    :silent !mkdir -p ~/tmp/.vim/undo > /dev/null 2>&1
endif
set undodir=~/tmp/.vim/undo//
set undofile


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
" autocmd FileType c set omnifunc=ccomplete#Complete

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

filetype plugin on

" You Complete Me
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" UltiSnips.
" I always use ListSnippets, and reserve <tab> for You Complete Me.  The
" regulare UltiSnips is move from <tab> to the randomly choose <c-7>
let g:UltiSnipsExpandTrigger="<c-7>"
let g:UltiSnipsListSnippets = '<c-\>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" no remap just so I'm sure it works in every context
inoremap <c-\> <C-R>=UltiSnips_ListSnippets()<CR>
nnoremap <c-\> :UltiSnipsEdit<CR>


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
nnoremap <leader>v :set invpaste paste?<cr>
set pastetoggle=<leader>v
set showmode

" fix undo / redo into something more sensible
" exe "" is a noop
" nnoremap <silent> u :exe ""<cr>
nnoremap <silent> <leader>u :undo<cr>
nnoremap <silent> <leader>r :redo<cr>

" scratch buffer
nnoremap <silent> <leader>b :Sscratch<cr>

" fugitive -- git
nnoremap <leader>g :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gr :Gread
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gL :Glog -- %<cr>
nnoremap <leader>gb :Gbrowse<cr>
nnoremap [q     :cprevious
nnoremap ]q     :cnext
nnoremap [Q     :cfirst
nnoremap ]Q     :clast
" copy filename of current file into the unnamed register
nnoremap <leader>gc :let @" = expand("%")<cr>

" finally change directory
cd ~/Code
