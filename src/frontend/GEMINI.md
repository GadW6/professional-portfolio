# GEMINI.md

This file provides guidance to Gemini when working with code in this repository.

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

You are able to use the Svelte MCP server, where you have access to comprehensive Svelte 5 and SvelteKit documentation. Here's how to use the available tools effectively:

### 1. list-sections

Use this FIRST to discover all available documentation sections. Returns a structured list with titles, use_cases, and paths.
When asked about Svelte or SvelteKit topics, ALWAYS use this tool at the start of the chat to find relevant sections.

### 2. get-documentation

Retrieves full documentation content for specific sections. Accepts single or multiple sections.
After calling the list-sections tool, you MUST analyze the returned documentation sections (especially the use_cases field) and then use the get-documentation tool to fetch ALL documentation sections that are relevant for the user's task.

### 3. svelte-autofixer

Analyzes Svelte code and returns issues and suggestions.
You MUST use this tool whenever writing Svelte code before sending it to the user. Keep calling it until no issues or suggestions are returned.

### 4. playground-link

Generates a Svelte Playground link with the provided code.
After completing the code, ask the user if they want a playground link. Only call this tool after user confirmation and NEVER if code was written to files in their project.
