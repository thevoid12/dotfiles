# list of my custom configured keybindings along with my common vim commands 
---

# Navigation

| Shortcut        | Action                    |
|-----------------|----------------------------|
| `Ctrl + h`      | Move to left window         |
| `Ctrl + j`      | Move down window        |
| `Ctrl + k`      | Move up window              |
| `Ctrl + l`      | Move to right window        |
| `Space + ,`     | Show all editors tabs which are open           |
| `Space + e`     | Open sidebar                |
| `Space s g`     | Find in files               |
| `Space g g`     | Go to Git                   |
| `Tab`           | Next tab in group           |
| `Shift + Tab`   | Previous tab in group       |
| `s h`           | Split editor (horizontal)   |
| `s v`           | Split editor (vertical)     |
| `capslock capslock`           | mapped to escape key shift modes   |

# Coding

| Shortcut           | Action                                          |
|--------------------|-------------------------------------------------|
| `Shift + j`         | Move line down (editor mode)                   |
| `Shift + k`         | Move line up (editor mode)                     |
| `Shift + k`         | Show hover (context info)                      |
| `Space c a`         | Show code action                               |
| `Space c r`         | Rename variable                                |
| `Space c s`         | Show symbol                                    |
| `Space b d`         | Close active editor                            |
| `Space b o`         | Close other editors                            |
| `Space Space`       | Quick open (file or project)                   |
| `Space g d`         | Go to definition                               |
| `Space g r`         | Go to references                               |
| `Space g i`         | Go to implementation                           |
| `Space s g`         | Find in files                                  |
| `Ctrl + n`          | Add selection to next find match (normal/visual mode) |

# File Explorer

| Shortcut          | Action                |
|-------------------|------------------------|
| `r`               | Rename file             |
| `c`               | Copy file               |
| `p`               | Paste file              |
| `x`               | Cut file                |
| `d`               | Delete file             |
| `Enter`           | Open file               |
| `s`               | Open file to side       |
| `Shift + s`       | Split editor down       |
| `a`               | Add new file            |
| `Shift + a`       | Add new folder          |

---
# basic commands that i use everyday
https://vim.rtorr.com/
## cursor navigation
| Shortcut          | Action                |
|-------------------|------------------------|
|b        |jump backwards to the start of the word           |
|$        | end of the line                                  | 
|0        |jump to the start of the line           |
|gg        |first line of the document           |
|G        |last line of the document           |
|5gg        |move to the fifth line    |
|  } { | jump to next and previous paragraph (or function/block, when editing code)|
|   Ctrl + e     |  move screen down one line (without moving cursor)         |
|  Ctrl + y      |  move screen up one line (without moving cursor)         |
| f +letter      | now forward to the next selected letter eg f+o will move to next o         |
|F  +letter      | now forward to the next selected letter eg F+o will move to next o         |
## insert modes
| Shortcut          | Action                |
|-------------------|------------------------|
|    i   |  insert before the cursor         |
|   a     |    insert (append) after the cursor       |
|A        |insert (append) at the end of the line           |
|  o      |  append (open) a new line below the current line          |
|O        |  append (open) a new line above the current line          |
|   ctrl+c/escape     |exit insert mode           |
## cut copy paste
this is a test text 'to learn these changes'
| Shortcut          | Action                |
|-------------------|------------------------|
|yy        |  copy the line         | 
|y        |  copy the selected word         | 
|yi{        |  copy text between curly brackes |aei{}xtbetween curly brackes
|2yy        |copy 2 lines           |
|p        |paste           |
|ciw        |deletes the word and goes into insert mode           |
|dw  |delete the word and the space next to it   |
| diw |delete the word alone   |
|db |delete the word before or if you are in the middle of the word delete the remaining characters before|
|D  |delete until the end of the line from cursor so wont remove the line  |
| dd |delete the whole line   |
|x |cut the character alone|
## editing 
| Shortcut          | Action                |
|-------------------|------------------------|
| cc or S |replace entire line and enter insert mode   |
| r| replace 1 character |
| R|  replace more than one character, until ESC is pressed.|
|cw  |change and replace from cursor to the end of the line   |
|  s|delete character and substitute with text   |
| u |oundo  |
| U |restore(undo) last changed line   |
|ctrl r  |   |redo
|.  |repeat the last command   |
## visual mode
|  |   |
| a{ | select everything within {}  |
|   )|
|  |   |
|  |   |
|  |   |
|  |   |
|  |   |
|  |   |
|  |   |


