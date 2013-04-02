" vim:set ts=8 sts=2 sw=2 tw=0 et:

function! Fib(n)
  if a:n < 2
    return a:n
  else
    return Fib(a:n - 1) + Fib(a:n - 2)
  endif
endfunction

function! FibBench(n)
  let start = reltime()
  call Fib(a:n)
  echomsg printf('Fib(%d) in %s secs', a:n, reltimestr(reltime(start)))
endfunction
