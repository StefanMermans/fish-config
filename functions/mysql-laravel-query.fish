function mysql-laravel-query
    begin
        set -l ENV_FILE .env
        set -l DB_HOST (grep -E '^DB_HOST=' $ENV_FILE | sed -E 's/^DB_HOST=//; s/^"//; s/"$//')
        set -l DB_PORT (grep -E '^DB_PORT=' $ENV_FILE | sed -E 's/^DB_PORT=//; s/^"//; s/"$//')
        set -l DB_DATABASE (grep -E '^DB_DATABASE=' $ENV_FILE | sed -E 's/^DB_DATABASE=//; s/^"//; s/"$//')
        set -l DB_USERNAME (grep -E '^DB_USERNAME=' $ENV_FILE | sed -E 's/^DB_USERNAME=//; s/^"//; s/"$//')
        set -l DB_PASSWORD (grep -E '^DB_PASSWORD=' $ENV_FILE | sed -E 's/^DB_PASSWORD=//; s/^"//; s/"$//')
        mysql --batch --raw -h $DB_HOST -P $DB_PORT -u $DB_USERNAME -p$DB_PASSWORD -D $DB_DATABASE --default-character-set=utf8mb4 -e $argv
    end 2>&1 | grep -v 'Using a password on the command line interface can be insecure.'
end
