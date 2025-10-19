-- Format code

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local CodeFormatter = {
    'stevearc/conform.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},

    config = function()
        require('conform').setup {
            formatters_by_ft = {
                astro = { 'prettier' },
                c = { 'clang-format' },
                cpp = { 'clang-format' },
                css = { 'prettier' },
                dart = { 'dart_format' }, -- dart use 2 spaces force
                html = { 'prettier' },
                javascript = { 'prettier' },
                json = { 'prettier' },
                jsonc = { 'prettier' },
                lua = { 'stylua' },
                typescript = { 'prettier' },
            },
        }

        local do_format = function()
            require('conform').format { async = true, lsp_fallback = true }
        end

        vim.keymap.set('n', '<leader>lf', do_format, { desc = 'Format Current Buffer', noremap = true, silent = true })

        vim.api.nvim_create_user_command('Format', do_format, { desc = 'Format Current Buffer' })
    end,
}

return CodeFormatter
