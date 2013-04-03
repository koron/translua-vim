" vim:set ts=8 sts=2 sw=2 tw=0 et:

call extend(s:, vimlparser#import())

function! luacompiler#register_compilers()
  let s:COMPILERS = {}
  let s:COMPILERS[s:NODE_TOPLEVEL] = function('s:compile_toplevel')
  "let s:COMPILERS[s:NODE_COMMENT] = function('s:compile_comment')
  "let s:COMPILERS[s:NODE_EXCMD] = function('s:compile_excmd')
  let s:COMPILERS[s:NODE_FUNCTION] = function('s:compile_function')
  "let s:COMPILERS[s:NODE_ENDFUNCTION] = function('s:compile_endfunction')
  "let s:COMPILERS[s:NODE_DELFUNCTION] = function('s:compile_delfunction')
  "let s:COMPILERS[s:NODE_RETURN] = function('s:compile_return')
  "let s:COMPILERS[s:NODE_EXCALL] = function('s:compile_excall')
  "let s:COMPILERS[s:NODE_LET] = function('s:compile_let')
  "let s:COMPILERS[s:NODE_UNLET] = function('s:compile_unlet')
  "let s:COMPILERS[s:NODE_LOCKVAR] = function('s:compile_lockvar')
  "let s:COMPILERS[s:NODE_UNLOCKVAR] = function('s:compile_unlockvar')
  let s:COMPILERS[s:NODE_IF] = function('s:compile_if')
  "let s:COMPILERS[s:NODE_ELSEIF] = function('s:compile_elseif')
  "let s:COMPILERS[s:NODE_ELSE] = function('s:compile_else')
  "let s:COMPILERS[s:NODE_ENDIF] = function('s:compile_endif')
  "let s:COMPILERS[s:NODE_WHILE] = function('s:compile_while')
  "let s:COMPILERS[s:NODE_ENDWHILE] = function('s:compile_endwhile')
  "let s:COMPILERS[s:NODE_FOR] = function('s:compile_for')
  "let s:COMPILERS[s:NODE_ENDFOR] = function('s:compile_endfor')
  "let s:COMPILERS[s:NODE_CONTINUE] = function('s:compile_continue')
  "let s:COMPILERS[s:NODE_BREAK] = function('s:compile_break')
  "let s:COMPILERS[s:NODE_TRY] = function('s:compile_try')
  "let s:COMPILERS[s:NODE_CATCH] = function('s:compile_catch')
  "let s:COMPILERS[s:NODE_FINALLY] = function('s:compile_finally')
  "let s:COMPILERS[s:NODE_ENDTRY] = function('s:compile_endtry')
  "let s:COMPILERS[s:NODE_THROW] = function('s:compile_throw')
  "let s:COMPILERS[s:NODE_ECHO] = function('s:compile_echo')
  "let s:COMPILERS[s:NODE_ECHON] = function('s:compile_echon')
  "let s:COMPILERS[s:NODE_ECHOHL] = function('s:compile_echohl')
  "let s:COMPILERS[s:NODE_ECHOMSG] = function('s:compile_echomsg')
  "let s:COMPILERS[s:NODE_ECHOERR] = function('s:compile_echoerr')
  "let s:COMPILERS[s:NODE_EXECUTE] = function('s:compile_execute')
  "let s:COMPILERS[s:NODE_TERNARY] = function('s:compile_ternary')
  "let s:COMPILERS[s:NODE_OR] = function('s:compile_or')
  "let s:COMPILERS[s:NODE_AND] = function('s:compile_and')
  "let s:COMPILERS[s:NODE_EQUAL] = function('s:compile_equal')
  "let s:COMPILERS[s:NODE_EQUALCI] = function('s:compile_equalci')
  "let s:COMPILERS[s:NODE_EQUALCS] = function('s:compile_equalcs')
  "let s:COMPILERS[s:NODE_NEQUAL] = function('s:compile_nequal')
  "let s:COMPILERS[s:NODE_NEQUALCI] = function('s:compile_nequalci')
  "let s:COMPILERS[s:NODE_NEQUALCS] = function('s:compile_nequalcs')
  "let s:COMPILERS[s:NODE_GREATER] = function('s:compile_greater')
  "let s:COMPILERS[s:NODE_GREATERCI] = function('s:compile_greaterci')
  "let s:COMPILERS[s:NODE_GREATERCS] = function('s:compile_greatercs')
  "let s:COMPILERS[s:NODE_GEQUAL] = function('s:compile_gequal')
  "let s:COMPILERS[s:NODE_GEQUALCI] = function('s:compile_gequalci')
  "let s:COMPILERS[s:NODE_GEQUALCS] = function('s:compile_gequalcs')
  "let s:COMPILERS[s:NODE_SMALLER] = function('s:compile_smaller')
  "let s:COMPILERS[s:NODE_SMALLERCI] = function('s:compile_smallerci')
  "let s:COMPILERS[s:NODE_SMALLERCS] = function('s:compile_smallercs')
  "let s:COMPILERS[s:NODE_SEQUAL] = function('s:compile_sequal')
  "let s:COMPILERS[s:NODE_SEQUALCI] = function('s:compile_sequalci')
  "let s:COMPILERS[s:NODE_SEQUALCS] = function('s:compile_sequalcs')
  "let s:COMPILERS[s:NODE_MATCH] = function('s:compile_match')
  "let s:COMPILERS[s:NODE_MATCHCI] = function('s:compile_matchci')
  "let s:COMPILERS[s:NODE_MATCHCS] = function('s:compile_matchcs')
  "let s:COMPILERS[s:NODE_NOMATCH] = function('s:compile_nomatch')
  "let s:COMPILERS[s:NODE_NOMATCHCI] = function('s:compile_nomatchci')
  "let s:COMPILERS[s:NODE_NOMATCHCS] = function('s:compile_nomatchcs')
  "let s:COMPILERS[s:NODE_IS] = function('s:compile_is')
  "let s:COMPILERS[s:NODE_ISCI] = function('s:compile_isci')
  "let s:COMPILERS[s:NODE_ISCS] = function('s:compile_iscs')
  "let s:COMPILERS[s:NODE_ISNOT] = function('s:compile_isnot')
  "let s:COMPILERS[s:NODE_ISNOTCI] = function('s:compile_isnotci')
  "let s:COMPILERS[s:NODE_ISNOTCS] = function('s:compile_isnotcs')
  "let s:COMPILERS[s:NODE_ADD] = function('s:compile_add')
  "let s:COMPILERS[s:NODE_SUBTRACT] = function('s:compile_subtract')
  "let s:COMPILERS[s:NODE_CONCAT] = function('s:compile_concat')
  "let s:COMPILERS[s:NODE_MULTIPLY] = function('s:compile_multiply')
  "let s:COMPILERS[s:NODE_DIVIDE] = function('s:compile_divide')
  "let s:COMPILERS[s:NODE_REMAINDER] = function('s:compile_remainder')
  "let s:COMPILERS[s:NODE_NOT] = function('s:compile_not')
  "let s:COMPILERS[s:NODE_MINUS] = function('s:compile_minus')
  "let s:COMPILERS[s:NODE_PLUS] = function('s:compile_plus')
  "let s:COMPILERS[s:NODE_SUBSCRIPT] = function('s:compile_subscript')
  "let s:COMPILERS[s:NODE_SLICE] = function('s:compile_slice')
  "let s:COMPILERS[s:NODE_CALL] = function('s:compile_call')
  "let s:COMPILERS[s:NODE_DOT] = function('s:compile_dot')
  "let s:COMPILERS[s:NODE_NUMBER] = function('s:compile_number')
  "let s:COMPILERS[s:NODE_STRING] = function('s:compile_string')
  "let s:COMPILERS[s:NODE_LIST] = function('s:compile_list')
  "let s:COMPILERS[s:NODE_DICT] = function('s:compile_dict')
  "let s:COMPILERS[s:NODE_OPTION] = function('s:compile_option')
  let s:COMPILERS[s:NODE_IDENTIFIER] = function('s:compile_identifier')
  "let s:COMPILERS[s:NODE_CURLYNAME] = function('s:compile_curlyname')
  "let s:COMPILERS[s:NODE_ENV] = function('s:compile_env')
  "let s:COMPILERS[s:NODE_REG] = function('s:compile_reg')
endfunction

function! s:compile_toplevel(out, node)
  call s:compile__body(a:out, a:node.body)
endfunction

function! s:compile_function(out, node)
  let name = s:tostr(a:node.left)
  let args = map(a:node.rlist, 's:tostr(v:val)')
  call add(a:out, printf('function %s(%s)', name, join(args, ', ')))
  call s:compile__body(a:out, a:node.body)
  call add(a:out, 'end')
endfunction

function! s:compile_identifier(out, node)
  if a:node.type != s:NODE_IDENTIFIER
    throw 'Not identifier: ' . a:node.type
  endif
  call add(a:out, a:node.value)
endfunction

function! s:compile_if(out, node)
  echomsg 'TODO: implement me: compile_if'
endfunction

function! s:compile__body(out, body)
  for node in a:body
    call s:compile__node(a:out, node)
  endfor
endfunction

function! s:compile__node(out, node)
  if has_key(s:COMPILERS, a:node.type)
    call s:COMPILERS[a:node.type](a:out, a:node)
  else
    throw 'FATAL: Not implemented node for: ' . a:node.type
  end
endfunction

function! s:tostr(node)
  let buf = []
  call s:compile__node(buf, a:node)
  return join(buf, "\n")
endfunction

function! luacompiler#compile(ast)
  " TODO:
  let out = []
  call s:compile__node(out, a:ast)
  return out
endfunction

call luacompiler#register_compilers()
