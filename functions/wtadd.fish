function wtadd --description 'Add a git worktree and initialize the laravel repo'
    # Usage: wtadd <branch>
    set -l branch $argv[1]
    if test -z "$branch"
        echo "Usage: wtadd <branch>"
        return 2
    end

    # Current worktree root (source for copying untracked files)
    set -l current_root (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -ne 0; or test -z "$current_root"
        echo "Error: not inside a git repository."
        return 2
    end

    # Main repo root (always the first entry in worktree list)
    set -l main_root (git worktree list --porcelain | string match -r '^worktree (.+)' | head -2 | tail -1)

    # Worktrees live alongside the main repo: <parent>/<repo>.worktrees/<branch>/
    set -l repo_dirname (basename "$main_root")
    set -l repo_parent (dirname "$main_root")
    set -l worktrees_root "$repo_parent/$repo_dirname.worktrees"
    set -l target "$worktrees_root/$branch"

    echo "Setting up worktree in $target"

    mkdir -p "$worktrees_root"

    # Ensure branch exists (local or remote); create local tracking branch if only remote exists.
    if not git show-ref --verify --quiet "refs/heads/$branch"
        if git show-ref --verify --quiet "refs/remotes/origin/$branch"
            git branch --track "$branch" "origin/$branch"
            or return $status
        else
            # If neither local nor origin/<branch> exists, create it from HEAD.
            git branch "$branch"
            or return $status
        end
    end

    # Create worktree
    if test -e "$target"
        echo "Error: target already exists: $target"
        return 1
    end

    git worktree add "$target" "$branch"
    or return $status

    # TODO: this is slow. CP copy on write setup
    # echo "Copying files..."
    # # Copy untracked files using copy-on-write; skip .git, don't clobber tracked files.
    # for item in (command find "$current_root" -maxdepth 1 -mindepth 1 ! -name '.git')
    #     cp -c -n -R "$item" "$target/"
    # end
    # echo "Files copied!"

    echo "Copying files..."
    command rsync -a \
        --ignore-existing \
        --exclude '.git/' \
        "$current_root"/ "$target"/
    echo "Files copied!"

    cd "$target"

    if _is_herd_project
        set -l site_name (basename "$target")
        if test -f ".env"
            sed -i '' "s|^APP_URL=.*|APP_URL=https://$site_name.test|" .env
        end

        herd link
        herd secure
        herd-auto-isolate
    end
end

function _is_herd_project
    test -f artisan
end
