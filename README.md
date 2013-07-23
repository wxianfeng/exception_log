exception_log
=============

send rails exception to email and give web ui to watch exception, and it's live stream

## Requirements
  
  Tested success by ruby 1.9.x + rails 3.2.x

## config

  Gemfile

    gem 'exception_log', '0.2.0', require: 'exception_log'
  
  config/environments/production.rb 

    config.middleware.use ExceptionLog::Middleware, :from => 'noreply@xx.com', :to => ['foo@xx.com','bar@xx.com']

  options:

    :log_path 500 error write to file path, default is Rails.root/log/exception.log

  config/exception_log.yml

    host: "192.168.9.35"
    log: "/data/projects/entos/log/exception.log"

## start node server

    rake exception_log:start_node_server

That's ALL, open `http://localhost:1337` to watch live stream log.
  
