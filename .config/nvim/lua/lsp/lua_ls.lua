return {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = true,
                library = {
                    vim.env.VIMRUNTIME
                }
            },
            telemetry = { enable = false },
        },
    }
}
