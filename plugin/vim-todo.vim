
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

exec g:_vimtodopy "\n
\import vim,os,sys\n
\\n
\module_folder = os.path.dirname(vim.eval('s:SourcedFile'))\n
\sys.path.append(module_folder)\n"

"
" TodoCreateBox
" Create a single checkbox.
"
function! TodoCreateBox()
exec g:_vimtodopy "\n
\\n
\import localtodo\n
\localtodo.TodoCreateBox()\n"
endfunction
command TodoCreateBox call TodoCreateBox()

"
" TodoRemoveBox
" Remove the checkbox.
"
function! TodoRemoveBox()
exec g:_vimtodopy "\n
\\n
\import localtodo\n
\localtodo.TodoRemoveBox()\n"
endfunction
command TodoRemoveBox call TodoRemoveBox()

"
" TodoToggle
" Toggles the checkbox for the current line, or creates
" a new empty checkbox if it isn't there yet.
"
function! TodoToggle()
exec g:_vimtodopy "\n
\\n
\import localtodo\n
\localtodo.TodoToggle()\n"
endfunction
command TodoToggle call TodoToggle()

