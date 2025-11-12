```markdown
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
