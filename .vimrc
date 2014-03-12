call pathogen#runtime_append_all_bundles()
"filetype plugin indent on
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:slime_target = "tmux"
colorscheme solarized
set autochdir
set shiftwidth=2
set tabstop=2
set number
set hlsearch
set expandtab
set noswapfile
set laststatus=2
set cursorline
set clipboard=unnamed

" Keep cursor away from edges of screen.
set so=10

" Reference: http://nixtricks.wordpress.com/2009/09/07/vim-copy-paste-between-two-vim-sessions/

let mapleader = ","
let g:rubycomplete_rails = 1
let g:Powerline_symbols = 'fancy'
"let g:clj_highlight_builtins=1 " Highlight Clojure's builtins
"let g:clj_paren_rainbow=1 " Rainbow parentheses'!

hi CursorLine term=bold cterm=bold guibg=Grey40
hi Cursor term=bold cterm=bold guibg=Grey20 

map Q <Nop>
map <leader>d :NERDTreeToggle<CR>
map th :tabnext<CR>
map tl :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>
map <Space> <Esc>
map <leader>f :set fu<CR>
map <leader>nf :set nofu<CR>
map <leader>c :let @/ = ""<CR>
map <leader>r :source $MYVIMRC<CR>
map <leader>nn :set nonumber<CR>
map <leader>m ^
map <leader><Space> $
map <leader><leader> <C-w>w

" Open last-viewed file
map <leader>l <C-^>
map <leader>h <C-y>,
map <leader>s "ayy
map <leader>p "ap
map <leader>k :Gwrite<CR>
map <leader>j :Gcommit<CR>
"map <leader>m <C-d>
map <leader>n <C-b>
map <leader>p :CtrlP<CR>
map <leader>fw :FixWhitespace<CR>
map <leader>fm :g/def /<CR>
nnoremap <C-N> :next<Enter>
nnoremap <C-P> :prev<Enter>

" just to speed things up
nnoremap ; :

" Deleting a character doesn't get copied into default register. However, as a
" side-effect xp (swap two characters) doesn't work
noremap x "_x
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" jruby significantly slows down vim startup. This speeds it back up
if !empty(matchstr(system('rvm current'), 'jruby'))
  let g:ruby_path=system('echo $MY_RUBY_HOME/lib/ruby/{site_ruby/*,*.*}')
endif
