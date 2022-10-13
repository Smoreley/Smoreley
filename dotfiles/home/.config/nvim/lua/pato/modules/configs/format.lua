return function()
    local fmt = string.format
    require("format").setup({
        ["*"] = {
            -- remove trailing whitespaces
            {
                cmd = {
                    "sed -i 's/[ \t]*$//'",
                },
            },
        },
        json = {
            {
                cmd = { "prettier -w --parser json" },
            },
        },
        toml = {
            {
                cmd = { "prettier -w --parser toml" },
            },
        },
        yaml = {
            {
                cmd = { "prettier -w --parser yaml" },
            },
        },
    })
end