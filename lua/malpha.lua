-- lua/core/startscreen.lua
local M = {}

-- Настраиваем список закреплённых файлов
local pinned = {
  "~/.config/nvim/init.lua",
  "~/.config/nvim/lua/core/lsp.lua",
  "~/Projects/myproject/main.go",
}

-- Функция запуска стартового экрана
function M.open()
  -- Создаём новый буфер
  vim.cmd("enew")
  local buf = vim.api.nvim_get_current_buf()

  -- Настраиваем его как "специальный"
	-- buftype = "nofile" bufhidden = "wipe" swapfile = false modifiable = true filetype = "startscreen"
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true
  vim.bo[buf].filetype = "startscreen"
  vim.bo[buf].buflisted = false
  vim.bo[buf].textwidth = 0

  local lines = {}

  -- 1️⃣ Заголовок
  table.insert(lines, "© Config by Tkachenkosi 2025")
  table.insert(lines, "")

  -- 2️⃣ Новая сессия
  table.insert(lines, "[N] New file")
  table.insert(lines, "")

  -- 3️⃣ Последние файлы
  table.insert(lines, "📝")
  local oldfiles = vim.v.oldfiles or {}
  for i = 1, math.min(10, #oldfiles) do
    table.insert(lines, string.format("[%d] %s", i, oldfiles[i]))
  end
  table.insert(lines, "")

  -- 4️⃣ Закреплённые
  table.insert(lines, "📌")
  for i, file in ipairs(pinned) do
    table.insert(lines, string.format("[P%d] %s", i, file))
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false

  -- 🧠 Привязка клавиш
  local opts = { noremap = true, silent = true, buffer = buf }
  vim.keymap.set("n", "N", ":enew<CR>", opts)

  -- recent files
  for i = 1, math.min(10, #oldfiles) do
    vim.keymap.set("n", tostring(i), function()
      vim.cmd("edit " .. oldfiles[i])
    end, opts)
  end

  -- pinned
  for i, file in ipairs(pinned) do
    vim.keymap.set("n", "P" .. tostring(i), function()
      vim.cmd("edit " .. file)
    end, opts)
  end

	vim.keymap.set("n", "q", "<cmd>qa<CR>", opts)
end





vim.keymap.set('n', '<F9>', function() M.open() end, {})
return M

