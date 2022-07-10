vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use({'wbthomason/packer.nvim'})
  use({'vim-denops/denops.vim'})
  use({'vim-skk/skkeleton'})
end)

vim.cmd([[
function! s:skkeleton_init() abort
  call skkeleton#config({
  \   'eggLikeNewline': v:true,
  \   'globalJisyo': '/home/okayurisotto/ghq/github.com/okayurisotto/skk-dicts/dist/SKK-JISYO.L.txt',
  \   'globalJisyoEncoding': 'utf-8',
  \   'markerHenkan': '+',
  \   'markerHenkanSelect': '-',
  \ })
  call skkeleton#register_kanatable('rom', {
  \   "z\<Space>": ["\u3000", ''],
  \   'z-': ['—', ''],
  \   '(': ['（', ''],
  \   ')': ['）', ''],
  \ })
endfunction
augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END

imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)
]])
