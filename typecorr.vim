" vim global plugin for correcting typing mistakes
" last changed 2017-04-16
" maintainer nishitaniyuki
" licaense: this file is placed in the public domain

if exists("g:loaded_typecorr")
  finish
endif
let g:loaded_typecorr = 1

let s:save_cpo = &cpo
set cpo&vim

iabbrev teh the
iabbrev otehr other
iabbrev wnat want
iabbrev synchronisation
  \ synchronization
let s:count = 4

if !hasmapto('<PlugTypecorrAdd')
  map <unique> <Leader>a <Plug>TypecorrAdd
endif
noremap <unique> <script> <Plug>TypecorrAdd <SID>Add

noremenu <script> Plugin.Add\ Correction <SID>Add

noremap <SID>Add :call <SID>Add(expand("<cword>"), 1)<CR>

function s:Add(from, correct)
  let to = input("type the correction for " . a:from . ": ")
  exe ":iabbrev " . a:from . " " . to
  if a:correct | exe "normal viws\<C-R>\" \b\e" | endif
  let s:count = s:count + 1
  echo s:count . " corrections now"
endfunction

if !exists(":Correct")
  command -nargs=1 Correct :call s:Add(<q-args>, 0)
endif

let &cpo = s:save_cpo
unlet s:save_cpo

