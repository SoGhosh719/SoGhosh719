#!/bin/bash

# Fetch latest repositories
LATEST_REPOS=$(curl -s https://api.github.com/users/SoGhosh719/repos?sort=updated | jq -r '.[0:5] | map("- [\(.name)](\(.html_url))") | .[]')

# Fetch Gotham weather
WEATHER=$(curl -s "https://wttr.in/New+York?format=3")

# Debugging: Print the fetched data
echo "Latest Repos:"
echo "$LATEST_REPOS"
echo "Weather:"
echo "$WEATHER"

# Ensure the script runs inside the correct directory
cd "$(dirname "$0")/.." || exit

# Replace placeholders in README.md
sed -i "s|<!-- LATEST_REPOS -->|$LATEST_REPOS|g" README.md
sed -i "s|<!-- WEATHER_UPDATE -->|$WEATHER|g" README.md
