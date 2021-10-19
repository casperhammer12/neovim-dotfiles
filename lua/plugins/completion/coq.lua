vim.g.coq_settings = {
    display = {
        preview = {
            border = {
                {"", "shadow"},
                {"", "Shadow"},
                {"", "Shadow"},
                {" ", "Shadow"},
                {"", "Shadow"},
                {"", "shadow"},
                {"", "shadow"},
                {" ", "shadow"}
            },
        },
    },
    keymap = {
        recommended = true,
        pre_select = true,
    },
    auto_start = 'shut-up'
}

require('coq_3p') {
    { src = 'nvimlua', short_name = 'nLUA', conf_only = true },
    { src = 'orgmode', short_name = 'ORG' }
}
