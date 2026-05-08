vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<space>", "<nop>")
vim.g.mapleader = " "

-- Movement mappings
local mappings = {
  {
    mode = { "n", "x" },
    suffix = "n",
    command = "j",
  },
  {
    mode = { "n", "x" },
    suffix = "N",
    command = "J",
  },
  {
    mode = { "n", "x" },
    suffix = "<c-n>",
    command = "10j",
  },
  {
    mode = { "n", "x" },
    suffix = "<c-k>",
    command = "10k",
  },
  {
    mode = { "n", "x" },
    suffix = "<c-h>",
    command = "zH_",
  },
  {
    mode = "o",
    suffix = "<c-h>",
    command = "_",
  },
  {
    mode = { "n", "x", "o" },
    suffix = "<c-l>",
    command = "$",
  },
}

for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping.mode, mapping.suffix, mapping.command, mapping.opts)
end

-- Search remappings
vim.keymap.set("n", ";", "<cmd>noh<cr>")
vim.keymap.set("n", "j", "nzz")
vim.keymap.set("n", "J", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "g*", "g*zz")
vim.keymap.set("n", "g#", "g#zz")

-- easy update and close
vim.keymap.set("n", "<leader>x", "<cmd>xa<cr>")

-- easy paste in insert mode
vim.keymap.set("i", "<c-r>", '<c-r>"')
