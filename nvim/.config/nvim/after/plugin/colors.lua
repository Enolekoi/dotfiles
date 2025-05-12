-- function for setting colorscheme
function SetColor(color)
	-- choose default colorscheme
	color = color or "catppuccin"
	vim.cmd.colorscheme "catppuccin"

	-- set transparent background
	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

SetColor()
