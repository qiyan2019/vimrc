set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/vim-plug
call plug#begin('~/.vim/bundle')

Plug 'gmarik/Vundle.vim'

Plug 'a.vim'
Plug 'DoxygenToolkit.vim'
Plug 'tomasr/molokai'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'  }
""plugin
Plug 'auto_mkdir'
Plug 'TagHighlight'
Plug 'auto-pairs'
Plug 'cuteErrorMarker'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'indent-motion'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'OmniCppComplete'
Plug 'vim-airline'
Plug 'surround.vim'
Plug 'majutsushi/tagbar'
Plug 'tlib'
Plug 'indentLine.vim'
Plug 'project.tar.gz'
Plug 'Pydiction'
Plug 'fatih/vim-go'
Plug 'L9'
"Plug 'FuzzyFinder'
Plug 'vim-orgmode'
Plug 'speeddating.vim'
Plug 'dantezhu/authorinfo'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'frtmelody/vim-autoformat'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/matchit.zip'
"Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
"cloorcheme
Plug 'flazz/vim-colorschemes'
"svn
Plug 'git://repo.or.cz/vcscommand'
" 等号对齐
Plug 'godlygeek/tabular'

"ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

Plug 'mileszs/ack.vim'
Plug 'rizzatti/dash.vim'

call plug#end()
" General Settings

set laststatus=2   " Always show the statusline
set showcmd
set cmdheight=1
set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set nu
set mouse=h
set title
set magic



filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

au BufEnter /usr/include/c++/* setf cpp

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "<cr>"
    else
        execute "normal /" . l:pattern . "<cr>"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax enable
syntax on		" syntax highlight
set hlsearch		" search highlighting
"nm<Space> i<space><Esc>l

set background=dark
set t_Co=256
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme molokai
let g:rehash256 = 1

"let g:airline_section_b = '%{strftime("%d")}'
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_enable_branch= 1
"let g:airline_theme= "solarized"
let g:airline_enable_syntastic=1
let g:airline_detect_paste= 1
""" powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '¶'
""""let g:airline_left_sep = 'ρ'
"let g:airline_right_sep = '«'
let g:airline_right_sep = 'Þ'
"let g:airline_symbols.linenr = '␊'
"""let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
"""let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
""let g:airline_symbols.paste = 'Þ'
""let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

set cursorline         " highlight current line



set guioptions-=T
"set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set vb t_vb=
set tm=500

" TAB setting{
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4

au FileType Makefile set noexpandtab


" C/C++ specific settings
autocmd FileType c,cpp,cc,h set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^0,:s,=s,g0,h1s,ps,t0,+s,(0,ms,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"---------------------------------------------------------------------------
" Tip #382: Search for <cword> and replace with input() in all open buffers
"---------------------------------------------------------------------------
fun! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
    :unlet! s:word
endfun

set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others


" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936


" --- EasyMotion
"let g:EasyMotion_leader_key = '<Leader>m' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment


" --- TagBar
" toggle TagBar with F7
let NERDTreeQuitOnOpen = 0
" set focus to TagBar when opening it
let g:tagbar_autofocus = 0



set path+=/usr/local/include
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include
set path+=/usr/include
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7/x86_64-redhat-linux
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7/backward
set path+=/usr/local/include
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include
set path+=/usr/include
set path+=~/svnprojects/include

"
"OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD", "string", "vector", "map"]
let OmniCpp_SelectFirstItem = 2

set completeopt=menuone,menu,longest,preview



"indentline
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_dark = 1
let g:indentLine_char = '¦'

set cursorcolumn



highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

"author info
let g:vimrc_author='Xue Ning'
let g:vimrc_email='ning.xue@meelive.cn'
let g:vimrc_homepage='http://www.meelive.cn'


"doxygen setting
let g:DoxygenToolkit_authorName="Xue Ning, ning.xue@meelive.cn"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1


"pydict"
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'

"snipmate
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"ycm config
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_complete_in_strings = 1
let g:ycm_use_ultisnips_completer = 1
"let g:ycm_key_list_select_completion = ['<S-TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<S-Tab>'
"

"markdown"
let g:vim_markdown_folding_disabled=1

"seystatistic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_auto_jump = 1
"
let g:autoformat_autoindent = 0



"easymotione
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

"auto formater
au BufWritePre * :Autoformat 
au BufWritePost * :SyntasticCheck
let g:formatters_c = ['astyle_c']
let g:formatdef_astyle_c = '"astyle --mode=c -A2 -f -S -p -k1 -v -U -H -N -M -w -L -s4 -o"'
let g:formatters_cpp = ['astyle_cpp']
let g:formatdef_astyle_cpp = '"astyle --mode=c -A2 -f -S -p -k1 -v -U -H -N -M -w -L -s4 -o"'
"let g:formatdef_autopep8 = '"autopep8 --aggressive --aggressive -"'

let g:syntastic_python_checkers = ['flake8']

"golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"ctrlp
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_working_path_mode = 'ra'

"

"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","

vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

map gf :IHV<cr>

"replace the current word in all opened buffers
map <leader>s :call Replace()<CR>

"surround
"ds
"cs
"ys$" 当前到行尾, 引号引住"
map <leader>e ysiw
" open the error console
map <leader>ec :botright cope<CR>
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split
map <C-j> <ESC><C-w>j
map <C-k> <ESC><C-w>k
map <C-h> <ESC><C-w>h
map <C-l> <ESC><C-w>l

" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

"tagbar
nnoremap <silent> <F7> :TagbarToggle<CR>
nnoremap <silent> <F8> :NERDTreeToggle<CR>

"ctags
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .<CR>

"add author info
nmap <F4> :AuthorInfoDetect<cr>
"add doc
nmap <F3> :Dox <cr>
nmap <F2> :ConqueTermVSplit

"goto here
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

nmap s <Plug>(easymotion-s)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
