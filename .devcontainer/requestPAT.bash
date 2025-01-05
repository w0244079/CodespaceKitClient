#!/bin/bash

# Remove the PAT set by the codespace.
# That PAT is scoped for the repo used to create the codespace.
# It will not work to push a manually cloned repo.
unset GITHUB_TOKEN

# If we don't already have a token stashed, then prompt for one
# and stash it.
if [ ! -f ~/.kit/token ];
then
  read -p -s "Paste your GitHub Personal Access Token (PAT) here: " PAT
  echo "$PAT" > ~/.kit/token
fi

PAT=$(cat ~/.kit/token)
export GITHUB_TOKEN="$PAT"

# If the PAT does not work, prompt for a new one until we 
# get one that works.
while [ ! $(gh auth status) ];
do
  echo "Your Personal Access Token (PAT) is not valid."
  echo "  If you just created the PAT try it again."
  echo "  If your PAT fails multiple times, try creating a new one."
  echo "  If your PAT is old, it may have expired. Try creating a new one."
  echo ""

  read -p -s "Paste your GitHub Personal Access Token (PAT) here: " PAT

  echo "$PAT" > ~/.kit/token
  export GITHUB_TOKEN="$PAT"
done

