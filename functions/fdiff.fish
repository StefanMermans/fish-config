function fdiff --description "Colorized diff between two files"
    if test (count $argv) -ne 2
        echo "Usage: fdiff <file1> <file2>"
        return 1
    end
    git --no-pager diff --no-index --color=always -- $argv[1] $argv[2] | less -R
end
