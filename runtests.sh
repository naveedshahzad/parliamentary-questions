#!/bin/bash
set -ex
# Script executing all the test tasks.
bundle exec rake db:migrate
npm install phantomjs
export PATH=$PATH:/usr/src/app/node_modules/phantomjs/lib/phantom/bin
bundle exec rspec spec
bundle exec rspec features