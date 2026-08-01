# VSCode Vim Keybindings

Custom keybindings for VSCode with Vim extension.

## Setup

1. Install the **Vim** extension from VSCode marketplace (vscodevim.vim)
2. Install the **Vimium** browser extension for vim-like navigation in your browser
3. Open VSCode and go to `File > Preferences > Keyboard Shortcuts`
4. Click the file icon in the top right to open `keybindings.json`
5. Copy the contents of `keybindings.json` from this repo and paste it

## Custom Keybindings

### Navigation

| Shortcut | Action |
|----------|--------|
| `Ctrl + h` | Move to left window |
| `Ctrl + j` | Move to down window |
| `Ctrl + k` | Move to up window |
| `Ctrl + l` | Move to right window |
| `Space + ,` | Show all open editor tabs |
| `Space + e` | Toggle sidebar / file explorer |
| `s h` | Split editor horizontally |
| `s v` | Split editor vertically |
| `Capslock` | Escape (exit insert mode) |

### Coding

| Shortcut | Action |
|----------|--------|
| `Space c a` | Show code actions |
| `Space c r` | Rename symbol |
| `Space c s` | Go to symbol in file |
| `Shift + K` | Show hover info (Normal mode) |
| `Shift + K` | Move line up (Visual Line mode) |
| `Shift + J` | Move line down (Visual Line mode) |
| `Ctrl + n` | Add selection to next find match |
| `Ctrl + a` | Select all |
| `Ctrl + p` | Command palette |
| `Ctrl + o` | Quick open file |

### Buffer/Editor Management

| Shortcut | Action |
|----------|--------|
| `Space Space` | Quick open file |
| `Space b d` | Close active editor |
| `Space b o` | Close other editors |

### Go To

| Shortcut | Action |
|----------|--------|
| `Space g d` | Go to definition |
| `Ctrl + Enter` | Go to definition (jump into called function) |
| `Space g r` | Go to references |
| `Space g i` | Go to implementation |
| `Space g g` | Open Git view |

### Search

| Shortcut | Action |
|----------|--------|
| `Space s g` | Find in files (grep) |
| `Alt + j` | Next search result |
| `Alt + k` | Previous search result |

### Debug

| Shortcut | Action |
|----------|--------|
| `Space d a` | Start debugging |
| `Space d t` | Stop debugging |
| `Space d o` | Step over |
| `Space d b` | Toggle breakpoint |
| `Space d e` | Show debug hover |
| `Space d c` | Continue |

### Tab Management

| Shortcut | Action |
|----------|--------|
| `Alt + ]` | Next tab |
| `Alt + [` | Previous tab |
| `Alt + -` | Navigate back |
| `Alt + =` | Navigate forward |

### File Explorer (when sidebar is focused)

| Shortcut | Action |
|----------|--------|
| `r` | Rename file |
| `c` | Copy file |
| `p` | Paste file |
| `x` | Cut file |
| `d` | Delete file |
| `Enter` | Open file |
| `s` | Open file to side |
| `Shift + s` | Split editor down |
| `a` | Add new file |
| `Shift + a` | Add new folder |

## Basic Vim Commands

Reference: https://vim.rtorr.com/

### Cursor Navigation

| Shortcut | Action |
|----------|--------|
| `b` | Jump backwards to start of word |
| `w` | Jump forward to start of word |
| `e` | Jump forward to end of word |
| `0` | Jump to start of line |
| `$` | Jump to end of line |
| `gg` | Go to first line |
| `G` | Go to last line |
| `5gg` | Go to line 5 |
| `}` | Jump to next paragraph/block |
| `{` | Jump to previous paragraph/block |
| `Ctrl + e` | Scroll screen down one line |
| `Ctrl + y` | Scroll screen up one line |
| `f + char` | Jump forward to character |
| `F + char` | Jump backward to character |

### Insert Mode

| Shortcut | Action |
|----------|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `A` | Insert at end of line |
| `o` | Open new line below |
| `O` | Open new line above |
| `Esc` | Exit insert mode |

### Cut, Copy, Paste

| Shortcut | Action |
|----------|--------|
| `yy` | Copy (yank) line |
| `y` | Copy selection |
| `yi{` | Copy text inside curly braces |
| `2yy` | Copy 2 lines |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `dd` | Delete line |
| `dw` | Delete word and space after |
| `diw` | Delete word only |
| `db` | Delete word before cursor |
| `D` | Delete to end of line |
| `x` | Delete character |

### Editing

| Shortcut | Action |
|----------|--------|
| `cc` or `S` | Replace entire line |
| `cw` | Change word |
| `ciw` | Change inner word |
| `r` | Replace single character |
| `R` | Replace mode until Esc |
| `s` | Delete character and insert |
| `u` | Undo |
| `U` | Undo line changes |
| `Ctrl + r` | Redo |
| `.` | Repeat last command |

### Visual Mode

| Shortcut | Action |
|----------|--------|
| `v` | Enter visual mode |
| `V` | Enter visual line mode |
| `Ctrl + v` | Enter visual block mode |
| `a{` | Select around curly braces |
| `i{` | Select inside curly braces |
| `a)` | Select around parentheses |
| `i)` | Select inside parentheses |

### Search in File

| Shortcut | Action |
|----------|--------|
| `/word` | Search forward for word |
| `?word` | Search backward for word |
| `n` | Next search result |
| `N` | Previous search result |
