# zed-vala

VBB's fork of https://github.com/FyraLabs/zed-vala with support for forked `tree-sitter-vala` grammar until changes are merged into the main repository.

[Vala](https://vala.dev) support for Zed.
Please note that [vala-language-server](https://github.com/vala-lang/vala-language-server) is required to be installed on the system at this time.
For formatting, you will need to install [uncrustify](https://github.com/uncrustify/uncrustify) on the system.

# Features
- LSP (via vala-language-server)
- Formatting (via LSP using uncrustify)
- Folding
- Syntax highlighting
- Outline

# References

- https://github.com/vala-lang/vala-language-server
- https://github.com/vala-lang/vala-vscode
- https://github.com/lv37/zed-v
- https://github.com/zed-industries/zed/tree/main/extensions/csharp
- https://github.com/nvim-treesitter/nvim-treesitter/tree/master/queries/vala
- https://github.com/zed-industries/zed/tree/main/extensions/deno
- https://github.com/uncrustify/uncrustify

# TODOs (contributions welcome!)
- Runnables (click to run; meson integration?)
- Bundle precompiled VLS and uncrustify (to make system package not required)
- General cleanup
