set -x NVM_DIR "$HOME/.nvm"
set -g fish_greeting ""
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x EDITOR '/Users/stefan/nvim-macos/bin/nvim'

set -x HERD_PHP_74_INI_SCAN_DIR "/Users/stefan/Library/Application Support/Herd/config/php/74/"
set -x HERD_PHP_80_INI_SCAN_DIR "/Users/stefan/Library/Application Support/Herd/config/php/80/"
set -x HERD_PHP_81_INI_SCAN_DIR "/Users/stefan/Library/Application Support/Herd/config/php/81/"
set -x HERD_PHP_82_INI_SCAN_DIR "/Users/stefan/Library/Application Support/Herd/config/php/82/"
set -x HERD_PHP_83_INI_SCAN_DIR "/Users/stefan/Library/Application Support/Herd/config/php/83/"
set -x HERD_PHP_84_INI_SCAN_DIR "/Users/stefan/Library/Application Support/Herd/config/php/84/"
set -x HERD_PHP_85_INI_SCAN_DIR "/Users/stefan/Library/Application Support/Herd/config/php/85/"

if status is-interactive
    set -x GPG_TTY (tty)
end

eval (/opt/homebrew/bin/brew shellenv)
nvm load
