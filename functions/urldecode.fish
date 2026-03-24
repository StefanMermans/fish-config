# --------------------------------------------------------------------------
# This file is originally made by Mechazawa
# https://github.com/Mechazawa
# --------------------------------------------------------------------------
function urldecode -d "URL-decode stdin"
    python3 -c "import sys, urllib.parse; print(urllib.parse.unquote(sys.stdin.read().strip()))"
end
