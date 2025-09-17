return {
  "stevearc/conform.nvim",
  opts = {
    -- 1) Tell Conform which formatters to use for each filetype:
    formatters_by_ft = {
      python = { "docformatter", "autopep8" },

      -- You could also chain multiple formatters, e.g.:
      -- python = { "docformatter", "black" },
    },
  },
}
