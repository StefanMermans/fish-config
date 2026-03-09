function wtswitch --description 'Switch to an existing git worktree by branch name'
    set -l branch $argv[1]
    if test -z "$branch"
        echo "Usage: wtswitch <branch|--home>"
        return 2
    end

    if test "$branch" = --home
        _wtswitch_home
    else
        _wtswitch_branch $branch
    end
end

function _wtswitch_home
    set -l main_root (git worktree list --porcelain 2>/dev/null | string match -r '^worktree (.+)' | head -2 | tail -1)
    if test -z "$main_root"
        echo "Error: not inside a git repository."
        return 2
    end
    cd "$main_root"
end

function _wtswitch_branch
    set -l branch $argv[1]
    set -l target (_wtswitch_find_worktree $branch)

    if test -z "$target"
        echo "No worktree found for branch: $branch"
        return 1
    end

    cd "$target"
end

function _wtswitch_find_worktree
    set -l branch $argv[1]
    set -l current_worktree ""
    for line in (git worktree list --porcelain 2>/dev/null)
        if string match -qr '^worktree (.+)' -- $line
            set current_worktree (string match -r '^worktree (.+)' -- $line)[2]
        else if string match -qr '^branch refs/heads/(.+)' -- $line
            set -l wt_branch (string match -r '^branch refs/heads/(.+)' -- $line)[2]
            if test "$wt_branch" = "$branch"
                echo $current_worktree
                return 0
            end
        end
    end
    return 1
end
