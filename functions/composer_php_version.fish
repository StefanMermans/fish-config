function composer_php_version -d "Print the PHP requirement declared in composer.json"
    # Reads composer.json (or a provided path) and prints the raw numeric PHP version from the constraint
    set -l file composer.json
    if test (count $argv) -gt 0
        set file $argv[1]
    end

    if not test -f $file
        echo "composer_php_version: file '$file' not found" >&2
        return 1
    end

    set -l php_requirement (python3 (dirname (status -f))/python/__extract_php_version_from_composer.py $file)

    set -l cmd_status $status
    if test $cmd_status -ne 0
        return $cmd_status
    end

    echo $php_requirement
end
