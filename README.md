What is it?
===========

A puppet module that installs and configures Kibana3.  Kibana3 runs entirely
in the browser so no dependencies are required other than a web server to
host the files.

A build script is provided that uses [FPM](https://github.com/jordansissel/fpm) to generate an RPM package from
the lastest commits on GitHub.


Usage:
------

Generic install:
<pre>
  class { 'kibana': }
</pre>
This will use the default kibana setup which includes setting the elasticsearch
host to match the URL requested for Kibana.  Use this setting if you are
running kibana on an elasticsearch node and port 9200 is open.


Known Issues:
-------------
Only tested on CentOS 6


License:
--------

Released under the Apache 2.0 licence


Contribute:
-----------
* Fork it
* Create a topic branch
* Improve/fix (with spec tests)
* Push new topic branch
* Submit a PR
