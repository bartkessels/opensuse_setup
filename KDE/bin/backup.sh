#!/bin/bash

DEFAULT="$HOME/bk-cloud"

DESTINATION="/run/media/$USER/USB Bart"

FOLDERS=( "$DEFAULT/Afbeeldingen" "$DEFAULT/Backups" "$DEFAULT/Boeken" "$DEFAULT/Documenten" "$DEFAULT/ISOs" "$DEFAULT/Muziek/Eigen" "$DEFAULT/Notities" "$DEFAULT/School" "$DEFAULT/Software" "$DEFAULT/Tabs" "$DEFAULT/Videos/MARTIN"  "$DEFAULT/Videos/Spatje" "$DEFAULT/Werk" )

mailbackup

for folder in "${FOLDERS[@]}"; do
	rsync -r -t -v --progress -u -s "$folder" "$DESTINATION"
done
