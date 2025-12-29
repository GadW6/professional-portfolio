# Stage 1: Builder
FROM oven/bun:latest AS builder

WORKDIR /app

# Copy dependency files
COPY package.json bun.lockb ./

# Install dependencies with frozen lockfile for reproducible builds
RUN bun install --frozen-lockfile

# Copy source code
COPY . .

# Build the Svelte application
RUN bun run build

# Stage 2: Runtime
FROM oven/bun:latest

WORKDIR /app

# Copy built application from builder stage
COPY --from=builder /app/build ./build
COPY --from=builder /app/package.json ./

# Set production environment
ENV NODE_ENV=production
ENV PORT=5000
ENV HOST=0.0.0.0

# Expose port 5000
EXPOSE 5000

# Run the production Node.js server built by adapter-node
CMD ["node", "build/index.js"]
