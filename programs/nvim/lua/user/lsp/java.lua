local common = require('user.lsp.common')

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/home/fbull/.cache/jdtls/' .. project_name

local config = {
  cmd = {
    'jdtls',
    '-data', workspace_dir
  },

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      settings = {
        url = "~/.config/nvim/jdtls_settings.pref";
      };
      sources = {
        organizeImports = {
          starThreshold = 9999;
          staticStarThreshold = 9999;
        };
      };
      import = {
        gradle = {
          enabled = true
        },
        maven = {
          enabled = true
        },
      },
      completion = {
        enabled = true,
        importOrder = { '' }
      };
      eclipse = {
        downloadSources = true
      },
      maven = {
        downloadSources = true,
        updateSnapshotts = true
      },
      referencesCodeLens = {
        enabled = true
      },
      implementationsCodeLens = {
        enabled = false
      },
      format = {
        enabled = false;
        settings = {
          url = "~/.config/nixpkgs/programs/nvim/GoogleStyle.xml";
          profile = "GoogleStyle";
        };
        insertSpace = true;
        tabSize = 4;
      },
      signatureHelp = {
        enabled = true
      },
      saveActions = {
        organizeImports = false,
      },
      inlayhints = {
        parameterNames = {
          enabled = 'all'
        },
      },
      jdt = {
        ls = {
          lombokSupport = {
            enabled = true
          }
        }
      }
    }
  },

  init_options = {
    bundles = {}
  },

  on_attach = function(client, bufnr)
    common.add_mappings(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "JdtUpdateConfig",
      function() require('jdtls').update_project_config() end, {})
    vim.api.nvim_buf_create_user_command(bufnr, "JdtJol", function() require('jdtls').jol() end, {})
    vim.api.nvim_buf_create_user_command(bufnr, "JdtBytecode", function() require('jdtls').javap() end, {})
    vim.api.nvim_buf_create_user_command(bufnr, "JdtJshell", function() require('jdtls').jshell() end, {})
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
