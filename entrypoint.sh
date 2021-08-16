#!/bin/bash
rake db:reset
rake db:migrate
rails assets:precompile
bundle exec unicorn -c config/unicorn.rb