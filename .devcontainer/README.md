# Dev Container Configuration

This directory contains configurations for two Docker-in-Docker (DinD) variants.

## Current Setup

**Active Configuration:** Alpine (default)
- Uses: `Dockerfile` → `localhost/dind/alpine:cc`
- Config: `devcontainer.json`

## Switching Between Variants

### Option 1: Rename Files (Simple)

To switch to Ubuntu with Ollama:

```bash
# Backup current config
mv .devcontainer/Dockerfile .devcontainer/alpine.Dockerfile.bak
mv .devcontainer/devcontainer.json .devcontainer/alpine.devcontainer.json.bak

# Activate Ubuntu config
mv .devcontainer/ubuntu.Dockerfile .devcontainer/Dockerfile
mv .devcontainer/ubuntu.devcontainer.json .devcontainer/devcontainer.json

# Rebuild container in VS Code: Cmd+Shift+P → "Rebuild Container"
```

To switch back to Alpine:

```bash
# Restore Alpine config
mv .devcontainer/Dockerfile .devcontainer/ubuntu.Dockerfile
mv .devcontainer/devcontainer.json .devcontainer/ubuntu.devcontainer.json
mv .devcontainer/alpine.Dockerfile.bak .devcontainer/Dockerfile
mv .devcontainer/alpine.devcontainer.json.bak .devcontainer/devcontainer.json

# Rebuild container
```

### Option 2: Manual Edit (Quick)

Edit `.devcontainer/Dockerfile`:

```dockerfile
# For Alpine (lightweight, ~300MB)
FROM localhost/dind/alpine:cc

# For Ubuntu with Ollama (~4.7GB)
FROM localhost/dind/ubuntu:cc
```

Then rebuild container in VS Code.

### Option 3: VS Code Multi-Config (Advanced)

VS Code supports selecting from multiple devcontainer.json files:

1. Keep both configs in place:
   - `alpine.devcontainer.json`
   - `ubuntu.devcontainer.json`

2. When opening project, VS Code will prompt you to choose

3. Or use: Cmd+Shift+P → "Reopen in Container" and select config

## Available Configurations

### Alpine (Current Default)
- **File**: `Dockerfile`, `devcontainer.json`
- **Image**: `localhost/dind/alpine:cc`
- **Size**: ~300MB
- **Best for**: Docker work, API-based LLMs
- **Includes**: Docker, Node.js, Claude Code, Git, Zsh

### Ubuntu with Ollama
- **Files**: `ubuntu.Dockerfile`, `ubuntu.devcontainer.json`
- **Image**: `localhost/dind/ubuntu:cc`
- **Size**: ~4.7GB
- **Best for**: Local LLM inference, GPU work
- **Includes**: Everything in Alpine + Ollama
- **Port**: 11434 (Ollama API)

## Testing the Environment

### After switching to Alpine:
```bash
docker --version
node --version
claude --version
docker run hello-world  # Test Docker-in-Docker
```

### After switching to Ubuntu:
```bash
docker --version
node --version
claude --version
ollama --version
docker run hello-world

# Test Ollama
ollama pull phi3:mini    # Small 1.6GB model
ollama run phi3:mini "Hello, what can you do?"
```

## Building Images

If images aren't built yet:

```bash
cd dockerfiles/dind

# Build both variants
./build-all.sh

# Or build individually
./build-alpine.sh
./build-ubuntu.sh
```

## More Information

See [dockerfiles/dind/README.md](../dockerfiles/dind/README.md) for comprehensive documentation on both variants.
