
if !exists("g:TodoItemChecked")
    let g:TodoItemChecked='x'
endif

if !exists("g:TodoItemUnChecked")
    let g:TodoItemUnChecked=' '
endif

if !exists("g:TodoShowSquareBrackets")
    let g:TodoShowSquareBrackets=1
endif

" -------------------------------------------------------------------------
" Create a command for either python 2 or 3, depending on what is available
" on the platform.
" -------------------------------------------------------------------------
let g:_vimtodopy=":py3 "
if !has("python3")
   if !has("python")
       echo  "vim-todo requires Python 2 or 3."
       unlet g:_vimtodopy
       return
   endif
   let g:_vimtodopy=":py "
endif


" -------------------------------------------------------------------------
" Register the commands using the python version
" -------------------------------------------------------------------------

"
" Register the current plugin folder into the sys.path
"
let s:SourcedFile=expand("<sfile>")
exec g:_vimtodopy << endpython
import vim,os,sys

module_folder = os.path.dirname(vim.eval('s:SourcedFile'))
sys.path.append(module_folder)
endpython

"
" TodoCreateBox
" Create a single checkbox.
"
function! TodoCreateBox()
exec g:_vimtodopy << endpython

import localtodo
localtodo.TodoCreateBox()

endpython
endfunction
command TodoCreateBox call TodoCreateBox()

"
" TodoRemoveBox
" Remove the checkbox.
"
function! TodoRemoveBox()
exec g:_vimtodopy << endpython

import localtodo
localtodo.TodoRemoveBox()

endpython
endfunction
command TodoRemoveBox call TodoRemoveBox()

"
" TodoToggle
" Toggles the checkbox for the current line, or creates
" a new empty checkbox if it isn't there yet.
"
function! TodoToggle()
exec g:_vimtodopy << endpython

import localtodo
localtodo.TodoToggle()

endpython
endfunction
command TodoToggle call TodoToggle()

