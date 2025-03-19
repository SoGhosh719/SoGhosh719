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

# Escape special characters for sed
LATEST_REPOS_ESCAPED=$(printf "%s" "$LATEST_REPOS" | sed 's/[\/&]/\\&/g' | sed ':a;N;$!ba;s/\n/\\n/g')
WEATHER_ESCAPED=$(printf "%s" "$WEATHER" | sed 's/[\/&]/\\&/g' | sed 's/°/ degrees/g' | sed ':a;N;$!ba;s/\n/\\n/g')

# Replace placeholders in README.md
sed -i "s|<!-- LATEST_REPOS -->|$LATEST_REPOS_ESCAPED|g" README.md
sed -i "s|<!-- WEATHER_UPDATE -->|$WEATHER_ESCAPED|g" README.md
