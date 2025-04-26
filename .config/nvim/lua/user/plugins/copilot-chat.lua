return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    lazy = false,
    dependencies = {
        {"zbirenbaum/copilot.lua"}, -- or github/copilot.vim
        {"nvim-lua/plenary.nvim"} -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {}
}
