-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<localleader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<localleader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<localleader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<localleader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<localleader>tD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<localleader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<localleader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<localleader>lds', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<localleader>lds', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.keymap.set('n', '<localleader>F', function()
      -- format using clang-format
      path = vim.fn.expand('%:p')
      vim.api.nvim_buf_call(bufnr, function()
        vim.api.nvim_command('write')
      end)
      local uv = require('luv')
      local fsev = uv.new_fs_event()
      fsev:start(path, {}, vim.schedule_wrap(function()
        vim.api.nvim_command('checktime ' .. tostring(bufnr))
        fsev:stop();
      end))
      io.popen('clang-format -i ' .. path .. ' 2> /dev/null'):close()
    end, { buffer = bufnr})


end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

--local servers = { 'clangd' }
--for _, lsp in ipairs(servers) do
--  lspconfig[lsp].setup {
--    on_attach = on_attach,
--    flags = {
--      debounce_text_changes = 150,
--    },
--    cmd = { "clangd", "--background-index",
--            "--all-scopes-completion", "--completion-style=detailed", "--log=info",
--            "--query-driver=/home/plamen_kde/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch5-8.4.0/**/bin/xtensa-esp32-elf-*",
--             }, -- custom build dir
--    capabilities = capabilities
--  }
--end

lspconfig.clangd.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  cmd = { "clangd", "--background-index",
          "--all-scopes-completion", "--completion-style=detailed", --"--log=info",
          --"--query-driver=/home/plamen_kde/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch5-8.4.0/**/bin/xtensa-esp32-elf-*",
           }, -- custom build dir
  capabilities = capabilities
}
