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

Notes
=====

* Because of the way that Bootswatch themes operate with icons (relative 
  URLs, expecting icons to live next to the CSS), the relative
  paths have been modified accordingly.  By default, they look like this::

      ../img/glyphicons-halflings.png

  which refers to "the ``img`` folder next to my parent folder". 
  For a resource like ``++theme++spacelab/css/bootstrap.min.css`` this ends
  up attempting to resolve to
  ``++theme++spacelab/img/glyphicons-halflings.png``. In Plone,
  because the Bootstrap ``img`` folder is kept separate under a different
  theme resource path, this relative URL fails.

  At present, a solution has been to adjust these relative URLs inside
  each theme to look like::

      ../../++theme++bootstrap-framework/img/glyphicons-halflings.png

  This works for the test cases (standard install; virtual hosted; both
  development and production modes), but is somewhat brittle in the fact the
  same directory structure must be maintained for this theme, and for the
  Bootstrap resources.

  The ``upgrade.sh`` script performs this adjustment accordingly.
  
  A more bullet-proof solution is welcomed, if possible.  Note that using
  an absolute path (being a ``/`` at the start of the path) is not workable
  since Plone sites can be virtual hosted on different paths.
  
