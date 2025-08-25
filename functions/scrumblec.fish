function scrumblec
    set connect 0
    set show_help 0
    set acc_only 0

    # Parse options
    argparse c/connect h/help a/acc -- $argv
    if test $status -eq 0
        if set -q _flag_help
            set show_help 1
        end
        if set -q _flag_acc
            set acc_only 1
        end

        if set -q _flag_connect
            set connect 1
        end

        set argv $argv[1..-1]  # Remove parsed flags from the arguments
    end

    # Help option
    if test $show_help -eq 1
        echo "Usage: scrumblec [OPTIONS] <container_name>"
        echo ""
        echo "Options:"
        echo "  -c, --connect   SSH into the selected server and open an interactive docker session"
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
        # set servers 185.100.131.141
    else
        set servers prod(seq 6) prod8
        # set servers 185.100.131.140 185.23.24.178 185.100.131.80 185.100.129.9 185.100.128.31 185.100.129.39 185.100.131.155
    end

    set containers (echo $servers | xargs -n1 -P0 -I "{0}" (which bash) -c 'ssh {0} "sudo docker ps" | grep -woiE "\s[a-z0-9-]+$" | grep -i '$argv' | xargs -I "{1}" echo "{0}" "{1}"')

    # If no containers are found
    if not set -q containers[1]
        echo "No matching containers found"
        return 1
    end

    # If connect flag is set
    if test $connect -eq 1
        # If multiple containers, use fzf for selection
        if test (echo $containers | wc -l | string trim) -gt 1
            set selected (printf "%s\n" $containers | fzf --prompt="Select a container: " --no-multi)
        else
            set selected $containers[1]
        end

        echo "Connecting to container: $selected"

        # Extract server and container id
        set server (string split \t $selected)[1]
        set container_id (string split \t $selected)[2]

        # SSH into the server and get interactive with the container
        ssh -t $server "sudo docker exec -it $container_id /bin/bash"
    else
        # If not connecting, just print out the results
        for container in $containers
            echo $container
        end
    end
end

