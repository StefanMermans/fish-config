#!/usr/bin/env fish

# Generate uuid
set -l uuid $(uuidgen)
echo "$uuid"

# initial with self generated UUID
claude -p \
    --session-id $uuid \
    --verbose \
    --include-partial-messages \
    --output-format=stream-json \
    "<prompt>" \
    --allowedTools "Read,Edit,Write,Bash"

# Resume with same uuid
claude -p \
    --resume $uuid \
    --verbose \
    --include-partial-messages \
    --output-format=stream-json \
    "<prompt>" \
    --allowedTools "Read,Edit,Write,Bash"
