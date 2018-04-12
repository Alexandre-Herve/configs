set nocompatible               " be iMproved
filetype off                   " required!
let mapleader = "'"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle
" required!
" tools
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-scripts/comments.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/Align'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'flowtype/vim-flow'
Plugin 'tpope/vim-dotenv'
Plugin 'desert-warm-256'
" Plugin 'vim-scripts/taglist.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'blueyed/vim-diminactive'
Plugin 'junegunn/fzf.vim'

" languages
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-markdown'
Plugin 'derekwyatt/vim-scala'
Plugin 'evidens/vim-twig'
Plugin 'pangloss/vim-javascript.git'
Plugin 'mxw/vim-jsx'
Plugin 'ElmCast/elm-vim'
" Plugin 'elixir-lang/vim-elixir'
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'posva/vim-vue'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

" matrix
Plugin 'uguu-org/vim-matrix-screensaver'

" Plugin 'majutsushi/tagbar'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
" Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'scrooloose/syntastic'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'tpope/vim-ragtag'
" Plugin 'tpope/vim-rails'

"Bundle 'sophacles/vim-bundle-sparkup'
" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'pangloss/vim-javascript.git'
" Bundle 'tpope/vim-rails.git'
" Bundle 'pangloss/vim-javascript'
" " vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on
syntax on


"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" ---| TERMINAL-DEPENDANT SETTINGS |--- {{{

" If GUI mode
set termencoding=utf8

set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized 

set ttymouse=xterm2
set cursorline

hi CursorLine cterm=none ctermbg=234 
if (&term =~ 'rxvt') "Vieux hack rxvt (...)
  so ~/.vim/sitaktif/rxvt.vim
end
"Project

"}}}

" ---| GLOBAL SETTINGS |--- {{{

" Indentation and tabs
" set expandtab
" set tabstop=2

" set expandtab
set autoindent "Indent (based on above line) when adding a line
set ts=2 "A tab is 2 spaces
" set softtabstop=2 "See 2 spaces per tab
" set sw=2 "Indent is 2
set nosmartindent "Cindent is better
" set smartindent

" set noexpandtab
set expandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

" Editing layout
" set formatoptions+=ln "See :h 'formatoptions' :)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set backspace=start,indent,eol "Fix backspace
set linebreak "Break lines at words, not chars
set so=8 "When moving vertical, start scrolling 4 lines before reaching bottom
set modeline
set listchars+=tab:>·,trail:·,extends:~,nbsp:¤

" Windows
set splitright " Vsplit at right
set previewheight=8 "Height of preview menu (Omni-completion)

" Search
set wrapscan "Continue to top after reaching bottom
"set hlsearch "Highlight search
set incsearch "See results of search step by step

set showmatch "Parenthesis matches
set matchtime=2 "Show new matching parenthesis for 2/10th of sec

"
" System
"set vb t_vb="" "Removes the Fucking Bell Of Death...
set history=1024 "Memorize 1024 last commands
set updatetime=2000 "Update swap (and showmark plugin) every 2 sec

" Mouse
set mouse=a "Use mouse (all)
set ttymouse=xterm2 "Mouse dragging in iTerm

" Command mode options
set wildmenu "Completions view in ex mode (super useful !)
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.ps,*.pdf,*.cmo,*.cmi,*.cmx "Don't complete bin files
set cmdheight=1 "Command line height

set laststatus=2 "When to show status line (2=always)
set ruler "Show line,col in statusbar
set number "Show lines
set showmode "Show mode in status (insertion, visual...)
set showcmd "Show beginning of normal commands (try d and see at bottom-right)


" Auto-folding and auto-layout (e.g. for vim help files)
set foldenable "Automatic folding
set foldmethod=marker "Folds automatically between {{{ and }}}

"}}}

" ---| MORE COMPLEX FUNCTIONS |--- {{{

" Updates 'Last change:' ; called on every buffer saving 
function! TimeStamp()
  let lines = line("$") < 10 ? line("$") : 10
  let pattern1 = '\([Ll]ast [Cc]hange\(s\=\)\(\s\=\):\s\+\)\d\d\d\d \w[a-zé][a-zû] \d\d'
  let replace1 = '\1' . strftime("%Y %b %d")
  execute printf('1,%ds/\C\m%s/%s/e', lines, pattern1, replace1)
  execute printf('$-%d+1,$s/\C\m%s/%s/e', lines, pattern1, replace1)
  let pattern2 = '\($Id: \f\+ \d\+\.\d\+\(\.\d\+\.\d\+\)*\)\(+\(\d\+\)\)\? '
        \ . '\(\d\d\d\d[-/]\d\d[-/]\d\d \d\d:\d\d:\d\d\)\(+\d\d\)\?'
  let replace2 = '\=submatch(1) . "+" . (submatch(4) + 1) . " "'
        \ . '. strftime("%Y\/%m\/%d %H:%M:%S") . submatch(6)'
  execute printf('1,%ds/\C\m%s/%s/e', lines, pattern2, replace2)
  execute printf('$-%d+1,$s/\C\m%s/%s/e', lines, pattern2, replace2)
endfunction



"}}}

" ---| MAPPINGS |--- {{{

" open grunt in vrtical side pane using tmux
nmap <C-°> <C-a>

" maximize split
let t:maximized = "false"
function MaximizeSplit()
    let l:position = winsaveview()
    if t:maximized == "false"
        let t:maximized = "true"
        vertical resize
        resize
    elseif t:maximized == "true"
        let t:maximized = "false"
        execute "normal \<C-W>\="
    endif
    call winrestview(l:position)
endfunction

map <c-w>, :exec MaximizeSplit()<CR>

"Invert marks : <quote> is easier to type (for AZERTY keyboards)
map ' `
" Much better :) hope it doesn't crash any plugin
map Y y$
" Next window
map - <c-w>w
map <leader>w <c-w>

" insert semicolon at the end of a line in normal mode
nmap <leader>; A;<esc>

" go to next quicklist item easyly
nmap <leader><leader>n :cnext<Enter>


" TODO find a useful mapping for Q
map Q A
imap   \<espace insécable\>

" Remove search hilights
map __ :noh<CR>
" correct this shitty typo on exit :]
nmap q: :q

nmap :vps :vsp

"map ² <ESC>

" Tabs
map <F4> :tabnew<cr>:e 

map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" TODO mapper les fleches sur les fenetres et faire un toggle


" Tags update
" map <F12> :!ctags -R .<CR><CR>
" Toggle 'preview' in omni-completion
map <C-F12> :let &completeopt = (&completeopt == "menu" ? "menu,preview" : "menu") <bar> echo &completeopt <cr>

"Preview zone F6/7/8
map <F6> :pop<cr>
map <F7> :tag<cr>
map <F8> :pc<cr>
"Quickfix zone Shift + F6/7/8
map <S-F6> :cp<cr>
map <S-F7> :cn<cr>
map <S-F8> :ccl<cr>

"Mappings for up and down (multilines)
map <S-UP> gk
map <S-DOWN> gj
imap <S-UP> <c-o>gk
imap <S-DOWN> <c-o>gj

"Move a line of text
"imap <C-j> <esc>mz:m+<cr>`za
"imap <C-k> <esc>mz:m-2<cr>`za
"nmap <C-j> mz:m+<cr>`z
"nmap <C-k> mz:m-2<cr>`z
"vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Redefine keys so that the search result is in the middle of the screen
"nmap n nzz
"nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Fixes a bit Scrolling
nnoremap <PageUp> zz<PageUp>zz
nnoremap <PageDown> zz<PageDown>zz

"Smart mappings on the command line (qwerty & azerty) TODO make more
cno $h e ~/
cno $H e ~/
" cno $j e ./
" cno $J e ./

nmap <Tab> :tabnext<cr>
nmap <S-Tab> :tabprev<cr>
nmap <space> <pagedown>


"}}}

" ---| AUTOCOMMANDS |--- {{{

" ks is an alias for :mark s
autocmd BufWritePre *  silent! undojoin | ks | call TimeStamp()|'s

"}}}

" ---| FILETYPE |--- {{{

" Keyword dictionary complete
autocmd FileType * exec('setlocal dict+='.$VIMRUNTIME.'/syntax/'.expand('<amatch>').'.vim')

set tags=./TAGS,TAGS,./tags,tags

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()


autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" CSS [Works so good :)]
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" C / C++ (OmniCppComplete)
" autocmd FileType c,cpp map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" JAVA
" See ftplugin/java.vim
"autocmd FileType java 

" HTML
"Jump to end of tag
"autocmd FileType htm,html,htmldjango,xml,xhtml imap <c-l> <esc>l%a

" RUBY
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Django
autocmd FileType htmldjango imap {% {%  %}<esc>2hi
autocmd FileType htmldjango imap <leader>b <esc>:s/{% block \(.*\) %}/&\r{% endblock \1 %}<cr>:noh<cr>O
autocmd FileType htmldjango imap <leader>e <esc>:s/{% \([a-zA-Z]\+\) \(.*\) %}/&\r{% end\1 \2 %}<cr>:noh<cr>O
cmap ftd set filetype=htmldjango<cr>

" Prototype (js framework) :
"Useful only for azerty
imap $ù $('')<esc>hi

" Mutt (mail client)
au BufRead /tmp/mutt-* set tw=72 spell

"}}}

" ---| INCLUDES |--- {{{

" Options for advanced users
"source $HOME/.vim/sitaktif/adv_vimrc.vim

" Plugin-dependant settings
"source $HOME/.vim/sitaktif/plugin_vimrc.vim

" Autocorrections
"source $HOME/.vim/sitaktif/autocorrect_fr_vimrc.vim

" Vim Outliner plugin
"source $HOME/.vim/sitaktif/vo_vim_outliner.vim

"}}}

" {{{ | SYNTAXIC |

" let g:syntastic_javascript_checkers = ['eslint']

" }}}

" {{{ | NERD COMMENTER |

let NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
    \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' },
\ }
set formatoptions+=r

" }}}

" {{{ | PLUGINS |
let g:elm_format_autosave = 1
" }}}

nnoremap <silent> <F8> :TlistToggle<CR>

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

" Treat hql (hive) files as if it where standard sql:
au BufNewFile,BufRead *.hql set filetype=sql

" quickfix height
au FileType qf call AdjustWindowHeight(3, 20)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" preview window height
set previewheight=20
au BufEnter ?* call PreviewHeightWorkAround()
func PreviewHeightWorkAround()
    if &previewwindow
        exec 'setlocal winheight='.&previewheight
    endif
endfunc


cabbr <expr> %% expand('%:p:h')

let g:ctrlp_match_window = 'results:100'
let g:ctrlp_max_height = '40'

nnoremap Q <nop>

map <c-z> <nop>

let g:flow#autoclose = 1
let g:flow#errjump = 1

" autocmd BufRead,BufNewFile   *.ex highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" autocmd BufRead,BufNewFile   *.ex match OverLength /\%81v.\+/

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

:set backupcopy=yes

" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
set rtp+=~/.fzf
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

nmap <Leader>g gi<esc>
