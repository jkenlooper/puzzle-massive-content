#!/usr/bin/env bash

set -o pipefail
set -o errexit
set -o nounset

function usage {
  cat <<USAGE
Usage: ${0} [-h] [<path-to-puzzle-massive-dir>]

Options:
  -h            Show help

Removes symbolic links in the puzzle-massive project that target the files in
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
PATH_TO_PM_PROJECT=$1

# /path/to/puzzle-massive-content
PMC=$PWD

(
target_dir=${PATH_TO_PM_PROJECT}chill-data
if [ -d "$target_dir" ]; then
  cd "$target_dir";
  echo "
  Removing symbolic links in $PWD"
  for f in ${PMC}/chill-data/*.yaml; do
    linked_file=$(basename $f)
    if [ -L $linked_file ]; then
      rm --verbose "${linked_file}"
    fi
  done
else
  echo "Not a directory: $target_dir";
fi
)

(
target_dir=${PATH_TO_PM_PROJECT}documents/other
if [ -d "$target_dir" ]; then
  cd "$target_dir";
  echo "
  Removing symbolic links in $PWD"
  for f in ${PMC}/documents/*; do
    linked_file=$(basename $f)
    if [ -L $linked_file ]; then
      rm --verbose "${linked_file}"
    fi
  done
else
  echo "Not a directory: $target_dir";
fi
)

(
target_dir=${PATH_TO_PM_PROJECT}queries/other
if [ -d "$target_dir" ]; then
  cd "$target_dir";
  echo "
  Removing symbolic links in $PWD"
  for f in ${PMC}/queries/*.sql; do
    linked_file=$(basename $f)
    if [ -L $linked_file ]; then
      rm --verbose "${linked_file}"
    fi
  done
else
  echo "Not a directory: $target_dir";
fi
)

(
target_dir=${PATH_TO_PM_PROJECT}templates/other
if [ -d "$target_dir" ]; then
  cd "$target_dir";
  echo "
  Removing symbolic links in $PWD"
  for f in ${PMC}/templates/*; do
    linked_file=$(basename $f)
    if [ -L $linked_file ]; then
      rm --verbose "${linked_file}"
    fi
  done
else
  echo "Not a directory: $target_dir";
fi
)

(
target_dir=${PATH_TO_PM_PROJECT}source-media/bit-icons
if [ -d "$target_dir" ]; then
  cd "$target_dir";
  echo "
  Removing symbolic links in $PWD"
  for f in ${PMC}/bit-icons/*; do
    linked_file=$(basename $f)
    if [ -L $linked_file ]; then
      rm --verbose "${linked_file}"
    fi
  done
else
  echo "Not a directory: $target_dir";
fi
)
