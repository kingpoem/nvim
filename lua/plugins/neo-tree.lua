-- File system explorer

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local NeoTree = {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    lazy = true,
    cmd = { 'Neotree' },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },

    config = function()
        require('neo-tree').setup {
            close_if_last_window = false,
            enable_git_status = true,
            enable_diagnostics = true,

            sources = { 'filesystem', 'buffers' },

            source_selector = {
                winbar = true,
                statusline = false,
                show_separator_on_edge = true,
                separator = { left = ' ', right = '' },
                sources = {
                    { source = 'filesystem', display_name = ' 󰉓 Files' },
                    { source = 'buffers', display_name = ' 󰈙 Buf' },
                },
            },

            window = {
                width = 30,
                mappings = {
                    ['<Tab>'] = 'next_source',
                    ['<S-Tab>'] = 'prev_source',
                    ['l'] = function(state)
                        local node = state.tree:get_node()
                        local path = node:get_id()
                        local ext = string.lower(path:match '^.+%.(.+)$' or '')
                        -- stylua: ignore start
                        local open_external = {
                            pdf = true, doc = true, docx = true, xls = true, xlsx = true, ppt = true, pptx = true,
                            png = true, jpg = true, jpeg = true, webp = true, gif = true, svg = true,
                            mp3 = true, wav = true, flac = true, ogg = true, aac = true, m4a = true,
                            mp4 = true, mkv = true, mov = true, avi = true, webm = true,
                            epub = true, mobi = true,
                            zip = true, rar = true, tar = true, gz = true,
                            ttf = true, otf = true, woff = true, woff2 = true,
                            ico = true, icns = true,
                        }
                        -- stylua: ignore end

                        if open_external[ext] then
                            local cmd
                            if vim.fn.has 'mac' == 1 then
                                cmd = { 'open', path }
                            elseif vim.fn.has 'unix' == 1 then
                                cmd = { 'xdg-open', path }
                            else
                                vim.notify('Unsupported OS for external open', vim.log.levels.WARN)
                                return
                            end

                            vim.fn.jobstart(cmd, { detach = true })
                        else
                            require('neo-tree.sources.filesystem.commands').open(state)
                        end
                    end,
                },
            },

            filesystem = {
                follow_current_file = { enabled = true },
                hijack_netrw = true,
                -- hijack_netrw_behavior = "open_default",
                renderers = {
                    directory = {
                        { 'icon' },
                        { 'name' },
                    },
                    file = {
                        {
                            'icon',
                            zindex = 10,
                        },
                        {

                            'container',
                            width = '100%',
                            content = {
                                {
                                    'name',
                                    zindex = 10,
                                },
                                {
                                    'diagnostics',
                                    align = 'right',
                                    zindex = 40,
                                    overlap = true,
                                },
                            },
                        },
                    },
                },
            },

            default_component_configs = {
                icon = {
                    folder_closed = '',
                    folder_open = '',
                    folder_empty = '',
                    default = '',
                    highlight = 'NeoTreeFileIcon',
                },

                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    severity = {
                        min = vim.diagnostic.severity.HINT,
                        max = vim.diagnostic.severity.ERROR,
                    },
                    symbols = {
                        hint = ' ',
                        info = ' ',
                        warn = ' ',
                        error = ' ',
                    },
                },
            },
        }
    end,
}

return NeoTree
