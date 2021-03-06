vim-todo
========

A super simple plugin that generates checkboxes that can be checked, unchecked, and in progress. Simple to use, full of features.


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

### GitHub Task List

```text
- [ ] Task 1
- [x] Task 2
- [x] Task 3
```

Has the output:

- [ ] Task 1
- [x] Task 2
- [x] Task 3

### Default settings

Output in vim:

```text
[ ] Line 1
    [x] Task 1
    [x] Task 2
    [ ] Task 3
```

Features
--------

### Custom Check And Uncheck Mark

You can use custom check marks, and disable the square brackets generation.

Thus you can use characters such as:

[https://en.wikipedia.org/wiki/Check_mark](https://en.wikipedia.org/wiki/Check_mark)

[https://en.wikipedia.org/wiki/X_mark](https://en.wikipedia.org/wiki/X_mark)

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

### Indent Aware

`vim-todo` is aware of unordered or ordered lists, and keeps the indentation inside the list.

For example toggling the todo checkbox on each line for:

```text
Overall
    9.  List:
        i.   First item
        ii.  Second item
        iii. Third item
    10. List:
        i.   First item
        ii.  Second item
        iii. Third item
```
will result in:

```text
[ ] Overall
    9.  [ ] List:
        i.   [ ] First item
        ii.  [ ] Second item
        iii. [ ] Third item
    10. [ ] List:
        i.   [ ] First item
        ii.  [ ] Second item
        iii. [ ] Third item
```

Commands
--------

This plugin exports the following commands to your Vim:

`TodoToggle`

Toggles the current checkbox. Creates it if needed.

`TodoCreateBox`

Creates a checkbox for the current text.

`TodoRemoveBox`

Removes a checkbox for the current text.

Example
-------

Initial text:
```text
1. Go to the sea
2. Watch the sea
3. Go back
```

`TodoToggle` on the first line:
```text
1. [ ] Go to the sea
2. Watch the sea
3. Go back
```

`TodoToggle` again:
```text
1. [x] Go to the sea
2. Watch the sea
3. Go back
```

And `TodoToggle` again:
```text
1. [-] Go to the sea
2. Watch the sea
3. Go back
```

And `TodoToggle` again:
```text
1. [ ] Go to the sea
2. Watch the sea
3. Go back
```

And `TodoToggle` again:
```text
1. [x] Go to the sea
2. Watch the sea
3. Go back
```

Etc.

Configuration Variables
-----------------------

The plugin allows configuration with the following variables:

1. `g:TodoItemChecked`

    A string that specifies what characters to be used for the check value.
    If the `g:TodoShowSquareBrackets` is `1` then the expression must not contain
    `]`, otherwise it must not contain the `g:TodoItemUnChecked` or
    `g:TodoItemInProgress`.

2. `g:TodoItemUnChecked`

    A string that specifies what characters to be used for the unchecked value.
    If the `g:TodoShowSquareBrackets` is `1` then the expression must not contain
    `]`, otherwise it must not contain `g:TodoItemChecked` or
    `g:TodoItemInProgress`.

3. `g:TodoItemInProgress`

    A string that specifies what characters to be used for an item that is still
    in progress. If the `g:TodoShowSquareBrackets` is `1` then the expression
    must not contain `]`, otherwise it must not contain `g:TodoItemUnChecked`
    os `g:TodoItemChecked`.

4. `g:TodoShowSquareBrackets`

    `0` or `1`, if to show the square brackets around the items checked or unchecked.

