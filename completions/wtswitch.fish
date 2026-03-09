# fish completion for wtswitch (git worktree switcher)

function __wtswitch_branches --description 'List git worktree branch names'
    for line in (git worktree list --porcelain 2>/dev/null)
        if string match -qr '^branch refs/heads/(.+)' -- $line
            string match -r '^branch refs/heads/(.+)' -- $line | tail -1
        end
    end
end

# Disable file completions — only offer our suggestions
complete -c wtswitch -f

# --home flag
complete -c wtswitch -l home -d 'Switch to the main worktree root'

# Branch names as positional argument
complete -c wtswitch \
    -n 'not __fish_seen_subcommand_from --home; and test (count (commandline -opc)) -eq 1' \
    -a '(__wtswitch_branches)' \
    -d 'Worktree branch'
