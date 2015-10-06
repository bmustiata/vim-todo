vim-todo
========

A super simple plugin that generates checkboxes that can be checked and unchecked.

Unlike other plugins allows different character for the checked and the unchecked, so you can use the Unicode ones.

[https://en.wikipedia.org/wiki/Check_mark](https://en.wikipedia.org/wiki/Check_mark)

[https://en.wikipedia.org/wiki/X_mark](https://en.wikipedia.org/wiki/X_mark)

Usage and Installation
----------------------

With pathogen, inside your `~/.vim/bundle`

```shell
git clone https://github.com/bmustiata/vim-todo/
```

Recommended usage is to bind `space` to `TodoToggle`, into your `.vimrc`.

```vim
map <Space> :TodoToggle<cr>
```

Example Lists
-------------

### Default settings

Output in vim:

```text
[ ] Line 1
    [x] Task 1
    [x] Task 2
    [ ] Task 3
```

### Custom Check Mark

Vim settings:

```vim
let g:TodoItemChecked = '☒'
let g:TodoItemUnChecked = '☐'
let g:TodoShowSquareBrackets = 0
```

Output in Vim:

```text
☐ Line 1
    ☒ Task 1
    ☒ Task 2
    ☐ Task 3
```

### Custom Words

Vim settings:

```vim
let g:TodoItemChecked = 'yes'
let g:TodoItemUnChecked = 'no '
```

Output in Vim:

```text
[no ] Line 1
    [yes] Task 1
    [yes] Task 2
    [no ] Task 3
```

### Custom Words without Brackets

Vim settings:

```vim
let g:TodoItemChecked = 'PASSED'
let g:TodoItemUnChecked = 'FAILED'
let g:TodoShowSquareBrackets = 0
```

Output in Vim:

```text
FAILED Line 1
    PASSED Task 1
    PASSED Task 2
    FAILED Task 3
```

Commands
--------

This plugin exports the following commands to your Vim:

### TodoCreateBox

Creates a checkbox for the current text.

### TodoRemoveBox

Removes a checkbox for the current text.

### TodoToggle

Toggles the current checkbox.

Example
-------

`TodoToggle` on the first line:
```text
[ ] 1. Go to the sea
2. Watch the sea
3. Go back
```

`TodoToggle` again:
```text
[x] 1. Go to the sea
2. Watch the sea
3. Go back
```

And `TodoToggle` again:
```text
[ ] 1. Go to the sea
2. Watch the sea
3. Go back
```

Configuration Variables
-----------------------

The plugin allows configuration with the following variables:

#### 1. g:TodoItemChecked

A string that specifies what characters to be used for the check value.
If the `g:TodoShowSquareBrackets` is `1` then the expression must not contain
`]`, otherwise it must not contain an empty space.

#### 2. g:TodoItemUnChecked

A string that specifies what characters to be used for the unchecked value.
If the `g:TodoShowSquareBrackets` is `1` then the expression must not contain
`]`, otherwise it must not contain an empty space.

#### 3. g:TodoShowSquareBrackets

`0` or `1`, if to show the square brackets around the items checked or unchecked.

