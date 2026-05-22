# LSP Setup

LSPs are installed via Mason. After the first `nvim` launch, run `:Mason` and wait for everything to install.

## What's installed

| Tool | What for |
|---|---|
| `vtsls` | TypeScript / JavaScript / JSX / TSX language server |
| `intelephense` | PHP language server |
| `eslint-lsp` | ESLint diagnostics inline |
| `tailwindcss-language-server` | Tailwind class IntelliSense |
| `cssls`, `html-lsp`, `emmet-language-server`, `jsonls` | standard web stack |
| `prettierd` | fast prettier daemon (web formatter) |
| `php-cs-fixer` | PHP formatter |
| `stylua` | Lua formatter (for the config itself) |

## Verification

After install, open a TS file:
```bash
echo 'const x: string = 1;' > /tmp/test.tsx
nvim /tmp/test.tsx
```

You should see an inline diagnostic on the line. Save with `:w` — the file reformats via prettierd.

## Per-language notes

- **vtsls** replaces `ts_ls` (better inlay hints, faster, supports TS project references)
- **intelephense** is the best free PHP LSP. A paid license unlocks more features but free tier is sufficient for the workflow.
- **php-cs-fixer** requires a `.php-cs-fixer.dist.php` config in each PHP project. If missing, it falls back to PSR-12 defaults.
