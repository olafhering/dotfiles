syntax on
" process vim commands, override /etc/vimrc
set modeline

" vim is a text mode application, do not mess with mouse or copy&paste buffers
if !has("gui_running")
  let $DISPLAY = ""
endif

" keep a backup file
set backup

" preserve history
set history=123
set viminfo='12345,<12345,s12345,h

" highlighting the last used search pattern
set hlsearch

" keep a number of lines visible around the cursor
set scrolloff=20

" the dot is not a word boundary
let g:sh_noisk=1

augroup olh
  " Remove all olh autocommands
  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd BufRead *       set formatoptions=tcql nocindent comments&
  autocmd BufRead *.c,*.h set formatoptions=croqlj cindent comments=sr:/*,mb:*,el:*/,://

  " xen.git
  autocmd BufRead xen/*/*.c                   set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead xen/*/*/*.c                 set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead xen/*/*/*/*.c               set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/xentrace/xenalyze/*.c set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/include/*.h           set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/libx?/*.c             set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/libx?/*.h             set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/libx?/*.idl           set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/libs/ctrl/*.[ch]      set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/libs/guest/*.[ch]     set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/libs/light/*.[ch]     set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/misc/*.?              set et tw=80 ts=4 shiftwidth=4 cc=80
  autocmd BufRead tools/xl/*.?                set et tw=80 ts=4 shiftwidth=4 cc=80

  " valgrind.git
  autocmd BufRead coregrind/m_syswrap/*.c set et tw=80 ts=3 shiftwidth=3
  autocmd BufRead include/vki/vki-xen*.h  set et tw=80 ts=4 shiftwidth=4

  " OCaml
  autocmd BufRead *.ml,*.mli              set formatoptions=croqlj et tw=190 ts=2 shiftwidth=2
augroup END

if has("cscope")
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif

hi MatchParen cterm=none ctermbg=green ctermfg=blue
