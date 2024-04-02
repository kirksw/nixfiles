return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        mode = { "n", "v" },
        ["<leader>a"] = { name = "chatgippity" },
        ["<leader>ar"] = { name = "chatgpt run..." },
      },
    },
  },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ap",
        "<cmd>ChatGPT<cr>",
        desc = "ChatGPT Proompt",
      },
      {
        "<leader>aa",
        "<cmd>ChatGPTActAs<cr>",
        desc = "ChatGPT Act As",
      },
      {
        "<leader>ac",
        "<cmd>ChatGPTCompleteCode<cr>",
        desc = "ChatGPT Complete Code",
      },
      {
        "<leader>ae",
        "<cmd>ChatGPTEditWithInstructions<cr>",
        desc = "ChatGPT Edit with instructions",
      },
      {
        "<leader>arc",
        "<cmd>ChatGPTRun complete_code<cr>",
        desc = "ChatGPTRun: Complete Code",
      },
      {
        "<leader>arg",
        "<cmd>ChatGPTRun grammar_correction<cr>",
        desc = "ChatGPTRun: Grammar Fix",
      },
      -- {
      --   "<leader>art",
      --   "<cmd>ChatGPTRun translate<cr>",
      --   desc = "ChatGPTRun: Translate",
      -- },
      {
        "<leader>ark",
        "<cmd>ChatGPTRun keywords<cr>",
        desc = "ChatGPTRun: Keywords",
      },
      {
        "<leader>ard",
        "<cmd>ChatGPTRun docstring<cr>",
        desc = "ChatGPTRun: Docstring",
      },
      {
        "<leader>art",
        "<cmd>ChatGPTRun add_tests<cr>",
        desc = "ChatGPTRun: Add Tests",
      },
      {
        "<leader>aro",
        "<cmd>ChatGPTRun optimize_code<cr>",
        desc = "ChatGPTRun: Optimize Code",
      },
      {
        "<leader>ars",
        "<cmd>ChatGPTRun summarize<cr>",
        desc = "ChatGPTRun: Summarize",
      },
      {
        "<leader>arf",
        "<cmd>ChatGPTRun fix_bugs<cr>",
        desc = "ChatGPTRun: Fix Bugs",
      },
      {
        "<leader>are",
        "<cmd>ChatGPTRun explain_code<cr>",
        desc = "ChatGPTRun: Explain Code",
      },
      {
        "<leader>ara",
        "<cmd>ChatGPTRun code_readability_analysis<cr>",
        desc = "ChatGPTRun: Code Readability Analysis",
      },
    },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "rbw get openai_neovim",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
