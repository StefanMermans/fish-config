function dock-env --description 'Run docker compose commands for any compose project'
    set -l compose_project $argv[1]

    if not ensure-docker-ready
        return 1
    end
    
    set -l compose_file_path (find-compose-path $compose_project)
    if test $status -ne 0
        return 1
    end
    
    docker compose --project-directory (dirname $compose_file_path) $argv[2..-1]
end
