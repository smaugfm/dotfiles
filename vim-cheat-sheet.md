## Insert mode
| Command                   | Description
| -------                   | -----------
| `CTRL-W`                  | delete a word under cursor (*backspace*)
| `CTRL-U`                  | delete to the start of line
| `CTRL-R{register}`        | insert contents of the register **as if it was typed**
| `CTRL-R CTRL-R{register}` | insert contents of the register **literally**
| `CTRL-R CTRL-P{register}` | insert contents of the register **literally** and fix indents
| `CTRL-T`                  | Indent
| `CTRL-D`                  | Unindent
| `CTRL-V{code}`            | Insert character by code (`ga` outputs codes of characters)

#### Insert mode tips
| Command   | Description
| -------   | -----------
| `<C-o>zz` | Center screen by cursor and back to insert mode

## Vim-go
| Command       | Description
| -------       | -----------
| `<F5>`        | Run
| `<leader>b`   | Build with :GoBuild
| `<leader>rb`  | Build with console go build
| `<leader>rt`  | Show syntacits properties under cursor :GoDescribe
| `<F2>`        | :GoVet
| `<S-F2>`      | :GoMetaLinter
| `<leader>rw`  | :GoImplements
| `<leader>rf`  | :GoReferrers
| `<leader>rr`  | :GoRename
| `<leader>rd`  | :GoDoc
| `<leader>rgd` | :GoDocBrowser
| `<leader>rh`  | Highlihgt semantically word under cursor :GoSameIdsAutoToggle


## Ranges
| Command             | Lines acted on
| -------             | --------------
| `:d`                | Current line.
| `:.d`               | Current line.
| `:1d`               | First line.
| `:$d`               | Last line.
| `:1,$d`             | All lines.
| `:%d`               | All lines (syntactic sugar for `1,$`).
| `:.,5d`             | Current line to line 5.
| `:,5d`              | Also current line to line 5.
| `:,+3d`             | Current line and the next 3 lines.
| `:1,+3d`            | First line to current line + 3.
| `:,-3d`             | Current line and the last 3 lines. (Vim will prompt you, since this is a reversed range.) |
| `:3,'xdelete`       | Lines 3 to the line marked by [mark](#marks) x.
| `:/^foo/,$delete`   | From the next line that starts with "foo" to the end.
| `:/^foo/+1,$delete` | From the line after the line that starts with "foo" to the end.

## Normal mode
| Command      | Description
| -------      | -----------
| `Q`          | format current selection
| `gV`         | visual select last inserted text
| `<leader>s`  | save session
| `<leader>cd` | change current directory to file's directory
| `:w!!`       | sudo write file

## Indent-objects
| Command | Description
| ------- | -----------
| `ai ii` | *an* or *inner* indentation level (and line above)
| `aI iI` | *an* or *inner* indentation level

## Vim-surround
| Command                   | Description
| -------                   | -----------
| `cs[from][with]`          | change surround **from** to **with**
| `ds[target]`              | delete **target** surround
| `ys[text_obj][with]`      | surrond **textObj** with **with**
| `{Visual}S[with]`         | surround in visual mode **with**

## Vim-commentary
| Command               | Description
| -------               | -----------
| `gc{motion}`          | Toggle comment out over **motion**
| `gc{text_obj}`        | Toggle comment out over **text object**
| `[count]gcc`          | Toggle comment out **count** lines
| `{Visual}gc`          | Toggle comment out **visual** selection
| `:[range]Commentary`  | Toggle comment **range** lines

## Tabularize
    :[range]Tabularize /{regex}/{before}{at}{after}

Split lines by **{regex}** into fields, trim spaces,
pad with spaces to the same length, join back.  
Formats are: `r|l|c[0-9]+` and stand for **right**, **left** or **center** 
justification with specified padding.
Three formats can be specified for **before**, **at** and **after** delimiter.

## CtrlP
| Command               | Description
| -------               | -----------
| `<C-f>` | Cycle mode forward in CtrlP
| `<C-b>` | Cycle mode backward in CtrlP
| `<C-j>` | Move down
| `<C-k>` | Move up
| `<CR>` | Open in current window
| `<C-t>` | Open in a new tab
| `<C-b>` | Open in a vertical split (:vsp)
| `<C-s>` | Open in a horizontal split (:sp)

