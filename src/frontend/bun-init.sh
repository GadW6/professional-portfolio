#!/bin/bash
# Development Environment Setup
# This script configures MCP servers and starts the development environment
# using Docker Compose with Bun

set -e

#####################
# MCP
#####################
echo "Configuring MCP servers..."

# Check if Svelte MCP server is already configured
if claude mcp list 2>/dev/null | grep -q "svelte"; then
	echo "  - Svelte MCP server already configured, skipping."
else
	echo "  - Adding Svelte MCP server..."
	claude mcp add -t http -s user svelte https://mcp.svelte.dev/mcp 2>/dev/null || echo "    (Failed to add Svelte MCP, continuing...)"
fi

echo ""


#####################
# DOCKER COMPOSE
#####################
echo "Starting development environment with Docker Compose..."
echo ""

# # Start services in detached mode
# docker compose -f dev.docker-compose.yml up -d

# # Attach to bun service logs (this will keep the script running)
# docker compose -f dev.docker-compose.yml logs -f bun

# Start Stack
docker compose -f dev.docker-compose.yml up
