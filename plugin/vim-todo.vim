
if !exists("g:TodoItemChecked")
    let g:TodoItemChecked='x'
endif

if !exists("g:TodoItemUnChecked")
    let g:TodoItemUnChecked=' '
endif

if !exists("g:TodoShowSquareBrackets")
    let g:TodoShowSquareBrackets=1
endif

"
" Register the current plugin folder into the sys.path
"
let s:SourcedFile=expand("<sfile>")
python << endpython
import vim,os,sys

module_folder = os.path.dirname(vim.eval('s:SourcedFile'))
sys.path.append(module_folder)
endpython

"
" TodoCreateBox
" Create a single checkbox.
"
function! TodoCreateBox()
python << endpython

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
python << endpython

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
python << endpython

import localtodo
localtodo.TodoToggle()

endpython
endfunction
command TodoToggle call TodoToggle()

