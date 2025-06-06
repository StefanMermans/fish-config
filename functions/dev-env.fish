function dev-env --description 'Start the dev env docker containers'
  set line (docker compose ls -a | fgrep dev-env | awk '{print $NF}')
  set path (string split " " -- $line | string match -r '/.*/docker-compose\.ya?ml$')
    
  if test -z "$path"
    echo "❌ Could not find dev-env compose file"
    return 1
  end

  docker compose --project-directory (dirname $path) $argv
end
