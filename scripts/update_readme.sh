#!/bin/bash

# Fetch latest repositories
LATEST_REPOS=$(curl -s https://api.github.com/users/SoGhosh719/repos?sort=updated | jq -r '.[0:5] | map("- [\(.name)](\(.html_url))") | .[]')

# Fetch Gotham weather
WEATHER=$(curl -s "https://wttr.in/New+York?format=3")

# Update the README file
sed -i "s|<!-- LATEST_REPOS -->|$LATEST_REPOS|g" README.md
sed -i "s|<!-- WEATHER_UPDATE -->|$WEATHER|g" README.md

chmod +x scripts/update_readme.sh
