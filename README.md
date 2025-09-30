### A minimalistic start page for the Neovim editor.
---
#### Installation and Usage:
```
{
"tkachenkosi/malpha.nvim",
config = function()
	require("malpha").setup({
        count_recent = 15,           -- Показывать только 15 последних файлов
        session_name = "/.mysession", -- Использовать другое имя файла сессии
        pinned = {                    -- Свои закреплённые файлы
            {"c", "~/.config/nvim/init.lua"},
            {"p", "~/.config/nvim/lua/plugins.lua"},
            {"s", "~/.config/nvim/.session"},
        }
	})
end,
}

DEFAULT_OPTIONS:
count_recent = 15,           -- Показывать только 15 последних файлов
session_name = "/.mysession", -- Использовать другое имя файла сессии
pinned = {                    -- Свои закреплённые файлы
    {"c", "~/.config/nvim/init.lua"},
    {"p", "~/.config/nvim/lua/plugins.lua"},
    {"s", "~/.config/nvim/.session"},
}


В файле <init.lua> добовляем команды:
local startscreen = require("malpha.nvim")

startscreen.setup({
    count_recent = 20,
    -- ваши настройки
})

startscreen.enable_autostart()
```
#### Keys in the buffer list window:
q      - close start screen and quit nvim
CR     - open the selected buffer

