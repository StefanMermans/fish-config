function comp --wraps=composer --description 'alias comp composer'
  if is-herd-project
    php (which composer) $argv
  else
    command composer $argv
  end
end
