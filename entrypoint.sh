#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

echo "Tautulli MCP Service: Initializing..."

# Validate required environment variables
if [ -z "$TAUTULLI_URL" ]; then
    echo "Error: TAUTULLI_URL environment variable is required"
    exit 1
fi

if [ -z "$TAUTULLI_API_KEY" ]; then
    echo "Error: TAUTULLI_API_KEY environment variable is required"
    exit 1
fi

# Set defaults for MCP server configuration
export TAUTULLI_MCP_HOST=${TAUTULLI_MCP_HOST:-"0.0.0.0"}
export TAUTULLI_MCP_PORT=${TAUTULLI_MCP_PORT:-"9156"}
export TAUTULLI_MCP_TRANSPORT=${TAUTULLI_MCP_TRANSPORT:-"sse"}
export TAUTULLI_LOG_LEVEL=${TAUTULLI_LOG_LEVEL:-"INFO"}

echo "Tautulli MCP Service: Configuration validated"
echo "  - TAUTULLI_URL: $TAUTULLI_URL"
echo "  - TAUTULLI_API_KEY: ***SET***"
echo "  - MCP_HOST: $TAUTULLI_MCP_HOST"
echo "  - MCP_PORT: $TAUTULLI_MCP_PORT"
echo "  - MCP_TRANSPORT: $TAUTULLI_MCP_TRANSPORT"
echo "  - LOG_LEVEL: $TAUTULLI_LOG_LEVEL"

# Change to app directory (important for relative path handling)
cd /app

echo "Tautulli MCP Service: Starting server..."
exec python3 tautulli-mcp-server.py 