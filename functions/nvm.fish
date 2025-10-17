function nvm
  switch $argv[1]
    case 'load'
      _load_nvm
    case '*'
      bass source $NVM_DIR/nvm.sh --no-use ';' nvm $argv
  end
end

function _load_nvm --on-variable="PWD"
  set -l nvmrc_path .nvmrc
  if not test -e $nvmrc_path
    _load_default_nvm

    return
  end

  set -l requested_node_version (cat $nvmrc_path)
  echo -n "🛠️ Using node $requested_node_version from nvmrc. "

  if not test (nvm use $requested_node_version)
    echo "Failed to load node version $requested_node_version." >&2
    _revert_to_default_nvm
  else
    echo "Loaded node version $requested_node_version."
  end
end

function _revert_to_default_nvm
  echo "Reverting to default Node version"
  _load_default_nvm
end

function _load_default_nvm
  nvm use default --silent
end

function _find_nvmrc
  bass source $NVM_DIR/nvm.sh --no-use ';' nvm_find_nvmrc
end
