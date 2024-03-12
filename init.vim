" plugins
call plug#begin('~/.local/share/nvim/plugged')

" tools
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'blueyed/vim-diminactive'
"Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/comments.vim'
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
"Plug 'untitled-ai/jupyter_ascending.vim'

" languages
Plug 'ekalinin/Dockerfile.vim'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-markdown'
Plug 'jparise/vim-graphql'
Plug 'vim-python/python-syntax'
Plug 'chrisbra/csv.vim'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kevinoid/vim-jsonc'
Plug 'elixir-editors/vim-elixir'
Plug 'jxnblk/vim-mdx-js'
"Plug 'findango/vim-mdx'

" colors
"Plug 'overcache/NeoSolarized'

call plug#end()

" colors config
"set termguicolors
"colorscheme solarized
set background=light

" various
cabbr <expr> %% expand('%:p:h')

let mapleader = "'"

map - <c-w>w
map <leader>w <c-w>

nmap <c-f> :NERDTreeFind<CR>
nmap <leader>m :lnext<Enter>
nmap <leader>n :cnext<Enter>
nmap <space> <pagedown>

nnoremap Q <nop>

set autoindent
set autoread
set backspace=start,indent,eol "Fix backspace
set backupcopy=yes
set copyindent
set cursorcolumn
set cursorline
set expandtab
set history=1024 "Memorize 1024 last commands
set linebreak
set listchars+=tab:>·,trail:·,extends:~,nbsp:¤
set modeline
set mouse=
set preserveindent
set shiftwidth=2
set showcmd "Show beginning of normal commands (try d and see at bottom-right)
set showmode "Show mode in status (insertion, visual...)
set so=8 "When moving vertical, start scrolling 4 lines before reaching bottom
set softtabstop=0
set tabstop=4
set termencoding=utf8
set ts=2

" parenthesis
set showmatch
set matchtime=2

" fuzzy find
set rtp+=~/.fzf
nmap <Leader>f :GFiles<CR>
nmap <Leader>h :History<CR>

" fugitive
nmap F :Glgrep! "\b<C-R><C-W>\b"<CR>:lopen<CR>

" allow project specific vim configs
set exrc
set secure

" diminactive
let g:diminactive_use_colorcolumn = 0
"hi ColorColumn ctermbg=0 guibg=#eee8d5

" trailing white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" search
nnoremap ( :nohlsearch<CR>
set hlsearch
set wrapscan "Continue to top after reaching bottom
set incsearch "See results of search step by step

" windows
set splitright " Vsplit at right
set previewheight=8 "Height of preview menu (Omni-completion)

" leave insert mode quickly
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" remove auto comment insertion on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" emmet
let g:user_emmet_leader_key='<C-i>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

"""""""""""""""""""""""""""""""""""""""
" 				coc.vim               "
"""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

" some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" better display for messages
set cmdheight=1

" smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>D <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      "\ },
      "\ 'component_function': {
      "\   'cocstatus': 'coc#status'
      "\ },
      "\ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>y  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd BufWritePre *.tf call terraform#fmt()

" golang
nmap <leader>gr <Plug>(go-run)
nmap <leader>gc <Plug>(go-build)
nmap <leader>gt :GoTest!<cr>
nmap <leader>gl <Plug>(go-lint)
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'

" This prevents go autofmt to refold everything after each save
let g:go_fmt_experimental = 1
let g:go_fmt_command = "goimports"

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
autocmd BufNewFile,BufRead *.json setl ft=jsonc

:nmap <leader>e <Cmd>CocCommand explorer<CR>

"hi! CocErrorSign guifg=White guibg=#ff0000
"hi! CocErrorSign ctermfg=White


" FZF mappings
nnoremap <silent> f<space> :<C-u>CocFzfList<CR>
nnoremap <silent> fa       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> fb       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> fc       :<C-u>CocFzfList commands<CR>
nnoremap <silent> fe       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> fl       :<C-u>CocFzfList location<CR>
nnoremap <silent> fo       :<C-u>CocFzfList outline<CR>
"nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> ff       :<C-u>CocFzfList files<CR>
nnoremap <silent> fm       :<C-u>CocFzfList mru<CR>
nnoremap <silent> fq       :<C-u>CocFzfList quickfix<CR>
nnoremap <silent> fp       :<C-u>CocFzfListResume<CR>

nmap <leader>1 :call coc#config('diagnostic.messageTarget', 'echo')<CR>
nmap <leader>2 :call coc#config('diagnostic.messageTarget', 'float')<CR>

hi Search cterm=NONE ctermfg=lightgrey ctermbg=blue

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

nmap <C-v> :NERDTreeToggle<CR>



"nmap <space><space>k <Plug>JupyterRestart
"nmap <space><space>j <Plug>JupyterExecute
"nmap <space><space>J <Plug>JupyterExecuteAll
