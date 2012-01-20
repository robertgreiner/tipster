tipster
========

Tipster assesses the risk of a git commit by running various heuristics against what has changed.

Using tipster
-------------------

Getting started with tipster in 3 easy steps:

### Install ruby gem

    gem install tipster

### Create ruby file

The default repository path is the local directory tipster is run in.  The default commit ID is HEAD.

    require 'tipster'
    Tipster.new(['/path/to/repository']).html_report ['commit_id']

### Run!

    ruby tipster.rb

Copyright
---------

Copyright (c) 2012 [Robert Greiner](http://creatingcode.com/quality).

See LICENSE for details.