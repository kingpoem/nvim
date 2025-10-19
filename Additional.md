## 相对于原仓库，此仓库做出的主要改变

- 抛弃 im-switch 插件，解决输入法转换后不可用（需频繁重启）问题
- 增加 dart lsp && format(mac可用)
    - dart 始终使用 2 个空格进行格式化
    - 详情见[reddit](https://www.reddit.com/r/dartlang/comments/ilhr3i/why_two_spaces_instead_of_four/)
    - dartls 不会被 mason 管理
    - 不添加 flutter-tools.nvim 以保持插件精简
- 增加 Lazygit，抛弃 neo-tree 中的 git
- 增加习惯性键位 
    - `gl` = `<Leader>ld`
    - `<Leader>c` = `<Leader>bc`
    - `l` = `Enter` (in neo-tree)
