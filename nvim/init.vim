" General configuration options:
set nocompatible               " Use vim settings, rather then Vi settings.
set backspace=indent,eol,start " Allow backspacing over idention, line breaks and insertion start.
set history=1000               " Set bigger history of executed commands.
set showcmd                    " Show incomplete commands at the bottom.
set showmode                   " Show current mode at the bottom.
set hidden                     " Don't write background buffer.

" User interface options:
set laststatus=2               " Always display the status bar.
set ruler                      " Always show cursor position.
set wildmenu                   " Display command line's tab complete options as a menu.
set tabpagemax=10              " Maximum number of tab pages that can be opened from the command line.
set cursorline                 " Highlight the line currently under cursor.
set number                     " Show the numbers on the sidebar.
set visualbell                 " Flash the screen instead of beeping on errors.
set title                      " Set the window's title, reflecting the file currently being edited.
set background=dark            " Set dark background.
set termguicolors              " Set true colors.
set updatetime=300             " Set shorter delay time(default is 4000ms).
set shortmess+=c               " Don't pass messages to |ins-completion-menu|.
set statusline=%F%m%r%h%w=(FILE_TYPE:\%{&ff}/%Y)\ [LN:\ %l\/%L,\ COL:\ %c]
map <Space> <Leader>

" Backup options:
set nobackup

" Indentation options:
set autoindent                 " New lines inherit the indentation of previous line.
filetype plugin indent on      " Smart auto indentation(instead of old 'smartindent' option).
set tabstop=4                  " Show existing tab with 4 spaces width.
set expandtab                  " On pressing tab, insert 4 spaces.
set shiftwidth=2               " When indenting with '>', use 2 spaces width.

" Search options:
set incsearch                  " Find the next match as we type the search.
set hlsearch                   " Highlight searching by default.
set ignorecase                 " Ignore case when searching...
set smartcase                  " ...unless you type a capital.

" Text rendering options:
set encoding=utf-8             " Use an encoding that supports Unicode.
set linebreak                  " Wrap lines at convenient points, avoid wrapping a line in the middle of a word.
syntax enable                  " Enable syntax highlighting.

" Miscellaneous options:
set confirm                    " Display a configuration dialog when closing an unsaved file.
set nrformats-=octal           " Interpret octal as decimal when incrementing numbers.
set spell spelllang=ru,en_us   " Enable spellchecking.

" VimPlug auto-install:
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins/')

" Dark theme:
Plug 'morhetz/gruvbox'

" Intellisense engine for vim:
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-snippets', 'coc-json', 'coc-marketplace', 'coc-rust-analyzer']

" TOML highlight:
Plug 'cespare/vim-toml'

" Vim tabs:
Plug 'ap/vim-buftabline'

call plug#end()

" Set color scheme:
colorscheme gruvbox

" Set tabs aliases:
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Use tab for trigger completion with characters ahead and negative.
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
inoremap <silent><expr> <c-Space> coc#refresh()

" Use <cr> to confirm completion. `<C-g>u` means break unto chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
    " Use 'complete_info' if you *vim version support it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use '[g' and ']g' to navigate diagnostics.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-defenition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use 'K' to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocAction('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current line:
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line:
nmap <leader>qf <Plug>(coc-fix-current)

" Add ':Format' command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Rust analyzer bindings:
nnoremap <silent> rar   :<C-u>CocCommand rust-analyzer.run<CR>
nnoremap <silent> raem  :<C-u>CocCommand rust-analyzer.expandMacro<CR>
nnoremap <silent> rare  :<C-u>CocCommand rust-analyzer.reload<CR>
nnoremap <silent> ras   :<C-u>CocCommand rust-analyzer.analyzerStatus<CR>
nnoremap <silent> rau   :<C-u>CocCommand rust-analyzer.upgrade<CR>

