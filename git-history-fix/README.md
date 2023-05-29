# Git History identity rewrite in all branches and tags

:warning: This script is a loose cannon, **use it only if you are absolutely sure what you are doing!**

## How to set up

1. Make the script executable (`chmod +x`)

1. Make sure the required environment variables are set in the `.env` file. ATTENTION all environment variables are mandatory, leave none blank.

1. Set an alias in `~/.bashrc`    
    ```
    alias gitfix=~/<path to github-identity-101 directory>/git-history-fix/git-history-fix.sh
    ```

## How to use

after the alias is set,

1. Clone the repository you want to cleanup

1. Set up git identity with `gitid`

1. Run `gitfix` in the terminal -- it will update all identities and push to remote
