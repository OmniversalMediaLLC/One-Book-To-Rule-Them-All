#!/bin/bash
cd ~/Aether_Master

# Add all changes
git add .

# Commit with a timestamp
git commit -m "🔄 Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push origin main
