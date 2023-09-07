return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },

		{ "jose-elias-alvarez/null-ls.nvim", dependencies = "mason.nvim" },
		{ "jay-babu/mason-null-ls.nvim", dependencies = "mason.nvim" },
	},
	init = function()
		local keymap = vim.keymap.set

		keymap("n", "<leader>lf", ":LspZeroFormat!<CR>")
    vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})
	end,
	config = function()
		local lsp = require("lsp-zero")
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")
		local mason_registry = require("mason-registry")

		lsp.preset("recommended")
		lsp.nvim_workspace()

		lsp.ensure_installed({
			"tsserver",
			"eslint",
			"lua_ls",
			"rust_analyzer",
		})

		lsp.setup()

		mason_null_ls.setup({
			ensure_installed = {
				"stylua",
				"prettier",
			},
		})

		local installed_packages = mason_registry.get_installed_package_names()

		local formatting = null_ls.builtins.formatting
		-- local completion = null_ls.builtins.completion
		-- local diagnostics = null_ls.builtins.diagnostics
		-- local code_actions = null_ls.builtins.code_actions

		local sources = {}
		local load = false

		for _, package in pairs(installed_packages) do
			if package == "stylua" then
				load = true
				sources[#sources + 1] = formatting.stylua
				goto loop_continue
			end

			if package == "prettier" then
				load = true
				sources[#sources + 1] = formatting.prettier
				goto loop_continue
			end


			::loop_continue::
		end

		local null_opts = lsp.build_options("null-ls", {})

		if load then
			null_ls.setup({
				on_attach = function(client, bufnr)
					null_opts.on_attach(client, bufnr)
				end,
				sources = sources,
			})
		end
	end,
}
