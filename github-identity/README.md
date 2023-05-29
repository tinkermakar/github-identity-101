# GitHub identity switching utility

This utility script is for people daily driving multiple github accounts on the same machine. It helps with quickly selecting and setting `git config.name` and `git.config.email` in newly cloned repositories, based on predefined identities in the `.env` file. 

## How to setup

1. Make the script executable (`chmod +x`)

1. Make sure the required environment variables are set in the `.env` file, per the example. Since bash does not allow the declaration of an array of objects, multiple arrays are used instead, where the logical grouping of items happens by index.

1. Set an alias in `~/.bashrc`
    ```
    alias gitid=~/~/<path to github-identity-101 directory>/github-identity/gitid.sh
    ```

## How to use

after the alias is set,

1. Run `gitid` in the terminal and select from the list of available identities, or

1. Run `gitid <name>` where `<name>` is the git identity name you want to set,
