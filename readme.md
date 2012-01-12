tipster
========

Tipster assesses the risk of a git commit by running various heuristics against what has changed.

How to use tipster
-------------------

Getting started with tipster in 3 easy steps:

1. Install ruby gem

    gem install tipster

2. Create ruby file

    require 'tipster'
    Tipster.new('/path/to/repository').html_report

3. Run!

    ruby tipster.rb

Copyright
---------

Copyright (c) 2012 [Robert Greiner](http://creatingcode.com/quality).

See LICENSE for details.