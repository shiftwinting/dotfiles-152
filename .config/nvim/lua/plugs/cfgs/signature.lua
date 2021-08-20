require "lsp_signature".setup({
    bind = true,        -- This is mandatory, otherwise border config won't get registered.
    floating_window = false,
    fix_pos = true,
    handler_opts = { border = "none" },
    hi_parameter = "specsBG",
    hint_enable = true,  -- Panda for parameter
    hint_prefix = " ",
    trigger_on_newline = false
  })
