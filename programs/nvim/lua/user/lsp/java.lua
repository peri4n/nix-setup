local common = require('user.lsp.common')

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/home/fbull/.cache/jdtls/' .. project_name

local config = {
  cmd = {
    'java', -- or '/path/to/java11_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', '/home/fbull/dev/tools/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

    '-configuration', '/home/fbull/dev/tools/jdtls/config_linux',

    '-data', workspace_dir
  },

  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  init_options = {
    bundles = {
      vim.fn.glob("/home/fbull/dev/tools/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.39.0.jar")
    }
  },

  on_attach = function(client, bufnr)
    common.add_mappings(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "JdtUpdateConfig", function() require('jdtls').update_project_config() end, {})
    vim.api.nvim_buf_create_user_command(bufnr, "JdtJol", function() require('jdtls').jol() end, {})
    vim.api.nvim_buf_create_user_command(bufnr, "JdtBytecode", function() require('jdtls').javap() end, {})
    vim.api.nvim_buf_create_user_command(bufnr, "JdtJshell", function() require('jdtls').jshell() end, {})

    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  end
}

local nvim_jdtls_group = vim.api.nvim_create_augroup("nvim-jdtls", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java" },
  callback = function()
    require('jdtls').start_or_attach(config)
  end
})

vim.keymap.set('n', 'crv', function() require('jdtls').extract_variable() end)
vim.api.nvim_set_keymap('v', 'crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { noremap = true, silent = true })
