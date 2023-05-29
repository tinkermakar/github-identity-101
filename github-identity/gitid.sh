#!/bin/bash

# Reset variables
unset TYPED_NAME SELECTED_ID GIT_ID_ALIASES GIT_ID_NAMES GIT_ID_EMAILS

# Read DOTENV
env_dir=`dirname "$(realpath $0)"`
env_path="$env_dir/.env"

set -a
source $env_path 
set +a

# Confirm the length of name and email arrays are matching
if [[ ! ( ${#GIT_ID_ALIASES[@]} && ${#GIT_ID_NAMES[@]} == ${#GIT_ID_EMAILS[@]} ) ]]; then

  echo "GIT_ID_ALIASES:      ${#GIT_ID_ALIASES[@]}"
  echo "GIT_ID_NAMES:        ${#GIT_ID_NAMES[@]}"
  echo "GIT_ID_EMAILS:       ${#GIT_ID_EMAILS[@]}"
  
  echo ">>> The lengths of environment variables are not matching, exiting."
  exit 1
fi

# Read the prefered identity
if [ -z $1 ]; then
  echo "What GitHub identity do you want?" 
  for i in ${!GIT_ID_ALIASES[@]}; do
    echo "  - ${GIT_ID_ALIASES[$i]}: ${GIT_ID_NAMES[$i]} (${GIT_ID_EMAILS[$i]})"
  done
  read -p "Select identity: " TYPED_NAME

else
  TYPED_NAME=$1
fi

for i in ${!GIT_ID_NAMES[@]}; do
  if [[ $TYPED_NAME == ${GIT_ID_ALIASES[$i]} ]]; then
    SELECTED_ID=$i
  fi
done


if [ -z $SELECTED_ID ]; then
  echo ">>> Identity does not exist, exiting."
  exit 1
fi

# Update git global email
git config user.name ${GIT_ID_NAMES[$SELECTED_ID]}
git config user.email ${GIT_ID_EMAILS[$SELECTED_ID]}

echo ">>> Git identiny set to: ${GIT_ID_EMAILS[$SELECTED_ID]}"
