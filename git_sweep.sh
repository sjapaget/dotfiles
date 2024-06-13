#!/bin/bash
branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)
if [ "$branch" == "master" ] || 
[ "$branch" == "main" ] || 
[ "$branch" == 'dev' ] ||
[ "$branch" == 'develop' ]; then
  git branch --merged "$branch" | grep -v "$branch$" | xargs git branch -d
  git remote prune origin
else
  echo "Unsupported branch name: $branch"
fi