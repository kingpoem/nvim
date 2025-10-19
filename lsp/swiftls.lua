-- swift lsp

local swiftls = {
    cmd = { "xcrun", "sourcekit-lsp" },
    filetypes = { "swift" },
    root_markers = { ".git", "Package.swift" },
    settings = {},
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = true,
    },
}

return swiftls
