set -x NVM_DIR "$HOME/.nvm"
set -g fish_greeting ""

load_nvm > /dev/stderr

# Commands to run in interactive sessions can go here
if status is-interactive
    set -l normal_color (set_color normal)

    # Idk what this does really
    set -x GPG_TTY (tty)
    eval (/opt/homebrew/bin/brew shellenv)

    # Node
    set -l node_color (set_color 77dd77)
    nvm use node --silent
    echo -s $node_color "Node: " $normal_color (node --version)
    
    # PHP
    set -l php_color (set_color ee7777)
    set -l php_version (php --version | head -n 1 | grep -oE "\d+\.\d+\.\d+")
    echo -s $php_color "PHP:  " $normal_color "v" $php_version
end

