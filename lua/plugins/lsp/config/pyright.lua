-- lua/plugins/lsp/config/pyright.lua
return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",      -- vérification des types (basic / strict / off)
        autoSearchPaths = true,           -- détecte automatiquement les chemins
        useLibraryCodeForTypes = true,    -- inclut les types des librairies
        diagnosticMode = "workspace",     -- analyse tous les fichiers du projet
        reportUnusedImport = true,        -- avertir pour les imports inutilisés
      },
    },
  },
}

