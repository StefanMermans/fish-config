# --------------------------------------------------------------------------
# This file is originally made by Mechazawa
# https://github.com/Mechazawa
# --------------------------------------------------------------------------
function myip -d "Show your public IP address"
    curl -s http://ipecho.net/plain
    echo
end
