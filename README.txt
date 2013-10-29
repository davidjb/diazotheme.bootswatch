Introduction
============


To apply any of these themes, in site setup:
  - Install "Diazo theme support" under Add-on
  - Select "Sunburst Theme" as Default themes under Themes

    To apply the ..., in site setup:
    - Enable "... (...)" under Diazo themes

Upgrading
=========

To upgrade the contained themes to the latest version, use the
``upgrade.sh`` script in this directory::

   ./upgrade.sh 2.3.2

where the first argument is the version to upgrade to.  This script
will download the relevant archive, unpack it, and replace the stored
CSS files.

After this, add a change note, and use git to commit and push the updates.

Please note the upgrade script will not create any new themes that
might have been added on Bootswatch. Similarly, any themes that may happen
to have been removed will not be updated. 
