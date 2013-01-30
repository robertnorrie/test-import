#!/bin/bash
#
# Script removes drupal packing script info from core module and theme info files.
# run on older version of drupal, BEFORE applying patches.
# This does not remove Acquia Drupal packing information.
#
# must: chmod +x ~/rmv_dpl-version_nums.sh (makes executable)
#
# - @mariagwyn with the help of greggles; significantly cleaned up by eliza411.
#

# Specifies filetype to modify
FILETYPE='*.info'

# Matches recursively only in the specfied directories
 INCLUDEONLY='modules themes profiles'
 files=( $(find $INCLUDEONLY -name "$FILETYPE") )

# Deletes these four lines and print the path and file name for each file
for file in "${files[@]}"; do
  sed -i '' '/; Information added by drupal.org packaging script on [0-9]*-[0-9]*-[0-9]*/d' $file
  sed -i '' '/version = "[0-9]*.[0-9]*"/d' $file
  sed -i '' '/project = "drupal"/d' $file
  sed -i '' '/datestamp = "[0-9]*"/d' $file
  echo 'Checking' $file
done
  echo 'Checked' ${#files[@]} 'files and removed drupal.org packaging data'
