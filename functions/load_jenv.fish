function load_jenv 
    if command -v jenv > /dev/null
        jenv init - | source
    end
end
