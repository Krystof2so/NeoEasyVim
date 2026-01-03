-- **********************************************
-- * core/highlights/diagnostics_theme_nord.lua *
-- *                                            *
-- * Thème Nord pour les diagnostics            *
-- * Appel depuis core/lsp/on_attach.lua        *
-- **********************************************

local M = {}

M.setup = function()
  -- Configuration générale des diagnostics
  vim.diagnostic.config({
    signs = {
      active = true,  -- active les signes
      values = {
        Error = { text = "●", texthl = "DiagnosticSignError" },
        Warn  = { text = "●", texthl = "DiagnosticSignWarn" },
        Hint  = { text = "●", texthl = "DiagnosticSignHint" },
        Info  = { text = "●", texthl = "DiagnosticSignInfo" },
      },
    },
    virtual_text = {
      prefix = "●",
      spacing = 2,
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })

  -- Couleurs et style basés sur Nord
  vim.cmd([[
    " Texte du diagnostic (virtual text)
    highlight DiagnosticError guifg=#BF616A gui=bold
    highlight DiagnosticWarn  guifg=#EBCB8B gui=bold
    highlight DiagnosticInfo  guifg=#8FBCBB gui=bold
    highlight DiagnosticHint  guifg=#81A1C1 gui=italic

    " Soulignement doux (undercurl)
    highlight DiagnosticUnderlineError   guisp=#BF616A gui=undercurl
    highlight DiagnosticUnderlineWarn    guisp=#EBCB8B gui=undercurl
    highlight DiagnosticUnderlineInfo    guisp=#8FBCBB gui=undercurl
    highlight DiagnosticUnderlineHint    guisp=#81A1C1 gui=undercurl

    " Virtual text moins agressif
    highlight DiagnosticVirtualTextError guifg=#BF616A gui=none
    highlight DiagnosticVirtualTextWarn  guifg=#EBCB8B gui=none
    highlight DiagnosticVirtualTextInfo  guifg=#8FBCBB gui=none
    highlight DiagnosticVirtualTextHint  guifg=#81A1C1 gui=italic
  ]])
end

-- Auto-exécution si on veut juste require sans appeler setup
M.setup()

return M

