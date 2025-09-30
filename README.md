### A minimalistic start page for the Neovim editor.

The starting page for the nvim editor contains lists of three types.

The first type is previously opened files.

The second list is sessions. These are project directories that contain a saved nvim session file.
The session list is stored in a text file in the ~/.config/nvim/ directory, for example, the .session file, and is filled in manually.
Example contents of the session list file:
```
~/js/svelte/books
~/js/svelte/demo
```

The third list is configurable links to necessary files.

Example:
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
<End start page>
```

---
#### Installation and Usage:
```
DEFAULT_OPTIONS:
title = "Start screen nvim by © Tkachenkosi. 2025"
count_recent = 20,           -- Показывать только 20 последних файлов
session_name = "/.mysession", -- Использовать другое имя файла сессии
	pinned = {
		{"c", "~/.config/nvim/lua/core/configs.lua"},
		{"m", "~/.config/nvim/lua/core/mappings.lua"},
		{"l", "~/.config/nvim/lua/core/lsp.lua"},
		{"s", "~/.config/nvim/.session"},



Setting up for Lazy:
In the plugins/malpha.lua file, we add the commands:

return {
	"tkachenkosi/malpha.nvim",
	config = function()
			require("malpha").setup({
                title = "Start screen",
				count_recent = 15,
			})
			require("malpha").enable_autostart()
	end,
	event = "VimEnter",
}
```
#### Keys in the buffer start screen:
q      - close start screen and quit nvim
CR     - open the selected buffer
