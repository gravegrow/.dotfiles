Plug 'neovim/nvim-lspconfig'

lua <<EOF
function lsp_config()
    -- lspconfig
    local nvim_lsp = require('lspconfig')
    local servers = { 'jedi_language_server' }


    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    nvim_lsp.diagnosticls.setup {
      filetypes = { "python" },
      init_options = {
        filetypes = {
          python = {"flake8"},
        },
        linters = {
          flake8 = {
            debounce = 100,
            sourceName = "flake8",
            command = "flake8",
            args = {
              "--format",
              "%(row)d:%(col)d:%(code)s:%(code)s: %(text)s",
              "%file",
              "--ignore=N813, E501",
            },
            formatPattern = {
              "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
              {
                  line = 1,
                  column = 2,
                  message = {"[", 3, "] ", 5},
                  security = 4
              }
            },
            securities = {
              E = "error",
              W = "warning",
              F = "info",
              B = "hint",
            },
          },
        },
      }
    }

    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end

    -- nvim-cmp
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')

    -- better autocompletion experience
    vim.o.completeopt = 'menuone,noselect'

    cmp.setup {
        -- Format the autocomplete menu
        formatting = {
            format = lspkind.cmp_format()
        },
        mapping = {
            -- Use Tab and shift-Tab to navigate autocomplete menu
            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end,
            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
            end,
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        },
    }

    local sumneko_root_path = "/usr/lib/lua-language-server/bin/lua-language-server"
    local sumneko_binary = "/usr/bin/lua-language-server"

    require'lspconfig'.sumneko_lua.setup {
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';')
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'}
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
                }
            }
        }
    }
end
EOF

augroup lspconfig
    autocmd!
    autocmd User PlugLoaded lua lsp_config()
augroup end
