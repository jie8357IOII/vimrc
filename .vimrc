set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
"""python formatter"""
Plugin 'tell-k/vim-autopep8'
"""code syntax check"""
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'benmills/vimux'

call vundle#end()            " required
syntax on
filetype plugin indent on                                                       
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set showmatch
set fenc=utf-8
set hlsearch

set number relativenumber
set cursorline

highlight SpecialKey ctermfg=red    
set list
set listchars=tab:T>

"let g:header_auto_add_header = 0
"let g:header_field_author = 'Jayce Li'
"let g:header_field_author_email = 'itriA40520@itri.org.tw'
"map <F4> :AddHeader<CR>

"let g:jedi#auto_vim_configuration = 0
set clipboard=unnamed
set paste

noremap <silent> vv <C-w>v
map <Leader>vp :VimuxPromptCommand<CR>

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
"
""autopep8设置"
let g:autopep8_disable_show_diff=1
""

""""""""syntasic setting""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""YCM setting""""""""""
let g:ycm_python_binary_path = 'python'

""""""""neo complete setting"""""
let g:neocomplete#enable_at_startup=1


""" key mapping"""
" navie split window "
let mapleader = ","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map - <C-W>-
map + <C-W>+
map <C-n> :NERDTreeToggle<CR>
noremap <leader>y "*y
noremap <leader>yy "*Y
" Preserve indentation while pasting text from the OS X clipboard 在粘贴OS X剪贴板中的文本时保留缩进
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
""""""""""""""""""

"" Open new split panes to right and bottom ""
set splitbelow
set splitright


""""""""NERDTree setting"""""""

" Autolaunch NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Focus main window, not NERDTree
augroup NERD
  autocmd!
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
augroup END

" Exit Vim when the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" For serious
let NERDTreeShowHidden=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" purple
call NERDTreeHighlightFile('exs', '098', 'none', '#9E6FCE', '#26292c')
call NERDTreeHighlightFile('ex', '098', 'none', '#9E6FCE', '#26292c')
" green
call NERDTreeHighlightFile('jade', '034', 'none', '#61AE63', '#26292c')
call NERDTreeHighlightFile('hbs', '034', 'none', '#61AE63', '#26292c')
call NERDTreeHighlightFile('md', '034', 'none', '#61AE63', '#26292c')
" light green
call NERDTreeHighlightFile('html', '076', 'none', '#AAD364', '#26292c')
call NERDTreeHighlightFile('eex', '076', 'none', '#AAD364', '#26292c')
call NERDTreeHighlightFile('vue', '076', 'none', '#AAD364', '#26292c')
" dark green
call NERDTreeHighlightFile('php', '028', 'none', '#65AE63', '#26292c')
call NERDTreeHighlightFile('pl', '028', 'none', '#65AE63', '#26292c')
call NERDTreeHighlightFile('py', '028', 'none', '#65AE63', '#26292c')
" gold
call NERDTreeHighlightFile('config', '220', 'none', '#FED04E', '#26292c')
call NERDTreeHighlightFile('conf', '220', 'none', '#FED04E', '#26292c')
call NERDTreeHighlightFile('json', '220', 'none', '#FED04E', '#26292c')
call NERDTreeHighlightFile('ini', '220', 'none', '#FED04E', '#26292c')
call NERDTreeHighlightFile('yml', '220', 'none', '#FED04E', '#26292c')
" orange
call NERDTreeHighlightFile('scss', '214', 'none', '#F68838', '#26292c')
call NERDTreeHighlightFile('sass', '214', 'none', '#F68838', '#26292c')
call NERDTreeHighlightFile('styl', '214', 'none', '#F68838', '#26292c')
call NERDTreeHighlightFile('css', '214', 'none', '#F68838', '#26292c')
" cyan
call NERDTreeHighlightFile('coffee', '081', 'none', '#86C1E6', '#26292c')
call NERDTreeHighlightFile('ts', '081', 'none', '#86C1E6', '#26292c')
call NERDTreeHighlightFile('js', '081', 'none', '#86C1E6', '#26292c')
call NERDTreeHighlightFile('go', '081', 'none', '#86C1E6', '#26292c')
" red
call NERDTreeHighlightFile('xml', '160', 'none', '#D02A22', '#26292c')
call NERDTreeHighlightFile('svg', '160', 'none', '#D02A22', '#26292c')
" pink
call NERDTreeHighlightFile('rb', '168', 'none', '#e68590', '#26292c')
" grey
call NERDTreeHighlightFile('DS_Store', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('jar', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('pkg', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('dmg', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('zip', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('jpg', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('png', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('gif', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('pdf', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('swp', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('swo', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('gz', '242', 'none', '#6c6c6c', '#26292c')
call NERDTreeHighlightFile('xz', '242', 'none', '#6c6c6c', '#26292c')
" silver
call NERDTreeHighlightFile('txt', '251', 'none', '#c6c6c6', '#26292c')
call NERDTreeHighlightFile('log', '251', 'none', '#c6c6c6', '#26292c')

""""""END NERDTree setting""""""

