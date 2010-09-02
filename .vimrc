" Setup Bundle Support {
" The next two lines ensure that the ~/.vim/bundle/ system works
	runtime! autoload/pathogen.vim
	silent! call pathogen#runtime_append_all_bundles()
" }



" wrap like other editors
set wrap                " word wrap
set textwidth=0         " 
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" backup settings
set backup              " keep a backup file
set backupdir=/tmp      " backup dir
set directory=/tmp      " swap file directory

" tabs and indenting
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

set scrolloff=5

"Vim UI Settings
set cursorcolumn "highlight the current column
set cursorline " highlight the current line


set wildmenu
set wildignore=*.dll,*.o,*.ogj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*.class
set wildmode=longest,list


" syntax highlighting
syntax on               " enable syntax highlighting


"Folding {
set foldenable


" }
if !has('gui_running')
    colorscheme desert
    colorscheme zenburn
end
if has('gui_running')
    set showtabline=1
    set guioptions=cem
    set noantialias
    set background=dark
    colorscheme wombat
    set number
    "Set Font
    set guifont=Inconsolata\ Italic\ 10
    "set guifont=Monaco\ Regular\ 9
    "Set Number of lines and Columns
    set lines=80 columns=150
end

if has('statusline')
    " Nice statusbar
    set laststatus=2
    set statusline=
    set statusline+=%2*%-3.3n%0*\
    set statusline+=%f\
    set statusline+=%h%1*%m%r%w%0*
    set statusline+=\[%{strlen(&ft)?&ft:'none'},
    set statusline+=%{&encoding},
    set statusline+=%{&fileformat}]

    set statusline+=%=
    set statusline+=%2*0x%-8B
    set statusline+=%-14.(%l,%c%V%)\ %<%P
end

" plug-in settings
filetype plugin indent on
autocmd Filetype tex,latex :set grepprg=grep\ -nH\ $*
autocmd Filetype tex,latex :set dictionary=~/.vim/dict/latex.dict
let g:tex_flavor='latex'
set iskeyword+=:
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python compiler pylint
"autocmd FileType python source ~/.vim/ftplugin/python/python.vim
autocmd Filetype java set tags=~/.tags


" scroll one screen line regardless of editor line length
":noremap    <Up> gk
":noremap!   <Up> <C-O>gk
":noremap    <Down> gj
":noremap!   <Down> <C-O>gj

":noremap    k gk
":noremap    j gj


" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:»·,trail:·,eol:¬

set autochdir

"Mappings {
    " map : to ; in normal mode
    map ; :

   " space / shift-space scroll in normal mode
    noremap <S-space> <C-u>
    noremap <space> <C-d>

    " Toggle line numbers and fold column for easy copying:
    nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

    " Shortcut to rapidly toggle `set list`
    nmap <leader>l :set list!<CR>

    "Make arrow keys useful again{
        "map <down> <ESC> <RETURN>
        map <left> <ESC>:NERDTreeToggle<RETURN>
        map <right> <ESC>:Tlist<RETURN>
        "map <up> <ESC> <RETURN>
" }

" Settings for VimClojure
let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
let g:clj_paren_rainbow=1           " Rainbow parentheses'!

" Settings for NERD_Tree
let NERDTreeWinPos="left"
let NERDTreeWinSize=28

" Settings for taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File = 0 " Only show tags for current buffer
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1

" spelling...
if v:version >= 700
      setlocal spell spelllang=en
      nmap <LocalLeader>ss :set spell!<CR>
 
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

set colorcolumn=80

"Python.vim config
let python_highlight_all = 1
let python_slow_syc = 1

"set lcs=tab:^,trail:-,extends:>,precedes:<,nbsp:%


let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
