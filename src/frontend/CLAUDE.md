# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a SvelteKit application using Svelte 5 with Tailwind CSS v4. The project uses Vite as the build tool and includes comprehensive testing setup with Vitest for unit tests.

**Package Manager**: This project uses **Bun** instead of npm. All commands should use `bun` instead of `npm` (e.g., `bun run dev`, `bun install`, `bun run test`).

## Development Commands

### Running the Application

```bash
bun run dev              # Start development server on port 5000 (host: 0.0.0.0)
bun run dev -- --open    # Start dev server and open in browser
bun run build            # Build for production
bun run preview          # Preview production build on port 8080
```

### Code Quality

```bash
bun run check            # Type-check the codebase
bun run check:watch      # Type-check in watch mode
bun run lint             # Run ESLint and Prettier checks
bun run format           # Format code with Prettier
```

### Testing

```bash
bun run test             # Run all tests (unit tests via Vitest)
bun run test:unit        # Run Vitest unit tests (watch mode)
bun run test:unit -- --run  # Run unit tests once (no watch)
```

**Important**: Do NOT use `bun test` directly - it uses Bun's native test runner which doesn't support Vitest. Always use the npm scripts (`bun run test`, `bun run test:unit`).

## Project Structure

```
src/
├── lib/                 # Shared utilities and components
│   ├── assets/         # Static assets (favicon, images, etc.)
│   └── index.js        # Library exports
├── routes/             # SvelteKit file-based routing
│   ├── +layout.svelte  # Root layout component
│   ├── +page.svelte    # Home page component
│   ├── layout.css      # Global styles (Tailwind CSS)
│   └── *.spec.js       # Component unit tests (Vitest)
├── app.html            # HTML template
└── app.d.ts            # TypeScript declarations

static/                 # Static files served at root
```

## Architecture & Patterns

### Svelte 5 Runes

This project uses Svelte 5 with runes syntax:

- Use `$state()` for reactive state instead of `let` variables
- Use `$props()` for component props (e.g., `let { children } = $props()`)
- Use `$derived()` for computed values
- Use `$effect()` for side effects

### SvelteKit Conventions

- File-based routing in `src/routes/`
- `+page.svelte` files define routes
- `+layout.svelte` files define shared layouts
- Server-side code goes in `+page.server.js` or `+layout.server.js`
- Use `$lib` alias to import from `src/lib/`

### Tailwind CSS v4

- Tailwind is configured via Vite plugin (no separate config file needed)
- Global styles in `src/routes/layout.css`
- Prettier plugin automatically sorts Tailwind classes
- Uses utility-first approach with custom gradient backgrounds

## Testing Strategy

### Unit Tests (Vitest)

- Location: `src/**/*.svelte.{test,spec}.{js,ts}`
- Uses `@testing-library/svelte` for component testing
- Runs in `happy-dom` environment (lightweight DOM simulation)
- Two test projects configured:
  - `client`: Tests for Svelte components and client-side code
  - `server`: Tests for server-side code (if any)
- Import components and use `render()` from `@testing-library/svelte/svelte5`
- Use `screen.getByRole()` and other Testing Library queries

### Running Single Tests

```bash
# Run specific unit test file
bun run test:unit -- src/routes/+page.svelte.spec.js

# Run tests in watch mode
bun run test:unit

# Run tests once (no watch)
bun run test:unit -- --run
```

## Code Style

- **Tabs for indentation** (not spaces)
- **Single quotes** for strings
- **No trailing commas**
- **100 character line width**
- Prettier enforces consistency automatically

## Svelte MCP Server

**CRITICAL**: ALWAYS use the Svelte MCP server when working with ANY Svelte or SvelteKit code to ensure accuracy and avoid hallucinations. This project uses Svelte 5 with runes, which requires up-to-date documentation.

### Required Workflow for ALL Svelte/SvelteKit Tasks

1. **`list-sections`** - MUST be called FIRST when any Svelte/SvelteKit topic comes up to discover all available documentation sections. Returns a structured list with titles, use_cases, and paths.

2. **Analyze use_cases** - Review ALL returned sections and identify EVERY section relevant to the task by examining the use_cases field.

3. **`get-documentation`** - Fetch ALL relevant sections at once (accepts array of sections). This provides comprehensive, official Svelte 5 documentation to ensure accurate implementation.

4. **`svelte-autofixer`** - MANDATORY before sending any Svelte code to the user. Call repeatedly until NO issues or suggestions are returned. This ensures code follows Svelte 5 best practices.

5. **`playground-link`** - Only after completing code and receiving user permission. NEVER use if code was written to project files.

### Why This Matters

- Svelte 5 introduced breaking changes (runes: `$state()`, `$props()`, `$derived()`, `$effect()`)
- Using outdated knowledge leads to code that doesn't work with Svelte 5
- The MCP server provides official, current documentation
- The autofixer catches common mistakes and suggests best practices

**Summary**: For ANY Svelte work → list-sections → get-documentation → write code → svelte-autofixer (repeat until clean)
