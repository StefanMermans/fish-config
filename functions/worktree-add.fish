function worktree-add --description 'Add a git worktree and initialize the laravel repo'
    # Usage: gwadd <branch>
    set -l branch $argv[1]
    if test -z "$branch"
        echo "Usage: gwadd <branch>"
        return 2
    end

    # Find repo root for whatever git repo we're in
    set -l repo_root (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -ne 0; or test -z "$repo_root"
        echo "Error: not inside a git repository."
        return 2
    end

    # Worktrees live alongside the repo: <parent>/<repo>.worktrees/<branch>/
    set -l repo_dirname (basename "$repo_root")
    set -l repo_parent (dirname "$repo_root")
    set -l worktrees_root "$repo_parent/$repo_dirname.worktrees" # Worktrees 1 level up
    # set -l worktrees_root "$repo_parent/$repo_dirname/worktrees" # Worktrees in repo dir
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

    # Copy untracked files using copy-on-write; skip .git, don't clobber tracked files.
    for item in (command find "$repo_root" -maxdepth 1 -mindepth 1 ! -name '.git')
        cp -c -n -R "$item" "$target/"
    end

    cd "$target"

    # change `APP_URL=...` to `APP_URL=https://$branch.test` in `.env`
    if test -f ".env"
        sed -i '' "s|^APP_URL=.*|APP_URL=https://$branch.test|" .env
    end

    if _is_herd_project
        herd link
        herd secure
        herd-auto-isolate
    end
end

function _is_herd_project
    test -f artisan
end
