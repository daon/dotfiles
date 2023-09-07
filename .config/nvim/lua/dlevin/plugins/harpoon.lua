return {
	"ThePrimeagen/harpoon",
	config = true,
	keys = {
		{
			"<leader>a",
			function()
				local mark = require("harpoon.mark")
				mark.add_file()
			end,
		},
		{
			"<C-e>",
			function()
				local ui = require("harpoon.ui")
				ui.toggle_quick_menu()
			end,
		},
		{
			"<C-h>",
			function()
				local ui = require("harpoon.ui")
				ui.nav_file(1)
			end,
		},
		{
			"<C-t>",
			function()
				local ui = require("harpoon.ui")
				ui.nav_file(2)
			end,
		},
		{
			"<C-n>",
			function()
				local ui = require("harpoon.ui")
				ui.nav_file(3)
			end,
		},
		{
			"<C-s>",
			function()
				local ui = require("harpoon.ui")
				ui.nav_file(4)
			end,
		},
	},
}
