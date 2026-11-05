#!/bin/sh

## Arch Linux User Cache Cleanup Script
# This script deletes files from the $XDG_CACHE_HOME, or $HOME/.cache if
# the variable is not set

echo "╭──────────────────────────────╮"
echo "│                              │"
echo "│     Cleaning user cache!     │"
echo "│                              │"
echo "╰──────────────────────────────╯"

# stop script if an error is thrown or a variable isn't set
set -eu

# Define cache directory
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"

# Check if the cache directory is existing
if [ ! -d "$CACHE_DIR" ]; then
  echo "ERROR: Cache directory does not exist: $CACHE_DIR"
  exit 0
fi

echo "User cache directory:"
echo "$CACHE_DIR" 
echo 

# variable for total freed space
TOTAL_FREED=0

# bytes_to_human()
#
# Convert bytes to human readable form
# if there are less than 1024 Bytes -> B
# if there are less than 1024^2 Bytes -> KiB
# if there are less than 1024^3 Bytes -> MiB
# if there are less than 1024^4 Bytes -> GiB
# if there are less than 1024^5 Bytes -> TiB
bytes_to_human() {
  BYTES=$1
  if [ "$BYTES" -lt 1024 ]; then
    echo "${BYTES} B"
  elif [ "$BYTES" -lt $((1024 * 1024)) ]; then
    echo "$((BYTES/1024)) KiB"
  elif [ "$BYTES" -lt $((1024 * 1024 * 1024)) ]; then
    echo "$((BYTES/1024 * 1024)) MiB"
  elif [ "$BYTES" -lt $((1024 * 1024 *1024 *1024)) ]; then
    echo "$((BYTES/1024 * 1024 * 1024)) GiB"
  elif [ "$BYTES" -lt $((1024 *1024 * 1024 *1024 *1024)) ]; then
    echo "$((BYTES/1024 * 1024 * 1024 * 1024)) TiB"
  fi
}

# ask_and_remove()
# 
# Asks the user, if a certain directory in the cache directory should be
# deleted and do so afterwards
#
# paramenters: 
# $1 -> Name of directory in user cache
#
# - check if directory exists
# - asks for permission to delete the directory
# - deletes only if "yes", "Yes", "y" or "Y" is pressed
ask_and_remove() {
  # get the directory name and construct it's path
  DIR_NAME=$1
  TARGET="$CACHE_DIR/$DIR_NAME"

  # check if the directory exists
  if [ ! -d "$TARGET" ]; then
    return
  fi
  
  # determine size in bytes
  # du -sb              -> get size of directory
  #                     (including all subdirectories -s) in bytes (-b)
  # 2>/dev/null         -> Errors are sent to NULL
  # | awk '{print $1}'  -> print first collumn
  SIZE_BYTES=$(du -sb "$TARGET" 2>/dev/null | awk '{print $1}'
  echo "Found cache directory: $TARGET"
  echo "Size: $(bytes_to_human $SIZE_BYTES)"

  # ask user for permission to delete directory
  printf "Should this cache be deleted? [y/n] [Y/N] [yes/no] [Yes/No]"
  read answer
  
  # check answer -> delete or skipp deletion
  case "$answer" in
    y|Y|yes|Yes)
      echo "Delete: $TARGET"
      rm -rf -- "$TARGET" &
      echo "Deleted $TARGET"
      progress -mp $!
      # add to total freed
      TOTAL_FREED=$((TOTAL_FREED + SIZE_BYTES))
      ;;
    *)
      echo "Skipped cache in $TARGET"
      ;;
  esac
  
  # create empty line
  echo
}

# List of cache directories to be deleted
CACHES="BraveSoftware mozilla mesa_shader_cache mesa_shader_cache_db\
        thumbnails pip pipx paru yay go-build node-gyp ImageMagick\
        matplotlib mpv yt-dlp torch"
for cache in $CACHES; do
  ask_and_remove "$cache"
done

# Delete temporary files
printf "Delete temporary *.tmp files in cache? [y/n] [Y/N] [yes/no] [Yes/No]"
read answer

case "$answer" in
  y|Y|yes|Yes)
    echo "Search for temporary files and delete them..."
    find "$CACHE_DIR" -type f -name '*.tmp' -exec rm -f {};
    ;;
  *)
    echo "Temporary files were not deleted!"
    ;;
esac

echo
echo "Cleanup of cache successful!"
