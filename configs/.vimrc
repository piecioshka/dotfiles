" Use Vundle
" See: https://github.com/gmarik/Vundle.vim
" -----------------------------------------------------------------------------

" (cp) use Vim defaults (much better)
" set nocompatible

" required!
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle - required!
Plugin 'gmarik/vundle'

" My bundles here:

" List of a lot of themes
Plugin 'flazz/vim-colorschemes'


" File Explorer
Plugin 'scrooloose/nerdtree'
" show hidden files
let NERDTreeShowHidden = 1
" disable quit NERDTree panel when file open
let NERDTreeQuitOnOpen = 0
" disable hideNERDTree when open new file
let NERDTreeMapOpenInTab = '<ENTER>'

autocmd BufWinEnter * NERDTreeMirror


" Set the same state of NERDTree in each tab
Plugin 'jistr/vim-nerdtree-tabs'


" Set dirty changes in NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'


" Display differences between working file and version from Git
Plugin 'airblade/vim-gitgutter'


" Add Git shorcuts
Plugin 'tpope/vim-fugitive'


" You should have ctags 5.x, recommend: 'brew install ctags'; after that set 'alias ctags=/usr/local/Cellar/ctags/5.8/bin/ctags'
Plugin 'bling/vim-airline'
set laststatus=10

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" display open buffers in tabline
let g:airline#extensions#tabline#enabled = 1


" The same as Outline in WebStorm - display definitions of methods
Plugin 'majutsushi/tagbar'


" Verify syntax and report errors
Plugin 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1


" Add a lot of shortcuts for support make operation in surrouding some word
Plugin 'tpope/vim-surround'


" Fancy plugin to move line up or down
Plugin 'matze/vim-move'
" set hot key as Control
let g:move_key_modifier = 'C'


" Add shortcuts for comment all line
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" Build HTML structure by CSS selector
Plugin 'mattn/emmet-vim'


" Enable shortcut: CTRL+P which is great to search file in project
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|.idea$\|vendor\|node_modules$\|bower_components$\|target$\|project$',
  \ 'file': '\v\.(exe|so|dll|log|png|jpeg|jpg)$',
  \ }
let g:ctrlp_show_hidden = 1


" Disply how many items was found in file search
Plugin 'google/vim-searchindex'


" Visual indentions by vertical bars
Plugin 'nathanaelkane/vim-indent-guides'
set ts=4 sw=4 et
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']


" Support highlight of JSON files
Plugin 'elzr/vim-json'


" Support highlight Markdown
Plugin 'tpope/vim-markdown'


" Support highlight to TypeScript files
Plugin 'leafgarland/typescript-vim'


call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.

" Editor
" ----------------------------------------------------------------------------

" https://github.com/scrooloose/syntastic/issues/803
set shell=bash

" Add directory for temporary files
set directory^=$HOME/.vim/swp/

" Enable syntax highlight
syntax on

" Setup UTF-8
scriptencoding utf-8
set encoding=utf-8

" Setup font
set guifont=Monaco:h20

" Set theme of colors
" colorscheme default
colorscheme apprentice
" colorscheme gruvbox
" colorscheme Tomorrow-Night-Bright
" colorscheme Tomorrow-Night-Eighties
" colorscheme blazer

" Set condition in theme that we use dark/light bg
set background=dark
" Enable mouse
set mouse=a
" Don't wrap lines
set nowrap
" Enable show number of line
set number
" Enable case sensetive
set noic
" Enable highlight during searching
set hlsearch
" Enable searching mechanism during putting chars
set incsearch
" Stop navigate on search results when file is end
set nowrapscan
" (hi) keep 100 lines of command history
set history=100

" Set 4 chars after what editor has stopped
set tabstop=4
" TODO: nie wiem co to robi?
" set softtabstop
" (sw) width (in spaces) used in each step of autoindent (aswell as << and >>)
set shiftwidth=4
" (et) expand tabs to spaces (use :retab to redo entire file)
set expandtab
" (sta) 'shiftwidth' used in front of a line, but 'tabstop' used otherwise
" set smarttab
" (ai) turn on auto-indenting (great for programers)
" set autoindent
" (ci) when auto-indenting, use the indenting format of the previous line
" set copyindent

" (sc) display an incomplete command in the lower right
set showcmd
" (ru) show the cursor position at all times
set ruler

" Highlight current line
set cursorline
" Show filename in title bar
set title
" Show line with autocomplete
set wildmenu

" Show whitespaces
set list
" Replace default whitespaces to custom
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮

" ============================================================================
" Configurations
" ============================================================================

" Aliases
" -----------------------------------------------------------------------------
:command! W write
:command! Wq wq
:command! Q quit
:command! JS set filetype=javascript
:command! HTML set filetype=html
:command! CSS set filetype=css

" Key Mappings
" -----------------------------------------------------------------------------

" Alt + s - save file
nnoremap ś :w<CR>

" Alt + w - quit editor
nnoremap ∑ :q<CR>

" Alt + 1 - open / close left sidebar with navigation
nnoremap Ń :NERDTreeTabsToggle<CR>

" Alt + 2 - open / close right sidebar with tags
nnoremap ™ :TagbarToggle<CR>

" Support Shift+Tab as unindention, more: http://vim.wikia.com/wiki/Shifting_blocks_visually
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Live templates
imap =fn function () {<CR>}<LEFT><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>
imap =it it('', () => {<CR>});<UP><RIGHT>
imap =describe describe('', () => {<CR>});<UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>

" Ctrl + n - Execute JavaScript file
map <C-n> :! clear && echo "// Execute file:" % && echo "" && node %<CR>
