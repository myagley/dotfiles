let mapleader = ","

" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree'

Plug 'vim-scripts/wombat256.vim'

Plug 'vim-scripts/tComment'

Plug 'rust-lang/rust.vim'

Plug 'kergoth/vim-bitbake'

" Initialize plugin system
call plug#end()

colo wombat256mod

" Show tabs and eol
set list
set listchars=tab:▸\ 

" NERDTree
map <leader>nt :NERDTreeToggle<CR>
map <leader>nr :NERDTree<CR>
map <leader>nf :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1

" Open nerdtree if opening vim with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Comment/Uncomment
map <leader>cc :TComment<CR>
map <leader>uc :TComment<CR>

map <leader>nh :nohls<CR>
map <leader>bd :bufdo :bd<CR>


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
autocmd FileType c,cpp,cs,go,java,php,ruby,python,html,htmldjango,scala,css,less,javascript,xml autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <leader>ws :highlight clear ExtraWhitespace<CR>

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

set laststatus=2
set statusline=
set statusline+=%<                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*        " buffer number, and flags
set statusline+=%-40f                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*                " file type
set statusline+=%10(L(%l/%L)%)           " line
set statusline+=%2(C(%v/125)%)           " column
set statusline+=%P                        " percentage of file

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" Turn on line numbers
set number
