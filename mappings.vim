let mapleader=" "
nnoremap <silent> <Space>/ :Commentary<CR>

nnoremap <silent> <C-h>	   <C-w>h
nnoremap <silent> <C-j>	   <C-w>j
nnoremap <silent> <C-k>	   <C-w>k
nnoremap <silent> <C-l>	   <C-w>l

nnoremap <silent> <C-n>       :CocCommand explorer<CR>
nnoremap <silent> <Leader>ext :CocList marketplace<CR>

inoremap <silent> :w       <ESC>:wi
inoremap <silent> jk       <ESC>

cabbrev Wq wq
cabbrev WQ wq
cabbrev W  w
