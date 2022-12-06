local common = require('user.lsp.common')

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/home/fbull/.cache/jdtls/' .. project_name

local config = {
  cmd = {
    'jdt-language-server',
    '-data', workspace_dir
  },

  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      import = {
        gradle = {
          enabled = true
        },
        maven = {
          enabled = true
        },
        referencesCodeLens = {
          enabled = false
        },
        signatureHelp = {
          enabled = false
        },
        implementationsCodeLens = {
          enabled = false
        },
      },
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

local nvim_jdtls_group = vim.api.nvim_create_augroup("nvim_jdtls", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java" },
  callback = function()
    require('jdtls').start_or_attach(config)
  end
})

vim.keymap.set('n', 'crv', function() require('jdtls').extract_variable() end)
vim.keymap.set('v', 'crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
