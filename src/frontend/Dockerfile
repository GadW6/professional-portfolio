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

# Copy package.json and lockfile
COPY package.json bun.lockb ./

# Install only production dependencies
RUN bun install --frozen-lockfile --production

# Copy built application from builder stage
COPY --from=builder /app/build ./build
COPY --from=builder /app/package.json ./

# Expose port 5000
EXPOSE 5000

# Run the preview server on all interfaces
CMD ["bun", "run", "preview", "--host", "0.0.0.0", "--port", "5000"]
