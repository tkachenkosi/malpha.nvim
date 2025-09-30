### A minimalistic start page for the Neovim editor.

The starting page for the nvim editor contains lists of three types.

The first type is previously opened files.

The second list is sessions. These are project directories that contain a saved nvim session file.
The session list is stored in a text file in the ~/.config/nvim/ directory, for example, the .session file, and is filled in manually.
Example contents of the session list file:

~/js/svelte/books
~/js/svelte/demo

The third list is configurable links to necessary files.

---
#### Installation and Usage:
```
DEFAULT_OPTIONS:
count_recent = 20,           -- Показывать только 15 последних файлов
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
				count_recent = 20,
			})
			require("malpha").enable_autostart()
	end,
	event = "VimEnter",
}
```
#### Keys in the buffer start screen:
q      - close start screen and quit nvim
CR     - open the selected buffer
