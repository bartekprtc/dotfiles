return {
    "ldelossa/nvim-dap-projects",

    config = function()
        local projects = require("nvim-dap-projects")

        projects.config_paths = {"./test/nvim-dap.lua"}
        projects.search_project_config()
    end,
}
