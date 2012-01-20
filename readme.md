tipster
========

Tipster assesses the risk of a git commit by running various heuristics against what has changed.

Using tipster
-------------------

Getting started with tipster in 3 easy steps:

### Install ruby gem

    gem install tipster

### Create ruby file

`number_of_commits` will tell tipster to build an HTML report for the current `commit_id` and the previous x commits.

    require 'tipster'
    Tipster.new(['/path/to/repository' = "."]).html_report(['commit_id' = HEAD], [number_of_commits = 1])

### Run!

    ruby tipster.rb

Copyright
---------

Copyright (c) 2012 [Robert Greiner](http://creatingcode.com/quality).

See LICENSE for details.