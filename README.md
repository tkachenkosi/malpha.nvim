## Malpha.nvim

A minimalistic start page (dashboard) for Neovim.  
Displays recent files, project sessions, and pinned shortcuts – all in one clean screen.

### Concept – How the Dashboard Works

Malpha.nvim replaces the empty Neovim start screen with a useful workspace overview.  
It is divided into **three logical sections**:

1. **Recent Files** – automatically populated from `vim.v.oldfiles` (your editing history).  
2. **Sessions** – project directories where you saved a Neovim session (`:mksession`).  
3. **Pinned Files** – manually defined shortcuts to important files or folders.

> **Session** means a Neovim session file (usually `.session` or custom name) that stores window layout, open buffers, etc.  
> Malpha reads a **list of session directories** from a plain text file. By default this file is  
> `~/.config/nvim/.mysession`.  
> Each line is a full path to a project folder, e.g.  
> ```
> ~/projects/myapp
> ~/projects/website
> ```
> The dashboard then shows these paths prefixed with a colon `:` and lets you open Neovim inside that directory with the saved session restored (if a session file exists inside).

### Features

- 📁 **Recent files** – quick access to last edited files  
- 🚀 **Session management** – open projects with their stored session  
- 📌 **Pinned files** – assign one‑key shortcuts (e.g. `c` for `configs.lua`)  
- 🎨 **Customizable** – colors, title, footer, number of recent items  
- ⚡ **Lightweight** – no external dependencies, pure Lua

### Layout Example

© Start screen

```
[n] New file

"~/js/svelte/money/index.html"
"~/nvim/malpha.nvim/README.md"
~/.config/nvim/lua/core/configs.lua

: ~/nvim/malpha.nvim
: ~/go/src/money
: ~/js/svelte/demo

[c] ~/.config/nvim/lua/core/configs.lua
[m] ~/.config/nvim/lua/core/mappings.lua
[l] ~/.config/nvim/lua/core/lsp.lua
```

### Where to Define Your Session List

1. Create a file at `~/.config/nvim/.mysession` (or change the name with `session_name` option).  
2. Write one absolute path per line – each is a **project root** that may contain a session file.  
3. Example content:
~/projects/website
~/projects/api
~/config/nvim

4. When you press `Enter` on a session line, Malpha will:
- `cd` into that directory
- open Neovim and try to restore the session (if a session file exists inside)

> 💡 **Tip**: Save a session in a project with `:mksession! .session` (the default session file name).  
> Malpha looks for `.session` (or the name you set in `session_name`).

### Installation

```lua
vim.pack.add({
	{
		src = "https://github.com/tkachenkosi/malpha.nvim.git",
		name = "malpha.nvim",
		version = "master",
	},
})

require("malpha").setup({
	count_recent = 25,
	add_filter = true,
})

require("malpha").enable_autostart()
```

Configuration
Option	Default	Description
title	"Start screen"	Header text
footer	""	Footer text
color_title	"#3b77b3"	Color of the title
color_footer	"#2f5e8c"	Color of the footer
count_recent	15	How many recent files to show
session_name	".mysession"	File that stores the session list (one path per line)
add_filter	false	Filter out current directory from recent files
pinned	{} (see example below)	List of {key, path} for quick access

Default pinned files (example)
```lua
pinned = {
  {"c", "~/.config/nvim/lua/core/configs.lua"},
  {"m", "~/.config/nvim/lua/core/mappings.lua"},
  {"l", "~/.config/nvim/lua/core/lsp.lua"},
  {"s", "~/.config/nvim/.session"},
}
```

Full custom configuration

```lua
require("malpha").setup({
  title = "My Workspace",
  footer = "Ready to code!",
  color_title = "#ff6b6b",
  color_footer = "#51cf66",
  count_recent = 10,
  add_filter = true,
  session_name = ".projects",
  pinned = {
    {"n", "~/.config/nvim/init.lua"},
    {"z", "~/.zshrc"},
    {"p", "~/projects/"},
  },
})
```

### License
MIT License



































# Malpha.nvim

### A minimalistic start page for the Neovim editor

A clean and customizable start screen that displays your recent files, sessions, and pinned files for quick access to your development environment.

## Features


- **Recent Files** - Automatically tracks and displays recently opened files
- **Session Management** - Quick access to your project sessions  
- **Pinned Files** - Custom shortcuts to frequently used files and configurations
- **Clean Interface** - Minimal design with customizable colors and layout
- **Lightweight** - Fast loading with no heavy dependencies

## Layout

The start screen organizes your workspace into three intuitive sections:
```markdown

```
© Start screen

[n] New file

~/js/svelte/money/index.html
~/js/svelte/money/src/tools/confirm.css
~/nvim/mbuffers.nvim/README.md
~/.config/nvim/lua/core/configs.lua

: ~/nvim/malpha.nvim
: ~/js/svelte/books
: ~/go/src/money
: ~/js/svelte/money
: ~/js/svelte/demo

[c] ~/.config/nvim/lua/core/configs.lua
[m] ~/.config/nvim/lua/core/mappings.lua
[l] ~/.config/nvim/lua/core/lsp.lua
[s] ~/.config/nvim/.session
```

### Section Details

**Recent Files** - Automatically populated from your editing history (first file list)

**Sessions** - Project directories containing saved nvim session files (lines starting with `:`)
- Sessions are stored in `~/.config/nvim/.mysession` (configurable)
- Manually edit this file to add your project paths:
```
~/js/svelte/books
~/js/svelte/demo
```

**Pinned Files** - Custom shortcuts to your most important files (last list with key bindings)

## Installation
```

### Lazy.nvim

```lua
return {
  "tkachenkosi/malpha.nvim",
  event = "VimEnter",
  config = function()
    require("malpha").setup({
      title = "Start screen",
      count_recent = 15,
    })
    require("malpha").enable_autostart()
  end,
}
```

### Packer.nvim

```lua
use {
  "tkachenkosi/malpha.nvim",
  config = function()
    require("malpha").setup({
      title = "Start screen",
      count_recent = 15,
    })
    require("malpha").enable_autostart()
  end,
}
```

## Configuration

```lua
require("malpha").setup({
  -- Window appearance
  title = "Start screen nvim",
  footer = "© Tkachenkosi. 2025",
  color_title = "#3b77b3",
  color_footer = "#2f5e8c",
  
  -- File management
  count_recent = 20,           -- Show only 20 recent files
  session_name = ".mysession", -- Session file name
  
  -- Pinned files (quick access)
  pinned = {
    {"c", "~/.config/nvim/lua/core/configs.lua"},
    {"m", "~/.config/nvim/lua/core/mappings.lua"},
    {"l", "~/.config/nvim/lua/core/lsp.lua"},
    {"s", "~/.config/nvim/.session"},
  },
})
```

### Custom Configuration Example

```lua
require("malpha").setup({
  title = "My Workspace",
  footer = "Ready to code!",
  color_title = "#ff6b6b",
  color_footer = "#51cf66",
  count_recent = 10,
  add_filter = true,
  session_name = ".projects",
  pinned = {
    {"n", "~/.config/nvim/init.lua"},
    {"z", "~/.zshrc"},
    {"p", "~/projects/"},
  },
})
```

## Key Bindings

When the start screen is active:

- `q` - Close start screen and quit Neovim
- `Enter` - Open the selected buffer/file
- `j`/`k` - Navigate up and down the list
- `c`, `m`, `l`, `s` - Quick jump to pinned files

## License

MIT © Tkachenkosi 2025
```
