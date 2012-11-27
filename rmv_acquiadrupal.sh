#Script removes drupal packing script info from core module and theme info files. 
# run on older version of drupal, BEFORE applying patches.  
# This does not remove Acquia Drupal packing information.
#
# must: chmod +x ~/rmv_acquiadrupal.sh (makes executable)
#
# - @mariagwyn
sed -i '' '/IS_ACQUIA_DRUPAL/s/TRUE/FALSE/g' profiles/acquia/modules/acquia_connector/acquia_agent/acquia_agent_drupal_version.inc

echo "IS_ACQUIA_DRUPAL is now set to FALSE"