-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'Location list' })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'Declaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Definition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Lsp tip' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = 'Implementation' })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = 'Signature help' })
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = 'Add ws folder' })
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = 'Remove ws folder' })
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, desc = 'List ws folders' })
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = 'Type def' })
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename' })
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Code action' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'References' })
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, desc = 'Format' })
  end,
})
