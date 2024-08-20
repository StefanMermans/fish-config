set -x NVM_DIR "$HOME/.nvm"
set fish_greeting ""

load_nvm > /dev/stderr

# Commands to run in interactive sessions can go here
if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
    set -x GPG_TTY (tty)
    nvm use node
end

