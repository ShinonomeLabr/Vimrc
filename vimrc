syntax on

set nu
set hlsearch
set incsearch
set ruler
set showcmd
set cursorline
set cursorcolumn
set foldenable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set ignorecase
set completeopt=longest,menu
set laststatus=2
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set runtimepath^=~/.vim/bundle/ctrlp.vim
set history=1000
set confirm
set scrolloff=3
set pastetoggle=<F9>
set foldmethod=indent
set lazyredraw

" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END

"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

filetype on
filetype plugin indent on

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

map <C-A> ggVGY
map <C-A> <Esc>ggVGY
map <F12> gg=G
map <M-F2> :tabnew<CR>  
map <F3> :tabnew .<CR>  
map <C-F3> \be  
nmap tt :%s\t/	/g<CR>
nmap <F7> :n<CR>
nmap <F8> :bn<CR>
nnoremap <F4> :g/^\s*$/d<CR> 
nnoremap <C-F2> :vert diffsplit 
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>
vmap <C-c> "+y

let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_user_command='find %s -type f'
let g:crtlp_custom_ignore={
			\'dir': '\v[\/](node_modules)$'
			\}

"let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:nodejs_complete_config = {
\	'js_compl_fn': 'jscomplete#CompleteJS',
\	'max_node_compl_len': 15
\}

let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'ternjs/tern_for_vim', { 'for': 'javesript' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'airblade/vim-gitgutter'
Plug 'severin-lemaignan/vim-minimap'
Plug 'maksimr/vim-jsbeautify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

".vimrc
"map <c-f> :call JsBeautify()<cr>
" or
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
"autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
"autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
"autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"Call jsbeautify
nmap <leader>f :call JsBeautify()<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>b :Buffers<CR>

" Minimap settings
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'

"--AUTOCOMPLETION--
filetype plugin on
set omnifunc=syntaxcomplete#Complete

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

let g:airline_theme='onedark'
colorscheme onedark
"color dracula

