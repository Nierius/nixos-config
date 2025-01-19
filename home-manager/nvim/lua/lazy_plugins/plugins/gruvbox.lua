return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.g.gruvbox_contrast_dark = "hard" -- or "soft" or "medium"
    vim.g.gruvbox_bold = 1
    vim.o.background = "dark"            -- or "light" for light mode
    vim.opt.termguicolors = true
    vim.cmd([[colorscheme gruvbox]])

    -- Function to toggle transparency
    function toggle_transparency()
      local current_bg = vim.api.nvim_get_hl_by_name('Normal', true).background
      if current_bg == nil then
        -- Set to non-transparent background
        vim.cmd [[
            highlight Normal guibg=#282828
            highlight SignColumn guibg=#282828
            highlight NormalFloat guibg=#282828
            highlight LineNr guibg=#282828
            highlight Folded guibg=#282828
            highlight NonText guibg=#282828
            highlight EndOfBuffer guibg=#282828
        ]]
      else
        -- Set to transparent background
        vim.cmd [[
            highlight Normal guibg=NONE
            highlight SignColumn guibg=NONE
            highlight NormalFloat guibg=NONE
            highlight LineNr guibg=NONE
            highlight Folded guibg=NONE
            highlight NonText guibg=NONE
            highlight EndOfBuffer guibg=NONE
        ]]
      end
    end

    -- Map the toggle function to a key, e.g., <leader>tt
    vim.api.nvim_set_keymap('n', '<leader>tt', ':lua toggle_transparency()<CR>', { noremap = true, silent = true })
  end
}
