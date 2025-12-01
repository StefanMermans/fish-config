function nvm
  switch $argv[1]
    case 'load'
      _load_nvm $argv[2..-1]
    case '*'
      bass source $NVM_DIR/nvm.sh --no-use ';' nvm $argv
  end
end

function _load_nvm --on-variable="PWD"
  set -l silent (_is_silent $argv)

  set -l nvmrc_path .nvmrc
  if not test -e $nvmrc_path
    _load_default_nvm $silent

    return
  end

  set -l requested_node_version (cat $nvmrc_path)
  if test "$silent" = "false"
    echo -n "🛠️ Using node $requested_node_version from nvmrc. "
  end

  if not test (nvm use $requested_node_version)
    if test "$silent" = "false"
      echo "Failed to load node version $requested_node_version." >&2
    end
    _revert_to_default_nvm $silent
  else
    if test "$silent" = "false"
      echo "Loaded node version $requested_node_version."
    end
  end
end

function _is_silent
  argparse s/silent i/interactive -- $argv

  if not status is-interactive; and not set -q _flag_interactive
    echo true
    return
  end

  if set -q _flag_silent
    echo true
  else
    echo false
  end
end

function _revert_to_default_nvm
  echo "Reverting to default Node version"
  _load_default_nvm $silent
end

function _load_default_nvm --argument-names silent
  nvm use default --silent
end

function _find_nvmrc
  bass source $NVM_DIR/nvm.sh --no-use ';' nvm_find_nvmrc
end
