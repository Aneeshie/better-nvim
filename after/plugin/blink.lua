
local status_ok, blink = pcall(require, 'blink')
if not status_ok then
    return
end

blink.setup({
    -- optional: snippet collection
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- blink.cmp options go here
    -- keymap = { preset = "default" },
    -- enable_ghost_text = true,
})

