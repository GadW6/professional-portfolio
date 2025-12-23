#!/bin/bash
# Interactive Bun Shell
# This script opens an interactive bash shell inside a Bun container
# with the frontend directory mounted

# RUN MCP
claude mcp add -t http -s user svelte https://mcp.svelte.dev/mcp

  # -v ./src/frontend:/app \

docker run --rm -it \
  --name bun \
  -v .:/app \
  --user bun \
  -w /app \
  -p 5000:5000 \
  oven/bun:latest \
  -- run dev

