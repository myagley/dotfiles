set nocompatible
syntax on

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

compiler ruby

set hlsearch
set number
set showmatch
set incsearch
set background=dark
set hidden
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set wrap
set dir=/tmp//
set scrolloff=5
set nofoldenable

set ignorecase
set smartcase

" Show tabs and eol
set list
set listchars=tab:▸\ 

let g:gist_detect_filetype = 1
let g:no_html_toolbar = 'yes'

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType erlang setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cs setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78
autocmd BufRead,BufNewFile *.g set syntax=antlr3
autocmd BufRead,BufNewFile *.thrift set filetype=thrift

let mapleader = ","

" NERDTree
map <leader>nt :NERDTreeToggle<CR>
map <leader>nr :NERDTree<CR>
map <leader>nf :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc() | NERDTree | endif

" FuzzyFinder
map <leader>ff :FuzzyFinderTextMate<CR>
map <leader>ft :FuzzyFinderTag<CR>
map <leader>fb :FuzzyFinderBuffer<CR>
map <leader>fr :FuzzyFinderTextMateRefreshFiles<CR>

let g:fuzzy_ignore = "*.log,tmp/*,db/sphinx/*,data,*.class"
let g:fuzzy_ceiling = 50000
let g:fuzzy_matching_limit = 10

" Comment/Uncomment
map <leader>cc :TComment<CR>
map <leader>uc :TComment<CR>

" Git
map <leader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>

map <leader>nh :nohls<CR>
map <leader>bd :bufdo :bd<CR>

command Wsudo w !sudo tee %
cnoremap <Tab> <C-L><C-D>

"map <silent> <LocalLeader>am :!make<CR>
"map <silent> <LocalLeader>ac :!make clean<CR>
"map <silent> <LocalLeader>au :!make upload<CR>
"map <silent> <LocalLeader>aa :!make && make upload<CR>

if version >= 700
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
    autocmd FileType tex setlocal spell spelllang=en_us
endif

if &t_Co == 256
  colorscheme wombat256mod
endif

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd FileType c,cpp,cs,java,php,ruby,python,html,htmldjango,scala,css,less,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <leader>ws :highlight clear ExtraWhitespace<CR>

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" Pretty colors for fuzzyfinder menus
highlight Pmenu ctermfg=black ctermbg=gray
highlight PmenuSel ctermfg=black ctermbg=white

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

