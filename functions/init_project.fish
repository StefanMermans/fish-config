function init_project
    echo "Initializing project dependencies..."

    if test -f package.json
        begin
            mkdir -p node_modules
            npm install > node_modules/install.log 2>&1
            echo "🌳 Node ready"
        end &
    end

    if test -f composer.json
        begin
            mkdir -p vendor
            composer install > vendor/install.log 2>&1
            echo "🐘 Composer ready"
        end &
    end

    wait

    if contains -- "-p" $argv
        echo "Opening phpstorm"
        phpstorm .
    end
end

complete -c init_project -s p -d "Open PHPStorm post-install"
