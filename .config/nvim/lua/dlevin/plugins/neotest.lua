return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-vim-test",
		"vim-test/vim-test",
		"marilari88/neotest-vitest",
	},
	keys = {
		{
			"<leader>tf",
			function()
				local neotest = require("neotest")
				neotest.run.run(vim.fn.expand("%"))
				neotest.summary.open()
			end,
		},
		{
			"<leader>tm",
			function()
				local neotest = require("neotest")
				neotest.run.run()
				neotest.summary.open()
			end,
		},
		{
			"<leader>to",
			function()
				local neotest = require("neotest")
				neotest.output.open()
			end,
		},
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			log_level = vim.log.levels.WARN,
			adapters = {
				require("neotest-vitest"),
				require("neotest-vim-test")({ allow_file_types = { "kotlin" } }),
			},
			icons = {
				child_indent = "│",
				child_prefix = "├",
				collapsed = "─",
				expanded = "╮",
				failed = "✖",
				final_child_indent = " ",
				final_child_prefix = "╰",
				non_collapsible = "─",
				passed = "✔",
				running = "🗘",
				running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
				skipped = "ﰸ",
				unknown = "?",
			},
		})
	end,
}
