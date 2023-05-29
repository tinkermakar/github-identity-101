#!/bin/bash

# Reset variables
unset MY_OTHER_EMAIL_1 MY_OTHER_EMAIL_2 MY_OTHER_EMAIL_3 MY_OTHER_EMAIL_4 MY_OTHER_EMAIL_5 MY_OTHER_EMAIL_6 MY_CORRECT_EMAIL MY_CORRECT_NAME

# Read DOTENV
env_dir=`dirname "$(realpath $0)"`
env_path="$env_dir/.env"

set -a
source $env_path 
set +a

git filter-branch -f --env-filter '
  FILTER_BRANCH_SQUELCH_WARNING=1

  if
    [ $GIT_COMMITTER_EMAIL = $MY_OTHER_EMAIL_1 ] ||
    [ $GIT_COMMITTER_EMAIL = $MY_OTHER_EMAIL_2 ] ||
    [ $GIT_COMMITTER_EMAIL = $MY_OTHER_EMAIL_3 ] ||
    [ $GIT_COMMITTER_EMAIL = $MY_OTHER_EMAIL_4 ] ||
    [ $GIT_COMMITTER_EMAIL = $MY_OTHER_EMAIL_5 ] ||
    [ $GIT_COMMITTER_EMAIL = $MY_OTHER_EMAIL_6 ]
  then
    export GIT_COMMITTER_EMAIL="$MY_CORRECT_EMAIL"
    export GIT_COMMITTER_NAME="$MY_CORRECT_NAME"
  fi

  if
    [ $GIT_AUTHOR_EMAIL = $MY_OTHER_EMAIL_1 ] ||
    [ $GIT_AUTHOR_EMAIL = $MY_OTHER_EMAIL_2 ] ||
    [ $GIT_AUTHOR_EMAIL = $MY_OTHER_EMAIL_3 ] ||
    [ $GIT_AUTHOR_EMAIL = $MY_OTHER_EMAIL_4 ] ||
    [ $GIT_AUTHOR_EMAIL = $MY_OTHER_EMAIL_5 ] ||
    [ $GIT_AUTHOR_EMAIL = $MY_OTHER_EMAIL_6 ]
  then
    export GIT_AUTHOR_EMAIL="$MY_CORRECT_EMAIL"
    export GIT_AUTHOR_NAME="$MY_CORRECT_NAME"
  fi

' --tag-name-filter cat -- --branches --tags

git push --force --all
git push --force --tags
