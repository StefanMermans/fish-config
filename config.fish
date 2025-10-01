set -x NVM_DIR "$HOME/.nvm"
set -g fish_greeting ""
set -x ANDROID_HOME "$HOME/Library/Android/sdk"

if status is-interactive
    set -x GPG_TTY (tty)
end

eval (/opt/homebrew/bin/brew shellenv)
nvm load
load_jenv