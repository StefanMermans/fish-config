function php --wraps='php' --description 'alias php php'
    if is-herd-project
        herd php $argv
    else
        command php $argv
    end
end
