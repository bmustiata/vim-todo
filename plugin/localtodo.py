
import vim
import re

try:
    check_character = vim.eval('g:TodoItemChecked')
except Exception as e:
    check_character = 'x'

try:
    uncheck_character  = vim.eval('g:TodoItemUnChecked')
except Exception as e:
    uncheck_character = ' '

try:
    progress_character = vim.eval('g:TodoItemInProgress')
except Exception as e:
    progress_character = '-'

try:
    show_square_brackets = vim.eval('g:TodoShowSquareBrackets')
except Exception as e:
    show_square_brackets = '1'

if show_square_brackets == '0':
    show_square_brackets = False
else:
    show_square_brackets = True

CHECKBOX_INDENT_INDEX=1
CHECKBOX_TICK_INDEX=6
CHECKBOX_TEXT_INDEX=7

if show_square_brackets:
    CHECKBOX_REGEXP = re.compile(r'^(\s*((-\s+)|(\d+\.\s+)|(\w+\.\s+))?)\[(.+)\] (\S+?.*)$')
else:
    CHECKBOX_REGEXP = re.compile(r'^(\s*((-\s+)|(\d+\.\s+)|(\w+\.\s+))?)(\S+) (\S+?.*)$')

SPACES_INDENT_INDEX=1
SPACES_TEXT_INDEX=6
SPACES_REGEXP = re.compile(r'^(\s*((-\s+)|(\d+\.\s+)|(\w+\.\s+))?)(\S+?.*)$')

def TodoCreateBox():
    """
        Creates the checkbox in the current line if it exists.
    """
    current_line = vim.current.range[0]
    if is_todo_line(current_line):
        return # nothing to do
    vim.current.range[0] = create_checkbox(current_line, uncheck_character)


def TodoRemoveBox():
    """
        Removes the checkbox from the current line if it exists.
    """
    current_line = vim.current.range[0]
    if not is_todo_line(current_line):
        return # nothing to do
    vim.current.range[0] = remove_checkbox(current_line)


def TodoToggle():
    """
        Toggles the todo checkbox for the current vim line,
        or creates a new checlbox.
    """
    current_line = vim.current.range[0]

    # if it's not a todo line, just create one
    if not is_todo_line(current_line):
        vim.current.range[0] = create_checkbox(current_line, uncheck_character)
        return

    if is_checked(current_line):
        current_line = remove_checkbox(current_line)
        current_line = create_checkbox(current_line, progress_character)
    elif is_in_progress(current_line):
        current_line = remove_checkbox(current_line)
        current_line = create_checkbox(current_line, uncheck_character)
    else:
        current_line = remove_checkbox(current_line)
        current_line = create_checkbox(current_line, check_character)

    vim.current.range[0] = current_line


def create_checkbox(current_line, character):
    m = SPACES_REGEXP.match(current_line)
    if show_square_brackets:
        current_line = m.group(SPACES_INDENT_INDEX) + '[' + character + '] ' + m.group(SPACES_TEXT_INDEX)
    else:
        current_line = m.group(SPACES_INDENT_INDEX) + character + ' ' + m.group(SPACES_TEXT_INDEX)
    return current_line


def is_checked(current_line):
    m = CHECKBOX_REGEXP.match(current_line)
    if m.group(CHECKBOX_TICK_INDEX) == check_character:
        return True


def is_in_progress(current_line):
    m = CHECKBOX_REGEXP.match(current_line)
    if m.group(CHECKBOX_TICK_INDEX) == progress_character:
        return True


def remove_checkbox(current_line):
    m = CHECKBOX_REGEXP.match(current_line)
    return m.group(CHECKBOX_INDENT_INDEX) + m.group(CHECKBOX_TEXT_INDEX)


def is_todo_line(current_line):
    m = CHECKBOX_REGEXP.match(current_line)
    if not m:
        return False

    ticked_character = m.group(CHECKBOX_TICK_INDEX)

    if ticked_character != check_character and ticked_character != uncheck_character and ticked_character != progress_character:
        return False

    return True

