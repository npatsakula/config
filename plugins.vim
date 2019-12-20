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
Plug 'w0rp/ale', { 'for': ['haskell'] }

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

" language support
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'neovimhaskell/haskell-vim'

" completions
"Plug 'ncm2/ncm2'

" snippets
Plug 'SirVer/ultisnips'

" colorschemes
Plug 'lifepillar/vim-gruvbox8'
" Plug 'dkasak/gruvbox'

call plug#end()

augroup plug_on_insert
  autocmd InsertEnter * call plug#load('ultisnips')
augroup END

" Settings:

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
