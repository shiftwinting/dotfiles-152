-- docs: https://github.com/kristijanhusak/orgmode.nvim/blob/master/DOCS.md


local org_dir = "/home/j/docs/personal/TODO/org/"
local agenda_dir  = org_dir .. "agendas/"

AGENDAS     = agenda_dir .. "*"

AG_ACM      = agenda_dir .. "ACM.org"
AG_CLASS    = agenda_dir .. "class.org"
AG_OSL      = agenda_dir .. "OSL.org"
AG_PRSNL    = agenda_dir .. "personal.org"
REFILE      = org_dir .. "refile.org"

TEMPLATE    = "* TODO %?\n%U"


require("orgmode").setup({
    org_agenda_files                    = AGENDAS,
    org_agenda_skip_deadline_if_done    = true,
    org_agenda_skip_scheduled_if_done   = true,
    org_archive_location                = "%s_archive",
    org_default_notes_file              = REFILE,
    org_hide_emphasis_markers           = true,
    org_hide_leading_stars              = true,
    org_todo_keywords                   = { "TODO(t)", "IN PROGRESS", "BLOCKED", '|', "DONE", "CANCELLED" },

    mappings =
    {
        org =
        {
            org_toggle_checkbox = '<leader>ct',
        },
    },

    org_agenda_templates =
    {
        a =
        {
            description = 'ACM Task',
            template = TEMPLATE,
            target = AG_ACM
        },

        c =
        {
            description = 'Class Task',
            template = TEMPLATE,
            target = AG_CLASS
        },

        o =
        {
            description = 'OSL Task',
            template = TEMPLATE,
            target = AG_OSL
        },

        p =
        {
            description = 'Personal Task',
            template = TEMPLATE,
            target = AG_PRSNL
        },

        t =
        {
            description = 'Task to Refile',
            template = TEMPLATE,
            target = REFILE
        },
    }
})
