let config_path = "~/.config/nvim"

" autoinstall vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins/')

" Main:
Plug 'junegunn/vim-plug'

" https://github.com/neoclide/coc.nvim -- Intellisense engine for vim.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
exec "source ".config_path."/coc.vim"
let g:coc_global_extensions = ['coc-snippets', 'coc-rls', 'coc-json', 'coc-marketplace']

" https://github.com/francoiscabrol/ranger.vim -- Ranger vim integration.
" <leader>f -- open ranger.
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" https://github.com/scrooloose/nerdcommenter -- Comment prettifier.
" <leader>cc -- comment current line.
" <leader>cm -- comments the given lines only one set of multipart delimiters.
" <leader>cs -- comments lines sexy.
Plug 'scrooloose/nerdcommenter'

" https://github.com/jiangmiao/auto-pairs -- Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" https://github.com/vim-airline/vim-airline -- Vim status bar.
Plug 'vim-airline/vim-airline'

" Language support:
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'neovimhaskell/haskell-vim'
Plug 'python-mode/python-mode'

" Color scheme:
Plug 'lifepillar/vim-gruvbox8'

call plug#end()

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

