-- docs: https://github.com/kristijanhusak/orgmode.nvim/blob/master/DOCS.md


local org_dir = "/home/j/catalog/personal/TODO/org/"
local agenda_dir  = org_dir .. "agendas/"

AGENDAS     = agenda_dir .. "*"
AG_ACM      = agenda_dir .. "ACM.org"
AG_CLASS    = agenda_dir .. "class.org"
AG_OSL      = agenda_dir .. "OSL.org"
AG_PRSNL    = agenda_dir .. "personal.org"
AG_TA       = agenda_dir .. "personal.org"
REFILE      = org_dir .. "refile.org"

DONE_HL     = ":foreground #43B581 :weight bold"
TODO_HL     = ":foreground #F04747 :weight bold"

TEMPLATE    = "* TODO %?\n  CREATED: %U"


require("orgmode").setup({
    org_agenda_files                    = AGENDAS,
    org_agenda_skip_deadline_if_done    = true,
    org_agenda_skip_scheduled_if_done   = true,
    org_archive_location                = "%s_archive",
    org_default_notes_file              = REFILE,
    org_hide_emphasis_markers           = true,
    org_hide_leading_stars              = true,
    org_todo_keywords                   = { "TODO(t)", "RESEARCH", "BLOCKED", '|', "DONE", "CANCELLED" },

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

        r =
        {
            description = 'Refile',
            template = TEMPLATE,
            target = REFILE
        },

        t =
        {
            description = 'TA',
            template = TEMPLATE,
            target = AG_TA
        }
    },

    mappings =
    {
        org =
        {
            org_toggle_checkbox = '<leader>ct',
        },
    },

    org_todo_keyword_faces =
    {
        BLOCKED     = TODO_HL,
        RECURRING   = TODO_HL,
        RESEARCH    = TODO_HL,
        TODO        = TODO_HL,

        CANCELLED   = DONE_HL,
        DONE        = DONE_HL
    }
})
