function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color 55fa8b)
    set -l vcs_color (set_color brpurple)
    set -l prompt_status ""
    set -l user_name (id -un)
    set -l user_color (set_color aaaaff)
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showcolorhints true
    set -g __fish_git_prompt_color_prefix a4a4a4
    set -g __fish_git_prompt_color_suffix a4a4a4
    set -g __fish_git_prompt_color_branch white
    set -g __fish_git_prompt_color_dirtystate ff6655

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    echo -s $user_color $user_name $normal ' @ ' $cwd_color (prompt_pwd) $normal (fish_vcs_prompt) $normal ' ' $prompt_status $normal
    echo -n -s '' $normal
end

