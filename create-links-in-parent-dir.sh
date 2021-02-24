#!/usr/bin/env bash

set -o pipefail
set -o errexit
set -x

function usage {
  cat <<USAGE
Usage: ${0} [-h]

Options:
  -h            Show help

Creates symbolic links in the puzzle-massive project that target the files in
this repo. This repo should be a git submodule in the puzzle-massive repo.

USAGE
  exit 0;
}
while getopts ":h" opt; do
  case ${opt} in
    h )
      usage;
      ;;
    \? )
      usage;
      ;;
  esac;
done;
shift "$((OPTIND-1))";


# This repo should be a git submodule in the puzzle-massive repo.
PATH_TO_PM_PROJECT=../

# puzzle-massive-content
PMC=$(basename $PWD)

# Create text bit icons
./create-text-bit-icons-from-list.sh emoji_list/activities.txt emoji_activities
./create-text-bit-icons-from-list.sh emoji_list/animals_nature.txt emoji_animals_nature
./create-text-bit-icons-from-list.sh emoji_list/flags.txt emoji_flags
./create-text-bit-icons-from-list.sh emoji_list/food_drink.txt emoji_food_drink
./create-text-bit-icons-from-list.sh emoji_list/objects.txt emoji_objects
./create-text-bit-icons-from-list.sh emoji_list/people_body.txt emoji_people_body
./create-text-bit-icons-from-list.sh emoji_list/sky_weather.txt emoji_sky_weather
./create-text-bit-icons-from-list.sh emoji_list/smileys_emotion.txt emoji_smileys_emotion
./create-text-bit-icons-from-list.sh emoji_list/symbols.txt emoji_symbols
./create-text-bit-icons-from-list.sh emoji_list/time.txt emoji_time
./create-text-bit-icons-from-list.sh emoji_list/travel_places.txt emoji_travel_places
./create-text-bit-icons-from-list.sh text-list.txt text

(
cd ${PATH_TO_PM_PROJECT}chill-data;
echo "
Creating symbolic links in $PWD"
for f in ../${PMC}/chill-data/*.yaml; do
  ln --symbolic --force --verbose $f
done
)

(
cd ${PATH_TO_PM_PROJECT}documents/other;
echo "
Creating symbolic links in $PWD"
for f in ../../${PMC}/documents/*; do
  ln --symbolic --force --verbose $f
done
)

(
cd ${PATH_TO_PM_PROJECT}queries/other;
echo "
Creating symbolic links in $PWD"
for f in ../../${PMC}/queries/*.sql; do
  ln --symbolic --force --verbose $f
done
)

(
cd ${PATH_TO_PM_PROJECT}templates/other;
echo "
Creating symbolic links in $PWD"
for f in ../../${PMC}/templates/*; do
  ln --symbolic --force --verbose $f
done
)

(
cd ${PATH_TO_PM_PROJECT}source-media/bit-icons;
echo "
Creating symbolic links in $PWD"
for f in ../../${PMC}/bit-icons/*; do
  ln --symbolic --force --verbose $f
done
)
