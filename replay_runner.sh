#!/bin/bash
cd /absolute/path/to/script/dir || exit 1
trap "echo 'Exited!'; exit 0" SIGINT SIGTERM

while true; do
    inotifywait -r -e modify,create,delete /absolute/path/to/lib/PokemonShowdown-Reborn/logs/
    echo "Change detected. Regenerating..."
    python generate_replays.py
    python generate_csv.py
done