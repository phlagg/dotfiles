-- -----------------------------------------------------
-- Input
-- -----------------------------------------------------

hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "grp:alt_shift_toggle",
        kb_rules     = "",
        follow_mouse = 1,
        -- The repeat rate for held-down keys, in repeats per second (default: 25)
        repeat_rate = 35,

        -- Delay before a held-down key is repeated, in milliseconds (default: 600)
        repeat_delay = 225,

        sensitivity  = .5, -- -1.0 - 1.0, 0 means no modification.

        touchpad     = {
            natural_scroll = true,
        },
    },
})
