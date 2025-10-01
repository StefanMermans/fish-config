function herd-auto-isolate -d "Auto isolate herd php to the version from the composer.json"
    set -l force_update 0

    for arg in $argv
        switch $arg
            case --update -u
                set force_update 1
            case '*'
                echo "Unknown option: $arg" >&2
                return 1
        end
    end

    set -l target_php_version (composer_php_version)
    set -l current_site (basename (pwd)).test

    if _is_isolated
        echo "Site is already isolated";
    end

    if test $force_update -eq 1; or not _is_isolated
        echo "Updating isolation to: $target_php_version";
        herd isolate $target_php_version
    end    

    echo 'Using isolated version'
    herd use
end

function _is_isolated
    set -l current_site (basename (pwd)).test

    if herd isolated | grep -q "$current_site"
        return 0
    else
        return 1
    end
end
