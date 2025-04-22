local lush = require("lush")
local hsl = lush.hsl

local base_fg = hsl(220, 15, 15) -- soft charcoal
local light_fg = hsl(220, 15, 25)
local comment = hsl(210, 15, 55)
local base_bg = hsl(210, 40, 95)       -- snow white
local accent_bg = hsl(210, 30, 90)     -- pale ice
local subtle_fg = hsl(220, 10, 50)     -- stone grey
local highlight = hsl(45, 100, 60)     -- vivid yellow
local forest = hsl(100, 40, 35)        -- forest green
local crimson = hsl(0, 65, 55)         -- deep red
local bone = hsl(35, 50, 85)           -- skull-white
local fjord_deep = hsl(205, 60, 25)    -- 🌊 deep ocean fjord blue
local fjord_shallow = hsl(195, 55, 60) -- 🌤️ shallower water near snow banks
local birch_bark = hsl(30, 20, 55)     -- 🪵 pale birch wood
local moss_green = hsl(95, 35, 45)     -- 🌿 spring moss under snow
local orange = hsl(30, 70, 55)
local green = hsl(340, 30, 45)

local theme = lush(function()
  return {
    Normal { fg = base_fg, bg = base_bg },
    CursorLine { bg = accent_bg },
    ColorColumn { bg = accent_bg },
    LineNr { fg = subtle_fg },
    CursorLineNr { fg = base_fg, gui = "bold" },
    VertSplit { fg = subtle_fg },
    StatusLine { fg = base_fg, bg = accent_bg, gui = "bold" },
    Visual { bg = hsl(210, 20, 80) },

    Comment { fg = comment, gui = "italic" },

    Identifier { fg = subtle_fg },     -- yellow
    Statement { fg = forest },         -- green
    Constant { fg = crimson },         -- red
    Type { fg = bone },                -- ivory
    PreProc { fg = hsl(190, 40, 55) }, -- cold blue
    Special { fg = fjord_deep },       -- orange-brown
    Todo { fg = base_bg, bg = crimson, gui = "bold" },

    Search { fg = base_bg, bg = highlight },
    IncSearch { fg = base_bg, bg = hsl(45, 100, 70) },
    MatchParen { fg = base_fg, bg = accent_bg, gui = "bold" },

    Pmenu { fg = base_fg, bg = hsl(210, 35, 90) },
    PmenuSel { fg = base_bg, bg = forest },

    -- Tree-sitter highlights
    sym "@comment" { Comment },
    sym "@function" { fg = fjord_deep },
    sym "@function.builtin" { fg = moss_green },
    sym "@variable" { fg = base_fg },
    sym "@constant" { fg = crimson },
    sym "@type" { fg = bone },
    sym "@keyword" { fg = birch_bark },
    sym "@string" { fg = fjord_shallow },
    sym "@number" { fg = crimson },
    sym "@operator" { fg = base_fg },
    sym "@punctuation" { fg = subtle_fg },
    sym "@field" { fg = fjord_shallow },
    sym "@parameter" { fg = base_fg },
    sym "@constructor" { fg = birch_bark },
  }
end)

return theme
