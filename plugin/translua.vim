" vim:set ts=8 sts=2 sw=2 tw=0 et:

command! -nargs=1 -complete=function TransLua call translua#main(<f-args>)
