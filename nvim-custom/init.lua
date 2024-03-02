-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- useful options 
vim.wo.relativenumber = true

vim.opt.colorcolumn = "80"

vim.opt.scrolloff = 8

vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.incsearch = true



function EnableLineWrapForTrouble()
    -- Check if the current buffer's file type is "Trouble"
    if vim.bo.filetype == "Trouble" then
        -- Enable line wrap
        vim.wo.wrap = true
    else
        -- Disable line wrap
        vim.wo.wrap = false
    end
end

-- Set up an autocmd to trigger the function when a buffer is loaded
vim.cmd([[
augroup LineWrapForTrouble
    autocmd!
    autocmd BufEnter * lua EnableLineWrapForTrouble()
augroup END
]])

-- for leap.nvim
-- require('leap').create_default_mappings()

