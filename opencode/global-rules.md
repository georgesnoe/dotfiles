# Global Development Rules for georgesnoe

## Tech Stack & Preferences
- **Runtime:** Node.js (npm), Python (pip).
- **Frontend:** React, Next.js, TypeScript.
- **Deployment:** Vercel (use Vercel CLI for env sync and deployments).
- **Version Control:** Git, GitHub CLI (`gh`).
- **Editor:** Neovim (LazyVim).
- **CLI Utilities:** zoxide, fzf, bat, tldr.

## Coding Standards
- **TypeScript:** Use strict typing. Prefer functional components and hooks in React.
- **Next.js:** Follow App Router conventions.
- **Python:** Maintain clean, PEP 8 compliant code.
- **General:** Prioritize readability, maintainability, and performance. Avoid redundant comments.

## Workflow & Tooling
- **Git:** Utilize existing `.gitconfig` aliases (e.g., `st`, `co`, `cm`, `lg`).
- **Vercel:** Use `vercel env pull .env.local` to sync environment variables.
- **Project Init:** Always check for `AGENTS.md` to understand project-specific context.
- **Execution:** Use `npm` for JS/TS and `pip` for Python.
