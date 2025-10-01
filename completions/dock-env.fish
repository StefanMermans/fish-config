# fish completion for dock-env first argument (Compose project names)

function __dock_env_compose_projects --description 'List Docker Compose projects for completion'
    # Use awk to skip header, print first column, and deduplicate
    if not type -q docker
        return
    end

    docker compose ls -a 2>/dev/null | awk '
        BEGIN { start=0 }
        /^NAME([[:space:]]|$)/ { start=1; next }
        start && NF {
            name=$1
            if (!(name in seen)) { print name; seen[name]=1 }
        }
    '
end

# Offer project name for the first positional argument
complete -c dock-env \
    -n 'test (count (commandline -opc)) -eq 1' \
    -f \
    -a '(__dock_env_compose_projects)' \
    -d 'Docker Compose project'

