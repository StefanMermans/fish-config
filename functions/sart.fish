function sart --wraps='docker exec -t sa-api_php php artisan' --description 'alias sart docker exec -t sa-api_php php artisan'
  docker exec -t sa-api_php php artisan $argv
        
end
