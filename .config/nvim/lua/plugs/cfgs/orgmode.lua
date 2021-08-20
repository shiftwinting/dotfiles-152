-- see https://github.com/akinsho/dotfiles/blob/main/.config/nvim/lua/as/plugins/orgmode.lua


local util_dirs = "/home/j/.config/nvim/utils/"

ORG_AGENDAS = util_dirs .. "org/agendas/*"
ORG_NOTE    = util_dirs .. "org/notes.org"


require("orgmode").setup({
    org_agenda_files       = ORG_AGENDAS,
    org_default_notes_file = ORG_NOTE,
    org_todo_keywords = { "TODO(t)", "IN PROGRESS", "BLOCKED", '|', "DONE", "CANCELLED" },
    org_hide_emphasis_markers = true,
    org_hide_leading_stars = true,
    org_agenda_skip_scheduled_if_done = true,
    org_agenda_skip_deadline_if_done = true,

    mappings =
    {
        org =
        {
            org_toggle_checkbox = '<leader>ct',
        },
    },
})
