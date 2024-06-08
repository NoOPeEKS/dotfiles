vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv",
    { silent = true, desc = "Molten Evaluate Visual" })
vim.keymap.set("n", "<leader>ml", function()
  vim.cmd("MoltenEvaluateLine")
end, {desc = "Molten Evaluate Line"})
vim.keymap.set("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>",
    { silent = true, desc = "Molten Enter Output Window" })
vim.keymap.set("n", "<leader>jc", "i```python<CR><CR>```", {desc = "Jupyter Create Cell"})
