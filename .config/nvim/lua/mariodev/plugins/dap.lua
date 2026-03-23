return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'leoluz/nvim-dap-go',
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap, dapui, dapgo = require 'dap', require 'dapui', require 'dap-go'

    dapui.setup()
    dapgo.setup()
    require('nvim-dap-virtual-text').setup()
    require('dap-python').setup(
      vim.fn.exepath 'python' -- poetry / pyenv friendly
    )

    dap.adapters.customgo = {
      type = 'server',
      port = '${port}',
      -- host = '127.0.0.1' if not provided defaults to this
      executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
      },
    }

    dap.adapters.dockergo = {
      type = 'server',
      host = '127.0.0.1',
      port = 7777,
    }

    local docker_debugging = {
      type = 'dockergo',
      name = 'Attach to Docker',
      mode = 'remote',
      request = 'attach',
      host = '127.0.0.1',
      port = 7777,
      cwd = vim.fn.getcwd(),
    }
    local custom_debugging = {
      type = 'customgo', -- name of the adapter
      request = 'launch', -- instruct the debugger what to do with the debugee
      name = 'custom project debugging',
      -- program = '${workspaceFolder}/cmd',
      program = '${file}',
      outputMode = 'remote',
    }

    for _, conf in ipairs { docker_debugging, custom_debugging } do
      table.insert(dap.configurations.go, conf)
    end

    dap.configurations.python = {
      {
        type = 'python',
        request = 'attach',
        name = 'Attach to Django',
        connect = {
          host = '127.0.0.1',
          port = 5678,
        },
        justMyCode = false,
      },
    }

    vim.keymap.set('n', '<F1>', dap.continue)
    vim.keymap.set('n', '<F2>', dap.step_into)
    vim.keymap.set('n', '<F3>', dap.step_over)
    vim.keymap.set('n', '<F4>', dap.step_out)
    vim.keymap.set('n', '<F5>', dap.step_back)
    vim.keymap.set('n', '<F9>', dap.restart)
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
    vim.keymap.set('n', '<leader>dgb', dap.toggle_breakpoint)
    vim.keymap.set({ 'n', 'v' }, '<leader>?', function()
      dapui.eval(nil, { enter = true })
    end)

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end
  end,

  -- vim.cmd [[
  -- :let g:dap_log_level = 'DEBUG'
  -- ]]
  -- dap.set_log_level 'TRACE'
}
