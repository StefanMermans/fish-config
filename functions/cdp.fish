# --------------------------------------------------------------------------
# This file is originally made by Mechazawa
# https://github.com/Mechazawa
# --------------------------------------------------------------------------
function cdp -d "Navigate up to the nearest git project root"
    set current_dir (pwd)
    while test (basename $current_dir) != "/"
        if test -d "$current_dir/.git"
            cd $current_dir
            return 0
        end
        set current_dir (dirname $current_dir)
    end
    echo "No .git directory found." >&2
    return 1
end
