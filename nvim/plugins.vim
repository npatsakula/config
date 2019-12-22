" autoinstall vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/plugins/')

Plug 'junegunn/vim-plug'

" https://github.com/dense-analysis/ale -- Asynchronous Lint Engine, working with LSP.
Plug 'dense-analysis/ale', { 'for': ['haskell', 'rust'] }
Plug 'desmap/ale-sensible'

" https://github.com/scrooloose/nerdcommenter -- Comment prettifier.
Plug 'scrooloose/nerdcommenter'

" https://github.com/liuchengxu/vista.vim -- Viewer ++ Finder for LSP symbol and tags.
Plug 'liuchengxu/vista.vim'

" https://github.com/jiangmiao/auto-pairs -- Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" https://github.com/vim-airline/vim-airline -- Vim status bar.
Plug 'vim-airline/vim-airline'

" https://github.com/RRethy/vim-illuminate -- Vim plugin for automatically highlighting other 
" uses of the current word under the cursor.
Plug 'RRethy/vim-illuminate'

" Language support:
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'neovimhaskell/haskell-vim'
Plug 'python-mode/python-mode'

" Text snippets:
Plug 'SirVer/ultisnips'

" Color scheme:
Plug 'lifepillar/vim-gruvbox8'

call plug#end()

" Settings:

" ALE:

" [RUST] Dependencies install: rustup component add clippy rls rust-analysis rust-src
" [HASKELL] Dependencies install: stack install brittany
let b:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'haskell': ['brittany'], 
    \ 'rust': ['rustfmt']
\}

let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

" Airline:

function! AirlineInit()
  let g:airline_section_x = airline#section#create(['tagbar'])
  let g:airline_section_c = airline#section#create_right(['filetype', 'readonly', 'file'])

  function! Time(...)
    let w:airline_section_z = airline#section#create(['%{strftime("%l:%M%p")}'])
  endfunction
  call airline#add_statusline_func('Time')
  endfunction

  let g:airline_timer = timer_start(30, airline#update_statusline(), {'repeat': -1})
autocmd User AirlineAfterInit call AirlineInit()

