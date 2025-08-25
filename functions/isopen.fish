function isopen --description "Check if an app is running"
    if test (count $argv) -eq 0
        echo "Usage: isopen <app_name>"
        return 1
    end
    
    set app_name $argv[1]
    
    if pgrep -f "$app_name" > /dev/null
        return 0
    else
        return 1
    end
end