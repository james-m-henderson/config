  -- lua/plugins/avante.lua
return {
  {
    "yetone/avante.nvim",
    build = "make", -- if required by your system
    opts = {
      provider = "ollama",
      vendors = {
        ollama = {
          endpoint = "http://127.0.0.1:11434",
          model = "qwen2.5:14b-instruct", -- pick any local model you've pulled
          temperature = 0.2,
        },
      },
    },
    keys = {
      { "<leader>aa", function() require("avante.api").toggle() end, desc = "Avante: Toggle" },
      { "<leader>ae", function() require("avante.api").edit() end,   desc = "Avante: Edit Selection" },
    },
  },
}

