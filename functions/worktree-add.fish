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

    # Copy everything else, but don't clobber what git worktree already populated; skip .git, node_modules, vendor.
    rsync -a \
        --ignore-existing \
        --exclude '.git/' \
        --exclude 'node_modules/' \
        --exclude 'vendor/' \
        "$repo_root"/ "$target"/

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

    _install_deps
end

function _is_herd_project
    test -f artisan
end

function _install_deps
  set -l pids

  if test -e composer.json
    composer install &
    set pids $pids $last_pid
  end

  if test -e package.json
    npm install &
    set pids $pids $last_pid
  end

  if test (count $pids) -gt 0
    wait $pids
  end
end
