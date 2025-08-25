function find-compose-path --description 'Find the Docker Compose file path for the dev environment'
    set -l compose_file_name $argv
    set -l compose_info (docker compose ls -a | fgrep $compose_file_name | awk '{print $NF}')
    set -l compose_path (string split " " -- $compose_info | string match -r '/.*/docker-compose\.ya?ml$')
    
    if test -z "$compose_path"
        echo "❌ Could not find \"$compose_file_name\" compose file"
        return 1
    end
    
    echo $compose_path
end