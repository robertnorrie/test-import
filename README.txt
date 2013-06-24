OVERVIEW

This series of patches allows for incremental upgrades between releases of drupal and various drupal distributtions. The patches modify only the files affected by the upgrade, leaving all other files untouched.

USAGE:

Patches are labeled in two ways: version_to_version, and single version.  Single versions are incremental patches from the version which precedes to the version in the title (i.e., 6.11 is 6.10 to 6.11). These patches MUST be applied incrementally, you cannot jump version numbers.  So, 6.10 to 6.11 is fine, 6.10 to 6.22 is NOT FINE.  Be sure to apply the patch which corresponds to your distribution of drupal.

Version_to_version patches are just that, and include all the versions in-between.  This can mean a variety of bug-fixes and new features to work through in testing, but is much faster than the incremental patches.

In addition, there are patch files for Pressflow, Drupal to Pressflow, and a small collection of patches for distributions such as OpenAtrium.  Others of these may be added.

Patches must be run either:

1. From drupal docroot using the 'patch' command: patch -p1 < /path/to/patches/drupal/version.patch.  This method works whether the docroot is a 'gitted' or not.
2. From a git-initialized drupal docroot, run something like this: 'git apply -v --ignore-whitespace /path/to/patches/drupal/version.patch'.  I often add '--reject' which will apply the patch even if there are problems, and create .rej files for hand patching.

In both cases: Check for .rej and .orig files where patch may have failed.  Manually fix the working version and delete these extra files.

REPORTED VERSION CONFLICTS

Since the patches do not change anything other than the code modified by the update, there is some text which will not be removed by the patches.  In particular, drupal docroots which were originally 'packed' by the drupal packing script include version number information in the core module .info files.  Git versions of drupal do not include this version information.  These patches are based off of git releases, and so do not necessarily modify the .info files.  As a result, drush and the update module will MISREPORT version numbers.

The packing script version information is not required to ascertain the correct version number of the drupal install, which is also in the system.module.  Scripts exist to simply remove this information.  This can be done by running 'rmv-versionnums-dpl.sh'.  Use as you see fit.

ACQUIA DRUPAL/PROFILE CONFLICTS
Updating an entire profile, whether Acquia Drupal, OpenPublish, etc., often means updating all included modules as well.  This can be a problem with applying unnecessary module updates.  As a result, we often recommend moving away from the profile.  This usually means simply updating modules by placing them in the sites/all/modules directory, which is prioritized over any modules in profiles/profile/modules.  However, Acquia Drupal has a file that indicates whether it is an AD site, and this file must be edited in order to prevent core version reporting conflicts.

You may run: acquiadrupal-false.sh
or
Manually modify: profiles/acquia/modules/acquia_connector/acquia_agent/acquia_agent_drupal_version.inc.
Change: define('IS_ACQUIA_DRUPAL', TRUE); to FALSE.

