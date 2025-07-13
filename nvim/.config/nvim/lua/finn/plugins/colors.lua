-- function for setting colors
function SetColor(color)
  -- choose default colorscheme
  color = color or 'catppuccin'
  vim.cmd.colorscheme(color)

  -- set transparent background
  vim.api.nvim_set_hl(0, 'Normal', {bg= 'none'})
  vim.api.nvim_set_hl(0, 'NormalFloat', {bg= 'none'})
end

-- colorscheme
return {
  'catppuccin/nvim',
  name = 'catppuccin',
   
  -- configuration function
  config = function()
    SetColor()
  end
}
