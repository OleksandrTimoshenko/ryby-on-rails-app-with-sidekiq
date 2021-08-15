#!/bin/bash
rake db:reset
rake db:migrate
bundle exec unicorn -c config/unicorn.rb