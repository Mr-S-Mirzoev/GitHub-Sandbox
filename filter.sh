#!/bin/sh

git filter-branch --env-filter '
OLD_EMAIL="s.mirzoev@avsw.ru"
CORRECT_NAME="Mr-S-Mirzoev"
CORRECT_EMAIL="mrsergeymirzoev@gmail.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

# After finishing filterring the branch, run 'git push --force origin'