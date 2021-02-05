#!/usr/bin/env bash

set -o pipefail
set -o errexit

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
