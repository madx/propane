vim.g.sonokai_style = "andromeda"
vim.g.sonokai_better_performance = 1
vim.g.sonokai_enable_italic = 0
vim.g.sonokai_disable_italic_comment = 0
vim.g.sonokai_transparent_background = 1

-- Small customizations to Sonokai
vim.api.nvim_exec(
  [[
function! s:sonokai_custom() abort
  let s:configuration = sonokai#get_configuration()
  let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)

  call sonokai#highlight('VertSplit', s:palette.bg0, s:palette.none)
  call sonokai#highlight('LineNr', s:palette.bg3, s:palette.none)
endfunction

augroup SonokaiCustom
  autocmd!
  autocmd ColorScheme sonokai call s:sonokai_custom()
augroup END
]],
  false
)

vim.cmd("colorscheme sonokai")
