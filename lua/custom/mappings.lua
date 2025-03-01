local M = {}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
          "<cmd> DapToggleBreakpoint <CR>",
          "Add breakpoint at line",
        },
        ["<leader>dr"] = {
          "<cmd> DapContinue <CR>",
          "Start or continue the debugger",
        },
        ["<leader>cg"] = {
            "<cmd> CMakeGenerate <CR>",
            "Generate CMake build files."
        },
        ["<leader>cb"] = {
            "<cmd> CMakeBuild <CR>",
            "Build current CMake build target,",
        },
        ["<leader>cr"] = {
            "<cmd> CMakeRun <CR>",
            "Run current CMake launch target",
        },
        ["<leader>cd"] = {
            "<cmd> CMakeDebug <CR>",
            "Debug current CMake launch target",
        }
  }
}

return M
