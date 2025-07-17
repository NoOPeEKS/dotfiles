return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ruff",
					"pyright",
					"tailwindcss",
					"gopls",
					"angularls",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("gleam")
			vim.lsp.enable("gopls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("angularls")
			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("ruff")
			vim.lsp.enable("pyright")

			vim.lsp.config("pyright", {
			  settings = {
			    pyright = {
			      disableOrganizeImports = true, -- using Ruff
			    },
			    python = {
			      analysis = {
			        ignore = { '*' }, -- using Ruff
			      },
			    },
			  },
			})

			vim.lsp.config("angularls", {
				filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
			})

			vim.lsp.config("gopls", {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				settings = {
					gopls = {
						completeUnimported = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			vim.lsp.config("tailwindcss", {
				filetypes = {
					"vue",
					"svelte",
					"blade",
					"javascript",
					"javascriptreact",
					"php",
					"html",
					"django-html",
					"htmldjango",
					"elixir",
					"eelixir",
					"heex",
					"eruby",
					"erb",
					"htmlangular",
				},
				init_options = {
					userLanguages = {
						elixir = "html-eex",
						eelixir = "html-eex",
						heex = "html-eex",
						eruby = "erb",
					},
				},
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								'class[:]\\s*"([^"]*)"',
							},
						},
						["includeLanguages"] = { ["eruby"] = "erb" },
					},
				},
			})

			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			--
			-- local lspconfig = require("lspconfig")
			-- lspconfig.gleam.setup({})
			--
			-- lspconfig.ts_ls.setup({})
			--
			-- lspconfig.angularls.setup({
			--   filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'htmlangular' }
			-- })
			--
			-- lspconfig.gopls.setup({
			--   capabilities = capabilities,
			--   cmd = { "gopls" },
			--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
			--   settings = {
			--     gopls = {
			--       completeUnimported = true,
			--       analyses = {
			--         unusedparams = true,
			--       },
			--     },
			--   },
			-- })
			--
			-- lspconfig.tailwindcss.setup({
			--   capabilities = capabilities,
			--   filetypes = {
			--     "vue",
			--     "svelte",
			--     "blade",
			--     "javascript",
			--     "javascriptreact",
			--     "php",
			--     "html",
			--     "django-html",
			--     "htmldjango",
			--     "elixir",
			--     "eelixir",
			--     "heex",
			--     "eruby",
			--     "erb",
			--     "htmlangular",
			--   },
			--   init_options = {
			--     userLanguages = {
			--       elixir = "html-eex",
			--       eelixir = "html-eex",
			--       heex = "html-eex",
			--       eruby = "erb"
			--     },
			--   },
			--   settings = {
			--     tailwindCSS = {
			--       experimental = {
			--         classRegex = {
			--           'class[:]\\s*"([^"]*)"',
			--         },
			--       },
			--       ["includeLanguages"] = { ["eruby"] = "erb" }
			--     },
			--   },
			-- })
			--
			--
			-- lspconfig.lua_ls.setup({
			--   capabilities = capabilities,
			-- })
			--
			-- -- lspconfig.ruff_lsp.setup({})
			-- lspconfig.ruff.setup({})
			--
			-- lspconfig.pyright.setup({
			--   settings = {
			--     pyright = {
			--       disableOrganizeImports = true, -- using Ruff
			--     },
			--     python = {
			--       analysis = {
			--         ignore = { '*' }, -- using Ruff
			--       },
			--     },
			--   },
			-- })

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {})
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {})
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, {})
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, {})
		end,
	},
}
