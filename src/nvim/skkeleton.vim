imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)

function! s:skkeleton_init() abort
  call skkeleton#config({
    \   'eggLikeNewline': v:true,
    \   'markerHenkan': '-',
    \   'markerHenkanSelect': '+',
    \ })
  call skkeleton#register_kanatable('rom', {
    \   "z\<Space>": ["\u3000", ''],
    \   'z-': ['―', ''],
    \   'z/': ['・', ''],
    \
    \   '!': ['！', ''],
    \   '$': ['＄', ''],
    \   '&': ['＆', ''],
    \   '(': ['（', ''],
    \   ')': ['）', ''],
    \   '*': ['＊', ''],
    \   '+': ['＋', ''],
    \   '/': ['／', ''],
    \   '<': ['＜', ''],
    \   '=': ['＝', ''],
    \   '>': ['＞', ''],
    \   '@': ['＠', ''],
    \   '\': ['＼', ''],
    \   '{': ['｛', ''],
    \   '|': ['｜', ''],
    \   '}': ['｝', ''],
    \   '~': ['〜', ''],
    \ })
endfunction

augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END

call ddc#custom#patch_global('sources', ['around', 'skkeleton'])
call ddc#custom#patch_global('sourceOptions', {
  \   '_': {
  \     'matchers': ['matcher_head'],
  \     'sorters': ['sorter_rank']
  \   },
  \   'skkeleton': {
  \     'mark': 'skkeleton',
  \     'matchers': ['skkeleton'],
  \     'sorters': [],
  \     'minAutoCompleteLength': 2,
  \   },
  \ })

call ddc#enable()
