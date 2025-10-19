-- dart lsp

local dartls = {
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    root_markers = {
        '.git',
        'pubspec.yaml',
        'analysis_options.yaml',
    },
    settings = {
        dart = {
            completeFunctionCalls = true,
            showTodos = true,
            updateImportsOnRename = true,
            enableSnippets = true,
        },
    },
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = true,
        closingLabels = true,
    },
}

return dartls
