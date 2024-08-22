function nvm-auto --on-variable PWD
    if test ! -f package-lock.json
        return 0
    end

    set nvm_versions (nvm ls --no-colors --no-alias | grep -oE 'v[^ ]+')
    set target_version (
        begin
            jq -r '.packages[].engines.node' package-lock.json 2>/dev/null || true
        end | string replace '= ' '=' \
        | grep -v null \
        | grep -v '*' \
        | string replace -a ' ' '' \
        | sort \
        | uniq \
        | xargs -P 0 -L 1 -I'{}' semver -r '{}' $nvm_versions \
        | sort \
        | uniq -c \
        | string trim \
        | sort -h \
        | tail -n 1 \
        | awk '{print $2}')

    if test -z "$target_version"
        return 0
    end

    if test "v$target_version" = (nvm version)
        return 0
    end

    nvm use $target_version
end
