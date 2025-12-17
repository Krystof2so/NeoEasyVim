return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      vim.api.nvim_set_hl(0, 'MyAsciiHeader', { fg = '#D08770' })  -- highlight header                    

      -- Header NvCrafted
      dashboard.section.header.val = {
        [[░███    ░██              ░██████                          ░████    ░██                      ░██]],
        [[░████   ░██             ░██   ░██                        ░██       ░██                      ░██]],
        [[░██░██  ░██ ░██    ░██ ░██        ░██░████  ░██████   ░████████ ░████████  ░███████   ░████████]],
        [[░██ ░██ ░██ ░██    ░██ ░██        ░███           ░██     ░██       ░██    ░██    ░██ ░██    ░██]],
        [[░██  ░██░██  ░██  ░██  ░██        ░██       ░███████     ░██       ░██    ░█████████ ░██    ░██]],
        [[░██   ░████   ░██░██    ░██   ░██ ░██      ░██   ░██     ░██       ░██    ░██        ░██   ░███]],
        [[░██    ░███    ░███      ░██████  ░██       ░█████░██    ░██        ░████  ░███████   ░█████░██]],
        [[                                                                                               ]],
        [[                                                                                               ]],
        [[                                                                                               ]],
      }
      dashboard.section.header.opts = {
        position = "center",
        hl = "MyAsciiHeader"  -- Appliquer la couleur définie
      }

      -- Boutons
      dashboard.section.buttons.val = {
        dashboard.button("e", "🗃️ Ouvre Neotree", ":Neotree<CR>"),
        dashboard.button("n", "📝 Nouveau fichier", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "🔍 Rechercher fichiers", ":Telescope find_files<CR>"),
        dashboard.button("r", "⌛ Fichier récemment ouvert", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "❌ Quitter Neovim", ":qa<CR>"),
      }

      -- Section date et heure en français
      dashboard.section.datetime = {
        type = "text",
        val = function()
          local fr_days = { "Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi" }
          local fr_months = { "janvier", "février", "mars", "avril", "mai", "juin", "juillet",
                              "août", "septembre", "octobre", "novembre", "décembre" }
          local date = os.date("*t")
          local week_day = fr_days[date.wday]
          local month = fr_months[date.month]
          return string.format("📅  %s %d %s %d  🕒  %02d:%02d", week_day, date.day, month, date.year, date.hour, date.min)
        end,
        opts = {
          position = "center",
          hl = "Function",
        },
      }
      -- Insérer la section datetime avant le footer
      table.insert(dashboard.config.layout, 3, { type = "group", val = { dashboard.section.datetime }, opts = {} })

      -- Footer
      dashboard.section.footer.val = "⚡ NvCrafted"
      dashboard.section.footer.opts.hl = "Comment"

      -- Setup
      dashboard.config.opts.noautocmd = true
      alpha.setup(dashboard.config)
    end,
  },
}
