" vim:set ts=8 sts=2 sw=2 tw=0 et:

let s:LUAMARK = '" LUA TRANSLATED'

function! translua#getfunc(name)
  redir => str
  silent execute "function " . a:name
  redir END
  let lines = split(str, '\n')
  return map(lines, 'substitute(v:val, "\\\m^\\\d*\\\s*  ", "", "")')
endfunction

function! translua#tolua(name, vimfunc)
  " TODO: translate a:vimfunc to a lua function.
  return [ 
        \ 'function Fib(n)',
        \ '  if n < 2 then',
        \ '    return n',
        \ '  else',
        \ '    return Fib(n - 1) + Fib(n - 2)',
        \ '  end',
        \ 'end',
        \]
endfunction

function! translua#tovim2(name, vimfunc, luafunc)
  " TODO: generate a vim wrapper function.
  return [
        \ 'function! Fib(n)',
        \ '  let r = [ a:n ]',
        \ '  lua local r = vim.eval("r"); r[0] = Fib(r[0])',
        \ '  return r[0]',
        \ 'endfunction',
        \]
endfunction

function! translua#translate(name, vimfunc1)
  " Check translated mark.
  if a:vimfunc1[1] ==# s:LUAMARK
    return {}
  endif
  " Translate a function.
  let luafunc = translua#tolua(a:name, a:vimfunc1)
  let vimfunc2 = translua#tovim2(a:name, a:vimfunc1, luafunc)
  if len(luafunc) == 0 || len(vimfunc2) == 0
    " FIXME: return error code or so.
    return {}
  endif
  " Mark as translated.
  let vimfunc2[0] = substitute(vimfunc2[0], '^function ', 'function! ', '')
  call insert(vimfunc2, s:LUAMARK, 1)
  return { 'luafunc': luafunc, 'vimfunc': vimfunc2 }
endfunction

function! translua#register_luafunc(name, luafunc)
  " FIXME: register a lua function with multiline format.
  execute "lua " . join(a:luafunc, "; ")
endfunction

function! translua#register_vimfunc(name, vimfunc)
  execute join(a:vimfunc, "\n")
endfunction

function! translua#main(name)
  let vimfunc = translua#getfunc(a:name)
  let translated = translua#translate(a:name, vimfunc)
  if len(translated) == 0
    return 0
  endif
  call translua#register_luafunc(a:name, translated.luafunc)
  call translua#register_vimfunc(a:name, translated.vimfunc)
endfunction
