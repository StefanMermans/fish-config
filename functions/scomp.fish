function scomp --wraps='docker exec -ti php composer' --description 'alias scomp docker exec -ti php composer'
  docker exec -ti sa-api_php composer $argv
end
