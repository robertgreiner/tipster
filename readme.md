tipster
========

Tipster assesses the risk of a git commit by running various heuristics against what has changed.

How to use tipster
-------------------

Getting started with tipster in 3 easy steps:

## Install ruby gem

    gem install tipster

## Create ruby file

    require 'tipster'
    Tipster.new('/path/to/repository').html_report

## Run!

    ruby tipster.rb

Copyright
---------

Copyright (c) 2012 [Robert Greiner](http://creatingcode.com/quality).

See LICENSE for details.