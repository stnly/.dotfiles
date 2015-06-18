filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'rstacruz/sparkup'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'kien/rainbow_parentheses.vim'
"Bundle "myusuf3/numbers.vim"
Bundle "pangloss/vim-javascript"
Bundle 'mattn/emmet-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'
Bundle 'juvenn/mustache.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Lokaltog/vim-powerline'
Bundle 'junegunn/goyo.vim'
"Bundle 'amix/vim-zenroom2'
Bundle 'wakatime/vim-wakatime'

filetype plugin indent on     " required!

"Usability
set nocompatible
"Increase history
set history=1000
"Allow cursor in insert mode
set esckeys
"Enhance cli completion
set wildmenu
"Highlight current line
set cursorline
"Highlight search
set hlsearch
"Search dynamically
set incsearch
"Enable mouse on all modes
set mouse=a
"Show current mode
set showmode
"Show filename in titlebar
set title
"Show command as it is typed
set showcmd
"Start scrolling 3 lines before bottom
set scrolloff=3
"Set column colour 80
set colorcolumn=80
"UI
syntax enable "Enable syntax hl
"set number "Line number
set relativenumber "Relative line numbers
set background=dark
colorscheme molokai
let g:molokai_original=0
set ruler
set nostartofline
set t_Co=256
" No swapfile. Use version control.
set noswapfile
" Fix bad autoindent of pasted text
set paste
"Text formatting
set lbr
set guifont=Inconsolata\ Medium\ 12
set expandtab
set tabstop=2
set shiftwidth=2
set nosmarttab
set wrap
set linebreak

" Set tabspace for mardown
autocmd FileType markdown set sw=4
autocmd FileType markdown set sts=4
autocmd FileType markdown set sts=4
autocmd FileType markdown set spell

" Strip trailing whitespace
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
    endfunction

map ,s :call StripWhitespace ()<CR>

" Make UltiSnips play well with YouCompleteMe
function! g:UltiSnips_Complete()
  call UltiSnips_JumpForwards()
  if g:ulti_jump_forwards_res == 0
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
      if pumvisible()
        return "\<C-n>"
      else
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <c-r>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" YouCompleteMe Configs
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" NERDTree
" Opens NERDTree if no file is specified
autocmd vimenter * if !argc() | NERDTree | endif
" Toggle Key
map <C-n> :NERDTreeToggle<CR>

" Disable vim-markdown's folding
let g:vim_markdown_folding_disabled=1

" Syntastic check on file open
let g:syntastic_check_on_open=1

" Smart expansion on delimters
let delimitMate_expand_cr = 1

" Initialise rainbow parans
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_max = 50

" Numbers exclude packages
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

" Configure emmet.
let g:user_emmet_settings={
\        'indentation': '  '
\}
let g:user_emmet_leader_key='<C-c>'


" Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'relative'
call Pl#Theme#RemoveSegment('fugitive:branch')
call Pl#Theme#RemoveSegment('fileformat')
call Pl#Theme#RemoveSegment('fileencoding')
call Pl#Theme#RemoveSegment('scrollpercent')
autocmd FocusGained * call Pl#UpdateStatusline(1)
autocmd FocusLost * call Pl#UpdateStatusline(0)

function! s:goyo_before()
  set norelativenumber
endfunction

function! s:goyo_after()
  set relativenumber
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]


