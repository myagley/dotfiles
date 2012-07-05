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

let g:gist_detect_filetype = 1

let g:fuzzy_ignore = "*.log,tmp/*,db/sphinx/*,data,*.class"
let g:fuzzy_ceiling = 50000
let g:fuzzy_matching_limit = 10

let g:no_html_toolbar = 'yes'

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

let mapleader = ","

" NERDTree
map <leader>nt :NERDTreeToggle<CR>
map <leader>nr :NERDTree<CR>
map <leader>nf :NERDTreeFind<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc() | NERDTree | endif

"map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
"map <silent> <LocalLeader>nr :NERDTree<CR>
"map <silent> <LocalLeader>nf :NERDTreeFind<CR>
"map <silent> <LocalLeader>ff :FuzzyFinderTextMate<CR>
"map <silent> <LocalLeader>ft :FuzzyFinderTag<CR>
"map <silent> <LocalLeader>fb :FuzzyFinderBuffer<CR>
"map <silent> <LocalLeader>fr :FuzzyFinderTextMateRefreshFiles<CR>
"map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
"map <silent> <LocalLeader>pd :e product_diff.diff<CR>:%!svn diff<CR>:setlocal buftype=nowrite<CR>
"map <silent> <LocalLeader>nh :nohls<CR>
"map <LocalLeader>aw :Ack '<C-R><C-W>'
"map <silent> <LocalLeader>bd :bufdo :bd<CR>
"map <silent> <LocalLeader>cc :TComment<CR>
"map <silent> <LocalLeader>uc :TComment<CR>

"map <silent> <LocalLeader>vp :PromptVimTmuxCommand<CR>
"map <silent> <LocalLeader>vl :RunLastVimTmuxCommand<CR>
"map <silent> <LocalLeader>vi :InspectVimTmuxRunner<CR>
"map <silent> <LocalLeader>vx :CloseVimTmuxPanes<CR>
"map <silent> <LocalLeader>vs :InterruptVimTmuxRunner<CR>

"map <silent> <LocalLeader>sc :wa<CR>:call RunVimTmuxCommand("clear && fsc -deprecation " . @%)<CR>

"map <silent> <LocalLeader>mw :InterruptVimTmuxRunner<CR>
"map <silent> <LocalLeader>mw :call RunVimTmuxCommand("clear && cake mocha:watch")<CR>

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
  colorscheme default
endif

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
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

