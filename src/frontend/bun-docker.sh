#!/bin/bash
# Interactive Bun Shell
# This script opens an interactive bash shell inside a Bun container
# with the frontend directory mounted

docker run --rm -it \
  --name bun \
  -v ./src/frontend:/app \
  --user bun \
  -w /app \
  oven/bun:latest \
  bash
