#!/bin/bash
trap "echo 'Exited!'; exit 0" SIGINT SIGTERM

while true; do
    inotifywait -r -e modify,create,delete /absolute/path/to/lib/PokemonShowdown-Reborn/logs/
    echo "Change detected. Regenerating..."
    python3 generate_replays.py
    python3 generate_csv.py
done