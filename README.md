exception_log
=============

send rails exception to email and give web ui to watch exception, and it's live stream

## Requirements
  
  Tested success by ruby 1.9.x + rails 3.2.x

## config

  Gemfile

    gem 'exception_log', '0.1.0', require: 'exception_log'
  
  config/environments/production.rb 

    config.middleware.use ExceptionLog::Middleware, :from => 'noreply@entfield.com', :to => ['foo@xx.com','bar@xx.com']
  
