set nocompatible
filetype plugin indent on
syntax on
set termguicolors
set hidden
set cmdheight=2
set nobackup
set nowritebackup
set shortmess+=c
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent set smartindent
autocmd BufRead,BufNewFile *.py set shiftwidth=4
set smartindent
set autoindent
set copyindent
set clipboard+=unnamedplus  " All yank to system clipboard
set autoread        " Auto reread file if a change was detected
set nrformats+=alpha,bin,hex
set ignorecase      " Ignore case when searching
set smartcase       " Include only uppercase words with uppercase search term
set showmatch
let g:mapleader = "\<Space>" "remap leader

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim  --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin(stdpath('data') . '/plugged')
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim',
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'NieTiger/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'pangloss/vim-javascript'
		let g:javascript_plugin_jsdoc = 1
    Plug 'vim-python/python-syntax'
		let g:python_highlight_func_calls = 1
		let g:python_highlight_operators = 1
		Plug 'vim-airline/vim-airline'
    Plug 'NieTiger/halcyon-neovim'
call plug#end()

colorscheme halcyon

" Plugin shortcuts
map <C-n> :NERDTreeToggle<CR>
nnoremap <c-p> :FZF<CR>
nnoremap ; :Buffers<CR>

" Coc shortcuts
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" <tab> for trigger completion, completion confirm, snippet expand and jump
inoremap <silent><expr> <TAB>
		\ pumvisible() ? coc#_select_confirm() :
		\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Format :call CocAction('format')
xmap <leader>x  <Plug>(coc-convert-snippet)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Using CocList
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Shortcuts
" Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
