function scrumblec
    set connect_server 0
    set connect_docker 0
    set show_help 0
    set acc_only 0

    # Parse options
    argparse c/connect d/docker h/help a/acc -- $argv
    if test $status -eq 0
        if set -q _flag_help
            set show_help 1
        end
        if set -q _flag_acc
            set acc_only 1
        end

        if set -q _flag_docker
            set connect_docker 1
            set connect_server 1
        end

        if set -q _flag_connect
            set connect_server 1
        end

        set argv $argv[1..-1]  # Remove parsed flags from the arguments
    end

    # Help option
    if test $show_help -eq 1
        echo "Usage: scrumblec [OPTIONS] <container_name>"
        echo ""
        echo "Options:"
        echo "  -c, --connect   SSH into the selected server"
        echo "  -d, --docker    SSH into the selected server and open an interactive docker session"
        echo "  -a, --acc       Search on the acc server"
        echo "  -h, --help      Display this help message"
        return 0
    end

    # Check if a container name was provided
    if test (count $argv) -eq 0
        echo "Error: No container name provided."
        echo "Use --help for usage."
        return 1
    end

    echo "Searching for '$argv'"
    set containers

    if test $acc_only -eq 1
        set servers dev
    else
        set servers prod(seq 6) prod8
    end

    set containers (echo $servers | xargs -n1 -P0 -I "{0}" (which bash) -c 'ssh {0} "sudo docker ps" | grep -woiE "\s[a-z0-9-]+$" | grep -i '$argv' | xargs -I "{1}" echo "{0}" "{1}"')

    # If no containers are found
    if not set -q containers[1]
        echo "No matching containers found"
        return 1
    end

    if test $connect_server -eq 1
          # If multiple containers, use fzf for selection
        if test (echo $containers | wc -l | string trim) -gt 1
            set selected (printf "%s\n" $containers | fzf --prompt="Select a container: " --no-multi)
        else
            set selected $containers[1]
        end

        set server (string split ' ' $selected)[1]

        if test $connect_docker -eq 1
            set container_id (string split ' ' $selected)[2]
            echo "Connecting to container: $selected"
            # SSH into the server and get interactive with the container
            ssh -t $server "sudo docker exec -it $container_id /bin/bash"
        else
            echo "Connecting to server: $server"
            ssh -t $server bash
        end
    else
        _print_results $containers
    end
end

function _print_results 
    for container in $argv
        echo $container
    end
end