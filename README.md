### A minimalistic start page for the Neovim editor.
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
