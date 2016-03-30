" See http://stackoverflow.com/questions/2078271/get-current-value-of-a-setting-in-vim
" View the value of a particular vim setting => :set <setting>?
call pathogen#runtime_append_all_bundles()

let g:go_fmt_fail_silently = 1
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
let g:rspec_runner = "os_x_iterm"

"See http://vim.wikia.com/wiki/File_format
"Vim will detect the fileformat of a file when its opened. If it detects DOS-style line endings then Vim will set fileformat=dos for that file.
set fileformat=unix
set rtp+=$GOROOT/misc/vim

syntax enable
"filetype plugin indent on
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

" Disable the annoying auto-insert-comment behavior
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Keep cursor away from edges of screen.
set so=10

" Reference: http://nixtricks.wordpress.com/2009/09/07/vim-copy-paste-between-two-vim-sessions/

let mapleader = ","
"let g:rubycomplete_rails = 1
let g:Powerline_symbols = 'fancy'
"let g:clj_highlight_builtins=1 " Highlight Clojure's builtins
"let g:clj_paren_rainbow=1 " Rainbow parentheses'!

hi CursorLine term=bold cterm=bold guibg=Grey40
hi Cursor term=bold cterm=bold guibg=Grey20 

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
map <leader>/ %

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

" spec-vim
map <leader>cr :call RunCurrentSpecFile()<CR>
map <leader>ar :call RunAllSpecs()<CR>

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

" https://github.com/myusuf3/numbers.vim
map <leader>0 :NumbersToggle<CR>

" jruby significantly slows down vim startup. This speeds it back up
if !empty(matchstr(system('rvm current'), 'jruby'))
  let g:ruby_path=system('echo $MY_RUBY_HOME/lib/ruby/{site_ruby/*,*.*}')
endif
