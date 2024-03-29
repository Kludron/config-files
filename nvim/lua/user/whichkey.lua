local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {

    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
    },
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
    presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = false, -- bindings for prefixed with g
    },
    -- operators = { gc = "Comments" },
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<space>"}, -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
        y = { "j", "k" },
        gcc = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w<CR>", "Save" },
	["q"] = { "<cmd>q<CR>", "Quit" },
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
	["m"] = { "<cmd>MarkdownPreviewToggle<CR>", "Toggle Markdown" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>Git<CR>", "Open git (fugitive)" },
		c = { "<cmd>Git commit<CR>", "Git commit" },
		p = { "<cmd>Git push<CR>", "Git push" },
        d = {"<cmd>Git diff<CR>", "Git diff"}
	},

	l = {
		name = "LSP",
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
		g = { name = "Go to", d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition"} },
	},
    ["t"] = { "<cmd>ToggleTerm size=8 direction=horizontal<cr>", "Horizontal" },
	-- t = {
	-- 	name = "Terminal",
	-- 	n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
	-- 	t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
	-- 	p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
	-- 	f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
	-- 	h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
	-- 	v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	-- },
}

which_key.setup(setup)
which_key.register(mappings, opts)
