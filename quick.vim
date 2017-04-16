" quick load demo global plugin
" last changed: 2017-04-16
" maintainer: nishitaniyuki
" license: this file is placed in the public domain.

" === WARNING ===============================================================
"
" if your vim version is greater than 7, it's better to use `autoload`.
"
" ===========================================================================

if !exists("s:did_load")
  command -nargs=* BNRead call BufNetRead(<f-args>)
  map <F19> :call BufNetWrite('something')<CR>

  let s:did_load = 1
  exe 'au FuncUndefined BufNet* source' . expand('<sfile>')
  finish
endif

function BufNetRead(...)
  echo 'BufNetRead(' . string(a:000) .')'
  " read func is placed here
endfunction

function BufNetWrite(...)
  echo 'BufNetWrite(' . string(a:000) .')'
  " write func is placed hare
endfunction

