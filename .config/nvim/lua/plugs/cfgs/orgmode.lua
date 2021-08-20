-- docs: https://github.com/kristijanhusak/orgmode.nvim/blob/master/DOCS.md


local org_dir = "/home/j/.config/nvim/utils/org"

AGENDAS = org_dir .. "agendas/*"
REFILE  = org_dir .. "refile.org"


require("orgmode").setup({
    org_agenda_files       = AGENDAS,
    org_default_notes_file = REFILE,
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
