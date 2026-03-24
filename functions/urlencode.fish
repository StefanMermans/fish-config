# --------------------------------------------------------------------------
# This file is originally made by Mechazawa
# https://github.com/Mechazawa
# --------------------------------------------------------------------------
function urlencode -d "URL-encode stdin"
    python3 -c "import sys, urllib.parse; print(urllib.parse.quote(sys.stdin.read().strip()))"
end
